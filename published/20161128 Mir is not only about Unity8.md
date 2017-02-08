Mir 并不只是 Unity 8
============================================================

![mir](https://insights.ubuntu.com/wp-content/uploads/2cf2/MIR.png) 

_这是一篇来自 Canonical 的软件工程师 Alan Griffiths 的一篇游客文章。如果你也想投稿，请联系 ubuntu-devices@canonical.com_

Mir 是一个计算机显示的管理应用的支持项目。它可以与当前 Ubuntu 桌面（及很多其他桌面）上使用的、我们更熟悉的 X-Window 相比较。我下面会讨论 Mir 的一些动机，但本篇的目的是澄清 Mir 和 Unity 8 之间的关系。

大多数时候你听说 Mir 时都会提到 Unity 8。这并不奇怪，因为 Unity 8 是 Canonical 新的用户界面 shell，用户会一直与它交互。 Mir “只”使这成为可能。Unity 8 目前用于手机和平板电脑，也可以在 Ubuntu 16.10 桌面上“预览”它。

在这里我想解释一下，可以不用 Unity 8 也可以使用 Mir。要么作为替代 shell，要么作为嵌入式环境的更简单的界面：信息亭，电子标牌等。Mir “抽象层”证明了这一点，它提供了三个重要的元素：

1. libmiral.so - Mir 的稳定接口，提供基本的窗口管理；
2. miral-shell - 一个提供“传统”和“平铺”窗口管理的示例 shell；
3. miral-kiosk - 一个仅提供基本窗口管理的示例“信息亭”。

miral-shell 和 miral-kiosk 示例服务器可从 zesty 的归档文件中获得，Kevin Gunn 已经在“Voices”上写了一篇基于 miral-kiosk 的“信息亭”的概览的[博文][1]。我将在下面给出更多关于使用这些例子的细节，但在[我的“voices”博客][2]上有更多（包括“如何”开发自己的替代 Mir 服务器）。

### 使用 MIR

Mir 是一套编程库，而不是独立的程序。这意味着这需要程序去调用它实现相应的功能。有两种方式去使用 Mir 库：编写程序的时候作为“客户端”，或者在实现 shell 时作为“服务端”。客户端（和 X11 一起）典型是使用工具库，而不是直接使用 Mir（或者 X11）。

GTK、Qt 和 SDL2 中有对 Mir 的支持。当在那些工具库中启用对它的支持时（默认在 Ubuntu 中启用支持），意味着使用这些工具的程序应该“可以工作”于 Mir 中。除此之外还有一个 Xmir：一个运行于 Mir 的 X11 服务器，这允许基于 X 的服务运行在 Mir 服务端上。

但是开始之前 Mir 客户端需要一个相匹配的 Mir 服务端。在最后一个开发周期中，Mir 团队在演示中将 MirAL 作为编写 Mir 服务端的推荐方法，并推出了一个“miral-examples”包。在 Ubuntu 的开发版本 zesty 中，你可以从归档中安装它：

```
$ sudo apt install miral-examples mir-graphics-drivers-desktop qtubuntu-desktop
```

_对于其他平台，你需要自己构建 MirAL（有关详细信息，请参阅 Mir 桌面环境示例）。_

miral-examples 安装后你可以在 Unity 7 中以窗口的方式运行一个 Mir 服务端，然后在里面运行一个客户端（比如 gedit）：

```
$ miral-shell&
$ miral-run gedit
```

这会给你一个（非常基础的）“传统” 的桌面窗口管理。另外你可以试下“平铺”窗口管理器：

```
$ miral-shell --window-manager tiling&
$ miral-run qterminal
```

或者（甚至更基础的）信息亭界面：

```
$ miral-kiosk&
$ miral-run 7kaa
```

这些 Mir 服务端都不会提供带有“启动器”、通知等的完整“桌面”。但是它们演示了不使用 Unity 8 使用 Mir 的可能。

### MIR 解决的问题

X-Window 系统已经是，并且仍然是，提供了一种与计算机的交互的非常成功的方式。它提供了广泛的硬件和驱动程序一致的抽象。它支持许多桌面环境和图形用户界面工具包，并可以让它们在大量计算机上一起工作。

但它来自一个与当前电脑使用方式非常不同的时代，现在有一些问题是很难满足的，因为它需要支持老旧的系统。

在 1980 年，大多数计算机是由专家管理的大型事物，将它们连接在一起“是非常困难的”。在那个时代，开发软件的成本是这样的，一个程序“监听”另一个程序获得的好处是可以忽略不计的：此时几乎没有计算机，同时它们是独立的，它们所有的工作和金融无关。

X-Window 开发于这种环境下，通过一系列扩展，它已经适应了许多变化。但它本质上是不安全的：任何应用程序可以知道显示了什么（并影响它）。你可以编写像 Xeyes（用“眼睛”跟踪光标）或“Tickeys”（通过键盘来生成打字机噪声）等应用程序。现实是，任何应用程序可以跟踪和操纵几乎所有的事情。这就是基于 X 的桌面如 Unity 7、Gnome、KDE及其它桌面工作的方式。

X-Window 中的窗口管理的开放性质不适合用于具有数百万计算机连接到因特网的世界，它们用于信用卡交易和网上银行，且由非专家管理，并自愿安装来自陌生人的程序。人们越来越意识到让 X-Window 适应新的安全性和图形性能的要求是不可行的。

现在至少有两个开源项目旨在提供一个替代品：Mir 和 Wayland。虽然有些人认为两者是竞争关系，但在很多领域，它们有共同的利益：它们都需要与那些之前假定使用 X11 的其它软件交互，并且许多引入支持的工作对两者都有益。

Canonical 的 X-Window 替换品 Mir，它只将信息暴露给它需要的应用程序（因此没有按键监听或光标跟踪）。它可以满足当前时代的需求，并可以利用现代硬件，如图形处理器。

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2016/11/28/mir-is-not-only-about-unity8/

作者：[Guest][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/guest/
[1]:http://voices.canonical.com/kevin.gunn/
[2]:http://voices.canonical.com/alan.griffiths/
