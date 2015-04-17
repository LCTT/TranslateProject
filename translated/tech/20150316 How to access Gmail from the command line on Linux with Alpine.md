如何在 Linux 中使用 Alpine 在命令行里获取 Gmail
================================================================================
假如你是一个命令行爱好者，我很确信你将张开双臂欢迎任何可以使你使用这个强大的工作环境来执行哪怕一项日常任务的工具，例如从 [安排日程][1] 、 [管理财务][2] 到 获取 [Facebook][3] 、[Twitter][4]等任务。

在这个帖子中，我将为你展示 Linux 命令行的另一个漂亮干练的使用案例：**获取 Google 的 Gmail 服务**，为此，我们将使用 Alpine，一个基于 ncurses 的多功能命令行邮件客户端(不要和 Alpine Linux 搞混淆)。我们将在 Alphine 中配置 Gmail 的 IMAP 和 SMTP 设定来通过 Google 的邮件服务器在终端环境中收取和发送邮件。在这个教程的最后，你将意识到只需几步就可以在 Alpine 中使用其他的邮件服务。

诚然，已有许多卓越的基于 GUI 的邮件客户端存在，例如 Thunderbird， Evolution 或者甚至是 Web 界面，那么为什么还有人对使用命令行的邮件客户端来收取 Gmail 这样的事感兴趣呢？答案很简单。假如你需要快速地处理好事情并想避免使用不必要系统资源；或者你正工作在一个最小化安装(注：这里我感觉自己翻译有误)的服务器上，而它没有安装 X 服务(注：这里也需要更改)；又或者是 X 服务在你的桌面上崩溃了，而你需要在解决这个问题之前急切地发送一些邮件。在上述所有的情况下， Alpine 都可以派上用场并在任何时间满足你的需求。

除了简单的编辑，发送和接收文本类的邮件信息等功能外， Alpine 还可以进行加密，解密和对邮件信息进行数字签名，以及与 TLS(注：Transport Layer Security) 无缝集成。

### 在 Linux 上安装 Alpine ###

在基于 Red Hat 的发行版本上，可以像下面那样来安装 Alpine。需要注意的是，在 RHEL 或 CentOS 上，你需要首先启用 [EPEL 软件仓库][5]。

    # yum install alpine 

在 Debian，Ubuntu 或它们的衍生发行版本上，你可以这样做：

    # aptitude install alpine

在安装完成后，你可以运行下面的命令来启动该邮件客户端：

    # alpine

在你第一次启用 Alpine 时，它将在当前用户的家目录下创建一个邮件文件夹(`~/mail`)，并显现出主界面，正如下面的截屏所显示的那样：

注：youtube视频，发布的时候做个链接吧(注：这里我不知道该如何操作，不过我已经下载了该视频，如有需要，可以发送)
<iframe width="615" height="346" frameborder="0" allowfullscreen="" src="http://www.youtube.com/embed/kuKiv3uze4U?feature=oembed"></iframe>

它的用户界面有下列几个模块：

![](https://farm9.staticflickr.com/8724/16618079590_6c236ce2c2_c.jpg)

请随意地浏览，操作来熟悉 Alpine。你总是可以在任何时候通过敲 'Q' 来回到命令提示符界面。请注意，所有的字符界面下方都有与操作相关的帮助。

在进一步深入之前，我们将为 Alpine 创建一个默认的配置文件。为此，请关闭 Alpine，然后在命令行中执行下面的命令：

    # alpine -conf > /etc/pine.conf 

### 配置 Alpine 来使用 Gmail 账号 ###

一旦你安装了 Alpine 并至少花费了几分钟的时间来熟悉它的界面和菜单，下面便是实际配置它来使用一个已有的 Gmail 账户的时候了。

在 Alpine 中执行下面的步骤之前，记得要通过你的 Web 邮件界面，在你的 Gmail 设定里启用 IMAP 协议。一旦在你的 Gmail 账户中 IMAP 被启用，执行下面的步骤来在 Alpine 中启用阅读 Gmail 信息的功能。

首先，启动 Alpine。

按 'S' 来进行设置，再按 'L' 选择 `collectionLists` 选项来定义不同的文件夹类别以帮助你更好地组织你的邮件：

![](https://farm8.staticflickr.com/7614/16779579656_690eda419c_o.png)

按 'A' 来新建一个文件夹并填写必要的信息：

- **昵称**: 填写任何你想写的名字；
- **服务器**: imap.gmail.com/ssl/user=yourgmailusername@gmail.com 

你可以将 `Path` 和 `View` 留白不填。

然后按 `Ctrl+X` 并在有提示时输入你的 Gmail 密码：

![](https://farm9.staticflickr.com/8611/16618079640_6f7dca336a_b.jpg)

假如一切如预期一样进展顺利，就会出现一个以你先前填写的昵称来命名的新文件夹。你应该可以在这里找到你的 Gmail 信箱：

![](https://farm8.staticflickr.com/7598/16804355052_10c1a6c5bd_b.jpg)

为了验证，你可以比较在 Alpine 中显示的 "Gmail Sent" 信箱和在 Web 界面下的信箱：

![](https://farm8.staticflickr.com/7602/16619323939_d2eab3e162_c.jpg)

默认情况下，每隔 150 秒，它将自动检查新邮件或提示，你可以在文件 `/etc/pine.conf`中改变这个值，同时你还可以修改许多其他设定。这个配置文件拥有详细且清晰的注释。例如，为了将检查新邮件的时间间隔设定为 10 秒，你需要这样设定：

    # The approximate number of seconds between checks for new mail
    mail-check-interval=10

最后，我们需要配置一个 SMTP 服务器来通过 Alpine 发送邮件信息。回到先前解释过的 Alpine 的设置界面，然后按 'C' 来设定一个 Google 的 SMTP 服务器地址，你需要像下面这样编辑 `SMTP Server`(为了发送) 这一行内容：

    smtp.gmail.com:587/tls/user=yourgmailusername@gmail.com

当你按 'E' 离开设定界面时，将会提醒你保存更改。一旦你保存了更改，马上你就可以通过 Alpine 来发送邮件了！为此，来到主菜单中的 `Compose` 选项，接着开始从命令行中操作你的 Gmail 吧。

### 总结 ###

在这个帖子里，我们讨论了在终端环境中如何通过一个名为 Alpha 的轻量且强大的命令行邮件客户端来获取 Gmail。 Alpine 是一个发布在 Apache Software License 2.0 协议下的自由软件，该协议与 GPL 协议相兼容。 Alpine 引以自豪的是：它不仅对新手友好，同时还做到了让那些经验丰富的系统管理员认为它是强大的。我希望在你阅读完这篇文章后，你能意识到我最后一个论断是多么的正确。

非常欢迎使用下面的输入框来留下你的评论或问题。我期待着你们的反馈！

--------------------------------------------------------------------------------

via: http://xmodulo.com/gmail-command-line-linux-alpine.html

作者：[Gabriel Cánepa][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/schedule-appointments-todo-tasks-linux-terminal.html
[2]:http://xmodulo.com/manage-personal-expenses-command-line.html
[3]:http://xmodulo.com/access-facebook-command-line-linux.html
[4]:http://xmodulo.com/access-twitter-command-line-linux.html
[5]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
