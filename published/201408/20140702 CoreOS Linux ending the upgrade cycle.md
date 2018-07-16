CoreOS Linux终结升级周期
================================================================================
> CoreOS发布了他的Linux发行版的商用支持版，并且宣称将废除手动更新。

国际数据集团新闻社消息——CoreOS发布了商用Linux发行版，以期能简化系统管理员的生活。这个Linux发行版可持续进行自动更新，不需要进行重大升级。

CoreOS提供其同名的Linux发行版做为商业服务，开始为一个月100美元。

“商家现在可以开始考虑将CoreOS作为他们系统团队的延伸，对于企业Linux客户，这将是他们会需要的最后一次迁移。”CoreOS的创始人和CEO在一份声明中这样说。

商业Linux订阅并不是什么新鲜事：[Red Hat][2]和[Suse][3]都在为他们各自的发行版提供商业订阅。

因为这些以Linux为基础的公司使用的应用程序和库都是开源和免费提供的，所以订阅的费用不包括软件本身，而收费来自更新、漏洞修复、集成以及发生问题时的技术支持。

CoreOS公司声称，CoreOS将会和这些发行版不同，它将不会有重大更新，而在那些发行版中这些更新通常需要一次更新所有的包。在CoreOS中，它的更新和新特征将会在就绪后自动安装入操作系统中。

服务中提供了一个叫做CoreUpdate的仪表盘，如果管理员不想自动更新所有包，它可用于标明选取哪些软件包获取更新。

CoreUpdate可以同时管理多个机器，而且提供了回滚功能——在更新引起问题可使用。

CoreOS于去年十二月发布，它的设计旨在[关注][4]开源操作系统内核的新兴使用——用于大量基于云计算的虚拟服务器。

CoreOS的设计使其平均消耗要少于其他Linux发行版通常消耗的一半。系统中所有的程序运行在Docker虚拟化容器中，所以它们几乎可以在瞬间就开始运行。

[由于CoreOS分为两部分的新用法][5]使其更新更为容易。一部分放置当前版本的系统，而另一部分系统来进行升级，平滑地进行升级包或者整个系统。

CoreOS服务可以运行在本地，或者在Amazon，Google和Rackspace云服务上。

CoreOS周一还宣布他们收到了来自Kleiner Perkins Caulfield and Byers风险投资公司的800万美元的支持。他们此前还收到了红杉资本和斐然资本的投资。

----------

作者Joab Jackson负责IDG新闻服务机构中企业软件和通用技术的新闻。Twitter上关注Joab[@Joab_Jackson][6]。Joab的电子邮箱地址是[Joab_Jackson@idg.com][7]


--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9249460/CoreOS_Linux_ending_the_upgrade_cycle?taxonomyId=122

译者：[linuhap](https://github.com/linuhap) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://coreos.com/products/managed-linux/plans/
[2]:http://www.redhat.com/about/subscription/
[3]:https://www.suse.com/support/programs/subscriptions/
[4]:http://www.networkworld.com/article/2177120/cloud-computing/coreos-linux-distro-lands-on-the-google-cloud-platform.html
[5]:https://coreos.com/using-coreos/updates/
[6]:http://twitter.com/Joab_Jackson
[7]:Joab_Jackson@idg.com
