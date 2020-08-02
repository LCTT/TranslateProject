[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Developer happiness: What you need to know)
[#]: via: (https://opensource.com/article/19/2/developer-happiness)
[#]: author: (Bart Copeland https://opensource.com/users/bartcopeland)

开发者的福音：你必须知道的事
======
开发者需要工具和快速编程的自由，不会因为合规性和安全性使得它停滞而无法进行下去。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_happy_sad_developer_programming.png?itok=72nkfSQ_)

个人需要合适的工具来完成工作。比如说没有比修车中途才发现 你没有完成工作的专业工具更沮丧的事情了。同样的道理也适用在开发者身上：你需要工具来发挥你的最大才能，而不会因为合规性和安全性的需求打断你的工作流程，因此你可以更快速地编码。

根据ActiveState的最新研究显示，超过一半的开发人员（具体为51%），每天只需要花费1-4小时的时间进行编程[Developer Survey 2018: Open Source Runtime Pains][1]。换句话说，大多数开发人员花费不到一半的时间编程。根据调查，一半的开发人员认为安全是他们最大的担忧之一，但是由于公司政策方面的原因，67%的开发人员选择在编程时不添加新的语言。

结果是开发人员不得不投入更多的精力在非编码的活动上，例如在构建软件和语言之后检查软件的安全性和合规性标准。而且由于公司政策的原因，他们无法选择适合的开发工具或语言。他们的满意度会下降同时风险提高。

So, developers aren't able to devote time to high-value work. This creates additional business risk because their time-to-market is slowed, and the organization increases tech debt by not empowering developers to decide on "the best" tech, unencumbered by corporate policy drag.
因此，开发人员无法将时间投入在高价值的工作上。这会带来额外的商业风险，因为他们的上市时间变了慢，并且公司因为没有授权开发人员在不受公司政策影响的前提下决定最佳技术的能力而增加了技术债务。

### 固化安全性和合规性的工作流程

我们如何解决这个问题呢？一种方式是通过四个简单的步骤将有安全性和合规性的工作流程集成在软件开发中：

#### 1\. 集中你的力量

获得所有相关人员的支持,这是一个经常被遗忘但却至关重要的第一步。确保考虑到了广泛的利益相关者，包括：

  * 开发运维
  * 开发人员
  * 信息安全
  * 合法/合规
  * IT安全



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
