[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12589-1.html)
[#]: subject: (Linux Jargon Buster: What is a Display Server in Linux? What is it Used for?)
[#]: via: (https://itsfoss.com/display-server/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Linux 黑话解释：什么是显示服务器，用来做什么？
======

![][3]

在 Linux 相关的文章、新闻和讨论中，你会经常遇到<ruby>显示服务器<rt>display server</rt></ruby>、Xorg、Wayland 等名词。

在这篇解释文章中，我将讨论 Linux 中的显示服务器。

### 什么是显示服务器？

显示服务器是一个程序，它负责协调其客户端与操作系统的其他部分之间，以及硬件和操作系统之间的输入和输出。基本上，多亏了显示服务器，你才能以图形化的方式使用你的计算机（GUI）。如果没有显示服务器，你只能局限于命令行界面（TTY）。

显示服务器提供了一个图形环境的框架，使你可以使用鼠标和键盘与应用程序进行交互。

显示服务器通过[显示服务器协议][1]（如 X11）与客户端进行通信。显示服务器是图形用户界面 —— 特别是窗口系统 —— 中的一个关键组件。

不要把显示服务器和[桌面环境][2]混淆。桌面环境的下层使用的是显示服务器。

听起来很熟悉，但又不完全清楚？让我来解释一下。

### Linux 上的显示服务器协议

Linux 中有三种显示服务器协议，分别是 X11、Wayland 和 Mir。下面我就给大家简单介绍一下这些显示服务器。

#### X11

X11（也称 X）是已经存在多年的传统显示服务器。它是 Linux 发行版中最常用的显示服务器。

![X 架构][4]

X11 通信协议，使用显示服务器 [X.org 服务器][5]。它接收来自[设备驱动程序][6]的输入事件，并将它们提供给它的一个客户端。

显示服务器也从客户端接收数据，它处理数据并进行合成，在 Linux 上，它将数据传递给三个内核组件之一：[DRM][7]、[gem][8] 或 [KMS 驱动][9]。

X.Org 服务器是一个显示服务器，它依靠第二个程序：[合成窗口管理器][10]，来进行合成。例如 [Mutter][11] 或 [KWin][12]。GNOME 使用的是 Mutter。

#### Wayland

按照其网站的说法，Wayland “旨在作为 X 的更简单的替代品，更容易开发和维护”。

而事实上 [Wayland][13] 就是现代的显示服务器，它应该取代传统的 X 显示服务器。

对它的采用还在普及中。Ubuntu 曾试图在 17.10 版本中改用 Wayland 作为默认的显示服务器，但这个尝试遭到了负面反馈。

很多 GUI 应用程序及其框架都依赖于 X 服务器。这些应用程序在 Wayland 上无法正常工作。

这迫使 Ubuntu 继续使用 X 作为默认显示服务器。它仍然提供了使用 Wayland 的选项，但不再是默认的了。

即使在今天，绝大多数的发行版都默认使用 X 显示服务器。

![Wayland 架构][14]

实施 Wayland 显示服务器协议的显示服务器，被称为 [Wayland 合成器][15]。和 X11 上的一样，Wayland 合成器负责处理其客户端的输入和输出，但同时也进行[合成][16]，这与 X11 相反。

几个 Wayland 合成器是 [Weston][17]、[Mutter][18]、[KWin][12] 或 [Enlightenment][19]。

#### Mir

[Mir 显示服务器][20]自带的 Mir 显示服务器协议，与 X11 和 Wayland 使用的协议不同。它是由 [Canonical][21] 开发的，作为 Unity 开发的一部分，打算成为 [Ubuntu][22] 的首选显示服务器。

但在 2017 年，它已经被 [Ubuntu] 桌面版的 Wayland 显示服务器所取代，不过 Mir 的开发还在继续，用于物联网（IoT）应用。

#### 为什么我们还在使用 Xorg？

Wayland 作为比较新的产品，相比 Xorg 来说，还不是很稳定。作为客户端的程序，必须知道如何与显示服务器进行通信。

因此，很多程序在使用 Wayland 时可能无法运行。Ubuntu 默认切换到 Wayland 的实验证实了这一点。

### 结束语

我希望你对 Linux 中的显示服务器概念有了更好的理解。我已经尽量不谈太多的技术细节，但我无法完全避免。

欢迎你的反馈和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/display-server/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/X_Window_System_core_protocol
[2]: https://linux.cn/article-12579-1.html
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/display-server-linux.png?resize=800%2C450&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/x-architecture-1.png?resize=800%2C507&ssl=1
[5]: https://en.wikipedia.org/wiki/X.Org_Server
[6]: https://en.wikipedia.org/wiki/Device_driver
[7]: https://en.wikipedia.org/wiki/Direct_Rendering_Manager
[8]: https://en.wikipedia.org/wiki/Graphics_Execution_Manager
[9]: https://en.wikipedia.org/wiki/KMS_driver
[10]: https://en.wikipedia.org/wiki/Compositing_window_manager
[11]: https://en.wikipedia.org/wiki/Mutter_(window_manager)
[12]: https://en.wikipedia.org/wiki/KWin
[13]: https://wayland.freedesktop.org/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/wayland-architecture-1.png?resize=800%2C500&ssl=1
[15]: https://en.wikipedia.org/wiki/Wayland_compositor
[16]: https://en.wikipedia.org/wiki/Compositing
[17]: https://en.wikipedia.org/wiki/Weston_(software)
[18]: https://en.wikipedia.org/wiki/Mutter_(software)
[19]: https://en.wikipedia.org/wiki/Enlightenment_(software)
[20]: https://mir-server.io/
[21]: https://canonical.com/
[22]: https://itsfoss.com/install-ubuntu/
