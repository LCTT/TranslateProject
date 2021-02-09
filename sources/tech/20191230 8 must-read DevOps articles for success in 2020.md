[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (8 must-read DevOps articles for success in 2020)
[#]: via: (https://opensource.com/article/19/12/devops-resources)
[#]: author: (Dawn Parzych https://opensource.com/users/dawnparzych)

8 must-read DevOps articles for success in 2020
======
Get up to speed on DevOps with our eight most popular DevOps articles
this year.
![Brick wall between two people, a developer and an operations manager][1]

I am an avid reader, but I go through periods where I'm so busy that it's hard to find the time to keep up with my reading list. Even during my busiest times, I try to stay up to date on DevOps news since it's one of my areas of focus.

Here, I've summarized key takeaways from the top eight DevOps articles Opensource.com published this year so you can increase your knowledge even if you don't have time to read all of them. Since DevOps is about **people**, **processes**, and **tools**, I've categorized the top eight articles around those themes.

### People

#### 5 essential values for the DevOps mindset

Conversations about IT problems and solutions often focus on the technology or the tools. But often, the people and processes are harder and more important to get right than the technology and tools. In [_5 essential values for the DevOps mindset_][2], Brent Aaron Reed and Willy-Peter Schaub outline the foundation for establishing the right processes and hiring the right people.

  * Create a continuous feedback loop with stakeholders (customers, business teams, partners, etc.). Ensure changes are being made for the right reasons and that they benefit all stakeholders.
  * Processes should be continuously improved. Having a repeatable framework and process is good, but look for ways to make it better.
  * Don't replace existing silos with new silos. Teamwork is essential; changing the name of a team or creating a new team does not help. You should be working to break down silos, not create new silos with new names.
  * Your primary stakeholder is the customer. Every department in the organization needs to work together to make sure the customer's needs are met.
  * Learning is infectious. When you learn something new, share it with others.



#### The case for making the transition from sysadmin to DevOps engineer

Making the leap from system administrator (sysadmin) to DevOps engineer requires shifting your mindset and learning new tools and technology. In [_The case for making the transition from sysadmin to DevOps engineer_][3], [Correspondent][4] Taz Brown covers this experience and the things you should do if you are considering taking on a DevOps engineer role.

  * Learn a scripting language like Python, Perl, Bash, or Powershell. You don't need to become an expert; learn the basics, and build up your skills over time.
  * Think strategically and consider the business impact of your day-to-day tasks.
  * Learn a programming language like Ruby, Go, or Python.
  * Understand CI/CD pipelines and how and where to automate tasks within the pipeline.
  * Become familiar with configuration and orchestration tools.
  * Learn common Git commands as well as the fundamentals of version control.



### Processes

#### Don't test in production? Test in production!

The notion of testing in production is a sticky subject, but Ann Marie Fred covers it well in [_Don't test in production? Test in production!_][5] Historically, development, test, and production systems were treated differently from the perspective of security, compliance, and risk management. The risks are much higher if data in production systems becomes corrupted than if it happens in a test environment.

There are pros and cons to testing in production. The majority of the cons boil down to risk and compliance concerns like corrupted or leaked data, unintended side effects, and overloaded systems. Many of the pros can be lumped into two categories: improving the user experience (UX) and gaining new knowledge about your architecture. Improving UX includes things like usability testing, UX research, real-user monitoring, canary testing, and regression testing. Testing in production also enables you to learn more about your environment by running A/B tests, experimenting, chaos engineering, and failover testing.

By testing in production, you gain feedback you would not otherwise get into quality, performance, availability, resiliency, user experience, and changes. Testing on real data can reveal things you would not see with mock or test data. You should test in production, but before you begin, put mechanisms in place to keep your systems safe and minimize risk.

  * Test all systems thoroughly with automated tests before you start testing in production.
  * Review the risks associated with bug hunt days and put appropriate guardrails in place from the start.
  * Follow the principles of chaos engineering: plan ahead; contain the blast radius; scale or squash.



Yes, there are risks associated with testing in production, but you can minimize them with proper safeguards.

#### 8 principles to achieve DevOps at scale

Processes are a vital aspect of a successful DevOps initiative. The most important part is building processes suited to your organization rather than copying what worked somewhere else. The guidelines Matthieu Fronton lists in [_8 principles to achieve DevOps at scale_][6] ensure you will implement strategies focused on your business needs.

  * Teams create silos. Instead of building a DevOps team, create a DevOps task force of highly skilled and diverse members. Its objective is to help other projects and departments identify slow processes, automate processes, improve performance, and ensure effectiveness.
  * Reduce overhead when collaborating and syncing on tasks. Make status updates and team availability publicly available, make work visible by putting everything in shared collaboration tools, and work on one task at a time to avoid context switching.
  * Get outside help; hire an agile coach to be your advocate.
  * Schedule regular team training on needed job skills, ranging from soft skills to how to use specific tools.
  * Empower teams to make their own decisions and learn from their mistakes.
  * Embrace uncertainty. Failures will happen, so run blameless post-mortems and determine how to improve and reduce uncertainty the next time around.
  * DevOps is about people, processes, and tools. It is not just about the technical implementation of a product.
  * Always be learning. Stay up to date on trends in the DevOps space.



#### Small scale scrum vs. large scale scrum

In [_Small scale scrum vs. large scale scrum_][7], Agnieszka Gancarczyk shares her analysis of 54 early responses to a survey on agile adoption.

  * 96% work in distributed teams, think scrum principles help them reduce development complexity, and believe agile contributes to the success of their projects.
  * The most popular length of a sprint is three weeks (62%).
  * Participants take on additional roles on their projects when needed, such as business analyst, project manager, and quality engineer. When changing roles, they lose an average of one to two hours.
  * The majority of teams don't have a definition of "ready" to ensure that user stories are actionable, testable, and clear.
  * Participants ask for help and mentoring when a task is complex.



#### Scrum vs. kanban: Which agile framework is better?

Agile is a process of iterative development and continuous feedback. While both scrum and kanban are classified as agile frameworks, they are not the same thing. In [_Scrum vs. kanban: Which agile framework is better?_][8] Taz Brown explores the differences.

Kanban is an agile framework that utilizes a visual method for managing a project's creation through set steps, and the emphasis is on continuous flow through the steps. Tasks can be color-coded to identify different types of tasks. Work-in-progress limits can be used to restrict the maximum number of work items allowed in a single stage. The goal is to see progress and bottlenecks at a glance. Any team (not just software developers) can use the kanban methodology.

The goal of scrum is to create a shippable product. Scrum involves daily standups, planning, reviews, retrospectives, and a two- to four-week cadence. Since its goal is to ship a product, scrum is primarily used by software development teams.

Choosing which methodology is best for you depends on the state of your organization, the team, the people on the team, and the end product or service.

### Tools

#### Automate user acceptance testing with your DevOps pipeline

User acceptance testing (UAT) determines whether a system satisfies user needs, business requirements, and authorized entity requirements. These tests need to be run whenever there is a new design in the application, which is why it's so valuable to automate them. In [_Automate user acceptance testing with your DevOps pipeline_][9], Daniel Oh shares how to skip manually validating test cases and automate them with Selenium.

You can build WebDriver scripts with Selenium to execute test cases programmatically, then automate them by integrating the Selenium tool with your DevOps pipeline.

#### A beginner's guide to building DevOps pipelines with open source tools

Saving the best for last, Bryant Son's [_A beginner's guide to building DevOps pipelines with open source tools_][10] is a comprehensive overview of one critical category of DevOps tooling: continuous integration/continuous deployment (CI/CD) pipelines. The CI/CD pipeline is the process of taking code and configuration from a repository and moving it to production.

Bryant describes some of the tools in a typical CI/CD pipeline.

  * A CI/CD tool like Jenkins talks to many different services and tools to configure and orchestrate them.
  * Source control management (SCM) stores code in repositories, versions code, and facilitates collaboration with project members. (CI/CD can automate checking source code in and out among team members.)
  * Build-automation tools compile and create a deployable package format from the source code.
  * A web application server is the location where an executable will be deployed so the application can be used.
  * Code testing coverage catches errors early on and ensures users are satisfied with the application. Code test frameworks help write the tests, and code-quality suggestion tools help improve the quality of the code.



### More in 2020

Opensource.com's most widely read DevOps articles of 2019 covered a diverse range of topics under the umbrella of people, processes, and tools. We appreciate these writers for sharing their knowledge, and I look forward to reading more from them in 2020.

What DevOps topics would you like us to cover in the coming months? Feel free to leave a comment or, better yet, [submit an article proposal][11].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/devops-resources

作者：[Dawn Parzych][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dawnparzych
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://opensource.com/article/19/5/values-devops-mindset
[3]: https://opensource.com/article/19/7/devops-vs-sysadmin
[4]: https://opensource.com/correspondent-program
[5]: https://opensource.com/article/19/5/dont-test-production
[6]: https://opensource.com/article/19/4/principles-achieve-devops-scale
[7]: https://opensource.com/article/19/3/small-scale-scrum-vs-large-scale-scrum
[8]: https://opensource.com/article/19/8/scrum-vs-kanban
[9]: https://opensource.com/article/19/4/devops-pipeline-acceptance-testing
[10]: https://opensource.com/article/19/4/devops-pipeline
[11]: https://opensource.com/how-submit-article
