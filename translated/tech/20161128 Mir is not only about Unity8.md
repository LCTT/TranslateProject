Mir 并不只关于Unity8
============================================================

 ![mir](https://insights.ubuntu.com/wp-content/uploads/2cf2/MIR.png) 

_这是一篇来自 Canonical 的软件工程师 Alan Griffiths 的一篇游客文章。如果你也想投稿，请联系 ubuntu-devices@canonical.com_

Mir 是管理程序显示的项目。它可以与当前 Ubuntu 桌面（及很多其他）上使用的我们更熟悉的X-Windows进行比较。我下面会讨论使用 Mir 的一些动机，但本篇的目的是澄清 Mir 和 Unity8 之间的关系。

大多数时候你听说 Mir 时都会提到 Unity8。这并不奇怪，因为 Unity8 是 Canonical 的用户shell，用户会一直与它交互。 Mir “只”使这成为可能。Unity8 目前用于手机和平板电脑，也可作为 Ubuntu 16.10 桌面上的“预览”。

在这里我想解释一下使用 Mir 是可以使用Unity8 的。或者作为替代 shell，或者作为嵌入式环境的更简单的接口：信息窗口，电子标牌等。Mir “抽象层”证明了这一点，它提供了三个重要的元素：

1\. libmiral.so - Mir 的稳定接口，提供基本的窗口管理;
2\. miral-shell - 一个提供“传统”和“平铺”窗口管理的示例shell;
3\. miral-kiosk - 一个仅提供基本窗口管理的示例“kiosk”。

miral-shell 和 miral-kiosk 示例服务器可从 zesty 的归档文件中获得，Kevin Gunn已经在[记录][1]关于在“Voices”上提供基于 miral-kiosk 的“kiosk”。我将在下面给出更多关于使用这些例子的细节，但在[我的“voices”博客][2]上有更多（包括“如何”开发自己的替代Mir服务器）。

**使用 MIR**

Mir 是一套编程库，而不是独立的程序。这意味着这需要程序去调用它实现相应的功能。有两种方式去使用Mir库：编写程序的时候作为“客户端”，或者在实现shell的实现“服务端”。客户端（和X11一起）典型是使用工具库，而不是直接使用 Mir（或者 X11）。

Mir支持GTK、Qt 和 SDL2 中有支持。当在那些工具集中支持它时（默认在Ubuntu中存在），意味着使用这些工具的程序应该“可以工作”于 Mir 中。除此之外还有一个 Xmir：一个运行于 Mir 的 X11 服务器，这允许基于 X 的服务运行在 Mir服务端上。

但是开始之前 Mir 客户端需要与 Mir 服务端通信。在最后一个开发周期中，Mir 团队在演示中将 MirAL 作为推荐的方法编写了一个 Mir 服务端和一个“miral-examples”包。关于 Ubuntu 的开版 zesty，你可以从归档中安装：


```
$ sudo apt install miral-examples mir-graphics-drivers-desktop qtubuntu-desktop
```

_对于其他平台，你需要自己构建MirAL（有关详细信息，请参阅 Mir 桌面环境示例）。_

miral-examples 安装后你可以在 Unity7 中运行一个 Mir 服务端作为一个窗口，然后运行一个客户端（比如 gedit）：

```
$ miral-shell&
$ miral-run gedit
```

这会给你（非常基础）“传统” 的桌面窗口管理。另外你可以试下“tiling” 窗口管理器：

```
$ miral-shell --window-manager tiling&
$ miral-run qterminal
```

或者（甚至更基础的）kiosk：

```
$ miral-kiosk&
$ miral-run 7kaa
```

这些 Mir 服务端都不会提供带有“启动器”、通知等的完整“桌面”。但是它们演示了不使用 Unity8 使用 Mir 的可能。

**MIR 解决的问题**

X-Windows 系统已经并且仍然非常成功地提供了与计算机的交互方式。它提供了广泛的硬件和驱动程序一致的抽象。它支持许多桌面环境和图形用户界面工具包，并允许他们在大量计算机上一起工作。

但它来自一个与当前电脑使用方式不同的时代，现在有一些问题是很难满足的，因为它需要支持老旧的系统。
在 1980 年，大多数计算机是由专家管理的大型事物，将它们连接在一起“是非常困难的”。在那个时代，开发软件的成本是这样的，一个程序“监听”另一个程序获得的好处是可以忽略不计的：此时几乎没有计算机，同时它们是独立的，它们所有的工作不对金融开放。

X-Windows 在这种环境下开发，通过一系列扩展，已经适应了许多变化。但它本质上是不安全的：任何应用程序可以找出在显示器上显示了什么（并影响它）。你可以编写像 Xeyes（用“眼睛”跟踪光标）或“Tickeys”（通过键盘来生成打字机噪声）等应用程序。现实是，任何和所有应用程序可以跟踪和操纵几乎所有的事情。这就是基于X的桌面如 Unity7、Gnome、KDE和其余工作。

X-Windows 中的窗口管理的开放性质不适合用于具有数百万计算机连接到因特网的世界，它们用于信用卡交易和网上银行，且由非专家管理，并自愿安装来自陌生人的程序。人们越来越意识到让 X-Windows 适应新的安全性和图形性能的要求是不可行的。

现在至少有两个开源项目旨在提供替代它：Mir 和 Wayland。虽然有些人认为两者是竞争关系，但在很多领域，它们有共同的利益：它们都需要那些假设使用 X11 的软件交互，并且许多支持工作对两者都有益。

Canonical 对 X-Windows 的替换品 Mir，它只将信息暴露给它需要的应用程序（因此没有按键监听或光标跟踪）。它可以满足当前时代的需求，并可以利用现代硬件，如图形处理器。

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2016/11/28/mir-is-not-only-about-unity8/

作者：[ Guest][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/guest/
[1]:http://voices.canonical.com/kevin.gunn/
[2]:http://voices.canonical.com/alan.griffiths/
