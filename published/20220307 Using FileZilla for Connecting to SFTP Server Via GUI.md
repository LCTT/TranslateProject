[#]: subject: "Using FileZilla for Connecting to SFTP Server Via GUI"
[#]: via: "https://itsfoss.com/filezilla-ubuntu/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14410-1.html"

使用 FileZilla 以图形界面连接 SFTP 服务器
======

![](https://img.linux.net.cn/data/attachment/album/202203/29/164256iljy9w3n053qv28x.jpg)

如果你问那些极客系统管理员，他们会肯定的说使用 [rsync 或者 scp 命令在远程服务器和本地系统之间传输文件][1]。

然而，这些都是命令行方式，并不是每个人都能用起来感到舒适。

谢天谢地的是，有一些图形化工具能够让你从远程服务器来传输文件。

[FileZilla][2] 是一个流行的、跨平台的传输文件为目的开源软件。它支持使用通过 TLS 或者 SSL 加密的 FTP 协议（FTPS），也支持借助 SSH 的 FTP 协议，以及旧的 FTP 协议。

让我展示怎样在 Linux 上安装 FileZilla 然后用它来文件传输。

那么，让我们开始吧！

### 在 Ubuntu 和其他 Linux 发行版上安装 FileZilla

你可以使用源码来安装，但是还是建议使用你的发行版提供的软件包。因为它是一个热门软件，它应该在许多 Linux 发行版（即便不是全部）的软件仓库中可用。请使用你的发行版的软件中心和包管理器来安装。

在 Ubuntu 上，你可以从软件中心来安装它：

![FileZilla is available in the Ubuntu Software Center][3]

你也可以使用命令行的方式来安装它：

```
sudo apt install filezilla
```

如果你看到 [软件包不存在的错误][4]，你应该 [开启 Universe 仓库][5]。

一旦安装成功，打开菜单（通过按 `Super` 键），键入 “FileZilla”来启动它。

![Start FileZilla from the system menu][6]

### 使用 FileZilla

第一次使用 FileZilla 时，你将会看到如下图所示的一个界面：

![Screenshot of FileZilla running][7]

左边窗口显示来自你本地系统的文件和目录。右边窗口显示目前是空的。当你连接到远程服务器时，来自你的远程系统的文件会显示在这里。

在我向你展示之前，让我分享一下关于理解 FileZilla 图形界面重要方面的一些细节。

#### 了解 FileZilla 图形界面

下图总体上给你展示了 FileZilla 窗口布局的不同部分。

![FileZilla Window Layout | image credit][8]

图形界面由 6 个不同的区域/窗口来组成。让我简短的给你解释一下：

**1、工具栏**：它有许多选项，如打开站点管理器、刷新本地和远程目录文件和文件列表、开始处理当前的文件传输队列、停止正在传输的任务并取消队列中的文件，等等。

**2、快速连接栏**：顾名思义，它允许你快速连接到一个远程站点，除了主机名、用户名、密码和端口之外，不需要指定更多细节。

**3、消息日志**：它显示了一个日志，不论你连接成功与否。错误消息标记为红色，正常消息为白色，命令是蓝色。

**4 & 5、本地窗口和远程窗口**：这两个窗口非常相似，除了本地窗口显示本地目录内容，并且有用来上传文件的上下文菜单；而远程窗口显示的是远程目录的内容，并有从远程目录下载到本地文件的选项。

**6、传输队列**：最后，传输队列窗口显示正在传输的项目的状态和它们的传输速度，以及队列中的文件和传输历史（仅限当前实例）。

#### 使用 FileZilla 连接到 SFTP 服务器

你需要知道远程服务器的用户名、密码和 IP 地址。远程服务器也应该被设置成能够接受以这些信息进行的连接。你还需要在目标文件夹有正确的权限设置。

要新增一个 SFTP 连接，你需要打开站点管理器。有两种方式可以打开它。

在菜单栏上的“<ruby>文件<rt>Files</rt></ruby>”菜单选项下有一个“<ruby>站点管理器<rt>Site Manager</rt></ruby>”。或者，你可以直接点击工具栏上的“站点管理器”图标。

![the Site Manager button on the toolbar][9]

一旦站点管理器对话框弹出，点击“<ruby>新站点<rt>New site</rt></ruby>”按钮，并（可选地）重命名添加到条目中的新站点。我叫我的站点为“test8”。

![screenshot of the Site Manager][10]

在右侧的“<ruby>常规<rt>General</rt></ruby>”标签下，确保所使用的协议与服务器管理员为你设置的相一致。在我的例子中，我设置了一个 SFTP 服务器（<ruby>借助 SSH 通道的 FTP<rt>FTP over SSH</rt></ruby>），因此我选择了“<ruby>SFTP - SSH 文件传输协议<rt>SFTP – SSH File Transfer Protocol</rt></ruby>”。

下一个字段填写远程服务器的 IP 地址。

如果你没有设置“<ruby>端口号<rt>Port</rt></ruby>”，FileZilla 将假定要使用的端口号为缺省的 SSH 协议的 22 端口。

“<ruby>登录类型<rt>Logon Type</rt></ruby>”下拉列表有几个选项。在“<ruby>常规<rt>Normal</rt></ruby>”登录方式下，你只需要提供用户名和密码。

如果你设置了一对公钥和私钥来验证你的 SSH 用户连接，那么可以使用“<ruby>密钥文件授权<rt>Key file authentication</rt></ruby>”方式。

一旦你为远程服务器和认证填写了所有适当的细节，就可以点击底部的“<ruby>连接<rt>Connect</rt></ruby>”按钮连接到站点。别担心，你刚刚建立连接的新站点将会按“登录类型”保存起来。

![Remote pane being populated after a successful connection][11]

如果你看到一个 “连接到 <主机 IP 地址>” 的状态消息，并且最近的状态消息是 “目录列表 "/" 显示成功”，说明你已经成功的连接到了远程的 SFTP 服务器（使用 SSH 协议的 FTP）。

另一个 SFTP 连接成功的标志是，当连接成功建立的时候，远程目录窗口有了很多消息。

#### 发送文件到远程系统

你必须 **确保你位于要传输文件的目录里**。传输文件非常简单，只需**双击文件**，无需指定指定目标位置。

如果你在左边窗口双击了一个文件，它立即传输到右边科技的目录里（或者有传输任务的话，加到队列中）。

同样，从右边窗口到左边窗口也是一样双击，即从远程服务器到本地。**这就是为什么本地和远程系统都要在正确的位置是非常重要的原因**。

此外，你也可以鼠标右击文件上传它们（或者加它们到上传队列）。目标位置总是 FileZilla 界面中显示的目录。

![Transfer queue pane showing the local file name, remote destination, transfer speed and an ETA][12]

除了方便和快捷方面，这两种上传的文件方式没有什么不同。

#### 下载远程系统中的文件

像上传文件一样，当从远程服务器传输文件到本地时也有两种方式，但不是“上传”而是“下载”。

下载的文件将放在本地目录窗口中，也就是你当前打开的本地窗口。

你将会注意到除了发送方和接收方不同之外，下载和上传文件的行为是一样的。除非连接数受到限制，否则文件传输将是并行进行的。

### 总结

厉害！有了这些基础知识，你应该能够在你的计算机和服务器之间传输文件。我希望你能够学到一些新东西 : )

如果你感到这些对你有帮助，随意在评论部分留下你的问题、建议或简单的一句 “thank you”。

--------------------------------------------------------------------------------

via: https://itsfoss.com/filezilla-ubuntu/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/transfer-files-ssh/
[2]: https://filezilla-project.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/filezilla-ubuntu-software-center.png?resize=751%2C382&ssl=1
[4]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[5]: https://itsfoss.com/ubuntu-repositories/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/filezilla-ubuntu.png?resize=763%2C224&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/01_filezilla.webp?resize=800%2C431&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/02_filezilla_layout.webp?resize=800%2C504&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/03_site_manager_annotated.webp?resize=386%2C170&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/04_site_manager.webp?resize=800%2C577&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/05_successful_connection.webp?resize=800%2C431&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/07_transfer_pane_populated-1.webp?resize=800%2C431&ssl=1
[13]: https://itsfoss.community/
