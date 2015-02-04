Linux有问必答：如何在Linux上检查SSH的版本
================================================================================
> **Question**：我想到SSH存在1和2两个版本（SSH1和SSH2）。这两者之间有什么不同？还有我该怎么在Linux上检查SSH协议的版本？

安全Shell（SSH）通过加密的安全通信通道来远程登录或者远程执行命令。SSH被设计来替代不安全的明文协议，如telnet、rsh和rlogin。SSH提供了大量需要的特性，如认证、加密、数据完整性、授权和转发/通道。

### SSH1 vs. SSH2 ###

SSH协议规范存在一些小版本的差异，但是有两个主要的大版本：**SSH1** (版本号 1.XX) 和 **SSH2** (版本号 2.00)。

事实上，SSH1和SSH2是两个完全不同互不兼容的协议。SSH2明显地提升了SSH1中的很多方面。首先，SSH是宏设计，几个不同的功能（如：认证、传输、连接）被打包进一个单一的协议，SSH2带来了比SSH1更强大的安全特性，如基于MAC的完整性检查，灵活的会话密钥更新、充分协商的加密算法、公钥证书等等。

SSH2由IETF标准化，且它的实现在业界被广泛部署和接受。由于SSH2对于SSH1的流行和加密优势，许多产品对SSH1放弃了支持。在写这篇文章的时候，OpenSSH仍旧[支持][1]SSH1和SSH2，然而在所有的现代Linux发行版中，OpenSSH服务器默认禁用了SSH1。

### 检查支持的SSH协议版本 ###

#### 方法一 ####

如果你想检查本地OpenSSH服务器支持的SSH协议版本，你可以参考**/etc/ssh/sshd_config**这个文件。用文本编辑器打开/etc/ssh/sshd_config，并且查看"Protocol"字段。

如果如下显示，就代表服务器只支持SSH2。

    Protocol 2

如果如下显示，就代表服务器同时支持SSH1和SSH2。

    Protocol 1,2

#### 方法二 ####

如果因为OpenSSH服务其运行在远端服务器上而你不能访问/etc/ssh/sshd_config。你可以使用叫ssh的SSH客户端来检查支持的协议。具体说来，就是强制ssh使用特定的SSH协议，接着我么查看SSH服务器的响应。

下面的命令强制ssh使用SSH1：

    $ ssh -1 user@remote_server

下面的命令强制ssh使用SSH2：

    $ ssh -2 user@remote_server

如果远程SSH服务器只支持SSH2,那么第一个带“-1”的选项就会出现像下面的错误信息：

    Protocol major versions differ: 1 vs. 2

如果SSH服务器同时支持SSH1和SSH2,那么两个命令都有效。

### 方法三 ###

另一个检查版本的方法是运行SSH扫描工具，叫做[scanssh][2]。这个命令行工具在你想要检查一组IP地址或者整个本地网络来升级SSH1兼容的SSH服务器时很有用。

下面是基本的SSH版本扫描语法。

    $ sudo scanssh -s ssh -n [ports] [IP addresses or CIDR prefix] 

"-n"选项可以指定扫描的SSH端口。你可以用都好分隔来扫描多个端口，不带这个选项，scanssh会默认扫描22端口。

使用下面的命令来发现192.168.1.0/24本地网络中的SSH服务器，并检查SSH协议v版本：

    $ sudo scan -s ssh 192.168.1.0/24 

![](https://farm8.staticflickr.com/7550/15460750074_95f83217a2_b.jpg)

如果scanssh为特定IP地址报告“SSH-1.XX-XXXX”，这暗示着相关的SSH服务器支持的最低版本是SSH1.如果远程服务器只支持SSH2,scanssh会显示“SSH-2.0-XXXX”。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-ssh-protocol-version-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.openssh.com/specs.html
[2]:http://www.monkey.org/~provos/scanssh/