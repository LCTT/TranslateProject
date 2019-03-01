[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10552-1.html)
[#]: subject: (How To Install And Use PuTTY On Linux)
[#]: via: (https://www.ostechnix.com/how-to-install-and-use-putty-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

在 Linux 中安装并使用 PuTTY
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/putty-720x340.png)

PuTTY 是一个自由开源且支持包括 SSH、Telnet 和 Rlogin 在内的多种协议的 GUI 客户端。一般来说，Windows 管理员们会把 PuTTY 当成 SSH 或 Telnet 客户端来在本地 Windows 系统和远程 Linux 服务器之间建立连接。不过，PuTTY 可不是 Windows 的独占软件。它在 Linux 用户之中也是很流行的。本篇文章将会告诉你如何在 Linux 中安装并使用 PuTTY。

### 在 Linux 中安装 PuTTY

PuTTY 已经包含在了许多 Linux 发行版的官方源中。举个例子，在 Arch Linux 中，我们可以通过这个命令安装 PuTTY：

```shell
$ sudo pacman -S putty
```

在 Debian、Ubuntu 或是 Linux Mint 中安装它：

```shell
$ sudo apt install putty
```

### 使用 PuTTY 访问远程 Linux 服务器

在安装完 PuTTY 之后，你可以在菜单或启动器中打开它。如果你想用终端打开它，也是可以的：

```shell
$ putty
```

PuTTY 的默认界面长这个样子：

![PuTTY 默认界面](https://www.ostechnix.com/wp-content/uploads/2019/02/putty-default-interface.png)

如你所见，许多选项都配上了说明。在左侧面板中，你可以配置许多项目，比如：

  1. 修改 PuTTY 登录会话选项；
  2. 修改终端模拟器控制选项，控制各个按键的功能；
  3. 控制终端响铃的声音；
  4. 启用/禁用终端的高级功能；
  5. 设定 PuTTY 窗口大小；
  6. 控制命令回滚长度（默认是 2000 行）；
  7. 修改 PuTTY 窗口或光标的外观；
  8. 调整窗口边缘；
  9. 调整字体；
  10. 保存登录信息；
  11. 设置代理；
  12. 修改各协议的控制选项；
  13. 以及更多。

所有选项基本都有注释，相信你理解起来不难。

### 使用 PuTTY 访问远程 Linux 服务器

请在左侧面板点击 “Session” 选项卡，输入远程主机名（或 IP 地址）。然后，请选择连接类型（比如 Telnet、Rlogin 以及 SSH 等）。根据你选择的连接类型，PuTTY 会自动选择对应连接类型的默认端口号（比如 SSH 是 22、Telnet 是 23），如果你修改了默认端口号，别忘了手动把它输入到 “Port” 里。在这里，我用 SSH 连接到远程主机。在输入所有信息后，请点击 “Open”。

![通过 SSH 连接](http://www.ostechnix.com/wp-content/uploads/2019/02/putty-1.png)

如果这是你首次连接到这个远程主机，PuTTY 会显示一个安全警告，问你是否信任你连接到的远程主机。点击 “Accept” 即可将远程主机的密钥加入 PuTTY 的缓存当中：

![PuTTY 安全警告][2]

接下来，输入远程主机的用户名和密码。然后你就成功地连接上远程主机啦。

![已连接上远程主机](https://www.ostechnix.com/wp-content/uploads/2019/02/putty-3.png)

#### 使用密钥验证访问远程主机

一些 Linux 管理员可能在服务器上配置了密钥认证。举个例子，在用 PuTTY 访问 AMS 实例的时候，你需要指定密钥文件的位置。PuTTY 可以使用它自己的格式（`.ppk` 文件）来进行公钥验证。

首先输入主机名或 IP。之后，在 “Category” 选项卡中，展开 “Connection”，再展开 “SSH”，然后选择 “Auth”，之后便可选择 `.ppk` 密钥文件了。

![][3]

点击 “Accept” 来关闭安全提示。然后，输入远程主机的密码（如果密钥被密码保护）来建立连接。

#### 保存 PuTTY 会话

有些时候，你可能需要多次连接到同一个远程主机，你可以保存这些会话并在之后不输入信息访问他们。

请输入主机名（或 IP 地址），并提供一个会话名称，然后点击 “Save”。如果你有密钥文件，请确保你在点击 “Save” 按钮之前指定它们。

![][4]

现在，你可以通过选择 “Saved sessions”，然后点击 “Load”，再点击 “Open” 来启动连接。

#### 使用 PuTTY 安全复制客户端（pscp）来将文件传输到远程主机中

通常来说，Linux 用户和管理员会使用 `scp` 这个命令行工具来从本地往远程主机传输文件。不过 PuTTY 给我们提供了一个叫做 <ruby>PuTTY 安全复制客户端<rt>PuTTY Secure Copy Client</rt></ruby>（简写为 `pscp`）的工具来干这个事情。如果你的本地主机运行的是 Windows，你可能需要这个工具。PSCP 在 Windows 和 Linux 下都是可用的。

使用这个命令来将 `file.txt` 从本地的 Arch Linux 拷贝到远程的 Ubuntu 上：

```shell
pscp -i test.ppk file.txt sk@192.168.225.22:/home/sk/
```

让我们来分析这个命令：

  * `-i test.ppk`：访问远程主机所用的密钥文件；
  * `file.txt`：要拷贝到远程主机的文件；
  * `sk@192.168.225.22`：远程主机的用户名与 IP；
  * `/home/sk/`：目标路径。

要拷贝一个目录，请使用 `-r`（<ruby>递归<rt>Recursive</rt></ruby>）参数：

```shell
 pscp -i test.ppk -r dir/ sk@192.168.225.22:/home/sk/
```

要使用 `pscp` 传输文件，请执行以下命令：

```shell
pscp -i test.ppk c:\documents\file.txt.txt sk@192.168.225.22:/home/sk/
```

你现在应该了解了 PuTTY 是什么，知道了如何安装它和如何使用它。同时，你也学习到了如何使用 `pscp` 程序在本地和远程主机上传输文件。

以上便是所有了，希望这篇文章对你有帮助。

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-install-and-use-putty-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2019/02/putty-2.png
[3]: http://www.ostechnix.com/wp-content/uploads/2019/02/putty-4.png
[4]: http://www.ostechnix.com/wp-content/uploads/2019/02/putty-5.png
