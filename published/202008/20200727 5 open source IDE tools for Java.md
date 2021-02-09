[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12542-1.html)
[#]: subject: (5 open source IDE tools for Java)
[#]: via: (https://opensource.com/article/20/7/ide-java)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

5 个开源的 Java IDE 工具
======

> Java IDE 工具提供了大量的方法来根据你的独特需求和偏好创建一个编程环境。

![](https://img.linux.net.cn/data/attachment/album/202008/22/235441wnnorcvo4olasv8o.jpg)

通过简化程序员的工作，[Java][2] 框架可以使他们的生活更加轻松。这些框架是为了在各种服务器环境上运行各种应用程序而设计开发的；这包括解析注解、扫描描述符、加载配置以及在 Java 虚拟机（JVM）上启动实际的服务等方面的动态行为。控制这么多的任务需要更多的代码，这就很难降低内存占用、加快新应用的启动时间。无论如何，据 [TIOBE 指数][3]，在当今使用的编程语言中 Java 一直排名前三，拥有着 700 万到 1000 万开发者的社区。

有这么多用 Java 编写的代码，这意味着有一些很好的集成开发环境（IDE）可供选择，可以为开发人员提供有效地编写、整理、测试和运行 Java 应用程序所需的所有工具。

下面，我将按字母顺序介绍五个我最喜欢的用于编写 Java 的开源 IDE 工具，以及如何配置它们的基本功能。

### BlueJ

[BlueJ][4] 为 Java 初学者提供了一个集成的教育性 Java 开发环境。它也可以使用 Java 开发工具包（JDK）开发小型软件。各种版本和操作系统的安装方式都可以在[这里][5]找到。

在笔记本电脑上安装 BlueJ IDE 后，启动一个新项目，点击<ruby>项目<rt>Project</rt></ruby>菜单中的<ruby>新项目<rt>New Project</rt></ruby>，然后从创建一个<ruby>新类<rt>New Class</rt></ruby>开始编写 Java 代码。生成的示例方法和骨架代码如下所示：

![BlueJ IDE screenshot][6]

BlueJ 不仅为学校的 Java 编程课的教学提供了一个交互式的图形用户界面（GUI），而且可以让开发人员在不编译源代码的情况下调用函数（即对象、方法、参数）。

### Eclipse

[Eclipse][7] 是桌面计算机上最著名的 Java IDE 之一，它支持 C/C++、JavaScript 和 PHP 等多种编程语言。它还允许开发者从 Eclipse 市场中的添加无穷无尽的扩展，以获得更多的开发便利。[Eclipse 基金会][8]提供了一个名为 [Eclipse Che][9] 的 Web IDE，供 DevOps 团队在多个云平台上用托管的工作空间创建出一个敏捷软件开发环境。

[可以在这里下载][10]；然后你可以创建一个新的项目或从本地目录导入一个现有的项目。在[本文][11]中找到更多 Java 开发技巧。

![Eclipse IDE screenshot][12]

### IntelliJ IDEA

[IntelliJ IDEA CE（社区版）][13]是 IntelliJ IDEA 的开源版本，为 Java、Groovy、Kotlin、Rust、Scala 等多种编程语言提供了 IDE。IntelliJ IDEA CE 在有经验的开发人员中也非常受欢迎，可以用它来对现有源码进行重构、代码检查、使用 JUnit 或 TestNG 构建测试用例，以及使用 Maven 或 Ant 构建代码。可在[这里][14]下载它。

IntelliJ IDEA CE 带有一些独特的功能；我特别喜欢它的 API 测试器。例如，如果你用 Java 框架实现了一个 REST API，IntelliJ IDEA CE 允许你通过 Swing GUI 设计器来测试 API 的功能。

![IntelliJ IDEA screenshot][15]

IntelliJ IDEA CE 是开源的，但其背后的公司也提供了一个商业的终极版。可以在[这里][16]找到社区版和终极版之间的更多差异。

### Netbeans IDE

[NetBeans IDE][17] 是一个 Java 的集成开发环境，它允许开发人员利用 HTML5、JavaScript 和 CSS 等支持的 Web 技术为独立、移动和网络架构制作模块化应用程序。NetBeans IDE 允许开发人员就如何高效管理项目、工具和数据设置多个视图，并帮助他们在新开发人员加入项目时使用 Git 集成进行软件协作开发。

[这里][18]下载的二进制文件支持 Windows、macOS、Linux 等多个平台。在本地环境中安装了 IDE 工具后，新建项目向导可以帮助你创建一个新项目。例如，向导会生成骨架代码（有部分需要填写，如 `// TODO 代码应用逻辑在此`），然后你可以添加自己的应用代码。

### VSCodium

[VSCodium][19] 是一个轻量级、自由的源代码编辑器，允许开发者在 Windows、macOS、Linux 等各种操作系统平台上安装，是基于 [Visual Studio Code][20] 的开源替代品。其也是为支持包括 Java、C++、C#、PHP、Go、Python、.NET 在内的多种编程语言的丰富生态系统而设计开发的。Visual Studio Code 默认提供了调试、智能代码完成、语法高亮和代码重构功能，以提高开发的代码质量。

在其[资源库][21]中有很多下载项。当你运行 Visual Studio Code 时，你可以通过点击左侧活动栏中的“扩展”图标或按下 `Ctrl+Shift+X` 键来添加新的功能和主题。例如，当你在搜索框中输入 “quarkus” 时，就会出现 Visual Studio Code 的 Quarkus 工具，该扩展允许你[在 VS Code 中使用 Quarkus 编写 Java][22]：

![VSCodium IDE screenshot][23]

### 总结

Java 作为最广泛使用的编程语言和环境之一，这五种只是 Java 开发者可以使用的各种开源 IDE 工具的一小部分。可能很难知道哪一个是正确的选择。和以往一样，这取决于你的具体需求和目标 —— 你想实现什么样的工作负载（Web、移动应用、消息传递、数据交易），以及你将使用 IDE 扩展功能部署什么样的运行时（本地、云、Kubernetes、无服务器）。虽然丰富的选择可能会让人不知所措，但这也意味着你可能可以找到一个适合你的特殊情况和偏好的选择。

你有喜欢的开源 Java IDE 吗？请在评论中分享吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/ide-java

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/resources/java
[3]: https://www.tiobe.com/tiobe-index/
[4]: https://www.bluej.org/about.html
[5]: https://www.bluej.org/versions.html
[6]: https://opensource.com/sites/default/files/uploads/5_open_source_ide_tools_to_write_java_and_how_you_begin_it.png (BlueJ IDE screenshot)
[7]: https://www.eclipse.org/ide/
[8]: https://www.eclipse.org/
[9]: https://opensource.com/article/19/10/cloud-ide-che
[10]: https://www.eclipse.org/downloads/
[11]: https://opensource.com/article/19/10/java-basics
[12]: https://opensource.com/sites/default/files/uploads/os_ide_2.png (Eclipse IDE screenshot)
[13]: https://www.jetbrains.com/idea/
[14]: https://www.jetbrains.org/display/IJOS/Download
[15]: https://opensource.com/sites/default/files/uploads/os_ide_3.png (IntelliJ IDEA screenshot)
[16]: https://www.jetbrains.com/idea/features/editions_comparison_matrix.html
[17]: https://netbeans.org/
[18]: https://netbeans.org/downloads/8.2/rc/
[19]: https://vscodium.com/
[20]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[21]: https://github.com/VSCodium/vscodium#downloadinstall
[22]: https://opensource.com/article/20/4/java-quarkus-vs-code
[23]: https://opensource.com/sites/default/files/uploads/os_ide_5.png (VSCodium IDE screenshot)
