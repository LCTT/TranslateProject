如何在Linux中安装Go语言
================================================================================
Go (也叫 "golang")是一款由Google最初开发的编程语言。它的诞生有几个设计原则：简单、安全、速度。Go语言发行版拥有各种调试、测试、调优和代码审查工具。如今Go语言和它的工具链在大多数Linux发行版的基础仓库都可用，用默认的包管理器就可以安装。

### 在Ubuntu、Debian 或者 Linux Mint上安装Go语言 ###

下面是在基于Debian的发行版上使用**apt-get**来安装Go语言和它的开发工具。

    $ sudo apt-get install golang

检查Go语言的版本来验证安装。

    $ go version

----------

    go version go1.2.1 linux/amd64

根据你的需要，你或许想要使用apt-get安装额外的Go工具。

    $ sudo apt-cache search golang

![](https://farm8.staticflickr.com/7430/15812762183_f094e3bf92_c.jpg)

### 在Fedora、CentOS/RHEL中安装Go语言 ###

下面的命令会在基于Red Hat的发行版中安装Go语言和它的工具。

    $ sudo yum install golang

检查Go语言的版本来验证安装。

    $ go version 

----------

    go version go1.3.3 linux/amd64

根据你的需要，你或许想要使用yum安装额外的Go工具。

    $ yum search golang 

![](https://farm8.staticflickr.com/7373/16432817805_775010dc18_c.jpg)

### 从官网安装Go语言 ###

有时发行版中的go语言版本并不是最新的。为了避免这种情况，你可以从官网安装最新的Go语言。下面是步骤。

进入Go语言的[官方源码][1]，并下载预编译二进制代码。

**对于64位Linux:**

    $ wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz

**对于32位Linux:**

    $ wget https://storage.googleapis.com/golang/go1.4.1.linux-386.tar.gz

**在/usr/local下安装程序**

    $ sudo tar -xzf go1.4.1.linux-xxx.tar.gz -C /usr/local

在/etc/profile中添加系统范围的PATH环境变量。

    $ sudo vi /etc/profile 

----------

    export PATH=$PATH:/usr/local/go/bin

如果你在/usr/local之外的自定义位置中安装了Go，你同样需要设置GOROOT环境变量来指向自定义的安装位置。

    $ sudo vi /etc/profile

----------

    export GOROOT=/path/to/custom/location

检查Go语言的版本

    $ go version

----------

    go version go1.4.1 linux/amd64

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-go-language-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://golang.org/dl/
