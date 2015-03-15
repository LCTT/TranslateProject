Google云服务为Docker应用提供简化版Ubuntu
================================================================================
> Ubuntu Core为运行容器提供了最小的轻量级Linux环境

Google为自己的云服务采用了一个简化版的Canonical Ubuntu Linux发行版，以优化运行Docker和其他容器。

Ubuntu Core被设计成仅提供在云上运行Linux所必需的组件。它发布了一个[早期预览版][1]，Canonical命名其为“Snappy”。这个新版本裁减了大量在普通Linux发行版中常见而在云应用中不实用的库和应用程序。

Google计算引擎(GCE)和Microsoft Azure[加入了][4]支持这个新的发行版的行列。

从Canonical了解到，Ubuntu Core将为用户提供一个部署Docker的简单方式，一个[日益精简的虚拟容器][4]允许用户快速启动工作负载并轻松地转移，甚至可以跨越不同的云服务提供商。

Google是Docker和基于容器的虚拟化的热心支持者。在去年六月份，这家公司[用开源的方式发布了一个容器管理软件][5]：Kubernetes。

Ubuntu Core在设计上类似于另一个[发布于一年前][7]的 Linux发行版 CoreOS。CoreOS 主要由两名前Rackspace工程师开发，[CoreOS][8]是一个轻量级Linux发行版，设计运行在集群中，被那些在网页上完成他们大部分或所有业务的公司所喜好的大规模环境。CoreOS很快被许多云服务提供商采用，包括Microsoft Azure，Amazon网站服务，DigitalOcean以及Google计算引擎。

如同CoreOS一样，Ubuntu Core提供了一个快速引擎来更新组件，减少系统管理员去手动处理的时间。

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2860401/cloud-computing/google-cloud-offers-streamlined-ubuntu-for-docker-use.html

作者：[Joab Jackson][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Joab-Jackson/
[1]:http://www.ubuntu.com/cloud/tools/snappy
[2]:http://www.infoworld.com/article/2607941/linux/how-to--get-started-with-docker.html
[3]:http://www.infoworld.com/blog/infoworld-tech-watch/
[4]:http://www.ubuntu.com/cloud/tools/snappy
[5]:http://www.itworld.com/article/2695383/open-source-tools/docker-all-geared-up-for-the-enterprise.html
[6]:http://www.itworld.com/article/2695501/cloud-computing/google-unleashes-docker-management-tools.html
[7]:http://www.itworld.com/article/2696116/open-source-tools/coreos-linux-does-away-with-the-upgrade-cycle.html
[8]:https://coreos.com/using-coreos/
