两种简单的方式在 Linux 安装必应桌面墙纸更换器
======

你是否厌倦了 Linux 桌面背景，想要设置好看的壁纸，但是不知道在哪里可以找到？别担心，我们在这里会帮助你。

我们都知道必应搜索引擎但是由于一些原因很少有人使用它，每个人都喜欢必应网站的背景壁纸，它是非常漂亮和惊人的高分辨率图像。

如果你想使用这些图片作为你的桌面壁纸，你可以手动下载它，但是很难去每天下载一个新的图片，然后把它设置为壁纸。这就是自动壁纸改变的地方。

[必应桌面墙纸更换器][1]会自动下载并将桌面壁纸更改为当天的必应照片。所有的壁纸都储存在 `/home/[user]/Pictures/BingWallpapers/`。

### 方法 1: 使用 Utkarsh Gupta Shell 脚本

这个小型 python 脚本会自动下载并将桌面壁纸更改为当天的必应照片。该脚本在机器时自动运行，并在 GNU/Linux 上使用 Gnome 或 Cinnamon 工作。它不需要手动工作，安装程序会为你做所有事情。

从 2.0+ 版本开始，安装程序就像普通的 Linux 二进制命令一样工作，它会为某些任务请求 sudo 权限。

只需克隆仓库并切换到项目目录，然后运行 shell 脚本即可安装必应桌面墙纸更换器。

	$ https://github.com/UtkarshGpta/bing-desktop-wallpaper-changer/archive/master.zip
	$ unzip master
	$ cd bing-desktop-wallpaper-changer-master

运行 `installer.sh` 使用 `--install` 选项来安装必应桌面墙纸更换器。它会下载并设置必应照片为你的 Linux 桌面。

	$ ./installer.sh --install

	Bing-Desktop-Wallpaper-Changer
	BDWC Installer v3_beta2
	
	GitHub:
	Contributors:
	.
	.
	[sudo] password for daygeek: **
	
	******
	
	**
	.
	Where do you want to install Bing-Desktop-Wallpaper-Changer?
	 Entering 'opt' or leaving input blank will install in /opt/bing-desktop-wallpaper-changer
	 Entering 'home' will install in /home/daygeek/bing-desktop-wallpaper-changer
	 Install Bing-Desktop-Wallpaper-Changer in (opt/home)? : **
	
	Press Enter
	
	**
	
	Should we create bing-desktop-wallpaper-changer symlink to /usr/bin/bingwallpaper so you could easily execute it?
	 Create symlink for easy execution, e.g. in Terminal (y/n)? : **
	
	y
	
	**
	
	Should bing-desktop-wallpaper-changer needs to autostart when you log in? (Add in Startup Application)
	 Add in Startup Application (y/n)? : **
	
	y
	
	**
	.
	.
	Executing bing-desktop-wallpaper-changer...
	
	
	Finished!!

[![][2]![][2]][3]

卸载脚本

	$ ./installer.sh --uninstall

使用帮助页面了解更多关于此脚本的选项。

	$ ./installer.sh --help

### 方法 2: 使用 GNOME Shell 扩展

轻量级[GNOME shell 扩展][4]，可将你的壁纸每天更改为微软必应的壁纸。它还会显示一个包含图像标题和解释的通知。

该扩展广泛地基于 Elinvention 的 NASA APOD 扩展，受到了 Utkarsh Gupta 的 Bing Desktop WallpaperChanger 启发。

### 特点

-  获取当天的必应壁纸并设置为锁屏和桌面墙纸(这两者都是用户可选的)
-  可强制选择某个特定区域(即地区)
-  在多个监视器设置中自动选择最高分辨率(和最合适的墙纸)
-  可以选择在1到7天之后清理墙纸目录(删除最旧的)
-  只有当他们被更新时，才会尝试下载壁纸
-  不会持续进行更新 - 每天只进行一次，启动时也要进行一次(更新是在必应更新时进行的)

### 如何安装

访问 [extenisons.gnome.org][5]网站并将切换按钮拖到 `ON`，然后点击 `Install` 按钮安装必应壁纸 GNOME 扩展。(译者注：页面上并没有发现 ON 按钮，但是有 Download 按钮)
[![][2]![][2]][6]

安装必应壁纸 GNOME 扩展后，它会自动下载并为你的 Linux 桌面设置当天的必应照片，并显示关于壁纸的通知。
[![][2]![][2]][7]

托盘指示器将帮助你执行少量操作，也可以打开设置。
[![][2]![][2]][8]

根据你的要求自定义设置。
[![][2]![][2]][9]

--------------------------------------------------------------------------------

via: [https://www.2daygeek.com/bing-desktop-wallpaper-changer-linux-bing-photo-of-the-day/](https://www.2daygeek.com/bing-desktop-wallpaper-changer-linux-bing-photo-of-the-day/)

作者：[2daygeek](https://www.2daygeek.com/author/2daygeek/) 译者：[MjSeven](https://github.com/MjSeven) 校对：[校对者 ID](a)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://github.com/UtkarshGpta/bing-desktop-wallpaper-changer
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-linux-5.png
[4]:https://github.com/neffo/bing-wallpaper-gnome-extension
[5]:https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/
[6]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-1.png
[7]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-2.png
[8]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-3.png
[9]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-4.png
