Linux有问必答：如何安装autossh
================================================================================
> **提问**: 我打算在linux上安装autossh，我应该怎么做呢? 

[autossh][1] 是一款开源工具，可以帮助管理SSH会话、自动重连和停止转发流量。autossh会假定目标主机已经设定[无密码SSH登陆][2]，以便autossh可以重连断开的SSH会话而不用用户操作。

只要你建立[反向SSH隧道][3]或者[挂载基于SSH的远程文件夹][4]，autossh迟早会派上用场。基本上只要需要维持SSH会话，autossh肯定是有用的。

![](https://farm8.staticflickr.com/7786/17150854870_63966e78bc_c.jpg)

下面有许多linux发行版autossh的安装方法。

### Debian 或 Ubuntu 系统 ###

autossh已经加入基于Debian系统的基础库，所以可以很方便的安装。

    $ sudo apt-get install autossh 

### Fedora 系统 ###

Fedora库同样包含autossh包，使用yum安装。

    $ sudo yum install autossh 

### CentOS 或 RHEL 系统 ###

CentOS/RHEL 6 或早期版本, 需要开启第三库[Repoforge库][5], 然后才能使用yum安装.

    $ sudo yum install autossh 

CentOS/RHEL 7以后，autossh 已经不在Repoforge库中. 你需要从源码编译安装（例子在下面）。

### Arch Linux 系统 ###

    $ sudo pacman -S autossh 

### Debian 或 Ubuntu 系统中从源码编译安装###

如果你想要使用最新版本的autossh，你可以自己编译源码安装

    $ sudo apt-get install gcc make
    $ wget http://www.harding.motd.ca/autossh/autossh-1.4e.tgz
    $ tar -xf autossh-1.4e.tgz
    $ cd autossh-1.4e
    $ ./configure
    $ make
    $ sudo make install 

### CentOS, Fedora 或 RHEL 系统中从源码编译安装###

在CentOS/RHEL 7以后，autossh不在是预编译包。所以你不得不从源码编译安装。

    $ sudo yum install wget gcc make
    $ wget http://www.harding.motd.ca/autossh/autossh-1.4e.tgz
    $ tar -xf autossh-1.4e.tgz
    $ cd autossh-1.4e
    $ ./configure
    $ make
    $ sudo make install 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-autossh-linux.html

作者：[Dan Nanni][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://www.harding.motd.ca/autossh/
[2]:https://linux.cn/article-5444-1.html
[3]:http://xmodulo.com/access-linux-server-behind-nat-reverse-ssh-tunnel.html
[4]:http://xmodulo.com/how-to-mount-remote-directory-over-ssh-on-linux.html
[5]:http://xmodulo.com/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
