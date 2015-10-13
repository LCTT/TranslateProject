如何在 CentOS 7 上安装开源 ITIL 门户 iTOP
================================================================================

iTOP是一个简单的基于Web的开源IT服务管理工具。它有所有的ITIL功能，包括服务台、配置管理、事件管理、问题管理、变更管理和服务管理。iTOP依赖于Apache/IIS、MySQL和PHP，因此它可以运行在任何支持这些软件的操作系统中。因为iTOP是一个Web程序，因此你不必在用户的PC端任何客户端程序。一个简单的浏览器就足够每天的IT环境操作了。

我们要在一台有满足基本需求的LAMP环境的CentOS 7上安装和配置iTOP。

### 下载 iTOP ###

iTOP的下载包现在在SourceForge上，我们可以从这获取它的官方[链接][1]。

![itop download](http://blog.linoxide.com/wp-content/uploads/2015/07/1-itop-download.png)

我们从这里的连接用wget命令获取压缩文件。

    [root@centos-007 ~]# wget http://downloads.sourceforge.net/project/itop/itop/2.1.0/iTop-2.1.0-2127.zip

### iTop扩展和网络安装 ###

使用unzip命令解压到apache根目录下的itop文件夹下。

    [root@centos-7 ~]# ls
    iTop-2.1.0-2127.zip
    [root@centos-7 ~]# unzip iTop-2.1.0-2127.zip -d /var/www/html/itop/

列出安装包中的内容。

    [root@centos-7 ~]# ls -lh /var/www/html/itop/
    total 68K
    -rw-r--r--. 1 root root 1.4K Dec 17 2014 INSTALL
    -rw-r--r--. 1 root root 35K Dec 17 2014 LICENSE
    -rw-r--r--. 1 root root 23K Dec 17 2014 README
    drwxr-xr-x. 19 root root 4.0K Jul 14 13:10 web

这些是我们可以安装的扩展。

    [root@centos-7 2.x]# ls
    authent-external itop-backup itop-config-mgmt itop-problem-mgmt itop-service-mgmt-provider itop-welcome-itil
    authent-ldap itop-bridge-virtualization-storage itop-datacenter-mgmt itop-profiles-itil itop-sla-computation version.xml
    authent-local itop-change-mgmt itop-endusers-devices itop-request-mgmt itop-storage-mgmt wizard-icons
    installation.xml itop-change-mgmt-itil itop-incident-mgmt-itil itop-request-mgmt-itil itop-tickets
    itop-attachments itop-config itop-knownerror-mgmt itop-service-mgmt itop-virtualization-mgmt

在解压的目录下，使用如下的 cp 命令将不同的数据模型从web 下的 datamodels 目录下复制到 extensions 目录，来迁移需要的扩展。

    [root@centos-7 2.x]# pwd
    /var/www/html/itop/web/datamodels/2.x
    [root@centos-7 2.x]# cp -r itop-request-mgmt itop-service-mgmt itop-service-mgmt itop-config itop-change-mgmt /var/www/html/itop/web/extensions/

### 安装 iTop web界面 ###

大多数服务端设置和配置已经完成了。最后我们安装web界面来完成安装。

打开浏览器使用ip地址或者完整域名来访问iTop 的 web目录。

    http://servers_ip_address/itop/web/

你会被重定向到iTOP的web安装页面。让我们按照要求配置，就像在这篇教程中做的那样。

#### 验证先决要求 ####

这一步你就会看到验证完成的欢迎界面。如果你看到了一些警告信息，你需要先安装这些软件来解决这些问题。

![mcrypt missing](http://blog.linoxide.com/wp-content/uploads/2015/07/2-itop-web-install.png)

这一步有一个叫php mcrypt的可选包丢失了。下载下面的rpm包接着尝试安装php mcrypt包。

    [root@centos-7 ~]#yum localinstall php-mcrypt-5.3.3-1.el6.x86_64.rpm libmcrypt-2.5.8-9.el6.x86_64.rpm.

成功安装完php-mcrypt后，我们需要重启apache服务，接着刷新页面，这时验证应该已经OK。

#### 安装或者升级 iTop ####

现在我们要在没有安装iTOP的服务器上选择全新安装。

![Install New iTop](http://blog.linoxide.com/wp-content/uploads/2015/07/3.png)

#### iTop 许可协议 ####

勾选接受 iTOP所有组件的许可协议，并点击“NEXT”。

![License Agreement](http://blog.linoxide.com/wp-content/uploads/2015/07/4.png)

#### 数据库配置 ####

现在我们输入数据库凭据来配置数据库连接，接着选择如下选择创建新数据库。

![DB Connection](http://blog.linoxide.com/wp-content/uploads/2015/07/5.png)

#### 管理员账户 ####

这一步中我们会输入它的登录信息来配置管理员账户。

![Admin Account](http://blog.linoxide.com/wp-content/uploads/2015/07/6.png)

#### 杂项参数 ####

让我们选择额外的参数来选择你是否需要安装一个带有演示内容的数据库或者使用全新的数据库，接着下一步。

![Misc Parameters](http://blog.linoxide.com/wp-content/uploads/2015/07/7.png)

### iTop 配置管理 ###

下面的选项允许你配置在iTOP要管理的元素类型，像CMDB、数据中心设备、存储设备和虚拟化这些东西在iTOP中是必须的。

![Conf Management](http://blog.linoxide.com/wp-content/uploads/2015/07/8.png)

#### 服务管理 ####

选择一个最能描述你的IT设备和环境之间的关系的选项。因此我们这里选择为服务提供商的服务管理。

![Service Management](http://blog.linoxide.com/wp-content/uploads/2015/07/9.png)

#### iTop Tickets 管理 ####

从不同的可用选项我们选择符合ITIL Tickets管理选项来管理不同类型的用户请求和事件。

![Ticket Management](http://blog.linoxide.com/wp-content/uploads/2015/07/10.png)

#### 改变管理选项 ####

选择不同的ticket类型以便管理可用选项中的IT设备变更。我们选择ITTL变更管理选项。

![ITIL Change](http://blog.linoxide.com/wp-content/uploads/2015/07/11.png)

#### iTop 扩展 ####

这一节我们选择额外的扩展来安装或者不选直接跳过。

![iTop Extensions](http://blog.linoxide.com/wp-content/uploads/2015/07/13.png)

### 准备开始web安装 ###

现在我们开始准备安装先前先前选择的组件。我们也可以下拉这些安装参数来浏览我们的配置。

确认安装参数后点击安装按钮。

![Installation Parameters](http://blog.linoxide.com/wp-content/uploads/2015/07/16.png)

让我们等待进度条来完成安装步骤。它也许会花费几分钟来完成安装步骤。

![iTop Installation Process](http://blog.linoxide.com/wp-content/uploads/2015/07/17.png)

### iTop安装完成 ###

我们的iTOP安装已经完成了，只要如下一个简单的手动操作就可以进入到iTOP。

![iTop Done](http://blog.linoxide.com/wp-content/uploads/2015/07/18.png)

### 欢迎来到iTop (IT操作门户) ###

![itop welcome note](http://blog.linoxide.com/wp-content/uploads/2015/07/20.png)

### iTop 面板 ###

你这里可以配置任何东西，服务、计算机、通讯录、位置、合同、网络设备等等。你可以创建你自己的。事实是刚安装的CMDB模块是每一个IT人员的必备模块。

![iTop Dashboard](http://blog.linoxide.com/wp-content/uploads/2015/07/19.png)

### 总结 ###

ITOP是一个最棒的开源桌面服务解决方案。我们已经在CentOS 7上成功地安装和配置了。因此，iTOP最强大的一方面是它可以很简单地通过扩展来自定义。如果你在安装中遇到任何问题欢迎评论。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/setup-itop-centos-7/

作者：[Kashif Siddique][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:http://www.combodo.com/spip.php?page=rubrique&id_rubrique=8
