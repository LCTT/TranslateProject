如何在 Ubuntu 中安装语音聊天工具 Discord
============================================================

 ![](https://www.maketecheasier.com/assets/uploads/2017/04/discord-feat.jpg "How to Install Discord on Ubuntu Linuxs") 

Discord 是一个非常受欢迎的文字和语音聊天程序。虽然开始时主要面向游戏玩家，但它几乎获得了所有人的了广泛青睐。

Discord 不仅仅是一个很好的聊天客户端。当你安装它时，你还可以获得其强大的服务端功能，强力而自足。游戏玩家和非玩家都可以在几分钟内开启自己的私人聊天服务，这使 Discord 成为团队、公会和各种社区的明显选择。

Linux 用户经常被游戏世界遗忘。但 Discord 并不是这样。它的开发人员也在 Linux 下积极构建并维护其流行聊天平台。Ubuntu 用户甚至拥有更好的待遇，Discord 捆绑在方便的 Debian/Ubuntu .deb 包中。

### 获取并安装软件包

有几种方法在 Ubuntu 下获取 Discord。你可以都看一下，并选择一个你喜欢的。

### 依赖

在 Discord 的下载页面上没有什么关于依赖的内容，但是在 Ubuntu 上安装之前，你需要安装一些依赖。没什么大不了的。打开你的终端，并输入以下命令以获得所需内容：

```
sudo apt install libgconf-2-4 libappindicator1
```

### 图形化安装

图形化安装会耗时长一点，但是这对 Linux 新手而言更简单。

 ![Download Discord for Linux](https://www.maketecheasier.com/assets/uploads/2017/04/discord-download.jpg "Download Discord for Linux") 

首先进入 Discord 的[网站][11]。该网站应该能自动检测到你正在运行的 Linux，并在页面正中建议正确的包。

如果没有，只需向下滚动一下。页面的下一部分会显示其他可用的下载，而 Linux 包就在那里。

找到 Linux 的下载链接后，请检查是否选择了 “deb”，然后单击 “Download” 按钮。

 ![Ubuntu prompt to install Discord](https://www.maketecheasier.com/assets/uploads/2017/04/discord-install1.jpg "Ubuntu prompt to install Discord") 

浏览器会询问你想要用 Ubuntu 软件安装器打开或者下载文件。你可以选择任意一个，但是自动用软件安装器打开会更快。

 ![Ubuntu Software Center Discord Inst all](https://www.maketecheasier.com/assets/uploads/2017/04/discord-install2.jpg "Ubuntu Software Center Discord Inst all") 

下载很快，所以安装程序会立即打开，并允许你安装新下载的软件包。这是一个非常简单的窗口，没有漂亮的图标或很多描述性的文本，所以不要犹豫。这是正常的。单击 “Install” 开始安装。

安装过程不会耗费太长时间。之后，Discord 就可以使用了。

### 命令行安装

“懒惰”的 Linux 熟手并不在意花哨的 GUI 工具。如果你是这个阵营的人，那么你有一个更直接的命令行选项。

首先，打开一个终端并进入你的下载目录。在那里可以使用 `wget` 直接下载 .deb 包。

```
cd ~/Downloads 
wget -O discord-0.0.1.deb https://discordapp.com/api/download?platform=linux&format=deb
```

下载完成后，你可以使用 `dpkg` 直接安装 .deb 软件包。运行下面的命令：

```
sudo dpkg -i discord-0.0.1.deb
```

### 测试一下

 ![Discord icon in Unity](https://www.maketecheasier.com/assets/uploads/2017/04/discord-start-unity.jpg "Discord icon in Unity") 

现在你可以打开软件启动器并搜索 Discord。单击图标运行。

 ![Login to Discord on Ubuntu](https://www.maketecheasier.com/assets/uploads/2017/04/discord-login.jpg "Login to Discord on Ubuntu") 

首次启动，根据你需求，创建一个帐户或者登录。

 ![Discord running on Ubuntu Linux](https://www.maketecheasier.com/assets/uploads/2017/04/discord-running.jpg "Discord running on Ubuntu Linux") 

登录后，你就进入 Discord 了。它会提供一些介绍教程和建议。你可以直接略过并开始尝试。欢迎进入你新的 Linux 聊天体验！

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/install-discord-ubuntu/

作者：[Nick Congleton][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/author/nickcongleton/
[2]:https://www.maketecheasier.com/install-discord-ubuntu/#respond
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-discord-ubuntu%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-discord-ubuntu%2F&text=How+to+Install+Discord+on+Ubuntu+Linux
[6]:mailto:?subject=How%20to%20Install%20Discord%20on%20Ubuntu%20Linux&body=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-discord-ubuntu%2F
[7]:https://www.maketecheasier.com/faulty-graphics-card-and-the-fix/
[8]:https://www.maketecheasier.com/set-power-button-turn-off-display-windows10/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:https://support.google.com/adsense/troubleshooter/1631343
[11]:https://discordapp.com/download
