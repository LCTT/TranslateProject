[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Developer happiness: What you need to know)
[#]: via: (https://opensource.com/article/19/2/developer-happiness)
[#]: author: (Bart Copeland https://opensource.com/users/bartcopeland)

Developer happiness: What you need to know
======
Developers need the tools and the freedom to code quickly, without getting bogged down by compliance and security.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_happy_sad_developer_programming.png?itok=72nkfSQ_)

A person needs the right tools for the job. There's nothing as frustrating as getting halfway through a car repair, for instance, only to discover you don't have the specialized tool you need to complete the job. The same concept applies to developers: you need the tools to do what you are best at, without disrupting your workflow with compliance and security needs, so you can produce code faster.

Over half—51%, to be specific—of developers spend only one to four hours each day programming, according to ActiveState's recent [Developer Survey 2018: Open Source Runtime Pains][1]. In other words, the majority of developers spend less than half of their time coding. According to the survey, 50% of developers say security is one of their biggest concerns, but 67% of developers choose not to add a new language when coding because of the difficulties related to corporate policies.

The result is developers have to devote time to non-coding activities like retrofitting software for security and compliance criteria checked after software and languages have been built. And they won't choose the best tool or language for the job because of corporate policies. Their satisfaction goes down and risk goes up.

So, developers aren't able to devote time to high-value work. This creates additional business risk because their time-to-market is slowed, and the organization increases tech debt by not empowering developers to decide on "the best" tech, unencumbered by corporate policy drag.

### Baking in security and compliance workflows

How can we solve this issue? One way is to integrate security and compliance workflows into the software development process in four easy steps:

#### 1\. Gather your forces

Get support from everyone involved. This is an often-forgotten but critical first step. Make sure to consider a wide range of stakeholders, including:

  * DevOps
  * Developers
  * InfoSec
  * Legal/compliance
  * IT security



Stakeholders want to understand the business benefits, so make a solid case for eliminating the security and compliance checkpoints after software builds. You can consider any (or all) of the following in building your business case: time savings, opportunity cost, and developer productivity. By integrating security and compliance workflows into the development process, you also avoid retrofitting of languages.

#### 2\. Find trustworthy sources

Next, choose the trusted sources that can be used, along with their license and security requirements. Consider including information such as:

  * Restrictions on usage based on environment or application type and version controls per language
  * Which open source components are allowable, e.g., specific packages
  * Which licenses can be used in which types of environments (e.g., research vs. production)
  * The definition of security levels, acceptable vulnerability risk levels, what risk levels trigger an action, what that action would be, and who would be responsible for its implementation



#### 3\. Incorporate security and compliance from day one

The upshot of incorporating security and compliance workflows is that it ultimately bakes security and compliance into the first line of code. It eliminates the drag of corporate policy because you're coding to spec versus having to fix things after the fact. But to do this, consider mechanisms for automatically scanning code as it's being built, along with using agentless monitoring of your runtime code. You're freeing up your time, and you'll also be able to programmatically enforce policies to ensure compliance across your entire organization.

New vulnerabilities arise, and new patches and versions become available. Consequently, security and compliance need to be considered when deploying code into production and also when running code. You need to know what, if any, code is at risk and where that code is running. So, the process for deploying and running code should include monitoring, reporting, and updating code in production.

By integrating security and compliance into your software development process from the start, you can also benefit by tracking where your code is running once deployed and be alerted of new threats as they arise. You will be able to track when your applications were vulnerable and respond with automatic enforcement of your software policies.

If your software development process has security and compliance workflows baked in, you will improve your productivity. And you'll be able to measure value through increased time spent coding; gains in security and stability; and cost- and time-savings in maintenance and discovery of security and compliance threats.

### Happiness through integration

If you don't develop and update software, your organization can't go forward. Developers are a linchpin in the success of your company, which means they need the tools and the freedom to code quickly. You can't let compliance and security needs—though they are critical—bog you down. Developers clearly worry about security, so the happy medium is to "shift left" and integrate security and compliance workflows from the start. You'll get more done, get it right the first time, and spend far less time retrofitting code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/developer-happiness

作者：[Bart Copeland][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bartcopeland
[b]: https://github.com/lujun9972
[1]: https://www.activestate.com/company/press/press-releases/activestate-developer-survey-examines-open-source-challenges/
