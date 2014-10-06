Linux有问必答：如何在CentOS上安装Shutter
================================================================================
> **问题**：我想要在我的CentOS桌面上试试Shutter屏幕截图程序，但是，当我试着用yum来安装Shutter时，它总是告诉我“没有shutter包可用”。我怎样才能在CentOS上安装Shutter啊？

[Shutter][1]是一个用于Linux桌面的开源（GPLv3）屏幕截图工具。它打包有大量用户友好的功能，这让它成为Linux中功能最强大的屏幕截图程序之一。你可以用Shutter来捕捉一个规则区域、一个窗口、整个桌面屏幕、或者甚至是来自任意专用地址的一个网页的截图。除此之外，你也可以用它内建的图像编辑器来对捕获的截图进行编辑，应用不同的效果，将图像导出为不同的图像格式（svg，pdf，ps），或者上传图片到公共图像主机或者FTP站点。

Shutter 在 CentOS (截止至版本 7)上没有预先构建好的软件包。幸运的是，有一个第三方提供的叫做 Nux Dextop 的 RPM 中提供了 Shutter 软件包。 所以在 CentOS 上[启用 Nux Dextop 软件库][2]，然后使用下列命令来安装它：

     $ sudo yum --enablerepo=nux-dextop install shutter 

![](https://farm4.staticflickr.com/3876/14986638615_6501a68527_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-shutter-centos.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://shutter-project.org/
[2]:http://linux.cn/article-3889-1.html
