[#]: subject: "How to Install Discord on Fedora Linux"
[#]: via: "https://itsfoss.com/install-discord-fedora/"
[#]: author: "Pranav Krishna https://itsfoss.com/author/pranav/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14025-1.html"

如何在 Fedora Linux 上安装 Discord
======

![](https://img.linux.net.cn/data/attachment/album/202111/27/115501g3oiuirvzk4nvu3k.jpg)

[Discord][1] 是一个流行的消息收发应用，可用于文字和语音信息传递。

它是一些社区的福音，可以帮助他们扩大项目，接触更多的人，并维持一个粉丝和关注者的社区。而 Discord 最初是为游戏玩家设计的，这很令人惊讶。

Discord 可用于各种平台，包括 Linux。在本教程中，我将引导你完成在 Fedora 中安装 Discord 的步骤。

  * 使用 DNF 和 RPM Fusion 仓库安装 Discord
  * 通过 Flatpak 安装Discord

Flatpak 软件包是沙盒的，因此需要更多的磁盘空间和时间来启动。然而，他们会相当快地更新到新的版本。

无论你想使用 Flatpak 还是 DNF，选择权在你手上。我将向你展示这两种方法。

> 非 FOSS 警报！
>
> Discord 并不是开源的。但由于他们提供了一个 Linux 客户端，而且许多 Linux 用户都依赖它，所以我们会在这里介绍它。

### 方法 1：通过 RPM Fusion 仓库安装 Discord

Discord 可以通过添加非自由的 RPM Fusion 仓库来安装，这是大多数 Fedora 用户的首选方法，因为更新很容易，而且应用的启动速度比 Flatpak 版本快。

打开终端，使用下面的命令来添加 RPM-fusion 非自由仓库：

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

```

完成后，更新仓库列表（应该不需要，但只是为了它）：

```
sudo dnf update
```

然后通过 `dnf` 命令安装 Discord，像这样：

```
sudo dnf install discord
```

![Installing Discord using DNF][2]

如果被要求导入 GPG 密钥，只要按 `Y` 就可以授权了。

![Authorize GPG key][3]

这就完成了！现在你可以从应用菜单中启动 Discord。你的登录页面将看起来像这样：

![Launch Discord application][4]

#### 通过 DNF 删除 Discord

如果你不想再使用 Discord，你可以从你的系统中删除它。要做到这一点，在终端运行以下命令：

```
sudo dnf remove discord
```

这真的很简单，不是吗？还有一种简单的安装 Discord 的方法，那就是使用 Flatpak 软件包。

### 方法 2：通过 Flatpak 安装 Discord

Discord 可以使用 Flatpak 轻松安装，因为它在 Fedora 中是默认可用的。

首先，你需要在 Fedora 中启用 Flatpak 仓库：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

接下来，通过这个命令安装 Discord：

```
flatpak install discord
```

![Install Discord via Flatpak][5]

如果你想删除 Discord，那么只需运行：

```
flatpak remove discord
```

这就超级简单了。如果你在 Fedora Linux 上安装 Discord 需要任何帮助，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-discord-fedora/

作者：[Pranav Krishna][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pranav/
[b]: https://github.com/lujun9972
[1]: https://discord.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-discord-dnf.png?resize=800%2C525&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/authorize-gpg-key-1.png?resize=800%2C573&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Discord-2.png?resize=800%2C432&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-discord-flatpak.png?resize=800%2C545&ssl=1
