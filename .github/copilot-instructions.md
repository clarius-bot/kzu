# GitHub Copilot Instructions for kzu's Blog

This is a Jekyll-powered blog hosted on GitHub Pages at https://blogs.clarius.org. 
The blog belongs to Daniel Cazzulino (alias: kzu), covering .NET, C#, Visual Studio, and technology topics.

## Project Structure

```
├── _config.yml          # Jekyll configuration (theme, plugins, site settings)
├── _includes/           # Reusable HTML snippets included in pages
│   ├── favicon.html     # Favicon link tag
│   ├── license.html     # Footer license text (CC for content, MIT for code)
│   └── signature.html   # Post signature "/kzu dev↻d" shown after posts
├── _posts/              # Blog posts (368+ posts dating back to 2003)
├── about/               # About page and resume
│   ├── index.md         # About page content
│   └── resume/          # Resume section
├── img/                 # Image assets (currently empty, images hosted externally)
├── index.html           # Homepage with home layout
├── archive.html         # Archive page listing all posts with tag cloud
├── tags.html            # Tags page with tag cloud
├── feed.xml             # RSS feed (last 20 posts)
├── sitemap.xml          # XML sitemap for SEO
├── 404.md               # Custom 404 page with Google search
├── site.css             # Custom CSS overrides (green theme, syntax highlighting)
├── Gemfile              # Ruby dependencies for local development
└── CNAME                # Custom domain configuration (blogs.clarius.org)
```

## Theme & Configuration

### Remote Theme
- Uses `kzu/beautiful-jekyll@main` as remote theme via `jekyll-remote-theme` plugin
- Theme provides layouts: `home`, `page`, `post`, `default`

### Key Configuration (_config.yml)
- **Pagination**: 10 posts per page via `jekyll-paginate`
- **Permalink**: `/:title.html` (clean URLs based on post title)
- **Comments**: Giscus integration (GitHub Discussions-based)
- **Analytics**: Google Analytics via gtag (`G-5THB4CL7H1`)
- **Search**: Google Custom Search (`fab2fac2137f17958`)

### Site Styling
- Custom green color scheme (navbar: black/white, links: `#418C41`, hover: lime)
- Custom syntax highlighting colors in [site.css](site.css)
- Cloud effect with hue-rotate filter for tag clouds

## Blog Posts

### Post Format
Posts live in `_posts/` with naming convention: `YYYY-MM-DD-title-slug.md`

Example front matter:
```yaml
---
layout: post
title: "Post Title"
date: 2003-08-22 00:00:00 +0000
tags: [tag1, tag2]  # Optional
---
```

### Post Defaults (from _config.yml)
All posts automatically include:
- `after-content: signature.html` - Shows "/kzu dev↻d" signature
- `comments: true` - Enables Giscus comments

### All Pages Include
- `head-extra: favicon.html` - Custom favicon
- `footer-extra: license.html` - CC/MIT license notice

## Navigation

Defined in `_config.yml` under `navbar-links`:
- **Home**: `/`
- **Archive**: `/archive/`
- **About Me**: `/about/`

## External Resources

- **Avatar/Branding**: Hosted at `api.kzu.app` (devlooped.svg, badge.png, background.svg)
- **RSS Feed**: Also available via FeedBurner at `https://feeds.feedburner.com/DanielCazzulino`

## Local Development

```bash
# Install dependencies
bundle install

# Run local server (port 3000)
bundle exec jekyll serve
```

The site runs at `http://127.0.0.1:3000` locally.

## Social Links

Configured social profiles (used in theme):
- GitHub: kzu
- Twitter/X: kzu
- LinkedIn: DanielCazzulino
- Stack Overflow: 24684/kzu
- Email: daniel@cazzulino.com

## Creating New Posts

1. Create file in `_posts/` with format `YYYY-MM-DD-slug.md`
2. Add front matter with `layout: post`, `title`, and `date`
3. Optionally add `tags` array for categorization
4. Write content in Markdown

## Key Customizations

- **Tag Cloud**: Uses jqcloud library on archive and tags pages
- **Google Search**: Integrated site search on 404 and archive pages
- **Fridathon**: Featured on homepage - unstructured learning/hacking on Fridays

## Deployment

- Hosted on GitHub Pages (automatic deployment on push to `main`)
- Custom domain: `blogs.clarius.org` (configured via CNAME file)
- Repository: `clarius/kzu`
