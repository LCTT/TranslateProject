如何通过网络在Windows、MAC和Linux之间共享文件
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/windows-mac-and-linux-network.jpg)

家庭[文件共享][1]曾经是一个噩梦，即使在不同的Windows版本之间—— 甚至不考虑Mac和Linux！但现在这些操作系统可以相互通信并且无需特殊软件就可共享文件。

我们之前使用SMB协议来做到这点。Windows使用SMB来做文件共享，同时Mac和Linux发行版都内置支持SMB。Microsoft甚至给开源Samba项目[提交过补丁][2]来改进它！

### 在Windows上共享文件夹 ###

既然其他操作系统不能访问家庭组，您需要[启用Windows老式的文件共享][3]。要做到这点，打开控制面板进入网络和共享> 更改高级共享设置。启用“网络发现”和“文件与打印共享”。

如果你想要无需密码访问共享文件夹你还需要微调一下其它选项。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/enable-file-and-printer-sharing-for-mac-and-linux-on-windows.png)

在Windows Explorer或者File Explorer中找到你想共享的文件夹，右键点击，选择属性。点击共享标签，并使用这里的选项来共享和配置文件夹的权限。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/share-windows-folders-with-mac-and-linux-on-local-network.png)

### 在Windows上访问共享文件夹 ###

在Windows Explorer或者File Explorer中访问网络面板来浏览其他计算机共享给你的文件。你会看到正确配置后的Mac和Linux计算机在Windows PC机附近出现了。双击一台计算机来查看它的共享文件。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/access-ubuntu-linux-shared-folder-on-windows.png)

如果你知道计算机名或者IP地址，你同样可以直接连接到这台计算机上，只需要在Windows Explorer或者File Explorer中输入\\计算名后按下回车就可以了。如果你希望直接通过IP地址连接，只需要将计算机名换成IP地址就可以了

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/directly-access-network-share-on-windows.png)

### 在Mac OS X 上共享文件夹 ###

你需要在你的Mac上启用网络文件共享来共享文件。点击桌面左上角的苹果logo，并选择系统偏好。点击共享图标并启用文件共享。点击选项按钮，并确认“使用SMB共享文件和文件夹”已经启用。

在共享文件夹那列中选择添加要共享的文件夹。使用用户列来选择哪些用户和组可以访问和写入它们

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/share-folder-with-windows-from-mac-os-x.png)

### 在 Mac OS X 访问共享目录###

打开Finder，在屏幕顶部的菜单中点击Go，选择连接到服务器，输入下面的地址，用Windows计算机名代替COMPUTERNAME：smb://COMPUTERNAME。你同样可以输入计算机IP来代替计算机名。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/directly-connect-to-windows-file-share-on-a-mac.png)

你会被提醒你应该用相应的凭证来验证或者以访客方式登录。连接完成后，在Finder的侧边栏的共享列中就会出现这台计算机，

要在你每次登录后自动链接到共享文件夹，打开系统偏好窗口并进入用户与组 > 登录项。从finder中的共享列中的网络共享拖拽到登录项列表中

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/windows-shared-folder-on-mac.png)

### 在 Linux 中共享文件夹 ###

在Linux上使用你桌面文件管理器来共享文件夹。这里，我们使用Ubuntu 14.04上的Nautilus，不过其他文件管理器上的过程应该是相似的。

打开文件管理器，在想要共享的文件上右键，选择属性。点击本地网络共享标签并对这个文件启用共享。如果这是你第一次启用共享，你会被提示要求安装Samba软件——这在你提供密码的时候会自动显示。

在安装完Samba软件后配置共享设置- 确认点击创建共享按钮来开始共享文件夹。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/share-folder-from-ubuntu-linux-with-windows-pc-over-local-network.png)

### 在 Linux 上访问共享文件夹 ###

你的Linux桌面文件管理器可能包含了一个网络浏览器，它可以用来定位并访问在本地网络的共享文件夹。

在文件管理器的侧边栏点击浏览网络选项。接着双击Windows网络选项，双击你的工作组（默认是WORKFROUP），双击邻近的计算机来浏览它的共享文件。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/browse-windows-network-shares-on-ubuntu.png)

要直接连接到一台计算机，选中Nautilus中的“连接到服务器”选项，并输入像这样的远程计算机地址：smb://COMPUTERNAME

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/directly-connect-to-windows-shared-folder-on-ubuntu.png)

不过在你连接时，你可能需要使用具有访问远程计算机权限的用户名和密码来验证。这依赖于你是否启用了访客访问以及你如何设置你的文件夹共享权限。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/191116/how-to-share-files-between-windows-mac-and-linux-pcs-on-a-network/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/166407/how-to-easily-share-files-between-nearby-computers/
[2]:http://www.samba.org/samba/news/developers/ms-patch.html
[3]:http://www.howtogeek.com/school/windows-network-sharing/lesson3/
