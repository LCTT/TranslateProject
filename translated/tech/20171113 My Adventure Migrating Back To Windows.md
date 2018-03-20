我的冒险之旅之迁移回 Windows
======

我已经使用 Linux 作为我的主要操作系统大约 10 年了，并且主要使用 Ubuntu。但在最新发布的版本中，我决定重新回到我通常不喜欢的操作系统： Windows 10。

![Ubuntu On Windows][1]

我一直是 Linux 的粉丝，我最喜欢的两个发行版是 debian 和 ubuntu。现今作为一个服务器操作系统，linux 是完美无暇的，但在桌面上一直存在不同程度的问题。

最近一系列的问题让我意识到，我不需要使用 linux 作为我的桌面操作系统，我仍然是一个粉丝。所以基于我安装 Ubuntu 17.10 的经验，我已经决定回到 windows。

### 什么使我选择了回归

问题是，当 Ubuntu 17.10 出来后，我像往常一样进行全新安装，但遇到了一些非常奇怪的新问题。
* Dell D3100 Dock 不再工作（包括 Work Arounds）
* Ubuntu 意外死机（随机）
* 双击桌面上的图标没反应
* 使用 HUD 搜索诸如“调整”之类的程序将尝试安装 META 版本
* GUI 比标准的 GNOME 感觉更糟糕

现在我确实考虑回到使用 Ubuntu 16.04 或另一个发行版本，但是我觉得 Unity 7 是最精致的桌面环境，另外唯一一个优雅且稳定的是 Windows 10。

除此之外，在 Windows 上使用 Linux 也有特定的支持，如：

* 大多数装有商用软件不可用，E.G Maya, PhotoShop, Microsoft Office（大多数情况下，替代品并不相同）
* 大多数游戏都没有移植到 Linux 上，包括来自 EA, Rockstar Ect. 等主要工作室的游戏。
* 对于大多数硬件来说，驱动程序是选择 Linux 的第二个考虑因素。‘

在决定使用 Windows 之前，我确实看过其他发行版和操作系统。

与此同时，我看到更多的是“微软热爱 Linux ”的活动，并且了解了 WSL。他们新开发者的聚焦角度对我来说很有意思，于是我试了一下。

### 我在 Windows 找到了什么

我使用计算机主要是为了编程，我也使用虚拟机，git 和 ssh，并且大部分工作依赖于 bash。我偶尔也会玩游戏，观看 netflix 和一些轻松的办公室工作。

总之，我期待在 Ubuntu 中保留当前的工作流程并将其移植到 Windows 上。我也想利用 Windows 的优点。

* 所有 PC 游戏支持 Windows
* 大多数程序受本地支持
* 微软办公软件

现在，使用 Windows 有很多警告，但是我打算正确对待它，所以我不担心一般的 windows 故障，例如病毒和恶意软件。

### Windows 的子系统 Linux（Windows 上存在 Ubuntu 的 Bash）

微软与 Canonical 密切合作将 Ubuntu 带到了 Windows 上。在快速设置和启动程序之后，你将拥有非常熟悉的 bash 界面。

现在我一直在研究这个问题的局限性，但是在写这篇文章时我碰到的唯一真正的限制是它从硬件中抽象了出来。例如，lsblk 不会显示你有什么分区，因为子系统 Ubuntu 没有提供这些信息。

但是除了访问底层工具之外，我发现这种体验非常熟悉，也很棒。

我在下面的工作流程中使用了它。

* 生成 SSH 密钥对
* 使用 Git 和 Github 来管理我的仓库
* SSH 到几个服务器，包括没有密码的
* 为本地数据库运行 MySQL
* 监视系统资源
* 使用 VIM 配置文件
* 运行 Bash 脚本
* 运行本地 Web 服务器
* 运行 PHP, NodeJS

到目前为止，它已经被证明是非常强大的工具，除了在 Windows 10 UI 中。我的工作流程感觉和我在 Ubuntu 上几乎一样。尽管我的多数工作可以在 WSL 中处理，但我仍然打算让虚拟机进行更深入的工作，这可能超出了 WSL 的范围。

### 没有 Wine 

我遇到的另一个主要问题是兼容性问题。现在，我很少使用 WINE（译注： wine 是可以使 Linux 上运行 Windows 下的软件）来使用 Windows 软件。尽管通常不是很好，但是有时它是必需的。

### HeidiSQL

我安装的第一个程序之一是 HeidiSQL，它是我最喜欢的数据库客户端之一。它在 wine 下工作，但是感觉很可怕，所以我放弃了 MySQL Workbench。让它回到 Windows 中，就像回来了一个可靠的老朋友。

### 游戏平台 / Steam

没有游戏的 Windows 电脑无法想象。我从 steam 的网站上安装了它，并且使用我的 Linux 目录，以及我的 Windows 目录，这个目录是 Linux 目录的 5 倍大，并且包括 GTA V (译注: GTA V 是一款名叫侠盗飞车的游戏) 等 AAA 级配置。这些是我只能在 Ubuntu 中梦想的东西。

现在，我对 SteamOS 有很大的期望，并且一直会持续如此。但是我认为在不久的将来它不会在任何地方的游戏市场中崭露头角。所以如果你想在 PC 上玩游戏，你确实需要 Windows。

还有一点需要注意的是， ny nvidia 显卡的驱动程序有很好的支持，这使得像 TF2 (译注： 这是一款名叫军团要塞2的游戏) 这样的一些 Linux 本机游戏运行的稍好一些。

** Windows 在游戏方面总是优越的，所以这并不令人感到意外。**

### 从 USB 硬盘运行，为什么

我在我的主要 sss 驱动器上运行 Linux，但在过去，我从 usb 密钥和 usb 硬盘运行(译注：这句话不知道怎么翻译，希望校正者注意。)。我习惯了 Linux 的这种持久性，这让我可以在不丢失主要操作系统的情况下长期尝试多个版本。现在我尝试将 Windows 安装到 USB 连接的硬盘上时，它无法工作并且是无法实现的。所以当我将 Windows HDD 的克隆作为备份时，我很惊讶我可以通过 USB 启动它。

这对我来说已经成为一个方便的选择，因为我打算将我的工作笔记本电脑迁移回 Windows，但如果不想冒险，那就把它扔在那里吧。

所以我在过去的几天里，我使用 USB 来运行它，除了一些错误的消息外，我没有通过 USB 运行发现它真正的缺点。

这样做的显著问题是：
* 较慢的启动速度
* 恼人的信息：不要拔掉你的 USB
* 无法激活它

**我可能会写一篇关于 USB 驱动器上的 Windows 的文章，这样我们可以有更详细的了解。**

### 那么结论是什么？

我使用 Windows 10 大约两周了，并没有注意到它对我的工作流程有任何的负面影响。尽管过程会有一些小问题，但我需要的所以工具都在手边，并且操作系统一般都在运行。

## 我会留在 Windows吗？

虽然现在还为时尚早，但我想在可见的未来我会坚持使用 Windows。

--------------------------------------------------------------------------------

via: [https://www.chris-shaw.com/blog/my-adventure-migrating-back-to-windows](https://www.chris-shaw.com/blog/my-adventure-migrating-back-to-windows)

作者：[Christopher Shaw][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.chris-shaw.com
[1]:https://winaero.com/blog/wp-content/uploads/2016/07/Ubutntu-on-Windows-10-logo-banner.jpg
