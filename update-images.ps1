# Script to download images from absolute URLs in blog posts and update references
# Images will be named as img/yyyy-MM-dd-index.extension

$ErrorActionPreference = "Continue"
$postsDir = Join-Path $PSScriptRoot "_posts"
$imgDir = Join-Path $PSScriptRoot "img"

# Create img directory if it doesn't exist
if (-not (Test-Path $imgDir)) {
    New-Item -ItemType Directory -Path $imgDir -Force | Out-Null
}

# Function to extract date from post filename
function Get-PostDate {
    param([string]$filename)
    if ($filename -match '^(\d{4}-\d{2}-\d{2})') {
        return $matches[1]
    }
    return $null
}

# Function to download image and return local path
function Download-Image {
    param(
        [string]$url,
        [string]$date,
        [int]$index
    )
    
    try {
        # Get file extension from URL or default to .png
        $extension = ".png"
        if ($url -match '\.(jpg|jpeg|gif|png|bmp|svg|webp)(\?|$)') {
            $extension = ".$($matches[1])"
        }
        
        $filename = "$date-$index$extension"
        $localPath = Join-Path $imgDir $filename
        
        # Skip if already downloaded
        if (Test-Path $localPath) {
            Write-Host "  Already exists: $filename" -ForegroundColor Yellow
            return "/img/$filename"
        }
        
        Write-Host "  Downloading: $url" -ForegroundColor Cyan
        Write-Host "  -> $filename" -ForegroundColor Green
        
        # Try to download the image
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
        
        $downloadSucceeded = $false
        try {
            $webClient.DownloadFile($url, $localPath)
            $downloadSucceeded = $true
        }
        catch {
            # If 404 or unknown host, try archive.org fallback
            if ($_.Exception.Message -match '404|No such host is known') {
                $errorType = if ($_.Exception.Message -match '404') { "404" } else { "Unknown host" }
                Write-Host "  $errorType - Trying archive.org fallback..." -ForegroundColor Yellow
                
                # Try archive.org cached version with exponential backoff
                # If URL already has archive.org, extract the original URL first
                $originalUrl = $url
                if ($url -match 'web\.archive\.org/web/\d+im?_?/(.+)') {
                    $originalUrl = $matches[1]
                    Write-Host "  Extracted original URL: $originalUrl" -ForegroundColor Cyan
                }
                
                $archiveUrl = "https://web.archive.org/web/2/$originalUrl"
                Write-Host "  Archive URL: $archiveUrl" -ForegroundColor Cyan
                
                # Retry with exponential backoff (indefinite for connection refusals)
                $retryDelay = 1
                $maxDelay = 60  # Cap delay at 60 seconds
                $attemptNumber = 0
                
                while ($true) {
                    $attemptNumber++
                    try {
                        if ($attemptNumber -gt 1) {
                            Write-Host "  Retry attempt $attemptNumber after $retryDelay seconds..." -ForegroundColor Yellow
                            Start-Sleep -Seconds $retryDelay
                            # Exponential backoff with cap
                            $retryDelay = [Math]::Min($retryDelay * 2, $maxDelay)
                        }
                        
                        $htmlContent = $webClient.DownloadString($archiveUrl)
                        
                        # Parse HTML to find iframe with id="playback"
                        $iframePattern = '<iframe[^>]+id=["' + "'" + ']playback["' + "'" + '][^>]+src=["' + "'" + ']([^"' + "'" + ']+)["' + "'" + ']'
                        if ($htmlContent -match $iframePattern) {
                            $actualImageUrl = $matches[1]
                            Write-Host "  Found in playback iframe: $actualImageUrl" -ForegroundColor Green
                            
                            # Download from the actual image URL
                            $webClient.DownloadFile($actualImageUrl, $localPath)
                            $downloadSucceeded = $true
                            break
                        }
                        else {
                            Write-Host "  Could not find playback iframe in archive.org response" -ForegroundColor Red
                            break
                        }
                    }
                    catch {
                        if ($_.Exception.Message -match 'actively refused|timed out|connection.*failed') {
                            Write-Host "  Connection issue with archive.org (attempt $attemptNumber): $($_.Exception.Message)" -ForegroundColor Red
                            # Continue retrying indefinitely for connection issues
                        }
                        else {
                            Write-Host "  Archive.org fallback failed: $_" -ForegroundColor Red
                            break
                        }
                    }
                }
            }
            else {
                throw
            }
        }
        finally {
            $webClient.Dispose()
        }
        
        if ($downloadSucceeded) {
            return "/img/$filename"
        }
        else {
            return $null
        }
    }
    catch {
        Write-Host "  ERROR downloading $url : $_" -ForegroundColor Red
        return $null
    }
}

# Function to process a post file
function Process-Post {
    param([string]$postPath)
    
    $filename = Split-Path $postPath -Leaf
    $date = Get-PostDate $filename
    
    if (-not $date) {
        Write-Host "Skipping $filename - no date found" -ForegroundColor Yellow
        return
    }
    
    Write-Host "`nProcessing: $filename" -ForegroundColor White
    
    $content = Get-Content $postPath -Raw -Encoding UTF8
    $originalContent = $content
    $imageIndex = 1
    $urlsProcessed = @{}
    
    # Find all markdown image references: ![alt](url)
    $markdownPattern = '!\[([^\]]*)\]\(([^)]+)\)'
    $matches = [regex]::Matches($content, $markdownPattern)
    
    foreach ($match in $matches) {
        $fullMatch = $match.Value
        $alt = $match.Groups[1].Value
        $url = $match.Groups[2].Value.Trim()
        
        # Check if it's an absolute URL
        if ($url -match '^https?://') {
            # Skip if already processed this URL in this file
            if ($urlsProcessed.ContainsKey($url)) {
                $newPath = $urlsProcessed[$url]
            }
            else {
                $newPath = Download-Image -url $url -date $date -index $imageIndex
                if ($newPath) {
                    $urlsProcessed[$url] = $newPath
                    $imageIndex++
                }
            }
            
            if ($newPath) {
                $newMatch = "![$alt]($newPath)"
                $content = $content.Replace($fullMatch, $newMatch)
            }
        }
    }
    
    # Find all HTML img tags: <img src="url" ... >
    $htmlPattern = '<img[^>]+src=["' + "'" + ']([^"' + "'" + ']+)["' + "'" + '][^>]*>'
    $matches = [regex]::Matches($content, $htmlPattern)
    
    foreach ($match in $matches) {
        $fullMatch = $match.Value
        $url = $match.Groups[1].Value.Trim()
        
        # Check if it's an absolute URL
        if ($url -match '^https?://') {
            # Skip if already processed this URL in this file
            if ($urlsProcessed.ContainsKey($url)) {
                $newPath = $urlsProcessed[$url]
            }
            else {
                $newPath = Download-Image -url $url -date $date -index $imageIndex
                if ($newPath) {
                    $urlsProcessed[$url] = $newPath
                    $imageIndex++
                }
            }
            
            if ($newPath) {
                $newMatch = $fullMatch -replace [regex]::Escape($url), $newPath
                $content = $content.Replace($fullMatch, $newMatch)
            }
        }
    }
    
    # Find markdown link images: [![alt](image-url)](link-url)
    $linkedImagePattern = '\[!\[([^\]]*)\]\(([^)]+)\)\]\(([^)]+)\)'
    $matches = [regex]::Matches($content, $linkedImagePattern)
    
    foreach ($match in $matches) {
        $fullMatch = $match.Value
        $alt = $match.Groups[1].Value
        $imageUrl = $match.Groups[2].Value.Trim()
        $linkUrl = $match.Groups[3].Value.Trim()
        
        # Process image URL if absolute
        $newImageUrl = $imageUrl
        if ($imageUrl -match '^https?://') {
            if ($urlsProcessed.ContainsKey($imageUrl)) {
                $newImageUrl = $urlsProcessed[$imageUrl]
            }
            else {
                $newPath = Download-Image -url $imageUrl -date $date -index $imageIndex
                if ($newPath) {
                    $urlsProcessed[$imageUrl] = $newPath
                    $newImageUrl = $newPath
                    $imageIndex++
                }
            }
        }
        
        # Process link URL if absolute
        $newLinkUrl = $linkUrl
        if ($linkUrl -match '^https?://' -and $linkUrl -match '\.(jpg|jpeg|gif|png|bmp|svg|webp)(\?|$)') {
            if ($urlsProcessed.ContainsKey($linkUrl)) {
                $newLinkUrl = $urlsProcessed[$linkUrl]
            }
            else {
                $newPath = Download-Image -url $linkUrl -date $date -index $imageIndex
                if ($newPath) {
                    $urlsProcessed[$linkUrl] = $newPath
                    $newLinkUrl = $newPath
                    $imageIndex++
                }
            }
        }
        
        if ($newImageUrl -ne $imageUrl -or $newLinkUrl -ne $linkUrl) {
            $newMatch = "[![$alt]($newImageUrl)]($newLinkUrl)"
            $content = $content.Replace($fullMatch, $newMatch)
        }
    }
    
    # Save if content changed
    if ($content -ne $originalContent) {
        Set-Content -Path $postPath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "  Updated post with $($urlsProcessed.Count) image(s)" -ForegroundColor Green
    }
    else {
        Write-Host "  No changes needed" -ForegroundColor Gray
    }
}

# Main execution
Write-Host "Starting image processing..." -ForegroundColor Cyan
Write-Host "Posts directory: $postsDir" -ForegroundColor Cyan
Write-Host "Images directory: $imgDir" -ForegroundColor Cyan

$posts = Get-ChildItem -Path $postsDir -Filter "*.md" | Sort-Object Name

Write-Host "`nFound $($posts.Count) posts to process`n" -ForegroundColor White

foreach ($post in $posts) {
    Process-Post -postPath $post.FullName
}

Write-Host "`n`nProcessing complete!" -ForegroundColor Green
Write-Host "Check the img/ folder for downloaded images." -ForegroundColor Green
