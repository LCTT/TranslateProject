[#]: collector: (lujun9972)
[#]: translator: (jlztan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10456-1.html)
[#]: subject: (What is PPA? Everything You Need to Know About PPA in Linux)
[#]: via: (https://itsfoss.com/ppa-guide/)
[#]: author: (Abhishek Prakash  https://itsfoss.com/author/abhishek/)

Ubuntu PPA 使用指南
======

> 一篇涵盖了在 Ubuntu 和其他 Linux 发行版中使用 PPA 的几乎所有问题的深入的文章。

如果你一直在使用 Ubuntu 或基于 Ubuntu 的其他 Linux 发行版，例如 Linux Mint、Linux Lite、Zorin OS 等，你可能会遇到以下三种神奇的命令：

```
sudo add-apt-repository ppa:dr-akulavich/lighttable
sudo apt-get update
sudo apt-get install lighttable-installer
```

许多网站推荐使用类似于以上几行的形式 [在 Ubuntu 中安装应用程序][1]。这就是所谓的使用 PPA 安装应用程序。

但什么是 PPA？为什么要用它？使用 PPA 安全吗？如何正确使用 PPA？如何删除 PPA？

我将在这个详细的指南中回答上述所有问题。即使你已经了解了一些关于 PPA 的事情，我相信这篇文章仍然会让你了解这方面的更多知识。

请注意我正在使用 Ubuntu 撰写本文。因此，我几乎在各个地方都使用了 Ubuntu 这个术语，但文中的说明和步骤也适用于其他基于 Debian/Ubuntu 的发行版。

### 什么是 PPA？为什么要使用 PPA？

![Everything you need to know about PPA in Ubuntu Linux][2]

PPA 表示<ruby>个人软件包存档<rt>Personal Package Archive</rt></ruby>。

这样说容易理解吗？可能不是很容易。

在了解 PPA 之前，你应该了解 Linux 中软件仓库的概念。关于软件仓库，在这里我不会详述。

#### 软件仓库和包管理的概念

软件仓库是一组文件，其中包含各种软件及其版本的信息，以及校验和等其他一些详细信息。每个版本的 Ubuntu 都有自己的四个官方软件仓库：

- Main - Canonical 支持的自由开源软件。
- Universe - 社区维护的自由开源软件。
- Restricted - 设备的专有驱动程序。
- Multiverse - 受版权或法律问题限制的软件。

你可以在 [这里][3] 看到所有版本的 Ubuntu 的软件仓库。你可以浏览并转到各个仓库。例如，可以在 [这里][4] 找到 Ubuntu 16.04 的主存储库（Main）。

所以，PPA 基本上是一个包含软件信息的网址。那你的系统又是如何知道这些仓库的位置的呢？

这些信息存储在 `/etc/apt` 目录中的 `sources.list` 文件中。如果查看此文件的内容，你就会看到里面有软件仓库的网址。`#` 开头的行将被忽略。

这样的话，当你运行 `sudo apt update` 命令时，你的系统将使用 [APT 工具][5] 来检查软件仓库并将软件及其版本信息存储在缓存中。当你使用 `sudo apt install package_name` 命令时，它通过该信息从实际存储软件的网址获取该软件包。

如果软件仓库中没有关于某个包的信息，你将看到如下错误：

```
E: Unable to locate package
```

此时，建议阅读我的 [apt 命令使用指南][6] 一文，这将帮你更好地理解 `apt`、`update` 等命令。

以上是关于软件仓库的内容。但什么是 PPA？PPA 和软件仓库又有什么关联呢？

#### 为什么要用 PPA？

如你所见，Ubuntu 对系统中的软件进行管理，更重要的是控制你在系统上获得哪个版本的软件。但想象一下开发人员发布了软件的新版本的情况。

Ubuntu 不会立即提供该新版本的软件。需要一个步骤来检查此新版本的软件是否与系统兼容，从而可以确保系统的稳定性。

但这也意味着它需要经过几周才能在 Ubuntu 上可用，在某些情况下，这可能需要几个月的时间。不是每个人都想等待那么长时间才能获得他们最喜欢的软件的新版本。

类似地，假设有人开发了一款软件，并希望 Ubuntu 将该软件包含在官方软件仓库中。在 Ubuntu 做出决定并将其包含在官方存软件仓库之前，还需要几个月的时间。

另一种情况是在 beta 测试阶段。即使官方软件仓库中提供了稳定版本的软件，软件开发人员也可能希望某些终端用户测试他们即将发布的版本。他们是如何使终端用户对即将发布的版本进行 beta 测试的呢？

通过 PPA！

### 如何使用 PPA？PPA 是怎样工作的？

正如我已经告诉过你的那样，[PPA][7] 代表<ruby>个人软件包存档<rt>Personal Package Archive</rt></ruby>。在这里注意 “个人” 这个词，它暗示了这是开发人员独有的东西，并没有得到分发的正式许可。

Ubuntu 提供了一个名为 Launchpad 的平台，使软件开发人员能够创建自己的软件仓库。终端用户，也就是你，可以将 PPA 仓库添加到 `sources.list` 文件中，当你更新系统时，你的系统会知道这个新软件的可用性，然后你可以使用标准的 `sudo apt install` 命令安装它。

```
sudo add-apt-repository ppa:dr-akulavich/lighttable
sudo apt-get update
sudo apt-get install lighttable-installer
```

概括一下上面三个命令：

- `sudo add-apt-repository <PPA_info>` <- 此命令将 PPA 仓库添加到列表中。
- `sudo apt-get update` <- 此命令更新可以在当前系统上安装的软件包列表。
- `sudo apt-get install <package_in_PPA>` <- 此命令安装软件包。

你会发现使用 `sudo apt update` 命令非常重要，否则你的系统将无法知道新软件包何时可用。

现在让我们更详细地看一下第一个命令。

```
sudo add-apt-repository ppa:dr-akulavich/lighttable
```

你会注意到此命令没有软件仓库的 URL。这是因为该工具被设计成将 URL 信息抽象之后再展示给你。

小小注意一下：如果你添加的是 `ppa:dr-akulavich/lighttable`，你会得到 Light Table。但是如果你添加 `ppa:dr-akulavich`，你将得到 “上层软件仓库” 中的所有仓库或软件包。它是按层级划分的。

基本上，当您使用 `add-apt-repository` 添加 PPA 时，它将执行与手动运行这些命令相同的操作：

```
deb http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu YOUR_UBUNTU_VERSION_HERE main
deb-src http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu YOUR_UBUNTU_VERSION_HERE main
```

以上两行是将任何软件仓库添加到你系统的 `sources.list` 文件的传统方法。但 PPA 会自动为你完成这些工作，无需考虑确切的软件仓库 URL 和操作系统版本。

此处不那么重要的一点是，当你使用 PPA 时，它不会更改原始的 `sources.list` 文件。相反，它在 `/etc/apt/sources.d` 目录中创建了两个文件，一个 `.list` 文件和一个带有 `.save` 后缀的备份文件。

![Using a PPA in Ubuntu][8]

*PPA 创建了单独的 `sources.list` 文件*

带有后缀 `.list` 的文件含有添加软件仓库的信息的命令。

![PPA add repository information][9]

*一个 PPA 的 `source.list` 文件的内容*

这是一种安全措施，可以确保添加的 PPA 不会和原始的 `sources.list` 文件弄混，它还有助于移除 PPA。

#### 为什么使用 PPA？为何不用 DEB 包

你可能会问为什么要使用 PPA，PPA 需要通过命令行使用，而不是每个人都喜欢用命令行。为什么不直接分发可以图形方式安装的 DEB 包呢？

答案在于更新的过程。如果使用 DEB 包安装软件，将无法保证在运行 `sudo apt update` 和 `sudo apt upgrade` 命令时，已安装的软件会被更新为较新的版本。

这是因为 `apt` 的升级过程依赖于 `sources.list` 文件。如果文件中没有相应的软件条目，则不会通过标准软件更新程序获得更新。

那么这是否意味着使用 DEB 安装的软件永远不会得到更新？不是的。这取决于 DEB 包的创建方式。

一些开发人员会自动在 `sources.list` 中添加一个条目，这样软件就可以像普通软件一样更新。谷歌 Chrome 浏览器就是这样一个例子。

某些软件会在运行时通知你有新版本可用。你必须下载新的 DEB 包并再次运行，来将当前软件更新为较新版本。Oracle Virtual Box 就是这样一个例子。

对于其余的 DEB 软件包，你必须手动查找更新，这很不方便，尤其是在你的软件面向 Beta 测试者时，你需要频繁的添加很多更新。这正是 PPA 要解决的问题。

#### 官方 PPA vs 非官方 PPA

你或许听过官方 PPA 或非官方 PPA 这个词，二者有什么不同呢？

开发人员为他们的软件创建的 PPA 称为官方 PPA。很明显，这是因为它来自项目开发者。

但有时，个人会创建由其他开发人员所创建的项目的 PPA。

为什么会有人这样做？ 因为许多开发人员只提供软件的源代码，而且你也知道 [在 Linux 中从源代码安装软件][10] 是一件痛苦的事情，并不是每个人都可以或者会这样做。

这就是志愿者自己从这些源代码创建 PPA 以便其他用户可以轻松安装软件的原因。毕竟，使用这 3 行命令比从源代码安装要容易得多。

#### 确保你的 Linux 发行版本可以使用 PPA

当在 Ubuntu 或任何其他基于 Debian 的发行版中使用 PPA 时，你应该记住一些事情。

并非每个 PPA 都适用于你的特定版本。你应该知道正在使用 [哪个版本的 Ubuntu][11]。版本的开发代号很重要，因为当你访问某个 PPA 的页面时，你可以看到该 PPA 都支持哪些版本的 Ubuntu。

对于其他基于 Ubuntu 的发行版，你可以查看 `/etc/os-release` 的内容来 [找出 Ubuntu 版本][11] 的信息。

![Verify PPA availability for Ubuntu version][12]

*检查 PPA 是否适用于你的 Ubuntu 版本*

如何知道 PPA 的网址呢？只需在网上搜索 PPA 的名称，如 `ppa:dr-akulavich/lighttable`，第一个搜索结果来自 [Launchpad][13]，这是托管 PPA 的官方平台。你也可以转到 Launchpad 并直接在那里搜索所需的 PPA。

如果不验证是否适用当前的版本就添加 PPA，当尝试安装不适用于你的系统版本的软件时，可能会看到类似下面的错误。

```
E: Unable to locate package
```

更糟糕的是，因为它已经添加到你的 `source.list` 中，每次运行软件更新程序时，你都会看到 “[无法下载软件仓库信息][14]” 的错误。

![Failed to download repository information Ubuntu 13.04][15]

如果你在终端中运行 `sudo apt update`，错误提示将包含导致此问题的仓库的更多详细信息。你可以在 `sudo apt update` 的输出内容结尾看到类似的内容：

```
W: Failed to fetch http://ppa.launchpad.net/venerix/pkg/ubuntu/dists/raring/main/binary-i386/Packages  404  Not Found
E: Some index files failed to download. They have been ignored, or old ones used instead.
```

上面的错误提示说的很明白，是因为系统找不到当前版本对应的仓库。还记得我们之前看到的仓库结构吗？APT 将尝试在 `http://ppa.launchpad.net/<PPA_NAME>/ubuntu/dists/<Ubuntu_Version>` 中寻找软件信息。

如果特定版本的 PPA 不可用，它将永远无法打开 URL，你会看到著名的 404 错误。

#### 为什么 PPA 不适用于所有 Ubuntu 发行版？

这是因为 PPA 的作者必须编译软件并在特定版本上创建 PPA。考虑到每六个月发布一个新的 Ubuntu 版本，为每个版本的 Ubuntu 更新 PPA 是一项繁琐的任务，并非所有开发人员都有时间这样做。

#### 如果 PPA 不适用于你的系统版本，该如何安装应用程序？

尽管 PPA 不适用于你的 Ubuntu 版本，你仍然可以下载 DEB 文件并安装应用程序。

比如说，你访问 Light Table 的 PPA 页面，使用刚刚学到的有关 PPA 的知识，你会发现 PPA 不适用于你的特定 Ubuntu 版本。

你可以点击 “查看软件包详细信息”。

![Get DEB file from PPA][16]

在这里，你可以单击软件包以显示更多详细信息，还可以在此处找到包的源代码和 DEB 文件。

![Download DEB file from PPA][17]

我建议 [使用 Gdebi 安装这些 DEB 文件][18] 而不是通过软件中心，因为 Gdebi 在处理依赖项方面要好得多。

请注意，以这种方式安装的软件包可能无法获得任何将来的更新。

我认为你已经阅读了足够多的关于添加 PPA 的内容，那么如何删除 PPA 及其安装的软件呢？

### 如何删除 PPA？

我过去曾写过 [删除 PPA][19] 的教程，这里写的也是同样的方法。

我建议在删除 PPA 之前删除从 PPA 安装的软件。如果只是删除 PPA，则已安装的软件仍保留在系统中，但不会获得任何更新。这不是你想要的，不是吗？

那么，问题来了，如何知道是哪个 PPA 安装了哪个应用程序？

#### 查找 PPA 安装的软件包并将其移除

Ubuntu 软件中心无法移除 PPA 安装的软件包，你必须使用具有更多高级功能的 Synaptic 包管理器。

可以从软件中心安装 Synaptic 或使用以下命令进行安装：

```
sudo apt install synaptic
```

安装后，启动 Synaptic 包管理器并选择 “Origin”。你会看到添加到系统的各种软件仓库。PPA 条目将以前缀 PPA 进行标识，单击以查看 PPA 可用的包。已安装的软件前面会有恰当的符号进行标识。

![Managing PPA with Synaptic package manager][20]

*查找通过 PPA 安装的软件包*

找到包后，你可以从 Synaptic 删除它们。此外，也始终可以选择使用命令行进行移除：

```
sudo apt remove package_name
```

删除 PPA 安装的软件包后，你可以继续从 `sources.list` 中删除PPA。

#### 以图形界面的方式删除 PPA

在设置中打开 “软件和更新”，然后点击 “其他软件” 选项卡。查找要删除的 PPA：

![Delete a PPA from Software Source][21]

此处你可以进项两项操作，可以取消选择 PPA 或选择 “删除” 选项。

区别在于，当你取消选择 PPA 条目时，系统将在 `/etc/apt/sources.list.d` 中的`ppa_name.list` 文件中注释掉仓库条目；但如果选择 “删除” 选项，将会删除 `/etc/apt/sources.list.d`目录中 `ppa_name.list` 文件里的仓库条目。

在这两种情况下，文件 `ppa_name.list` 都保留在所在的目录中，即使它是空的。

### 使用 PPA 安全吗？

这是一个主观问题。纯粹主义者厌恶 PPA，因为大多数时候 PPA 来自第三方开发者。但与此同时，PPA 在 Debian/Ubuntu 世界中很受欢迎，因为它们提供了更简单的安装选项。

就安全性而言，很少见到因为使用 PPA 之后你的 Linux 系统被黑客攻击或注入恶意软件。到目前为止，我不记得发生过这样的事件。

官方 PPA 可以不加考虑的使用，使用非官方 PPA 完全是你自己的决定。

根据经验，如果程序需要 sudo 权限，则应避免通过第三方 PPA 进行安装。

### 你如何看待使用 PPA？

我知道这篇文章需要挺长时间来阅读，但我想让你更好地了解 PPA。我希望这份详细指南能够回答你关于使用 PPA 的大部分问题。

如果你对 PPA 有更多疑问，请随时在评论区提问。

如果你发现任何技术或语法错误，或者有改进的建议，请告诉我。

------

via: https://itsfoss.com/ppa-guide/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[jlztan](https://github.com/jlztan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/what-is-ppa.png?resize=800%2C450&ssl=1
[3]: http://archive.ubuntu.com/ubuntu/dists/
[4]: http://archive.ubuntu.com/ubuntu/dists/xenial/main/
[5]: https://wiki.debian.org/Apt
[6]: https://itsfoss.com/apt-command-guide/
[7]: https://launchpad.net/ubuntu/+ppas
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/01/ppa-sources-list-files.png?resize=800%2C259&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/01/content-of-ppa-list.png?ssl=1
[10]: https://linux.cn/article-9172-1.html
[11]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2017/12/verify-ppa-availibility-version.jpg?resize=800%2C481&ssl=1
[13]: https://launchpad.net/
[14]: https://itsfoss.com/failed-to-download-repository-information-ubuntu-13-04/
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2013/04/Failed-to-download-repository-information-Ubuntu-13.04.png?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/deb-from-ppa.jpg?resize=800%2C483&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/deb-from-ppa-2.jpg?resize=800%2C477&ssl=1
[18]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[19]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/01/ppa-synaptic-manager.jpeg?resize=800%2C394&ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2012/08/Delete-a-PPA.jpeg?ssl=1
