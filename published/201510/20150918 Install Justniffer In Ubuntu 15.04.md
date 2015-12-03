在 Ubuntu 15.04 上安装 Justniffer
================================================================================
### 简介 ###
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/09/monitoring1.jpg)

[Justniffer][1] 是一个可用于替代 Snort 的网络协议分析器。它非常流行，可交互式地跟踪/探测一个网络连接。它能从实时环境中抓取流量，支持 “lipcap” 和 “tcpdump” 文件格式。它可以帮助用户分析一个用 wireshark 难以抓包的复杂网络。尤其是它可以有效的帮助你分析应用层流量，能提取类似图像、脚本、HTML 等 http 内容。Justniffer 有助于理解不同组件之间是如何通信的。

### 功能 ###

Justniffer 可以收集一个复杂网络的所有流量而不影响系统性能，这是 Justniffer 的一个优势，它还可以保存日志用于之后的分析，Justniffer 其它一些重要功能包括：

1. 可靠的 TCP 流重建

	它可以使用主机 Linux 内核的一部分用于记录并重现 TCP 片段和 IP 片段。

2. 日志

	保存日志用于之后的分析，并能自定义保存内容和时间。

3. 可扩展

	可以通过外部的 python、 perl 和 bash 脚本扩展来从分析报告中获取一些额外的结果。

4. 性能管理

	基于连接时间、关闭时间、响应时间或请求时间等提取信息。

### 安装 ###

Justniffer 可以通过 PPA 安装：

运行下面命令添加库：

    $ sudo add-apt-repository ppa:oreste-notelli/ppa

更新系统：

    $ sudo apt-get update

安装 Justniffer 工具：

    $ sudo apt-get install justniffer

make 的时候失败了，然后我运行下面的命令并尝试重新安装服务

    $ sudo apt-get -f install

### 示例 ###

首先用 -v 选项验证安装的 Justniffer 版本，你需要用超级用户权限来使用这个工具。

    $ sudo justniffer -V

示例输出：

![j](http://www.unixmen.com/wp-content/uploads/2015/09/j.png)

**1、 以类似 apache 的格式导出 eth1 接口流量，显示到终端**

    $ sudo  justniffer -i eth1

示例输出：

![Selection_001](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0013.png)

**2、 可以用下面的选项跟踪正在运行的 tcp 流**

    $ sudo  justniffer -i eth1 -r

示例输出：

![Selection_002](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0023.png)

**3、 获取 web 服务器的响应时长**

    $ sudo justniffer -i eth1 -a " %response.time"

示例输出：

![Selection_003](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0033.png)

**4、 使用 Justniffer 读取一个 tcpdump 抓取的文件**

首先，用 tcpdump 抓取流量。

    $ sudo tcpdump -w /tmp/file.cap -s0 -i eth0

然后用 Justniffer 访问数据

    $ justniffer -f file.cap

示例输出：

![Selection_005](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0056.png)

**5、 只抓取 http 数据**

    $ sudo justniffer -i eth1 -r -p "port 80 or port 8080"

示例输出：

![Selection_006](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0064.png)

**6、  获取一个指定主机 http 数据**

    $ justniffer -i eth1 -r -p "host 192.168.1.250 and tcp port 80"

示例输出：

![Selection_007](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0074.png)

**7、 以更精确的格式抓取数据**

当你输入 **justniffer -h** 的时候你可以看到很多用于以更精确的方式获取数据的格式关键字

    $ justniffer -h

示例输出：

![Selection_008](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0083.png)

让我们用 Justniffer 根据预先定义的参数提取数据

    $ justniffer -i eth1 -l "%request.timestamp %request.header.host %request.url %response.time"

示例输出：

![Selection_009](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0094.png)

其中还有很多你可以探索的选项。

### 总结 ###

Justniffer 是一个很好的用于网络测试的工具。在我看来对于那些用 Snort 来进行网络探测的用户来说，Justniffer 是一个更简单的工具。它提供了很多 **格式关键字** 用于按照你的需要精确地提取数据。你可以用 .cap 文件格式记录网络信息，之后用于分析监视网络服务性能。

**参考资料：**

- [Justniffer 官网][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-justniffer-ubuntu-15-04/

作者：[Rajneesh Upadhyay][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/rajneesh/
[1]:http://sourceforge.net/projects/justniffer/?source=directory
[2]:http://justniffer.sourceforge.net/