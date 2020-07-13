[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about automation testing in CI/CD)
[#]: via: (https://opensource.com/article/20/7/automation-testing-cicd)
[#]: author: (Taz Brown https://opensource.com/users/heronthecli)

What you need to know about automation testing in CI/CD
======
Continuous integration and continuous delivery is powered by testing.
Here's how.
![Net catching 1s and 0s or data in the clouds][1]

> "If things seem under control, you're just not going fast enough." —Mario Andretti

Test automation means focusing continuously on detecting defects, errors, and bugs as early and quickly as possible in the software development process. This is done using tools that pursue quality as the highest value and are put in place to _ensure_ quality—not just pursue it.

One of the most compelling features of a continuous integration/continuous delivery (CI/CD) solution (also called a DevOps pipeline) is the opportunity to test more frequently without burdening developers or operators with more manual work. Let's talk about why that's important.

### Why automate testing in CI/CD?

Agile teams iterate faster to deliver software and customer satisfaction at higher rates, and these pressures can jeopardize quality. Global competition has created _low tolerance_ for defects while increasing pressure on agile teams for _faster iterations_ of software delivery. What's the industry solution to alleviate this pressure? [DevOps][2].

DevOps is a big idea with many definitions, but one technology that is consistently essential to DevOps success is CI/CD. Designing a continuous cycle of improvement through a pipeline of software development can lead to new opportunities for testing.

### What does this mean for testers?

For testers, this generally means they must:

  * Test earlier and more often (with automation)
  * Continue to test "real-world" workflows (automated and manual)



To be more specific, the role of testing in any form, whether it's run by the developers who write the code or designed by a team of quality assurance engineers, is to take advantage of the CI/CD infrastructure to increase quality while moving fast.

### What else do testers need to do?

To get more specific, testers are responsible for:

  * Testing new and existing software applications
  * Verifying and validating functionality by evaluating software against system requirements
  * Utilizing automated-testing tools to develop and maintain reusable automated tests
  * Collaborating with all members of the scrum team to understand the functionality being developed and the implementation's technical design to design and develop accurate, high-quality automated tests
  * Analyzing documented user requirements and creating or assisting in designing test plans for moderately to highly complex software or IT systems
  * Developing automated tests and working with the functional team to review and evaluate test scenarios
  * Collaborating with the technical team to identify the proper approach to automating tests within the development environment
  * Working with the team to understand and resolve software problems with automated tests, and responding to suggestions for modifications or enhancements
  * Participating in backlog grooming, estimation, and other agile scrum ceremonies
  * Assisting in defining standards and procedures to support testing activities and materials (e.g., scripts, configurations, utilities, tools, plans, and results)



Testing is a great deal of work, but it's an essential part of building software effectively.

### What kind of continuous testing is important?

There are many types of tests you can use. The different types aren't firm lines between disciplines; instead, they are different ways of expressing how to test. It is less important to compare the types of tests and more important to have coverage for each test type.

  * **Functional testing:** Ensures that the software has the functionality in its requirements
  * **Unit testing:** Independently tests smaller units/components of a software application to check their functionality
  * **Load testing:** Tests the performance of the software application during heavy load or usage
  * **Stress testing:** Determines the software application's breakpoint when under stress (maximum load)
  * **Integration testing:** Tests a group of components that are combined or integrated to produce an output
  * **Regression testing:** Tests the entire application's functionality when any component (no matter how small) has been modified



### Conclusion

Any software development process that includes continuous testing is on its way toward establishing a critical feedback loop to go fast and build effective software. Most importantly, the practice builds quality into the CI/CD pipeline and implies an understanding of the connection between increasing speed while reducing risk and waste in the software development lifecycle.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/automation-testing-cicd

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://opensource.com/resources/devops
