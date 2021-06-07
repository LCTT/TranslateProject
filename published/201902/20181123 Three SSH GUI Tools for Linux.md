[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Three SSH GUI Tools for Linux)
[#]: via: (https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)
[#]: url: (https://linux.cn/article-10559-1.html)

3 个 Linux 上的 SSH 图形界面工具
======

> 了解一下这三个用于 Linux 上的 SSH 图形界面工具。
 
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh.jpg?itok=3UcXhJt7)

在你担任 Linux 管理员的职业生涯中，你会使用 Secure Shell（SSH）远程连接到 Linux 服务器或桌面。可能你曾经在某些情况下，会同时 SSH 连接到多个 Linux 服务器。实际上，SSH 可能是 Linux 工具箱中最常用的工具之一。因此，你应该尽可能提高体验效率。对于许多管理员来说，没有什么比命令行更有效了。但是，有些用户更喜欢使用 GUI 工具，尤其是在从台式机连接到远程并在服务器上工作时。

如果你碰巧喜欢好的图形界面工具，你肯定很乐于了解一些 Linux 上优秀的 SSH 图形界面工具。让我们来看看这三个工具，看看它们中的一个（或多个）是否完全符合你的需求。

我将在 [Elementary OS][1] 上演示这些工具，但它们都可用于大多数主要发行版。

### PuTTY

已经有一些经验的人都知道 [PuTTY][2]。实际上，从 Windows 环境通过 SSH 连接到 Linux 服务器时，PuTTY 是事实上的标准工具。但 PuTTY 不仅适用于 Windows。事实上，通过标准软件库，PuTTY 也可以安装在 Linux 上。 PuTTY 的功能列表包括：

  * 保存会话。
  * 通过 IP 或主机名连接。
  * 使用替代的 SSH 端口。
  * 定义连接类型。
  * 日志。
  * 设置键盘、响铃、外观、连接等等。
  * 配置本地和远程隧道。
  * 支持代理。
  * 支持 X11 隧道。

PuTTY 图形工具主要是一种保存 SSH 会话的方法，因此可以更轻松地管理所有需要不断远程进出的各种 Linux 服务器和桌面。一旦连接成功，PuTTY 就会建立一个到 Linux 服务器的连接窗口，你将可以在其中工作。此时，你可能会有疑问，为什么不在终端窗口工作呢？对于一些人来说，保存会话的便利确实使 PuTTY 值得使用。

在 Linux 上安装 PuTTY 很简单。例如，你可以在基于 Debian 的发行版上运行命令：

```
sudo apt-get install -y putty
```

安装后，你可以从桌面菜单运行 PuTTY 图形工具或运行命令 `putty`。在 PuTTY “Configuration” 窗口（图 1）中，在 “HostName (or IP address) ” 部分键入主机名或 IP 地址，配置 “Port”（如果不是默认值 22），从 “Connection type”中选择 SSH，然后单击“Open”。

![PuTTY Connection][4]

*图 1：PuTTY 连接配置窗口*

建立连接后，系统将提示你输入远程服务器上的用户凭据（图2）。

![log in][7]

*图 2：使用 PuTTY 登录到远程服务器*

要保存会话（以便你不必始终键入远程服务器信息），请填写主机名（或 IP 地址）、配置端口和连接类型，然后（在单击 “Open” 之前），在 “Saved Sessions” 部分的顶部文本区域中键入名称，然后单击 “Save”。这将保存会话的配置。若要连接到已保存的会话，请从 “Saved Sessions” 窗口中选择它，单击 “Load”，然后单击 “Open”。系统会提示你输入远程服务器上的远程凭据。

### EasySSH

虽然 [EasySSH][8] 没有提供 PuTTY 中的那么多的配置选项，但它（顾名思义）非常容易使用。 EasySSH 的最佳功能之一是它提供了一个标签式界面，因此你可以打开多个 SSH 连接并在它们之间快速切换。EasySSH 的其他功能包括：

  * 分组（出于更好的体验效率，可以对标签进行分组）。
  * 保存用户名、密码。
  * 外观选项。
  * 支持本地和远程隧道。

在 Linux 桌面上安装 EasySSH 很简单，因为可以通过 Flatpak 安装应用程序（这意味着你必须在系统上安装 Flatpak）。安装 Flatpak 后，使用以下命令添加 EasySSH：

```
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub com.github.muriloventuroso.easyssh
```

用如下命令运行 EasySSH：

```
flatpak run com.github.muriloventuroso.easyssh
```

将会打开 EasySSH 应用程序，你可以单击左上角的 “+” 按钮。 在结果窗口（图 3）中，根据需要配置 SSH 连接。

![Adding a connection][10]

*图 3：在 EasySSH 中添加连接很简单*

添加连接后，它将显示在主窗口的左侧导航中（图 4）。

![EasySSH][12]

*图 4：EasySSH 主窗口*

要在 EasySSH 连接到远程服务器，请从左侧导航栏中选择它，然后单击 “Connect” 按钮（图 5）。

![Connecting][14]

*图 5：用 EasySSH 连接到远程服务器*

对于 EasySSH 的一个警告是你必须将用户名和密码保存在连接配置中（否则连接将失败）。这意味着任何有权访问运行 EasySSH 的桌面的人都可以在不知道密码的情况下远程访问你的服务器。因此，你必须始终记住在你离开时锁定桌面屏幕（并确保使用强密码）。否则服务器容易受到意外登录的影响。

### Terminator

（LCTT 译注：这个选择不符合本文主题，本节删节）

### termius

（LCTT 译注：本节是根据网友推荐补充的）

termius 是一个商业版的 SSH、Telnet 和 Mosh 客户端，不是开源软件。支持包括 [Linux](https://www.termius.com/linux)、Windows、Mac、iOS 和安卓在内的各种操作系统。对于单一设备是免费的，支持多设备的白金账号需要按月付费。

### 很少（但值得）的选择

Linux 上没有很多可用的 SSH 图形界面工具。为什么？因为大多数管理员更喜欢简单地打开终端窗口并使用标准命令行工具来远程访问其服务器。但是，如果你需要图形界面工具，则有两个可靠选项，可以更轻松地登录多台计算机。虽然对于那些寻找 SSH 图形界面工具的人来说只有不多的几个选择，但那些可用的工具当然值得你花时间。尝试其中一个，亲眼看看。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://elementary.io/
[2]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
[3]: https://www.linux.com/files/images/sshguis1jpg
[4]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_1.jpg?itok=DiNTz_wO (PuTTY Connection)
[5]: https://www.linux.com/licenses/category/used-permission
[6]: https://www.linux.com/files/images/sshguis2jpg
[7]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_2.jpg?itok=4ORsJlz3 (log in)
[8]: https://github.com/muriloventuroso/easyssh
[9]: https://www.linux.com/files/images/sshguis3jpg
[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_3.jpg?itok=bHC2zlda (Adding a connection)
[11]: https://www.linux.com/files/images/sshguis4jpg
[12]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_4.jpg?itok=hhJzhRIg (EasySSH)
[13]: https://www.linux.com/files/images/sshguis5jpg
[14]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_5.jpg?itok=piFEFYTQ (Connecting)
[15]: https://www.linux.com/files/images/sshguis6jpg
[16]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_6.jpg?itok=-kYl6iSE (Terminator)
