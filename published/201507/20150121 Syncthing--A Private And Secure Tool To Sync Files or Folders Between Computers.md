Syncthing: 一个在计算机之间同步文件/文件夹的私密安全同步工具
================================================================================
### 简介 ###

**Syncthing**是一个免费开源的工具，它能在你的各个网络计算机间同步文件/文件夹。它不像其它的同步工具，如**BitTorrent Sync**和**Dropbox**那样，它的同步数据是直接从一个系统中直接传输到另一个系统的，并且它是完全开源的，安全且私密的。你所有的珍贵数据都会被存储在你的系统中，这样你就能对你的文件和文件夹拥有全面的控制权，没有任何的文件或文件夹会被存储在第三方系统中。此外，你有权决定这些数据该存于何处，是否要分享到第三方，或这些数据在互联网上的传输方式。

所有的信息通讯都使用TLS进行加密，这样你的数据便能十分安全地逃离窥探。Syncthing有一个强大的响应式的网页管理界面(WebGUI，下同)，它能够帮助用户简便地添加、删除和管理那些通过网络进行同步的文件夹。通过使用Syncthing，你可以在多个系统上一次同步多个文件夹。在安装和使用上，Syncthing是一个可移植的、简单而强大的工具。即然文件或文件夹是从一部计算机中直接传输到另一计算机中的，那么你就无需考虑向云服务供应商支付金钱来获取额外的云空间。你所需要的仅仅是非常稳定的LAN/WAN连接以及在你的系统中有足够的硬盘空间。它支持所有的现代操作系统，包括GNU/Linux, Windows, Mac OS X, 当然还有Android。

### 安装 ###

基于本文的目的，我们将使用两个系统，一个是Ubuntu 14.04 LTS, 一个是Ubuntu 14.10 server。为了简单辨别这两个系统，我们将分别称其为**系统1**和**系统2**。

### 系统1细节： ###

- **操作系统**: Ubuntu 14.04 LTS server;
- **主机名**: **server1**.unixmen.local;
- **IP地址**: 192.168.1.150.
- **系统用户**: sk (你可以使用你自己的系统用户)
- **同步文件夹**: /home/Sync/ (Syncthing会默认创建)

### 系统2细节 ###

- **操作系统**: Ubuntu 14.10 server;
- **主机名**: **server**.unixmen.local;
- **IP地址**: 192.168.1.151.
- **系统用户**: sk (你可以使用你自己的系统用户)
- **同步文件夹**: /home/Sync/ (Syncthing会默认创建)

### 在系统1和系统2上为Syncthing创建用户 ###

在两个系统上运行下面的命令来为Syncthing创建用户以及两系统间的同步文件夹。

    sudo useradd sk
    sudo passwd sk

### 为系统1和系统2安装Syncthing ###

在系统1和系统2上遵循以下步骤进行操作。

从[官方下载页][1]上下载最新版本。我使用的是64位版本，因此下载64位版的软件包。

    wget https://github.com/syncthing/syncthing/releases/download/v0.10.20/syncthing-linux-amd64-v0.10.20.tar.gz

解压缩下载的文件：

    tar xzvf syncthing-linux-amd64-v0.10.20.tar.gz

切换到解压缩出来的文件夹:

    cd syncthing-linux-amd64-v0.10.20/

复制可执行文件"syncthing"到**$PATH**：

    sudo cp syncthing /usr/local/bin/

现在，执行下列命令来首次运行Syncthing：

    syncthing

当你执行上述命令后，syncthing会生成一个配置以及一些配置键值，并且在你的浏览器上打开一个管理界面。

输入示例:

    [monitor] 15:40:27 INFO: Starting syncthing
     15:40:27 INFO: Generating RSA key and certificate for syncthing...
     [BQXVO] 15:40:34 INFO: syncthing v0.10.20 (go1.4 linux-386 default) unknown-user@syncthing-builder 2015-01-13 16:27:47 UTC
     [BQXVO] 15:40:34 INFO: My ID: BQXVO3D-VEBIDRE-MVMMGJI-ECD2PC3-T5LT3JB-OK4Z45E-MPIDWHI-IRW3NAZ
     [BQXVO] 15:40:34 INFO: No config file; starting with empty defaults
     [BQXVO] 15:40:34 INFO: Edit /home/sk/.config/syncthing/config.xml to taste or use the GUI
     [BQXVO] 15:40:34 INFO: Starting web GUI on http://127.0.0.1:8080/
     [BQXVO] 15:40:34 INFO: Loading HTTPS certificate: open /home/sk/.config/syncthing/https-cert.pem: no such file or directory
     [BQXVO] 15:40:34 INFO: Creating new HTTPS certificate
     [BQXVO] 15:40:34 INFO: Generating RSA key and certificate for server1...
     [BQXVO] 15:41:01 INFO: Starting UPnP discovery...
     [BQXVO] 15:41:07 INFO: Starting local discovery announcements
     [BQXVO] 15:41:07 INFO: Starting global discovery announcements
     [BQXVO] 15:41:07 OK: Ready to synchronize default (read-write)
     [BQXVO] 15:41:07 INFO: Device BQXVO3D-VEBIDRE-MVMMGJI-ECD2PC3-T5LT3JB-OK4Z45E-MPIDWHI-IRW3NAZ is "server1" at [dynamic]
     [BQXVO] 15:41:07 INFO: Completed initial scan (rw) of folder default

Syncthing已经被成功地初始化了，网页管理接口也可以通过浏览器访问URL: **http://localhost:8080**。如上面输入所看到的，Syncthing在你的**home**目录中的Sync目录**下自动为你创建了一个名为**default**的文件夹。

默认情况下，Syncthing的网页管理界面只能在本地端口(localhost)中进行访问，要从远程进行访问，你需要在两个系统中进行以下操作：

首先，按下CTRL+C键来终止Syncthing初始化进程。现在你回到了终端界面。

编辑**config.xml**文件，

    sudo nano ~/.config/syncthing/config.xml

找到下面的指令：

    [...]
    <gui enabled="true" tls="false">
     <address>127.0.0.1:8080</address>
     <apikey>-Su9v0lW80JWybGjK9vNK00YDraxXHGP</apikey>
    </gui>
    [...]

在**<address>**区域中，把**127.0.0.1:8080**改为**0.0.0.0:8080**。结果，你的config.xml看起来会是这样的：

    <gui enabled="true" tls="false">
     <address>0.0.0.0:8080</address>
     <apikey>-Su9v0lW80JWybGjK9vNK00YDraxXHGP</apikey>
    </gui>

保存并关闭文件。

在两个系统上再次执行下述命令：

    syncthing

### 访问网页管理界面 ###

现在，在你的浏览器上打开**http://ip-address:8080/**。你会看到下面的界面：

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server1-Mozilla-Firefox_001.png)

网页管理界面分为两个窗格，在左窗格中，你应该可以看到同步的文件夹列表。如前所述，文件夹**default**在你初始化Syncthing时被自动创建。如果你想同步更多文件夹，点击**Add Folder**按钮。

在右窗格中，你可以看到已连接的设备数。现在这里只有一个，就是你现在正在操作的计算机。

### 网页管理界面上设置Syncthing ###

为了提高安全性，让我们启用TLS，并且设置访问网页管理界面的管理员用户和密码。要做到这点，点击右上角的齿轮按钮，然后选择**Settings**

![](http://www.unixmen.com/wp-content/uploads/2015/01/Menu_002.png)

输入管理员的帐户名/密码。我设置的是admin/Ubuntu。你应该使用一些更复杂的密码。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server1-Mozilla-Firefox_004.png)

点击Save按钮，现在，你会被要求重启Syncthing使更改生效。点击Restart。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Selection_005.png)

刷新你的网页浏览器。你可以看到一个像下面一样的SSL警告。点击显示**我了解风险(I understand the Risks)**的按钮。接着，点击“添加例外(Add Exception)“按钮把当前页面添加进浏览器的信任列表中。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Untrusted-Connection-Mozilla-Firefox_006.png)

输入前面几步设置的管理员用户和密码。我设置的是**admin/ubuntu**。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Authentication-Required_007.png)

现在，我们提高了网页管理界面的安全性。别忘了两个系统都要执行上面同样的步骤。

### 连接到其它服务器 ###

要在各个系统之间同步文件，你必须各自告诉它们其它服务器的信息。这是通过交换设备IDs（device IDs)来实现的。你可以通过选择“齿轮菜单（gear menu)”（在右上角）中的”Show ID（显示ID)“来找到它。

例如，下面是我系统1的ID.

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server1-Mozilla-Firefox_008.png)

复制这个ID，然后到另外一个系统（系统2）的网页管理界面，在右边窗格点击Add Device按钮。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server-Mozilla-Firefox_010.png)

接着会出现下面的界面。在Device区域粘贴**系统1 ID **。输入设备名称（可选）。在地址区域，你可以输入其它系统（ LCTT 译注：即粘贴的ID所属的系统，此应为系统1）的IP地址，或者使用默认值。默认值为**dynamic**。最后，选择要同步的文件夹。在我们的例子中，同步文件夹为**default**。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server-Mozilla-Firefox_009.png)

一旦完成了，点击save按钮。你会被要求重启Syncthing。点击Restart按钮重启使更改生效。

现在，我们到**系统１**的网页管理界面，你会看到来自系统２的连接和同步请求。点击**Add**按钮。现在，系统２会要求系统１分享和同步名为default的文件夹。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Selection_013.png)

接着重启系统１的Syncthing服务使更改生效。

![](http://www.unixmen.com/wp-content/uploads/2015/01/Selection_014.png)

等待大概６０秒，接着你会看到两个系统之间已成功连接并同步。

你可以在网页管理界面中的Add Device区域核实该情况。

添加系统２后，系统１网页管理界面中的控制窗口如下：

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server-Mozilla-Firefox_016.png)

添加系统１后，系统２网页管理界面中的控制窗口如下：

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server-Mozilla-Firefox_018.png)

![](http://www.unixmen.com/wp-content/uploads/2015/01/Syncthing-server-Mozilla-Firefox_018.png)

现在，在任一个系统中的“**default**”文件夹中放进任意文件或文件夹。你应该可以看到这些文件/文件夹被自动同步到其它系统。

本文完！祝同步愉快！  

噢耶！！！

- [Syncthing网站][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/syncthing-private-secure-tool-sync-filesfolders-computers/

作者：[SK][a]
译者：[XLCYun](https://github.com/XLCYun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://github.com/syncthing/syncthing/releases/tag/v0.10.20
[2]:http://syncthing.net/
