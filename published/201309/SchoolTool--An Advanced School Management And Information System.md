SchoolTool：先进的学院管理和信息系统
===

[SchoolTool][1]是一个基于网页的开源免费学生信息系统，为世界各地的学校而设计。它是由[Shuttleworth][2]研发并发布，基于翻译、定位和自动化部署的有力支持，通过 **Ubuntu Linux 安装程序** 和 **包管理系统** 更新。

SchoolTool是经GPL2许可，使用 **Zope 3** 框架并用 **Python** 语言编写。这个项目的主要目标是创建一个简单的turnkey模式（译者注：一个“交钥匙”的“工程项目管理模式”）学生管理和信息系统，包括中小学人数统计、学分表、出勤、日历和报告。

###功能

- 可定制学生和教师的人数统计和其他个人的数据
- 为教师，学生和监护人提供联人管理
- 教师学分表
- 全校评估数据收集和报告卡
- 班级到场人数和每日出勤分数
- 学校，群组，个人和资源预定日历
- 跟踪和管理学生的干预措施

###安装SchoolTool

SchoolTool核心开发团队强烈建议和推荐在Ubuntu 12.04或之后版本安装SchoolTool。他们为多个系统创建了软件包，但其核心开发团队不支持它们。

SchoolTool是在官方软件仓库中找到的，所以，我们可以用命令来安装它：

	$ sudo apt-get install schooltool

另外，可以用PPA来获取更新版本和开发版本。

	$ sudo add-apt-repository ppa:schooltool-owners/ppa

或者

	$ sudo add-apt-repository ppa:schooltool-owners/dev

使用命令更新软件源列表并最后用命令安装SchoolTool：  

	$ sudo apt-get install schooltool

###访问SchoolTool

打开你的浏览器在地址栏中输入 **http://localhost:7080** 。

如果你想通过远程客户端打开它，编辑文件 **/etc/schooltool/standard/paste.ini** 。

	$ sudo nano /etc/schooltool/standard/paste.ini

设置主机值为0.0.0.0 如下所示。

	host = 0.0.0.0

保存并关闭文件。重启schoolTool服务。

	$ sudo service schooltool restart 

现在，你可以从你的浏览器上用URL **http://ip-address:7080** 来访问SchoolTool网页控制台。你将看到一个空白的日历，如下图所示。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Your-School-%C2%BB-Today-Mozilla-Firefox_001-1024x620.png)

###初始化配置，更改管理员密码

SchoolTool默认的管理员账户是“ **manger** ”，密码是“ **schooltool** ”。登录使用以上认证。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Log-In-Mozilla-Firefox_002-1024x620.png)

在上面定位到 **Home** 按钮。点击 **Password** 下方的 **Setting** 部分。输入两次旧密码和新密码并单击Apply。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/SchoolTool-Administrator-%C2%BB-Password-Mozilla-Firefox_004-1024x620.png)

###服务设置

登录管理员账户。在Server部分，你将发现你的SchoolTool服务器的细节。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Server-Mozilla-Firefox_005-1024x620.png)


###设置外发邮件

SchoolTool并不像Sendmail或Postfix扮演着邮件服务器的工作。它将像邮件客户端一样发送邮件，如Thunderbird, Evolution。

若要在SchoolTool中启用邮件功能，登录管理账户并转到Server列表。点击 **Outgoing Email** 链接。在那之后，点击黄色铅笔图标去更改邮件设置。填充smtp，Email和password并单击apply。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Server-%C2%BB-Outgoing-Email-Settings-Mozilla-Firefox_008-1024x620.png)


###设置日历

按照你的区域位置设置日历很重要。点击Server部分的 **Calendar** 列表。选择你的时区，我的设置是 **Asia/Kolkatta** 。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Server-%C2%BB-Calendar-Settings-Mozilla-Firefox_009-1024x620.png)


转到其他链接，如Errors，Tabs和Pack Database。管理操作系统是不言而喻的。按照你的需求阅读和改变设置。

###设置学校

现在我们来介绍简明又重要的部分，它需要我们花费更多的时间和精力来完成。本文并不能覆含所有内容，所以我推荐你去访问SchoolTool官方[文档][3]，一个接一个仔细浏览每一部分，按照要求设置你的学校。完成整个学校的设置需要花费可能会花费几个小时甚至几天的时间。别害怕，它并不困难：SchoolTool团队在其网站为用户充分准备了自我帮助的文档和截图。你不必去其他任何地方学习SchoolTool，通过SchoolTool文档页就能学习并DIY。

###参考文献：

- [SchoolTool 网站][4]
- [维基百科][5]

---

via： <http://www.unixmen.com/schooltool-advanced-school-management-information-system/>

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[Caroline]:http://linux.cn/space/14763

[1]:http://schooltool.org/
[2]:http://www.shuttleworthfoundation.org/
[3]:http://book.schooltool.org/setup-toc.html
[4]:http://www.schooltool.org/
[5]:http://en.wikipedia.org/wiki/SchoolTool 
