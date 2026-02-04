---
layout: post
title: "Daniel Cazzulino's Blog - Do you need another reason to avoid &quot;sp_&quot; prefix?!"
date: 2003-12-18 00:00:00 +0000
---

## Do you need another reason to avoid &quot;sp_&quot; prefix?! 

> Note: Do not preface your stored procedure names with sp_, because doing so reduces performance. When you call a stored procedure that starts with sp_, SQL Server always checks the master database first, even if the stored procedure is qualified with the database name.

from [Designing Data Tier Components and Passing Data Through Tiers](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/BOAGag.asp?frame=true&hidetoc=true), section titled "Recommendations for Using Stored Procedures with Data Access Logic Components". 

/kzu
