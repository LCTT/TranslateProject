在 Linux 上使用 Lutries 管理你的游戏
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-1-720x340.jpg)

今天我们要讨论的是 **Lutris**，一个 Linux 上的开源游戏平台。你可以使用 Lutries 安装、移除、配置、启动和管理你的游戏。它可以在一个单一界面中帮你管理你的 Linux 游戏、Windows 游戏、仿真控制台游戏和浏览器游戏。它还包含社区编写的安装脚本，使得游戏的安装过程更加简单。  

Lutries 自动安装（或者你可以单击点击安装）了超过 20 个模拟器，它提供了从七十年代到现在的大多数游戏系统。目前支持的游戏系统如下：  

  * Linux 原生
  * Windows
  * Steam (Linux 和 Windows)
  * MS-DOS
  * 街机
  * Amiga 电脑
  * Atari 8 和 16 位计算机和控制器
  * 浏览器 (Flash 或者 HTML5 游戏)
  * Commmodore 8 位计算机
  * 基于 SCUMM 的游戏和其他点击式冒险游戏
  * Magnavox Odyssey²、Videopac+
  * Mattel Intellivision
  * NEC PC-Engine Turbographx 16、Supergraphx、PC-FX
  * Nintendo NES、SNES、Game Boy、Game Boy Advance、DS
  * Game Cube 和 Wii
  * Sega Master Sytem、Game Gear、Genesis、Dreamcast
  * SNK Neo Geo、Neo Geo Pocket
  * Sony PlayStation
  * Sony PlayStation 2
  * Sony PSP
  * 像 Zork 这样的 Z-Machine 游戏
  * 还有更多

### 安装 Lutris

就像 Steam 一样，Lutries 包含两部分：网站和客户端程序。从网站你可以浏览可用的游戏，添加最喜欢的游戏到个人库，以及使用安装链接安装他们。  

首先，我们还是来安装客户端。它目前支持 Arch Linux、Debian、Fedroa、Gentoo、openSUSE 和 Ubuntu。  

对于 **Arch Linux** 和它的衍生版本，像是 Antergos, Manjaro Linux，都可以在 [AUR][1] 中找到。因此，你可以使用 AUR 帮助程序安装它。  

使用 [Pacaur][2]：

```
pacaur -S lutris
```

使用 [Packer][3]：

```
packer -S lutris
```

使用 [Yaourt][4]：

```
yaourt -S lutris
```

使用 [Yay][5]：

```
yay -S lutris
```

**Debian:**

在 **Debian 9.0** 上以 **root** 身份运行以下命令：

```
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ /' > /etc/apt/sources.list.d/lutris.list
wget -nv https://download.opensuse.org/repositories/home:strycore/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install lutris
```

在 **Debian 8.0** 上以 **root** 身份运行以下命令：  

```
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_8.0/ /' > /etc/apt/sources.list.d/lutris.list
wget -nv https://download.opensuse.org/repositories/home:strycore/Debian_8.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install lutris
```

在 **Fedora 27** 上以 **root** 身份运行以下命令：

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:strycore/Fedora_27/home:strycore.repo
dnf install lutris
```

在 **Fedora 26** 上以 **root** 身份运行以下命令：

```
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:strycore/Fedora_26/home:strycore.repo
dnf install lutris
```

在 **openSUSE Tumbleweed** 上以 **root** 身份运行以下命令：  

```
zypper addrepo https://download.opensuse.org/repositories/home:strycore/openSUSE_Tumbleweed/home:strycore.repo
zypper refresh
zypper install lutris
```

在 **openSUSE Leap 42.3** 上以 **root** 身份运行以下命令：  

```
zypper addrepo https://download.opensuse.org/repositories/home:strycore/openSUSE_Leap_42.3/home:strycore.repo
zypper refresh
zypper install lutris
```

**Ubuntu 17.10**：

```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.10/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_17.10/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

**Ubuntu 17.04**：

```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.04/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_17.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

**Ubuntu 16.10**：

```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.10/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_16.10/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

**Ubuntu 16.04**：

```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

对于其他平台，参考 [Lutris 下载链接][6]。

### 使用 Lutris 管理你的游戏

安装完成后，从菜单或者应用启动器里打开 Lutries。首次启动时，Lutries 的默认界面像下面这样：  

![][8]

#### 登录你的 Lutris.net 账号

为了能同步你个人库中的游戏，下一步你需要在客户端中登录你的 Lutris.net 账号。如果你没有，先 [注册一个新的账号][9]。然后点击 “Connecting to your Lutirs.net account to sync your library” 连接到 Lutries 客户端。  

输入你的账号信息然后点击 “Connect”。  

![][10]

现在你已经连接到你的 Lutries.net 账号了。  

![][11]

#### 浏览游戏

点击工具栏里的浏览图标（游戏控制器图标）可以搜索任何游戏。它会自动定向到 Lutries 网站的游戏页。你可以以字母顺序查看所有可用的游戏。Lutries 现在已经有了很多游戏，而且还有更多的不断添加进来。  

![][12]

任选一个游戏，添加到你的库中。  

![][13]

然后返回到你的 Lutries 客户端，点击 “Menu -> Lutris -> Synchronize library”。现在你可以在本地的 Lutries 客户端中看到所有在库中的游戏了。  

![][14]

如果你没有看到游戏，只需要重启一次。  

#### 安装游戏

安装游戏，只需要点击游戏，然后点击 “Install” 按钮。例如，我想在我的系统安装 [2048][15]，就像你在底下的截图中看到的，它要求我选择一个版本去安装。因为它只有一个版本（例如，在线），它就会自动选择这个版本。点击 “Continue”。  

![][16]

点击“Install”：

![][17]

安装完成之后，你可以启动新安装的游戏或是关闭这个窗口，继续从你的库中安装其他游戏。  

#### 导入 Steam 库

你也可以导入你的 Steam 库。在你的头像处点击 “Sign in through Steam” 按钮。接下来你将被重定向到 Steam，输入你的账号信息。填写正确后，你的 Steam 账号将被连接到 Lutries 账号。请注意，为了同步库中的游戏，这里你的 Steam 账号将被公开。你可以在同步完成之后将其重新设为私密状态。  

#### 手动添加游戏

Lutries 有手动添加游戏的选项。在工具栏中点击 “+” 号登录。  

![][18]

在下一个窗口，输入游戏名，在游戏信息栏选择一个运行器。运行器是指 Linux 上类似 wine、Steam 之类的程序，它们可以帮助你启动这个游戏。你可以从 “Menu -> Manage” 中安装运行器。  

![][19]

然后在下一栏中选择可执行文件或者 ISO。最后点击保存。有一个好消息是，你可以添加一个游戏的多个版本。  

#### 移除游戏

移除任何已安装的游戏，只需在 Lutries 客户端的本地库中点击对应的游戏。选择 “Remove” 然后 “Apply”。  

![][20]

Lutries 就像 Steam。只是从网站向你的库中添加游戏，并在客户端中为你安装它们。  

各位，这就是今天所有的内容了。我们将会在今年发表更多好的和有用的文章。敬请关注！  

干杯！

：）

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/manage-games-using-lutris-linux/

作者：[SK][a]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/lutris/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/install-yaourt-arch-linux/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://lutris.net/downloads/
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-1-1.png
[9]:https://lutris.net/user/register/
[10]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-2.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-3.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-15-1.png
[13]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-16.png
[14]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-6.png
[15]:https://www.ostechnix.com/let-us-play-2048-game-terminal/
[16]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-12.png
[17]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-13.png
[18]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-18-1.png
[19]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-19.png
[20]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-14-1.png
