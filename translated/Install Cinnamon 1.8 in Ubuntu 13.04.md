在Ubuntu中安装Cinnamon 1.8
-----

在[之前的一些文章][1]中我们讨论过[Cinnamon][2]和[Nemo文件管理器][3]。但是如果你仍然忘记了Cinnamon是什么，给你提示：

Cinnamon是Linux Mint团队最初为[Linux Mint][4]开发的桌面环境。这个桌面环境提供给用户一个更舒适和现代的感受。

如果你喜欢Unity（Ubuntu默认桌面）如此能干。我建议你尝试Cinnamon一次。安装Cinnamon不意味着你淘汰Unity。绝不是。

最新版本的Cinnamon 1.8在Ubuntu仓库尚未公布，因此我们要感谢PPA。

一些新的功能已经被包括在Cinnamon，包括 Screensaver（屏幕保护程序），Cinnamon Control Center（Cinnamon控制中心）和[更多][5].

**安装Cinnamon**  

打开终端输入以下命令：

	$ sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-stable  
	$ sudo apt-get update  
	$ sudo apt-get install cinnamon nemo

安装Cinnamon和Nemo文件管理器成功后，注销或重启你的系统。

点击 **登录界面** 你的 **用户名** **Ubuntu logo** 的 **右上角** 。你应该能看到 **Cinnamon** 和其他桌面环境。

选择 **Cinnamon** 并登录。

你应该有这样一个桌面。

![](https://github-camo.global.ssl.fastly.net/a84acd175edc8982cc13ad0cdc49478188b96405/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f31302f63696e6e616d6f6e5f315f385f756e69786d656e2e706e67 )

查看Cinnamon 1.8桌面与打开的菜单。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-cinnamon-1-8-ubuntu-13-04/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.unixmen.com/cinnamon-and-nemo-file-manager-in-ubuntu-13-0413-10/
[2]:http://cinnamon.linuxmint.com/
[3]:http://en.wikipedia.org/wiki/Nemo_(file_manager)
[4]:http://linuxmint.com/ 
[5]:http://cinnamon.linuxmint.com/?p=261
