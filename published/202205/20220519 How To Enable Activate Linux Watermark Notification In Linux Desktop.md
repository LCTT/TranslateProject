[#]: subject: "How To Enable Activate Linux Watermark Notification In Linux Desktop"
[#]: via: "https://ostechnix.com/activate-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14617-1.html"

如何在 Linux 桌面中启用 “激活 Linux” 水印通知
======

![](https://img.linux.net.cn/data/attachment/album/202205/20/112226f7zmsvqqvt9tln9n.jpg)

> “激活 Windows” 水印已移植到 Linux。

为了阻止 Windows 操作系统的盗版行为，微软开发团队想出了一个办法：在 Windows 的角落放置一个激活水印，直到用户合法购买许可证并激活它。

如果你的电脑正在运行盗版的 Windows 副本，你应该已经注意到右下角的 “激活 Windows” 水印通知，如下图所示。

![“激活 Windows” 通知][1]

幸运的是，Linux 用户永远不会收到这样的通知。因为 GNU/Linux 是一个完全免费的开源操作系统，在 GNU 通用公共许可证（GPL）下发布。

任何人都可以运行、研究、修改和重新分发 Linux 源代码，甚至可以出售修改后的代码的副本，只要使用相同的许可即可。

Linux 是开源的，所以你真的可以用 Linux 做任何你在专有操作系统上不能做的事情。

你可以在 Linux 中做很多事情。你可以在 Linux 下构建和运行*几乎*任何东西，无论是有趣的项目还是企业级应用程序。甚至，你还可以添加 “激活 Linux” 水印。

### “激活 Linux” 是什么？

几天前，我注意到了一个叫做 “激活 Linux” 的有趣项目。它和你在未经许可的 Windows 操作系统中看到的 “激活 Windows” 通知非常相似。

“激活 Linux” 的开发者使用 C 语言中的 Xlib 和 cairo，重新创建了 Linux 版的 “激活 Windows” 通知水印。

它会在你的 Linux 桌面上显示一个水印，并通知你进入设置以激活你的 Linux 发行版！这很酷，不是吗？

### 启用 “激活 Linux” 水印

activate-linux 项目在短时间内变得非常流行。几天之内，它已经为许多流行的 Linux 发行版而打了包，例如 Arch Linux、openSUSE 和 Ubuntu。

#### Arch Linux

[AUR][2] 已经收录 activate-linux。因此，你可以使用 [Paru][3] 或 [Yay][4] 在 Arch Linux 及其衍生版 EndeavourOS 和 Manjaro Linux 中安装 activate-linux 应用程序。

```
$ paru -S activate-linux
```

或者

```
$ yay -S activate-linux
```

#### openSUSE

[OBS][5] 收录了 Activate-linux。

如果你正在使用 openSUSE Tumbleweed 版本，请逐条运行下面的命令来安装 activate-linux：

```
$ sudo zypper addrepo https://download.opensuse.org/repositories/home:WoMspace/openSUSE_Tumbleweed/home:WoMspace.repo
$ sudo zypper refresh
$ sudo zypper install activate-linux
```

对于 openSUSE Factory ARM 版，运行如下命令：

```
$ sudo zypper addrepo https://download.opensuse.org/repositories/home:WoMspace/openSUSE_Factory_ARM/home:WoMspace.repo
$ sudo zypper refresh
$ sudo zypper install activate-linux
```

#### Ubuntu

activate-linux 有一个适用于 Ubuntu 及其衍生版（如 Pop!_OS）的 PPA。

```
$ sudo add-apt-repository ppa:edd/misc
$ sudo apt update
$ sudo apt install activate-linux
```

安装完成后，只需在终端执行下面的命令，就可以让它运行起来：

```
$ activate-linux
```

现在，你将在桌面的角落看到 “激活 Linux” 水印通知，就像在未授权的 Windows 副本中一样。

![桌面上的 “激活 Linux” 水印][6]

别紧张！它是无害的。若想取消显示，你可以返回终端并按 `CTRL+C` 终止 `activate-linux` 命令。

我在 Ubuntu 22.04 GNOME 版本上测试了一下。它在 Wayland 中开箱即用。

“激活 Linux” 是我这一段时间以来遇到的一个非常有趣又无用的项目。我想这会让每个刚从 Windows 切换过来的 Linux 用户，拥有更加舒适的体验吧！

### 相关资源

* [“激活 Linux” 的 GitHub 存储库][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/activate-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Activate-Windows-Notification.png
[2]: https://aur.archlinux.org/packages/activate-linux-git
[3]: https://ostechnix.com/how-to-install-paru-aur-helper-in-arch-linux/
[4]: https://ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: https://software.opensuse.org//download.html?project=home%3AWoMspace&package=activate-linux
[6]: https://ostechnix.com/wp-content/uploads/2022/05/Activate-Linux.png
[7]: https://github.com/MrGlockenspiel/activate-linux
