如何在 Linux 上安装 Spotify
======

如何在 Ubuntu Linux 桌面上安装 Spotify 来在线听音乐？

Spotify 是一个可让你访问大量歌曲的数字音乐流服务。你可以免费收听或者购买订阅。可以创建播放列表。订阅用户可以免广告收听音乐。你会得到更好的音质。本教程**展示如何使用在 Ubuntu、Mint、Debian、Fedora、Arch 和其他更多发行版**上的 snap 包管理器安装 Spotify。

### 在 Linux 上安装 spotify

在 Linux 上安装 spotify 的步骤如下：

1. 安装 snapd
2. 打开 snapd
3. 找到 Spotify snap：
```
snap find spotify
```
4. 安装 spotify：
```
do snap install spotify
```
5. 运行：
```
spotify &
```

让我们详细看看所有的步骤和例子。

### 步骤 1 - 安装 Snapd

你需要安装 snapd 包。它是一个守护进程（服务），并能在 Linux 系统上启用 snap 包管理。

#### Debian/Ubuntu/Mint Linux 上的 Snapd

输入以下[ apt 命令][1]/ [apt-get 命令][2]：
`$ sudo apt install snapd`

#### 在 Arch Linux 上安装 snapd

snapd 只包含在 Arch User Repository（AUR）中。运行 yaourt 命令（参见[如何在 Archlinux 上安装 yaourt][3]）：
```
$ sudo yaourt -S snapd
$ sudo systemctl enable --now snapd.socket
```

#### 在 Fedora 上获取 snapd

运行 snapd 命令
```
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
```

#### OpenSUSE 安装 snapd

执行 snap 命令：
`$ snap find spotify`
[![snap search for spotify app command][4]][4]
安装它：
`$ sudo snap install spotify`
[![How to install Spotify application on Linux using snap command][5]][5]

### 步骤 3 - 运行 spotify 并享受它(译注：原博客中就是这么直接跳到 step3 的)

从 GUI 运行它，或者只需输入：
`$ spotify`
在启动时自动登录你的帐户：
```
$ spotify --username vivek@nixcraft.com
$ spotify --username vivek@nixcraft.com --password 'myPasswordHere'
```
在初始化时使用给定的 URI 启动 Spotify 客户端：
`$ spotify--uri=<uri>`
以指定的网址启动：
`$ spotify--url=<url>`
[![Spotify client app running on my Ubuntu Linux desktop][6]][6]

### 关于作者

作者是 nixCraft 的创建者，是经验丰富的系统管理员，也是 Linux 操作系统/Unix shell 脚本的培训师。他曾与全球客户以及 IT、教育、国防和太空研究以及非营利部门等多个行业合作。在 [Twitter][7]、[Facebook][8]、[Google +][9] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-install-spotify-application-on-linux/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[2]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[3]:https://www.cyberciti.biz/faq/how-to-install-yaourt-in-arch-linux/
[4]:https://www.cyberciti.biz/media/new/faq/2018/01/snap-search-for-spotify-app-command.jpg
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-install-Spotify-application-on-Linux-using-snap-command.jpg
[6]:https://www.cyberciti.biz/media/new/faq/2018/01/Spotify-client-app-running-on-my-Ubuntu-Linux-desktop.jpg
[7]:https://twitter.com/nixcraft
[8]:https://facebook.com/nixcraft
[9]:https://plus.google.com/+CybercitiBiz
