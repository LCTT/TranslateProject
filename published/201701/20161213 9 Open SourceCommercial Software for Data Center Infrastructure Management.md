九款开源或商业的数据中心基础设施管理软件
============================================================

当一个公司发展壮大时，相应地对计算资源的需求也会与日俱增。无论是普通公司还是服务提供商，包括那些出租服务器的公司，当服务器数量过多时都不得不面对很多问题。

如何盘存服务器和备件？如何维护使数据中心保持健康运作，及时定位并修复潜在的威胁？如何快速找到宕机设备的机架位置？如何准备物理机上线工作？做完这些事情需要花费大量的时间，或者需要 IT 部门有一大帮管理员支持才能办到。

现在有一个更好的方案解决这些问题，使用特定软件来实现数据中心管理自动化，下文将介绍当前市场上已有的一些数据中心管理工具。

### 1、 Opendcim

这是该类目前唯一的自由软件，该软件开源并且按照商业化<ruby>数据中心基础设施管理<rt>Data Center Infrastructure Management</rt></ruby>（DCIM）解决方案的替代方案来设计。该软件可以管理库存、生成数据中心的地图和监控机房温度与电力消耗。

不过，它不支持远程关机、服务器重启、操作系统安装等功能。尽管如此，它仍然被全球很多非商业机构使用。

由于该软件开源，有研发能力的公司可以修改它，使 [opendcim][2] 更适合自己的公司。

[
 ![openDCIM](http://www.tecmint.com/wp-content/uploads/2016/12/openDCIM.png) 
][3]

*openDCIM*

### 2、 NOC-PS

这是一款可以管理物理和虚拟设备的商业软件。它有很多可以用于初始化设备的工具，比如：操作系统和其他软件安装、网络配置，并且集成了 WHMCS 和 Blesta。美中不足的是，如果你希望能够看到数据中心设备地图或者机架位置，那该软件就不是你的最佳选择了。

[NOC-PS][4] 每 100 台服务器每年管理费需要 100€，比较适合中小企业使用。

[
 ![NOC-PS](http://www.tecmint.com/wp-content/uploads/2016/12/NOC-PS.png) 
][5]

*NOC-PS*

### 3、 DCImanager

[DCImanager][6] 是一个专用的解决方案，正如宣传所说的，考虑了 DC 工程师和托管服务提供商的需求。该软件集成了很多有名的计费软件，比如 WHMCS、Hostbill、BILLmanager 等。

该软件的主要功能有：服务器配置、模板化安装操作系统、传感器监控、流量和电力消耗报告、VLAN 管理。除此之外，企业版还可以生成数据中心服务器地图、以及对服务器和备件进行盘点管理。

你可以试用免费版，但是免费版最多支持 5 台物理服务器管理，而收费版每 100 台服务器每年的授权使用费是 120€。

根据版本不同，收费版可适用中小企业或者大企业。

[
 ![DCImanager](http://www.tecmint.com/wp-content/uploads/2016/12/DCImanager.png) 
][8]

*DCImanager*

### 4、 EasyDCIM

[EasyDCIM][9] 是一款主要面向服务提供商的收费软件。拥有可以安装操作系统或其他软件的特点，并且能方便地生成机房目录及机架分布图。

该软件本身并不支持对 IP 和 DNS 进行管理。不过可以通过安装模块的方式获得这些功能，这些模块可能付费或者免费（包括 WHMCS 集成模块）。

该软件每 100 台服务器每年的服务费起步价 $999。对于小公司来说这个价格有点贵，不过中型或者大型企业可以尝试使用。

[
 ![EasyDCIM](http://www.tecmint.com/wp-content/uploads/2016/12/EasyDCIM.png) 
][10]

*EasyDCIM*

### 5、 Ansible Tower

[Ansible Tower][11] 是红帽出品的企业级计算中心管理软件。该解决方案的核心思想是实现对服务器和不同用户设备的集中式部署。

由于 **Ansible Tower** 能够通过集成软件的方式使用几乎所有的工具程序，并且该软件的数据统计收集模块特别好用。不好的一面则是缺乏和当前比较流行的计费软件的集成，而且价格也不便宜。

每 100 台设备每年的服务器费是 $5000,这个价格估计只有大公司才能接受。

[
 ![Ansible Tower](http://www.tecmint.com/wp-content/uploads/2016/12/Ansible_Tower.png) 
][12]

*Ansible Tower*

### 6、 Puppet Enterprise

在商业基础上发展而来并作为 IT 部门的辅助软件。该软件用于在服务器或者用户设备上安装操作系统及其他软件，无论是初步部署或者进一步开发都适用。

不幸的是，盘存和其他更好的交互方案(电缆连接、协议等)仍然处于开发中。

[Puppet Enterprise][13] 对于小于 10 台服务器的管理免费并且开放全部功能。而收费版则是每台服务器每年 $120。

这个价格适合大公司使用。

[
 ![Puppet Enterprise](http://www.tecmint.com/wp-content/uploads/2016/12/Puppet-Enterprise.png) 
][14]

*Puppet Enterprise*

### 7、 Device 42

该软件主要用于数据中心监控。有一个很棒的盘存工具，自动创建软硬件依赖关系图。通过 [Device 42][15] 生成数据中心地图，给不同机架标特定颜色，并可以通过图表方式反映温度、空闲空间情况和机架的其他指标。但是不支持软件安装和计费软件的集成。

每 100 台服务器每年的收费是 $1499，这个价位比较适合大中型企业。

[
 ![Device42](http://www.tecmint.com/wp-content/uploads/2016/12/Device42.png) 
][16]

*Device42*

### 8、 CenterOS

这是一款适合数据中心管理的操作系统，主要功能是设备盘点。除此之外可以生成数据中心地图及机架方案，并连接了一个评价不错的服务器状态监控系统，方便内部技术管理工作。

该软件还有一个特性就是能够通过简单的几次点击就可以找到某个设备对应的人（可能是设备所有人、技术管理员或者该设备的制造商），当出现紧急问题时这个就特别有用了。

**建议阅读:** [8 Open Source/Commercial Billing Platforms for Hosting Providers][17]

该软件不是开源的，并且价格也只能在咨询后才能知道。

该软件价格的神秘性也决定了软件的目标客户，极有可能这个软件是给大公司用的。

[
 ![CenterOS](http://www.tecmint.com/wp-content/uploads/2016/12/CenterOS.png) 
][19]

*CenterOS*

### 9、 LinMin

这是一款用于初始化物理设备以便后期使用的软件。使用 PXE 安装选定的操作系统，并可随后部署一系列必要的软件安装。

与同类软件不同的是，[LinMin][20] 有一个开发完善的硬盘备份系统，可以迅速在系统崩溃后恢复以及大规模部署相同配置的服务器。

该软件每 100 台服务器一年的收费是 $1999，这价格也只有大中型企业能用了。

[
 ![LinMin](http://www.tecmint.com/wp-content/uploads/2016/12/LinMin.jpg) 
][21]

*LinMin*

现在来总结下，当前市场上大部分能够自动化管理大量的基础设施的软件，可以分为两类。

第一类，主要用于完成设备的准备工作，以便能够进一步管理。另一类就是设备的盘点管理。找到一个通用的包含所有功能的软件并不容易，你在选择的时候可以放弃一些设备提供商提供的那些功能比较有限的工具。

现在你知道了这些解决方案，那么你可以逐个尝试下。值得注意的是这里列出的开源产品，如果你有好的开发人员，那么可以尝试定制软件来满足你需求。

希望通过这篇回顾能够帮你找到适合的软件让你的工作更轻松。另，祝您的服务器永不出错。


-----------------------------------

作者简介：

![](http://1.gravatar.com/avatar/ae5edcc20865ae20859fb566c796b97a?s=128&d=blank&r=g)

Nikita Nesmiyanov

我是一名俄罗斯西伯利亚托管软件开发公司的技术专家。我希望能够在新的 Linux 软件工具和托管行业的发展趋势、可能性、发展历史和发展机遇等方面拓展我的知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/data-center-server-management-tools/

作者：[Nikita Nesmiyanov][a]
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
