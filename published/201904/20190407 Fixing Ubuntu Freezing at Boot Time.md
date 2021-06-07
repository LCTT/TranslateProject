[#]: collector: (lujun9972)
[#]: translator: (Raverstern)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10756-1.html)
[#]: subject: (Fixing Ubuntu Freezing at Boot Time)
[#]: via: (https://itsfoss.com/fix-ubuntu-freezing/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

解决 Ubuntu 在启动时冻结的问题
======

> 本文将向你一步步展示如何通过安装 NVIDIA 专有驱动来处理 Ubuntu 在启动过程中冻结的问题。本教程仅在一个新安装的 Ubuntu 系统上操作验证过，不过在其它情况下也理应可用。

不久前我买了台[宏碁掠夺者][1]笔记本电脑来测试各种 Linux 发行版。这台庞大且笨重的机器与我喜欢的，类似[戴尔 XPS][3]那般小巧轻便的笔记本电脑大相径庭。

我即便不打游戏也选择这台电竞笔记本电脑的原因，就是为了 [NVIDIA 的显卡][4]。宏碁掠夺者 Helios 300 上搭载了一块 [NVIDIA Geforce][5] GTX 1050Ti 显卡。

NVIDIA 那糟糕的 Linux 兼容性为人们所熟知。过去很多 It’s FOSS 的读者都向我求助过关于 NVIDIA 笔记本电脑的问题，而我当时无能为力，因为我手头上没有使用 NVIDIA 显卡的系统。

所以当我决定搞一台专门的设备来测试 Linux 发行版时，我选择了带有 NVIDIA 显卡的笔记本电脑。

这台笔记本原装的 Windows 10 系统安装在 120 GB 的固态硬盘上，并另外配有 1 TB 的机械硬盘来存储数据。在此之上我配置好了 [Windows 10 和 Ubuntu 18.04 双系统][6]。整个的安装过程舒适、方便、快捷。

随后我启动了 [Ubuntu][7]。那熟悉的紫色界面展现了出来，然后我就发现它卡在那儿了。鼠标一动不动，我也输入不了任何东西，然后除了长按电源键强制关机以外我啥事儿都做不了。

然后再次尝试启动，结果一模一样。整个系统就一直卡在那个紫色界面，随后的登录界面也出不来。

这听起来很耳熟吧？下面就让我来告诉你如何解决这个 Ubuntu 在启动过程中冻结的问题。

> 如果你用的不是 Ubuntu

> 请注意，尽管是在 Ubuntu 18.04 上操作的，本教程应该也能用于其他基于 Ubuntu 的发行版，例如 Linux Mint、elementary OS 等等。关于这点我已经在 Zorin OS 上确认过。

### 解决 Ubuntu 启动中由 NVIDIA 驱动引起的冻结问题

![][8]

我介绍的解决方案适用于配有 NVIDIA 显卡的系统，因为你所面临的系统冻结问题是由开源的 [NVIDIA Nouveau 驱动][9]所导致的。

事不宜迟，让我们马上来看看如何解决这个问题。

#### 步骤 1：编辑 Grub

在启动系统的过程中，请你在如下图所示的 Grub 界面上停下。如果你没看到这个界面，在启动电脑时请按住 `Shift` 键。

在这个界面上，按 `E` 键进入编辑模式。

![按“E”按键][10]

你应该看到一些如下图所示的代码。此刻你应关注于以 “linux” 开头的那一行。

![前往 Linux 开头的那一行][11]

#### 步骤 2：在 Grub 中临时修改 Linux 内核参数

回忆一下，我们的问题出在 NVIDIA 显卡驱动上，是开源版 NVIDIA 驱动的不适配导致了我们的问题。所以此处我们能做的就是禁用这些驱动。

此刻，你有多种方式可以禁用这些驱动。我最喜欢的方式是通过 `nomodeset` 来禁用所有显卡的驱动。

请把下列文本添加到以 “linux” 开头的那一行的末尾。此处你应该可以正常输入。请确保你把这段文本加到了行末。

```
 nomodeset
```

现在你屏幕上的显示应如下图所示：

![通过向内核添加 nomodeset 来禁用显卡驱动][12]

按 `Ctrl+X` 或 `F10` 保存并退出。下次你就将以修改后的内核参数来启动。

> 对以上操作的解释

> 所以我们究竟做了些啥？那个 `nomodeset` 又是个什么玩意儿？让我来向你简单地解释一下。

> 通常来说，显卡是在 X 或者是其他显示服务器开始执行后才被启用的，也就是在你登录系统并看到图形界面以后。

> 但近来，视频模式的设置被移进了内核。这么做的众多优点之一就是能你看到一个漂亮且高清的启动画面。

> 若你往内核中加入 `nomodeset` 参数，它就会指示内核在显示服务启动后才加载显卡驱动。

> 换句话说，你在此时禁止视频驱动的加载，由此产生的冲突也会随之消失。你在登录进系统以后，还是能看到一切如旧，那是因为显卡驱动在随后的过程中被加载了。

#### 步骤 3：更新你的系统并安装 NVIDIA 专有驱动

别因为现在可以登录系统了就过早地高兴起来。你之前所做的只是临时措施，在下次启动的时候，你的系统依旧会尝试加载 Nouveau 驱动而因此冻结。

这是否意味着你将不得不在 Grub 界面上不断地编辑内核？可喜可贺，答案是否定的。

你可以在 Ubuntu 上为 NVIDIA 显卡[安装额外的驱动][13]。在使用专有驱动后，Ubuntu 将不会在启动过程中冻结。

我假设这是你第一次登录到一个新安装的系统。这意味着在做其他事情之前你必须先[更新 Ubuntu][14]。通过 Ubuntu 的 `Ctrl+Alt+T` [系统快捷键][15]打开一个终端，并输入以下命令：

```
sudo apt update && sudo apt upgrade -y
```

在上述命令执行完以后，你可以尝试安装额外的驱动。不过根据我的经验，在安装新驱动之前你需要先重启一下你的系统。在你重启时，你还是需要按我们之前做的那样修改内核参数。

当你的系统已经更新和重启完毕，按下 `Windows` 键打开一个菜单栏，并搜索“<ruby>软件与更新<rt>Software & Updates</rt></ruby>”。

![点击“软件与更新”（Software & Updates）][16]

然后切换到“<ruby>额外驱动<rt>Additional Drivers</rt></ruby>”标签页，并等待数秒。然后你就能看到可供系统使用的专有驱动了。在这个列表上你应该可以找到 NVIDIA。

选择专有驱动并点击“<ruby>应用更改<rt>Apply Changes</rt></ruby>”。

![NVIDIA 驱动安装中][17]

新驱动的安装会费点时间。若你的系统启用了 UEFI 安全启动，你将被要求设置一个密码。*你可以将其设置为任何容易记住的密码*。它的用处我将在步骤 4 中说明。

![你可能需要设置一个安全启动密码][18]

安装完成后，你会被要求重启系统以令之前的更改生效。

![在新驱动安装好后重启你的系统][19]

#### 步骤 4：处理 MOK（仅针对启用了 UEFI 安全启动的设备）

如果你之前被要求设置安全启动密码，此刻你会看到一个蓝色界面，上面写着 “MOK management”。这是个复杂的概念，我试着长话短说。

对 MOK（[设备所有者密码][20]）的要求是因为安全启动的功能要求所有内核模块都必须被签名。Ubuntu 中所有随 ISO 镜像发行的内核模块都已经签了名。由于你安装了一个新模块（也就是那个额外的驱动），或者你对内核模块做了修改，你的安全系统可能视之为一个未经验证的外部修改，从而拒绝启动。

因此，你可以自己对系统模块进行签名（以告诉 UEFI 系统莫要大惊小怪，这些修改是你做的），或者你也可以简单粗暴地[禁用安全启动][21]。

现在你对[安全启动和 MOK][22] 有了一定了解，那咱们就来看看在遇到这个蓝色界面后该做些什么。

如果你选择“继续启动”，你的系统将有很大概率如往常一样启动，并且你啥事儿也不用做。不过在这种情况下，新驱动的有些功能有可能工作不正常。

这就是为什么，你应该“选择注册 MOK”。

![][23]

它会在下一个页面让你点击“继续”，然后要你输入一串密码。请输入在上一步中，在安装额外驱动时设置的密码。

> 别担心！

> 如果你错过了这个关于 MOK 的蓝色界面，或不小心点了“继续启动”而不是“注册 MOK”，不必惊慌。你的主要目的是能够成功启动系统，而通过禁用 Nouveau 显卡驱动，你已经成功地实现了这一点。

> 最坏的情况也不过就是你的系统切换到 Intel 集成显卡而不再使用 NVIDIA 显卡。你可以之后的任何时间安装 NVIDIA 显卡驱动。你的首要任务是启动系统。

#### 步骤 5：享受安装了专有 NVIDIA 驱动的 Linux 系统

当新驱动被安装好后，你需要再次重启系统。别担心！目前的情况应该已经好起来了，并且你不必再去修改内核参数，而是能够直接启动 Ubuntu 系统了。

我希望本教程帮助你解决了 Ubuntu 系统在启动中冻结的问题，并让你能够成功启动 Ubuntu 系统。

如果你有任何问题或建议，请在下方评论区给我留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fix-ubuntu-freezing/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[Raverstern](https://github.com/Raverstern)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://amzn.to/2YVV6rt
[2]: https://itsfoss.com/affiliate-policy/
[3]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[4]: https://www.nvidia.com/en-us/
[5]: https://www.nvidia.com/en-us/geforce/
[6]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[7]: https://www.ubuntu.com/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/fixing-frozen-ubuntu.png?resize=800%2C450&ssl=1
[9]: https://nouveau.freedesktop.org/wiki/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/edit-grub-menu.jpg?resize=800%2C393&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/editing-grub-to-fix-nvidia-issue.jpg?resize=800%2C343&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/editing-grub-to-fix-nvidia-issue-2.jpg?resize=800%2C320&ssl=1
[13]: https://itsfoss.com/install-additional-drivers-ubuntu/
[14]: https://itsfoss.com/update-ubuntu/
[15]: https://itsfoss.com/ubuntu-shortcuts/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/activities_software_updates_search-e1551416201782-800x228.png?resize=800%2C228&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/install-nvidia-driver-ubuntu.jpg?resize=800%2C520&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/secure-boot-nvidia.jpg?ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/nvidia-drivers-installed-Ubuntu.jpg?resize=800%2C510&ssl=1
[20]: https://firmware.intel.com/blog/using-mok-and-uefi-secure-boot-suse-linux
[21]: https://itsfoss.com/disable-secure-boot-in-acer/
[22]: https://wiki.ubuntu.com/UEFI/SecureBoot/DKMS
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/MOK-Secure-boot.jpg?resize=800%2C350&ssl=1
