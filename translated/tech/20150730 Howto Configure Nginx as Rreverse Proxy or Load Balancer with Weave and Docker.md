如何使用Weave以及Docker搭建Nginx反向代理/负载均衡服务器
================================================================================
Hi, 今天我们将会学习如何使用如何使用Weave和Docker搭建Nginx反向代理/负载均衡服务器。Weave创建一个虚拟网络将跨主机部署的Docker容器连接在一起并使它们自动暴露给外部世界。它让我们更加专注于应用的开发，而不是基础架构。Weave提供了一个如此棒的环境，仿佛它的所有容器都属于同个网络，不需要端口/映射/连接等的配置。容器中的应用提供的服务在weave网络中可以轻易地被外部世界访问，不论你的容器运行在哪里。在这个教程里我们将会使用weave快速并且轻易地将nginx web服务器部署为一个负载均衡器，反向代理一个运行在Amazon Web Services里面多个节点上的docker容器中的简单php应用。这里我们将会介绍WeaveDNS,它提供一个简单的方式让容器利用主机名找到彼此，不需要改变代码，并且能够告诉其他容器连接到这些主机名。

在这篇教程里，我们需要一个运行的容器集合来配置nginx负载均衡服务器。最简单轻松的方法就是使用Weave在ubuntu的docker容器中搭建nginx负载均衡服务器。

### 1. 搭建AWS实例 ###

首先，我们需要搭建Amzaon Web Service实例，这样才能在ubuntu下用weave跑docker容器。我们将会使用[AWS CLI][1]来搭建和配置两个AWS EC2实例。在这里，我们使用最小的有效实例，t1.micro。我们需要一个有效的**Amazon Web Services账户**用以AWS命令行界面的搭建和配置。我们先在AWS命令行界面下使用下面的命令将github上的weave仓库克隆下来。

    $ git clone http://github.com/fintanr/weave-gs
    $ cd weave-gs/aws-nginx-ubuntu-simple

在克隆完仓库之后，我们执行下面的脚本，这个脚本将会部署两个t1.micro实例，每个实例中都是ubuntu作为操作系统并用weave跑着docker容器。

    $ sudo ./demo-aws-setup.sh

在这里，我们将会在以后用到这些实例的IP地址。这些地址储存在一个weavedemo.env文件中，这个文件在执行demo-aws-setup.sh脚本的期间被创建。为了获取这些IP地址，我们需要执行下面的命令，命令输出类似下面的信息。

    $ cat weavedemo.env

    export WEAVE_AWS_DEMO_HOST1=52.26.175.175
    export WEAVE_AWS_DEMO_HOST2=52.26.83.141
    export WEAVE_AWS_DEMO_HOSTCOUNT=2
    export WEAVE_AWS_DEMO_HOSTS=(52.26.175.175 52.26.83.141)

请注意这些不是固定的IP地址，AWS会为我们的实例动态地分配IP地址。

我们在bash下执行下面的命令使环境变量生效。

     . ./weavedemo.env

### 2. 启动Weave and WeaveDNS ###

在安装完实例之后，我们将会在每台主机上启动weave以及weavedns。Weave以及weavedns使得我们能够轻易地将容器部署到一个全新的基础架构以及配置中， 不需要改变代码，也不需要去理解像Ambassador容器以及Link机制之类的概念。下面是在第一台主机上启动weave以及weavedns的命令。

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST1
    $ sudo weave launch
    $ sudo weave launch-dns 10.2.1.1/24

下一步，我也准备在第二台主机上启动weave以及weavedns。

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST2
    $ sudo weave launch $WEAVE_AWS_DEMO_HOST1
    $ sudo weave launch-dns 10.2.1.2/24

### 3. 启动应用容器 ###

现在，我们准备跨两台主机启动六个容器，这两台主机都用Apache2 Web服务实例跑着简单的php网站。为了在第一个Apache2 Web服务器实例跑三个容器， 我们将会使用下面的命令。

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST1
    $ sudo weave run --with-dns 10.3.1.1/24 -h ws1.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.2/24 -h ws2.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.3/24 -h ws3.weave.local fintanr/weave-gs-nginx-apache

在那之后，我们将会在第二个实例上启动另外三个容器，请使用下面的命令。

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST2
    $ sudo weave run --with-dns 10.3.1.4/24 -h ws4.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.5/24 -h ws5.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.6/24 -h ws6.weave.local fintanr/weave-gs-nginx-apache

注意: 在这里，--with-dns选项告诉容器使用weavedns来解析主机名，-h x.weave.local则使得weavedns能够解析指定主机。

### 4. 启动Nginx容器 ###

在应用容器运行得有如意料中的稳定之后，我们将会启动nginx容器，它将会在六个应用容器服务之间轮询并提供反向代理或者负载均衡。 为了启动nginx容器，请使用下面的命令。

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST1
    $ sudo weave run --with-dns 10.3.1.7/24 -ti -h nginx.weave.local -d -p 80:80 fintanr/weave-gs-nginx-simple

因此，我们的nginx容器在$WEAVE_AWS_DEMO_HOST1上公开地暴露成为一个http服务器。

### 5. 测试负载均衡服务器 ###

为了测试我们的负载均衡服务器是否可以工作，我们执行一段可以发送http请求给nginx容器的脚本。我们将会发送6个请求，这样我们就能看到nginx在一次的轮询中服务于每台web服务器之间。

    $ ./access-aws-hosts.sh

    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws1.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws2.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws3.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws4.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws5.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws6.weave.local",
    "date" : "2015-06-26 12:24:23"
    }

### 结束语 ###

我们最终成功地将nginx配置成一个反向代理/负载均衡服务器，通过使用weave以及运行在AWS（Amazon Web Service）EC2之中的ubuntu服务器里面的docker。从上面的步骤输出可以清楚的看到我们已经成功地配置了nginx。我们可以看到请求在一次循环中被发送到6个应用容器，这些容器在Apache2 Web服务器中跑着PHP应用。在这里，我们部署了一个容器化的PHP应用，使用nginx横跨多台在AWS EC2上的主机而不需要改变代码，利用weavedns使得每个容器连接在一起，只需要主机名就够了，眼前的这些便捷， 都要归功于weave以及weavedns。 如果你有任何的问题、建议、反馈，请在评论中注明，这样我们才能够做得更好，谢谢:-）

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/nginx-load-balancer-weave-docker/

作者：[Arun Pyasi][a]
译者：[dingdongnigetou](https://github.com/dingdongnigetou)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://console.aws.amazon.com/
