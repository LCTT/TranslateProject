CoreOS Linux ending the upgrade cycle
CoreOS Linux结束升级周期
================================================================================
> CoreOS发布了他的Linux发行版的商用支持版，并且宣称将废除手动更新。

国际数据集团新闻社消息——CoreOS发布了商用Linux发行版，以期能简化系统管理员的生活。这个Linux发行版可持续进行自动更新，不需要进行重大升级。

CoreOS提供其同名的Linux发行版做为商业服务，开始为一个月100美元。

“商家现在可以开始考虑将CoreOS作为他们系统团队的延伸，对于企业Linux客户，这将是他们会需要的最后一次迁移。”CoreOS的创始人和CEO在一份声明中这样说。

商业Linux订阅并不是什么新鲜事：[Red Hat][2]和[Suse][3]都在为他们各自的发行版提供商业订阅。

因为这些以Linux为基础的公司使用的应用程序和库都是开源和免费提供的，所以订阅的费用不包括软件本身，而收费来自更新，漏洞修复，集成以及发生问题时的技术支持。

CoreOS公司声称，CoreOS将会和这些发行版不同，它将不会有重大更新，而这些更新通常需要一次更新更新所有的包。它的更新和新特征将会在就绪后自动。。。。CoreOS will be different from these distributions, the company asserted, in that there will be no major updates, which typically require updating all the packages in the distribution at once. Instead, updates and new features will be streamed automatically to the copy of the OS and applied as soon as they are ready.

The service offers a dashboard, called CoreUpdate, that provides controls for designating which software packages should get updated, should the administrator not want all the packages to be updated automatically.

CoreUpdate can manage multiple machines at once, and offers a roll-back capability should an update cause issues.

Launched last December, CoreOS was designed to [focus][4] on an emerging use of the open-source OS kernel -- that of powering lots of cloud-based virtual servers.

The average CoreOS instance was designed to consume only less than half of what other Linux distributions typically consume. All applications that run on the distribution run in Docker virtualized containers, so they can be started almost instantaneously.

The distribution can be updated more easily [due to its novel use of two partitions][5]. One can contain the current version of the OS while the OS is being updated in the other, smoothing the process of upgrading a package, or the entire distribution.

The CoreOS service can be run on-premises, or through Amazon, Google and Rackspace cloud services.

CoreOS also announced Monday that it received $8 million in backing from the Kleiner Perkins Caulfield and Byers venture capital firm. The company has previously gotten investment from Sequoia Capital and Fuel Capital.

----------

Joab Jackson covers enterprise software and general technology breaking news for The IDG News Service. Follow Joab on Twitter at [@Joab_Jackson][6]. Joab's e-mail address is [Joab_Jackson@idg.com][7]

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9249460/CoreOS_Linux_ending_the_upgrade_cycle?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://coreos.com/products/managed-linux/plans/
[2]:http://www.redhat.com/about/subscription/
[3]:https://www.suse.com/support/programs/subscriptions/
[4]:http://www.networkworld.com/article/2177120/cloud-computing/coreos-linux-distro-lands-on-the-google-cloud-platform.html
[5]:https://coreos.com/using-coreos/updates/
[6]:http://twitter.com/Joab_Jackson
[7]:Joab_Jackson@idg.com
