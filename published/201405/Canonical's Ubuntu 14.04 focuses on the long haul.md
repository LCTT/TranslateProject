Canonical公司的Ubuntu 14.04关注在长期服务上
================================================================================
>  Ubuntu 14.04的服务器版配备Docker引擎和更好的固态硬盘支持

来自IDG新闻服务消息：因为各机构将本地系统移动到了云端，Canonical公司希望他们同时考虑更换一下操作系统到Ubuntu上。

Canonical公司的Ubuntu Server产品经理Mark Baker说：“当人们移动到云端时，它往往涉及到重新设计应用程序，众多企业都想要获得横向扩展和云技术的便利之处。”

鉴于一些类似于云服务迁移的的急迫性，[据Gartner的调查][1]，在未来几年内，约百分之七十的CIO打算重新评估他们在IT供应商的选择。Baker说：“我们看到了这方面的迹象。”

前不久发布的服务器版的Ubuntu 14.04中，Canonical公司强调了在宿主环境中，机构是如何运用它来作为运行大型关键任务应用程序的基础。这个版本带有长期支持和许多云方面的软件程序，如Docker，最新版本的OpenStack。

> Baker说：“我们现在更加意识到我们正在创造一个为企业所采用的平台”
> 
> Ubuntu 14.04 是一个长期支持版本(LTS)，意味着它将会有五年的补丁和支持，这使得它作为企业长期的生产应用更可行。这次它也将允许用户从Ubuntu自身的版本库系统更新软件包。
> 
> Canonical公司每年发布两个新的Ubuntu版本，但是每两年发布一个LTS版本，其他非LTS版本只支持九个月。
>
>使用常规的非LTS版本，九个月后，用户将不再得到bug修复，无法从Canonical那儿更新软件或操作系统。如果用户选择这样做，那他们只有约三个月来更新系统。 
>
>长期支持版本来的正是时候，它将解决在基础软件中发现的日益严重的安全漏洞，如OpenSSL的“心脏出血”安全漏洞[这使无数的Web应用程序容易受到攻击][2].

上周，微软停止支持Windows XP操作系统，可能会使数以百万计的用户[面临攻击][3].

Baker说，使用Ubuntu服务器版操作系统的人中大约有百分之七十使用LTS版本。

Baker说：“在没到合适时间的时候，机构并不想升级，五年是一段很长的时间，这给了他们找到正确迁移路径更多的选择。”

Baker承认，新版本中相对较少的新包和功能，主要是由于Canonical公司为了使得软件可供长期使用。

该公司与其他硬件和软件供应商已经做了大量的沟通，如AMD，思科和云供应商如亚马逊，Joyent，惠普等等。

[星期四发布][4]的版本包括了称为冰室的最新的OpenStack云托管软件.

值得注意的是OpenStack本身只会通过接下来的下两个版本来对每个版本进行支持，[从现在开始大约18个月][5].

这也是Ubuntu 14.04第一次包含Docker ——[一个开源的Linux应用容器引擎，支持轻量级运行完整的虚拟机][6]

还包括了XFS第一版，一个最初由SGI(硅图形)公司开发的高性能的64位日志文件系统。Canonical公司的竞争对手Red Hat[计划使用XFS][7]作为小红帽Linux企业版(RHEL)的默认文件系统。

小红帽Linux企业版中同样包含Docker和OpenStack。

同样的，Canonical公司的Ubuntu也将更有效的支持固态硬盘(SSD)。Ubuntu 14.04配备了[一月份发布的][8]Linux 3.13 内核。Linux 3.13包括一个称为多队列块层的新技术，通过将作业分发到多核提高了SSD磁盘读写性能。

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9247694/Canonical_39_s_Ubuntu_14.04_focuses_on_the_long_haul?taxonomyId=122

译者：[tenght](https://github.com/tenght) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.gartner.com/newsroom/id/2685515
[2]:http://www.computerworld.com/s/article/9247671/Server_makers_rush_their_Heartbleed_patches
[3]:http://www.computerworld.com/s/article/9247525/Microsoft_Patch_Tuesday_bids_adieu_to_Windows_XP
[4]:https://wiki.openstack.org/wiki/Icehouse_Release_Schedule
[5]:https://wiki.openstack.org/wiki/Releases
[6]:http://www.infoworld.com/d/virtualization/docker-challenges-virtualization-market-containers-235897
[7]:http://www.infoworld.com/t/linux/red-hat-enterprise-linux-7-beta-now-available-232520
[8]:http://kernelnewbies.org/Linux_3.13
[9]:http://www.phoronix.com/scan.php?page=news_item&px=MTUwNDc