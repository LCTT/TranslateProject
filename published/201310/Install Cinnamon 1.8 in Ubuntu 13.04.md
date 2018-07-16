在Ubuntu中安装Cinnamon 1.8
=======================

在[之前的一些文章][1]中我们已经讨论过[Cinnamon][2]和[Nemo文件管理器][3]是什么，但是如果你仍然不了解，请读下文：

Cinnamon是由[Linux Mint][4]团队最初为Linux Mint开发的一款桌面环境。它提供给用户一个更舒适和现代化的体验。

如果你和我一样很喜欢Unity（Ubuntu默认桌面）。我建议你尝试一下Cinnamon。安装Cinnamon不意味着你淘汰Unity，绝不是。

最新版本的Cinnamon 1.8在Ubuntu仓库尚未公布，因此我们要感谢PPA。

Cinnamon1.8包含了这些新功能，包括 Screensaver（屏幕保护程序），Cinnamon Control Center（Cinnamon控制中心）[等等][5].

###安装Cinnamon

打开终端输入以下命令：

	$ sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-stable  
	$ sudo apt-get update  
	$ sudo apt-get install cinnamon nemo

安装Cinnamon和Nemo文件管理器成功后，注销或重启你的系统。

点击你 **用户名右上角** 的 **Ubuntu** 图标。你应该能看到 **Cinnamon** 和其他桌面环境。

选择 **Cinnamon** 并登录。

你就有了这样一个桌面。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/cinnamon_1_8_unixmen.png )

_查看已打开菜单的Cinnamon 1.8桌面_

-------

via: http://www.unixmen.com/install-cinnamon-1-8-ubuntu-13-04/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[Caroline]:http://linux.cn/space/14763

[1]:http://www.unixmen.com/cinnamon-and-nemo-file-manager-in-ubuntu-13-0413-10/
[2]:http://cinnamon.linuxmint.com/
[3]:http://en.wikipedia.org/wiki/Nemo_(file_manager)
[4]:http://linuxmint.com/ 
[5]:http://cinnamon.linuxmint.com/?p=261
