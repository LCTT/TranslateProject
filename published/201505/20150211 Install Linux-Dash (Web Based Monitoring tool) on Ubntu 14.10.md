在Ubuntu 14.10上安装基于Web的监控工具：Linux-Dash
================================================================================

Linux-Dash是一个用于GNU/Linux机器的，低开销的监控仪表盘。您可以安装试试！Linux Dash的界面提供了您的服务器的所有关键信息的详细视图，可监测的信息包括RAM、磁盘使用率、网络、安装的软件、用户、运行的进程等。所有的信息都被分成几类，您可以通过主页工具栏中的按钮跳到任何一类中。Linux Dash并不是最先进的监测工具，但它十分适合寻找灵活、轻量级、容易部署的应用的用户。

### Linux-Dash的功能 ###

- 使用一个基于Web的漂亮的仪表盘界面来监控服务器信息
- 实时的按照你的要求监控RAM、负载、运行时间、磁盘配置、用户和许多其他系统状态
- 支持基于Apache2/niginx + PHP的服务器
- 通过点击和拖动来重排列控件
- 支持多种类型的linux服务器

### 当前控件列表 ###

- 通用信息
- 平均负载
- RAM
- 磁盘使用量
- 用户
- 软件
- IP
- 网络速率
- 在线状态
- 处理器
- 日志

### 在Ubuntu server 14.10上安装Linux-Dash ###

首先您需要确认您安装了[Ubuntu LAMP server 14.10][1]，接下来您需要安装下面的包：

    sudo apt-get install php5-json unzip

安装这个模块后，需要在apache2中启用该模块，所以您需要使用下面的命令重启apache2服务器：

    sudo service apache2 restart
    
现在您需要下载linux-dash的安装包并安装它：

    wget https://github.com/afaqurk/linux-dash/archive/master.zip

    unzip master.zip

    sudo mv linux-dash-master/ /var/www/html/linux-dash-master/

接下来您需要使用下面的命令来改变权限：

    sudo chmod 755 /var/www/html/linux-dash-master/

现在您便可以访问http://serverip/linux-dash-master/了。您应该会看到类似下面的输出：

![](http://www.ubuntugeek.com/wp-content/uploads/2015/02/1.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/02/2.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-linux-dash-web-based-monitoring-tool-on-ubntu-14-10.html

作者：[ruchi][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.ubuntugeek.com/step-by-step-ubuntu-14-10-utopic-unicorn-lamp-server-setup.html
