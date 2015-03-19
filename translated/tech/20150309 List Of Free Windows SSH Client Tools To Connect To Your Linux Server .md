在windows下,连接你的Linux服务器的ssh免费客户端工具列举\
================================================================================
你的操作系统是Windows,而你想要连接Linux服务器相互传送文件.于是你需要一个Secure Shell,简称SSH.实际上,SSH是一个网络协议,允许你通过网络连接到Linux和Unix服务器.SSH使用公钥加密来认证远程的计算机.你可以有多种途径使用SSH,要么自动地连接,或者使用密码认证登录.

本篇文章讲述了几种SSH客户端,供选择使用来连接你的Linux服务器.

我们开始.

### Putty ###

**Putty**是最有名的SSH和telnet客户端,最初由Simon Tatham为Windows平台开发.Putty是一款开源软件,有可用的源代码,和一群志愿者的发展和支持.

![](https://www.unixmen.com/wp-content/uploads/2015/03/putty.png)

Putty非常易于安装和使用,通常你不需要改大部分的配置选项.你只需要输入少量基本的参赛,就可以开始最简单的对话连接[here][1].

### Bitvise SSH Client ###

**Bitvise SSH **是一款支持SSH和SFTP的Windows客户端.由Bitvise专业地提供支持和发展.这款SSH客户端性能强悍,易于安装和使用.Bitvise SSH客户端功能丰富,拥有图形界面,通过一个有自动重连能力的内置代理允许用户动态端口运行.

![](https://www.unixmen.com/wp-content/uploads/2015/03/bitvise.png)

Bitvise SSH客户端对个人用户使用**是**免费的,同时对于在组织内部的单独商业使用也一样.你可以[在这里下载Bitvise SSH客户端][2]

### MobaXterm ###

**M偶吧Xterm**是你的**终极工具箱,解决远程计算**.在单一的Windows应用里,它提供了许多裁剪过的的功能,针对程序员,网络管理者,IT管理员和相当一部分需要在更简单界面(此处原文为in a more simple fashion,有点费解)远程作业的用户.

![](https://www.unixmen.com/wp-content/uploads/2015/03/mobaxterm.png)

MobaXterm提供了所有重要的**远程网络工具** (如SSH, X11, RDP, VNC, FTP, MOSH 等等），和**Unix 命令**（bash, ls, cat, sed, grep, awk, rsync等等）适用于Windows桌面，在一个**单独便于携带的可执行文件里**，其工作独立于工具箱．MobaXterm对**个人使用免费**.你可以下载MobaXterm[在这里][3].

### DameWare SSH ###

我认为**DameWare SSH**是最好的免费SSH客户端．

![](https://www.unixmen.com/wp-content/uploads/2015/03/ssh.png)

这个免费工具是一个终端模拟器，可以让你实现从一个易用控制台的多种telnet和SSH连接．

－用一个带标签的控制台界面管理多方会话
－在Windows文件系统中保存喜欢的会话
－获取多个保存的证书集合，用于轻松登录不同的设备
－使用telnet,SSH1和SSH2协议连接计算机和设备

你可以从[这个链接][4]下载 **DameWare SSH**

### SmarTTY ###
　
SmarTTY是一款免费的多标签SSH客户端，支持使用SCP命令及时复制文件和目录

![](https://www.unixmen.com/wp-content/uploads/2015/03/smart.png)

大多数SSH服务器每次连接支持最多10个子会话．SmarTTY在这方面做得很好：没有烦人的多个窗口，不需要重新登录，仅仅打开一个新的标签页就可以开始了！

### Cygwin ###

Cygwin是一款GNU和开源工具的大杂烩，提供的功能近似一个Windows平台下的Linux.

![](https://www.unixmen.com/wp-content/uploads/2015/03/cyq.png)

**Cygwin**包括了一个Unix系统，集模拟库，cygwin.dll,GNU大量集合和其他被归类了的大量可选免费应用软件包．在这些安装包中，有高质量的编译器和其他软件开发工具，一个X11服务器，一套完整的X11开发套件，GNU emacs编辑器，Tex和LaTeX,openSSH(客户端和服务器),除此之外还有很多，包括在微软Windows下需要编译和使用PhysioToolkit软件的每一样东西．

读完我们的文章后，不知你中意哪一款SSH客户端？你可以留下你的评论，描述你喜欢的系统和选择的原因．当然，如果有另外的SSH客户端没有被本文列举出来，你可以帮助我们补充．

--------------------------------------------------------------------------------

via: https://www.unixmen.com/list-free-windows-ssh-client-tools-connect-linux-server/

作者：[anismaj][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/anis/
[1]:http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[2]:http://www.bitvise.com/download-area
[3]:http://mobaxterm.mobatek.net/download.html
[4]:http://www.dameware.com/downloads/registration.aspx?productType=ssh&AppID=17471&CampaignID=70150000000PcNM
[5]:http://cygwin.com/packages/
