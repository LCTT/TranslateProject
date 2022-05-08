[#]: subject: "Ubuntu MATE’s Lead Creates a Nifty Tool to Help Install 3rd Party Deb Packages"
[#]: via: "https://news.itsfoss.com/deb-get-ubuntu/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu MATE 的负责人开发了一个漂亮的工具，专用于安装第三方 deb 包
======
这是一个有趣的工具，它可以替代 apt-get 来安装 Ubuntu 上的第三方 deb 包。它应该能帮为你节省时间！

![deb-get][1]

Ubuntu MATE 的负责人 **Martin Wimpress** 为 Linux 用户带来了另一个有趣的项目。

你可能不知道，这个 Martin 经常开发一些有趣的东西。去年，我们报道了 [Quickemu][2]，它通过一个基于 QEMU 的 GUI 工具，帮助用户在 Linux 中创建虚拟机，使这个过程变得简单。

现在，他又带来了一个有趣的 “**deb-get**” 工具，其目标是模仿 “**apt-get**” 对第三方 .deb 包的支持。

让我们来详细了解一下它吧！

### Deb Get：使用 CLI 无缝安装第三方 deb 包

当官方软件库中没有你想安装的软件包时（比如 Google Chrome、Vivaldi 等），你必须先 [添加一个 PPA（非官方/官方）][3] 或者下载 .deb 文件后 [手动安装][4]。

如果我现在告诉你，你可以直接在终端中安装它们，就好像官方软件库中有它们一样呢？

这就是 deb-get 工具想要做到的事。

通常，当在终端中安装一个软件包时，你会使用下面的命令：

```shell
sudo apt install packagename
```

或者

```shell
sudo apt-get install packagename
```

要使用这个工具，你只需把 `apt-get` 替换为 `deb-get`，其他格式保持不变。就像下面这样：

```shell
sudo deb-get install packagename
```

举个例子，通常，我们 [在 Linux 上安装 Vivaldi][5] 时需要添加 PPA 或下载 .deb 文件。

现在，如果你在系统上配置好了 deb-get 工具（**配置指南在本文末尾**），你就可以使用以下命令轻松地安装 Vivaldi：

```shell
sudo deb-get install vivaldi-stable
```

![][6]

另外，类似于 `apt-get upgrade`，你可以使用下面的命令来升级软件包：

```shell
sudo deb-get upgrade
```

**注意：**虽然 deb-get 使安装第三方 .deb 包变得很容易，但它是有限制的，你只能安装它提供的核实列表中的软件。不过，它已经支持许多 [必要的应用程序][7]，相信支持的软件包列表很快就会扩大。

你也可以使用下面的命令，检查你 deb-get 可用软件包的列表：

```shell
sudo deb-get list
```

![deb-get][8]

### 在基于 Ubuntu 的发行版上设置 deb-get

deb-get 工具适用于 Ubuntu 22.04 LTS（我测试过），也应该适用于其他基于 Ubuntu 的发行版。

你可以使用下面的命令来安装它：

```shell
sudo apt install curl && curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
```

或者，你可以在它的 [GitHub 发布页面][9] 手动下载它的 deb 包。

要了解更多关于它的信息，以及可用的命令/功能，你可以访问它的 [GitHub 页面][10]。

*你怎么看待 deb-get 试图实现支持第三方软件包的 apt-get？你认为它有用吗？请在评论区留言，发表你的看法吧！*

**来源：OMG!Ubuntu!**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/deb-get-ubuntu/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/deb-get.jpg
[2]: https://itsfoss.com/quickgui/
[3]: https://itsfoss.com/ppa-guide/
[4]: https://itsfoss.com/install-deb-files-ubuntu/
[5]: https://itsfoss.com/install-vivaldi-ubuntu-linux/
[6]: https://news.itsfoss.com/wp-content/uploads/2022/05/deb-get-vivaldi.jpg
[7]: https://itsfoss.com/essential-linux-applications/
[8]: https://news.itsfoss.com/wp-content/uploads/2022/05/deb-get-list.jpg
[9]: https://github.com/wimpysworld/deb-get/releases
[10]: https://github.com/wimpysworld/deb-get
