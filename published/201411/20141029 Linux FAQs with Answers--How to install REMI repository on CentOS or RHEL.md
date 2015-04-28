Linux 有问必答：如何在CentOS或者RHEL上安装REMI仓库
================================================================================
> **Question**：我该如何在CentOS或者RHEL中配置REMI仓库，并安装其中的包？

[REMI 仓库][1]提供了CentOS和RHEL的核心包的更新版本，尤其是最新的PHP/MySQL系列（LCTT 译注：当你需要一个更新包，而 CentOS/RHEL 没有及时提供更新时， REMI 仓库可以帮助你）。

安装REMI仓库要记住的一件事是不要在启用了REMI仓库时运行yum update。因为REMI仓库的包名与RHEL/CentOS中的相同，运行yum update可能会触发意外的更新。一个好办法是禁用REMI仓库，在你需要安装RMEI仓库中独有的包时再启用。

### 预备工作 ###

安装REMI仓库之前，你首先需要启用EPEL仓库，因为REMI中的一些包依赖于EPEL。按照[这份指南][2]在CentOS或者RHEL中设置EPEL仓库。

### 安装REMI仓库 ###

现在按照下面的步骤安装REMI仓库。

在CentOS 7上:

    $ sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
    $ sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

在CentOS 6上:

    $ sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
    $ sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

默认地，REMI是禁用的。要检查REMI是否已经成功安装，使用这个命令。你会看到几个REMI仓库，比如remi、remi-php55和remi-php56。

    $ yum repolist disabled | grep remi 

![](https://farm4.staticflickr.com/3956/15443851690_a1abe9eb40_z.jpg)

### 从REMI仓库中安装一个包 ###

如上所述，最好保持禁用REMI仓库，**只有在需要的时候再启用**。

要搜索或安装REMI仓库中的包，使用这些命令:

    $ sudo yum --enablerepo=remi search <keyword>
    $ sudo yum --enablerepo=remi install <package-name> 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-remi-repository-centos-rhel.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://rpms.famillecollet.com/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html