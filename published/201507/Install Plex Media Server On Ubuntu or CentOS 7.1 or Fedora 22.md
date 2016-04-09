如何在 Ubuntu/CentOS7.1/Fedora22 上安装 Plex  Media Server
================================================================================
在本文中我们将会向你展示如何容易地在主流的最新Linux发行版上安装Plex  Media Server。在Plex安装成功后你将可以使用你的中央式家庭媒体播放系统，该系统能让多个Plex播放器App共享它的媒体资源，并且该系统允许你设置你的环境，增加你的设备以及设置一个可以一起使用Plex的用户组。让我们首先在Ubuntu15.04上开始Plex的安装。

### 基本的系统资源 ###

系统资源主要取决于你打算用来连接服务的设备类型和数量， 所以根据我们的需求我们将会在一个单独的服务器上使用以下系统资源。

<table width="666" style="height: 181px;">
<tbody>
<tr>
<td width="670" colspan="2"><b>Plex  Media Server</b></td>
</tr>
<tr>
<td width="236"><b>基础操作系统</b></td>
<td width="425">Ubuntu 15.04 / CentOS 7.1 / Fedora 22 Work Station</td>
</tr>
<tr>
<td width="236"><b>Plex Media Server</b></td>
<td width="425">Version 0.9.12.3.1173-937aac3</td>
</tr>
<tr>
<td width="236"><b>RAM 和 CPU</b></td>
<td width="425">1 GB&nbsp; , 2.0 GHZ</td>
</tr>
<tr>
<td width="236"><b>硬盘</b></td>
<td width="425">30 GB</td>
</tr>
</tbody>
</table>

### 在Ubuntu 15.04上安装Plex Media Server 0.9.12.3 ###

我们现在准备开始在Ubuntu上安装Plex Media Server，让我们从下面的步骤开始来让Plex做好准备。

#### 步骤 1: 系统更新 ####

用root权限登录你的服务器。确保你的系统是最新的，如果不是就使用下面的命令。

    root@ubuntu-15:~#apt-get update

#### 步骤 2: 下载最新的Plex Media Server包 ####

创建一个新目录，用wget命令从[Plex官网](https://plex.tv/)下载为Ubuntu提供的.deb包并放入该目录中。

    root@ubuntu-15:~# cd /plex/
    root@ubuntu-15:/plex#
    root@ubuntu-15:/plex# wget https://downloads.plex.tv/plex-media-server/0.9.12.3.1173-937aac3/plexmediaserver_0.9.12.3.1173-937aac3_amd64.deb

#### 步骤 3: 安装Plex Media Server的Debian包 ####

现在在相同的目录下执行下面的命令来开始debian包的安装， 然后检查plexmediaserver服务的状态。

    root@ubuntu-15:/plex# dpkg -i plexmediaserver_0.9.12.3.1173-937aac3_amd64.deb

----------

    root@ubuntu-15:~# service plexmediaserver status

![Plexmediaserver Service](http://blog.linoxide.com/wp-content/uploads/2015/06/plex-status.png)

### 在Ubuntu 15.04上设置Plex  Media Web应用 ###

让我们在你的本地网络主机中打开web浏览器， 并用你的本地主机IP以及端口32400来打开Web界面，并完成以下步骤来配置Plex。

    http://172.25.10.179:32400/web
    http://localhost:32400/web

#### 步骤 1: 登录前先注册 ####

在你访问到Plex Media Server的Web界面之后， 确保注册并填上你的用户名和密码来登录。

![Plex Sign In](http://blog.linoxide.com/wp-content/uploads/2015/06/PMS-Login.png)

#### 输入你的PIN码来保护你的Plex  Media用户####

![Plex User Pin](http://blog.linoxide.com/wp-content/uploads/2015/06/333.png)

现在你已经成功的在Plex  Media下配置你的用户。

![Welcome To Plex](http://blog.linoxide.com/wp-content/uploads/2015/06/3333.png)

### 在设备上而不是本地服务器上打开Plex Web应用 ###

如我们在Plex Media主页看到的提示“你没有权限访问这个服务”。 这说明我们跟服务器计算机不在同个网络。

![Plex Server Permissions](http://blog.linoxide.com/wp-content/uploads/2015/06/33.png)

现在我们需要解决这个权限问题，以便我们通过设备访问服务器而不是只能在服务器上访问。通过完成下面的步骤完成。

### 设置SSH隧道使Windows系统可以访问到Linux服务器 ###

首先我们需要建立一条SSH隧道以便我们访问远程服务器资源，就好像资源在本地一样。 这仅仅是必要的初始设置。

如果你正在使用Windows作为你的本地系统，Linux作为服务器，那么我们可以参照下图通过Putty来设置SSH隧道。
（LCTT译注: 首先要在Putty的Session中用Plex服务器IP配置一个SSH的会话，才能进行下面的隧道转发规则配置。
然后点击“Open”，输入远端服务器用户名密码， 来保持SSH会话连接。）

![Plex SSH Tunnel](http://blog.linoxide.com/wp-content/uploads/2015/06/ssh-tunnel.png)

**一旦你完成SSH隧道设置:**

打开你的Web浏览器窗口并在地址栏输入下面的URL。

    http://localhost:8888/web

浏览器将会连接到Plex服务器并且加载与服务器本地功能一致的Plex Web应用。 同意服务条款并开始。

![Agree to Plex term](http://blog.linoxide.com/wp-content/uploads/2015/06/5.png)

现在一个功能齐全的Plex  Media Server已经准备好添加新的媒体库、频道、播放列表等资源。

![PMS Settings](http://blog.linoxide.com/wp-content/uploads/2015/06/8.png)

### 在CentOS 7.1上安装Plex Media Server 0.9.12.3 ###

我们将会按照上述在Ubuntu15.04上安装Plex  Media Server的步骤来将Plex安装到CentOS 7.1上。

让我们从安装Plex Media Server开始。

#### 步骤1: 安装Plex Media Server ####

为了在CentOS7.1上安装Plex Media Server，我们需要从Plex官网下载rpm安装包。 因此我们使用wget命令来将rpm包下载到一个新的目录下。

    [root@linux-tutorials ~]# cd /plex
    [root@linux-tutorials plex]# wget https://downloads.plex.tv/plex-media-server/0.9.12.3.1173-937aac3/plexmediaserver-0.9.12.3.1173-937aac3.x86_64.rpm

#### 步骤2: 安装RPM包  ####

在完成安装包完整的下载之后， 我们将会使用rpm命令在相同的目录下安装这个rpm包。

    [root@linux-tutorials plex]# ls
    plexmediaserver-0.9.12.3.1173-937aac3.x86_64.rpm
    [root@linux-tutorials plex]# rpm -i plexmediaserver-0.9.12.3.1173-937aac3.x86_64.rpm

#### 步骤3: 启动Plexmediaservice ####

我们已经成功地安装Plex Media Server, 现在我们只需要重启它的服务然后让它永久地启用。

    [root@linux-tutorials plex]# systemctl start plexmediaserver.service
    [root@linux-tutorials plex]# systemctl enable plexmediaserver.service
    [root@linux-tutorials plex]# systemctl status plexmediaserver.service

### 在CentOS-7.1上设置Plex  Media Web应用 ###

现在我们只需要重复在Ubuntu上设置Plex Web应用的所有步骤就可以了。 让我们在Web浏览器上打开一个新窗口并用localhost或者Plex服务器的IP来访问Plex  Media Web应用。

    http://172.20.3.174:32400/web
    http://localhost:32400/web

为了获取服务的完整权限你需要重复创建SSH隧道的步骤。 在你用新账户注册后我们将可以访问到服务的所有特性，并且可以添加新用户、添加新的媒体库以及根据我们的需求来设置它。

![Plex Device Centos](http://blog.linoxide.com/wp-content/uploads/2015/06/plex-devices-centos.png)

### 在Fedora 22工作站上安装Plex Media Server 0.9.12.3 ###

下载和安装Plex Media Server步骤基本跟在CentOS 7.1上安装的步骤一致。我们只需要下载对应的rpm包然后用rpm命令来安装它。

![PMS Installation](http://blog.linoxide.com/wp-content/uploads/2015/06/plex-on-fedora.png)

### 在Fedora 22工作站上配置Plex  Media Web应用 ###

我们在（与Plex服务器）相同的主机上配置Plex Media Server，因此不需要设置SSH隧道。只要在你的Fedora 22工作站上用Plex  Media Server的默认端口号32400打开Web浏览器并同意Plex的服务条款即可。

![Plex Agreement](http://blog.linoxide.com/wp-content/uploads/2015/06/Plex-Terms.png)

*欢迎来到Fedora 22工作站上的Plex  Media Server*

让我们用你的Plex账户登录，并且开始将你喜欢的电影频道添加到媒体库、创建你的播放列表、添加你的图片以及享用更多其他的特性。

![Plex Add Libraries](http://blog.linoxide.com/wp-content/uploads/2015/06/create-library.png)

### 总结 ###

我们已经成功完成Plex Media Server在主流Linux发行版上安装和配置。Plex  Media Server永远都是媒体管理的最佳选择。 它在跨平台上的设置是如此的简单，就像我们在Ubuntu,CentOS以及Fedora上的设置一样。它简化了你组织媒体内容的工作，并将媒体内容“流”向其他计算机以及设备以便你跟你的朋友分享媒体内容。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-plex-media-server-ubuntu-centos-7-1-fedora-22/

作者：[Kashif Siddique][a]
译者：[dingdongnigetou](https://github.com/dingdongnigetou)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
