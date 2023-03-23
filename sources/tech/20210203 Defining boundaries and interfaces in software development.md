[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Defining boundaries and interfaces in software development)
[#]: via: (https://opensource.com/article/21/2/boundaries-interfaces)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Defining boundaries and interfaces in software development
======
Zombies are bad at understanding boundaries, so set limits and
expectations for what your app can do.
![Looking at a map for career journey][1]

Zombies are bad at understanding boundaries. They trample over fences, tear down walls, and generally get into places they don't belong. In the previous articles in this series, I explained why tackling coding problems all at once, as if they were hordes of zombies, is a mistake.

**ZOMBIES** is an acronym that stands for:

**Z** – Zero
**O** – One
**M** – Many (or more complex)
**B** – Boundary behaviors
**I** – Interface definition
**E** – Exercise exceptional behavior
**S** – Simple scenarios, simple solutions

In the first two articles in this series, I demonstrated the first three **ZOMBIES** principles of **Zero**, **One**, and **Many**. The first article [implemented **Z**ero][2], which provides the simplest possible path through your code. The second article [performed tests][3] with **O**ne and **M**any samples. In this third article, I'll take a look at **B**oundaries and **I**nterfaces. 

### Back to One

Before you can tackle **B**oundaries, you need to circle back (iterate).

Begin by asking yourself: What are the boundaries in e-commerce? Do I need or want to limit the size of a shopping basket? (I don't think that would make any sense, actually).

The only reasonable boundary at this point would be to make sure the shopping basket never contains a negative number of items. Write an executable expectation that expresses this limitation:


```
[Fact]
public void Add1ItemRemoveItemRemoveAgainHas0Items() {
        var expectedNoOfItems = 0;
        var actualNoOfItems = -1;
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

This says that if you add one item to the basket, remove that item, and remove it again, the `shoppingAPI` instance should say that you have zero items in the basket.

Of course, this executable expectation (microtest) fails, as expected. What is the bare minimum modification you need to make to get this microtest to pass?


```
[Fact]
public void Add1ItemRemoveItemRemoveAgainHas0Items() {
        var expectedNoOfItems = 0;
        Hashtable item = [new][4] Hashtable();
        shoppingAPI.AddItem(item);
        shoppingAPI.RemoveItem(item);
        var actualNoOfItems = shoppingAPI.RemoveItem(item);
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

This encodes an expectation that depends on the `RemoveItem(item)` capability. And because that capability is not in your `shippingAPI`, you need to add it.

Flip over to the `app` folder, open `IShippingAPI.cs` and add the new declaration:


```
`int RemoveItem(Hashtable item);`
```

Go to the implementation class (`ShippingAPI.cs`), and implement the declared capability:


```
public int RemoveItem(Hashtable item) {
        basket.RemoveAt(basket.IndexOf(item));
        return basket.Count;
}
```

Run the system, and you get an error:

![Error][5]

(Alex Bunardzic, [CC BY-SA 4.0][6])

The system is trying to remove an item that does not exist in the basket, and it crashes. Add a little bit of defensive programming:


```
public int RemoveItem(Hashtable item) {
        if(basket.IndexOf(item) >= 0) {
                basket.RemoveAt(basket.IndexOf(item));
        }
        return basket.Count;
}
```

Before you try to remove the item from the basket, check if it is in the basket. (You could've tried by catching the exception, but I feel the above logic is easier to read and follow.)

### More specific expectations

Before we move to more specific expectations, let's pause for a second and examine what is meant by interfaces. In software engineering, an interface denotes a specification, or a description of some capability. In a way, interface in software is similar to a recipe in cooking. It lists the ingredients that make the cake but it is not actually edible. We follow the specified description in the recipe in order to bake the cake.

Similarly here, we define our service by first specifying what is this service capable of. That specification is what we call interface. But interface itself cannot provide any services to us. It is a mere blueprint which we then use and follow in order to implement specified capabilities.

So far, you have implemented the interface (partially; more capabilities will be added later) and the processing boundaries (you cannot have a negative number of items in the shopping basket). You instructed the `shoppingAPI` how to add items to the shopping basket and confirmed that the addition works by running the `Add2ItemsBasketHas2Items` test.

However, just adding items to the basket does not an e-commerce app make. You need to be able to calculate the total of the items added to the basket—time to add another expectation.

As is the norm by now (hopefully), start with the most straightforward expectation. When you add one item to the basket and the item price is $10, you expect the shopping API to correctly calculate the total as $10.

Your fifth test (the fake version):


```
[Fact]
public void Add1ItemPrice10GrandTotal10() {
        var expectedTotal = 10.00;
        var actualTotal = 0.00;
        Assert.Equal(expectedTotal, actualTotal);
}
```

Make the `Add1ItemPrice10GrandTotal10` test fail by using the good old trick: hard-coding an incorrect actual value. Of course, your previous three tests succeed, but the new fourth test fails:


```
A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.57] tests.UnitTest1.Add1ItemPrice10GrandTotal10 [FAIL]
  X tests.UnitTest1.Add1ItemPrice10GrandTotal10 [4ms]
  Error Message:
   Assert.Equal() Failure
Expected: 10
Actual: 0

Test Run Failed.
Total tests: 4
     Passed: 3
         Failed: 1
 Total time: 1.0320 Seconds
```

Replace the hard-coded value with real processing. First, see if you have any such capability in your interface that would enable it to calculate order totals. Nope, no such thing. So far, you have declared only three capabilities in your interface:

  1. `int NoOfItems();`
  2. `int AddItem(Hashtable item);`
  3. `int RemoveItem(Hashtable item);`



None of those indicates any ability to calculate totals. You need to declare a new capability:


```
`double CalculateGrandTotal();`
```

This new capability should enable your `shoppingAPI` to calculate the total amount by traversing the collection of items it finds in the shopping basket and adding up the item prices.

Flip over to your tests and change the fifth test:


```
[Fact]
public void Add1ItemPrice10GrandTotal10() {
        var expectedGrandTotal = 10.00;
        Hashtable item = [new][4] Hashtable();
        item.Add("00000001", 10.00);
        shoppingAPI.AddItem(item);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

This test declares your expectation that if you add an item priced at $10 and then call the `CalculateGrandTotal()` method on the shopping API, it will return a grand total of $10. Which is a perfectly reasonable expectation since that's how the API should calculate.

How do you implement this capability? As always, fake it first. Flip over to the `ShippingAPI` class and implement the `CalculateGrandTotal()` method, as declared in the interface:


```
public double CalculateGrandTotal() {
                return 0.00;
}
```

You're hard-coding the return value as 0.00, just to see if the test (your first customer) will be able to run it and whether it will fail. Indeed, it does run fine and fails, so now you must implement processing logic to calculate the grand total of the items in the shopping basket properly:


```
public double CalculateGrandTotal() {
        double grandTotal = 0.00;
        foreach(var product in basket) {
                Hashtable item = product as Hashtable;
                foreach(var value in item.Values) {
                        grandTotal += Double.Parse(value.ToString());
                }
        }
        return grandTotal;
}
```

Run the system. All five tests succeed!

### From One to Many

Time for another iteration. Now that you have built the system by iterating to handle the **Z**ero, **O**ne (both very simple and a bit more elaborate scenarios), and **B**oundary scenarios (no negative number of items in the basket), you must handle a bit more elaborate scenario for **M**any. 

A quick note: as we keep iterating and returning back to the concerns related to **O**ne, **M**any, and **B**oundaries (we are refining our implementation), some readers may expect that we should also rework the **I**nterface. As we will see later on, our interface is already fully fleshed out, and we see no need to add more capabilities at this point. Keep in mind that interfaces should be kept lean and simple; there is not much advantage in proliferating interfaces, as that only adds more noise to the signal. Here, we are following the principle of Occam's Razor, which states that entities should not multiply without a very good reason. For now, we are pretty much done with describing the expected capabilities of our API. We're now rolling up our sleeves and refining the implementation.

The previous iteration enabled the system to handle more than one item placed in the basket. Now, enable the system to calculate the grand total for more than one item in the basket. First things first; write the executable expectation:


```
[Fact]
public void Add2ItemsGrandTotal30() {
        var expectedGrandTotal = 30.00;
        var actualGrandTotal = 0.00;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

You "cheat" by hard-coding all values first and then do your best to make sure the expectation fails.

And it does, so now is the time to make it pass. Modify your expectation by adding two items to the basket and then running the `CalculateGrandTotal()` method:


```
[Fact]
public void Add2ItemsGrandTotal30() {
        var expectedGrandTotal = 30.00;
        Hashtable item = [new][4] Hashtable();
        item.Add("00000001", 10.00);
        shoppingAPI.AddItem(item);
        Hashtable item2 = [new][4] Hashtable();
        item2.Add("00000002", 20.00);
        shoppingAPI.AddItem(item2);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

And it passes. You now have six microtests pass successfuly; the system is back to steady-state!

### Setting expectations

As a conscientious engineer, you want to make sure that the expected acrobatics when users add items to the basket and then remove some items from the basket always calculate the correct grand total. Here comes the new expectation:


```
[Fact]
public void Add2ItemsRemoveFirstItemGrandTotal200() {
        var expectedGrandTotal = 200.00;
        var actualGrandTotal = 0.00;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

This says that when someone adds two items to the basket and then removes the first item, the expected grand total is $200.00. The hard-coded behavior fails, and now you can elaborate with more specific confirmation examples and running the code:


```
[Fact]
public void Add2ItemsRemoveFirstItemGrandTotal200() {
        var expectedGrandTotal = 200.00;
        Hashtable item = [new][4] Hashtable();
        item.Add("00000001", 100.00);
        shoppingAPI.AddItem(item);
        Hashtable item2 = [new][4] Hashtable();
        item2.Add("00000002", 200.00);
        shoppingAPI.AddItem(item2);
        shoppingAPI.RemoveItem(item);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

Your confirmation example, coded as the expectation, adds the first item (ID "00000001" with item price $100.00) and then adds the second item (ID "00000002" with item price $200.00). You then remove the first item from the basket, calculate the grand total, and assert if it is equal to the expected value.

When this executable expectation runs, the system meets the expectation by correctly calculating the grand total. You now have seven tests passing! The system is working; nothing is broken!


```
Test Run Successful.
Total tests: 7
     Passed: 7
 Total time: 0.9544 Seconds
```

### More to come

You're up to **ZOMBI** now, so in the next article, I'll cover **E**. Until then, try your hand at some tests of your own!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/boundaries-interfaces

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://opensource.com/article/21/1/zombies-zero
[3]: https://opensource.com/article/21/1/zombies-2-one-many
[4]: http://www.google.com/search?q=new+msdn.microsoft.com
[5]: https://opensource.com/sites/default/files/uploads/error_0.png (Error)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
