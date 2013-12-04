Linux中如何显示和设置Hostname
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/hostname-command-linux.jpg)

随着原来越多的计算机连接上网络，计算机需要有一个属性来与其他计算机区别。如同在真实世界的人，计算机也有自己属性叫hostname（主机名称）

### 什么是hostname ###

从它的操作手册来看，hostname是用来显示系统的DNS名字以及为了显示和设置它的主机名或者NIS域名名字。所以hostname是依赖于DNS（Domain Name System域名系统）或者NIS（Network Information System网络信息系统）。


### 怎么显示hostname ###

hostname是为一个linux发行版的预安装命令。通过在控制台输入hostname，可以显示你的机器的hostname。这里有一个有个简单的命令及其输出。


    $ hostname
    ubuntu

上面的命令将会告诉你，计算机的名字是**ubuntu** 。


### 如何设置hostname ###

Hostname当你在第一次安装你的Linux的时候已经设置好了。 就是在你安装你的Linux产品的那步时，将会询问你去填入主机名信息。然而，**你可以稍后填写它**如果你愿意。
为了设置你的hostname，你可以使用下面的命令：

    # hostname dev-machine
    
    $ hostname
    dev-machine

你**需要使用root权限**或者同样的权限可以设置/改变你的hostname。#号提示你在使用root用户。上述命令告诉你的计算机设置你的hostname为**dev-machine**。如果你没有收到任何错误消息，那么你的hostname已经改变了。再一次使用hostname命令检查，看看结果。

使用hostname命令设置你的hostname**不是永久的**。当你重启你的计算机，你的设定将会取消。**为了永久改变**，你必须手动地修改hostname配置文件。

**On Debian / Ubuntu based Linux**
**基于Linux 的 Debian / Ubuntu**

你可以在下列文件夹找到这个文件，
**/etc/hostname**
或者
**/etc/hosts**

下面是每一个文件的内容

**/etc/hostname**

    # vi /etc/hostname
    dev-machine

**/etc/hosts**

    # vi /etc/hosts
    127.0.0.1 localhost
    127.0.0.1 dev-machine

你将会发现修改它会立即生效而不用重启你的linux。

**On RedHat / CentOS based Linux**
**基于Linux的 RedHat / CentOS**

你可以在下列文件夹找到这个文件，
**/etc/hosts**
或者
**/etc/sysconfig/networks**

下面是每一个文件的内容
**/etc/hosts**

    127.0.0.1 localhost.localdomain localhost dev-machine
    ::localhost 127.0.0.1

/etc/sysconfig/network

    NETWORKING=yes
    NETWORKING_IPV6=no
    HOSTNAME=dev-machine

### 怎么显示DNS域名 ###

来自上面的hostname的定义，hostname也可以显示你的Linux的DNS名字。如果你的hostname命令会显示你的hostname，那么dnsdomainname命令也就会显示你的域名。来看看这个简单的例子。

    $ dnsdomainname
    bris.co.id

在本篇文章，dnsdomainname命令的结果是 **bris.co.id**。

如果你看见结果是 (**none**),那么你的机器**没有配置完整合格的域名（FQDN（Fully Qualified Domain Name））**。Dnsdomainname命令摘取来自**/etc/hosts**文件的信息。你应该配置它为完整合格的域名格式。接下来一个简单的例子：

**/etc/hosts**

    127.0.0.1 localhost.localdomain localhost dev-machine
    ::localhost 127.0.0.1
    192.168.0.104 dev-machine.bris.co.id dev-machine

为了显示更多的细节，你可以使用参数**-v**

    $ dnsdomainname -v
    gethostname()=’dev-machine.bris.co.id’
    Resolving ‘dev-machine.bris.co.id’ …
    Result: h_name=’dev-machine.bris.co.id’
    Result: h_aliases=’dev-machine’
    Result: h_addr_list=’192.168.0.104’

### 如何显示hostname更多细节信息###

Hostname命令可以使用多个参数和一些别名如：dnsdomainname命令。这里有一些参数是每日操作中有用的。下面这些命令的结果是基于**/etc/hosts**的上述配置。

**显示IP地址**

    $ hostname -i
    192.168.0.104

**显示域名**

    $ hostname -d
    bris.co.id

**显示短主机名**
    $ hostname -s
    dev-machine

* 这个命令将会产生与输入hostname同样的结果 *

**显示FQDN格式**

    $ hostname -f
    dev-machine.bris.co.id

**显示细节信息**

所有的参数包括上述信息，都可以通过使用参数**-v 和 -d** 来概括。让我们来看一个例子。

    $ hostname -v -d
    gethostname()=’dev-machine.bris.co.id’
    Resolving ‘dev-machine.bris.co.id’ …
     Result: h_name=’dev-machine.bris.co.id’
    Result: h_aliases=’dev-machine’
    Result: h_addr_list=’192.168.0.104’
    bris.co.id

感到熟悉？是的，这个结果与**dnsdomainname -v**命令是相同的，同样包含上面的内容。
--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/display-set-hostname-linux/

译者：[Vic___](https://blog.csdn.net/Vic___) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出