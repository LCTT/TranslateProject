迁移到 Linux：图形操作环境
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-migration_0.jpg?itok=0tviWTqd)

> 这篇文章对 Linux 图形环境做了一番介绍，展示了在不同的 Linux 发行版上的各种选择。

这是我们迁移到 Linux 系统系列的第三篇文章。如果你错过了先前的两篇，这里有两文的链接《[入门介绍][1]》 和 《[磁盘、文件、和文件系统][2]》。本文中，我们将讨论图形操作环境。在 Linux 系统中，你可以依照喜好选择并且定制一个图形界面，你有很大的选择余地，这也是 Linux 优越的体验之一。

一些主流的 Linux 图形界面包括：Cinnamon、Gnome、KDE Plasma、Xfce 和 MATE，总之这里有很多选择。

有一点经常混淆 Linux 新手，虽然某个 Linux 系统分配了一个缺省的图形环境，但是一般你可以随时更换这个图形界面。这和 Windows 或 Mac OS 的惯用者的定势思维不同。安装图形环境是一件独立的事情，很多时候，Linux 和其图形环境的连接并不紧密。此外，你在一个图形环境构建运行的程序同样适用于另一个图形环境。比如说一个为 KDE Plasma 图形环境编写的应用程序完全适用于 Gnome 桌面图形环境。

由于人们熟悉 Windows 和 MacOS 系统，部分 Linux 操作系统的图形环境在一定程度上尝试着去模仿它们，但另一些 Linux 图形界面则是独特的。

下面，我将就一些不同的 Linux 发行版，展示几个 Linux 图形环境。如果你不确定应该采用那个 Linux 发行版，那我建议你从 [Ubuntu][3] 开始，获取其长期支持（LTS）的版本（Ubuntu 16.04.3 LTS 正在开发）。Ubuntu 稳定且真的非常好用。

### 由 Mac 过渡

Elementary OS 发行版提供了和 Mac 系统风格很接近的界面。它的默认图形环境被称作 Pantheon，是一款很适合 Mac 用户过渡使用的图形环境。这款图形界面发行版的屏幕底部有一个停靠栏，专为极简者使用而设计。为了保持简约的风格，很多默认的应用程序甚至都不会有自己的菜单。相反，它们的按钮和控件在应用程序的标题栏上（图 1）。

![Elementary OS][5]

*图 1： Elementary OS Pantheon.*

Ubuntu 发行版提供的一个默认的图形界面，也和 Mac 相似。Ubuntu 17.04 或者更老的版本都使用 Unity 图形环境，Unity 停靠栏的默认位置在屏幕的左边，屏幕顶部有一个全局应用程序共享的菜单栏。

### 由 Windows 过渡

ChaletOS 亦步亦趋模仿 Windows 界面，可以帮助 Windows 用户轻松的过渡到 Linux。ChaletOS 使用的图形环境是 Xfce（图 2）。在屏幕的左下角有一个开始（主）菜单和搜索栏。屏幕的右下角是一个桌面图标和一些通知信息。这看起来和 Windows 非常像，乍一看，可能都会以为桌面跑的是 Windows。

![ChaletOS][6]

*图 2： ChaletOS with Xfce.*

Zorin OS 发行版同样尝试模仿 Windows。 Zorin OS 使用的 Gnome 的改进桌面，工作起来和 Windows 的图形界面很相似。左下角的开始按钮、右下角的通知栏和信息通知栏。开始按钮会弹出一个和 Windows 无异的应用程序列表和搜索框。

### 独有的图形环境

Gnome 桌面（图 3）是最常用的图形环境之一。许多发行版将 Gnome 作为默认的图形环境。Gnome 并不打算模仿 Windows 或是 MacOS，而是以其自身的优雅和易用为目标。

![][7]

*图 3：openSUSE with Gnome.*

Gnome 桌面环境从版本 2 到 版本 3 发生了巨变，Cinnamon 环境为消除该改变带来的不利影响而创造。尽管 Cinnamon 和前辈 Gnome 2 外观不相似，但是它依旧尝试提供一个简约的界面，而且它的功能和 Windows XP 类似。

MATE 图形环境直接模仿于 Gnome 2，在它的屏幕顶部有一个用作设置和存放应用的菜单栏，底部提供了一个应用程序运行选项卡和一些其他组件。

KDE plasma 围绕组件界面而构建，组件可以安装在桌面或是面板上（图 4）。

![KDE Plasma][8]

*图 4: 安装了 KDE Plasma 的 Kubuntu 操作系统。*

没有那个图形环境比另外一个更好。不同的风格适用不同的用户风格。另外，如果选择太多无从下手，那就从 [Ubuntu][3] 开始吧。

### 相似与不同

不同的操作系统处理方式不同，这会给使用者的过渡带来挑战。比如说，菜单栏可能出现在不同的位置，然后设置有可能用不同的选项入口路径。我列举了一些相似或不同地方来帮助减少 Linux 调整。

#### 鼠标

Linux 的鼠标通常和 Windows 与 MacOS 的工作方式有所差异。在 Windows 或 Mac，双击标签，你几乎可以打开任何事物，而这在 Linux 图形界面中很多都被设置为单击。

此外在 Windows 系统中，你通常通过单击窗口获取焦点。在 Linux，很多窗口的焦点获取方式被设置为鼠标悬停，即便鼠标悬停下的窗口并不在屏幕顶端。这种微妙的差异有时候会让人很吃惊。比如说，在 Windows 中，假如有一个后台应用（不在屏幕顶层），你移动鼠标到它的上面，不点击鼠标仅仅转动鼠标滚轮，顶层窗口会滚动。而在 Linux 中，后台窗口（鼠标悬停的那个窗口）会滚动。

#### 菜单

应用菜单是电脑程序的一个主要集中位置，最近似乎可以调整移动菜单栏到不碍事的地方，甚至干脆完全删除。大概，当你迁移到 Linux，你可能找不到你期待的菜单。应用程序菜单会像 MacOS一样出现在全局共享菜单栏内。和很多移动应用程序一样，该菜单可能在“更多选项”的图标里。或者，这个菜单干脆被完全移除被一个按钮取代，正如在 Elementary OS Pantheon 环境里的一些程序一样。 

#### 工作空间

很多 Linux 图形环境提供了多个工作空间。一个工作空间包含的正在运行的程序窗口充盈了整个屏幕。切换到不同的工作空间将会改变程序的可见性。这个概念是把当前项目运行使用的全部应用程序分组到一个工作空间，而一些为另一个项目使用的应用程序会被分组到不同的工作空间。

不是每一个人都需要甚至是喜欢工作空间，但是我提到它是因为，作为一个新手，你可能无意间通过一个组合键切换了工作空间，然后，“喂！我的应用程序哪去了?” 如果你看到的还是你熟悉的桌面壁纸，那你可能只是切换了工作空间，你所有的应用程序还在一个工作空间运行，只是现在不可见而已。在很多 Linux 环境中，通过敲击 `Alt+Ctrl` 和一个箭头（上、下、左或右）可以切换工作空间。很有可能发现你的应用程序一直都在另一个工作空间里运行。

当然，如果你刚好喜欢工作空间（很多人都喜欢），然后你就发现了一个 Linux 很有用的默认功能。

#### 设置

许多 Linux 图形环境提供一些类型的设置程序或是面板让你在机器上配置设置。值得注意的是类似 Windows 和 MacOS，Linux 可以配置好很多细节，但不是所有的详细设置都可以在设置程序上找到。但是这些设置项已经足够满足大部分典型的桌面系统，比如选择桌面壁纸，改变熄屏时间，连接打印机等其他一些设置。

和 Windows 或者 MacOS 相比，Linux 的应用程序设置的分组或是命名都有不同的方式。甚至同是 Linux 系统，不同的图形界面也会出现不同的设置，这可能需要时间适应。当然，在你的图形环境中设置配置的问题可以通过在线查询这样不错的方法解决。

#### 应用程序

最后，Linux 的应用程序也可能不同。你可能会发现一些熟悉的应用程序，但是对你来说更多的将会是崭新的应用。比如说，你能在 Linux 上找到 Firefox、Chrome 和 Skype。如果不能找到特定的应用程序，通常你能使用一些替代程序。如果还是不能，那你可以使用 WINE 这样的兼容层来运行 Windows 的应用程序。

在很多 Linux 图形环境中，你可以通过敲击 Windows 的标志键来打开应用程序菜单栏。在其他一些情况中，你不得不点击开始（主）按钮或应用程序菜单。很多图形环境中，你可以通过分类搜索到应用程序而不一定需要它的特定程序名。比如说，你要使用一个你不清楚名字的编辑器程序，这时候，你可以在应用程序菜单栏键的搜索框中键入“editor”字样，它将为你展示一个甚至更多的被认为是编辑器类的应用程序。

为帮你起步，这里列举了一点可能成为 Linux 系统使用的替代程序。

![linux][10]

请注意，Linux 提供了大量的满足你需求的选择，这张表里列举的一点也不完整。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2017/12/migrating-linux-graphical-environments

作者：[John Bonesio][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://linux.cn/article-9212-1.html
[2]:https://linux.cn/article-9213-1.html
[3]:https://www.evernote.com/OutboundRedirect.action?dest=https%3A%2F%2Fwww.ubuntu.com%2Fdownload%2Fdesktop
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/elementaryos.png?itok=kJk2-BsL (Elementary OS)
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/chaletos.png?itok=Zdm2rRgu
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/opensuse.png?itok=TM0Q9AyH
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kubuntu.png?itok=a2E7ttaa (KDE Plasma)
[9]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-options.png?itok=lkqD1UMj
