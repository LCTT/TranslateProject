[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 open source behavior-driven development tools)
[#]: via: (https://opensource.com/article/19/2/behavior-driven-development-tools)
[#]: author: (Christine Ketterlin Fisher https://opensource.com/users/cketterlin)

3 open source behavior-driven development tools
======
Having the right motivation is as important as choosing the right tool when implementing BDD.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y)

[Behavior-driven development][1] (BDD) seems very easy. Tests are written in an easily readable format that allows for feedback from product owners, business sponsors, and developers. Those tests are living documentation for your team, so you don't need requirements. The tools are easy to use and allow you to automate your test suite. Reports are generated with each test run to document every step and show you where tests are failing.

Quick recap: Easily readable! Living documentation! Automation! Reports! What could go wrong, and why isn't everybody doing this?

### Getting started with BDD

So, you're ready to jump in and can't wait to pick the right open source tool for your team. You want it to be easy to use, automate all your tests, and provide easily understandable reports for each test run. Great, let's get started!

Except, not so fast … First, what is your motivation for trying to implement BDD on your team? If the answer is simply to automate tests, go ahead and choose any of the tools listed below because chances are you're going to see minimal success in the long run.

### My first effort

I manage a team of business analysts (BA) and quality assurance (QA) engineers, but my background is on the business analysis side. About a year ago, I attended a talk where a developer talked about the benefits of BDD. He said that he and his team had given it a try during their last project. That should have been the first red flag, but I didn't realize it at the time. You cannot simply choose to "give BDD a try." It takes planning, preparation, and forethought into what you want your team to accomplish.

However, you can try various parts of BDD without a large investment, and I eventually realized he and his team had written feature files and automated those tests using Cucumber. I also learned it was an experiment done solely by the team's developers, not the BA or QA staff, which defeats the purpose of understanding the end user's behavior.

During the talk we were encouraged to try BDD, so my test analyst and I went to our boss and said we were willing to give it a shot. And then, we didn't know what to do. We had no guidance, no plan in place, and a leadership team who just wanted to automate testing. I don't think I need to tell you how this story ended. Actually, there wasn't even an end, just a slow fizzle after a few initial attempts at writing behavioral scenarios.

### A fresh start

Fast-forward a year, and I'm at a different company with a team of my own and BDD on the brain. I knew there was value there, but I also knew it went deeper than what I had initially been sold. I spent a lot of time thinking about how BDD could make a positive impact, not only on my team, but on our entire development team. Then I read [Discovery: Explore Behaviour Using Examples][2] by Gaspar Nagy and Seb Rose, and one of the first things I learned was that automation of tests is a benefit of BDD, but it should not be the main goal. No wonder we failed!

This book changed how I viewed BDD and helped me start to fill in the pieces I had been missing. We are now on the (hopefully correct!) path to implementing BDD on our team. It involves active involvement from our product owners, business analysts, and manual and automated testers and buy-in and support from our executive leadership. We have a plan in place for our approach and our measures of success.

We are still writing requirements (don't ever let anyone tell you that these scenarios can completely replace requirements!), but we are doing so with a more critical eye and evaluating where requirements and test scenarios overlap and how we can streamline the two.

I have told the team we cannot even try to automate these tests for at least two quarters, at which point we'll evaluate and determine whether we're ready to move forward or not. Our current priorities are defining our team's standard language, practicing writing given/when/then scenarios, learning the Gherkin syntax, determining where to store these tests, and investigating how to integrate these tests into our pipeline.

### 3 BDD tools to choose

At its core, BDD is a way to help the entire team understand the end user's actions and behaviors, which will lead to more clear requirements, tests, and ultimately higher-quality applications. Before you pick your tool, do your pre-work. Think about your motivation, and understand that while the different parts and pieces of BDD are fairly simple, integrating them into your team is more challenging and needs careful thought and planning. Also, think about where your people fit in.

Every organization has different roles, and BDD should not belong solely to developers nor test automation engineers. If you don't involve the business side, you're never going to gain the full benefit of this methodology. Once you have a strategy defined and are ready to move forward with automating your BDD scenarios, there are several open source tools for you to choose from.

#### Cucumber

[Cucumber][3] is probably the most recognized tool available that supports BDD. It is widely seen as a straightforward tool to learn and is easy to get started with. Cucumber relies on test scenarios that are written in plain text and follow the given/when/then format. Each scenario is an individual test. Scenarios are grouped into features, which is comparable to a test suite. Scenarios must be written in the Gherkin syntax for Cucumber to understand and execute the scenario's steps. The human-readable steps in the scenarios are tied to the step definitions in your code through the Cucumber framework. To successfully write and automate the scenarios, you need the right mix of business knowledge and technical ability. Identify the skill sets on your team to determine who will write and maintain the scenarios and who will automate them; most likely these should be managed by different roles. Because these tests are executed from the step definitions, reporting is very robust and can show you at which exact step your test failed. Cucumber works well with a variety of browser and API automation tools.

#### JBehave

[JBehave][4] is very similar to Cucumber. Scenarios are still written in the given/when/then format and are easily understandable by the entire team. JBehave supports Gherkin but also has its own JBehave syntax that can be used. Gherkin is more universal, but either option will work as long as you are consistent in your choice. JBehave has more configuration options than Cucumber, and its reports, although very detailed, need more configuration to get feedback from each step. JBehave is a powerful tool, but because it can be more customized, it is not quite as easy to get started with. Teams need to ask themselves exactly what features they need and whether or not learning the tool's various configurations is worth the time investment.

#### Gauge

Where Cucumber and JBehave are specifically designed to work with BDD, [Gauge][5] is not. If automation is your main goal (and not the entire BDD process), it is worth a look. Gauge tests are written in Markdown, which makes them easily readable. However, without a more standard format, such as the given/when/then BDD scenarios, tests can vary widely and, depending on the author, some tests will be much more digestible for business owners than others. Gauge works with multiple languages, so the automation team can leverage what they already use. Gauge also offers reporting with screenshots to show where the tests failed.

### What are your needs?

Implementing BDD allows the team to test the users' behaviors. This can be done without automating any tests at all, but when done correctly, can result in a powerful, reusable test suite. As a team, you will need to identify exactly what your automation needs are and whether or not you are truly going to use BDD or if you would rather focus on automating tests that are written in plain text. Either way, open source tools are available for you to use and to help support your testing evolution.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/behavior-driven-development-tools

作者：[Christine Ketterlin Fisher][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cketterlin
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Behavior-driven_development
[2]: https://www.amazon.com/gp/product/1983591254/ref=dbs_a_def_rwt_bibl_vppi_i0
[3]: https://cucumber.io/
[4]: https://jbehave.org/
[5]: https://www.gauge.org/
