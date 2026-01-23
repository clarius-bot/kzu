---
layout: post
title: "Daniel Cazzulino's Blog : Announcing the free ViewModel Tool"
date: 2009-03-30 00:00:00 +0000
---

Daniel Cazzulino's Blog : Announcing the free ViewModel Tool


### Subscriptions

  * [RSS 2.0](http://www.clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://www.clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### News

[![](https://web.archive.org/web/20090401134253im_/http://www.feedburner.com/fb/images/pub/feed-icon16x16.png)](http://feeds.feedburner.com/DanielCazzulino) [](http://feeds.feedburner.com/DanielCazzulino) [![](https://web.archive.org/web/20090401134253im_/http://feeds.feedburner.com/~fc/DanielCazzulino?bg=FF6600&fg=FFFFFF&anim=1)](http://feeds.feedburner.com/DanielCazzulino)

[ ![](https://web.archive.org/web/20090401134253im_/http://twitter.com/favicon.ico) ](http://twitter.com/kzu) [kzu in Twitter](http://twitter.com/kzu)

[ ![](https://web.archive.org/web/20090401134253im_/http://www.linkedin.com/favicon.ico)](http://www.linkedin.com/in/danielcazzulino) [kzu in LinkedIn](http://www.linkedin.com/in/danielcazzulino)

[![Microsoft MVP Profile](https://web.archive.org/web/20090401134253im_/http://clariusconsulting.net/Themes/default/images/mvp-logo.gif)](https://mvp.support.microsoft.com/profile/Daniel.Cazzulino)

[ ![](/web/20090401134253im_/http://www.clariusconsulting.net/img/mail-to-button.gif) Contact](http://www.clariusconsulting.net/blogs/kzu/contact.aspx)

### Post Categories

  * [.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://www.clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://www.clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://www.clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://www.clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [InSTEDD](http://www.clariusconsulting.net/blogs/kzu/archive/category/1064.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1064)
  * [Mesh](http://www.clariusconsulting.net/blogs/kzu/archive/category/1065.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1065)
  * [Miscelaneous](http://www.clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Moq](http://www.clariusconsulting.net/blogs/kzu/archive/category/1062.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1062)
  * [Movies](http://www.clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://www.clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [PowerShell](http://www.clariusconsulting.net/blogs/kzu/archive/category/1055.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1055)
  * [Shadowfax](http://www.clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [Software Factories](http://www.clariusconsulting.net/blogs/kzu/archive/category/1041.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1041)
  * [WPF](http://www.clariusconsulting.net/blogs/kzu/archive/category/1060.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1060)
  * [XML](http://www.clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://www.clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Announcing the free ViewModel Tool 

If you're doing any kind of WPF development, you probably read at least some of the links in this [entry on WPF Patterns](http://blogs.sqlxml.org/bryantlikes/archive/2006/09/27/WPF-Patterns.aspx).

One common theme across all variants of the ViewModel pattern is that it always has to implement the [INotifyPropertyChanged](http://msdn.microsoft.com/en-us/library/system.componentmodel.inotifypropertychanged.aspx) interface, which is the core interface driving the whole data-binding infrastructure in both WinForms and WPF. Implementing this interface is quite boring and repetitive, more so if you're using C# 3.5 automatic properties:
    
    
    public class Customer
    {
        public string FirstName { get; set; }
        public Address Address { get; set; }
        // other properties
    }

We need now to add the event raising call to every setter, but in order to do that, we have to convert the automatic properties into regular ones, with the corresponding backing field, etc.:
    
    
    public class Customer : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
    
        Address _address;
        string _firstName;
     
        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; this.RaisePropertyChanged("FirstName"); }
        }
    
        public Address Address
        {
            get { return _address; }
            set { _address = value; this.RaisePropertyChanged("Address"); }
        }
    
        // other properties
    
        private void RaisePropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }
    }
    

Pretty standard stuff. But wait, that Address property seems like it should also implement INotifyPropertyChanged! What's more, seems like we should also be tracking changes in nested/child objects and raising the change from the parent property too! (i.e. someone changes Address.City, the Customer.Address should be considered changed).

This quickly adds to the tedium, not to mention how error-prone all this is (just one copy/paste where you forget to change the property name) and also how annoying it gets when you need to refactor the code with all those strings.

Well, [quite some time ago](http://www.clariusconsulting.net/blogs/kzu/archive/2007/09/27/33235.aspx) (back in 2007) we released an early version of a custom tool that would generate all this repetitive stuff for you. This tool has evolved quite a bit as we used it in various projects, and now we have a revamped release, which has been renamed to [ViewModel Tool](http://clarius.codeplex.com/Wiki/View.aspx?title=ViewModel Tool). The tool supports VS2008 on both C# and VB projects. 

The tool can also generate (opt-in) ISupportInitialize, ISupportInitializeNotification and IChangeTracking implementations.

Enjoy and please report any issues you may find via the [Issue Tracker](http://clarius.codeplex.com/WorkItem/List.aspx) (select ViewModel Tool as the component). Go [get it](http://clarius.codeplex.com/Wiki/View.aspx?title=ViewModel%20Tool)!

posted on Monday, March 30, 2009 1:03 PM by [kzu](http://www.clariusconsulting.net/user/Profile.aspx?UserID=1004)

  

[![](/web/20090401134253im_/http://www.clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)](http://clariusconsulting.net/blogs "Clarius Aggregated Blogs")