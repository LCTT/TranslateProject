
几款开源或商业的数据中心管理软件
============================================================


当一个公司发展壮大时，相应地对计算资源的需求也会与日俱增。无论是普通公司还是服务提供商，包括那些出租服务器的公司，当服务器数量过多时都不得不面对很多问题。


如何盘存服务器和备件，如何维护使数据中心保持健康运作，及时定位和修复潜在的威胁。如何快速找到宕机设备的机架位置，如何准备机器上线工作，要做完这些事情需要花费大量的时间，并且IT部门还需要一大帮管理员支持才能办到。

现在有一个更好地解决这些问题的方案，使用特制软件来自动化管理机房，下文将介绍当前市场上已有的一些数据中心管理工具。

### 1\. Opendcim

这是该类目前唯一的免费软件，该软件开源并且被设计用于替代商业化的数据中心基础管理解决方案。该软件可以管理库存、生成数据中心的地图和监控机房温度与电力消耗。


可惜不支持远程关机，服务器重启，自动化安装操作系统等功能。尽管如此，它仍然被全球很多非商业机构使用。


多亏了该软件开源，有研发能力的公司可以修改使[Opendcims][2]更适合自己的公司。


[
 ![openDCIM](http://www.tecmint.com/wp-content/uploads/2016/12/openDCIM.png) 
][3]

openDCIM

### 2\. NOC-PS

这是一款可以管理物理和虚拟设备的软件。有很多可以用于初始化设备的工具,比如：操作系统和软件安装、网络配置、并且集成了WHMCS和Blesta。美中不足的是如果你希望能够看到数据中心设备地图或者机架位置，那该软件就不是你的最佳选择了。


[NOC-PS][4]每100台服务器每年管理费需要100€，比较适合中小企业使用。


[
 ![NOC-PS](http://www.tecmint.com/wp-content/uploads/2016/12/NOC-PS.png) 
][5]

NOC-PS

### 3\. DCImanager

[DCImanager][6] 是一个专用的解决方案，正如所说的，考虑到DC工程师和托管服务提供商的需求，该软件集成了很多有名的软件，比如WHMCS、Hostbill、BILLmanager等。


该软件的主要功能有：服务器配置、模板化安装操作系统、传感器监控、交易和电力消耗报告、VLAN管理。除此之外，企业版还可以生成数据中心服务器地图、以及对服务器和备件进行盘点管理。


你可以试用免费版，但是免费版最多支持5台物理服务器管理，而收费版每100台服务器每年的授权使用费是120€。


收费版适用中小企业或者大企业。


[
 ![DCImanager](http://www.tecmint.com/wp-content/uploads/2016/12/DCImanager.png) 
][8]

DCImanager

### 4\. EasyDCIM
[EasyDCIM][9] 是一款主要面向服务提供商的收费软件。拥有可以安装操作或其他软件的特点，并且能方便地生成机房目录及机架分布图。


但是该软件并不支持通过开关对IP和DNS进行管理。不过可以通过安装模块的方式获得这些功能，这些模块可能付费或者免费（包括WHMCS集成模块）。


该软件每100台服务器每年的服务费起步价$999。对于小公司来说这个价格有点贵，不过中型或者大型企业可以尝试使用。


[
 ![EasyDCIM](http://www.tecmint.com/wp-content/uploads/2016/12/EasyDCIM.png) 
][10]

EasyDCIM

### 5\. Ansible Tower
[Ansible Tower][11]是红帽出品的企业级计算中心管理软件。该解决方案的核心思想是实现对服务器和不同用户设备的集中式部署。


感谢Ansible Tower能够通过集成软件的方式使用几乎所有的工具程序并且该软件的数据统计收集模块特别好用。但不好的一面则是我们不能集成当前比较流行的软件，而且价格也不便宜。


每100台设备每年的服务器费是$5000,这个价格估计只有大公司才能接受。


[
 ![Ansible Tower](http://www.tecmint.com/wp-content/uploads/2016/12/Ansible_Tower.png) 
][12]

Ansible Tower

### 6\. Puppet Enterprise

在商业基础上发展而来并作为IT部门的辅助软件。该软件被设计用于对服务器或者用户设备安装操作系统及其他软件，无论是初步部署或者进一步开发都适用。


不幸的是，盘存和其他更好的交互方案(电缆连接、协议等)仍然处于开发中。


[Puppet Enterprise][13]对于小于10台服务器的管理免费并且开放全部功能。而收费版则是每台服务器每年$120.


这个价格适合大公司使用.


[
 ![Puppet Enterprise](http://www.tecmint.com/wp-content/uploads/2016/12/Puppet-Enterprise.png) 
][14]

Puppet Enterprise

### 7\. Device 42

该软件设计用于数据中心监控。有一个很棒的盘存工具，自动创建软硬件依赖关系图。通过[Device 42][15]生成数据中心地图，并可以通过图表方式反映温度、空闲空间情况和通过给不同支架标特定颜色反映不同指标。但是不支持软件安装和那些有名管理软件的集成。


每100台服务器每年的收费是$1499，这个价位比较适合大中型企业。


[
 ![Device42](http://www.tecmint.com/wp-content/uploads/2016/12/Device42.png) 
][16]

Device42

### 8\. CenterOS

这是一款适合数据中心管理的操作系统，主要功能是设备盘点。除此之外可以生成数据中心地图及机架方案并连接了一个评价不错的服务器状态监控系统方便内部技术管理工作。


该软件还有一个特性就是能够通过简单的几次点击就可以找到某个设备对应的人（可能是设备所有人、技术管理员或者该设备的制造商），当出现紧急问题时这个就特别有用了。



**更多建议请阅读:** [8 Open Source/Commercial Billing Platforms for Hosting Providers][17]

该软件不是开源的，并且价格也只能在要求厂商合作后才能知道。


该软件价格的神秘性也决定了软件的购买者比较特殊，极有可能这个软件是给大公司用的。


[
 ![CenterOS](http://www.tecmint.com/wp-content/uploads/2016/12/CenterOS.png) 
][19]

CenterOS

### 9\. LinMin

这个一款用于初始化物理设备以便后期使用的软件，包括了PXE安装操作系统以及随后一系列必要的软件安装。


不像其他的日志分析软件，[LinMin][20]有一个比较好用的硬盘备份系统，可以迅速在系统崩溃后恢复以及在相同配置的服务器上进行大规模部署。


该软件每100台服务器一年的收费是$1999，这价格也只有大中型企业能用了。


[
 ![LinMin](http://www.tecmint.com/wp-content/uploads/2016/12/LinMin.jpg) 
][21]

LinMin

现在来总结下，当前大部分软件都能够自动化管理大量的基础设施。对于今天市场上有的软件功能可以分为两个方面。


首先这些软件大部分都能用于完成设备的准备工作，以便能够进一步管理，其次就是设备的盘点管理。找到一个通用的包含所有功能的软件并不容易，你在选择的时候可以放弃一些设备提供商提供的那些功能比较有限的工具。


现在你知道了这些解决方案，那么你可以逐个尝试下。值得注意的是这里的开源产品，如果你开发能力比较强，那么可以尝试定制满足你需求的软件。


希望通过这篇回顾能够帮你找到适合的软件让你的工作更轻松。另，祝您的服务器永不出错。



-----------------------------------

作者简介：

![](http://1.gravatar.com/avatar/ae5edcc20865ae20859fb566c796b97a?s=128&d=blank&r=g)

我是一名位于俄罗斯西伯利亚软件公司的技术专家。我希望能够在新的Linux软件工具和托管行业的发展趋势、可能性、发展历史和发展机遇等方面分享我的知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/data-center-server-management-tools/

作者：[ Nikita Nesmiyanov][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/nesmiyanov/
[1]:http://www.tecmint.com/web-control-panels-to-manage-linux-servers/
[2]:http://opendcim.org/
[3]:http://www.tecmint.com/wp-content/uploads/2016/12/openDCIM.png
[4]:http://noc-ps.com/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/NOC-PS.png
[6]:https://www.ispsystem.com/software/dcimanager
[7]:http://www.tecmint.com/opensource-commercial-control-panels-manage-virtual-machines/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/DCImanager.png
[9]:https://www.easydcim.com/
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/EasyDCIM.png
[11]:https://www.ansible.com/
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Ansible_Tower.png
[13]:https://puppet.com/
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Puppet-Enterprise.png
[15]:http://www.device42.com/
[16]:http://www.tecmint.com/wp-content/uploads/2016/12/Device42.png
[17]:http://www.tecmint.com/open-source-commercial-billing-software-system-web-hosting/
[18]:http://www.centeros.com/
[19]:http://www.tecmint.com/wp-content/uploads/2016/12/CenterOS.png
[20]:http://www.linmin.com/
[21]:http://www.tecmint.com/wp-content/uploads/2016/12/LinMin.jpg
