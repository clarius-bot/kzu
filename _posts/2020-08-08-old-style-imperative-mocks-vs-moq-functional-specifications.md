---
layout: post
title: "Old style imperative mocks vs moq functional specifications"
date: 2020-08-08 00:00:00 +0000
tags: [ddd, ef, eventsourcing, extensibility, gadgets, mocking, moq, msbuild, mvc, nuget, patterns, programming, t4, technology, vsx, wcf, webapi]
---

##  [Old style imperative mocks vs moq functional specifications](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/ "Old style imperative mocks vs moq functional specifications")

September 22, 2010 3:56 pm

Here’s a fairly complex object graph that needs to be setup as part of a unit test, as done in “traditional” [moq](http://moq.me/):
    
    
        var el1 = new Mock<IElementInfo>();
        el1.Setup(x => x.Id).Returns(Guid.NewGuid());
        el1.Setup(x => x.Multiplicity).Returns(Multiplicity.Single);
    
        var c1 = new Mock<ICollectionInfo>();
        c1.Setup(x => x.Id).Returns(Guid.NewGuid());
        c1.Setup(x => x.Multiplicity).Returns(Multiplicity.Multiple);
    
        var p1 = new Mock<IPropertyInfo>();
        p1.Setup(x => x.Id).Returns(Guid.NewGuid());
        p1.Setup(x => x.Name).Returns("Foo" + Guid.NewGuid().ToString());
        p1.Setup(x => x.Type).Returns("System.String");
    
        var p2 = new Mock<IPropertyInfo>();
        p2.Setup(x => x.Id).Returns(Guid.NewGuid());
        p2.Setup(x => x.Name).Returns("Bar" + Guid.NewGuid().ToString());
        p2.Setup(x => x.Type).Returns("System.String");
    
        var elementInfoMock = new Mock<IElementInfo>();
        elementInfoMock.Setup(e => e.Id).Returns(Guid.NewGuid());
        elementInfoMock.Setup(e => e.Multiplicity).Returns(Multiplicity.Multiple);
        elementInfoMock.Setup(e => e.Elements)
            .Returns(new List<IAbstractElementInfo>
            {
                el1.Object,
                c1.Object,
            });
        elementInfoMock.Setup(x => x.Properties).Returns(
            new List<IPropertyInfo>
            {
                p1.Object,
                p2.Object,
            });
    
        this.elementInfo = elementInfoMock.Object;
    

Things to note (familiar to any moqer): 

  1. Multiple temporary variables for the sole purpose of setting up intermediate mocks 
  2. Setup…Returns repetitive (and **boring**!) pattern 
  3. mock.Object annoying indirection to the mocked instance, ’cause we have to do so much to it **before** we’re done with it 

Well, I know I got tired of all that crap. So in moq v4, you can reduce all that to a much more readable and fluent moq functional specification like this:
    
    
    this.elementInfo = Mock.Of<IElementInfo>(x =>
        x.Id == Guid.NewGuid() &&
        x.Multiplicity == Multiplicity.Multiple &&
        x.Elements == new List<IAbstractElementInfo>
        {
            Mock.Of<IElementInfo>(e => e.Id == Guid.NewGuid() && e.Multiplicity == Multiplicity.Single),
            Mock.Of<ICollectionInfo>(e => e.Id == Guid.NewGuid() && e.Multiplicity == Multiplicity.Single),
        } &&
        x.Properties == new List<IPropertyInfo>
        {
            Mock.Of<IPropertyInfo>(p => p.Id == Guid.NewGuid() && p.Name == "Foo" + Guid.NewGuid() && p.Type == "System.String"),
            Mock.Of<IPropertyInfo>(p => p.Id == Guid.NewGuid() && p.Name == "Foo" + Guid.NewGuid() && p.Type == "System.String"),
        });

What you're essentially saying is "Give me a mock that behaves like this" (you also have Mocks.Of<T> if you need many). How's that for improved readability and maintainability?

Haven’t you become a moqer yet? ![;\)](https://web.archive.org/web/20200808212749im_/http://blogs.clariusconsulting.net/kzu/wp-includes/images/smilies/icon_wink.gif)

![](https://web.archive.org/web/20200808212749im_/http://www.clariusconsulting.net/aggbug.aspx?PostID=284965)

Posted by kzu

![Comments](https://web.archive.org/web/20200808212749im_/http://blogs.clariusconsulting.net/kzu/wp-content/themes/Clarius/style/images/hr.png)

### 9 Comments

  1. [![](https://web.archive.org/web/20200808212749im_/http://0.gravatar.com/avatar/8e0e0cc4bdf667fe7a6056db5ed540d1?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)](http://www.geekswithblogs.net/dewald.galjaard)

[Dewald](http://www.geekswithblogs.net/dewald.galjaard) [ March 10, 2011 at 1:53 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-1)

Looking really good. Just concerned for one thing. It scared the hell out of me at first…

  2. [![](https://web.archive.org/web/20200808212749im_/http://1.gravatar.com/avatar/9785300bdc75bbdb58de574d807bdfc1?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[Randy Magruder]() [ March 29, 2011 at 8:05 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-9)

“(you also have Mocks.Of if you need many).”

I can’t find any examples of the above when Google searching. Help?

  3. [![](https://web.archive.org/web/20200808212749im_/http://0.gravatar.com/avatar/6230e73ab381af22df10156ad5b9bcf4?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[kzu]() [ April 4, 2011 at 3:26 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-13)

Randy: Mock.Of gives you one, Mocks.Of gives you an enumerable. Just that. The mocks you get behave just like the Mock.Of variant.

  4. [![](https://web.archive.org/web/20200808212749im_/http://1.gravatar.com/avatar/594e77addc6a82a7d647affae18e2abf?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)](http://petemontgomery.wordpress.com/)

[Pete Montgomery](http://petemontgomery.wordpress.com/) [ June 8, 2011 at 4:04 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-200)

Smashing! This is really lovely. Does Moq have many VB users though? Mock.Of(Of IElementInfo)

  5. [![](https://web.archive.org/web/20200808212749im_/http://1.gravatar.com/avatar/1ba5a6a50b41e79dca0c34fecf40428b?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[vincent]() [ October 26, 2011 at 12:42 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-351)

what about setting up the throwing of exceptions in the mock? really like this new v4 style, but can’t figure out how to deal with exceptions.

is there some documention about the new moq functional specifications?

  6. [![](https://web.archive.org/web/20200808212749im_/http://0.gravatar.com/avatar/6230e73ab381af22df10156ad5b9bcf4?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)]()

[kzu]() [ October 26, 2011 at 4:34 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-352)

Throwing, callbacks, etc., you still use the traditional syntax. You can build the mock the functional way and then do Mock.Get(mock).Setup(…)

  7. [Better arrange readability with new Moq fluent functional specifications « Johan Leino](http://johanleino.wordpress.com/2012/11/02/better-arrange-readability-with-new-moq-fluent-functional-specifications/) [ November 2, 2012 at 7:02 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-1073)

[...] more @ Daniel Cazzulino’s blog. Share this:TwitterFacebookEmailPrintLike this:LikeBe the first to like this. C# Best Practices, [...]

  8. [![](https://web.archive.org/web/20200808212749im_/http://0.gravatar.com/avatar/4d23e8837e8f6020a5d5c2b6210c7bc3?s=32&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)](http://pkicey.wordpress.com/2013/07/18/ten-advantages-of-students-laptop/)

[Teressa Mclees](http://pkicey.wordpress.com/2013/07/18/ten-advantages-of-students-laptop/) [ October 17, 2013 at 6:05 pm. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-2200)

i have to post a link to here, from mine, if you dont mind, please reply, mwah

  9. [![](https://web.archive.org/web/20200808212749im_/http://1.gravatar.com/avatar/bce5d1d4dce83e06f89a0be050ca02be?s=32&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D32&r=G)](http://bobyrs.info/)

[Vadym Bobyr](http://bobyrs.info/) [ January 23, 2015 at 8:03 am. ](http://blogs.clariusconsulting.net/kzu/old-style-imperative-mocks-vs-moq-functional-specifications/#comment-2779)

Thanks, great and helpful article.

Comments are closed