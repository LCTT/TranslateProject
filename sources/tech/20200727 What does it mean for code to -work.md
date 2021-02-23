[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What does it mean for code to "work"?)
[#]: via: (https://opensource.com/article/20/7/code-tdd)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

What does it mean for code to "work"?
======
Test driven development (TDD) separates computing results from actions
to ensure your code does what you expect.
![Searching for code][1]

Extreme Programming co-founder [Ron Jeffries][2] famously wrote: "The trick is never to let the code not be working."

Jeffries' quote points at the fact that software engineering is a very sophisticated activity with plenty of uncertainty. Software engineering also deals with issues of incompleteness—at the outset, you never seem to have all information you need to formulate an optimal approach. There always comes a time, later in the project, when you learn something that shows that several things in your initial understanding were incorrect. In addition, even when you amass sufficient useful information to orient yourself properly, that information tends to contain ambiguity—communication is seldom, if ever, clear. Ambiguity seems to prevail in both verbal and written communication.

Because of these constraints, the only safe way to proceed when developing software is to rely on the working code. The running, working code is the final oracle. It will tell you if you're doing the right thing and going in the right direction.

### How do you know if the code is working?

It is impossible to know if your code is working as designed if the code isn't running. To have code that compiles without errors and always runs without exceptions doesn't mean that the code is working. It could be doing all these activities while doing nothing of use. Therefore, the definition of working code is that it runs without any problems while doing something you expect it to do.

The only way to find out if your code is working according to expectations is to focus on observable behavior. Merely reading and analyzing the source code is not sufficiently convincing; you need to see the code executing to judge whether its execution meets your expectations.

There are two ways to measure observable behavior:

  1. Watch the computer that is running your code perform some actions
  2. Test the running code for the computed values



The first type of observable behavior (observing some actions being performed) is not the best way to ensure that your code works according to expectations. For example, you may observe that your code performed an action, such as sending an email. But that alone is not sufficient to confirm the code works according to expectations. What if the email the code is sending contains incorrect information?

The only way to confirm that your code is working according to expectations is to observe the computed values. And that process (i.e., observing the computed values to see if they match the expected values) is where test-driven development (TDD) shines.

### How does it feel to write software if the code is not working?

Before I discovered TDD, I was spending long stretches of time writing code without worrying about whether the code was working or not. Every now and then, when I felt I had reached a milestone in coding, I would run the application I was working on. I'd log in as a fictitious user and manually trigger some actions to see if the program did what I told it to do.

This approach is similar to measuring an iceberg by just gauging its tip—the part of the iceberg visible above the water. Although my manual testing provided a clean bill of health for the app, naturally, once it went into production, all kinds of bugs and defects started showing up (caused by the "below-the-waterline" part of the iceberg).

Looking back, it is obvious that writing code without making it work all the time is similar to flying a kite. Flying a kite in a strong wind is exciting, even exhilarating. But the kite almost never touches the ground, and it is very challenging to control its direction in the strong wind. Also, it is almost impossible to land the kite at the exact spot you aim for.

### How does it feel to write software when doing TDD?

TDD is based on the idea that the way the code behaves should be independent from the way the code is structured. You are aiming at a desired behavior. While you're writing code, the desired behavior is not there (that's why it is called "desired"). You implement the desired behavior by first writing a test that describes it. Then you run that test, and it fails because the expected behavior is not implemented yet. The failure prompts you to fix it, which forces you to run the code again. If the changes you make to the code satisfy the expectations described in the test, you conclude that the code works according to your expectations.

If the changes you make to the code do not satisfy the expectations described in the test, the code does not work, and you need to make more changes to the code until it works as expected.

This process, when done consistently, feels like riding a galloping horse. Every now and then, a galloping horse touches the ground, which is equivalent to the moment when all tests pass in TDD. While the horse is "in flight," it is charging in a straight line. The horse is advancing, but there is no way to change its course. Only when the horse touches the ground does the horse rider get a chance to change the direction they're heading.

Similarly, when writing code, you are "in flight." While you're coding, you have no way of verifying if you're going in the right direction. It is only when you stop coding, save your changes, and run the code that you can observe if your code is doing what you expect it to do. You are touching the ground each time you run your code.

TDD is the discipline that guides you toward performing this reality check as often as possible. This minimizes your risk of shipping incorrect code.

### You are the first customer of your application code

Since you're writing a test that automates your expectations, you are the first customer of the application code. Actually, it's better to say that _your test_ is the first customer of your code. The test could be viewed as a customer who walks into a restaurant, and being hungry, orders a meal. When the customer orders, she has a specific meal in mind. The kitchen staff's job is to turn that customer's desire into reality.

If the waiter delivers the meal and, after tasting it, the customer disagrees that the meal meets her expectations, she returns it to the kitchen. The staff modifies the meal until the customer is satisfied. But kitchen staff will never know if the meal is good unless they collect feedback from the customer.

In a similar fashion, the only way to know if the code you're writing satisfies expectations is by collecting feedback from the test.

### Conclusion

The only way to know if the changes you are making to the code are advancing your app in the right direction is by making the code work. Mere review of the code, the act of reading the code, is never sufficient to reach a solid conclusion that the code is correct.

Most developers prefer writing code in long stretches. But spending hours writing code means you're wasting hours not making the code work (recall Ron Jeffries' advice "The trick is never to let the code not be working"). You're letting the code not be working if you indulge in long code-writing sessions.

TDD helps control that by focusing your attention on observable behavior. In TDD, you define expected values and continue interrogating your code to see if it computes those expected values. To confirm or refute the expectations, you must make the code work. The more often you do these "reality checks," the higher the probability that your efforts are going in the right direction.

The transition from a stable, steady state (being ready) to the next stable, steady state (being ready again), should be as short as possible. TDD strives to help you always travel in a ready-to-ready fashion.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/code-tdd

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://en.wikipedia.org/wiki/Ron_Jeffries
