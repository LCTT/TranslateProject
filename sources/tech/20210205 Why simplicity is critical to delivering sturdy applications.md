[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why simplicity is critical to delivering sturdy applications)
[#]: via: (https://opensource.com/article/21/2/simplicity)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Why simplicity is critical to delivering sturdy applications
======
When you stick to the simplest possible scenarios, you end up with the
simplest possible solutions.
![Person using a laptop][1]

In the previous articles in this series, I explained why tackling coding problems all at once, as if they were hordes of zombies, is a mistake. I'm using a helpful acronym explaining why it's better to approach problems incrementally. **ZOMBIES** stands for:

**Z** – Zero
**O** – One
**M** – Many (or more complex)
**B** – Boundary behaviors
**I** – Interface definition
**E** – Exercise exceptional behavior
**S** – Simple scenarios, simple solutions

In the first four articles in this series, I demonstrated the first five **ZOMBIES** principles. The first article [implemented **Z**ero][2], which provides the simplest possible path through your code. The second article performed [tests with **O**ne and **M**any][3] samples, the third article looked at [**B**oundaries and **I**nterfaces][4], and the fourth examined [**E**xceptional behavior][5]. In this article, I'll take a look at the final letter in the acronym: **S**, which stands for "simple scenarios, simple solutions."

### Simple scenarios, simple solutions in action

If you go back and examine all the steps taken to implement the shopping API in this series, you'll see a purposeful decision to always stick to the simplest possible scenarios. In the process, you end up with the simplest possible solutions.

There you have it: **ZOMBIES** help you deliver sturdy, elegant solutions by adhering to simplicity.

### Victory?

It might seem you're done here, and a less conscientious engineer would very likely declare victory. But enlightened engineers always probe a bit deeper.

One exercise I always recommend is [mutation testing][6]. Before you wrap up this exercise and go on to fight new battles, it is wise to give your solution a good shakeout with mutation testing. And besides, you have to admit that _mutation_ fits well in a battle against zombies.

Use the open source [Stryker.NET][7] to run mutation tests.

![Mutation testing][8]

(Alex Bunardzic, [CC BY-SA 4.0][9])

It looks like you have one surviving mutant! That's not a good sign.

What does this mean? Just when you thought you had a rock-solid, sturdy solution, Stryker.NET is telling you that not everything is rosy in your neck of the woods.

Take a look at the pesky mutant who survived:

![Surviving mutant][10]

(Alex Bunardzic, [CC BY-SA 4.0][9])

The mutation testing tool took the statement:


```
`if(total > 500.00) {`
```

and mutated it to:


```
`if(total >= 500.00) {`
```

Then it ran the tests and realized that none of the tests complained about the change. If there is a change in processing logic and none of the tests complain about the change, that means you have a surviving mutant.

### Why mutation matters

Why is a surviving mutant a sign of trouble? It's because the processing logic you craft governs the behavior of your system. If the processing logic changes, the behavior should change, too. And if the behavior changes, the expectations encoded in the tests should be violated. If these expectations are not violated, that means that the expectations are not precise enough. You have a loophole in your processing logic.

To fix this, you need to "kill" the surviving mutant. How do you do that? Typically, the fact that a mutant survived means at least one expectation is missing.

Look through your code to see what expectation, if any, is not there:

  * You clearly defined the expectation that a newly created basket has zero items (and, by implication, has a $0 grand total).
  * You also defined the expectation that adding one item will result in the basket having one item, and if the item price is $10, the grand total will be $10.
  * Furthermore, you defined the expectation that adding two items to the basket, one item priced at $10 and the other at $20, results in a grand total of $30.
  * You also declared expectations regarding the removal of items from the basket.
  * Finally, you defined the expectation that any order total greater than $500 results in a price discount. The business policy rule dictates that in such a case, the discount is 10% of the order's total price.



What is missing? According to the mutation testing report, you never defined an expectation regarding what business policy rule applies when the order total is exactly $500. You defined what happens if the order total is greater than the $500 threshold and what happens when the order total is less than $500.

Define this edge-case expectation:


```
[Fact]
public void Add2ItemsTotal500GrandTotal500() {
        var expectedGrandTotal = 500.00;
        var actualGrandTotal = 450;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

The first stab fakes the expectation to make it fail. You now have nine microtests; eight succeed, and the ninth test fails:


```
[xUnit.net 00:00:00.57] tests.UnitTest1.Add2ItemsTotal500GrandTotal500 [FAIL]
  X tests.UnitTest1.Add2ItemsTotal500GrandTotal500 [2ms]
  Error Message:
   Assert.Equal() Failure
Expected: 500
Actual: 450
[...]
Test Run Failed.
Total tests: 9
     Passed: 8
     Failed: 1
 Total time: 1.5920 Seconds
```

Replace hard-coded values with an expectation of a confirmation example:


```
[Fact]
public void Add2ItemsTotal500GrandTotal500() {
        var expectedGrandTotal = 500.00;
        Hashtable item1 = [new][11] Hashtable();
        item1.Add("0001", 400.00);
        shoppingAPI.AddItem(item1);
        Hashtable item2 = [new][11] Hashtable();
        item2.Add("0002", 100.00);
        shoppingAPI.AddItem(item2);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal(); }
```

You added two items, one priced at $400, the other at $100, totaling $500. After calculating the grand total, you expect that it will be $500.

Run the system. All nine tests pass!


```
Total tests: 9
     Passed: 9
     Failed: 0
 Total time: 1.0440 Seconds
```

Now for the moment of truth. Will this new expectation remove all mutants? Run the mutation testing and check the results:

![Mutation testing success][12]

(Alex Bunardzic, [CC BY-SA 4.0][9])

Success! All 10 mutants were killed. Great job; you can now ship this API with confidence.

### Epilogue

If there is one takeaway from this exercise, it's the emerging concept of _skillful procrastination_. It's an essential concept, knowing that many of us tend to rush mindlessly into envisioning the solution even before our customers have finished describing their problem.

#### Positive procrastination

Procrastination doesn't come easily to software engineers. We're eager to get our hands dirty with the code. We know by heart numerous design patterns, anti-patterns, principles, and ready-made solutions. We're itching to put them into executable code, and we lean toward doing it in large batches. So it is indeed a virtue to _hold our horses_ and carefully consider each and every step we make.

This exercise proves how **ZOMBIES** help you take many deliberate small steps toward solutions. It's one thing to be aware of and to agree with the [Yagni][13] principle, but in the "heat of the battle," those deep considerations often fly out the window, and you end up throwing in everything and the kitchen sink. And that produces bloated, tightly coupled systems.

### Iteration and incrementation

Another essential takeaway from this exercise is the realization that the only way to keep a system working at all times is by adopting an _iterative approach_. You developed the shopping API by applying some _rework_, which is to say, you proceeded with coding by making changes to code that you already changed. This rework is unavoidable when iterating on a solution.

One of the problems many teams experience is confusion related to iteration and increments. These two concepts are fundamentally different.

An _incremental approach_ is based on the idea that you hold a crisp set of requirements (or a _blueprint_) in your hand, and you go and build the solution by working incrementally. Basically, you build it piece-by-piece, and when all pieces have been assembled, you put them together, and _voila_! The solution is ready to be shipped!

In contrast, in an _iterative approach_, you are less certain that you know all that needs to be known to deliver the expected value to the paying customer. Because of that realization, you proceed gingerly. You're wary of breaking the system that already works (i.e., the system in a steady-state). If you disturb that balance, you always try to disturb it in the least intrusive, least invasive manner. You focus on taking the smallest imaginable batches, then quickly wrapping up your work on each batch. You prefer to have the system back to the steady-state in a matter of minutes, sometimes even seconds.

That's why an iterative approach so often adheres to "_fake it 'til you make it_." You hard-code many expectations so that you can verify that a tiny change does not disable the system from running. You then make the changes necessary to replace the hard-coded value with real processing.

As a rule of thumb, in an iterative approach, you aim to craft an expectation (a microtest) in such a way that it precipitates only one improvement to the code. You go one improvement by one improvement, and with each improvement, you exercise the system to make sure it is in a working state. As you proceed in that fashion, you eventually hit the stage where all the expectations have been met, and the code has been refactored in such a way that it leaves no surviving mutants.

Once you get to that state, you can be fairly confident that you can ship the solution.

Many thanks to inimitable [Kent Beck][14], [Ron Jeffries][15], and [GeePaw Hill][16] for being a constant inspiration on my journey to software engineering apprenticeship.

And may _your_ journey be filled with ZOMBIES.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/simplicity

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/21/1/zombies-zero
[3]: https://opensource.com/article/21/1/zombies-2-one-many
[4]: https://opensource.com/article/21/1/zombies-3-boundaries-interface
[5]: https://opensource.com/article/21/1/zombies-4-exceptional-behavior
[6]: https://opensource.com/article/19/9/mutation-testing-example-definition
[7]: https://stryker-mutator.io/
[8]: https://opensource.com/sites/default/files/uploads/stryker-net.png (Mutation testing)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/mutant.png (Surviving mutant)
[11]: http://www.google.com/search?q=new+msdn.microsoft.com
[12]: https://opensource.com/sites/default/files/uploads/stryker-net-success.png (Mutation testing success)
[13]: https://martinfowler.com/bliki/Yagni.html
[14]: https://en.wikipedia.org/wiki/Kent_Beck
[15]: https://en.wikipedia.org/wiki/Ron_Jeffries
[16]: https://www.geepawhill.org/
