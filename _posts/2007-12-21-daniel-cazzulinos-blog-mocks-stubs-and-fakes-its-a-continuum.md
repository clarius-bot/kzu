---
layout: post
title: "Daniel Cazzulino's Blog : Mocks, Stubs and Fakes: it's a continuum"
date: 2007-12-21 00:00:00 +0000
---

## Mocks, Stubs and Fakes: it's a continuum 

Highly recommended reading: [Fowler's article Mocks aren't Stubs](http://martinfowler.com/articles/mocksArentStubs.html). 

Generically called (by Gerard Meszaros's [xUnit patterns book](http://xunitpatterns.com/)) Test Doubles, all three kinds of test aids are intended to replace real implementations of dependencies of the object under test. From Fowler's article, we learn the difference between them as explained by Meszaros:

>   * **Dummy** objects are passed around but never actually used. Usually they are just used to fill parameter lists. 
>   * **Fake** objects actually have working implementations, but usually take some shortcut which makes them not suitable for production (an [in memory database](http://www.martinfowler.com/bliki/InMemoryTestDatabase.html) is a good example). 
>   * **Stubs** provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test. Stubs may also record information about calls, such as an email gateway stub that remembers the messages it 'sent', or maybe only how many messages it 'sent'. 
>   * **Mocks** are what we are talking about here: objects pre-programmed with expectations which form a specification of the calls they are expected to receive. 
> 

I will refer to this precise definition of these concepts by using the Capitalized name (i.e. Mock) as opposed to the more informal and common definition of them, such as mock (lowercase).

I feel that this separation is not very realistic in practice. Any given test double can be considered (and may become at any point in time) more of one or the other, except perhaps for the more strict case of mocks automatically created from some mocking libraries. Let's see why.

Consider Fowler's case of an Order that must be Filled from an IWarehouse:
    
    
    				interface 
    				IWarehouse
    {
        bool HasInventory(string productName, int quantity);
        void Remove(string productName, int quantity);
    }
    
    class Order
    {
        public string ProductName { get; private set; }
        public int Quantity { get; private set; }
        public bool IsFilled { get; private set; }
    
        public Order(string productName, int quantity)
        {
            this.ProductName = productName;
            this.Quantity = quantity;
        }
    
        public void Fill(IWarehouse warehouse)
        {
            if (warehouse.HasInventory(ProductName, Quantity))
            {
                warehouse.Remove(ProductName, Quantity);
                IsFilled = true;
            }
        }
    
    }

Straight-forward enough. In order to unit test the Fill method on the order, you might start by creating a Stub (I'm still calling the class "Mock*" as it's the generic term I usually use to mean "Test Double", which is less common):
    
    
    				class 
    				MockWarehouse : IWarehouse
    {
        public bool HasInventory(string productName, int quantity)
        {
            return true;
        }
    
        public void Remove(string productName, int quantity)
        {
        }
    }
    

[ ](http://11011.net/software/vspaste)

This is the "by the book" definition of a Stub. From this, your first unit test can pass:
    
    
    [Test]
    public void FillingFillsOrder()
    {
        var order = new Order(TALISKER, 50);
        var mock = new MockWarehouse();
    
        order.Fill(mock);
    
        Assert.IsTrue(order.IsFilled);            
    }

But that's kind of incomplete, as you don't know if the order actually called the warehouse to remove the item (even if you'll get a 100% code coverage in this case, which leads to the "obviousness" that coverage != thorough testing). So you typically save the values on the Remove call in the stub like so:
    
    
    				class 
    				MockWarehouse : IWarehouse
    {
        public string RemovedProductName;
        public int RemovedQuantity;
    
        public bool HasInventory(string productName, int quantity)
        {
            return true;
        }
    
        public void Remove(string productName, int quantity)
        {
    **this.RemovedProductName = productName;
            this.RemovedQuantity = quantity;
    **    }
    }
    

[ ](http://11011.net/software/vspaste) [ ](http://11011.net/software/vspaste)

And add the corresponding assertions to the test:
    
    
    [Test]
    public void FillingFillsOrder()
    {
        var order = new Order(TALISKER, 50);
        var mock = new MockWarehouse();
    
        order.Fill(mock);
    
        Assert.IsTrue(order.IsFilled);
    **Assert.AreEqual(TALISKER, mock.RemovedProductName);
        Assert.AreEqual(50, mock.RemovedQuantity);
    **}

[ ](http://11011.net/software/vspaste)

And we're still in the realm of a proper Stub. Next thing is, another test might need to modify the response from HasInventory depending on the arguments, so you can test what happens when there's not enough inventory for a particular item. At this point, you can pass the mock a boolean in a constructor with the canned response it has to return:
    
    
    				public MockWarehouse(bool hasInventory) { }

[ ](http://11011.net/software/vspaste)

In more realistic cases, however, the returned value may even be a factor of the received arguments in the call. So you can either go for a full Fake implementation, or you can simply pass a delegate that the method will callback to determine the return value: 
    
    
    				class 
    				MockWarehouse : IWarehouse
    {
    **public delegate bool HasInventoryHandler(string productName, int quantity);
    **private HasInventoryHandler hasInventory;
    
        public MockWarehouse(HasInventoryHandler hasInventory)
        {
            this.hasInventory = hasInventory;
        }
    
        public bool HasInventory(string productName, int quantity)
        {
    **return hasInventory(productName, quantity);**
        }
    
        public void Remove(string productName, int quantity)
        {
            this.RemovedProductName = productName;
            this.RemovedQuantity = quantity;
        }
    }
    

[ ](http://11011.net/software/vspaste)

In this very simplistic case, it's obviously overkill, but in most real cases, externalizing the mock implementation this way can lead to highly reusable mocks. Taken to the extreme (and to a more usable API), you can create your mocks so that it implements the interface explicitly and has all its members as getters/setters of corresponding delegates for the methods you want to implement externally:
    
    
    				class 
    				MockWarehouse : IWarehouse
    {
        public Func<string, int, bool>  HasInventory { get; set; }
        public Action<string, int> Remove { get; set; } 
    
        bool IWarehouse.HasInventory(string productName, int quantity)
        {
            if (HasInventory != null)
                return HasInventory(productName, quantity);
    
            return false;
        }
    
        void IWarehouse.Remove(string productName, int quantity)
        {
            if (Remove != null)
                Remove(productName, quantity);
        }
    }
    

[ ](http://11011.net/software/vspaste)

Such a mock would be used from your test as follows:
    
    
    [Test]
    public void FillingFillsOrder()
    {
        var order = new Order(TALISKER, 50);
        var mock = new MockWarehouse();
        var removed = false;
    
        mock.HasInventory = (productName, quantity) =>
            productName == TALISKER && quantity == 50 ? true : false;
        mock.Remove = delegate(string productName, int quantity)
        {
            Assert.AreEqual(TALISKER, productName);
            Assert.AreEqual(50, quantity);
            removed = true;
        };
    
        order.Fill(mock);
    
        Assert.IsTrue(order.IsFilled);
        Assert.IsTrue(removed);
    }

[ ](http://11011.net/software/vspaste)

I'm using C# 3.0 lambda notation for the first delegate just for brevity. The second delegate is passed as a regular C# 2.0 anonymous delegate. The HasInventory delegate will only return true if it receives the specific values in the expression. This is a very powerful and flexible approach I'm very fond of. It's easy to imagine a code-generator spitting such mock implementations automatically: just give it the interface, and all it has to do is implement explicitly the interface, provide public read/write properties with the same names as the interface names, and optionally create delegates for those method signatures that don't match .NET "predefined" ones (i.e. Action and Func).

Now, this mock doesn't look like a proper Stub anymore, does it? Does it look like a true Mock now? It looks more of a mix, where it can be considered one or the other depending on the usage. For example, if I set the handler for HasInventory as follows:
    
    
    mock.HasInventory = (productName, quantity) => true;

[ ](http://11011.net/software/vspaste)

it would fit the definition of a Stub, as it's returning a canned value regardless of the invocation arguments. I can also set it like a Stub for the Remove method:
    
    
    				string removedProduct;
    int removedQuantity;
    
    mock.HasInventory = (productName, quantity) => true;
    mock.Remove = delegate(string productName, int quantity)
    {
        removedProduct = productName;
        removedQuantity = quantity;
    };
    
    order.Fill(mock);
    
    Assert.IsTrue(order.IsFilled);
    **Assert.AreEqual(TALISKER, removedProduct);
    Assert.AreEqual(50, removedQuantity);
    **

[ ](http://11011.net/software/vspaste)

You might consider this a case of "recording the calls" and their arguments. On the other hand, using it as first written makes it look more like a Mock. 

Sometimes the overhead of setting multiple "expectations" handlers like this in a complicated interaction is so annoying that you end up having a more realistic implementation (i.e. a MemoryWarehouse, a Fake) to cut down test setup code.

As you can see, knowing the categorization helps at the conceptual level, but in practice it doesn't add much value, as you navigate the range of options depending on the specific testing needs. And that's a good thing, as they will always adapt to what you need, not the other way around.

That is, if you're manually creating your Test Doubles. I'll talk more about the influence the use of a mocking library can have in the way you test in another post.

/kzu
