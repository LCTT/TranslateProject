安装 Fedora 22 后要做的事情
================================================================================

Red Hat操作系统的社区开发版的最新成员Fedora 22，已经于2015年5月26日发布了。对这个经典的Fedora发行版的发布充斥着各种猜测和预期，而最终Fedora 22推出了许多重大变化。

就初始化进程而言，Systemd还是个新生儿，但它已经准备好替换古老的sysvinit这个一直是Linux生态系统一部分的模块。另外一个用户会碰到的重大改变存在于基本仓库的python版本中，这里提供了两种不同口味的python版本，2.x和3.x分支，各个都有其不同的偏好和优点。所以，那些偏好2.x口味的用户可能想要安装他们喜爱的python版本。自从Fedora 18开始 dandified YUM安装器（即 DNF）就准备替换过时陈旧的YUM安装器了，Fedora最后决定，现在就用DNF来替换YUM。

### 1) 配置RPMFusion仓库 ###

正如我已经提到过的，Fedora的意识形态很是严谨，它不会自带任何非自由组件。官方仓库不会提供一些包含有非自由组件的基本软件，比如像多媒体编码。因此，安装一些第三方仓库很有必要，这些仓库会为我们提供一些基本的软件。幸运的是，RPMFusion仓库前来拯救我们了。

    $ sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-22.noarch.rpm

### 2) 安装VLC媒体播放器 ###

Fedora 22默认自带了媒体播放器，即 gnome视频播放器（以前叫做totem）。如果你觉得还好，那么我们可以跳过这一步继续往前走。但是，如果你像我一样，偏好使用最广泛的VLC，那么就去从RPMFusion仓库安装吧。安装方法如下：

    sudo dnf install vlc -y

### 3) 安装多媒体编码 ###

刚刚我们说过，一些多媒体编码和插件不会随Fedora一起发送。现在，有谁想仅仅是因为专有编码而错过他们最爱的节目和电影？试试这个吧：

    $ sudo dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1

### 4) 更新系统 ###

Fedora是一个前锐的发行版，因此它会不断发布更新用以修复系统中出现的错误和漏洞。因而，保持系统更新到最新，是个不错的做法。

    $ sudo dnf update -y

### 5) 卸载你不需要的软件 ###

Fedora预装了一些大多数用户都有用的软件包，但是对于更高级的用户，你可能知道到你并不需要它。要移除你不需要的包相当容易，只需使用以下命令——我选择卸载rhythmbox，因为我知道我不会用到它：

    $ sudo dnf remove rhythmbox

### 6) 安装Adobe Flash ###

我们都希望Adobe Flash不要再存在了，因为它并不被认为是最安全的，或者存在资源问题，但是暂时先让它待着吧。Fedora 22安装Adobe Flash的唯一途径是从Adobe安装官方RPM，就像下面这样。

你可以从[这里][1]下载RPM。下载完后，你可以直接右击并像下面这样打开：

![Install Adobe Flash](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-9.50.42-PM.png)

右击并选择“用软件安装打开”

然后，只需在弹出窗口中点击安装：

![Install Adobe](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-9.51.07-PM.png)

*点击“安装”来完成安装Adobe定制RPM的过程*

该过程完成后，“安装”按钮会变成“移除”，而此时安装也完成了。如果在此过程中你的浏览器开着，会提示你先把它关掉或在安装完成后重启以使修改生效。

### 7) 用Gnome Boxes加速虚拟机 ###

你刚刚安装了Fedora，你也很是喜欢，但是出于某些私人原因，你也许仍然需要Windows，或者你只是想玩玩另外一个Linux发行版。不管哪种情况，你都可以使用Gnome Boxes来简单地创建一个虚拟机或使用一个live发行版，Fedora 22提供了该软件。遵循以下步骤，使用你所选的ISO来开始吧！谁知道呢，也许你可以检验一下某个[Fedora Spin][2]。

首先，打开Gnome Boxes，然后在顶部左边选择“新建”：

![Add a new virtual machine (box)](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-10.24.46-PM.png)

点击“新建”来开始添加一个新虚拟机的进程吧。

接下来，点击打开文件并选择一个ISO：

![Choose ISO](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-10.28.44-PM.png)

*在点击了“选择文件或ISO”后，选择你的ISO。这里，我已经安装了一个Debian ISO。*

最后，自定义VM设置或使用默认配置，然后点击“创建”。VM默认会启动，可用的VM会在Gnome Boxes以小缩略图的方式显示。

![Create VM](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-10.31.11-PM.png)

*自定义你自己的设置，或者也可以保持默认。完成后，点击“创建”，VM就一切就绪了。*

### 8) 添加社交媒体和其它在线帐号 ###

Gnome自带有不错的内建功能用于容纳帐号相关的东西，像Facebook，Google以及其它在线帐号。你可以通过Gnome设置应用访问在线帐号设置，可以在桌面上右键点击或在应用程序中找到该应用。然后，只需点击在线帐号，并添加你所选择的帐号。如果你要添加一个帐号，比如像Google，你可以用它来作为默认帐号，用来完成诸如发送邮件、日历提醒、相片和文档交互，以及诸如此类的更多事情。

### 9) 安装KDE或另一个桌面环境 ###

我们中的某些人不喜欢Gnome，那也没问题。在终端中运行以下命令来安装KDE所需的一切来替换它。这些指令也可以用以安装xfce、lxde或其它桌面环境。

    $ sudo dnf install @kde-desktop

安装完成后，登出。当你点击你的用户名时，注意那个表示设置的小齿轮。点击它，然后选择“Plasma”。当你再次登录时，一个全新的KDE桌面就会欢迎你。

![Plasma on Fedora 22](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-11.32.27-PM.png)

*刚刚安装到Fedora 22上的Plasma环境*

####在 Fedora 22中安装 Cinnamon桌面：####

打开SSH终端，输入或粘帖如下命令并回车：

	sudo dnf install @cinnamon-desktop

####在 Fedora 22中安装 MATE桌面：####

打开SSH终端，输入或粘帖如下命令并回车： 

	sudo dnf install @mate-desktop

####在 Fedora 22中安装 XFCE桌面：####

打开SSH终端，输入或粘帖如下命令并回车：

	sudo dnf install @xfce-desktop

####在 Fedora 22中安装 LXDE桌面：####

打开SSH终端，输入或粘帖如下命令并回车：

	sudo dnf install @lxde-desktop

### 10) 定制桌面并优化设置 ###

默认的 Gnome 带有一张黑色背景和一个新的锁屏，幸运的是，很容易通过下面的方式来改变：

![change desktop](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-28-at-7.17.29-AM-1024x767.png)

*右键点击桌面，然后点修改背景*

![Desktop or lock screen](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-28-at-7.17.52-AM-1024x769.png)

*你会看到这个窗口，这里你选择新的桌面背景或锁屏图片*

进一步，如果你点击“设置”，你会看到一个菜单展示你所以可以修改的设置。举个例子，在笔记本电脑上，你可以修改电源设置来控制合上笔记本电脑时的动作。


### 11) 安装 Fedy 4.0###

Fedy 可以帮助用户和系统管理员来监控系统的运作，并让他们可以控制系统如其所预期的工作。这里有一行脚本可以安装最新版本的 Fedy。打开终端，输入或粘帖如下行并按下回车。

	su -c "curl https://satya164.github.io/fedy/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer"

### 12) 安装 Java###

使用如下命令可以很容易的安装 Java。

	sudo dnf install java -y

它会根据你的系统架构自动安装32位或64位的 Java 发行版。

### 13) 在 Fedora 22 上安装浏览器 ###

Fedora 22的默认浏览器是 Firefox，不过其它的浏览器也各有优缺点。最终用户选择浏览器会有种种原因。这里我们提供一些在 Fedora 22上安装其它浏览器的方法。

#### 安装 Google Chrome####

使用你惯用的编辑器，在 yum 库目录中打开或创建  google-chrome.repo 文件。

	sudo gedit /etc/yum.repos.d/google-chrome.repo

加入以下内容并保存。

	[google-chrome]
	name=google-chrome
	baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
	enabled=1
	gpgcheck=1
	gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub

现在 yum 就配置好可以找到稳定版本的 Chrome 了，使用如下命令安装它。

	sudo dnf install google-chrome-stable

####　安装 Tor 浏览器 ####

在 Fedora 22 中安装 Tor 有一点棘手，在 /etc/yum.repos.d 目录中打开或创建 torproject.repo 文件。

	sudo gedit /etc/yum.repos.d/torproject.repo

插入以下内容。 

	[tor]
	name=Tor repo
	enabled=1
	baseurl=https://deb.torproject.org/torproject.org/rpm/fc/22/$basearch/
	gpgcheck=1
	gpgkey=https://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc

	[tor-source]
	name=Tor source repo
	enabled=1
	autorefresh=0
	baseurl=https://deb.torproject.org/torproject.org/rpm/fc/22/SRPMS
	gpgcheck=1
	gpgkey=https://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc

也许会问到 GPG 键的指纹，它应该如下。

	3B9E EEB9 7B1E 827B CF0A 0D96 8AF5 653C 5AC0 01F1

不幸的是，在 EPEL 和 Fedora 仓库中有一个相同名字的软件包，你需要明确排除这个来避免安装/删除/修改它。所以，在/etc/yum.repos.d/epel.repo 中加入 `Exclude=tor`  一行。

最后，使用如下命令来安装 Tor。

	sudo dnf install tor

安装完成，启动服务。

	sudo service tor start

#### 安装 Vivaldi####

根据你的系统架构下载32位或64位的  Vivaldi 浏览器。

	sudo wget https://vivaldi.com/download/Vivaldi_TP3.1.0.162.9-1.i386.rpm
	sudo wget https://vivaldi.com/download/Vivaldi_TP3.1.0.162.9-1.x86_64.rpm

使用下列命令安装下载的 RPM。

	sudo rpm -ivh Vivaldi_TP3.1.0.162.9-1.i386.rpm
	sudo rpm -ivh Vivaldi_TP3.1.0.162.9-1.x86_64.rpm


### 尾声 ###

就是这样了，一切就绪。使用新系统吧，试试新东西。如果你找不到与你喜好的东西，linux赋予你自由修改它的权利。Fedora自带有最新的Gnome Shell作为其桌面环境，如果你觉得太臃肿而不喜欢，那么试试KDE或一些轻量级的DE，像Cinnamon、xfce之类。愿你的Fedora之旅十分开心并且没有困扰！！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/things-do-after-installing-fedora-22/

作者：[Jonathan DeMasi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/jonathande/
[1]:https://get.adobe.com/flashplayer/
[2]:http://spins.fedoraproject.org/
[3]:https://www.google.com/intl/en/chrome/browser/desktop/index.html
