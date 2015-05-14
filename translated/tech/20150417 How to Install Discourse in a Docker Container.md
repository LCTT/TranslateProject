如何在一个Docker容器里安装Discourse
=============================================================================
大家好，今天我们将会学习如何利用Docker平台安装Discourse。Discourse是完全开源的讨论平台，为互联网的下一个十年而搭建，拥有一个邮件列表，一个论坛和一个long-form(此处不明白）聊天室。不管从技术角度还是社会学角度，当你试图去重新想象当今一个现代的，可持续的，完全开源的互联网讨论平台该是什么样子，Discourse都是一个不错的途径。Discourse简洁，直接之于讨论。它确实是一个令人称赞的平台，对于互联网上各种各样的讨论来说，提供了在机器之外如此酷的一个服务。Docker是一个开源平台，提供打包，运输和运行任何应用的平台，如一个轻量级容器。Docker容器技术使得Discourse更加方便和容易去建立应用程序。

所以，下面是一些快速且容易的步骤，用来安装Discourse在一个Docker环境里面。

### 1. 安装Docker ###

首先，我们需要确认我们的主机操作系统已经安装了Docker。我们需要在shell或者终端运行以下命令安装Docker。

#### 在Ubuntu上 ####

docker安装包在Ubuntu的仓库里面是可用的，所以我们将会使用apt管理器安装，以sudo或者root模式

	# apt-get docker

#### 在CentOS 7上 ####

在CentOS 7的主机上，我们使用yum管理器安装docker,因为CentOS的仓库里同样有docker安装包

	# yum install docker

![Installing Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-docker.png)

### 2. 设定交换内存 ###

如果你的RAM容量小于1GB，那么确保升级你的系统达到1GB或者以上，否则Discourse不会在512MB的RAM下安装。如果你现在准备好了安装Discourse，根据下面的步骤为你的VPS（Virtual Private Servers）或者服务器设定交换内存

运行下面的命令，创建一个空的交换文件。

	# install -o root -g root -m 0600 /dev/null /swapfile

如果你想你的交换内存达到1GB，那么执行下面的步骤，并且跳过接下来的第二步。

	# dd if=/dev/zero of=/swapfile bs=1k count=1024k

如果你想达到2GB，跳过上面的所有步骤，跟着下面做

	# dd if=/dev/zero of=/swapfile bs=1k count=2014k

接着，我们指定交换内存为swapfile

	#mkswap /swapfile

运行下面的命令激活交换内存

	#swapon /swapfile

现在，我们将其添加到文件系统分区表里，这样重启之后就自动挂载了。

	# echo "/swapfile swap swap auto 0 0" | sudo tee -a /etc/fstab

设置swappiness为10，这样交换内存仅作为一个紧急缓冲区用。

	# sudo sysctl -w vm.swappiness=10
	# echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf

### 3. 安装Discourse ###

在我们的主机上安装Docker后，我们将会安装Discourse。现在，我们从官方的Discourse GitHub仓库克隆一份到/var/discourse目录下。我们需要运行下面的命令完成这一步。

	# mkdir /var/discourse/
	
	# cd /var/discourse/

    # git clone https://github.com/discourse/discourse_docker.git /var/discourse/

克隆好仓库后，我们会为discourse服务器复制配置文件

    # cp samples/standalone.yml containers/app.yml

![Cloning Discourse Docker](http://blog.linoxide.com/wp-content/uploads/2015/04/cloning-discourse-docker.png)

### 4. 配置Discourse ###

接下来，我们用自己喜欢的文本编辑器，编辑容器目录下的discourse配置文件app.yml

	# nano containers/app.yml

现在，我们需要设置开发者的邮箱地址为DISCOURSE_DEVELOPER_EMAILS，如下。

	DISCOURSE_DEVELOPER_EMAILS: 'arun@linoxide.com'

然后，我们会设置主机名为服务器的域名。

    DISCOURSE_HOSTNAME: 'discourse.linoxide.com'

接着，为每个托管在相同discourse主机或者vps上的SMTP服务器设定邮箱证书。SMTP设置需要从你的Discourse发送邮件

    DISCOURSE_SMTP_ADDRESS: smtp.linoxide.com
    DISCOURSE_SMTP_PORT: 587 # (optional)
    DISCOURSE_SMTP_USER_NAME: admin@linoxide.com # (optional)
    DISCOURSE_SMTP_PASSWORD: test123 # (optional)

![](http://blog.linoxide.com/wp-content/uploads/2015/04/discourse-configuration.png)

	Discourse 配置

如果你在使用一个1GB的Discourse，设定UNICORN_WORKERS为2，db_shared_buffers为128MB，这样你会有更多的内存空间。

运行Discourse需要强制性地创建一个邮件服务器。如果你已经有一个服务器了那就好办多了，我们可以使用它的证书。如果你没有现成的邮件服务器，或者你不知道那是什么。没关系，创建一个免费的帐号在[Mandrill][1] ([Mailgun][2],或者[Mailjet][3]),然后使用面板上提供的证书。

### 5. 启动Discourse应用 ###

配置完discourse的配置文件后，我们当然是想启动Discourse服务器。首先，在/var/discourse/目录下运行下面的命令，加载discourse引导程序。

	# ./launcher bootstrap app

![Starting Discourse Bootstrap](http://blog.linoxide.com/wp-content/uploads/2015/04/starting-discourse-bootstrap.png)

上述命令可能会花去几分钟时间，会自动配置我们的Discourse环境。然后，该进程完成后，我们需要运行下面的命令启动Discourse App

	#./launch start app

![Starting Discourse](http://blog.linoxide.com/wp-content/uploads/2015/04/starting-discourse.png)

### 维护 ###

这里往下是/var/discourse/目录里加载命令的使用，这使得我们可以承担维护的任务，通过Docker 容器控制Disourse。（这里不太明白原文表达意思）

    Usage: launcher COMMAND CONFIG [--skip-prereqs]
    Commands:
    start: Start/initialize a container
    stop: Stop a running container
    restart: Restart a container
    destroy: Stop and remove a container
    enter: Use nsenter to enter a container
    ssh: Start a bash shell in a running container
    logs: Docker logs for container
    mailtest: Test the mail settings in a container
    bootstrap: Bootstrap a container for the config based on a template
    rebuild: Rebuild a container (destroy old, bootstrap, start new)
    cleanup: Remove all containers that have stopped for > 24 hours

    Options:
    --skip-prereqs Don't check prerequisites
    --docker-args Extra arguments to pass when running docker

### 总结 ###

Hurray！我们已经成功使用Docker技术安装了Discourse。Docker技术使得Discourse十分容易安装在任何平台，并且包含所有的要求。我们需要自己的邮件服务器或者邮件服务器的证书来启动它。对于便捷的现代邮件列表，论坛来说，Discourse是一个伟大的平台。（最后这句有些别扭）

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-discourse-docker-container/

作者：[Arun Pyasi][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://mandrillapp.com/
[2]:http://www.mailgun.com/
[3]:https://www.mailjet.com/pricing
