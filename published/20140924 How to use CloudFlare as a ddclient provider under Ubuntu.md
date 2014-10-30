Ubuntu下使用CloudFlare 动态域名
================================================================================

### 需求 ###

首先保证你有一个自有域名，然后登录到CloudFlare，添加你的域名。遵循指令操作，使用它给出的默认值就行了。你将让CloudFlare来托管你的域，所以你需要调整你的注册机构的设置。如果你想要使用子域名，请为它添加一条‘A’记录。目前，任何IP地址都可以。

DDclient是一个Perl客户端，用于更新动态DNS网络服务提供商帐号下的动态DNS条目。它最初是由保罗·巴利编写的，现在大多数是由维姆潘科在做。它能做的不仅仅是动态DNS，也可以通过几种不同的方式获取你的WAN口IP地址。

CloudFlare 的一个功能是它允许你通过API或叫做ddclient的命令行脚本更新你的DNS记录。不管哪一个，结果都一样，而且它是个免费软件。

不幸的是，ddclient并不能在CloudFlare中即开即用。它需要打补丁，这里就是要介绍怎样在Debian或Ubuntu上破解它，它也能在带有Raspberry Pi的Raspbian上工作。

### 在Ubuntu上安装ddclient ###

打开终端，并运行以下命令

    sudo apt-get install ddclient

现在，你需要使用以下命令来安装补丁

    sudo apt-get install curl sendmail libjson-any-perl libio-socket-ssl-perl

    curl -O http://blog.peter-r.co.uk/uploads/ddclient-3.8.0-cloudflare-22-6-2014.patch

    sudo patch /usr/sbin/ddclient < ddclient-3.8.0-cloudflare-22-6-2014.patch

以上命令用来完成ddclient的安装和打补丁

### 配置ddclient ###

你需要使用以下命令来编辑ddclient.conf文件

    sudo vi /etc/ddclient.conf

添加以下信息

    ##
    ### CloudFlare (cloudflare.com)
    ###
    ssl=yes
    use=web, web=dyndns
    protocol=cloudflare, \
    server=www.cloudflare.com, \
    zone=domain.com, \
    login=you@email.com, \
    password=api-key \
    host.domain.com

    Comment out:

    #daemon=300

你的 api-key 可以从 CloudFlare帐号页面找到，ssl=yes 可能已经设置，use=web, web=dyndns 表示使用 dyndns 来确定 IP（用于 NAT）。

你已经搞定了。登录到 https://www.cloudflare.com 并检查列出的与你域名对应的IP地址是否与 http://checkip.dyndns.com  列出的相匹配。

使用以下命令来验证你的设置：

    sudo ddclient -daemon=0 -debug -verbose -noquiet

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/how-to-use-cloudflare-as-a-ddclient-provider-under-ubuntu.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
