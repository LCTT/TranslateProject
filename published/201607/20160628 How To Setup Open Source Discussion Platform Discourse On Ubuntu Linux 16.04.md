如何在 Ubuntu Linux 16.04上安装开源的 Discourse 论坛
===============================================================================

Discourse 是一个开源的论坛，它可以以邮件列表、聊天室或者论坛等多种形式工作。它是一个广受欢迎的现代的论坛工具。在服务端，它使用 Ruby on Rails 和  Postgres 搭建,  并且使用 Redis 缓存来减少读取时间 , 在客户端，它使用支持 Java Script 的浏览器。它非常容易定制，结构良好，并且它提供了转换插件，可以对你现存的论坛、公告板进行转换，例如：  vBulletin、phpBB、Drupal、SMF 等等。在这篇文章中，我们将学习在 Ubuntu 操作系统下安装 Discourse。

它以安全作为设计思想，所以发垃圾信息的人和黑客们不能轻易的实现其企图。它能很好的支持各种现代设备，并可以相应的调整以手机和平板的显示。

### 在 Ubuntu 16.04 上安装 Discourse

让我们开始吧 ! 最少需要 1G 的内存，并且官方支持的安装过程需要已经安装了  docker。 说到 docker，它还需要安装Git。要满足以上的两点要求我们只需要运行下面的命令：

```
wget -qO- https://get.docker.com/ | sh
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/124.png)

用不了多久就安装好了 docker 和 Git，安装结束以后，在你的系统上的 /var 分区创建一个 Discourse 文件夹（当然你也可以选择其他的分区）。

```
mkdir /var/discourse 
```

现在我们来克隆 Discourse 的 Github  仓库到这个新建的文件夹。

```
git clone https://github.com/discourse/discourse_docker.git /var/discourse
```

进入这个克隆的文件夹。

```
cd /var/discourse
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/314.png)

你将看到“discourse-setup” 脚本文件，运行这个脚本文件进行 Discourse 的初始化。

```
./discourse-setup
```

**备注： 在安装 discourse 之前请确保你已经安装好了邮件服务器。**

安装向导将会问你以下六个问题：

```
Hostname for your Discourse?
Email address for admin account? 
SMTP server address? 
SMTP user name? 
SMTP port [587]:
SMTP password? []:
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/411.png)

当你提交了以上信息以后, 它会让你提交确认, 如果一切都很正常，点击回车以后安装开始。

![](http://linuxpitstop.com/wp-content/uploads/2016/06/511.png)

现在“坐等放宽”，需要花费一些时间来完成安装，倒杯咖啡，看看有什么错误信息没有。

![](http://linuxpitstop.com/wp-content/uploads/2016/06/610.png)

安装成功以后看起来应该像这样。

![](http://linuxpitstop.com/wp-content/uploads/2016/06/710.png)

现在打开浏览器，如果已经做了域名解析，你可以使用你的域名来连接 Discourse 页面 ，否则你只能使用IP地址了。你将看到如下信息：

![](http://linuxpitstop.com/wp-content/uploads/2016/06/85.png)

就是这个，点击 “Sign Up” 选项创建一个新的账户，然后进行你的 Discourse 设置。

![](http://linuxpitstop.com/wp-content/uploads/2016/06/106.png)

### 结论

它安装简便，运行完美。 它拥有现代论坛所有必备功能。它以 GPL 发布，是完全开源的产品。简单、易用、以及特性丰富是它的最大特点。希望你喜欢这篇文章，如果有问题，你可以给我们留言。

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/install-discourse-on-ubuntu-linux-16-04/

作者：[Aun][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://linuxpitstop.com/author/aun/








