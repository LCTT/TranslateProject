红帽公司发布 OpenStack Platform 5
================================================================================
![](http://farm4.static.flickr.com/3108/3191608123_67e1da2b79_o.jpg)

红帽公司[宣布][1]在RHEL上推出OpenStack Platform5，这是基于OpenStack开源云的第三个企业级发行版。该版本不仅开发了一些新功能，针对的用户群体也大为增多，如高大上的云用户、电信企业、互联网服务供应商（ISP)、公有云服务供应商等。

OpenStack Platform 5是基于最新的Openstack Icehouse的发行版，并且针对云计算技术做了大量的修改和优化工作而来的。
  
这个最新的发行版有3年的技术支持周期，[我选择了使用][2]它是考虑到红帽公司在Linux系统上对用户无以伦比的技术支持，红帽公司对其OpenStack Platform 5的技术支持服务将是促使企业购买的关键之一。

对于红帽公司是否会支持OpenStack的其他发行版尚未有定论，但一份OpenStack用户调查已经显示[90%的OpenStack开发人员并没有在RHEL上使用OpenStack][3]，而是选用了Ubuntu或者CentOS Linux和其虚拟化技术。

OpenStack Platform 5的最新功能：

> **支持和VMware基础架构的整合**,结构包含虚拟化、管理、网络和存储。
用户一般会使用已经在使用的VMware vSphere资源，比如虚拟化驱动作为OpenStack （Nova）的计算节点，再使用上层的OpenStack Dashboard(Horizon)对节点进行管理。
同样的，RHEL OpenStack Platform 5也支持VMware的NSX插件，作为OpenStack NetWorking （Neutron)对网络进行管理，支持VMware虚拟磁盘（VMDK）以插件形式存在，作为OpenStack Block Storage(Cinder)来使用。
>

> **对云资源的使用，采取了更好的布置。**服务器组让计算散布到OpenStack云的服务节点上，这让分布式应用有了更强的弹性，对于复杂的应用，也能起到降低通信延迟，提高运算性能的作用。
>

> **对虚拟机更好的支持，支持加密，满足美英国家对信息安全的要求** 使用RHEL 7中提供的半虚拟化随机数生成器，在用户程序中也添加进这个工具，可以更好的加密质量和性能提升。

> **提升协议栈的互通性**红帽公司宣称，Neutron中新开发的模块化的网络技术将简化OpenStack的部署。这种技术将允许用户在OpenStack中部署多种网络方案来解决异构网络的访问。

红帽公司虚拟化和OpenStack产品线总经理 Redhesh Balakrishnan说到： 
 
> “我们看到越来越多的企业级用户或服务供应商选择OpenStack作为私有云平台，RHEL OpenStack Platform 5不只是一个基于OpenStack Icehouse产品，我们还开发了很多简单易用的功能，增强了产品的可靠性。
在未来三年内，我们要让用户看到，RHEL OpenStack Platform 5所提供的功能和技术支持服务，将为他们部署的应用保驾护航，让用户对我们的产品充满信心。

我敢跟你打赌，--三年的技术支持服务--将是企业用户在竞争激烈的云平台领域选择红帽的关键点。并且，毋庸置疑，红帽公司把自己的未来放在了云计算，放在了OpenStack Platform上面。

--------------------------------------------------------------------------------

via: http://ostatic.com/blog/red-hat-announces-availability-of-its-openstack-platform-5

译者：[nd0104](https://github.com/nd0104) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.marketwatch.com/story/red-hat-announces-general-availability-of-red-hat-enterprise-linux-openstack-platform-5-2014-07-08
[2]:http://ostatic.com/blog/why-red-hats-openstack-support-must-be-as-inclusive-as-possible
[3]:http://www.openstack.org/blog/2013/11/openstack-user-survey-october-2013/