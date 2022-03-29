[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Install Privacy-friendly WhatsApp Alternative Signal on Linux Desktop"
[#]: via: "https://itsfoss.com/install-signal-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"

在Linux桌面上安装隐私友好的WhatsApp替代品软件Signal
======

即时通讯软件Signal作为我的理想选择有一年多了。具有隐私意识的人和技术牛人已经意识到这个厉害软件的存在，与此同时，在最近的WhatsApp隐私政策更新之后，Signal更是得到了很多人的褒奖。

无论什么原因，如果你对Signal一无所知，同时你想知道是否能在桌面上使用Signal，答案是肯定的。你可以在Linux，Windows和macOS系统以及智能手机上安装Signal。


![Signal Messenger on Pop OS Linux distribution][3]

我不想强调Sinal的功能，因为你可能已经有所了解。我只想向你展示在Linux桌面上安装Signal的不同方法：

  * 用Snap包管理器在Liunx上安装Sigal (除自动更新和无障碍安装之外，snap程序会加载很长时间)
  * 用apt包管理器在Debian和基于Ubuntu的发行版上安装Signal(除了安装程序并自动更新外，还有添加仓库额外的操作)
  * 用AUR包管理器在Arch和Manjaro Linux上安装Signal
  * 用Flatpak包在Fedora和其他Linux系统上安装Signal


你可以基于你的发行版和偏好来选择这些安装方法的其中一种：


### 方法 1:用Snap包管理器在Liunx上安装Signal

如果你正在使用Ubuntu，你可以在软件中心找到Signal桌面版程序的Snap格式软件包。

![][4]

或者，你可以在任何[有Snap包支持功能的Linux发行版][6]上[使用Snap命令][5]安装Signal。

```
sudo snap install signal-desktop
```

你可以使用`snap remove` 命令或者从软件中心删除它。

有些人不喜欢Snap包是因为它们启动时间太长。好消息是你能够使用apt命令来安装Signal。下一部分我们再讨论。


### 方法 2: 通过APT在Debian和基于Ubuntu的发行版上安装Signal (使用官方Signal仓库)

这里是你必须在Debian，Linux Mint,elementary OS 和基于Debian/Ubuntu的其他发行版跟从安装Signal的步骤。你可以[在终端里复制和粘贴命令][7]。

第一件事是得到官方Signal仓库的GPG密钥，并且把它加入到你的APT包管理器可信任的密钥中。

```
wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
```

密钥添加之后，你可以将仓库安全的添加的你的系统中。 _**不要因为仓库名称使用xenial惊慌失措**_。它将适配Ubuntu18.04，20.04和更新的版本以及Debian，Mint等等系统。

```
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
```

多亏了 [Linux的tee命令][8],在sources.list目录`/etc/apt/sources.list.d`下你将会有一个叫做 `signal-xenial.list`的新文件。这个新文件有Signal仓库信息即`deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main`。


既然你已经添加了仓库，那么来更新缓存并安装Signal桌面程序吧：


```
sudo apt update && sudo apt install signal-desktop
```

一旦安装成功，在程序菜单找到Signal然后启动它。

![][9]

由于你已经添加了仓库，你安装的Signal程序将会伴随系统日常更新而自动更新。

享受在Linux桌面上使用Signal加密通讯的乐趣吧。

#### 删除Signal

如果我不分享给你删除的步骤，那么指南是不完整的。让我们看一下。

首先，删除程序：

```
sudo apt remove signal-desktop
```

你可以保持原样，或者你可以从系统中删除Signal仓库。对你来说是可选择的。仓库继续在系统里的话，你可以轻松的再次安装Signal。如果你删除了仓库的话，你将不得不按照之前的步骤再次重新添加仓库。

如果你也想同时删除掉Signal仓库，你可以选择图形化方法，通过软件和更新工具在那里删除它。

![][10]

或者，你可以用rm命令来删除这个文件：

```
rm -i /etc/apt/sources.list.d/signal-xenial.list
```

### 方法 3:用AUR包管理器在Arch和Manjaro Linux上安装Signal

通过[AUR包管理器][12]在 [基于Arch的Linux发行版][11上安装Signal是有效的。如果你在Manjaro上使用Pamac并且启用了AUR包管理器，在包管理器里你可以找到Signal。


否则，你可以经常[使用AUR的帮助][13]。

```
sudo yay -Ss <package-name>
```

我相信你能够在相似的功能下删除店Signal。

### 方法 4:  用Flatpak包在Fedora和其他Linux系统上安装Signal

Signal没有.rpm的安装文件。然而，[Flatpak包是可用的][14],并且你可以在Fedora上用它来安装Signal。


```
flatpak install flathub org.signal.Signal
```

一旦安装成功，你可以从菜单中运行它或者在终端中输入以下命令：

```
flatpak run org.signal.Signal
```


Signal和Telegram是抛弃掉WhatsApp的两个主流和独立的可选软件。这两个软件都提供本地的Linux桌面程序。如果你使用Telegram，你可以[加入It’s FOSS的官方频道][15]。我个人来说使用Signal，因为它没有‘频道’这个功能。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-signal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[校对者ID](https://github.com/校对者ID)

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
