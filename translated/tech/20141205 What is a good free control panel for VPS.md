VPS上好的控制面板是什么
================================================================================
任何有经验的Linux人员都认为没有一款控制面板可以打败纯命令行界面来管理[虚拟主机][1]（VPS）。也有人争论有一款好的面板的一席之地，因为流线型的界面让常规管理操作可以通过点几下鼠标就可以完成。

至于控制面板，有共恩那个强大的充满警铃和汽笛的商业控制面板，也有不同免费的但也强大多功能的免费开源面板替代。这之中杰出的代表是[Ajenti][2]控制面板。

Ajenti可以让你很简单地配置不同的通用服务程序，如Apache/nginx、Samba、BIND、Squid、MySQL、cron、防火墙等等，对管理通用VPS实例可以节省大量的时间。对于生产环境，Ajenti同样提供了插件和平台来支持虚拟web主机管理和自定义web UI开发。

Ajenti有[双重授权][3];一个是个人、企业内部或者教育用途免费使用的AGPLv3。然而，如果你是一家托管企业或者硬件提供商，那么你需要购买商业授权来使用Ajenti作为商业供应。

### 在Linux上安装Ajenti ###

为了简化安装，Ajenti为主流Linux发行版提供了自己的仓库。安装Ajenti要做的就是配置目标仓库，并用默认包管理器来安装。

安装前，一个RSA密钥和证书会生成用于SSL，Ajenti会见在8000端口监听HTTPS的web请求。如果你正在使用防火墙，你需要在防火墙中允许8000端口。为了安全，最好默认禁止8000端口的访问，并添加少数IP地址到白名单中。

#### 在Debian上安装Ajenti ####

    $ wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -
    $ sudo sh -c 'echo "deb http://repo.ajenti.org/debian main main debian" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install ajenti 

#### 在Ubuntu上安装Ajenti ####

    $ wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -
    $ sudo sh -c 'echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install ajenti 

#### 在 CentOS/RHEL或者Fedora上安装Ajenti ####

在CentOS/RHEL上，首先[配置][4]EPEL仓库，接着运行下面的命令。在Fedora上，直接使用下面的命令。

    $ wget http://repo.ajenti.org/ajenti-repo-1.0-1.noarch.rpm
    $ sudo rpm -ivh ajenti-repo-1.0-1.noarch.rpm
    $ sudo yum install ajenti 

接着配置防火墙。

在Fedora或者CentOS/RHEL 7上：

    $ sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
    $ sudo firewall-cmd --reload 

在CentOS/RHEL 6上：

    $ sudo iptables -I INPUT -p tcp -m tcp --dport 8000 -j ACCEPT
    $ sudo service iptables save 

### 访问Ajenti web界面 ###

在访问Ajenti的web界面前，先确保启动了ajenti服务。

    $ sudo service ajenti restart 

直接在浏览器中输入https://<server-ip-address>:8000，你就会看到下面的Ajenti的登录界面。

![](https://farm8.staticflickr.com/7512/15712738197_eeccd0f9dd_z.jpg)

默认的登录凭证是用户名“root”，密码“admin”。当你登录后，你会看到初始化的Ajenti菜单。

![](https://farm8.staticflickr.com/7498/15897850312_d2ca46fa4b_z.jpg)

在左边面板的"SOFTWARE"选项下，你会看接一列安装的服务。当你安装了任何Ajenti支持的服务端程序时，软件会在重启ajenti服务后被自动加入列表。

     $ sudo service ajenti restart 

### 通过Ajenti web界面管理VPS ###

Ajenti的web界面非常直观且易使用。下面是Ajenti功能的几个例子。

#### 可插入结构 ####

Ajenti有许多特定应用的插件，这让AJenti可高度扩展化。当你在VPS上安装一款新软件时。相关的AJenti插件（如果有的话）会自动启用来管理软件。“Plugins”菜单会展示可用/启用的插件，以及和它们关联的软件。

![](https://farm8.staticflickr.com/7501/15872690086_26d05ea570_z.jpg)

#### 包管理 ####

Ajenti提供了一个web界面来安装和升级VPS上的包。

![](https://farm9.staticflickr.com/8571/15896505171_daf8c2d9db_z.jpg)

#### 防火墙配置 ####

Ajenti允许你用两种方法管理防火墙规则（iptables或者CSF）。一种是使用用户友好的web面板，另一种是直接编辑原生的防火墙规则。

![](https://farm8.staticflickr.com/7490/15276234634_a220f2a555_z.jpg)

![](https://farm8.staticflickr.com/7499/15711196520_343d0668ff_z.jpg)

#### 日志检查 ####

你可以在Ajenti的web界面中浏览位于/var/log下的系统日志。

![](https://farm8.staticflickr.com/7529/15276234684_a5375c9b6d_z.jpg)

#### 进程监控 ####

你可以u看见按照CPU和内存使用率排序的进程列表，按需可以结束它们。

![](https://farm8.staticflickr.com/7556/15711008948_ed359c284d_z.jpg)

#### 终端访问 ####

对于底层VPS访问，Ajenti提供了基于web的终端界面，你在这可以输入Linux命令。你也可以像下面那样在一个面板中打开多个终端。

![](https://farm8.staticflickr.com/7568/15896505251_8271ac16dd_z.jpg)

#### Apache Web服务管理 ####

你可以编辑Apache配额文件，并管理apche2服务。

![](https://farm8.staticflickr.com/7572/15711009108_bb806d2dcd_z.jpg)

#### MySQL/MariaDB 管理 ####

你可以访问MySQL/MariaDB服务并直接在上面执行原生SQL命令。

![](https://farm8.staticflickr.com/7580/15276234754_02375fd17b_z.jpg)

#### Squid 配置 ####

你可以配置Squid代理服务器的ACL、HTTP访问规则，过滤端口。

![](https://farm8.staticflickr.com/7568/15712738507_e2ef48b78f_z.jpg)

#### 启动服务管理 ####

你可以浏览、启动、停止、重启安装的服务。

![](https://farm8.staticflickr.com/7538/15898503935_1edf5c67ae_z.jpg)

### 总结 ###

Ajenti是一款易于使用的服务器管理控制面板，可以加入你开发的[自定义插件][5]。然而，记住任何好的控制面板都不会排除你学习面板后[VPS][6]上发生的情况的需求。一款面板会在你完全了解你正在做的事情的时候成会一款真正节省时间的利器，并且不依赖于控制面版来处理你行动的结果。

--------------------------------------------------------------------------------

via: http://xmodulo.com/free-control-panel-for-vps.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:http://ajenti.org/
[3]:http://ajenti.org/licensing
[4]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[5]:http://docs.ajenti.org/en/latest/dev/intro.html
[6]:http://xmodulo.com/go/digitalocean