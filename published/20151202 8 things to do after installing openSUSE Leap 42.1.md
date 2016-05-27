安装 openSUSE Leap 42.1 之后要做的 8 件事
================================================================================
![Credit: Metropolitan Transportation/Flicrk](http://images.techhive.com/images/article/2015/11/things-to-do-100626947-primary.idge.jpg)

*致谢：[Metropolitan Transportation/Flicrk][1]*

> 如果你已经在你的电脑上安装了 openSUSE，这就是你接下来要做的。

[openSUSE Leap 确实是个巨大的飞跃][2]，它允许用户运行一个和 SUSE Linux 企业版拥有同样基因的发行版。和其它系统一样，为了实现最佳的使用效果，在使用它之前需要做些优化设置。

下面是一些我在我的电脑上安装 openSUSE Leap 之后做的一些事情（不适用于服务器）。这里面没有强制性的设置，基本安装对你来说也可能足够了。但如果你想获得更好的 openSUSE Leap 体验，那就跟着我往下看吧。

### 1. 添加 Packman 仓库 ###

由于专利和授权等原因，openSUSE 和许多 Linux 发行版一样，不通过官方仓库（repos）提供一些软件、解码器，以及驱动等。取而代之的是通过第三方或社区仓库来提供。第一个也是最重要的仓库是“Packman”。因为这些仓库不是默认启用的，我们需要添加它们。你可以通过 YaST（openSUSE 的特色之一）或者命令行完成（如下方介绍）。

![o42 yast repo](http://images.techhive.com/images/article/2015/11/o42-yast-repo-100626952-large970.idge.png)

*添加 Packman 仓库。*

使用 YaST，打开软件源部分。点击“添加”按钮并选择“社区仓库（Community Repositories）”。点击“下一步”。一旦仓库列表加载出来了，选择 Packman 仓库。点击“确认”，然后点击“信任”导入信任的 GnuPG 密钥。

或者在终端里使用以下命令添加并启用 Packman 仓库：

    zypper ar -f -n packmanhttp://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.1/ packman

仓库添加之后，你就可以使用更多的包了。想安装任意软件或包，打开 YaST 软件管理器，搜索并安装即可。

### 2. 安装 VLC ###

VLC 是媒体播放器里的瑞士军刀，几乎可以播放任何媒体文件。你可以从 YaST 软件管理器 或 software.opensuse.org 安装 VLC。你需要安装两个包：vlc 和 vlc-codecs。

如果你用终端，运行以下命令：

    sudo zypper install vlc vlc-codecs

### 3. 安装 Handbrake ###

如果你需要转码或转换视频文件格式，[Handbrake 是你的不二之选][3]。Handbrake 就在我们启用的仓库中，所以只需要在 YaST 中搜索并安装它即可。

如果你用终端，运行以下命令：

    sudo zypper install handbrake-cli handbrake-gtk

（提示：VLC 也能转码音频和视频文件。）

### 4. 安装 Chrome ###

openSUSE 的默认浏览器是 Firefox。但是因为 Firefox 不能够播放专有媒体，比如 Netflix，我推荐安装 Chrome。这需要额外的工作。首先你需要从谷歌导入信任密钥。打开终端执行“wget”命令下载密钥：

    wget https://dl.google.com/linux/linux_signing_key.pub

然后导入密钥：

    sudo rpm --import linux_signing_key.pub

现在到 [Google Chrome 网站][4] 去，下载 64 位 .rpm 文件。下载完成后执行以下命令安装浏览器：

    sudo zypper install /PATH_OF_GOOGLE_CHROME.rpm

### 5. 安装 Nvidia 驱动 ###

即便你使用 Nvidia 或 ATI 显卡，openSUSE Leap 也能够开箱即用。但是，如果你需要专有驱动来游戏或其它目的，你可以安装这些驱动，但需要一点额外的工作。

首先你需要添加 Nvidia 源；它的步骤和使用 YaST 添加 Packman 仓库是一样的。唯一的不同是你需要在社区仓库部分选择 Nvidia。添加好了之后，到 **软件管理 > 附加** 去并选择“附加/安装所有匹配的推荐包”。

![o42 nvidia](http://images.techhive.com/images/article/2015/11/o42-nvidia-100626950-large.idge.png)

它会打开一个对话框，显示所有将要安装的包，点击确认后按介绍操作。添加了 Nvidia 源之后你也可以通过命令安装需要的 Nvidia 驱动：

    sudo zypper inr

（注：我没使用过 AMD/ATI 显卡，所以这方面我没有经验。）

### 6. 安装媒体解码器 ###

你安装 VLC 之后就不需要安装媒体解码器了，但如果你要使用其它软件来播放媒体的话就需要安装了。一些开发者写了脚本/工具来简化这个过程。打开[这个页面][5]并点击合适的按钮安装完整的包。它会打开 YaST 并自动安装包（当然通常你还需要提供 root 权限密码并信任 GnuPG 密钥）。

### 7. 安装你喜欢的电子邮件客户端 ###

openSUSE 自带 Kmail 或 Evolution，这取决于你安装的桌面环境。我用的是 KDE Plasma 自带的 Kmail，这个邮件客户端还有许多地方有待改进。我建议可以试试 Thunderbird 或 Evolution。所有主要的邮件客户端都能在官方仓库找到。你还可以看看我[精心挑选的 Linux 最佳邮件客户端][7]。

### 8. 在防火墙允许 Samba 服务 ###

相比于其它发行版，openSUSE 默认提供了更加安全的系统。但对新用户来说它也需要一点设置。如果你正在使用 Samba 协议分享文件到本地网络的话，你需要在防火墙允许该服务。

![o42 firewall](http://images.techhive.com/images/article/2015/11/o42-firewall-100626948-large970.idge.png)

*在防火墙设置里允许 Samba 客户端和服务端*

打开 YaST 并搜索 Firewall。在防火墙设置里，进入到“允许的服务（Allowed Services）”，你会在“要允许的服务（Service to allow）”下面看到一个下拉列表。选择“Samba 客户端”，然后点击“添加”。同样方法添加“Samba 服务器”。都添加了之后，点击“下一步”，然后点击“完成”，现在你就可以通过本地网络从你的 openSUSE 分享文件以及访问其它机器了。

这差不多就是我以我喜欢的方式对我的新 openSUSE 系统做的所有设置了。如果你有任何问题，欢迎在评论区提问。

--------------------------------------------------------------------------------

via: http://www.itworld.com/article/3003865/open-source-tools/8-things-to-do-after-installing-opensuse-leap-421.html

作者：[Swapnil Bhartiya][a]
译者：[alim0x](https://github.com/alim0x)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/author/Swapnil-Bhartiya/
[1]:https://www.flickr.com/photos/mtaphotos/11200079265/
[2]:https://www.linux.com/news/software/applications/865760-opensuse-leap-421-review-the-most-mature-linux-distribution
[3]:https://www.linux.com/learn/tutorials/857788-how-to-convert-videos-in-linux-using-the-command-line
[4]:https://www.google.com/intl/en/chrome/browser/desktop/index.html#brand=CHMB&utm_campaign=en&utm_source=en-ha-na-us-sk&utm_medium=ha
[5]:http://opensuse-community.org/
[6]:http://www.itworld.com/article/2875981/the-5-best-open-source-email-clients-for-linux.html
