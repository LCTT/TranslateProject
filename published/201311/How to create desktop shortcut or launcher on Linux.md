如何在Linux的桌面上创建快捷方式或启动器
===
如果在Linux桌面系统中你经常使用一个程序，你可能想去创建一个“桌面快捷方式”，以便于你在桌面只要点击一下快捷方式就可以启动它。虽然不少带有图形界面的程序会在安装时自动在桌面上创建快捷方式，还有一些图形界面程序或者命令行程序可能需要你手动创建快捷方式。

在这个教程里，我将告诉你**如何在不同的Linux桌面上添加桌面快捷方式**。（译注：其实除了作者所述的这些方法外，各种桌面上也还有更简便的方法，大家可以评论分享自己的经验）

一个桌面快捷方式是由内含该APP元信息（例如，app的名字，启动命令或者图标位置等）的.desktop文件所表示的。桌面快捷方式文件放置于**/usr/share/applications**或者**~/.local/share/applications**处。前一个目录存储的桌面快捷方式每个用户都可以使用，而后一个目录则含有仅仅为特定用户创建的快捷方式。

###使用命令行创建桌面快捷方式

要为特定程序或命令创建桌面快捷方式，你可以使用任意文本编辑器创建一个.desktop文件，然后把它放到**/usr/share/applications**或者**~/.local/share/applications**处。一个典型的.desktop文件如下图所示。

	[Desktop Entry]
	Encoding=UTF-8
	Version=1.0									    #version of an app.
	Name[en_US]=yEd									#name of an app.
	GenericName=GUI Port Scanner					#longer name of an app.
	Exec=java -jar /opt/yed-3.11.1/yed.jar			#command used to launch an app.
	Terminal=false									#whether an app requires to be run in a terminal
	Icon[en_US]=/opt/yed-3.11.1/icons/yicon32.png	#location of icon file.
	Type=Application								#type
	Categories=Application;Network;Security;		#categories in which this app should be listed.
	Comment[en_US]=yEd Graph Editor					#comment which appears as a tooltip.

除了手动创建.desktop文件之外，依据你的系统所采用的桌面环境的不同有不同的创建应用快捷方式的方法，接下来的教程我将为你讲解。

###在GNOME桌面下创建快捷方式

在GNOME桌面环境下，你可以使用gnome-desktop-item-edit轻松创建创建一个桌面快捷方式。

	$ gonme-desktop-item-edit ~/.local/share/applications --create-new

在这个例子中，gnome-desktop-item-edit会在目录～/.local/share/applications中自动创建一个桌面启动器文件。若是想自定义快捷方式图标或者其它信息，你可以手动编辑.desktop文件。

如果在你的系统上，gnome-desktop-item-edit不可用（例如，在Ubuntu上），你可以依照下面方式安装：

	$ sudo apt-get install --no-install-recommends gnome-panel

###在KDE桌面创建快捷方式

kickoff是KDE桌面默认的应用启动器。可以直接在kickoff里添加新的应用启动快捷方式。

首先右击位于你桌面左下角处的kickoff图标，然后选择菜单“编辑应用”。

[![](http://farm3.staticflickr.com/2839/10848506344_7949638fe0.jpg)][1]

在你要创建快捷方式的合适分类处（例如， "Utilities"）右击，点击位于顶部的“新条目”按钮，键入应用的名字。

[![](http://farm8.staticflickr.com/7459/10848418496_ac6de897fe_z.jpg)][2]

最后，填上使用快捷方式启动app时所需的元信息即可。

[![](http://farm8.staticflickr.com/7347/10848506284_18c8d9234d_z.jpg)][3]

###在xfce桌面上创建快捷方式

假如你使用xfce桌面，在桌面空白处右击，选择“创建启动器”按钮。然后填上快捷方式的详细信息就可以了。

###在Cinnamon桌面上创建快捷方式 

假如使用的是Linux Mint的Cinnamon桌面，你可以在桌面空白处右击鼠标，选择菜单“创建启动器”而创建一个应用启动器。

###在LXDE桌面上创建快捷方式

在LXDE桌面，你只需在桌面空白处右击一下鼠标，然后选择“创建新快捷方式”就可以咯。

[![](http://farm4.staticflickr.com/3725/10848922593_441ed98174.jpg)][4]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/create-desktop-shortcut-launcher-linux.html

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.flickr.com/photos/xmodulo/10848506344/
[2]:http://www.flickr.com/photos/xmodulo/10848418496/
[3]:http://www.flickr.com/photos/xmodulo/10848506284/
[4]:http://www.flickr.com/photos/xmodulo/10848922593/
