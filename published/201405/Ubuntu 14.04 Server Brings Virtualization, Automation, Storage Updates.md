Ubuntu 14.04服务器版提供了虚拟化、自动化、存储相关更新
================================================================================
> 这次发布的Ubuntu 14.04，代号Trusty Tahr（值得信赖的塔尔羊），将会给服务器版用户带来新的自动化，虚拟化和存储相关特性。

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2014/04/ubuntulogo.png)

[Ubuntu 14.04][1], 是由[Canonical][2]推出的基于Linux的开源操作系统最新版本，没有为PC和移动用户带来太大改动，对他们来说仅仅是较少的更新。而对服务器用户，这次最新的最重大的Ubuntu版本更新带来了更多功能，特别在自动化，云计算，以及虚拟化等方面。

对桌面和移动用户来说，这次即将在4月17日正式露面的Ubuntu14.04的最重大的改动是，**它带来了AppArmor安全系统的更新**。这个在桌面/移动版本中最重要的新特性，是一个运行在后台的内核强化包，那些在个人电脑，手机或者平板上使用Ubuntu的人们在Ubuntu 14.04版本中也许根本感觉不到什么大的改动。

然而，在服务器世界里，最新版的Ubuntu带来了更实质性的改动。特别是，**它将[Puppet][3]升级到了第3版**，Puppet是一个用来自动化IT基础设施管理的开源平台。这是个重要的更新，能够为部署大型Ubuntu服务器网络的人们带来便利（不过是在他们解决好Puppet早期版本和最新版之间的兼容性问题之后，新旧版本之间并不互相完全兼容）。

Ubuntu 14.04还将带来开源的**虚拟化管理程序[Xen][6]的4.4版本**。这次改动，对于旧版的Xen部署环境也需要做一些必要的调整，才可以切换到新版本上。不过，它提供了更多的新特性，而且可以协助管理Ubuntu服务器上虚拟环境的多样性，包括众多的虚拟化管理程序，[VMware][4] (VMW)，[KVM][5]，Xen等等。

最后，Ubuntu 14.04的内核基于[Linux][7] 3.13，也带来了比如更好的固态硬盘(SSD)性能等[新特性][8]。这也是很受服务器用户欢迎的，特别是那些在云和大数据领域里对性能有很高要求的用户。

这次的Ubuntu 14.04是一个[长期支持][9](LTS)版本，这也是服务器用户最有可能长期使用于生产环境的版本，而非LTS版本对于实际生产环境来说没有任何意义。尽管Canonical持续地集中精力于在PC和移动设备上"[统一][10]"的努力，这次Ubuntu带来的自动化，虚拟化和存储软件的更新在合适的时间点推出，有利于维持Ubuntu在服务器市场的竞争力。

--------------------------------------------------------------------------------

via: http://thevarguy.com/servers/041514/ubuntu-1404-server-brings-virtualization-automation-storage-updates

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://releases.ubuntu.com/14.04/
[2]:http://www.canonical.com/
[3]:http://puppetlabs.com/
[4]:http://vmware.com/
[5]:http://www.linux-kvm.org/
[6]:http://xen.org/
[7]:http://kernel.org/
[8]:http://thevarguy.com/open-source-application-software-companies/linux-kernel-updates-add-features-mobile-cloud-big-data
[9]:https://wiki.ubuntu.com/LTS
[10]:http://thevarguy.com/open-source-application-software-companies/can-canonical-rally-its-community-ubuntu-convergence
