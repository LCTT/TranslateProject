Remmina：一个 Linux 下功能丰富的远程桌面共享工具
============================================================

**Remmina** 是一款在 Linux 和其他类 Unix 系统下的自由开源、功能丰富、强大的远程桌面客户端，它用 GTK+ 3 编写而成。它适用于那些需要远程访问及使用许多计算机的系统管理员和在外出行人员。

它以简单、统一、同质、易用的用户界面支持多种网络协议。

### Remmina 功能

*   支持 RDP、VNC、NX、XDMCP 和 SSH。
*   用户能够以组的形式维护一份连接配置列表。
*   支持用户直接输入服务器地址的快速连接。
*   具有更高分辨率的远程桌面，可以在窗口和全屏模式下滚动/缩放。
*   支持窗口全屏模式；当鼠标移动到屏幕边缘时，远程桌面会自动滚动。
*   还支持全屏模式的浮动工具栏；使你能够在不同模式间切换、触发键盘获取、最小化等。
*   提供选项卡式界面，可以按组管理。
*   还提供托盘图标，允许你快速访问已配置的连接文件。

在本文中，我们将向你展示如何在 Linux 中安装 Remmina，以及使用它通过支持的不同协议实现桌面共享。

### 先决条件

*   在远程机器上允许桌面共享（让远程机器允许远程连接）。
*   在远程机器上设置 SSH 服务。

### 如何在 Linux 中安装 Remmina 远程共享工具

Remmina 及其插件包已经在所有主流的 Linux 发行版的大多数官方仓库中提供。运行下面的命令以安装它和所有支持的插件：

```
------------ 在 Debian/Ubuntu 中 ------------ 
$ sudo apt-get install remmina remmina-plugin-*
```

```
------------ 在 CentOS/RHEL 中 ------------ 
# yum install remmina remmina-plugin-*
```

```
------------ 在 Fedora 22+ 中 ------------ 
$ sudo dnf copr enable hubbitus/remmina-next
$ sudo dnf upgrade --refresh 'remmina*' 'freerdp*'
```

一旦安装完成后，在 Ubuntu 或 Linux Mint 菜单中搜索 `remmina`，接着运行它：

[
 ![Remmina Desktop Sharing Client](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Desktop-Sharing-Client.png) 
][1]

*Remmina 桌面共享客户端*

你可以通过图形界面或者编辑 `$HOME/.remmina` 或者 `$HOME/.config/remmina` 下的文件来进行配置。

要设置到一个新的远程服务器的连接，按下 `Ctrl+N` 并点击 **Connection -> New**，如下截图中配置远程连接。这是基本的设置界面。

[
 ![Remmina Basic Desktop Preferences](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Basic-Desktop-Preferences.png) 
][2]

*Remmina 基础桌面配置*

点击界面上的 “**Advanced**”，配置高级连接设置。

[
 ![Remmina Advance Desktop Settings](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Advance-Desktop-Settings.png) 
][3]

*Remmina 高级桌面设置*

要配置 **SSH**，点击界面中的 SSH。

[
 ![Remmina SSH Settings](http://www.tecmint.com/wp-content/uploads/2017/03/ssh-remote-desktop-preferences.png) 
][4]

*Remmina SSH 设置*

在完成所有的必要配置后，点击 “**Save**” 保存设置，在主界面中你会如下看到所有已配置远程连接。

[
 ![Remmina Configured Servers](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Configured-Servers.png) 
][5]

*Remmina 配置的服务器*

#### 使用 sFTP 连接到远程机器

选择连接配置并编辑设置，在 “**Protocols**” 下拉菜单中选择 **sFTP - Secure File Transfer**。接着设置启动路径（可选），并指定 SSH 验证细节。最后点击**连接**。

[
 ![Remmina sftp Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-sftp-connection.png) 
][6]

*Remmina sftp 连接*

这里输入你的 SSH 用户密码。

[
 ![Enter SSH Password](http://www.tecmint.com/wp-content/uploads/2017/03/enter-userpasswd.png) 
][7]

*输入 SSH 密码*

如果你看到下面的界面，那么代表 sFTP 连接成功了，你现在可以[在两台机器键传输文件了][8]。

[
 ![Remmina Remote sFTP Filesystem](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-sFTP-Filesystem.png) 
][9]

*Remmina 远程 sFTP 文件系统*

#### 使用 SSH 连接到远程机器

选择连接配置并编辑设置，在 “**Protocols**” 下拉菜单中选择 **SSH - Secure Shell**，并可选设置启动程序以及 SSH 验证细节。最后点击**连接**并输入 SSH 密码。

[
 ![Remmina SSH Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-SSH-Connection.png) 
][10]

*Remmina SSH 连接*

当你看到下面的界面，这意味着你的连接成功了，你现在可以使用 SSH 控制远程机器了。

[
 ![Remmina Remote SSH Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-SSH-Connection.png) 
][11]

*Remmina 远程 SSH 连接*

#### 使用 VNC 连接到远程机器

选择连接配置并编辑设置，在 “**Protocols**” 下拉菜单中选择 **VNC - Virtual Network Computing**。为该连接配置基础、高级以及 ssh 设置，点击**连接**，接着输入用户 SSH 密码。

[
 ![Remmina VNC Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-VNC-Connection.png) 
][12]

*Remmina VNC 连接*

一旦你看到下面的界面时，这意味着你已经成功使用 VNC 协议连接到远程机器上了。

如下截图所示，在桌面登录界面输入用户登录密码。

[
 ![Remmina Remote Desktop Login](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Login.png) 
][13]

*Remmina 远程桌面登录*

[
 ![Remmina Remote Desktop Sharing](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Sharing.png) 
][14]

*Remmina 远程桌面共享*

使用上面的步骤可以很简单地使用其他的协议访问远程机器。

Remmina 主页： [https://www.remmina.org/wp/][15]

就是这样了！在本文中，我们向你展示了如何在 Linux 中安装与使用 Remmina 远程连接客户端中的几种支持的协议。你可以在下面的评论栏中分享你的任何想法。

--------------------------------------------------------------------------------
作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux 系统管理员和网络开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/remmina-remote-desktop-sharing-and-ssh-client/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Desktop-Sharing-Client.png
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Basic-Desktop-Preferences.png
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Advance-Desktop-Settings.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/ssh-remote-desktop-preferences.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Configured-Servers.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-sftp-connection.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/enter-userpasswd.png
[8]:http://www.tecmint.com/sftp-upload-download-directory-in-linux/
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-sFTP-Filesystem.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-SSH-Connection.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-SSH-Connection.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-VNC-Connection.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Login.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Sharing.png
[15]:https://www.remmina.org/wp/
[16]:http://www.tecmint.com/author/aaronkili/
[17]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[18]:http://www.tecmint.com/free-linux-shell-scripting-books/
