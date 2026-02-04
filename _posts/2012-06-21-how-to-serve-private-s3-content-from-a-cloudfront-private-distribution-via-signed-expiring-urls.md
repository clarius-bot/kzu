---
layout: post
title: "Daniel Cazzulino's Blog - How to serve private S3 content from a CloudFront private distribution via signed expiring Urls"
date: 2012-06-21 00:00:00 +0000
---

##  [How to serve private S3 content from a CloudFront private distribution via signed expiring Urls](<http://blogs.clariusconsulting.net/kzu/how-to-serve-private-s3-content-from-a-cloudfront-private-distribution-via-signed-expiring-urls/> "How to serve private S3 content from a CloudFront private distribution via signed expiring Urls")

June 21, 2012 9:08 pm

For this walk-through, you’ll need the most excelent [CloudBerry S3 Explorer](<http://www.cloudberrylab.com/free-amazon-s3-explorer-cloudfront-IAM.aspx>). Somehow, these guys manage to support in the UI more stuff than Amazon itself does in its management console ![Sorpresa](http://blogs.clariusconsulting.net/kzu/files/2012/06/wlEmoticon-surprisedsmile.png). And you only need the free version.

So first the requirements:

  1. You want to have full control of who and for how long accesses the S3 payloads/objects.
  2. You want to automatically leverage Amazon’s CloudFront CDN so that customers get the fastest downloads

So here’s how to go about it:

  1. Create a new bucket in S3 that will serve as the origin for CloudFront. At this point, unless you specify something different, the bucket is private.
  2. In the CloudBerry S3 Explorer, right-click the bucket, and select CloudFront –> New CloudFront Distribution Wizard
     * Choose the kind of delivery for the payloads. In my case, I just picked Download.
     * Pick the S3 bucket as the origin
     * Specify [custom CNAMEs](<http://docs.amazonwebservices.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.html>) for the CloudFront domain if you have any. This is optional.
     * Logging: whatever you like
     * Private Content: this is the key step. Click Enable Private Content Distribution and select your identity from the dropdown. Add yourself as a signer so you can sign the Urls: 

[![image](http://blogs.clariusconsulting.net/kzu/files/2012/06/image_thumb.png)](<http://blogs.clariusconsulting.net/kzu/files/2012/06/image.png>)

Copy down the ID you select in the dropdown. You’ll need it later. 

     * Enable the distribution in the next page
  3. Now your uploaded content needs to automatically allow the “CloudFront Origin Access Identity” to read objects, so that you don’t have to set the ACLs for each object, every time. This is done via a [bucket policy](<http://docs.amazonwebservices.com/AmazonS3/latest/dev/writebucketpolicy.html>). In our case, either via the management console: 

[![image](http://blogs.clariusconsulting.net/kzu/files/2012/06/image_thumb1.png)](<http://blogs.clariusconsulting.net/kzu/files/2012/06/image1.png>)   
(this is the properties panel for a bucket in the AWS S3 console) 

or in S3 Explorer via the right-click on bucket –> Bucket Policy, enter the following policy: 
         
         {
           "Version": "2008-10-17",
           "Statement": [
             {
               "Effect": "Allow",
               "Principal": {
                 "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity YOUR_IDENTITY_ID_FROM_DROPDOWN"
               },
               "Action": "s3:GetObject",
               "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*",
               "Condition": {}
             }
           ]
         }

After you’ve applied the policy and enabled the distribution, you can start signing Urls and sending those to customers.

I’ll show how to sign the Urls in a future post. Stay tunned.

Enjoy! 

/kzu
