如何在Linux中显示和设置主机名
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/hostname-command-linux.jpg)

随着连接到网络的计算机数量越来越多，每一台计算机都需要有一个属性来区别于其它计算机。和现实世界中的人一样，计算机也有一个叫做hostname（主机名）的属性。

### 什么是hostname ###

从它的操作手册来看，hostname是用来显示系统的DNS名字以及为了显示和设置它的主机名或者NIS域名名字。所以hostname依赖于DNS（Domain Name System域名系统）或者NIS（Network Information System网络信息系统）。


### 怎么显示hostname ###

hostname是为每一个linux发行版的预安装命令。通过在控制台输入hostname，可以显示你的机器的hostname。这里有一个有个简单的命令及其输出。


    $ hostname
    ubuntu

上面的命令将会告诉你，计算机的名字是**ubuntu** 。


### 如何设置hostname ###

Hostname是在你第一次安装Linux的时候设置。其中有一个步骤Linux会让你输入主机名称的信息。不过，如果你愿意的话，你在之后设置也可以。

设置你的hostname，你可以使用下面的命令：

    # hostname dev-machine
    
    $ hostname
    dev-machine

你**需要使用root权限**，或者等同root的权限来设置/修改你计算机的主机名。“#”标识证明你是root用户。上述命令把你的计算机主机名设置成为**dev-machine**。如果你没有收到任何报错信息，那么你的hostname已经改变了。再一次使用hostname命令检查，看看结果。

使用hostname命令设置你的hostname **不是永久的** 。当你重启你的计算机，你的设定将会失效。 **为了永久改变** ，你必须手动修改hostname配置文件。

**Debian / Ubuntu系的Linux**

你可以在 **/etc/hostname** 和 **/etc/hosts** 文件夹中找到这个文件

下面是每一个文件的内容

**/etc/hostname**

    # vi /etc/hostname
    dev-machine

**/etc/hosts**

    # vi /etc/hosts
    127.0.0.1 localhost
    127.0.0.1 dev-machine

你将会发现不用重启你的linux它就即刻生效。

**RedHat / CentOS系的Linux**

你可以在 **/etc/hosts** 和 **/etc/sysconfig/networks** 文件夹中找到这个文件。

下面是每一个文件的内容

**/etc/hosts**

    127.0.0.1 localhost.localdomain localhost dev-machine
    ::localhost 127.0.0.1

**/etc/sysconfig/network**

    NETWORKING=yes
    NETWORKING_IPV6=no
    HOSTNAME=dev-machine

### 怎么显示DNS域名 ###

来自上面的hostname的定义，hostname也可以显示你的Linux的DNS名字。如果你的hostname命令会显示你的hostname，那么dnsdomainname命令也就会显示你的域名。来看看这个简单的例子。

    $ dnsdomainname
    bris.co.id

在本篇文章，dnsdomainname命令的结果是 **bris.co.id**。

如果你看见结果是 (**none**)，那么你的机器**没有配置FQDN（Fully Qualified Domain Name 完全符合标准的域名）** 。dnsdomainname命令摘取来自**/etc/hosts**文件的信息。你应该配置它为FQDN格式。下面是一个简单的例子：

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

### 如何显示hostname的更多细节信息###

Hostname命令可以使用多个参数和一些别名，比如dnsdomainname命令就是它的一个别名。这些参数在每日操作中是有用的。下面这些命令的结果是基于**/etc/hosts**的上述配置。

**显示IP地址**

    $ hostname -i
    192.168.0.104

**显示域名**

    $ hostname -d
    bris.co.id

**显示短主机名**
    $ hostname -s
    dev-machine

*这个命令将会产生与只输入hostname同样的结果*

**显示FQDN格式**

    $ hostname -f
    dev-machine.bris.co.id

**显示细节信息**

所有的参数包括上述信息，都可以通过使用参数**-v** 和 **-d** 来概括。让我们来看一个例子。

    $ hostname -v -d
    gethostname()=’dev-machine.bris.co.id’
    Resolving ‘dev-machine.bris.co.id’ …
     Result: h_name=’dev-machine.bris.co.id’
    Result: h_aliases=’dev-machine’
    Result: h_addr_list=’192.168.0.104’ 
    bris.co.id

觉得熟悉吗？没错，运行结果与上面提到的 **dnsdomainname -v** 命令式相同的。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/display-set-hostname-linux/

译者：[Vic___](http://blog.csdn.net/Vic___) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
