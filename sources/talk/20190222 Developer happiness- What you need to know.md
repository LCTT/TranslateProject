[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Developer happiness: What you need to know)
[#]: via: (https://opensource.com/article/19/2/developer-happiness)
[#]: author: (Bart Copeland https://opensource.com/users/bartcopeland)

Developer happiness: What you need to know
开发者的福音，你需要了解的东西
======
Developers need the tools and the freedom to code quickly, without getting bogged down by compliance and security.
开发者需要工具和自由进行快速编辑，通过遵守规则和安全事项使得它毫无停滞的进行下去。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_happy_sad_developer_programming.png?itok=72nkfSQ_)

A person needs the right tools for the job. There's nothing as frustrating as getting halfway through a car repair, for instance, only to discover you don't have the specialized tool you need to complete the job. The same concept applies to developers: you need the tools to do what you are best at, without disrupting your workflow with compliance and security needs, so you can produce code faster.
对于工作个人都需要正确的工具。不像中途路过一个汽车修理站那般沮丧，例如，只发现你没有完成工作的特殊工具。同样的道理也应用在开发者身上：你需要工具来做一些你最擅长的事情，而不会被遵守规则和安全事项的需求打乱你的工作流程，因此你可以快速的写代码。

Over half—51%, to be specific—of developers spend only one to four hours each day programming, according to ActiveState's recent [Developer Survey 2018: Open Source Runtime Pains][1]. In other words, the majority of developers spend less than half of their time coding. According to the survey, 50% of developers say security is one of their biggest concerns, but 67% of developers choose not to add a new language when coding because of the difficulties related to corporate policies.
超过一半-51%，成为专项开发者每天只需要花费15分钟进行编程，根据

The result is developers have to devote time to non-coding activities like retrofitting software for security and compliance criteria checked after software and languages have been built. And they won't choose the best tool or language for the job because of corporate policies. Their satisfaction goes down and risk goes up.

So, developers aren't able to devote time to high-value work. This creates additional business risk because their time-to-market is slowed, and the organization increases tech debt by not empowering developers to decide on "the best" tech, unencumbered by corporate policy drag.

### Baking in security and compliance workflows
固化安全性和合规性地工作流程

How can we solve this issue? One way is to integrate security and compliance workflows into the software development process in four easy steps:
我们如何解决这个问题呢？一种方式是集安全性和合规性于一身的工作流程，在软件开发过程中分为四个简单的步骤：

#### 1\. Gather your forces
集合你的力量

Get support from everyone involved. This is an often-forgotten but critical first step. Make sure to consider a wide range of stakeholders, including:
从每个相关的人员处获取支持,这是经常被遗忘但却是至关重要的第一步。确保考虑到了所有范围内的相关人员，包括：

  * DevOps
  * Developers
  * InfoSec
  * Legal/compliance
  * IT security
  *开发运维
  *开发人员
  *信息安全
  *合法/合规
  *IT安全



Stakeholders want to understand the business benefits, so make a solid case for eliminating the security and compliance checkpoints after software builds. You can consider any (or all) of the following in building your business case: time savings, opportunity cost, and developer productivity. By integrating security and compliance workflows into the development process, you also avoid retrofitting of languages.
利益相关者想要理解商业利益，为消除软件构建后的安全和合规的检查站，因此要做一个坚固的外壳。你可以在构建你的商业案例中考虑以下几点种的任何一个（或者全部）：节省时间，机会成本和开发人员生产力。在开发处理中，你也可以通过集中安全和和合规的工作流程避免语言的改造。

#### 2\. Find trustworthy sources
寻找值得信赖的资源

Next, choose the trusted sources that can be used, along with their license and security requirements. Consider including information such as:
接下来，选择可以使用的,有着他们自己许可证和安全要求的可靠资源。考虑到如下相关信息：

  * Restrictions on usage based on environment or application type and version controls per language
  * Which open source components are allowable, e.g., specific packages
  * Which licenses can be used in which types of environments (e.g., research vs. production)
  * The definition of security levels, acceptable vulnerability risk levels, what risk levels trigger an action, what that action would be, and who would be responsible for its implementation

*限制用法基于环境或应用类型和版本


#### 3\. Incorporate security and compliance from day one
从第一天开始合并安全和合规性

The upshot of incorporating security and compliance workflows is that it ultimately bakes security and compliance into the first line of code. It eliminates the drag of corporate policy because you're coding to spec versus having to fix things after the fact. But to do this, consider mechanisms for automatically scanning code as it's being built, along with using agentless monitoring of your runtime code. You're freeing up your time, and you'll also be able to programmatically enforce policies to ensure compliance across your entire organization.
合并安全和合规工作流程的结果是最终它被烤成代码中的第一行安全和合规。它消除了公司政策的麻烦，因为您是按照规范进行编码，而不是事后必须解决问题。但为了实现这个，考虑到自动浏览代码的机制在它建立时，随着你的运行代码的使用的无代理监控。你解放你的时间，并且你也能以编程的方式执行政策来确保贯穿你整个组织的合规性。 

New vulnerabilities arise, and new patches and versions become available. Consequently, security and compliance need to be considered when deploying code into production and also when running code. You need to know what, if any, code is at risk and where that code is running. So, the process for deploying and running code should include monitoring, reporting, and updating code in production.
新的脆弱性在提高，并且新的补丁和版本变得有用。所以，安全和合规性需要被考虑当在产品中部署代码时同时也包括在运行代码时。你需要知道的是，如果有的话，代码和它在哪运行都有一定的风险。所以，部署和运行代码的过程应该包括生产的监控，记录和更新。

By integrating security and compliance into your software development process from the start, you can also benefit by tracking where your code is running once deployed and be alerted of new threats as they arise. You will be able to track when your applications were vulnerable and respond with automatic enforcement of your software policies.
通过一开始在你的软件开发过程中集成安全和合规性，一旦你的代码被部署你就能追踪代码在哪运行并由此受益和注意新的威胁以他们出现。你也能追踪当你的应用程序很脆弱和回应自动强制执行你的软件政策

If your software development process has security and compliance workflows baked in, you will improve your productivity. And you'll be able to measure value through increased time spent coding; gains in security and stability; and cost- and time-savings in maintenance and discovery of security and compliance threats.
如果你的软件开发过程中已经固化了安全和合规的工作流程，你将会提高你的生产率。你也能衡量价值 通过增加花费在编码上的时间；获得安全性和稳定性；在维护中的花销节省和时间节省以及安全性和合规性威胁的发现。

### Happiness through integration
集成所带来的幸福

If you don't develop and update software, your organization can't go forward. Developers are a linchpin in the success of your company, which means they need the tools and the freedom to code quickly. You can't let compliance and security needs—though they are critical—bog you down. Developers clearly worry about security, so the happy medium is to "shift left" and integrate security and compliance workflows from the start. You'll get more done, get it right the first time, and spend far less time retrofitting code.
如果你不想开发和更新软件，你的组织无法前进。开发者是一个关键在你团体的成功中，这意味着他们需要工具和自由来快速地进行编码。尽管合规性和安全性至关重要，你不能让他们停滞下来。显而易见，开发人员担心安全问题，因此高兴的方法就是“左移”并且从一开始就集成安全性和合规性。你将完成更多，第一次正确地修正它，并且远远少于正常地时间去加装它。

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
