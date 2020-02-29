[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automating unit tests in test-driven development)
[#]: via: (https://opensource.com/article/20/2/automate-unit-tests)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Automating unit tests in test-driven development
======
What unit tests have in common with carpentry.
![gears and lightbulb to represent innovation][1]

DevOps is a software engineering discipline focused on minimizing the lead time to achieve a desired business impact. While business stakeholders and sponsors have ideas on how to optimize business operations, those ideas need to be validated in the field. This means business automation (i.e., software products) must be placed in front of end users and paying customers. Only then will the business confirm whether the initial idea for improvement was fruitful or not.

Software engineering is a budding discipline, and it can get difficult to ship products that are defect-free. For that reason, DevOps resorts to maximizing automation. Any repeatable chore, such as testing implemented changes to the source code, should be automated by DevOps engineers.

This article looks at how to automate unit tests. These tests are focused on what I like to call "programming in the small." Much more important test automation (the so-called "programming in the large") must use a different discipline—integration testing. But that's a topic for another article.

### What is a unit?

When I'm teaching approaches to unit testing, often, my students cannot clearly determine what a testable unit is. Which is to say, the granularity of the processing is not always clear.

I like to point out that the easiest way to spot a valid unit is to think of it as a _unit of behavior_. For example (albeit a trivial one), when an authenticated customer begins online shopping, the unit of behavior is a cart that has zero items in it. Once we all agree that an empty shopping cart has zero items in it, we can focus on automating the unit test that will ensure that such a shopping cart always returns zero items.

### What is not a unit?

Any processing that involves more than a single behavior should not be viewed as a unit. For example, if shopping cart processing results in tallying up the number of items in the cart AND calculating the order total AND calculating sales tax AND calculating the suggested shipping method, that behavior is not a good candidate for unit testing. Such behavior is a good candidate for integration testing.

### When to write a unit test

There is a lot of debate about when to write a unit test. Received wisdom states that once the code has been written, it is a good idea to write automated scripts that will assert whether the implemented unit of behavior delivers functionality as expected. Not only does such a unit test (or a few unit tests) document the expected behavior, the collection of all unit tests ensures that future changes will not degrade quality. If a future change adversely affects the already implemented behavior, one or more unit tests will complain, which will alert developers that regression has occurred.

There is another way to look at software engineering. It is based on the traditional adage "measure twice, cut once." In that light, writing code before writing tests would be equivalent to cutting a part of some product (say, a chair leg) and measuring it only after it's cut. If the craftsperson doing the cutting is very skilled, that approach may work (kind of). But more likely than not, the chair legs cut this way would end up with unequal lengths. So, it is advisable to measure before cutting. What that means for the practice of software engineering is that the measurements are expressed in the unit tests. Once we measure the required values, we create a blueprint (a unit test). That blueprint is then used to guide the cutting of the code.

Common sense would suggest that it is more reasonable to measure first and, only then, do the cutting. According to that line of reasoning, writing unit tests before writing code is a recommended way to do proper software engineering. Technically speaking, this "measure twice, cut once" approach is called a "test-first" approach. The opposite approach, where we write the code first, is called "test-later." The test-first approach is the approach advocated by [test-driven development][2] (TDD) methodology. Writing tests later is called test-later development (TLD).

### Why is TLD harmful?

Cutting before measuring is not recommended. Even the most talented craftspeople will eventually make mistakes by cutting without doing so. A lack of measurement will eventually catch up with even the most experienced of us as we continue in our craft. So it's best to produce a blueprint (i.e., measurements) before cutting.

But that's not the only reason why the TLD approach is considered harmful. When we write code, we're simultaneously considering two separate concerns: the expected behavior of the code and the optimal structure of the code. These two concerns are very dissimilar. That fact makes it very challenging to do a proper job satisfying the expectations regarding both the desired behavior and the optimal (or at the very least, decent) code structure.

The TDD approach solves this conundrum by focusing undivided attention first on the expected desired behavior. We start by writing the unit test. In that test, we focus on _what_ we expect to happen. At this point, we don't care, in the least, _how_ the expected behavior is going to materialize.

Once we're done describing the _what_ (i.e., what manifest behavior are we expecting from the unit we are about to build?), we watch that expectation fail. It fails because the code that is concerned with _how_ the expected behavior is going to happen hasn't materialized yet. Now we are compelled to write the code that's going to take care of the _how_.

After we write the code responsible for how, we run the unit test(s) and see if the code we just wrote fulfills the expected behavior. If it does, we're done. Time to move on to fulfilling the next expectation. If it doesn't, we continue transforming the code until it succeeds in passing the test.

If we choose not to do TDD, but write code first and later write the unit test, we miss the opportunity to separate _what_ from _how_. In other words, we write the code while simultaneously taking care of what we expect the code to do _and_ how to structure the code to do it correctly.

As such, writing unit tests after we write code is considered harmful.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/automate-unit-tests

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://opensource.com/article/20/1/test-driven-development
