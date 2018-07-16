在ubuntu中安装Nessus漏洞扫描器
=========================

对Linux机器的漏洞扫描是保护我们的私人数据安全的最重要步骤。在这篇文章中，我将教你如何在ubuntu上安装，配置和启动Nessus。你想了解你的对象易受到什么样的漏洞影响？那么，读这篇文章来了解Nessus吧.

###什么是Nessus?

[Nessus][1] 是一个非常容易部署的漏洞扫描器。已超过千万次的下载数量，并在捆绑解决方案中提供1、2或3年的服务订阅。你想对你的网络执行安全性检查吗? 在大规模的网络安全检查中，Nessus将会是你查找主机和识别漏洞的最好帮手。以下列出Nessus工具的一些功能。一个好消息是，Nessus有两个版本，家庭版和专业版。 家庭版适合个人使用，可以用于非专业的环境。专业版包括了额外的功能，用于商业用途：

- 广义资产评估
- 移动设备审计
- 僵尸网络/恶意进程/反病毒（AV）审计
- 集成了补丁管理
- 敏感内容审计
- 数据采集与监控（SCADA）和控制系统的审计

在安装和配置Nessus之前，你需要下载适合你的操作系统的Nessus。[在这里][2]获取。由于这篇文章是介绍在ubuntu上安装和配置Nessus，那么选择linux分类，并且在linux分类下选择ubuntu。 图1显示了我在网上下载的deb包。你可以右键单击deb文件并点击“在ubuntu软件中心打开”，然后, 在ubuntu软件中心点击安装。安装之后我们需要配置Nessus，然后可以使用了。

![Figure 1](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_032.png "Figure 1")

好了，现在你已经安装了Nessus，下面是运行它。打开一个新的终端，你可以通过键入“**/etc/init.d/nessusd start**”运行Nessus 。由于我用的家庭版，我需要一个它的有效许可证。

通过命令启动Nessus安装，如图2 所示。


![Figure 2](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_026.png "Figure 2")

现在添加一个用户，输入命令，如图3所示.

![Figure 3](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_027.png "Figure 3")

在图3所示的登录提示框中，输入你想要添加的用户名，在你两次正确输入密码之后，此用户名就成为了管理员。完成之后，通过键入“**/etc/init.d/nessusd start**”命令运行Nessus，在浏览器打开**https://127.0.0.1:8834**登录到Nessus。

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_031.png)

漏扫快乐！

[译注：本文只是安装简单的安装过程，具体的使用请期待其它文章]

via http://www.unixmen.com/install-nessus-on-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[Caroline][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[Caroline]:http://linux.cn/space/14763/

[1]:http://www.tenable.com/products/nessus
[2]:http://www.tenable.com/products/nessus/select-your-operating-system
