如何在 Ubuntu Linux 16.04上安装开源的Discourse论坛
===============================================================================

Discourse 是一个开源的论坛, 它可以以邮件列表, 聊天室或者论坛等多种形式工作. 它是一个广受欢迎的现代的论坛工具. 在服务端,它使用Ruby on Rails 和  Postgres 搭建,  并且使用Redis caching 减少读取时间 , 在客户端, 它用浏览器的Java Script运行. 它是一个非常好的定制和构架工具. 并且它提供了转换插件对你现存的论坛进行转换例如:  vBulletin, phpBB, Drupal, SMF 等等. 在这篇文章中, 我们将学习在Ubuntu操作系统下安装 Discourse.

它是基于安全开发的, 黑客们不能轻易的发现漏洞. 它能很好的支持各个平台, 相应的调整手机和平板的显示设置.

### Installing Discourse on Ubuntu 16.04

让我们开始吧 ! 最少需要1G的内存并且你要保证dockers已经安装了. 说到dockers, 它还需要安装Git. 要达到以上的两点要求我们只需要运行下面的命令.

```
wget -qO- https://get.docker.com/ | sh
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/124.png)

用不了多久就安装好了Docker 和 Git, 安装结束以后, 创建一个 Discourse 文件夹在 /var 分区 (当然你也可以选择其他的分区).

```
mkdir /var/discourse 
```

现在我们来克隆 Discourse’s Github  项目到这个新建的文件夹.

```
git clone https://github.com/discourse/discourse_docker.git /var/discourse
```

进入克隆文件夹.

```
cd /var/discourse
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/314.png)

你将 看到“discourse-setup” 脚本文件, 运行这个脚本文件进行Discourse的初始化.

```
./discourse-setup
```

**Side note: 在安装discourse之前请确保你已经安装了邮件服务器.**

安装向导将会问你以下六个问题.

```
Hostname for your Discourse?
Email address for admin account? 
SMTP server address? 
SMTP user name? 
SMTP port [587]:
SMTP password? []:
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/411.png)

当你提交了以上信息以后, 它会让你提交确认, 恩一切都很正常, 点击回车以后安装开始.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/511.png)

现在坐下来，倒杯茶，看看有什么错误信息没有.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/610.png)

安装成功以后看起来应该像这样.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/710.png)

现在打开浏览器, 如果已经做了域名解析, 你可以使用你的域名来连接Discourse页面 , 否则你只能使用IP地址了. 你讲看到如下信息:

![](http://linuxpitstop.com/wp-content/uploads/2016/06/85.png)

就是这个, 用 “Sign Up” 选项创建一个新管理账户.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/106.png)

### 结论

它是安装简便安全易用的. 它拥有当前所有论坛功能. 它支持所有的开源产品. 简单, 易用, 各类实用的功能. 希望你喜欢这篇文章你可以给我们留言.

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/install-discourse-on-ubuntu-linux-16-04/

作者：[Aun][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://linuxpitstop.com/author/aun/








