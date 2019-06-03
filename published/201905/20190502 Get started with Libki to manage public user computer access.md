[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10880-1.html)
[#]: subject: (Get started with Libki to manage public user computer access)
[#]: via: (https://opensource.com/article/19/5/libki-computer-access)
[#]: author: (Don Watkins  https://opensource.com/users/don-watkins/users/tony-thomas)

使用 Libki 来管理公共用户访问计算机
======
> Libki 是一个跨平台的计算机预约和用时管理系统。

![](https://img.linux.net.cn/data/attachment/album/201905/20/230201d26yuo261uu6s61i.jpg)

提供公共计算机的图书馆、学校、学院和其他组织需要一种管理用户访问权限的好方法 —— 否则，就无法阻止某些人独占机器并确保每个人都有公平的用时。这是 [Libki][2] 要解决的问题。

Libki 是一个面向 Windows 和 Linux PC 的开源、跨平台的计算机预约和用时管理系统。它提供了一个基于 Web 的服务器和一个基于 Web 的管理系统，员工可以使用它来管理计算机访问，包括创建和删除用户、设置帐户用时限制、登出和禁止用户以及设置访问限制。

根据其首席开发人员 [Kyle Hall][3] 所说，Libki 主要用于 PC 用时控制，作为 Envisionware 出品的专有计算机访问控制软件的开源替代品。当用户登录 Libki 管理的计算机时，他们会有一段使用计算机的时间。时间到了之后，他们就会被登出。时间默认设置为 45 分钟，但可以使用基于 Web 的管理系统轻松调整。一些组织在登出用户之前提供 24 小时访问权限，而有的组织则使用它来跟踪使用情况而不设置用时限制。

Kyle 目前是 [ByWater Solutions][4] 的首席开发人员，该公司为图书馆提供开源软件解决方案（包括 Libki）。在职业生涯早期，他在宾夕法尼亚州的[米德维尔公共图书馆][5]担任 IT 技术时开发了 Libki。在其他员工的午休期间，偶尔会要求他关注孩子们的房间。图书馆使用纸质注册表来管理对儿童房间计算机的访问，这意味着不断的监督和检查，以确保来到那里的人能够公平地使用。

Kyle 说，“我发现这很笨拙而不便的，我想找到一个解决方案。这个解决方案需要同时是 FOSS 和跨平台的。最后，没有现有的软件适合我们的特殊需求，那就是为什么我开发了 Libki。“

或者，正如 Libki 的网站所宣称的那样，“Libki 的诞生是为了避免与青少年打交道（的麻烦），现在允许图书馆员避免与世界各地的青少年打交道（的麻烦）！”

### 易于安装和使用

我最近决定在我经常在那里做志愿者的当地的公共图书馆尝试 Libki。我按照[文档][6]在 Ubuntu 18.04 Server 中自动进行了安装，它很快就启动起来了。

我计划在我们当地的图书馆支持 Libki，但我想知道在那些没有 IT 相关经验的人或者无法构建和部署服务器的图书馆是怎样的。Kyle 说：“ByWater Solutions 可以云端托管 Libki 服务器，这使得每个人的维护和管理变得更加简单。”

Kyle 表示，ByWater 并不打算将 Libki 与其最受欢迎的产品，开源集成图书馆系统 （ILS）Koha 或其支持的任何其他[项目][7]捆绑在一起。他说： “Libki 和 Koha 是不同[类型]的软件，满足不同的需求，但它们在图书馆中确实很好地协同工作。事实上，我很早就开发了 Libki 的 SIP2 集成，因此它可以支持使用 Koha 进行单点登录。“

### 如何贡献

Libki 客户端是 GPLv3 许可，Libki 服务器是 AGPLv3 许可。Kyle 说他希望 Libki 拥有一个更加活跃和强大的社区，项目一直在寻找新人加入其[贡献者][8]。如果你想参加，请访问 [Libki 社区页面][9]并加入邮件列表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/libki-computer-access

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins/users/tony-thomas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6
[2]: https://libki.org/
[3]: https://www.linkedin.com/in/kylemhallinfo/
[4]: https://opensource.com/article/19/4/software-libraries
[5]: https://meadvillelibrary.org/
[6]: https://manual.libki.org/master/libki-manual.html#_automatic_installation
[7]: https://bywatersolutions.com/projects
[8]: https://github.com/Libki/libki-server/graphs/contributors
[9]: https://libki.org/community/
