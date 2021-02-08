[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mutation testing by example: Execute the test)
[#]: via: (https://opensource.com/article/19/9/mutation-testing-example-execute-test)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Mutation testing by example: Execute the test
======
Use the logic created so far in this series to implement functioning
code, then use failure and unit testing to make it better.
![A cat.][1]

The [second article][2] in this series demonstrated how to implement the logic for determining whether it's daylight or nighttime in a home automation system (HAS) application that controls locking and unlocking a cat door. This third article explains how to write code to use that logic in an application that locks a door at night and unlocks it during daylight hours.

As a reminder, set yourself up to follow along using the .NET xUnit.net testing framework by following the [instructions here][3].

### Disable the cat trap door during nighttime

Assume the cat door is a sophisticated Internet of Things (IoT) product that has an IP address and can be accessed by sending a request to its API. For the sake of brevity, this series doesn't go into how to program an IoT device; rather, it simulates the service to keep the focus on test-driven development (TDD) and mutation testing.

Start by writing a failing unit test:


```
[Fact]
public void GivenNighttimeDisableTrapDoor() {
   var expected = "Cat trap door disabled";
   var timeOfDay = dayOrNightUtility.GetDayOrNight(nightHour);
   var actual = catTrapDoor.Control(timeOfDay);
   Assert.Equal(expected, actual);
}
```

This describes a brand new component or service (**catTrapDoor**). That component (or service) has the capability to control the trap door given the current time. Now it's time to implement **catTrapDoor**.

To simulate this service, you must first describe its capabilities by using the interface. Create a new file in the app folder and name it **ICatTrapDoor.cs** (by convention, an interface name starts with an uppercase letter **I**). Add the following code to that file:


```
namespace app{
   public interface ICatTrapDoor {
       string Control(string dayOrNight);
   }
}
```

This interface is not capable of functioning. It merely describes your intention when building the **CatTrapDoor** service. Interfaces are a nice way to create abstractions of the services you are working with. In a way, you could regard this interface as an API of the **CatTrapDoor** service.

To implement the API, create a new file in the app folder and name it **FakeCatTrapDoor.cs**. Enter the following code into the class file:


```
namespace app{
   public class FakeCatTrapDoor : ICatTrapDoor {
       public string Control(string dayOrNight) {
           string trapDoorStatus = "Undetermined";
           if(dayOrNight == "Nighttime") {
               trapDoorStatus = "Cat trap door disabled";
           }

           return trapDoorStatus;
       }
   }
}
```

This new **FakeCatTrapDoor** class implements the interface **ICatTrapDoor**. Its method **Control** accepts string value **dayOrNight** and checks whether the value passed in is "Nighttime." If it is, it modifies **trapDoorStatus** from "Undetermined" to "Cat trap door disabled" and returns that value to the calling client.

Why is it called **FakeCatTrapDoor**? Because it's not a representation of the real cat trap door. The fake just helps you work out the processing logic. Once your logic is airtight, the fake service is replaced with the real service (this topic is reserved for the discipline of integration testing).

With everything implemented, all the unit tests pass when they run:


```
Starting test execution, please wait...

Total tests; 3. Passed: 3. failed: 0. Skipped: 0.
Test Run Successful.
Test execution time: 1.3913 Seconds
```

### Enable the cat trap door during daytime

It's time to look at the next scenario in our user story:

> _Scenario #2: Enable cat trap door during daylight_
>
>   * Given that the clock detects the daylight
>   * When the clock notifies the HAS
>   * Then the HAS enables the cat trap door
>


This should be easy, just the flip side of the first scenario. First, write the failing test. Add the following unit test to your **UnitTest1.cs** file in the **unittest** folder:


```
[Fact]
public void GivenDaylightEnableTrapDoor() {
   var expected = "Cat trap door enabled";
   var timeOfDay = dayOrNightUtility.GetDayOrNight(dayHour);
   var actual = catTrapDoor.Control(timeOfDay);
   Assert.Equal(expected, actual);
}
```

You can expect to receive a "Cat trap door enabled" notification when sending the "Daylight" status to **catTrapDoor** service. When you run unit tests, you see the result you expect, which fails as expected:


```
Starting test execution, please wait...
[Xunit unittest.UnitTest1.UnitTest1.GivenDaylightEnableTrapDoor [FAIL]
Failed unittest.UnitTest1.UnitTest1.GivenDaylightEnableTrapDoor
[...]
```

The unit test expected to receive a "Cat trap door enabled" notification but instead was notified that the cat trap door status is "Undetermined." Cool; now's the time to fix this minor failure.

Adding three lines of code to the **FakeCatTrapDoor** does the trick:


```
if(dayOrNight == "Daylight") {
   trapDoorStatus = "Cat trap door enabled";
}
```

Run the unit tests again, and all tests pass:


```
Starting test execution, please wait...

Total tests: 4. Passed: 4. Failed: 0. Skipped: 0.
Test Run Successful.
Test execution time: 2.4888 Seconds
```

Awesome! Everything looks good, all the unit tests are in green, you have a rock-solid solution. Thank you, TDD!

### Not so fast!

Experienced engineers would not be convinced that the solution is rock-solid. Why? Because the solution hasn't been mutated yet. To dive deeply into what mutation is and why it's important, be sure to read the final article in this series.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mutation-testing-example-execute-test

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cat_pet_animal.jpg?itok=HOrVTfBZ (A cat.)
[2]: https://opensource.com/article/19/9/mutation-testing-example-part-2-failure-experimentation
[3]: https://opensource.com/article/19/8/mutation-testing-evolution-tdd
