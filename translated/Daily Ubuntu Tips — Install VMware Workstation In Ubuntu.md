每日Ubuntu小技巧 - 在Ubuntu上面安装VMware Workstation
================================================================================
VMware Workstation是第二类商用虚拟化软件。被称为第二类是因为它是运行在现有的操作系统之上的，而正在运行的计算机成为宿主机。

你可以使用VMware Workstation在运行在宿主机上的一个操作系统上同时运行多个客户机。客户机可以是被支持的32位或者64位的操作系统。VMware Workstation支持Windows，Mac OS X，Solaris和许多其他系统。


这篇简短的教程将会教你怎么在Ubuntu上面安装VMware Workstation。

因为这个软件是商业软件，因此你必须要拥有一个可用的许可证才能够使用它。你可以从下载页面 [下载30天免费体验版][1]来体验它。如果你想注册，获得并且验证一个许可证即可。

想要在Ubuntu上开始安装VMware Workstation，首先需要运行如下命令升级Ubuntu。

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

升级完电脑后，运行如下命令来让Ubuntu为安装做好准备。

    sudo apt-get install build-essential linux-headers-`uname -r`

然后，下载VMware Workstation。接着进入Firefox保存文件的 **~/下载** 目录。

    cd Downloads

如果下载的包是.zip格式的，则运行如下命令解压下载的包，否则跳过这一步。

    unzip VMware-Workstation-Full*.zip

然后，运行如下命令让文件可以被执行。

    chmod +x VMware-Workstation-Full*.bundle

最后，运行下面的命令开始安装。

    sudo ./VMware-Workstation-Full*.bundle

在完成安装前按照向导进行选择。当所以工作完成后，从Dash打开它并开始创建客户机。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/vmwareworkstationubuntu.png)

你可以从所有的类型中选择创建许多客户机，包括Windows，Linux，Nevell，Solaris等。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/vmwareworkstationubuntu1.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/daily-ubuntu-tips-install-vmware-workstation-in-ubuntu/

译者：[SCUSJS](https://github.com/scusjs) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://my.vmware.com/web/vmware/info/slug/desktop_end_user_computing/vmware_workstation/10_0
