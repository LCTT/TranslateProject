8 款适合树莓派使用的 IDE
============================================================

![](https://i2.wp.com/opensourceforu.com/wp-content/uploads/2017/05/LEGO_brick_robot_05.jpg?resize=700%2C479)  

树莓派是一种微型的单板电脑（SBC），已经在学校的计算机科学教学中掀起了一场革命，但同样，它也给软件开发者带来了福音。目前，树莓派获得的知名度远远超出了它原本的目标市场，而且正在应用于机器人项目中。

树莓派是一个可以运行 Linux 操作系统的微型开发板计算机，由英国树莓派基金会开发，用来在英国和发展中国家促进学校的基础计算机科学教育。树莓派拥有 USB 接口，能够支持多种即插即用外围设备，比如键盘、鼠标、打印机等。它包含了一个 HDMI（高清多媒体界面）端口，可以为用户提供视频输出。信用卡大小的尺寸使得树莓派非常便携且价格便宜。仅需一个 5V 的 micro-USB 电源供电，类似于给手机用的充电器一样。

多年来，树莓派基金会已经推出了几个不同版本的树莓派产品。 第一个版本是树莓派 1B 型，随后是一个相对简单便宜的 A 型。在 2014 年，基金会推出了一个增强版本 —— 树莓派 1B+。在 2015 年，基金会推出了全新设计的版本，售价为 5 美元，命名为树莓派 Zero。

在 2016 年 2 月，树莓派 3B 型发布，这也是现在可用的主要型号。在 2017 年，基金会发布了树莓派 Zero 的新型号树莓派 Zero W （W = wireless 无线）。

在不久的将来，一个提高了技术规格的型号将会到来，为嵌入式系统发烧友、研究员、爱好者和工程师们用其开发多种功能的实时应用提供一个稳健的平台。

![][3] 

*图 1 ：树莓派*

### 树莓派是一个高效的编程设备

在给树莓派供电后，启动运行 LXDE 窗口管理器，用户会获得一个完整的基于 Debian 的 Linux 操作系统，即 Raspbian。Raspbian 操作系统为用户提供了众多自由开源的程序，涵盖了程序设计、游戏、应用以及教育方面。

树莓派的官方编程语言是 Python ，并已预装在了 Paspbian 操作系统上。结合树莓派和 Python 的集成开发环境 IDLE3 ，可以让程序员能够开发各种基于 Python 的程序。

除了 Python ，树莓派还支持多种其它语言。并且可以使用一些自由开源的 IDE （集成开发环境）。允许程序员、开发者和应用工程师在树莓派上开发程序和应用。

### 树莓派上的最佳 IDE

作为一名程序员和开发者，你需要的首先就是有一个 IDE ，这是一个集成了开发者和程序员编写、编译和测试软件所需的的基本工具的综合软件套件。IDE 包含了代码编辑器、编译或解释程序和调试器，并允许开发者通过一个图形用户界面（GUI）来访问。IDE 的主要目的之一是提供一个整合单元来统一功能设置，减少组合多个开发工具的必要配置。

IDE 的用户界面与文字处理程序相似，在工具栏提供颜色编码、源代码格式化、错误诊断、报告以及智能代码补全工具。IDE 被设计用来整合第三方版本控制库如 GitHub 或 Apache Subversion 。一些 IDE 专注于特定的编程语言，支持一个匹配该编程语言的功能集，当然也有一些是支持多种语言的。

树莓派上拥有丰富的 IDE ，为程序员提供友好界面来开发源代码、应用程序以及系统程序。

就让我们来探索最适合树莓派的 IDE 吧。

#### BlueJ

![][4] 

*图 2 ：BlueJ 的 GUI 界面*

BlueJ 是一款致力于 Java 编程语言的 IDE ，主要是为教育目的而开发的。它也支持小型的软件开发项目。BlueJ 由澳大利亚的莫纳什大学的 Michael Kolling 和 John Rosenburg 在 2000 年作为 Blue 系统的继任者而开发的，后来在 2009 年 3 月成为自由开源软件。

BlueJ 提供一种学习面向对象的编程概念的高效的方式，图形用户界面为应用程序提供像 UML 图一样的类结构。每一个像类、对象和函数调用这样基于 OOPS 的概念，都可以通过基于交互的设计来表示。

**特性：**

*   _简单的交互界面：_ 与 NetBeans 或 Eclipse 这样的专业界面相比，BlueJ 的用户界面更加简易学。使开发者可以专注于编程而不是环境。
*   _便携：_  BlueJ 支持多种平台如 Windows、Linux 以及 Mac OS X ， 可以免安装直接运行。
*   _新的创新：_ BlueJ IDE 在对象工作台、代码块和范围着色方面有着大量的创新，使新手体验到开发的乐趣。
*   _强大的技术支持：_ BlueJ 拥有一个核心功能团队来解答疑问，并且在 24 小时内为开发者的各种问题提供解决方案。

**最新版本：** 4.0.1

#### Geany IDE

![][5] 

*图 3 ： Geany IDE 的 GUI 界面*

Geany IDE 使用了 Scintilla 和 GTK+ 的集成开发环境支持，被认为是一个非常轻量级的基于 GUI 的文本编辑器。 Geany 的独特之处在于它被设计为独立于特定的桌面环境，并且仅需要较少数量的依赖包。只需要 GTK2 运行库就可以运行。Geany IDE 支持多种编程语言如 C、C++、C#、Java、HTML、PHP、Python、Perl、Ruby、Erlang 和 LaTeX 。

**特性：**

*   代码自动补全和简单的代码导航。
*   高效的语法高亮和代码折叠。
*   支持嵌入式终端仿真器，拥有高度可扩展性，可以免费下载大量功能丰富的插件。
*   简单的项目管理并支持多种文件类型，包括 C、Java、PHP、HTML、Python、Perl 等。
*   高度定制的界面，可以添加或删除设置、栏及窗口。

**最新版本：** 1.30.1

#### Adafruit WebIDE

![][6] 

*图 4 ：Adafruit WebIDE 的 GUI 界面*

Adafruit WebIDE 为树莓派用户提供一个基于 Web 的界面来执行编程功能，并且允许开发者编译多种语言的源代码如 Python、Ruby、JavaScript 等。

Adafruit IDE 允许开发者把代码放在 GIT 仓库，这样就可以通过 GitHub 在任何地方进行访问。

**特性：** 

*   可以通过 Web 浏览器的 8080 端口或 80 端口进行访问。
*   支持源代码的简单编译和运行。
*   配备一个调试器和可视器来进行正确追踪，代码导航以及测试源代码。

#### AlgoIDE

![][7] 

*图 5 ：AlgoIDE 的 GUI 界面*

AlgoIDE 结合了一个脚本语言和一个 IDE 环境，它被设计用来将编程与下一步的示例一起来运行。AlgoIDE 包含了一个强大的调试器、 实时范围管理器并且一步一步的执行代码。针对全年龄人群而设计，用来设计程序以及对算法进行大量的研究。

AlgoIDE 支持多种类型的语言如 C、C++、Python、Java、Smalltalk、Objective C、ActionScript 等。

**特性：**

*   代码自动缩进和补全。
*   高效的语法高亮和错误管理。
*   包含了一个调试器、范围管理器和动态帮助系统。
*   支持 GUI 和传统的 Logo 程序语言 Turtle 来进行源代码开发。

**最新版本：** 2016-12-08 （上次更新时间）

#### Ninja IDE

![][8] 

图 6 ：Ninja IDE 的 GUI 界面

Ninja IDE （“Ninja-IDE Is Not Just Another IDE”的缩写），由 Diego Sarmentero 、Horacio Duranm Gabriel Acosta 、Pedro Mourelle 和 Jose Rostango 设计，使用纯 Python 编写并且支持多种平台运行如 Linux 、Mac OS X 和 Windows 。Ninja IDE 被认为是一个跨平台的 IDE 软件，尤其是用来设计基于 Python 的应用程序。

Ninja IDE 是非常轻量级的，并能执行多种功能如文件处理、代码定位、跳转行、标签、代码自动缩进和编辑器缩放。除了 Python ，这款 IDE 也支持几种其他语言。

**特性：**

*   _高效的代码编辑器：_  Ninja-IDE 被认为是最有效的代码编辑器，因为它能执行多种功能如代码补全和缩进，以及助手功能。
*   _错误和 PEP8 查找器：_  高亮显示文件中的静态和 PEP8 错误。
*   _代码定位器：_  使用此功能，快速直接访问能够访问的文件。用户可以使用快捷键 “CTRL+K” 进行输入，IDE 会找到特定的文本。
*   独特的项目管理功能以及大量的插件使得具有 Ninja-IDE 高度可扩展性。

**最新版本：** 2.3

#### Lazarus IDE

![][9] 

图 7 ：Lazarus IDE 的 GUI 界面

Lazarus IDE 是由 Cliff Baeseman、Shane Miller 和 Michael A. Hess 于 1999 年 2 月 开发。它被视为是一款用于应用程序快速开发的基于 GUI 的跨平台 IDE ，使用的是 Free Pascal 编译器。Lazarus IDE 继承了 Free Pascal 的三个主要特性 —— 编译速度、执行速度和交叉编译。可以在多种操作系统上对应用程序进行交叉编译，如 Windows 、Linux 、Mac OS X 等。

这款 IDE 由 Lazarus 组件库组成。这些组件库以一个单一和带有不同的特定平台实现的统一接口的形式为开发者提供了多种配套设施。它支持“一次编写，随处编译”的原则。

**特性：**

*   强大而快速的处理各种类型的源代码，同时支持性能测试。
*   易用的 GUI ，支持组件拖拽功能。可以通过 Lazarus 包文件为 IDE 添加附加组件。
*   使用新功能加强的 Free Pascal ，可以用来开发 Android 应用。
*   高可扩展性、开放源代码并支持多种框架来编译其他语言。

**最新版本：** 1.6.4

#### Codeblock IDE

![][10] 

*图 8 ： Codeblock IDE 界面*

Codeblock IDE 是用 C++ 编写的，使用了 wxWidgets 作为 GUI 库，发布于 2005 年。它是一款自由开源、跨平台的 IDE ，支持多种类型的编译器如 GCC 、Clang 和 Visual C++ 。

Codeblock IDE 高度智能并且可以支持多种功能，如语法高亮、代码折叠、代码补全和缩进，同时也拥有一些扩展插件来进行定制。它可以在 Windows 、Mac OS X 和 Linux 操作系统上运行。

**特性：** 

*   支持多种类型的编译器如 GCC 、Visual C++ 、Borland C++ 、Watcom 、Intel C++ 等。主要针对 C++ 而设计，不过现在也支持其他的一些语言。
*   智能的调试器，允许用户通过访问本地函数符号和参数显示，用户自定义监视、调用堆栈、自定义内存转储、线程切换以及 GNU 调试接口调试程序。
*   支持多种功能用来从 Dev-C++ 、Visual C++ 等平台迁移代码。
*   使用自定义系统和 XML 扩展文件来存储信息。

**最新版本：** 16.01

#### Greenfoot IDE

![][11] 

*图 9 ： Greenfoot IDE 界面*

Greenfoot IDE 是由肯特大学的 Michael Kolling 设计。它是一款基于 Java 的跨平台 IDE ，针对中学和大学教育目的而设计。Greenfoot IDE 的功能有项目管理、代码自动补全、语法高亮并提供一个简易的 GUI 界面。

Greenfoot IDE 编程包括两个主类的子类 —— World 和 Actor 。 World 表示主要执行发生的类，Actors 是已经存在且活动于 World 中的对象。

 **特性：**

*   简单易用的 GUI ，比 BlueJ 和其他的 IDE 交互性更强。
*   易于新手和初学者上手。
*   在执行 Java 代码方面非常强大。
*   支持 GNOME/KDE/X11 图形环境。
*   其他功能包括项目管理、自动补全、语法高亮以及错误自动校正。

**最新版本：** 3.1.0

--------------------------------------------------------------------------------

作者简介：

Anand Nayyar

作者是位于印度旁遮普邦的贾朗达尔学院计算机应用与 IT 系的教授助理。他热爱开源技术、嵌入式系统、云计算、无线传感器网络以及模拟器。可以在 anand_nayyar@yahoo.co.in 联系他。

--------------------

via: http://opensourceforu.com/2017/06/top-ides-raspberry-pi/

作者：[Anand Nayyar][a]
译者：[softpaopao](https://github.com/softpaopao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensourceforu.com/author/anand-nayyar/
[1]:http://opensourceforu.com/2017/06/top-ides-raspberry-pi/#disqus_thread
[2]:http://opensourceforu.com/author/anand-nayyar/
[3]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-1-8.jpg
[4]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-2-6.jpg
[5]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-3-3.jpg
[6]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-4-3.jpg
[7]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-5-2.jpg
[8]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-6-1.jpg
[9]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-7.jpg
[10]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-8.jpg
[11]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-9.jpg
