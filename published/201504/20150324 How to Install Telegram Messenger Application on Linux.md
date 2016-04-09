如何在Linux上安装Telegram Messenger应用
================================================================================
Telegram是和whatsapp类似的及时通讯应用。它有一个庞大的用户群，并且很多能和其他通讯应用区分开来的特性。

![在Linux上安装Telegram](http://www.tecmint.com/wp-content/uploads/2015/03/Install-Telegram-in-Linux.png)
Telegram Messenger for Linux

这篇文章让你了解Telegram应用，以及在Linux Box上的详细安装命令。

#### Telegram的特性 ####

- 支持移动设备
- 有桌面版本
- 第三方开发者可以访问Telegram的应用程序接口(API)。
- 支持Android, iphone/ipad, Windows Phone, Web-Version, PC, Mac 和 Linux。
- 以上应用支持高度加密和自销毁信息。
- 可以让你从多种设备和平台查看你的信息。
- 整体的处理和消息传送都非常快
- 为了安全和效率，在全球有分布式服务器
- 开放的API和自由协议
- 没有广告，没有认购费用。-永久免费
- 功能强大-没有媒体和聊天限制
- 多种安全措施使其免受黑客侵害
- 在群组中回复特定信息。使用@username提醒群组里的多个用户

#### 为什么使用Telegram? ####

在像WhatsApp以及其他及时通讯应用都提供了几乎同样的功能的情况下，为什么要选择Telegram？

第三方开发者可以使用API这一点就足够了。更多PC的可用性意味着你不必再纠结在你的移动设备上打字，你可以使用你的PC，这样更具有可用性。

另外，支持连接远程地点，协作-多达200个成员的群组，在所有设备上同步，发送各种类型的文件，信息加密，自毁信息，在云上存储媒体，基于完全可用API构建自己的工具。

**测试环境**

我们使用Debian GNU/Linux, x86_64结构测试，所有的步骤都非常顺利。以下是我们的详细步骤。

### 在Linux上安装Telegram Messenger ###

首先去Telegram的官方网站，下载Linux系统版本的Telegram源码包([tsetup.0.7.23.tar.xz][1])，你也可以使用下面的wget命令直接下载。

    # wget https://updates.tdesktop.com/tlinux/tsetup.0.7.23.tar.xz

下载好安装包后，解压安装包，并从当前目录进入解压后的文件夹。

    # tar -xf tsetup.0.7.23.tar.xz 
    # cd Telegram/

然后，如下所示，在命令行中执行二进制文件‘Telegram’.

    # ./Telegram

1. 第一个界面， 点击 “START MESSAGING”.

![开始安装](http://www.tecmint.com/wp-content/uploads/2015/03/Start-Messaging.jpeg)
开始安装

2. 输入你的手机号码，点击"Next"。如果在这之前你没有注册过Telegram，使用和之前输入相同的号码你会看到警告说你还没有Telegram账户。点击“Register Here”。

![注册Telegram](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Register.png)
注册Telegram

3. 提交你的手机号码之后，Telegram很快会给你发送一个验证码。你需要输入它。

![Telegram验证码](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Verfication-Code.png)
Telegram验证码

4. 输入你的姓名，昵称并点击“SIGN UP”.

![输入账户详细信息](http://www.tecmint.com/wp-content/uploads/2015/03/Enter-Account-Details.jpeg)
输入账户详细信息

5. 新建账户之后，我看到这个界面。一切准备就绪，尽管我对Telegram还不熟悉。这个界面真的很简洁。

![Telegram界面](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Interface.jpeg)
Telegram界面

6. 点击新建联系人，输入他们的姓名和手机号码，完成后点击新建。

![新建Telegram联系人](http://www.tecmint.com/wp-content/uploads/2015/03/Add-New-Telegram-Contact.png)
新建Telegram联系人

7. 如果Telegram中还没有你输入的联系人，你会收到一个提示信息，当这个联系人加入Telegram的时候Telegram会通知你。

![Telegram联系人提示](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Contact-Notification.jpeg)
Telegram联系人提示

8. 当联系人加入Telegram的时候，你会收到信息(类似弹出提示)显示[YOUR_CONTACT]加入了Telegram。

9. 在Linux系统上正式的聊天窗口。很好的体验…

![联系人加入Telegram消息](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Contact-Join-Message.jpeg)
联系人加入Telegram消息

10. 同时，我试着在我的Android移动设备上发送信息，两者之间界面非常相似。

![移动版Telegram界面](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Mobile-Interface.png)
移动版Telegram界面

11. Telegram设置页面. 你有很多可以配置的选项.

![设置Telegram](http://www.tecmint.com/wp-content/uploads/2015/03/Telegram-Settings.png)
设置Telegram

12. 关于Telegram.

![关于Telegram](http://www.tecmint.com/wp-content/uploads/2015/03/About-Telegram.jpeg)
关于Telegram

#### 有趣的几点 ####

- Telegram使用MTProto移动协议
- 一开始在2013年(8月14号)发布iPhone版
- 惊人项目背后的人物:Pavel and Nikolai Durov..

就是这些了。我还会为大家带来你们喜欢阅读的其它有趣文章。很高兴能代表Tecmint，感谢我们尊贵的读者以及使得我们通过不断的自我提升走到这里的批评者。保持联系！继续评论。如果你关注我们那就请分享吧。

- [https://telegram.org/][2]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-telegram-in-linux/

作者：[Avishek Kumar][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://tdesktop.com/linux
[2]:https://telegram.org/
