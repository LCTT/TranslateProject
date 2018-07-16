Ubuntu每日小技巧 – HPLIP 3.14.3发布 – 在Ubuntu中升级
================================================================================
HP Linux成像和打印（HPLIP）是由惠普赞助提供全功能的HP打印机驱动程序的Linux社区的开放源代码包。

安装这个包后将默认在Ubuntu和其他Linux发行版完整中支持数以千计的HP打印机。支持的打印机数量正在定期添加，目前已经超过[2,300台HP打印机][1]。

这个版本，3.14.3增加了对更多打印机的支持，包括HP DeskJet Ink Advantage 4640 e-All-in-One Printer 系列，HP LaserJet Pro MFP M126nw，支持Debian 6.0.9，7.3，7.4 以及Fedora 20。

除了增加新的打印机和系统的支持，一些突出的问题在这个版本中也被解决。修复程序包括，HP Officejet 6100的功能定位问题，阻止第二传真队列中的互动问题，以及HP OfficeJet 7619 系列缺少No' 6 3/4信封媒介尺寸。

关于这次发布的更多信息，请查看发布页面[http://sourceforge.net/p/hplip/news/2014/03/hplip-3143-public-release-/][2]

以下是新支持的HP打印机的完整列表：

- HP DeskJet Ink Advantage 4640 e-All-in-One Printer series
- HP DeskJet Ink Advantage 4645 e-All-in-One Printer
- HP DeskJet Ink Advantage 4646 e-All-in-One Printer
- HP DeskJet Ink Advantage 4648 e-All-in-One Printer
- HP LaserJet Pro MFP M125a
- HP LaserJet Pro MFP M125nw
- HP LaserJet Pro MFP M125rnw
- HP LaserJet Pro MFP M126a
- HP LaserJet Pro MFP M126nw
- HP LaserJet Pro MFP M127fp

安装/升级到这个版本，请在键盘上按**Ctrl – Alt – T**，打开终端。当它打开时，运行下面的命令来下载该软件包。

    wget http://prdownloads.sourceforge.net/hplip/hplip-3.14.3.run

之后，运行以下命令来进行安装。

    sh hplip-3.14.3.run

安装时，按照向导来指导你。这是很简单的。对于一个完整的一步一步的安装引导，请查看这个帖子了。

http://www.liberiangeek.net/2013/02/hp-linux-imaging-and-printer-hplip-version-3-13-2-releasedadds-support-for-more-printers/

安装完成之后，请重启你的电脑。

![](http://www.liberiangeek.net/wp-content/uploads/2014/03/hplipubuntu3143.png)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-hplip-3-14-3-released-upgrade-in-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://hplipopensource.com/hplip-web/supported_devices/index.html
[2]:http://sourceforge.net/p/hplip/news/2014/03/hplip-3143-public-release-/
