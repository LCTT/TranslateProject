安装完最小化 RHEL/CentOS 7 后需要做的 30 件事情（五）
================================================================================
### 25. 安装 Linux Malware Detect (LMD) ###

Linux Malware Detect (LMD) 是 GNU GPLv2 协议下发布的开源 Linux 恶意程序扫描器，它是特别为面临威胁的主机环境所设计的。LMD 完整的安装、配置以及使用方法可以查看：

- [安装 LMD 并和 ClamAV 一起使用作为反病毒引擎][1]

### 26. 用 Speedtest-cli 测试服务器带宽 ###

speedtest-cli 是用 python 写的用于测试网络下载和上传带宽的工具。关于 speedtest-cli 工具的完整安装和使用请阅读我们的文章[用命令行查看 Linux 服务器带宽][2]

### 27. 配置 Cron 任务 ###

这是最广泛使用的软件工具之一。它是一个任务调度器，比如，现在安排一个以后可以自动运行的作业。它用于未处理记录的日志和维护，以及其它日常工作，比如常规备份。所有的调度都写在文件 /etc/crontab 中。

crontab 文件包含下面的 6 个域：

    	分	         时				日期						月份					星期					命令
    (0-59)           (0-23)		  (1-31)                (1/jan-12/dec)       (0-6/sun-sat)          Command/script

![Crontab 域](http://www.tecmint.com/wp-content/uploads/2015/04/Crontab-Fields.jpeg)

*Crontab 域*

要在每天 04:30 运行一个 cron 任务（比如运行 /home/$USER/script.sh）。

	分	         	时			日期				月份		星期					命令
    30              4  		      *		         *		 *            speedtest-cli

就把下面的条目增加到 crontab 文件 ‘/etc/crontab/’。

    30  4  *  *  *  /home/$user/script.sh

把上面一行增加到 crontab 之后，它会在每天的 04:30 am 自动运行，输出取决于脚本文件的内容。另外脚本也可以用命令代替。关于更多 cron 任务的例子，可以阅读[Linux 上的 11 个 Cron 任务例子][3]

### 28. 安装 Owncloud ###

Owncloud 是一个基于 HTTP 的数据同步、文件共享和远程文件存储应用。更多关于安装 owncloud 的内容，你可以阅读这篇文章：[在 Linux 上创建个人/私有云存储][4]

### 29. 启用 Virtualbox 虚拟化 ###

虚拟化是创建虚拟操作系统、硬件和网络的过程，是当今最热门的技术之一。我们会详细地讨论如何安装和配置虚拟化。

我们的最小化 CentOS 服务器是一个无用户界面服务器（LCTT 译注：无用户界面[headless]服务器指没有监视器和鼠标键盘等外设的服务器）。我们通过安装下面的软件包，让它可以托管虚拟机，虚拟机可通过 HTTP 访问。

    # yum groupinstall 'Development Tools' SDL kernel-devel kernel-headers dkms

![安装开发工具](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Development-Tool.jpeg)

*安装开发工具*

更改工作目录到 ‘/etc/yum.repos.d/’ 并下载 VirtualBox 库。

    # wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

安装刚下载的密钥。

    # rpm --import oracle_vbox.asc

升级并安装 VirtualBox。

    # yum update && yum install virtualbox-4.3

下一步，下载和安装 VirtualBox 扩展包。

    # wget http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack
    # VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack

![安装 VirtualBox 扩展包](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Virtualbox-Extension-Pack.jpeg)

*安装 VirtualBox 扩展包*

![正在安装 VirtualBox 扩展包](http://www.tecmint.com/wp-content/uploads/2015/04/Installing-Virtualbox-Extension-Pack.jpeg)

*正在安装 VirtualBox 扩展包*

添加用户 ‘vbox’ 用于管理 VirtualBox 并把它添加到组 vboxusers 中。

    # adduser vbox
    # passwd vobx
    # usermod -G vboxusers vbox

安装 HTTPD 服务器。

    # yum install httpd

安装 PHP （支持 soap 扩展）。

    # yum install php php-devel php-common php-soap php-gd

下载 phpVirtualBox（一个 PHP 写的开源的 VirtualBox 用户界面）。

    # wget http://sourceforge.net/projects/phpvirtualbox/files/phpvirtualbox-4.3-1.zip

解压 zip 文件并把解压后的文件夹复制到 HTTP 工作目录。

    # unzip phpvirtualbox-4.*.zip
    # cp phpvirtualbox-4.3-1 -R /var/www/html

下一步，重命名文件 /var/www/html/phpvirtualbox/config.php-example 为 var/www/html/phpvirtualbox/config.php。

    # mv config.php.example config.php

打开配置文件并添加我们上一步创建的 ‘username ’ 和 ‘password’。

    # vi config.php

最后，重启 VirtualBox 和 HTTP 服务器。

    # service vbox-service restart
    # service httpd restart

转发端口并从一个有用户界面的服务器上访问它。

    http://192.168.0.15/phpvirtualbox-4.3-1/

![登录 PHP Virtualbox](http://www.tecmint.com/wp-content/uploads/2015/04/PHP-Virtualbox-Login.png)

*登录 PHP Virtualbox*

![PHP Virtualbox 面板](http://www.tecmint.com/wp-content/uploads/2015/04/PHP-Virtualbox.png)

*PHP Virtualbox 面板*

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/5/

作者：[Avishek Kumar][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-5156-1.html
[2]:https://linux.cn/article-3796-1.html
[3]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[4]:https://linux.cn/article-2494-1.html