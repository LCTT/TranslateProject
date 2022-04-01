[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14419-1.html"
[#]: subject: "Install Privacy-friendly WhatsApp Alternative Signal on Linux Desktop"
[#]: via: "https://itsfoss.com/install-signal-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"

在 Linux 桌面上安装隐私友好的 Signal
======

![](https://img.linux.net.cn/data/attachment/album/202204/01/101558k7l28z2lh3h8655h.jpg)

自从我们报道将 Signal 作为即时通讯软件的理想选择以来，已经过去一年多了。虽然具有隐私意识的人和静态技术的人已经意识到了这个了不起的软件的存在，与此同时，在最近的 WhatsApp 隐私政策更新之后，Signal 更是得到了很多人的褒奖。

无论什么原因，如果你对 Signal 一无所知，想知道是否能在桌面上使用 Signal，那么答案是肯定的。你可以在 Linux、Windows 和 macOS 系统以及智能手机上安装 Signal。

![Signal Messenger on Pop OS Linux distribution][3]

我不打算强调 Signal 的功能，因为你可能已经有所了解。我只想向你展示在 Linux 桌面上安装 Signal 的不同方法：

  * 用 Snap 包在 Liunx 上安装 Signal（Snap 应用程序需要更长的时间来加载，但可以获得自动更新和轻松的安装）
  * 用 apt 包在基于 Debian 和 Ubuntu 的发行版上安装 Signal（添加软件库需要额外的操作，但已安装的应用程序会自动更新）
  * 用 AUR 在 Arch 和 Manjaro Linux 上安装 Signal
  * 用 Flatpak 包在 Fedora 等 Linux 系统上安装 Signal

你可以基于你的发行版和偏好来选择这些安装方法的其中一种：

### 方法 1：用 Snap 包在 Linux 上安装 Signal

如果你正在使用 Ubuntu，你可以在软件中心找到 Signal 桌面版程序的 Snap 格式的软件包。

![][4]

或者，你可以在任何 [有 Snap 包支持功能的 Linux 发行版][6] 上 [使用 Snap 命令][5] 安装 Signal。

```
sudo snap install signal-desktop
```

你可以使用 `snap remove` 命令或者从软件中心删除它。

有些人不喜欢 Snap 包是因为它们启动时间太长。好消息是你能够使用 `apt` 命令来安装 Signal。下一节我们讨论它。

### 方法 2：通过 apt 在基于 Debian 和 Ubuntu 的发行版上安装 Signal（使用官方 Signal 仓库）

这里是你在 Debian、Ubuntu、Linux Mint、elementary OS 和基于 Debian/Ubuntu 的其他发行版中安装 Signal 必须遵循的步骤。你可以 [复制这些命令并将其粘贴到终端][7]。

第一件事是得到官方 Signal 仓库的 GPG 密钥，并且把它加入到你的 APT 包管理器可信任的密钥中。

```
wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
```

密钥添加之后，你可以将仓库安全的添加的你的系统中。**不要因为仓库名称使用了 xenial 就惊慌失措**。它可以在 Ubuntu 18.04、20.04 和更新的版本以及 Debian、Mint 等系统中工作。

```
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
```

借助 [Linux 的 tee 命令][8]，在 `/etc/apt/sources.list.d` 目录下你将会有一个叫做  `signal-xenial.list` 的新文件。这个新文件有 Signal 仓库信息即 `deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main`。

既然你已经添加了仓库，那么来更新缓存并安装 Signal 桌面程序吧：

```
sudo apt update && sudo apt install signal-desktop
```

一旦安装成功，在程序菜单找到 Signal 然后启动它。

![][9]

由于你已经添加了仓库，你安装的 Signal 程序将会伴随系统日常更新而自动更新。

享受在 Linux 桌面上使用 Signal 加密通讯的乐趣吧。

#### 删除 Signal

如果我不分享给你删除的步骤，那么指南是不完整的。让我们看一下。

首先，删除该程序：

```
sudo apt remove signal-desktop
```

你可以留下它，也可以从系统中删除 Signal 仓库。对你来说是都是可以的。仓库继续在系统里的话，你可以轻松的再次安装 Signal。如果你删除了仓库的话，你得按照之前的步骤再次重新添加仓库。

如果你也想同时删除掉 Signal 仓库，你可以选择图形化方法，通过“软件和更新”工具，在那里删除它。

![][10]

或者，你可以用 `rm` 命令来删除这个文件：

```
rm -i /etc/apt/sources.list.d/signal-xenial.list
```

### 方法 3：用 AUR 在 Arch 和 Manjaro Linux 上安装 Signal

通过 [AUR][12] 在 [基于 Arch 的 Linux 发行版][11] 上安装 Signal 是有效的。如果你在 Manjaro 上使用 Pamac 并且启用了 AUR，在包管理器里你可以找到 Signal。

否则，你可以经常 [使用 AUR 辅助工具][13]。

```
sudo yay -Ss <package-name>
```

我相信你能够在相似的功能中删除 Signal。

### 方法 4：用 Flatpak 包在 Fedora 等 Linux 系统上安装 Signal

Signal 没有 RPM 的安装文件。然而，[Flatpak 包是有的][14]，你可以在 Fedora 上用它来安装 Signal。

```
flatpak install flathub org.signal.Signal
```

一旦安装成功，你可以从菜单中运行它，或者在终端中输入以下命令：

```
flatpak run org.signal.Signal
```


Signal 和 Telegram 是抛弃掉 WhatsApp 的两个主流而可行的选择。这两个软件都提供原生的 Linux 桌面程序。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-signal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/signal-messaging-app/
[2]: https://signal.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-shot.jpg?resize=800%2C565&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/signal-desktop-ubuntu.png?resize=800%2C425&ssl=1
[5]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[6]: https://itsfoss.com/install-snap-linux/
[7]: https://itsfoss.com/copy-paste-linux-terminal/
[8]: https://linuxhandbook.com/tee-command/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/signal-app-in-ubuntu.jpg?resize=795%2C230&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-signal-repository.png?resize=800%2C401&ssl=1
[11]: https://itsfoss.com/arch-based-linux-distros/
[12]: https://itsfoss.com/aur-arch-linux/
[13]: https://itsfoss.com/best-aur-helpers/
[14]: https://flathub.org/apps/details/org.signal.Signal
[15]: https://t.me/joinchat/AAAAAEPRGUJrEE1itjpH6A
