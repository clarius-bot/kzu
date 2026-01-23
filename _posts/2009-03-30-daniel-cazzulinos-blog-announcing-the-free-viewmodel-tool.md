---
layout: post
title: "Daniel Cazzulino's Blog : Announcing the free ViewModel Tool"
date: 2009-03-30 00:00:00 +0000
---

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
