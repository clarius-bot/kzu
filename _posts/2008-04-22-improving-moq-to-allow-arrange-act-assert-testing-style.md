---
layout: post
title: "Improving MoQ to allow arrange-act-assert testing style"
date: 2008-04-22 00:00:00 +0000
---

##  [Improving MoQ to allow arrange-act-assert testing style](<http://blogs.clariusconsulting.net/kzu/improving-moq-to-allow-arrange-act-assert-testing-style/> "Improving MoQ to allow arrange-act-assert testing style")

April 22, 2008 10:45 pm

Today, the [MoQ](<http://code.google.com/p/moq/>)[API](<http://www.clariusconsulting.net/labs/moq/html/F3C3BE5A.htm>) lets you setup expectations and later verify them, like so:
    
    
    [Fact]
    public void FillingRemovesInventoryIfInStock()
    {
        //arrange/setup
        var order = new Order(TALISKER, 50);
        var mock = new Mock<IWarehouse>();
    
        //setup - expectations
        **mock.Expect(x = > x.HasInventory(TALISKER, 50)).Returns(true);
    **//act
        order.Fill(mock.Object);
    
        //assert
        Assert.True(order.IsFilled);
        //verify interaction
        **mock.VerifyAll();**
    }
    

A very good feedback I got during the past [MVP Summit](<https://www.mvpsummit2008.com/>) was that the current approach moves all the semantic relevance for mocks up to the setup phase of the test. In order words, it doesn’t fit well in the Arrange-Act-Assert pattern, as effectively the “asserts” (expectations that must be met) are now in the “arrange” (or setup) phase of the test.

The Verify/VerifyAll call which is down at the assertion phase contains no semantic whatsoever about what it is you are expecting to happen. 

In order to be accomodate this requirement, I’m gonna be adding a overload to Verify that takes the expression you want to verify:
    
    
    				//assert
    mock.Verify(x => x.HasInventory(TALISKER, 50));

[  
](<http://11011.net/software/vspaste>)  
[  
](<http://11011.net/software/vspaste>)

This would bring back the assertion phase to the place it belongs, if that’s what you need. And because the default behavior on MoQ mocks is that they never throw on unexpected invocations, you can use the Expect only to setup return values when you need them (I’m hesitant to rename Expect to Setup, as for people using strict mocks that prefer the VerifyAll approach, it won’t make much sense). 

What do you think?

![](http://www.clariusconsulting.net/aggbug.aspx?PostID=61200)

Posted by kzu