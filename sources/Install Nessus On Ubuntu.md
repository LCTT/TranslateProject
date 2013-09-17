在ubuntu中安装Nessus漏洞扫描器
========================

Linux机器的扫描和识别漏洞是保护和确保我们私人数据安全的最重要步骤。在这篇文章中，我将教你如何在ubuntu上安装，配置和启动Nessus。你想了解你的对象易受什么样的漏洞影响？那么，读这篇文章并学习Nessus.

###什么是Nessus?

[Nessus][1] 是一个非常容易配置的漏洞扫描器. 有超过千万次的下载并提供1、2或3年的订阅, 以及捆绑解决方案. 你想对你的网络执行安全性检查吗? 随着规模最大的集成网络安全检查,Nessus将会在你网络hosts识别和漏洞识别中给你最好的帮助. 以下列出Nessus工具的一些特征. Nessus有两个版本, 家庭版和专业版，这非常好. 家庭版适合个人使用并且它在非专业环境工作. 专业版包括额外的功能并且它是用于商业用途.

- 广泛的资产覆盖面剖析
- 移动设备审计
- 僵尸网络/恶意进程/反病毒（AV）审计
- 补丁管理集成
- 敏感内容审计
- 数据采集与监控（SCADA）/控制系统审计

在安装和配置Nessus之前,你必须下载针对你操作系统的Nessus. [在这里][2]获取. 由于这篇文章是关于在ubuntu上安装和配置Nessus, 我将选择linux作为我的操作系统并且在linux下我将选择ubuntu. 图1显示了我在网上下载的deb包. 你可以右击deb文件并点击“在ubuntu软件中心打开”. 然后, 在ubuntu软件中心点击安装. 安装之后我们需要配置Nessus那么我们就可以使用它了.

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_032.png "Figure 1")

好了,现在你已经安装了Nessus, 下面是启动时间.打开一个新的终端.你仍可以通过键入“**/etc/init.d/nessusd start**”运行Nessus . 由于我用的家庭版, 我需要它的有效许可证.
通过命令启动Nessus安装,如图2 所示.


![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_026.png "Figure 2")

现在,添加一个用户,输入命令,如图3所示.


![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_027.png "Figure 3")

在图3所示的登录提示框中，输入你想要添加的用户名，在你两次正确输入密码进入之后，此用户名就成为了管理员。一旦完成, 通过键入“**/etc/init.d/nessusd start**”命令运行Nessus, 在**https://127.0.0.1:8834**登录到Nessus.

![img](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Selection_031.png)

祝您使用Nessus快乐!

via http://www.unixmen.com/install-nessus-on-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[Caroline][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[Caroline]:http://linux.cn/space/14763/

[1]:http://www.tenable.com/products/nessus
[2]:http://www.tenable.com/products/nessus/select-your-operating-system
