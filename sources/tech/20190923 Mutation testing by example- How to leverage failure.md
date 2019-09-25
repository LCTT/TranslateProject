[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mutation testing by example: How to leverage failure)
[#]: via: (https://opensource.com/article/19/9/mutation-testing-example-tdd)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Mutation testing by example: How to leverage failure
======
Use planned failure to ensure your code meets expected outcomes and
follow along with the .NET xUnit.net testing framework.
![failure sign at a party, celebrating failure][1]

In my article _[Mutation testing is the evolution of TDD][2]_, I exposed the power of iteration to guarantee a solution when a measurable test is available. In that article, an iterative approach helped to determine how to implement code that calculates the square root of a given number.

I also demonstrated that the most effective method is to find a measurable goal or test, then start iterating with best guesses. The first guess at the correct answer will most likely fail, as expected, so the failed guess needs to be refined. The refined guess must be validated against the measurable goal or test. Based on the result, the guess is either validated or must be further refined.

In this model, the only way to learn how to reach the solution is to fail repeatedly. It sounds counterintuitive, but amazingly, it works.

Following in the footsteps of that analysis, this article examines the best way to use a DevOps approach when building a solution containing some dependencies. The first step is to write a test that can be expected to fail.

### The problem with dependencies is that you can't depend on them

The problem with dependencies, as Michael Nygard wittily expresses in _[Architecture without an end state][3]_, is a huge topic better left for another article. Here, you'll look into potential pitfalls that dependencies tend to bring to a project and how to leverage test-driven development (TDD) to avoid those pitfalls.

First, pose a real-life challenge, then see how it can be solved using TDD.

### Who let the cat out?

![Cat standing on a roof][4]

In Agile development environments, it's helpful to start building the solution by defining the desired outcomes. Typically, the desired outcomes are described in a [_user story_][5]:

> _Using my home automation system (HAS),
>  I want to control when the cat can go outside,
>  because I want to keep the cat safe overnight._

Now that you have a user story, you need to elaborate on it by providing some functional requirements (that is, by specifying the _acceptance criteria_). Start with the simplest of scenarios described in pseudo-code:

> _Scenario #1: Disable cat trap door during nighttime_
>
>   * Given that the clock detects that it is nighttime
>   * When the clock notifies the HAS
>   * Then HAS disables the Internet of Things (IoT)-capable cat trap door
>


### Decompose the system

The system you are building (the HAS) needs to be _decomposed_–broken down to its dependencies–before you can start working on it. The first thing you must do is identify any dependencies (if you're lucky, your system has no dependencies, which would make it easy to build, but then it arguably wouldn't be a very useful system).

From the simple scenario above, you can see that the desired business outcome (automatically controlling a cat door) depends on detecting nighttime. This dependency hinges upon the clock. But the clock is not capable of determining whether it is daylight or nighttime. It's up to you to supply that logic.

Another dependency in the system you're building is the ability to automatically access the cat door and enable or disable it. That dependency most likely hinges upon an API provided by the IoT-capable cat door.

### Fail fast toward dependency management

To satisfy one dependency, we will build the logic that determines whether the current time is daylight or nighttime. In the spirit of TDD, we will start with a small failure.

Refer to my [previous article][2] for detailed instructions on how to set the development environment and scaffolds required for this exercise. We will be reusing the same NET environment and relying on the [xUnit.net][6] framework.

Next, create a new project called HAS (for "home automation system") and create a file called **UnitTest1.cs**. In this file, write the first failing unit test. In this unit test, describe your expectations. For example, when the system runs, if the time is 7pm, then the component responsible for deciding whether it's daylight or nighttime returns the value "Nighttime."

Here is the unit test that describes that expectation:


```
using System;
using Xunit;

namespace unittest
{
   public class UnitTest1
   {
       DayOrNightUtility dayOrNightUtility = [new][7] DayOrNightUtility();

       [Fact]
       public void Given7pmReturnNighttime()
       {
           var expected = "Nighttime";
           var actual = dayOrNightUtility.GetDayOrNight();
           Assert.Equal(expected, actual);
       }
   }
}
```

By this point, you may be familiar with the shape and form of a unit test. A quick refresher: describe the expectation by giving the unit test a descriptive name, **Given7pmReturnNighttime**, in this example. Then in the body of the unit test, a variable named **expected** is created, and it is assigned the expected value (in this case, the value "Nighttime"). Following that, a variable named **actual** is assigned the actual value (available after the component or service processes the time of day).

Finally, it checks whether the expectation has been met by asserting that the expected and actual values are equal: **Assert.Equal(expected, actual)**.

You can also see in the above listing a component or service called **dayOrNightUtility**. This module is capable of receiving the message **GetDayOrNight** and is supposed to return the value of the type **string**.

Again, in the spirit of TDD, the component or service being described hasn't been built yet (it is merely being described with the intention to prescribe it later). Building it is driven by the described expectations.

Create a new file in the **app** folder and give it the name **DayOrNightUtility.cs**. Add the following C# code to that file and save it:


```
using System;

namespace app {
   public class DayOrNightUtility {
       public string GetDayOrNight() {
           string dayOrNight = "Undetermined";
           return dayOrNight;
       }
   }
}
```

Now go to the command line, change directory to the **unittests** folder, and run the test:


```
[Xunit.net 00:00:02.33] unittest.UnitTest1.Given7pmReturnNighttime [FAIL]
Failed unittest.UnitTest1.Given7pmReturnNighttime
[...]
```

Congratulations, you have written the first failing unit test. The unit test was expecting **DayOrNightUtility** to return string value "Nighttime" but instead, it received the string value "Undetermined."

### Fix the failing unit test

A quick and dirty way to fix the failing test is to replace the value "Undetermined" with the value "Nighttime" and save the change:


```
using System;

namespace app {
   public class DayOrNightUtility {
       public string GetDayOrNight() {
           string dayOrNight = "Nighttime";
           return dayOrNight;
       }
   }
}
```

Now when we run the test, it passes:


```
Starting test execution, please wait...

Total tests: 1. Passed: 1. Failed: 0. Skipped: 0.
Test Run Successful.
Test execution time: 2.6470 Seconds
```

However, hardcoding the values is basically cheating, so it's better to endow **DayOrNightUtility** with some intelligence. Modify the **GetDayOrNight** method to include some time-calculation logic:


```
public string GetDayOrNight() {
    string dayOrNight = "Daylight";
    DateTime time = new DateTime();
    if(time.Hour &lt; 7) {
        dayOrNight = "Nighttime";
    }
    return dayOrNight;
}
```

The method now gets the current time from the system and compares the **Hour** value to see if it is less than 7am. If it is, the logic transforms the **dayOrNight** string value from "Daylight" to "Nighttime." The unit test now passes.

### The start of a test-driven solution

We now have the beginnings of a base case unit test and a viable solution for our time dependency. There are more than a few more cases to work through. 

In the next article, I'll demonstrate how to test for daylight hours and how to leverage failure along the way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mutation-testing-example-tdd

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://opensource.com/article/19/8/mutation-testing-evolution-tdd
[3]: https://www.infoq.com/presentations/Architecture-Without-an-End-State/
[4]: https://opensource.com/sites/default/files/uploads/cat.png (Cat standing on a roof)
[5]: https://www.agilealliance.org/glossary/user-stories
[6]: https://xunit.net/
[7]: http://www.google.com/search?q=new+msdn.microsoft.com
