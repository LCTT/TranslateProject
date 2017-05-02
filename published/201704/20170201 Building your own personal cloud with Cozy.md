使用 Cozy 搭建个人云
============================================================

 ![使用 Cozy 搭建个人云](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/life_tree_clouds.png?itok=dSV0oTDS "Building your own personal cloud with Cozy") 

>Image by : [Pixabay][2]. Modified by Opensource.com. [CC BY-SA 4.0][3]

我认识的大部分人为了他们的日历、电子邮件、文件存储等，都会使用一些基于 Web 的应用。但是，如果像我这样，对隐私感到担忧、或者只是希望将你自己的数字生活简单化为一个你所控制的地方呢？ [Cozy][4] 就是一个朝着健壮的自主云平台方向发展的项目。你可以从 [GitHub][5] 上获取 Cozy 的源代码，它采用 AGPL 3.0 协议。

### 安装

安装 Cozy 非常快捷简单，这里有多种平台的 [简单易懂的安装指令][6]。在我的测试中，我使用 64 位的 Debian 8 系统。安装需要几分钟时间，然后你只需要到服务器的 IP 地址注册一个账号，就会加载并准备好默认的应用程序集。

要注意的一点 - 安装假设没有正在运行任何其它 Web 服务，而且它会尝试安装 [Nginx web 服务器][7]。如果你的服务器已经有网站正在运行，配置可能就比较麻烦。我是在一个全新的 VPS（Virtual Private Server，虚拟个人服务器）上安装，因此比较简单。运行安装程序、启动 Nginx，然后你就可以访问云了。

Cozy 还有一个 [应用商店][8]，你可以从中下载额外的应用程序。有一些看起来非常有趣，例如 [Ghost 博客平台][9] 以及开源维基 [TiddlyWiki][10]。其目的，显然是允许把其它很多好的应用程序集成到这个平台。我认为你要看到很多其它流行的开源应用程序提供集成功能只是时间问题。此刻，已经支持 [Node.js][11]，但是如果也支持其它应用层，你就可以看到很多其它很好的应用程序。

其中可能的一个功能是从安卓设备中使用免费的安卓应用程序访问你的信息。当前还没有 iOS 应用，但有计划要解决这个问题。

现在，Cozy 已经有很多核心的应用程序。

 ![主要 Cozy 界面](https://opensource.com/sites/default/files/main_cozy_interface.jpg "Main Cozy Interface") 

*主要 Cozy 界面*

### 文件

和很多分支一样，我使用 [Dropbox][12] 进行文件存储。事实上，由于我有很多东西需要存储，我需要花钱买 DropBox Pro。对我来说，如果它有我想要的功能，那么把我的文件移动到 Cozy 能为我节省很多开销。

我希望如此，而它真的可以。我被 Cozy 应用程序内建的基于 web 的文件上传和文件管理工具所惊讶。拖拽功能正如你期望的那样，界面也很干净整洁。我在上传事例文件和目录、随处跳转、移动、删除以及重命名文件时都没有遇到问题。

如果你想要的就是基于 web 的云文件存储，那么你已经有了。对我来说，它缺失的是 DropBox 具有的选择性的文件目录同步功能。在 DropBox 中，如果你拖拽一个文件到目录中，它就会被拷贝到云，几分钟后该文件在你所有同步设备中都可以看到。实际上，[Cozy 正在研发该功能][13]，但此时它还处于 beta 版，而且只支持 Linux 客户端。另外，我有一个称为  [Download to Dropbox][15] 的 [Chrome][14] 扩展，我时不时用它抓取图片和其它内容，但当前 Cozy 中还没有类似的工具。

 ![文件管理界面](https://opensource.com/sites/default/files/cozy_2.jpg "文件管理界面") 

*文件管理界面*

### 从 Google 导入数据

如果你正在使用 Google 日历和联系人，使用 Cozy 安装的应用程序很轻易的就可以导入它们。当你授权对 Google 的访问时，会给你一个 API 密钥，把它粘贴到 Cozy，它就会迅速高效地进行复制。两种情况下，内容都会被打上“从 Google 导入”的标签。对于我混乱的联系人，这可能是件好事情，因为它使得我有机会重新整理，把它们重新标记为更有意义的类别。“Google Calendar” 中所有的事件都导入了，但是我注意到其中一些事件的时间不对，可能是由于两端时区设置的影响。

### 联系人

联系人功能正如你期望的那样，界面也很像 Google 联系人。尽管如此，还是有一些不好的地方。例如，和你的智能手机的同步是通过 [CardDAV][16] 完成的，这是用于共享联系人数据的标准协议，但安卓手机并不原生支持该技术。为了把你的联系人同步到安卓设备，你需要在你的手机上安装一个应用。这对我来说是个很大的打击，因为我已经有很多类似这样的古怪应用程序了（例如 工作的邮件、Gmail 以及其它邮件，我的天），我并不想安装一个不能和我智能手机原生联系人应用程序同步的软件。如果你正在使用 iPhone，你直接就能使用 CradDAV。

### 日历

对于日历用户来说好消息就是安卓设备支持这种类型数据的交换格式 [CalDAV][17]。正如我导入数据时提到的，我的一些日历时间的时间不对。在这之前我在和其它日历系统进行迁移时也遇到过这个问题，因此这对我并没有产生太大困扰。界面允许你创建和管理多个日历，就像 Google 那样，但是你不能订阅这个 Cozy 实例之外的其它日历。该应用程序另一个怪异的地方就是它的一周从周一开始，而且你不能更改。通常来说，我从周日开始我的一周，因此能更改从周一开始的功能对我来说非常有用。设置对话框并没有任何设置；它只是告诉你如何通过 CalDAV 连接的指令。再次说明，这个应用程序接近我想要的，但 Cozy 做的还不够好。

### 照片

照片应用让我印象深刻，它从文件应用程序借鉴了很多东西。你甚至可以把一个其它应用程序的照片文件添加到相册，或者直接通过拖拽上传。不幸的是，一旦上传后，我没有找到任何重新排序和编辑照片的方法。你只能把它们从相册中删除。应用有一个通过令牌链接进行分享的工具，而且你可以指定一个或多个联系人。系统会给这些联系人发送邀请他们查看相册的电子邮件。当然还有很多比这个有更丰富功能的相册应用，但在 Cozy 平台中这算是一个好的起点。

 ![Photos 界面](https://opensource.com/sites/default/files/cozy_3_0.jpg "Photos Interface") 

*Photos 界面*

### 总结

Cozy 目标远大。他们尝试搭建一个你能部署任意你想要的基于云服务的平台。它已经到了成熟期吗？我并不认为。对于一些重度用户来说我之前提到的一些问题很严重，而且还没有 iOS 应用，这可能阻碍用户使用它。不管怎样，继续关注吧 - 随着研发的继续，Cozy 有一家代替很多应用程序的潜能。

--------------------------------------------------------------------------------

译者简介：

D Ruth Bavousett - D Ruth Bavousett 作为系统管理员和软件开发者已经很长时间了，长期以来她都专注于 a VAX 11/780。（到目前为止）她花了很多时间服务于图书馆的技术需求，她从 2008 年就开始成为 Koha 开源图书馆自动化套件的贡献者。 Ruth 现在是 Houston cPanel 公司的 Perl 开发人员，同时还是两个孩子的母亲。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/cozy-personal-cloud

作者：[D Ruth Bavousett][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://opensource.com/article/17/2/cozy-personal-cloud?rate=FEMc3av4LgYK-jeEscdiqPhSgHZkYNsNCINhOoVR9N8
[2]:https://pixabay.com/en/tree-field-cornfield-nature-247122/
[3]:https://creativecommons.org/licenses/by-sa/4.0/
[4]:https://cozy.io/
[5]:https://github.com/cozy/cozy
[6]:https://docs.cozy.io/en/host/install/
[7]:https://www.nginx.com/
[8]:https://cozy.io/en/apps/
[9]:https://ghost.org/
[10]:http://tiddlywiki.com/
[11]:http://nodejs.org/
[12]:https://www.dropbox.com/
[13]:https://github.com/cozy-labs/cozy-desktop
[14]:https://www.google.com/chrome/
[15]:https://github.com/pwnall/dropship-chrome
[16]:https://en.wikipedia.org/wiki/CardDAV
[17]:https://en.wikipedia.org/wiki/CalDAV
[18]:https://opensource.com/user/36051/feed
[19]:https://opensource.com/article/17/2/cozy-personal-cloud#comments
[20]:https://opensource.com/users/druthb
