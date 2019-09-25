[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mutation testing by example: Failure as experimentation)
[#]: via: (https://opensource.com/article/19/9/mutation-testing-example-failure-experimentation)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzichttps://opensource.com/users/jocunddew)

Mutation testing by example: Failure as experimentation
======
Develop the logic for an automated cat door that opens during daylight
hours and locks during the night, and follow along with the .NET
xUnit.net testing framework.
![Digital hand surrounding by objects, bike, light bulb, graphs][1]

In the [first article][2] in this series, I demonstrated how to use planned failure to ensure expected outcomes in your code. In this second article, I'll continue developing my example project—an automated cat door that opens during daylight hours and locks during the night.

As a reminder, you can follow along using the .NET xUnit.net testing framework by following the [instructions here][3].

### What about the daylight hours?

Recall that test-driven development (TDD) centers on a healthy amount of unit tests.

The first article implemented logic that fulfills the expectations of the **Given7pmReturnNighttime** unit test. But you're not done yet. Now you need to describe the expectations of what happens when the current time is greater than 7am. Here is the new unit test, called **Given7amReturnDaylight**:


```
       [Fact]
       public void Given7amReturnDaylight()
       {
           var expected = "Daylight";
           var actual = dayOrNightUtility.GetDayOrNight();
           Assert.Equal(expected, actual);
       }
```

The new unit test now fails (it is very desirable to fail as early as possible!):


```
Starting test execution, please wait...
[Xunit.net 00:00:01.23] unittest.UnitTest1.Given7amReturnDaylight [FAIL]
Failed unittest.UnitTest1.Given7amReturnDaylight
[...]
```

It was expecting to receive the string value "Daylight" but instead received the string value "Nighttime."

### Analyze the failed test case

Upon closer inspection, it seems that the code has trapped itself. It turns out that the implementation of the **GetDayOrNight** method is not testable!

Take a look at the core challenge we have ourselves in:

  1. **GetDayOrNight relies on hidden input. **
The value of **dayOrNight** is dependent upon the hidden input (it obtains the value for the time of day from the built-in system clock).
  2. **GetDayOrNight contains non-deterministic behavior. **
The value of the time of day obtained from the system clock is non-deterministic. It depends on the point in time when you run the code, which we must consider unpredictable.
  3. **Low quality of the GetDayOrNight API.**
This API is tightly coupled to the concrete data source (system **DateTime**).
  4. **GetDayOrNight violates the single responsibility principle.**
You have implemented a method that consumes and processes information at the same time. It is a good practice that a method should be responsible for performing a single duty.
  5. **GetDayOrNight has more than one reason to change.**
It is possible to imagine a scenario where the internal source of time may change. Also, it is quite easy to imagine that the processing logic will change. These disparate reasons for changing must be isolated from each other.
  6. **The API signature of GetDayOrNight is not sufficient when it comes to trying to understand its behavior.**
It is very desirable to be able to understand what type of behavior to expect from an API by simply looking at its signature.
  7. **GetDayOrNight depends on global shared mutable state.**
Shared mutable state is to be avoided at all costs!
  8. **The behavior of the GetDayOrNight method cannot be predicted even after reading the source code.**
That is a scary proposition. It should always be very clear from reading the source code what kind of behavior can be predicted once the system is operational.



### The principles behind what failed

Whenever you're faced with an engineering problem, it is advisable to use the time-tested strategy of _divide and conquer_. In this case, following the principle of _separation of concerns_ is the way to go.

> **separation of concerns** (**SoC**) is a design principle for separating a computer program into distinct sections, so that each section addresses a separate concern. A concern is a set of information that affects the code of a computer program. A concern can be as general as the details of the hardware the code is being optimized for, or as specific as the name of a class to instantiate. A program that embodies SoC well is called a modular program.
>
> ([source][4])

The **GetDayOrNight** method should be concerned only with deciding whether the date and time value means daylight or nighttime. It should not be concerned with finding the source of that value. That concern should be left to the calling client.

You must leave it to the calling client to take care of obtaining the current time. This approach aligns with another valuable engineering principle—_inversion of control_. Martin Fowler explores this concept in [detail, here][5].

> One important characteristic of a framework is that the methods defined by the user to tailor the framework will often be called from within the framework itself, rather than from the user's application code. The framework often plays the role of the main program in coordinating and sequencing application activity. This inversion of control gives frameworks the power to serve as extensible skeletons. The methods supplied by the user tailor the generic algorithms defined in the framework for a particular application.
>
> \-- [Ralph Johnson and Brian Foote][6]

### Refactoring the test case

So the code needs refactoring. Get rid of the dependency on the internal clock (the **DateTime** system utility):


```
` DateTime time = new DateTime();`
```

Delete the above line (which should be line 7 in your file). Refactor your code further by adding an input parameter **DateTime** time to the **GetDayOrNight** method.

Here's the refactored class **DayOrNightUtility.cs**:


```
using System;

namespace app {
   public class DayOrNightUtility {
       public string GetDayOrNight(DateTime time) {
           string dayOrNight = "Nighttime";
           if(time.Hour &gt;= 7 &amp;&amp; time.Hour &lt; 19) {
               dayOrNight = "Daylight";
           }
           return dayOrNight;
       }
   }
}
```

Refactoring the code requires the unit tests to change. You need to prepare values for the **nightHour** and the **dayHour** and pass those values into the **GetDayOrNight** method. Here are the refactored unit tests:


```
using System;
using Xunit;
using app;

namespace unittest
{
   public class UnitTest1
   {
       DayOrNightUtility dayOrNightUtility = [new][7] DayOrNightUtility();
       DateTime nightHour = [new][7] DateTime(2019, 08, 03, 19, 00, 00);
       DateTime dayHour = [new][7] DateTime(2019, 08, 03, 07, 00, 00);

       [Fact]
       public void Given7pmReturnNighttime()
       {
           var expected = "Nighttime";
           var actual = dayOrNightUtility.GetDayOrNight(nightHour);
           Assert.Equal(expected, actual);
       }

       [Fact]
       public void Given7amReturnDaylight()
       {
           var expected = "Daylight";
           var actual = dayOrNightUtility.GetDayOrNight(dayHour);
           Assert.Equal(expected, actual);
       }

   }
}
```

### Lessons learned

Before moving forward with this simple scenario, take a look back and review the lessons in this exercise.

It is easy to create a trap inadvertently by implementing code that is untestable. On the surface, such code may appear to be functioning correctly. However, following test-driven development (TDD) practice—describing the expectations first and only then prescribing the implementation—revealed serious problems in the code.

This shows that TDD is the ideal methodology for ensuring code does not get too messy. TDD points out problem areas, such as the absence of single responsibility and the presence of hidden inputs. Also, TDD assists in removing non-deterministic code and replacing it with fully testable code that behaves deterministically.

Finally, TDD helped deliver code that is easy to read and logic that's easy to follow.

In the next article in this series, I'll demonstrate how to use the logic created during this exercise to implement functioning code and how further testing can make it even better.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mutation-testing-example-failure-experimentation

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzichttps://opensource.com/users/jocunddew
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://opensource.com/article/19/9/mutation-testing-example-part-1-how-leverage-failure
[3]: https://opensource.com/article/19/8/mutation-testing-evolution-tdd
[4]: https://en.wikipedia.org/wiki/Separation_of_concerns
[5]: https://martinfowler.com/bliki/InversionOfControl.html
[6]: http://www.laputan.org/drc/drc.html
[7]: http://www.google.com/search?q=new+msdn.microsoft.com
