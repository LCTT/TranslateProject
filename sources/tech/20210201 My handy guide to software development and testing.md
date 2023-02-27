[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My handy guide to software development and testing)
[#]: via: (https://opensource.com/article/21/2/development-guide)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

My handy guide to software development and testing
======
Programming can feel like a battle against a horde of zombies at times.
In this series, learn how to put this ZOMBIES acronym to work for you.
![Gears above purple clouds][1]

A long time ago, when I was but a budding computer programmer, we used to work in large batches. We were each assigned a programming task, and then we'd go away and hide in our cubicles and bang on the keyboard. I remember my team members spending hours upon hours in isolation, each of us in our own cubicle, wrestling with challenges to create defect-free apps. The theory was, the larger the batch, the better the evidence that we're awesome problem solvers.

For me, it was a badge of honor to see how long I could write new code or modify existing code before stopping to check to see whether what I did worked. Back then, many of us thought stopping to verify that our code worked was a sign of weakness, a sign of a rookie programmer. A "real developer" should be able to crank out the entire app without stopping to check anything!

When I did stop to test my code, however unwillingly, I usually got a reality check. Either my code wouldn't compile, or it wouldn't build, or it wouldn't run, or it just wouldn't process the data the way I'd intended. Inevitably, I'd scramble in desperation to fix all the pesky problems I'd uncovered.

### Avoiding the zombie horde

If the old style of working sounds chaotic, that's because it was. We tackled our tasks all at once, hacking and slashing through problems only to be overwhelmed by more. It was like a battle against a horde of zombies.

Today, we've learned to avoid large batches. Hearing some experts extolling the virtues of avoiding large batches sounded completely counterintuitive at first, but I've learned a lot from past mistakes. Appropriately, I'm using a system James Grenning (<https://www.agilealliance.org/resources/speakers/james-grenning/>) calls **ZOMBIES** to guide my software development efforts.

### ZOMBIES to the rescue!

There's nothing mysterious about **ZOMBIES**. It's an acronym that stands for:

**Z** – Zero
**O** – One
**M** – Many (or more complex)
**B** – Boundary behaviors
**I** – Interface definition
**E** – Exercise exceptional behavior
**S** – Simple scenarios, simple solutions

I'll break it down for you in this article series.

### Zero in action!

**Z**ero stands for the simplest possible case.

A solution is _simplest_ because everyone initially prefers to use hard-coded values. By starting a coding session with hard-coded values, you quickly create a situation that gives you immediate feedback. Without having to wait several minutes or potentially hours, hard-coded values provide instant feedback on whether you like interacting with what you're building. If you find out you like interacting with it, great! Carry on in that direction. If you discover, for one reason or another, that you don't like interacting with it, there's been no big loss. You can easily dismiss it; you don't even have any losses to cut.

As an example, build a simple backend shopping API. This service lets users grab a shopping basket, add items to the basket, remove items from the basket, and get the order total from the API.

Create the necessary infrastructure (segregate the shipping app into an `app` folder and tests into a `tests` folder). This example uses the open source [xUnit][2] testing framework.

Roll up your sleeves, and see the Zero principle in action!


```
[Fact]
public void NewlyCreatedBasketHas0Items() {    
    var expectedNoOfItems = 0;
    var actualNoOfItems = 1;
    Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

This test is _faking it_ because it is testing for hard-coded values. When the shopping basket is newly created, it contains no items; therefore, the expected number of items in the basket is 0. This expectation is put to the test (or _asserted_) by comparing expected and actual values for equality.

When the test runs, it produces the following results:


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

The test fails for obvious reasons: you expected the number of items to be 0, but the actual number of items was hard-coded as 1.

Of course, you can quickly remedy that error by modifying the hard-coded value assigned to the actual variable from 1 to 0:


```
[Fact]
public void NewlyCreatedBasketHas0Items() {
    var expectedNoOfItems = 0;
    var actualNoOfItems = 0;
    Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

As expected, when this test runs, it passes successfully:


```
Starting test execution, please wait...

A total of 1 test files matched the specified pattern.

Test Run Successful.
Total tests: 1
     Passed: 1
 Total time: 1.0950 Seconds
```

You might not think it's worth testing code you're forcing to fail, but no matter how simple a test may be, it is absolutely mandatory to see it fail at least once. That way, you can rest assured that the test will alert you later should some inadvertent change corrupt your processing logic.

Now's the time to stop faking the Zero case and replace that hard-coded value with a value that will be provided by the running API. Now that you know you have a reliably failing test that expects an empty basket to have 0 items, it's time to write some application code.

As with any other modeling exercise in software, begin by crafting a simple _interface_. Create a new file in the solution's `app` folder and name it `IShoppingAPI.cs` (by convention, preface every interface name with an upper-case **I**). In the interface, declare the method `NoOfItems()` to return the number of items as an `int`. Here's the listing of the interface:


```
using System;

namespace app {    
    public interface IShoppingAPI {
        int NoOfItems();
    }
}
```

Of course, this interface is incapable of doing any work until you implement it. Create another file in the `app` folder and name it `ShoppingAPI`. Declare `ShoppingAPI` as a public class that implements `IShoppingAPI`. In the body of the class, define `NoOfItems` to return the integer 1:


```
using System;

namespace app {
    public class ShoppingAPI : IShoppingAPI {
        public int NoOfItems() {
            return 1;
        }
    }
}
```

You can see in the above that you are faking the processing logic again by hard-coding the return value to 1. That's good for now because you want to keep everything super brain-dead simple. Now's not the time (not yet, at least) to start mulling over how you're going to implement this shopping basket. Leave that for later! For now, you're playing with the Zero case, which means you want to see whether you like your current arrangement.

To ascertain that, replace the hard-coded expected value with the value that will be delivered when your shopping API runs and receives the request. You need to let the tests know where the shipping code is located by declaring that you are using the `app` folder.

Next, you need to instantiate the `IShoppingAPI` interface:


```
`IShoppingAPI shoppingAPI = new ShoppingAPI();`
```

This instance is used to send requests and receive actual values after the code runs.

Now the listing looks like:


```
using System;
using Xunit;
using app;

namespace tests {
    public class ShoppingAPITests {
        IShoppingAPI shoppingAPI = [new][3] ShoppingAPI();
 
        [Fact]        
        public void NewlyCreatedBasketHas0Items() {
            var expectedNoOfItems = 0;
            var actualNoOfItems = shoppingAPI.NoOfItems();
            Assert.Equal(expectedNoOfItems, actualNoOfItems);
        }
    }
}
```

Of course, when this test runs, it fails because you hard-coded an incorrect return value (the test expects 0, but the app returns 1).

Again, you can easily make the test pass by modifying the hard-coded value from 1 to 0, but that would be a waste of time at this point. Now that you have a proper interface hooked up to your test, the onus is on you to write programming logic that results in expected code behavior.

For the application code, you need to decide which data structure to use to represent the shopping cart. To keep things bare-bones, strive to identify the simplest representation of a collection in C#. The thing that immediately comes to mind is `ArrayList`. This collection is perfect for these purposes—it can take an indefinite number of items and is easy and simple to traverse.

In your app code, declare that you're using `System.Collections` because `ArrayList` is part of that package:


```
`using System.Collections;`
```

Then declare your `basket`:


```
`ArrayList basket = new ArrayList();`
```

Finally, replace the hard-coded value in the `NoOfItems()` with actual running code:


```
public int NoOfItems() {
    return basket.Count;
}
```

This time, the test passes because your instantiated basket is empty, so `basket.Count` returns 0 items.

Which is exactly what your first Zero test expects.

### More examples

Your homework is to tackle just one zombie for now, and that's the Zeroeth zombie. In the next article, I'll take a look at **O**ne and **M**any. Stay strong!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/development-guide

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chaos_engineer_monster_scary_devops_gear_kubernetes.png?itok=GPYLvfVh (Gears above purple clouds)
[2]: https://xunit.net/
[3]: http://www.google.com/search?q=new+msdn.microsoft.com
