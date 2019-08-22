[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (One CI/CD pipeline per product to rule them all)
[#]: via: (https://opensource.com/article/19/7/cicd-pipeline-rule-them-all)
[#]: author: (Willy-Peter Schaub https://opensource.com/users/wpschaub/users/bclaster/users/matt-micene/users/barkerd427)

One CI/CD pipeline per product to rule them all
======
Is the idea of a unified continuous integration and delivery pipeline a
pipe dream?
![An intersection of pipes.][1]

When I joined the cloud ops team, responsible for cloud operations and engineering process streamlining, at WorkSafeBC, I shared my dream for one instrumented pipeline, with one continuous integration build and continuous deliveries for every product.

According to Lukas Klose, [flow][2] (within the context of software engineering) is "the state of when a system produces value at a steady and predictable rate." I think it is one of the greatest challenges and opportunities, especially in the complex domain of emergent solutions. Strive towards a continuous and incremental delivery model with consistent, efficient, and quality solutions, building the right things and delighting our users. Find ways to break down our systems into smaller pieces that are valuable on their own, enabling teams to deliver value incrementally. This requires a change of mindset for both business and engineering.

### Continuous integration and delivery (CI/CD) pipeline

The CI/CD pipeline is a DevOps practice for delivering code changes more often, consistently, and reliably. It enables agile teams to increase _deployment frequency_ and decrease _lead time for change_, _change-failure rate_, and _mean time to recovery_ key performance indicators (KPIs), thereby improving _quality_ and delivering _value_ faster. The only prerequisites are a solid development process, a mindset for quality and accountability for features from ideation to deprecation, and a comprehensive pipeline (as illustrated below).

![Prerequisites for a solid development process][3]

It streamlines the engineering process and products to stabilize infrastructure environments; optimize flow; and create consistent, repeatable, and automated tasks. This enables us to turn complex tasks into complicated tasks, as outlined by Dave Snowden's [Cynefin Sensemaking][4] model, reducing maintenance costs and increasing quality and reliability.

Part of streamlining our flow is to minimize waste for the [wasteful practice types][5] Muri (overloaded), Mura (variation), and Muda (waste).

  * **Muri:** avoid over-engineering, features that do not link to business value, and excessive documentation
  * **Mura:** improve approval and validation processes (e.g., security signoffs); drive the [shift-left][6] initiative to push unit testing, security vulnerability scanning, and code quality inspection; and improve risk assessment
  * **Muda:** avoid waste such as technical debt, bugs, and upfront, detailed documentation



It appears that 80% of the focus and intention is on products that provide an integrated and collaborative engineering system that can take an idea and plan, develop, test, and monitor your solutions. However, a successful transformation and engineering system is only 5% about products, 15% about process, and 80% about people.

There are many products at our disposal. For example, Azure DevOps offers rich support for continuous integration (CI), continuous delivery (CD), extensibility, and integration with open source and commercial off-the-shelve (COTS) software as a service (SaaS) solutions such as Stryker, SonarQube, WhiteSource, Jenkins, and Octopus. For engineers, it is always a temptation to focus on products, but remember that they are only 5% of our journey.

![5% about products, 15% about process, 80% about people][7]

The biggest challenge is breaking down a process based on decades of rules, regulations, and frustrating areas of comfort: "_It is how we have always done it; why change?_" 

The friction between people in development and operation results in a variety of fragmented, duplicated, and incessant integration and delivery pipelines. Development wants access to everything, to iterate continuously, to enable users, and to release continuously and fast. Operations wants to lock down everything to protect the business and users and drive quality. This inadvertently and often entails processes and governance that are hard to automate, which results in slower-than-expected release cycles.

Let us explore the pipeline with snippets from a recent whiteboard discussion.

The variation of pipelines is difficult and costly to support; the inconsistency of versioning and traceability complicates live site incidents, and continuous streamlining of the development process and pipelines is a challenge.

![Improving quality and visibility of pipelines][8]

I advocate a few principles that enable one universal pipeline per product:

  * Automate everything automatable
  * Build once
  * Maintain continuous integration and delivery
  * Maintain continuous streamlining and improvement
  * Maintain one build definition
  * Maintain one release pipeline definition
  * Scan for vulnerabilities early and often, and _fail fast_
  * Test early and often, and _fail fast_
  * Maintain traceability and observability of releases



If I poke the hornet's nest, however, the most important principle is to _keep it simple_. If you cannot explain the reason (_what_, _why_) and the process (_how_) of your pipelines, you do not understand your engineering process. Most of us are not looking for the best, ultramodern, and revolutionary pipeline—we need one that is functional, valuable, and an enabler for engineering. Tackle the 80%—the culture, people, and their mindset—first. Ask your CI/CD knights in shining armor, with their TLA (two/three-lettered acronym) symbols on their shield, to join the might of practical and empirical engineering.

### Unified pipeline

Let us walk through one of our design practice whiteboard sessions.

![CI build/CD release pipeline][9]

Define one CI/CD pipeline with one build definition per application that is used to trigger _pull-request pre-merge validation_ and _continuous integration_ builds. Generate a _release_ build with debug information and upload to the [Symbol Server][10]. ****This enables developers to debug locally and remotely in production without having to worry which build and symbols they need to load—the symbol server performs that magic for us.

![Breaking down the CI build pipeline][11]

Perform as many validations as possible in the build—_shift left_—allowing feature teams to fail fast, continuously raise the overall product quality, and include invaluable evidence for the reviewers with every pull request. Do you prefer a pull request with a gazillion commits? Or a pull request with a couple of commits and supporting evidence such as security vulnerabilities, test coverage, code quality, and [Stryker][12] mutant remnants? Personally, I vote for the latter.

![Breaking down the CD release pipeline][13]

Do not use build transformation to generate multiple, environment-specific builds. Create one build and perform release-time _transformation_, _tokenization_, and/or XML/JSON _value replacement_. In other words, _shift-right_ the environment-specific configuration.

![Shift-right the environment-specific configuration][14]

Securely store release configuration data and make it available to both Dev and Ops teams based on the level of _trust_ and _sensitivity_ of the data. Use the open source Key Manager, Azure Key Vault, AWS Key Management Service, or one of many other products—remember, there are many hammers in your toolkit!

![Dev-QA-production pipeline][15]

Use _groups_ instead of _users_ to move approver management from multiple stages across multiple pipelines to simple group membership.

![Move approver management to simple group membership][16]

Instead of duplicating pipelines to give teams access to their _areas of interest_, create one pipeline and grant access to _specific stages_ of the delivery environments.

![Pipeline with access to specific delivery stages][17]

Last, but not least, embrace pull requests to help raise insight and transparency into your codebase, improve the overall quality, collaborate, and release pre-validation builds into selected environments; e.g., the Dev environment.

Here is a more formal view of the whole whiteboard sketch.

![The full pipeline][18]

So, what are your thoughts and learnings with CI/CD pipelines? Is my dream of _one pipeline to rule them all_ a pipe dream?

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/cicd-pipeline-rule-them-all

作者：[Willy-Peter Schaub][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wpschaub/users/bclaster/users/matt-micene/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://continuingstudies.sauder.ubc.ca/courses/agile-delivery-methods/ii861
[3]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-2.png (Prerequisites for a solid development process)
[4]: https://en.wikipedia.org/wiki/Cynefin_framework
[5]: https://www.lean.org/lexicon/muda-mura-muri
[6]: https://en.wikipedia.org/wiki/Shift_left_testing
[7]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-3.png (5% about products, 15% about process, 80% about people)
[8]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-4_0.png (Improving quality and visibility of pipelines)
[9]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-5_0.png (CI build/CD release pipeline)
[10]: https://en.wikipedia.org/wiki/Microsoft_Symbol_Server
[11]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-6.png (Breaking down the CI build pipeline)
[12]: https://stryker-mutator.io/
[13]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-7.png (Breaking down the CD release pipeline)
[14]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-8.png (Shift-right the environment-specific configuration)
[15]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-9.png (Dev-QA-production pipeline)
[16]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-10.png (Move approver management to simple group membership)
[17]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-11.png (Pipeline with access to specific delivery stages)
[18]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-12.png (The full pipeline)
