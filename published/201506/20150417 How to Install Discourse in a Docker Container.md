如何在一个Docker容器里安装Discourse
=============================================================================
大家好，今天我们将会学习如何利用Docker平台安装Discourse。Discourse是一个完全开源的讨论平台，以未来十年的互联网理念设计，拥有一个邮件列表，一个论坛和一个长篇聊天室。不管从技术角度还是社会学角度，如今要体验一个现代的、勃勃生机的、完全开源的互联网讨论平台，Discourse都是一个不错的途径。Discourse是一个简单、简明、简易的讨论方式。它确实是一个令人称赞的平台，对于互联网上各种各样的论坛来说，提供了一个上手可用的很酷的服务。

Docker是一个开源的、可以将任何应用以轻量级容器的方式打包、传输和运行的开放平台。Docker容器技术使得可以更加方便和容易构建Discourse。

所以，下面是一些快速且容易的步骤，用来在一个Docker环境里面安装Discourse。

### 1. 安装Docker ###

首先，我们需要确认我们的主机操作系统已经安装了Docker。我们需要在shell或者终端运行以下命令安装Docker。

#### 在Ubuntu上 ####

docker安装包在Ubuntu的仓库里面是可用的，所以我们将会使用apt管理器安装，以sudo或者root模式

	# apt-get docker

#### 在CentOS 7上 ####

在CentOS 7的主机上，我们使用yum管理器安装docker，因为CentOS的仓库里同样有docker安装包

	# yum install docker

![Installing Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-docker.png)

### 2. 设定交换内存 ###

如果你的RAM容量小于1GB，那么确保升级你的系统达到1GB或者以上，Discourse不能在512MB的RAM下安装。如果你现在准备好了安装Discourse，根据下面的步骤为你的VPS（Virtual Private Servers）或者服务器设定交换内存：

运行下面的命令，创建一个空的交换文件。

	# install -o root -g root -m 0600 /dev/null /swapfile

如果你想你的交换内存达到1GB，那么执行下面的步骤，并且跳过接下来的第二步。

	# dd if=/dev/zero of=/swapfile bs=1k count=1024k

如果你想达到2GB，跳过上一步，跟着下面做

	# dd if=/dev/zero of=/swapfile bs=1k count=2014k

接着，我们指定交换内存为swapfile

	#mkswap /swapfile

运行下面的命令激活交换内存

	#swapon /swapfile

现在，我们将其添加到文件系统分区表里，这样重启之后就自动挂载了。

	# echo "/swapfile swap swap auto 0 0" | sudo tee -a /etc/fstab

设置swappiness参数为10，这样交换内存仅作为一个紧急缓冲区用。

	# sudo sysctl -w vm.swappiness=10
	# echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf

### 3. 安装Discourse ###

在我们的主机上安装好Docker后，我们将会安装Discourse。现在，我们从官方的Discourse GitHub仓库克隆一份到`/var/discourse`目录下。我们需要运行下面的命令完成这一步。

	# mkdir /var/discourse/
	
	# cd /var/discourse/

    # git clone https://github.com/discourse/discourse_docker.git /var/discourse/

克隆好仓库后，我们给discourse服务器复制配置文件

    # cp samples/standalone.yml containers/app.yml

![Cloning Discourse Docker](http://blog.linoxide.com/wp-content/uploads/2015/04/cloning-discourse-docker.png)

### 4. 配置Discourse ###

接下来，我们用自己喜欢的文本编辑器，编辑容器目录下的discourse配置文件app.yml

	# nano containers/app.yml

现在，我们需要将开发者邮箱地址DISCOURSE_DEVELOPER_EMAILS修改为自己的，如下。

	DISCOURSE_DEVELOPER_EMAILS: 'arun@linoxide.com'

然后，我们设置主机名为服务器的域名。

    DISCOURSE_HOSTNAME: 'discourse.linoxide.com'

接着，设置放在相同的discourse主机或vps上的SMTP服务器的认证信息。这些SMTP设置用于你的Discourse发送邮件。

    DISCOURSE_SMTP_ADDRESS: smtp.linoxide.com
    DISCOURSE_SMTP_PORT: 587 # (optional)
    DISCOURSE_SMTP_USER_NAME: admin@linoxide.com # (optional)
    DISCOURSE_SMTP_PASSWORD: test123 # (optional)

![](http://blog.linoxide.com/wp-content/uploads/2015/04/discourse-configuration.png)

如果你在使用一个1GB的Discourse，设定UNICORN_WORKERS为2，db_shared_buffers为128MB，这样你会有更多的内存空间。

运行Discourse需要强制性地创建一个邮件服务器。如果你已经有一个服务器了那就好办多了，我们可以使用它的认证信息。如果你没有现成的邮件服务器，或者你不知道那是什么。没关系，可以在[Mandrill][1] （或[Mailgun][2]和 [Mailjet][3]）创建一个免费的帐号，然后使用其提供的认证信息。

### 5. 启动Discourse应用 ###

配置完discourse的配置文件后，我们当然是想启动Discourse服务器。首先，在/var/discourse/目录下运行下面的命令，加载discourse引导程序。

	# ./launcher bootstrap app

![Starting Discourse Bootstrap](http://blog.linoxide.com/wp-content/uploads/2015/04/starting-discourse-bootstrap.png)

上述命令可能会花去几分钟时间，会自动配置我们的Discourse环境。然后，该进程完成后，我们需要运行下面的命令启动Discourse App

	#./launcher start app

![Starting Discourse](http://blog.linoxide.com/wp-content/uploads/2015/04/starting-discourse.png)

如果一切都正常，我们就能使用惯用的浏览器来访问我们新鲜出炉的 Discourse 的 Web 界面了： http://ip-address/ or http://discourse.linoxide.com/ 。然后，我们就可以创建一个新账号并成为管理员。

![](http://blog.linoxide.com/wp-content/uploads/2015/04/Discourse-web-interface.png)

### 维护 ###

这里往下是/var/discourse/目录里的 launcher 命令的用法，它可以用于我们在Docker 容器里面控制和维护Disourse。

    用法: launcher 命令 配置 [--skip-prereqs]
    命令:
    start: 启动/初始化一个容器
    stop: 停止一个运行的容器
    restart: 重启一个容器
    destroy:停止并删除一个容器
    enter: 使用 nsenter 进入容器
    ssh: 在一个运行的容器中启动一个 bash shell
    logs: 容器的 Docker l日志
    mailtest: 在容器中测试邮件设置
    bootstrap: 基于配置模版来引导一个容器
    rebuild: 重建一个容器（摧毁旧的，初始化，启动新的）
    cleanup: 清理所有停止了24小时以上的容器

    选项:
    --skip-prereqs 不检查前置需求
    --docker-args 当运行 docker 时，展开并传入参数

### 总结 ###

哈哈！我们已经成功使用Docker技术安装了Discourse。Docker技术使得Discourse十分容易安装在任何平台，并且包含所有的要求。我们需要自己的邮件服务器或者邮件服务器的证书来启动它。对于便捷的现代邮件列表，论坛来说，Discourse是一个伟大的平台。（最后这句有些别扭）

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-discourse-docker-container/

作者：[Arun Pyasi][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://mandrillapp.com/
[2]:http://www.mailgun.com/
[3]:https://www.mailjet.com/pricing
