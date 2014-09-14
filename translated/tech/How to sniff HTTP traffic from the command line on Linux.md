使用Linux命令行嗅探HTTP流量
================================================================================
假设由于某种原因，你需要嗅探HTTP站点的流量（如HTTP请求与响应）。举个例子，你可能在测试一个web服务器的实验性功能，或者你在　为某个web应用或RESTful服务排错，又或者你正在为PAC排错或寻找从一个站点上下载的恶意软件。不论什么原因，在这些情况下，进行HTTP流量嗅探对于系统管理、开发者、甚至最终用户来说都是很有帮助的。

数据包嗅工具tcpdump被广泛用于，你需要设置过滤规则来捕获HTTP流量，甚至它的原始输出通常不能方便的停在HTTP协议层。实时web服务器日志解析如ngxtop提供可读的实时web流量跟踪痕迹，但这适用于可完全访问live web服务器日志的情况。

要是有一个仅能抓取HTTP流量的类tcpdump的数据包嗅探工具就非常好了。事实上，[httpry][4]就是:**HTTP 包嗅探工具**。httpry捕获HTTP数据包，并且将HTTP协议层的数据内容以可读形式列举出来。通这篇指文章，让我们了解如何使用httpry工具嗅探HTTP流量。

###在Linux上安装httpry###

在基于Debian系统（Ubuntu 或 Linux Mint）,基础仓库中没有httpry安装包。所以我们需要通过源码安装:

    $ sudo apt-get install gcc make git libpcap0.8-dev
    $ git clone https://github.com/jbittel/httpry.git
    $ cd httpry
    $ make
    $ sudo make install
    
在Fedora，CentOS 或　RHEL系统，可以使用如下yum命令安装httpry。在CentOS/RHEL系统上，运行yum之前使能[EPEL repo][5]。

    $ sudo yum install httpry 
    
如果逆向通过源码来构httpry的话，你可以通过这几个步骤实现：

    $ sudo yum install gcc make git libpcap-devel
    $ git clone https://github.com/jbittel/httpry.git
    $ cd httpry
    $ make
    $ sudo make install 
    
###httpry的基本用法###

