[#]: subject: "Using FileZilla for Connecting to SFTP Server Via GUI"
[#]: via: "https://itsfoss.com/filezilla-ubuntu/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用FileZilla图形界面连接sftp服务器
======
如果你问极客系统管理员，他们将使用[rsync或者scp命令在远程服务器和本地系统之间传输文件][1]。

然而，以上这些都是命令行方式，用起来不是每个人都能感到舒适。

谢天谢地的是，有一些图形化工具能够让你从远程服务器来传输文件。

[FileZilla][2] 是一个流行的，跨平台的传输文件为目的开源软件。它支持使用通过TLS或者SSL加密的FTP协议（FTPS），同时还有SSH上的FTP协议以及旧的FTP协议。

让我展示怎样在Linux上安装FileZilla然后用它来文件传输。

那么，让我们开始吧！


### 在ubuntu和其他Linux发行版上安装FileZilla

你可以使用源码来安装但是还是建议使用你的分发提供包。因为它是一个热门软件，它应该在许多Linux发行版的软件仓库中可用（如果不是全部的话）。 _**请使用你的发行版软件中心和包管理器里来安装**_.

在Ubuntu上，你可以从软件中心来安装它：

![FileZilla is available in the Ubuntu Software Center][3]

你也可以使用命令行的方式来安装它。

```

    sudo apt install filezilla

```

如果你看到[软件包不存在的错误][4]，你应该 [开启通用仓库][5]。

一旦安装成功共，去菜单键（通过按windows键），键入FileZilla来启动它。

![Start FileZilla from the system menu][6]

### 使用FileZilla

当你第一次使用FileZilla时，你将会看到如下图所示的一个界面。

![Screenshot of FileZilla running][7]

左边窗口显示来自你本地系统的文件和目录。右边窗口显示目前是空的。当你连接到远程服务器时，来自你的远程系统的文件将会显示到这里。

在我让你看之前，让我分享一下关于理解FileZilla图形界面重要方面的一些细节。


#### 了解FileZilla图形界面

下图总体上给你展示了FileZilla窗口布局的不同部分。

![FileZilla Window Layout | image credit][8]

图形界面由6个不同的区域/窗口来组成。让我简短的给你解释它们。

**1\. 工具栏:**  它有许多选项，如打开站点管理器，刷新本地和远程目录文件和文件列表，开始运行中的当前文件传输队列，停止正和传输任务并且取消文件排队的功能，等等。

**2\. 快速连接栏:** 顾名思义，允许你快速连接到一个远程站点，不用指定许多详细信息，如主机名，用户名，密码和端口。

**3\. 消息日志:**  它显示给你一个日志，不论你连接成功与否，错误消息标记为红色，正常消息为白色，命令是蓝色。

**4 &amp; 5\. 本地窗口和远程窗口**:  这两个窗口是非常相似的除了本地窗口显示本地目录内容和用来上传文件的上下文菜单。然而，远程窗口形式是远程目录的内容和从远程目录下载到本地文件的选项。

**6\. 传输队列**: 最后，传输队列窗口显示项目正被传输的状态和他们的传输速度以及队列文件传输历史（仅限当前实例）。


####  使用FileZilla连接到SFTP服务器

_**你需要知道用户名，密码，和与远程服务器的IP地址。远程服务器也应该被设置成能够接收带有详细信息的连接。你在目标文件夹也需要有正确的存储设置。**_

新增一个SFTP连接，你需要打开站点管理器。有两种方式可以打开它。

在菜单栏上的"文件"菜单选项下有一个"站点管理器"。或者，你可以直接点击工具栏上的"站点管理器"图标。

![the Site Manager button on the toolbar][9]

一旦站点管理器对话框弹出，点击"新文件"按钮[可选]重命名 添加到条目中的新站点。我叫我的为"test8".

![screenshot of the Site Manager][10]

在右侧的常规选项下，确保使用的协议与服务器管理员为你设置的相一致。在我的例子中，我通过SSH功能的FTP协议设置了一个SFTP服务器(FTP over SSH)，因此我将继续选择"带有SSH功能的SFTP传输协议"。

下一个框填写远程服务器的IP地址。

如果你没有提及端口号，FileZilla将假定端口号为缺省的SSH协议22端口来使用。

登录类型下拉列表有几个选项。在常规登录方式下，你只需要提供用户名和密码。

如果你有一对公钥和私钥钥匙对来设置并授权你的SSH用户连接，Key文件授权方式是有用的。

一旦你已经为远程服务器和授权填写了整个详细的信息，点击底部的"连接"按钮连接到站点。别担心，你刚刚建立的新站点将会通过"登录类型"来保存。

![Remote pane being populated after a successful connection][11]

如果你看到一个 “连接到 &lt;主机IP地址&gt;”的状态消息，并且许多最近的状态消息是 “目录列表 “/” 显示成功”,你已经成功的连接到了远程的SFTP服务器(使用SSH的FTP协议)。

另一个SFTP连接成功的标志是当连接成功建立的时候，远程目录窗口有了很多消息。


####  发送文件到远程系统

你必须 **确保你位于传输的文件在目录里**。传输文件非常简单，只需**双击文件**，无需指定指定目标位置。

如果你在左边窗口点击了一个文件，它立即可视化的传输(或者传输任务的话，加到队列中的)到右边的窗口里。

同样从右边窗口到左边窗口也是一样，比如，从远程服务器到本地。**这就是为什么本地和远程系统在正确的位置是非常重要的了**。

或者说，你可以鼠标右击文件上传它们（或者加它们到上传队列）。目标位置总是FileZilla界面中显示的目录。

![Transfer queue pane showing the local file name, remote destination, transfer speed and an ETA][12]


除了方便和快捷方面，上传文件这两种方式没有什么不同。


#### 下载远程系统中的文件

像上传文件一样，当从远程服务器传输文件到本地时有两种方式，但不是"上传"而是"下载"。

下载文件将在本地目录窗口中也就是你当前打开的本地窗口来下载。

你将会注意到除了发送者和接收者之外，下载和上传文件降世一个持续的行为。文件将并行传输除非连接数量受到限制。


### 结论

厉害！在这些基础上，你应该能够从你的计算机传输文件到你的服务器。我希望你能够学到一些新东西:)

如果你有一些疑问，请在[FOSS社区论坛][13]中询问。如果你感到这些对你有帮助，请在下方评论让我知道！


--------------------------------------------------------------------------------

via: https://itsfoss.com/filezilla-ubuntu/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[校对者ID](https://github.com/校对者ID)

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
