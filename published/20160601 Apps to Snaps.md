将 Linux 软件打包成 Snap 软件包
================

![](https://insights.ubuntu.com/wp-content/uploads/27eb/app-snap.png)

在 Linux 分发应用不总是那么容易。有各种不同的包格式、基础系统、可用库，随着发行版的一次次发布，所有的这些都让人头疼。然而，现在我们有了更简单的东西：Snap。

Snap 是开发者打包他们应用的新途径，它相对于传统包格式，如 .deb，.rpm 等带来了许多优点。Snap 安全，彼此隔离，宿主系统使用了类似 AppArmor 的技术，它们跨平台且自足的，让开发者可以准确地将应用所需要的依赖打包到一起。沙盒隔离也加强了安全，并允许应用和整个基于 snap 的系统，在出现问题的时候可以回滚。Snap 确实是 Linux 应用打包的未来。

创建一个 snap 包并不困难。首先，你需要一个 snap 基础运行环境，能够让你的桌面环境认识并运行 snap 软件包，这个工具叫做 snapd ，默认内置于所有 Ubuntu 16.04 系统中。接着你需要创建 snap 的工具 Snapcraft，它可以通过一个简单的命令安装：

```
$ sudo apt-get install snapcraft
```

这个环境安装好了之后就可以 snap 起来了。

Snap 使用一个特定的 YAML 格式的文件 snapcraft.yaml，它定义了应用是如何打包的以及它需要的依赖。用一个简单的应用来演示一下，下面的 YAML 文件是个如何 snap 一个 moon-buggy 游戏的实际例子，该游戏在 Ubuntu 源中提供。

```
name: moon-buggy
version: 1.0.51.11
summary: Drive a car across the moon
description: |
A simple command-line game where you drive a buggy on the moon
apps:
  play:
    command: usr/games/moon-buggy
parts:
  moon-buggy:
    plugin: nil
    stage-packages: [moon-buggy]
    snap:
      – usr/games/moon-buggy
```

上面的代码出现了几个新概念。第一部分是关于如何让你的应用可以在商店找到的信息，设置软件包的元数据名称、版本号、摘要、以及描述。apps 部分实现了 play 命令，指向了 moon-buggy 可执行文件位置。parts 部分告诉 snapcraft 用来构建应用所需要的插件以及依赖的包。在这个简单的例子中我们需要的所有东西就是来自 Ubuntu 源中的 moon-buggy 应用本身，snapcraft 负责剩下的工作。

在你的 snapcraft.yaml 所在目录下运行 snapcraft ，它会创建 moon-buggy_1.0.51.11_amd64.snap 包，可以通过以下命令来安装它：

```
$ snap install moon-buggy_1.0.51.11_amd64.snap
```

想了解更复杂一点的 snap 打包操作，比如基于 Electron 的 Simplenote 可以[看这里][1]，在线教程在[这里][2]，相应的代码在 [Github][3]。更多的例子可以在 Ubuntu 开发者[站点][4]找到。

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2016/06/01/apps-to-snaps/

作者：[Jamie][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://insights.ubuntu.com/author/jamiebennett/
[1]: http://www.simplenote.com/
[2]: http://www.linuxuk.org/post/20160518_snapping_electron_based_applications_simplenote/
[3]: https://github.com/jamiedbennett/snaps/tree/master/simplenote
[4]: https://developer.ubuntu.com/en/desktop/get-started/
