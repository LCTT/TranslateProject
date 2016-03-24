Windows 下的免费 SSH 客户端工具
================================================================================

如果你的操作系统是 Windows，而你想要连接 Linux 服务器相互传送文件，那么你需要一个简称 SSH 的 Secure Shell 软件。实际上，SSH 是一个网络协议，它允许你通过网络连接到 Linux 和 Unix 服务器。SSH 使用公钥加密来认证远程的计算机。你可以有多种途径使用 SSH，无论是自动连接，还是使用密码认证登录。

本篇文章介绍了几种可以连接 Linux 服务器 SSH 客户端。

让我们开始。

### Putty ###

**Putty** 是最有名的 SSH 和 telnet 客户端，最初由 Simon Tatham 为 Windows 平台开发。Putty 是一款开源软件，有可用的源代码，和一群志愿者的开发和支持。

![](http://www.unixmen.com/wp-content/uploads/2015/03/putty.png)

Putty 非常易于安装和使用，通常大部分的配置选项你都不需要修改。你只需要输入少量基本的参数，就可以开始很简单地建立连接会话。[点此下载][1] Putty。

### Bitvise SSH Client ###

**Bitvise SSH** 是一款支持 SSH 和 SFTP 的 Windows 客户端。由 Bitvise 开发和提供专业支持。这款 SSH 客户端性能强悍，易于安装、便于使用。Bitvise SSH 客户端拥有功能丰富的图形界面，通过一个有自动重连功能的内置代理进行动态端口转发。

![](http://www.unixmen.com/wp-content/uploads/2015/03/bitvise.png)

Bitvise SSH 客户端对**个人用户使用是免费的**，同时对于在组织内部的个人商业使用也一样。你可以[在这里下载 Bitvise SSH 客户端][2]。

### MobaXterm ###

**MobaXterm** 是你的**远程计算的终极工具箱**。在一个 Windows 应用里，它为程序员、网管、IT 管理员及其它用户提供了精心裁剪的一揽子功能，让他们的远程操作变得简约时尚。

![](http://www.unixmen.com/wp-content/uploads/2015/03/mobaxterm.png)

MobaXterm 提供了所有重要的**远程网络工具** （如SSH、 X11、 RDP、 VNC、 FTP、 MOSH 等等），以及 Windows 桌面上的 **Unix 命令**（bash、 ls、 cat、sed、 grep、 awk、 rsync等等），而这些都是由一个开箱即用的**单一的便携程序**所提供。MobaXterm 对**个人使用免费**，你可以[在这里][3]下载 MobaXterm。

### DameWare SSH ###

我认为 **DameWare SSH** 是最好的免费SSH客户端。

![](http://www.unixmen.com/wp-content/uploads/2015/03/ssh.png)

这个免费工具是一个终端模拟器，可以让你从一个易用的控制台建立多个 telnet 和 SSH 连接。

－用一个带标签的控制台界面管理多个会话
－将常用的会话保存在 Windows 文件系统中
－使用多套保存的证书来轻松登录不同的设备
－使用 telnet、SSH1 和 SSH2 协议连接计算机和设备

你可以从[这个链接][4]下载 **DameWare SSH**。

### SmarTTY ###
　
SmarTTY 是一款免费的多标签 SSH 客户端，支持使用 SCP 命令随时复制文件和目录。

![](http://www.unixmen.com/wp-content/uploads/2015/03/smart.png)

大多数 SSH 服务器每个连接支持最多10个子会话．SmarTTY 在这方面做得很好：没有烦人的多个窗口，不需要重新登录，仅仅打开一个新的标签页就可以开始了！

### Cygwin ###

Cygwin 是一款 GNU 和开源工具的大杂烩，提供的功能近似于一个 Windows 平台下的 Linux。

![](http://www.unixmen.com/wp-content/uploads/2015/03/cyq.png)

**Cygwin** 包括了一个称为模拟库的 Unix 系统：cygwin.dll，集成了大量的 GNU 和其它的免费软件，以大量的可选包方式组织而成。在这些安装包中，有高质量的编译器和其他软件开发工具、一个X11服务器、一套完整的X11开发套件、GNU emacs 编辑器、Tex 和 LaTeX、openSSH（客户端和服务器），除此之外还有很多，包括在微软 Windows 下需要编译和使用 PhysioToolkit 软件的每一样东西。

读完我们的文章后，不知你中意哪一款 SSH 客户端？你可以留下你的评论，描述你喜欢的系统和选择的原因。当然，如果有另外的 SSH 客户端没有被本文列举出来，你可以帮助我们补充。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/list-free-windows-ssh-client-tools-connect-linux-server/

作者：[anismaj][a]
译者：[wi-cuckoo](http://github.com/wi-cuckoo)
校对：[wxy](http://github.com/wxy)

本文由 [LCTT](http://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/anis/
[1]:http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[2]:http://www.bitvise.com/download-area
[3]:http://mobaxterm.mobatek.net/download.html
[4]:http://www.dameware.com/downloads/registration.aspx?productType=ssh&AppID=17471&CampaignID=70150000000PcNM
[5]:http://cygwin.com/packages/
