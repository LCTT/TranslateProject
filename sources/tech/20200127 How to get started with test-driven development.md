[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to get started with test-driven development)
[#]: via: (https://opensource.com/article/20/1/test-driven-development)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

How to get started with test-driven development
======
Learn when, what, and how to test in a TDD system.
![Penguin driving a car with a yellow background][1]

I am often approached by software developers who are on board with the switch to test-driven development (TDD). They understand that describing expectations first and then writing code to meet those expectations is the best way to write software. And they agree that writing tests first does not introduce any overhead since they must write tests anyway. Still, they find themselves stuck, not being clear on what to test, when to test it, and how to test it. This article will answer those questions.

### First, an analogy

Imagine you're working on a team that has been asked to build a race car. The goal is to deliver a product that will enable a crew to drive the car from one city (say, Portland, Oregon) to another city (say, Seattle, Washington).

Your team could go about designing and building that car in several different ways. One way would be to handcraft a unique, monolithic vehicle where all parts are home-grown and tightly coupled. Another way would be to use only prefabricated parts and stitch them together. And there are many other permutations of these two extreme approaches.

Suppose your team goes with hand-building the constituent components of the race car. A car needs a battery to run. For the purposes of this analogy, focus on the custom-made car battery. How would you go about testing it?

### Testing strategies

One way to the test custom-made car battery would be to hire a testing crew, ship the car with the battery to Portland, and then get the testing crew to drive the car from Portland to Seattle. If the car arrives in Seattle, you can confirm that, yes, the car battery functions as expected.

Another way to test the custom-made car battery would be to install it in the car and see if the engine turns over. If the engine starts, you can confirm that, yes, the car battery functions as expected.

Still another way would be to use a voltmeter and connect the positive (+) and the negative (-) terminals to see if the voltmeter registers voltage output in the range of 12.6 to 14.7 volts. If it does, you can confirm that, yes, the car battery functions as expected.

The above three hypothetical examples illustrate how different ways of testing the car battery align with three categories of testing strategies:

  1. Employing the testing crew to drive the car from Portland to Seattle aligns with the **system or end-to-end testing strategy**.
  2. Installing the battery in the car and verifying if the engine starts aligns with the **integration testing strategy**.
  3. Measuring the voltage output of the car battery to verify if it falls within the expected range aligns with the **unit testing strategy**.



### TDD is all about unit testing

I hope these examples provide simple guiding principles for discerning between unit, integration, and system end-to-end testing.

Keeping those guidelines in mind, it is very important _never_ to include integration nor system tests in your TDD practice. In TDD, the expected outcomes are always micro-outcomes. Measuring the voltage output of a car battery is a good example of a micro-outcome. A car battery is a unit of functionality that cannot easily be broken down into a few smaller units of functionality. As such, it is a perfect candidate for writing a unit test (i.e., describing the expected measurable output).

You could also write a description of your expectations in the form of: "I expect the car engine to start on the event of turning the key." However, that description wouldn't qualify as a unit test. Why? Because the car is not at a sufficiently low level of granularity. In software engineering parlance, the car does not embody the [single responsibility principle][2] (SRP).

And of course, while you could also write a description of your expectation in the form of: "I expect the car, which begins its journey in Portland, to arrive in Seattle after x number of hours," that description wouldn't qualify as a unit test. Many aspects of the car's journey from Portland to Seattle could be measured, so such end-to-end descriptions should never be part of TDD.

### Simulating real conditions

In the case of a car battery, just by using a simple voltmeter, you can simulate the operational environment of a car battery. You don't have to go into the expense of providing a full-blown experience (e.g., a fully functional car, a long and treacherous trip from Portland to Seattle) to be convinced that, indeed, your car battery functions as expected.

That's the beauty of unit testing's simplicity. It's easy to simulate, easy to measure, easy to leave the exercise being convinced that everything works as expected.

So what is it that enables this magic? The answer is simple—the _absence of dependencies_. A car battery does not depend on anything related to the automobile. Nor does it depend on anything related to the road trip from Portland to Seattle. Keep in mind that as your decomposed system components become less and less dependent on other components, your solution gets more and more reliable.

### Conclusion

The art of software engineering consists of the ability to decompose complex systems into small constituent elements. Each individual element must be reduced to the smallest possible surface. Once you reach that point in your process of decomposing a system, you can quite easily focus your attention on describing your expectations about the output of each unit. You can do that by following a formalized pattern, in which you first describe the _preconditions_ (i.e., given that such-and-such values are present), the _action_ (i.e., given that such-and-such _event_ arrives), and the _outcome_ or the _post-condition_ (i.e., you expect such-and-such values to be measurable).

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/test-driven-development

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://en.wikipedia.org/wiki/Single_responsibility_principle
