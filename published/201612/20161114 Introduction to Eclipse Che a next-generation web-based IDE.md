Eclipse Che：下一代基于 Web 的 IDE
============================================================
![Eclipse Che简介，下一代基于Web的IDE](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDU_OSDC_OpenClass_520x292_FINAL_JD.png?itok=ETOrrpcP "Introduction to Eclipse Che, a next-generation, web-based IDE") 

> 图片来自: opensource.com

即使对于熟练的开发人员，想要去为一个项目贡献代码，正确的安装和配置一个集成开发环境、工作区
（workspace）和构建工具，都是一个十分艰难和浪费时间的任务。[Codenvy][1] 的CEO，Tyler Jewell，也面临着这个问题。当他养好了一些小病，又处理了一些管理工作之后，试图建立一个简单的 Java 项目来找回他曾经的编程技能。经过多天的努力，Jewell 的项目依然无法工作，但这就是给予了他灵感。他想做个可以让“任何人，任何时候都可以为安装软件的项目做贡献”的东西。

正是这个想法引发了 [Eclipse Che][2] 的发展。

Eclipse Che 是一个基于 Web 的集成开发环境（IDE）和工作区。Eclipse Che 将工作区与合适的运行时软件环境（stack）捆绑在一起，全都紧密结合在一起。在这些工作空间中的项目具有运行所需的一切工具，开发人员不用做什么事情，只需要创建工作空间时选择正确的软件环境。

Eclipse Che 已经就绪的捆绑软件环境支持绝大多数现代流行语言。现在已经支持 C++、Java、Go、PHP、 Python、 .NET、Node.js、 Ruby on Rails，和 Android 开发等。软件环境库（Stack Library ）提供了多种选择，如果这样还不够，还可以选择创建一个提供自定义的环境的定制软件环境。

Eclipse Che 是一个功能齐全的 IDE，而不是一个基于 Web 的简易文本编辑器。它构建于 Orion 和 JDT 之上。支持智能感知（Intellisense）和调试，并集成了 Git 和 Subversion 版本控制软件。IDE 甚至可以由多个用户共享，进行结对编程。只需一个 Web 浏览器，开发人员就可以编写和调试他们的代码。但是，如果开发人员更喜欢使用基于桌面的 IDE，也可以使用 SSH 连接到工作空间。

Eclipse Che 底层所采用的主要技术之一是 [Linux 容器][3] - Docker。工作空间是同样是使用 Docker 构建的，安装 Eclipse Che 的本地副本只需要 Docker 和一个小脚本文件。只需在第一次运行时，第一次运行 `che.sh start` 时，就会下载和运行必需的 Docker 容器。但是，如果你觉得设置 Docker 来安装 Eclipse Che 依然太麻烦，Codenvy 还提供在线托管的方法。甚至，他们为开源项目的每个贡献者都提供了 4GB 的工作区。使用 Codenvy 的托管选项或者其它的在线托管方式，只需要提供一个 URL 给潜在贡献者，就会自动创建一个包含项目代码的工作区，所有这些只需轻轻点击一下。

除了 Codenvy 之外，Eclipse Che 的贡献者还包括微软、红帽、IBM、三星和许多其它的人或组织。很多贡献者正在致力于开发 Eclipse Che 的定制版本以用于其特定用途。例如，三星的 [Artik IDE][4] 项目用于物联网领域。基于 Web 的 IDE 可能会让一些人失业，但 Eclipse Che 提供很多的机会，并且有很多业内的大公司需要，值得一试。

* * *


如果你有兴趣了解更多关于 Eclipse Che，[CheConf 2016][5] 将会 11 月 15 日举行。 CheConf 2016 是一个在线会议，可以免费注册。会议开始于东部时间上午 11 点（UTC 时间下午 4:00），到东部时间下午 5:30（UTC 时间下午 10:30）结束。

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/11/introduction-eclipse-che

作者：[Joshua Allen Holm][a]
译者：[Vic020](http://www.vicyu.net/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
[1]:http://codenvy.com/
[2]:http://eclipse.org/che
[3]:https://opensource.com/resources/what-are-linux-containers
[4]:http://eclipse.org/che/artik
[5]:https://eclipse.org/che/checonf/
