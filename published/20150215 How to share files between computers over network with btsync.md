如何使用btsync通过网络实现计算机间的文件共享
================================================================================
如果你是那种使用各式设备在网上工作的人，我相信你肯定需要一个在不同设备间同步文件及目录的方法，至少是非常渴望有这种功能。

BitTorrent Sync简称btsync，是一个基于BitTorrent（著名P2P文件分享协议）的免费跨平台同步工具。与传统BitTorrent客户端不同的是，btsync可以在不同操作系统及设备之间加密数据传输和基于自动生成的密钥来授予访问共享文件的权限。

更具体点，当你想要通过btsync共享一些文件或文件夹，相应的读/写密钥（所谓的密码）就创建好了。这些密钥可以通过HTTPS链接，电子邮件，二维码等在不同的设备间共享传递。一旦两台设备通过一个密钥配对成功，其所对应的内容将会直接在其间同步。如果没有事先设置，传输将不会有文件大小和速度的限制。你可以在btsync中创建账号，这样你可以通过 web 界面来创建和管理通过网络分享的密钥和文件。

BitTorrent Sync可以在许多的操作系统上运行，包括Linux，MacOS X，Windows，在 [Android][1]和[iOS][2]上也可以使用。在这里，我们将教你在Linux环境（一台家用服务器）与Windows环境（一台笔记本电脑）之间如何使用BitTorrent Sync来同步文件。

### Linux下安装btsync ###

BitTorrent Sync可以在[项目主页][3]直接下载。由于Windows版本的BitTorrent Syn安装起来十分简单，所以我们假设笔记本上已经安装了。我们把焦点放到Linux服务器上的安装和配置。

在下载页面中选择你的系统架构，右键相应链接，复制连接地址（或者类似的功能，不同浏览器可能不同），将链接粘贴到在终端中用wget下载，如下：

**64位Linux:**

    # wget http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable 

**32位Linux:**

    # wget http://download.getsyncapp.com/endpoint/btsync/os/linux-i386/track/stable 

![](https://farm9.staticflickr.com/8635/15895277773_8acf317e3c_c.jpg)

下载完成后，把包中内容解压到你专门创建的目录中，为了完成这些：

    # cd /usr/local/bin
    # mkdir btsync
    # tar xzf stable -C btsync 

![](https://farm8.staticflickr.com/7306/16329173869_7dc8b64a39_b.jpg)

现在你可以选择将/usr/local/bin/btsync添加到环境变量PATH中去。

    export PATH=$PATH:/usr/local/bin/btsync

或者在该文件夹中运行btsync的二进制文件。我们推荐使用第一种方式，虽需要少量的输入但更容易记忆。

### 配置btsync ###

btsync带有一个内置的网络服务器，用作其管理接口。想要使用这个接口你需要创建一个配置文件。你可以使用以下命令来创建：

    # btsync --dump-sample-config > btsync.config 

然后使用你最常用的编辑器对btsync.config文件的（webui部分）作以下修改

    "listen" : "0.0.0.0:8888",
    "login" : "yourusername",
    "password" : "yourpassword"

你可以选择任何用户名和密码。

![](https://farm9.staticflickr.com/8599/15895277793_da63841433_b.jpg)

如果你将来想要优化一下它的配置，可以看一下 /usr/local/bin/btsync 目录下的 README 文件，不过现在我们先继续下面的步骤。

### 第一次运行btsync ###

作为一个系统的最高执行者我们需要依赖日志文件！所以在我们启动btsync之前，我们将先为btsync创建一个日志文件。

    # touch /var/log/btsync.log 

最后，让我们启动btsync：

    # btsync --config /usr/local/bin/btsync/btsync.config --log /var/log/btsync.log 

![](https://farm8.staticflickr.com/7288/16327720298_ccf2cbedea_c.jpg)

现在在你的浏览器中输入正在运行的btsync所监听的服务器IP地址和端口（我这是192.168.0.15:8888），同意其隐私政策，条款和最终用户许可协议：

![](https://farm9.staticflickr.com/8597/16327720318_d52551fc44_b.jpg)

这样页面就会转到你安装的btsync主页：

![](https://farm8.staticflickr.com/7412/16329544687_9a174527d8_c.jpg)

点击添加文件夹并在你的文件系统中选择一个你想要分享的目录，在我们的例子中，我们使用的是/btsync：

![](https://farm8.staticflickr.com/7407/16515452485_e25ded559f_b.jpg)

现在这样就够了。在运行接下来的步骤之前，请先在Windows主机（或你想使用的其他Linux设备）上安装BitTorrent Sync。

### btsync分享文件 ###

这个[视频][5]（需要翻墙）展示了如何在安装Windows8的电脑[192.168.0.106]上分享现有的文件夹。在添加好想要同步的文件夹后，你会得到它的密钥，通过“Enter a key or link”菜单（上面的图已经展示过了）添加到你安装到的Linux机器上，并开始同步。

现在用别的设备试试吧；找一个想要分享的文件夹或是一些文件，并通过Linux服务器的网络接口将密钥导入到你安装的“中央”btsync中。

### 以常规用户开机自动运行btsync ###

你们可能注意到了，视频中在同步文件时是使用'root'组的用户创建/btsync目录的。那是因为我们使用超级用户手动启动BitTorrent Sync的原因。在通常情况下，你会希望它开机自动使用无权限用户（www_data或是专门为此创建的账户，例如btsync）启动。

所以，我们创建了一个叫做btsync的用户，并在/etc/rc.local文件（exit 0 这一行前）添加如下字段：

    sudo -u btsync /usr/local/bin/btsync/btsync --config /usr/local/bin/btsync/btsync.config --log /var/log/btsync.log

最后，创建pid文件：

    # touch /usr/local/bin/btsync/.sync/sync.pid 

并递归更改 /usr/local/bin/btsync的所属用户：

    # chown -R btsync:root /usr/local/bin/btsync 

现在重启试试，看看btsync是否正在由预期中的用户运行：

![](https://farm9.staticflickr.com/8647/16327988660_644f6d4505_c.jpg)

基于你选择的发行版不同，你可能找到不同的方式来开机自启动btsync。在本教程中，我选择rc.local的方式是因为它在不同发行版中都可使用。

### 尾注 ###

如你所见，BitTorrent Sync对你而言几乎就像一个无服务器的Dropbox。我说“几乎”的原因是：当你在局域网内同步数据时，同步在两个设备之间直接进行。然而如果你想要跨网段同步数据，并且你的设备可能要穿过防火墙的限制来配对，那就只能通过一个提供BitTorrent的第三方中继服务器来完成同步传输。虽然声称传输经过 [AES加密][4]，你还是可能会遇到不想发生的状况。为了你的隐私着想，务必在你共享的每个文件夹中关掉中继/跟踪选项。

希望这些对你有用！分享愉快！

--------------------------------------------------------------------------------

via: http://xmodulo.com/share-files-between-computers-over-network.html

作者：[Gabriel Cánepa][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:https://play.google.com/store/apps/details?id=com.bittorrent.sync
[2]:https://itunes.apple.com/us/app/bittorrent-sync/id665156116
[3]:http://www.getsync.com/
[4]:http://www.getsync.com/tech-specs
[5]:https://youtu.be/f7kLM0lAqF4
