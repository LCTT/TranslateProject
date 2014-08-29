Linux有问必答——如何在CentOS上安装Shutter
================================================================================
> **问题**：我想要在我的CentOS桌面上试试Shutter屏幕截图程序，但是，当我试着用yum来安装Shutter时，它总是告诉我“没有shutter包可用”。我怎样才能在CentOS上安装Shutter啊？

[Shutter][1]是一个用于Linux桌面的开源（GPLv3）屏幕截图工具。它打包有大量用户友好的功能，这让它成为Linux中功能最强大的屏幕截图程序之一。你可以用Shutter来捕捉一个规则区域、一个窗口、整个桌面屏幕、或者甚至是来自任意专用地址的一个网页的截图。除此之外，你也可以用它内建的图像编辑器来对捕获的截图进行编辑，应用不同的效果，将图像导出为不同的图像格式（svg，pdf，ps），或者上传图片到公共图像主机或者FTP站点。
Shutter is not available as a pre-built package on CentOS (as of version 7). Fortunately, there exists a third-party RPM repository called Nux Dextop, which offers Shutter package. So [enable Nux Dextop repository][2] on CentOS. Then use the following command to install Shutter.

     $ sudo yum --enablerepo=nux-dextop install shutter 

![](https://farm4.staticflickr.com/3876/14986638615_6501a68527_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-shutter-centos.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://shutter-project.org/
[2]:http://ask.xmodulo.com/enable-nux-dextop-repository-centos-rhel.html
