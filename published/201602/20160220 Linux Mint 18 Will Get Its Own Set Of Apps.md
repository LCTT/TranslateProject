Linux Mint 18 将拥有自己的应用集
=============================================

![](http://itsfoss.com/wp-content/uploads/2016/01/Linux-Mint-apps.jpg)

对于发行版开发者来说，创建和发布一系列专为他们发行版设计的应用是再平常不过的事情。一个最典型的例子就是 [elementary OS](https://elementary.io/) 。而在经过九年的努力后，Linux Mint 终于孤注一掷做了相同的事情。

[Linux Mint](http://www.linuxmint.com/) 是现今最著名的 Linux 发行版之一。其基于 Ubuntu 和 Debian，Linux Mint 努力去创建一个现代的、优雅的、舒适的操作系统，不但强大而且易用。（LCTT 译注：Linux Mint 基于 Ubuntu，而 Linux Mint Debian Edition 基于 Debian。）Linux Mint 背后的团队同时也积极参与 [MATE](http://itsfoss.com/install-mate-desktop-ubuntu-14-04/) 和 [Cinnamon](http://itsfoss.com/install-cinnamon-ubuntu-14-04/) 桌面环境开发。

## 前有 X 战警（X-men），后有 X 应用（X-Apps）

周四， Linux Mint 项目领导者 Clement Lefebvre [宣布](http://blog.linuxmint.com/?p=2985) X-Apps 的创建。X-Apps 被设计为不依赖特定桌面环境，以便开发者可以直接更新它们而不必针对每一种桌面环境做调整。Lefebvre 声明这些 X-Apps 将会被作为 Cinnamon、MATE 和 Xfce 桌面环境的默认应用。

## Linux 是否需要更多的应用？

据 Lefebvre 所述，X-Apps 的创建是因 GNOME 3.18 发布所需。对于 GNOME 3.18 的发布，他这样说：

> “GTK 本身和一些 GNOME 应用都在 GNOME SHELL 上集成地很好，而且看起来风格很一致。坏消息就是它们在任何别的地方看起来很不相称。使事情变得更糟的是，Ubuntu 的旗舰产品 Unity 重度依赖 GTK、GNOME 应用及 GNOME 环境本身，所以我们这里不能在上游的 3.18 版本中处理，而这一系列的补丁会带来它们自己的问题（举一个例子，Ubuntu 在应用中重新引入菜单条和标题栏，但是不重写它们的头部栏..所以你有时会看到它们三者一起出现）。”

在过去，Linux Mint 团队通过“应用降级（例如 Linux Mint 17 使用 gedit 2.30），给 GNOME 打补丁以及使用替代品（大部分在 MATE 和 Xfce）”来处理这个问题。

Lefebvre 也说为 Cinnamon 和 MATE 构建特定应用没有意义。这就是为什么他们选择开发那些通用的，可以完美地适应运行在 Cinnamon，MATE 和 Xfce（以及其他可能的桌面环境）的应用。

他进一步补充道：

>“X-Apps 将会是一个通用的，使用传统的接口 GTK3 应用的集合。它能被用作 Cinnamon，MATE 和 Xfce 默认的桌面组件。在 Mint 18 中，“X apps” 将允许我们去维护一个本地风格及更高层面的集成。因为它们将会被用于替代看起来很不一致的 GNOME 桌面应用。长期来讲，X-App 项目将会允许我们去开发新的功能和改进应用本身（这是一些我们无法通过打补丁，临时分支或者特定桌面的分支做到的事情，比如说 MATE 桌面应用，因为它代价太高）。”

## 将会有什么类型的应用？

![](http://itsfoss.com/wp-content/uploads/2016/01/xedit.png)

Lefebvre 只透露其中一个即将来临的 X-Apps：一个名为 xedit 的文本编辑器。下面是这个软件提供的一些特性：

- 基于 Pluma，很容易学会使用
- 使用 GTK3
- 不依赖 GNOME 或 MATE

## 何时呢？

X-Apps 将会和 [Linux Mint 18](http://itsfoss.com/linux-mint-18-codenamed-sarah/) 一同到来。而 Linux Mint 18 将会在 Ubuntu 16.04 LTS 发布之后数月后发布。[Ubuntu 16.04 LTS 计划于四月发布。](http://itsfoss.com/ubuntu-1604-release-schedule/)

## 总结

就我而言，无论何时当我听见某人发布一个新发行版特定的应用，我都会局促不安。Linux 世界本身已经难以想象的碎片化了。我们真的需要花费时间和精力去创建更多的重复的项目吗？但不要误解我，我喜欢桌面无关软件的想法。它将修复大量的一个桌面一个应用样子的问题。

使我发愁的问题是“它们是否会成功？”。正如我之前所说，Linux Mint 团队成员也在两种桌面环境工作。目前增加了应用开发就让这些混在一起了。我自己没有写过一个软件（除了 Hello World），但是我知道当你尝试且使一个项目复杂化，就会发生不好的事情。许多项目已经变成了不断膨胀的恶龙。我希望这样的事不要发生在这里。

你有不同的想法吗？在下方评论以便让我知道。

------------------------------------------------------------------------------

via: http://itsfoss.com/linux-mint-own-apps/

作者：[JOHN PAUL][a]
译者：[mudongliang](https://github.com/mudongliang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/john/
