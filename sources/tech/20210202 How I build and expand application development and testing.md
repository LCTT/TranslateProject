[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I build and expand application development and testing)
[#]: via: (https://opensource.com/article/21/2/build-expand-software)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

How I build and expand application development and testing
======
Start development simply, by writing and testing your code with One
element and then expand it out to Many.
![Security monster][1]

In my [previous article][2], I explained why tackling coding problems all at once, as if they were hordes of zombies, is a mistake. I also explained the first **ZOMBIES** principle, **Zero**. In this article, I'll demonstrate the next two principles: **One** and **Many**.

**ZOMBIES** is an acronym that stands for:

**Z** – Zero
**O** – One
**M** – Many (or more complex)
**B** – Boundary behaviors
**I** – Interface definition
**E** – Exercise exceptional behavior
**S** – Simple scenarios, simple solutions

In the previous article, you implemented Zero, which provides the simplest possible path through your code. There is absolutely no conditional processing logic anywhere to be found. Now it's time for you to move into **O**ne.

Unlike with **Z**ero, which basically means nothing is added, or we have an empty case, nothing to take care of, **O**ne means we have a single case to take care of. That single case could be one item in the collection, or one visitor, or one event that demands special treatment.

With **M**any, we are now dealing with potentially more complicated cases. Two or more items in the collection, two or more events that demand special treatment, and so on.

### One in action

Build on the code from the previous article by adding something to your virtual shopping basket. First, write a fake test:


```
[Fact]
public void Add1ItemBasketHas1Item() {
        var expectedNoOfItems = 1;
        var actualNoOfItems = 0;
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

As expected, this test fails because you hard-coded an incorrect value:


```
Starting test execution, please wait...

A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.57] tests.UnitTest1.NewlyCreatedBasketHas0Items [FAIL]
  X tests.UnitTest1.NewlyCreatedBasketHas0Items [4ms]
  Error Message:
   Assert.Equal() Failure
Expected: 0
Actual: 1
[...]
```

Now is the time to think about how to stop faking it. You already created an implementation of a shopping basket (an `ArrayList` to hold items). But how do you implement an _item_?

Simplicity should always be your guiding principle, and not knowing much about the actual item, you could fake it a little by implementing it as another collection. What could that collection contain? Well, because you're mostly interested in calculating basket totals, the item collection should, at minimum, contain a price (in any currency, but for simplicity, use dollars).

A simple collection can hold an ID on an item (a pointer to the item, which may be kept elsewhere on the system) and the associated price of an item.

A good data structure that can easily capture this is a key/value structure. In C#, the first thing that comes to mind is `Hashtable`.

In the app code, add a new capability to the `IShoppingAPI` interface:


```
`int AddItem(Hashtable item);`
```

This new capability accepts one item (an instance of a `Hashtable`) and returns the number of items found in the shopping basket.

In your tests, replace the hard-coded value with a call to the interface:


```
[Fact]
public void Add1ItemBasketHas1Item() {            
    var expectedNoOfItems = 1;
    Hashtable item = [new][3] Hashtable();
    var actualNoOfItems = shoppingAPI.AddItem(item);
    Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

This code instantiates `Hashtable` and names it `item`, then invokes `AddItem(item)` on the shopping interface, which returns the actual number of items in the basket.

To implement it, turn to the `ShoppingAPI` class:


```
public int AddItem(Hashtable item) {
    return 0;
}
```

You are faking it again just to see the results of your tests (which are the first customers of your code). Should the test fail (as expected), replace the hard-coded values with actual code:


```
public int AddItem(Hashtable item) {
    basket.Add(item);
    return basket.Count;
}
```

In the working code, add an item to the basket, and then return the count of the items in the basket:


```
Test Run Successful.
Total tests: 2
     Passed: 2
 Total time: 1.0633 Seconds
```

So now you have two tests passing and have pretty much covered **Z** and **O**, the first two parts of **ZOMBIES**.

### A moment of reflection

If you look back at what you've done so far, you will notice that by focusing your attention on dealing with the simplest possible **Z**ero and **O**ne scenarios, you have managed to create an interface as well as define some processing logic boundaries! Isn't that awesome? You now have the most important abstractions partially implemented, and you know how to process cases where nothing is added and when one thing is added. And because you are building an e-commerce API, you certainly do not foresee placing any other boundaries that would limit your customers when shopping. Your virtual shopping basket is, for all intents and purposes, limitless.

Another important (although not necessarily immediately obvious) aspect of the stepwise refinement that **ZOMBIES** offers is a reluctance to leap head-first into the brambles of implementation. You may have noticed how sheepish this is about implementing anything. For starters, it's better to fake the implementation by hard-coding the values. Only after you see that the interface interacts with your test in a sensible way are you willing to roll up your sleeves and harden the implementation code.

But even then, you should always prefer simple, straightforward constructs. And strive to avoid conditional logic as much as you can.

### Many in action

Expand your application by defining your expectations when a customer adds two items to the basket. The first test is a fake. It expects 2, but force it to fail by hard-coding 0 items:


```
[Fact]
public void Add2ItemsBasketHas2Items() {
        var expectedNoOfItems = 2;
        var actualNoOfItems = 0;
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

When you run the test, two of them pass successfuy (the previous two, the **Z** and **O** tests), but as expected, the hard-coded test fails:


```
A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.57] tests.UnitTest1.Add2ItemsBasketHas2Items [FAIL]
  X tests.UnitTest1.Add2ItemsBasketHas2Items [2ms]
  Error Message:
   Assert.Equal() Failure
Expected: 2
Actual: 0

Test Run Failed.
Tatal tests: 3
     Passed: 2
     Failed: 1
```

Replace the hard-coded values with the call to the app code:


```
[Fact]
public void Add2ItemsBasketHas2Items() {
        var expectedNoOfItems = 2;
        Hashtable item = [new][3] Hashtable();
        shoppingAPI.AddItem(item);
        var actualNoOfItems = shoppingAPI.AddItem(item);
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

In the test, you add two items (actually, you're adding the same item twice) and then compare the expected number of items to the number of items from the `shoppingAPI` instance after adding the item the second time.

All tests now pass!

### Stay tuned

You have now completed the first pass of the **ZOM** part of the equation. You did a pass on **Z**ero, on **O**ne, and on **M**any. In the next article, I'll take a look at **B** and **I**. Stay vigilant!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/build-expand-software

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://opensource.com/article/21/1/zombies-zero
[3]: http://www.google.com/search?q=new+msdn.microsoft.com
