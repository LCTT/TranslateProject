[#]: subject: "How to Upgrade to Linux Mint 21 [Step by Step Tutorial]"
[#]: via: "https://itsfoss.com/upgrade-linux-mint-version/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

图解如何升级到 Linux Mint 21
======
这是一个周期性的更新指南，主要用于将现有的 Linux Mint 升级安装到一个新的可用版本。

在这篇文章中有三个部分，分别向你展示 Linux Mint 的不同的主要版本之间的升级步骤:

* 第 1 部分是关于从 Linux Mint 20.3 升级到 Linux Mint 21 ( GUI 升级工具)
* 第 2 部分是关于从 Linux Mint 19.3 升级到 Linux Mint 20 (基于命令行的升级程序)
* 第 3 部分是关于从 Linux Mint 18.3 升级到 Linux Mint 19 (假设一些人仍然在使用它)

你可以依据你的当前的 Linux Mint 版本和需要来执行适当的步骤。

这是一个周期性的更新指南，主要用于将现有的 Linux Mint 升级安装到一个新的可用版本。

这篇指南已经更新，追加从 Mint 20.3 升级到 Linux Mint 21 的步骤。Linux Mint 现在有一个 GUI 工具来升级到最新的版本。
；
### 在你升级到 Linux Mint 21 之前需要知道的事情

在你继续升级到 Linux Mint 21 之前，你应该考虑下面的事情：

* 你真的需要升级吗？Linux Mint 20.x 还有好几年的支持期限。
* 你将需要高速因特网连接来下载大约 14 GB 的升级。
* 它可能将花费几个小时的时间来完成升级过程，当然这主要取决于你的因特网速度。你必需有耐心。
* 制作一个 Linux Mint 21 的 live USB 并在一次实时会话中尝试它是否与你的硬件系统兼容会是一个好主意。较新的内核可能与较旧的硬件系统有兼容性问题，因此在真正升级或安装之前来对其进行测试可能会为你省去很多麻烦。
* 一次全新的安装总是比一次主要版本升级的更好，但是从零开始安装 Linux Mint 21 可能意味着丢失你的现有的数据。你必须在外部的外部磁盘上进行备份。
* 尽管大部分的升级是安全的，但是它也不会是 100% 的成功。你必须要有系统快照和真正的备份。
* 你只能从 Linux Mint 20.3 的 Cinnamon 、Xfce 和 MATE 版本升级到 Linux Mint 21 。首先 [检查你的 Linux Mint 版本][1] 。如果你正在使用 Linux Mint 20.2 或 20.1 ，你需要先使用更新管理器来升级到 20.3 。如果你正在使用 Linux Mint 19 ，我建议你选择进行一次的全新安装，而不是选择进行数次的升级 Mint 版本。

在你知道你将要做什么后，让我们看看如何升级到 Linux Mint 21 。

### 从 Linux Mint 20.3 升级到 Linux Mint 21

检查你的 Linux Mint 版本，并确保你正在使用 Mint 20.3 。你不能从 Linux Mint 20.1 或 20.2 升级到 Linux Mint 21 。

#### 步骤 1: 通过安装任意可用的更新来更新你的系统

使用 菜单 -> 系统管理 -> 更新管理器来启动更新管理器。查看是否有一些可用的软件包更新。如果有可用的更新，先安装所有的软件包更新。

![Check for Pending Software Updates][2]

针对这一步骤，你也可用在终端中使用这一个命令：

```
sudo apt update && sudo apt upgrade -y
```

#### 步骤 2: 在外部的磁盘上备份你的文件 [可选，但是建议]

Timeshift 是一个创建系统快照的好工具，但它却不是一个针对文档、图片和其它那些非系统、个人文件的理想工具。我建议你在一块外部磁盘上进行备份。它只是为了数据安全。

当我说在一块外部磁盘上进行一次备份时，我的意思是将你的图片、文档、下载和视频目录简单地复制和粘贴到一块外部的 USB 磁盘上。

如果你没有那样大的磁盘，至少复制那些你不可丢失的最重要的文件。

#### 步骤 3: 安装升级工具

现在，你的系统已经更新，你已经准备好升级到 Linux Mint 21 。Linux Mint 开发组提供一个名称为 [mintupgrade][3] 的 GUI 工具，用于从 Linux Mint 20.3 升级到 Linux Mint 21 。

你可用使用下面的命令来安装这个工具：

```
sudo apt install mintupgrade
```

#### 步骤 4: 从终端中运行这个 GUI 工具

你不能在应用程序菜单列表中找到这个新的 GUI 工具。为启动它，你需要在终端中输入下面的命令：

```
sudo mintupgrade
```

这个简单且全面工具将带领你完成升级过程。

![Mint Upgrade Tool Home Page][4]

在一些初始化的测试后，它将提示进行一次 Timeshift 备份。如果你已经创建了一次备份，你已经准备好前进。

![Upgrade Tool Prompting No Timeshift Snapshots][5]

否则，你需要在这里 [创建一个备份][6] ，因为这是强制继续的。

![Taking Snapshot With Timeshift][7]

一些 PPA 可能已经适用于 Ubuntu 22.04 ，因此也适用于 Mint 21 。但是，如果 PPA 或存储库不适用于新的版本，它可能会因为依赖关系的打断而影响升级过程。在升级工具中也会同样的提示你。

![Kazam PPA Does Not Support Jammy][8]

在这里，我将通过其 PPA 来使用 [Kazam 的最新版本][9] 。其 PPA 仅被支持到 Impish ，因为 Linux Mint 21 是基于 Jammy 的，所以它会显示错误。

你可以在升级工具中通过软件源来指定禁用 PPA 的选项。

![Disable Unsupported PPAs in Software Sources][10]

在禁用该 PPA 后，该软件包会变成 ‘陌生的’ ，因为来自存储库中可用版本会与来自 Mnit 存储库中可用版本不匹配。因此，你需要将软件包降级到存储库中一个可用的版本。

![Downgrade Package to Avoid Conflicts][11]

升级工具现在列出需要执行更改。

![List Changes That Need to be Done][12]

在接受后，该工具将开始下载软件包。

![Phase 2 – Simulation and Package Download][13]

![Package Downloading][14]

![Upgrading Phase][15]

它将列出孤立的软件包，这可以被移除。你可以通过按下 <ruby>修复<rt> Fix</rt></ruby> 按钮来移除整个建议的软件包，也可以保留某些软件包。

#### 保留某些孤立的软件包

为保留来自孤立的软件包列表中软件包，你需要从左上角的菜单转到首选项。

![Selecting Orphan Packages You Want to Keep with Preferences][16]

在首选项对话框中，你需要转到 **孤立的软件包** 并使用 “+” 符号来通过名称添加软件包。

![Specify Name of the Package to Keep][17]

在完成后，它将继续升级，在一段时间后，将会向你提示一条成功更新的通知。

![Upgrade Successful][18]

此时，你需要重新启动你的系统。在重新启动后，你将进入到新的 Linux Mint 21 。

![Neofetch Output Linux Mint 21][19]

### 如何升级到 Linux Mint 20

在你继续升级到 Linux Mint 20 之前，你应该考虑下面的事情：

* 你真的需要升级吗？Linux Mint 19.x 将会支持到 2023 年。
* 如果你 [有一款 32-位 系统][20]，你不能安装或升级到 Mint 20 。
* 你将需要高速因特网连接来下载大约 1.4 GB 的升级。
* 它可能将花费几个小时的时间来完成升级过程，当然这主要取决于你的因特网速度。你必需有耐心。
* 制作一个 Linux Mint 20 的 live USB 并在一次实时会话中查看它是否与你的硬件系统兼容会是一个好主意。较新的内核可能与较旧的硬件系统有兼容性问题，因此在真正升级或安装之前来对其进行测试可能会为你省去很多麻烦。
* 一次全新的安装总是比一次主要版本升级的更好，但是从零开始 [安装 Linux Mint][21] 20 可能意味着丢失你的现有的数据。你必须在外部的外部磁盘上进行备份。
* 尽管大部分的升级是安全的，但是它也不会是 100% 的成功。你必须要有系统快照和真正的备份。
* 你只能从 Linux Mint 19.3 的 Cinnamon 、Xfce 和 MATE 版本升级到 Linux Mint 21 。首先 [检查你的 Linux Mint 版本][22] 。如果你正在使用 Linux Mint 19.2 或 19.1 ，你需要先使用更新管理器来升级到 19.3 。如果你正在使用 Linux Mint 18 ，我建议你选择进行一次的全新安装，而不是选择进行数次的升级 Mint 版本。
* 升级过程是通过命令行实用程序来完成的。如果你不喜欢使用终端和命令， 避免升级，并进行一次全新的安装。

在你知道你将要做什么后，让我们看看如何升级到 Linux Mint 20 。

![A Video from YouTube][23]

[订阅我们的 YouTube 频道以获取更多的 Linux 视频][24]

#### 步骤 1: 确保你有一款 64 位系统

Linux Mint 20 仅是一款 64 位系统。如果你安装了一款 32 位的 Linux Mint 19 ，你不能升级到 Linux Mint 20 。

在一个终端中，使用下面的命令来查看你是否正在使用 64-位 操作系统。

```
dpkg --print-architecture
```

![Mint 20 Upgrade Check Architecture][25]

#### 步骤 2: 通过安装一些可用的更新来更新你的系统

使用 菜单 -> 系统管理 -> 更新管理器 来启动更新管理器。查看是否有一些可用的软件包更新。如果有可用的更新，先安装所有的软件包更新。

![Check for pending software updates][26]

针对这一步骤，你也可用在终端中使用这一个命令：

```
sudo apt update && sudo apt upgrade -y
```

#### 步骤 3: 使用 Timeshift 创建一个系统快照 [可选，但是建议]

如果你遇到升级过程中断或你遇到其它的一些重大问题，[使用 Timeshift 创建一个系统快照][27] 将会解救你于水火之中。**你甚至可以使用这种方法恢复到 Mint 19.3 。**

假设你因为意外断电导致升级失败，或因为其它一些原因，你最终得到一个残缺的不稳定的 Linux Mint 19 。你可以插入一个live Linux Mint USB ，并从该 live 环境中运行 Timeshift 。它将会自动地定位你的备份位置，并将允许你恢复你残缺的 Mint 19 系统。

这也意味着你应该随时携带一个 live Linux Mint 19 USB ，在极少数升级失败的情况下，如果你不能访问一台工作的计算机，你可以使用它来创建 live Linux Mint USB 。

![Create a system snapshot in Linux Mint][28]

#### 步骤 4: 在一块外部的磁盘上备份你的文件 [可选，但是建议]

Timeshift 是一个创建系统快照的好工具，但它却不是一个针对文档、图片和其它那些非系统、个人文件的理想工具。我建议你在一块外部磁盘上进行备份。它只是为了数据安全。

当我说在一块外部磁盘上进行一次备份时，我的意思是将你的图片、文档、下载和视频目录简单地复制和粘贴到一块外部的 USB 磁盘上。

如果你没有那样大的磁盘，至少复制那些你不可丢失的最重要的文件。

#### 步骤 5: 禁用 PPA 和第三方存储库 [可选，但是建议]

不出意外的话，你可能已经使用一些 [PPA][29] 或其它的存储库来安装了一下应用程序。

一些 PPA 可能已经适用于 Ubuntu 20.04 ，因此也适用于 Mint 20 。但是，如果 PPA 或存储库不适用于新的版本，它可能会因为依赖关系的打断而影响升级过程。

对此，建议你禁用 PPA 和第三方存储库。你也可以删除通过这样的外部源来安装的应用程序，如果你这样做的话，它不会导致配置数据的丢失。

在软件源工具中，禁用附加的存储库、禁用 PPA 。

![Disable Ppa Mint Upgrade][30]

你也可以 **降级** ，然后在维护标签页中 **移除可用的陌生的软件包** 。

例如，我使用一个 PPA 来安装 Shutter 。我在禁用它的 PPA 后，现在该软件包会变成 ‘陌生的’ ，因为来自存储库中可用版本会与来自 Mnit 存储库中可用版本不匹配。

![Foreign Package Linux Mint][31]

#### 步骤 6: 安装升级工具

现在，你的系统已经更新，你已经准备好升级到 Linux Mint 20 。Linux Mint 开发组提供一个名称为 [mintupgrade][32] 的命令行工具，其唯一的目的是将 Linux Mint 19.3 升级到 Linux Mint 20 。

你可用使用下面的命令来安装这个工具：

```
sudo apt install mintupgrade
```

#### 步骤 7: 运行一次升级设备健康检查

mintupgrade 工具将会让你通过模拟升级的初始化部分来运行一次设备健康检查。

你可以运行这次检查来查看对你的系统做出何种更改，哪些软件包将会升级。它也将会显示不能升级和必须移除的软件包。

```
mintupgrade check
```

在这里，它不会在你的系统上做出任何真正的更改 (即使，感觉上它正在进行做一些更改)。

这一步骤是非常重要的，有助于准确算出你的系统是否可以升级到 Mint 20 。

![Mint Upgrade Check][33]

如果这一步骤中途失败，输入 **mintupgrade restore-sources** 来返回到你原始的 APT 配置。

#### 步骤 8: 下载软件包升级

在你对 mintupgrade 的检查输出感到满意后，你可以下载 Mint 20 升级软件包。

取决于你的因特网连接速度，它可能会在下载这些升级方面消耗一些时间。确保你的硬件系统接通到强电电源。

在软件包的下载期间，你可以继续使用你的系统进行常规工作。

```
mintupgrade download
```

![Mint 20 Upgrade Download][34]

注意，这行命令将把你的操作系统指向 Linux Mint 20 存储库。在使用这行命令后，如果你想降级到 Linux Mint 19.3 ，你仍然可以使用命令 “**mintupgrade restore-sources**” 来做到。

#### 步骤 9: 安装升级 [Point of no return]

现在，万事俱备，你可以使用这行命令来升级到 Linux Mint 20 ：

```
mintupgrade upgrade
```

给它一些时间来安装新的软件包和升级你的 Mint 到相对较新的版本。在升级过程完成后，它将要求你重新启动。

![Linux Mint 20 Upgrade Finish][35]

#### 享受 Linux Mint 20

在你重新启动你的系统后，你将看到 Mint 20 欢迎屏幕。享受新的版本。

![Welcome To Linux Mint 20][36]

### 从 Mint 18 升级到 Mint 19

从 Linux Mint 18.3 升级到 Linux Mint 19 的步骤与你在升级到 Linux Mint 20 中所看到的步骤非常类似。唯一的变化是检查显示管理器。

我将在这里快速地提及这些步骤。如果你想要更多的信息，你可以参考 Mint 20 升级过程。

**步骤 1:** 使用 Timeshift 创建一个系统快照 [可选，但是建议]

**步骤 2:** 在一块外部的磁盘上备份你的文件 [可选，但是建议]

**步骤 3: 确保你正在使用 LightDM**

对于 Mint 19 ，你必须使用 [LightDM 显示管理器][37] 。为检查你正在使用哪种显示管理器，输入命令：

```
cat /etc/X11/default-display-manager
```

如果结果是 “/usr/sbin/**lightdm**”，那么你就有 LightDM ，你就可以继续前进了。

![LightDM Display Manager in Linux Mint][38]

在另一个方面，如果结果是 “/usr/sbin/**mdm**”，你需要安装 LightDM ，[切换到 LightDM][39] 并移除 MDM 。使用这行命令来安装 LightDM ：

```
apt install lightdm lightdm-settings slick-greeter
```

在安装期间，它将要求你选择显示管理器。你需要选择 LightDM 。

在你设置 LightDM 作为你的显示管理器后，使用下面这些命令来移除 MDM 并重新启动：

```
apt remove --purge mdm mint-mdm-themes*
sudo dpkg-reconfigure lightdm
sudo reboot
```

**步骤 4: 通过安装一些可用的更新来更新你的系统**

```
sudo apt update && sudo apt upgrade -y
```

**步骤 5: 安装升级工具**

```
sudo apt install mintupgrade
```

**步骤 6: 检查升级**

```
mintupgrade check
```

**步骤 7: 下载软件包升级**

```
mintupgrade download
```

**步骤 8: 应用升级**

```
mintupgrade upgrade
```

享受 Linux Mint 19 。

### 你升级到 Linux Mint 21 了吗？

升级到 Linux Mint 20 可能不会是一种友好的体验，但是，使用新的专用 GUI 升级工具来升级到 Mint 21 变得简单多了。

我希望你发现这篇教程有帮助。你是选择升级到 Linux Mint 21 ？还是现在一次全新的安装？

如果你遇到一些重要问题，或者你有一些关于升级过程的问题，请在评论区随时询问。

--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-linux-mint-version/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/check-linux-mint-version/
[2]: https://itsfoss.com/wp-content/uploads/2022/08/check-for-pending-software-updates.png
[3]: https://github.com/linuxmint/mintupgrade/blob/master/usr/bin/mintupgrade
[4]: https://itsfoss.com/wp-content/uploads/2022/08/mint-upgrade-tool-home-page.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/upgrade-tool-prompting-no-timeshift-snapshots.png
[6]: https://itsfoss.com/backup-restore-linux-timeshift/
[7]: https://itsfoss.com/wp-content/uploads/2022/08/taking-snapshot-with-timeshift.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/kazam-ppa-does-not-support-jammy.png
[9]: https://itsfoss.com/kazam-screen-recorder/
[10]: https://itsfoss.com/wp-content/uploads/2022/08/disable-unsupported-ppas-in-software-sources.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/downgrade-package-to-avoid-conflicts.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/list-changes-that-need-to-be-done.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/phase-2-simulation-and-package-download-.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/package-downloading.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/upgrading-phase.png
[16]: https://itsfoss.com/wp-content/uploads/2022/08/selecting-orphan-packages-you-want-to-keep-with-preferences.png
[17]: https://itsfoss.com/wp-content/uploads/2022/08/specify-name-of-the-package-to-keep.png
[18]: https://itsfoss.com/wp-content/uploads/2022/08/upgrade-successful-800x494.png
[19]: https://itsfoss.com/wp-content/uploads/2022/08/neofetch-output-linux-mint-21.png
[20]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[21]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[22]: https://itsfoss.com/check-linux-mint-version/
[23]: https://youtu.be/LYnXEaiAjsk
[24]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[25]: https://itsfoss.com/wp-content/uploads/2020/07/mint-20-upgrade-check-architecture.jpg
[26]: https://itsfoss.com/wp-content/uploads/2020/07/update-manager-linux-mint.jpg
[27]: https://itsfoss.com/backup-restore-linux-timeshift/
[28]: https://itsfoss.com/wp-content/uploads/2018/07/snapshot-linux-mint-timeshift.jpeg
[29]: https://itsfoss.com/ppa-guide/
[30]: https://itsfoss.com/wp-content/uploads/2020/07/disable-ppa-mint-upgrade.jpg
[31]: https://itsfoss.com/wp-content/uploads/2020/07/foreign-package-linux-mint.jpg
[32]: https://github.com/linuxmint/mintupgrade/blob/master/usr/bin/mintupgrade
[33]: https://itsfoss.com/wp-content/uploads/2020/07/mint-upgrade-check.jpg
[34]: https://itsfoss.com/wp-content/uploads/2020/07/mint-upgrade-download.jpg
[35]: https://itsfoss.com/wp-content/uploads/2020/07/linux-mint-20-upgrade-finish.jpg
[36]: https://itsfoss.com/wp-content/uploads/2020/07/welcome-to-linux-mint-20.jpg
[37]: https://wiki.archlinux.org/index.php/LightDM
[38]: https://itsfoss.com/wp-content/uploads/2018/07/lightdm-linux-mint.jpeg
[39]: https://itsfoss.com/switch-gdm-and-lightdm-in-ubuntu-14-04/
