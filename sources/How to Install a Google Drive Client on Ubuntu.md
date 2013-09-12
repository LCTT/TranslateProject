##如何在Ubuntu下安装Google云端硬盘客户端

下面的教程将为所有的Ubuntu用户讲授如何在你们健壮的Ubuntu操作系统上安装名为Grive的非官方Google云端硬盘客户端。

正如你所知，Google（大概讨厌Linux用户）没有为优秀的Google云端硬盘提供Linux的客户端。但是不用担心，像Lorenzo Breda这样的社区天才开发了一个非官方的云端硬盘Linux客户端，称为Grive.

在我们实际安装之前，我们应该告知你Grive还是在开发的早期阶段并且有一些局限性，例如（folders and files with multiple parents父母具有多个文件夹和文件？）并且可以下载Google文档.

另外，我们应该提及的是Grive是一个命令行客户端并且没有GUI(graphical user interface)界面，因此，这次安装我们将使用其他Linux天才制作的工具，简单称为Grive Tools，它将在你的Ubuntu机子上自动下载，编译和安装最新版本的Grive.

Grive Tools支持以下的Ubuntu发行版：Ubuntu 12.10 (Quantal Quetzal), Ubuntu 13.04 (Raring Ringtail),和Ubuntu 13.10 (Saucy Salamander).

###安装依赖库

这是一个简单的步骤，只要求你在Unity Dash上搜索并打开终端，然后将以下的代码粘贴在终端窗口上：

sudo apt-get install -y git cmake build-essential libgcrypt11-dev libjson0-dev libcurl4-openssl-dev libexpat1-dev libboost-filesystem-dev li    bboost-program-options-dev binutils-dev libboost-test-dev libqt4-dev libyajl-dev expect zenity gksu libnotify-bin

敲打回车键，当提示输入密码时键入密码并再一次敲打回车键开始进入安装过程，需要注意的是可能有一些依赖包由你之前的应用程序安装好了。

Review image

###安装Grive Tools和Grive

在[这里][1]正确的下载Grive Tools包并保存在你的桌面上，下载完成后双击它，此时Ubuntu软件中心将打开，这样你就可以轻松容易的安装该应用了。

Review image

一旦安装完成，在Unity Dash上搜索Grive Tools并打开。Grive Tools将要求你输入你的密码，键入你的密码并点击OK，然后Grive Tools将开始下载和配置最新版本的Grive，该过程将花费一些时间。

Review image

Review image

###在Grive上配置Google云端硬盘

现在Google云端硬盘Linux客户端已经安装完毕，为了让它可以访问你的	Google云端账号，我们需要配置它，当你看到下面的对话框时请单击"Next"按钮...

Review image

一个web浏览器或标签将被打开，告诉你需要你登入Google账号（如果你尚未登入）并授权给该应用去访问你的Google云端硬盘，单击蓝色的"Accept"按钮后你将可以看到Google认证码，你需要将该认证码复制并且粘贴在Grive设置对话框上。

Review image

Review image

就是这样！你的Google云端硬盘上的文件将根据你的Google账号立即下载到并放置到你的家目录下的"Google Drive"文件夹下。同步时你将可以看到一个桌面通知。

Review image

如果你在Unity Dash上搜索"Google Drive"（不带引号），你将可以看到一个Google云端硬盘的图标，你可以将该图标拖拽到Unity启动器上，在Unity启动器上右键点击Google云端硬盘图标可以快速的同步到你的Google云端硬盘上或者访问你的本地文件夹。

Review image

如果你在该教程上遇到什么问题请在下面写下你的评论。

[1]:http://linux.softpedia.com/get/Utilities/Grive-Tools-102298.shtml

via: http://news.softpedia.com/news/How-to-Install-a-Google-Drive-Client-on-Ubuntu-381532.shtml
