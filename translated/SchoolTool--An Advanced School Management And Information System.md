SchoolTool：先进的学院管理和信息系统
===

[SchoolTool][1]是为全世界学校设计的一个开源的，免费的，基于网页的学生信息系统。它是由[Shuttleworth][2]研发并发布与翻译提供有力支持，定位，自动化部署和更新是通过 **Ubuntu Linux 安装程序** 和 **包管理系统** 。

SchoolTool是在GPL2下许可的并且写在 **Python** 使用 **Zope 3** 框架。  这个项目的主要目标是创建一个简单的turnkey模式（一个“交钥匙”的“工程项目管理模式”）学生管理和信息系统，包括人数统计，学分表，到场人数，日历和为小学和中学的学校报告。

 **功能** 

- 可定制学生和教师的人数统计和其他个人的数据
- 教师，学生和他们的监护人的联系管理
- 教师学分表
- 班级到场人数和每日出勤分数
- 学校，群组，个人和资源预定日历
- 跟踪和管理学生的干预措施

 **安装SchoolTool**  

SchoolTool核心开发团队强烈建议和推荐在Ubuntu 12.04或之后版本安装SchoolTool。后来他们为多个系统创建了软件包，其核心开发团队不支持它们。

SchoolTool是在官方软件仓库中找到的，所以，我们可以用命令来安装它：

	$ sudo apt-get install schooltool

不管怎样，SchoolTool有PPA去获取更新的版本和开发版本。

	$ sudo add-apt-repository ppa:schooltool-owners/ppa

或者

	$ sudo add-apt-repository ppa:schooltool-owners/dev

使用命令更新软件源列表：  

最后用命令安装SchoolTool：  

	$ sudo apt-get install schooltool

 **访问SchoolTool**  

打开你的浏览器在地址栏中输入 **http://localhost:7080** 。如果你想通过远程客户端打开它，编辑文件 **/etc/schooltool/standard/paste.ini** 。

	$ sudo nano /etc/schooltool/standard/paste.ini

设置主机值为0.0.0.0 如下所示。

	host = 0.0.0.0

保存并关闭文件。重启schoolTool服务。

	$ sudo service schooltool restart

现在，你可以从你的浏览器上用URL **http://ip-address:7080** 来访问SchoolTool网页控制台。你将看到一个空白的日历，如下图所示。

![](https://github-camo.global.ssl.fastly.net/93178c08377769dda771392b4705c916502ce586/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30392f596f75722d5363686f6f6c2d2543322542422d546f6461792d4d6f7a696c6c612d46697265666f785f3030312e706e67)

Your School » Today

 **初始化配置**  

 **更改管理员密码**  

SchoolTool默认的管理员账户是“ **manger** ”，密码是“ **schooltool** ”。登陆使用以上认证。

![](https://github-camo.global.ssl.fastly.net/73cb5246b481dc56dddd9442d0f0bbad855abdcb/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30392f5363686f6f6c546f6f6c2d41646d696e6973747261746f722d2543322542422d50617373776f72642d4d6f7a696c6c612d46697265666f785f3030342e706e67)

Log In

在上面定位到 **Home** 按钮。点击 **Password** 下方的 **Setting** 部分。输入两次旧密码和新密码并单击Apply。

![](https://github-camo.global.ssl.fastly.net/73cb5246b481dc56dddd9442d0f0bbad855abdcb/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30392f5363686f6f6c546f6f6c2d41646d696e6973747261746f722d2543322542422d50617373776f72642d4d6f7a696c6c612d46697265666f785f3030342e706e67)

SchoolTool Administrator » Password

 **服务设置**  

登陆管理员账户。在Server部分，你将发现你的SchoolTool服务的细节。

![](https://github-camo.global.ssl.fastly.net/08fad4d7a23d79d23d123f4e3a1ab718298fbe30/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30392f5365727665722d4d6f7a696c6c612d46697265666f785f3030352e706e67)

Server

 **设置外发邮件**  

SchoolTool并不扮演一个像Sendmail或Postfix的邮件服务。它将像邮件客户端一样发送邮件，如Thunderbird, Evolution。

若要在SchoolTool中启用邮件功能，登陆管理账户并转到Server列表。点击 **Outgoing Email** 链接。在那之后，点击黄色铅笔图标去更改邮件设置。填满smtp，Email和password并单击apply。

![](https://github-camo.global.ssl.fastly.net/9e1824737fe4657922dcf41a575edfe7c57d6843/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30392f5365727665722d2543322542422d4f7574676f696e672d456d61696c2d53657474696e67732d4d6f7a696c6c612d46697265666f785f3030382e706e67)

Server » Outgoing Email Settings

 **设置日历**  

重要的是按照你的区域位置设置日历。点击Server部分的 **Calendar** 列表。选择你的时区，对我来说，是 **Asia/Kolkatta** 。

![](https://github-camo.global.ssl.fastly.net/dfbb5c8fe482677c189c3eb507e9a31ac5ae6a4f/687474703a2f2f3138303031363938382e722e63646e37372e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30392f5365727665722d2543322542422d43616c656e6461722d53657474696e67732d4d6f7a696c6c612d46697265666f785f3030392e706e67)

Server » Calendar Settings

转到其他链接，如Errors，Tabs和Pack Database。管理操作系统是不言而喻的。按照你的需求阅读和改变设置。

 **设置学校**  

在这里我们想起简短和最大一部分需要更多的时间并把事情做好。在这一篇文章中我们不能覆盖所有。所以，我推荐你去访问SchoolTool官方[文档][3]，经过一个接一个的部分设置你的相应的学校。它需要几个小时或几天的时间来设置整个学校的设置。别害怕，它不是个困难的任务：SchoolTool团队在其网站有一个准备充分的自我帮助文档和截图。你不必去其他任何地方学习SchoolTool。通过SchoolTool文档页学习并DIY。

 **参考文献：**  

- [SchoolTool 网站][4]
- [维基百科][5]

via： <http://www.unixmen.com/schooltool-advanced-school-management-information-system/>

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://schooltool.org/
[2]:http://www.shuttleworthfoundation.org/
[3]:http://book.schooltool.org/setup-toc.html
[4]:http://www.schooltool.org/
[5]:http://en.wikipedia.org/wiki/SchoolTool