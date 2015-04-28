在 CentOS 和 RHEL 上安装 Puppet 服务器和客户端
================================================================================
当手中有相当多的机器需要管理的时候，自动化处理冗余又无聊的任务对系统管理员来说就很重要了。很多管理员习惯了自己写脚本模拟复杂软件之间的调度。不幸的是，脚本会过时，脚本的作者会离职，如果不花费巨大精力来维护这些脚本的话，它们早晚会一点儿用也没有。如果能有一个系统，任何人都可以使用、安装工具，不论其受雇于何人，那真是太期待了。目前已有几种系统可以解决这类需求，这篇教程将介绍其中之一——Puppet——的使用方法。

### Puppet 是什么？ ###

Puppet 是一款为 IT 系统管理员和顾问们设计的自动化软件，你可以用它自动化地完成诸如安装应用程序和服务、补丁管理和部署等工作。所有资源的相关配置都以“manifests”的方式保存，单台机器或者多台机器都可以使用。如果你想了解更多内容，Puppet 实验室的网站上有关于 [Puppet 及其工作原理][1]的更详细的介绍。

### 本教程要做些什么？ ###

在这篇教程里，我们将一起安装配置一个 Puppet 服务器，然后在我们的客户端服务器（译注：这里的“客户端服务器”指需要部署业务逻辑的服务器）上完成一些基本配置。

### 准备工作 ###

由于 Puppet 不是 CentOS 或 RHEL 发行版的基本仓库，所以我们得手动添加 Puppet 实验室提供的自定义仓库。在所有你想使用 Puppet 的地方执行以下命令安装这个仓库（版本不同，对应的 RPM 文件名可能略有不同）。

**对于 CentOS/RHEL 6.5:**

    # rpm -ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs-release-6-10.noarch.rpm

**对于 CentOS/RHEL 7:**

     # rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-10.noarch.rpm

### 安装服务器端 ###

在你打算用作 master 的服务器上安装 "puppet-server" 包。

    # yum install puppet-server

安装完成后，设置 Puppet 服务器开机自动启动，然后启动它。

    # chkconfig puppetmaster on
    # service puppetmaster start

现在服务器已经运行起来了，我们试试看我们的网络能不能访问到它。

对于使用 iptables 当做防火墙的 CentOS/RHEL 6，在 `/etc/sysconfig/iptables` 文件的 `OUTPUT ACCEPT` 小节里添加下面这一行。

> -A INPUT -m state --state NEW -m tcp -p tcp --dport 8140 -j ACCEPT

重新启动 iptables 服务让刚才的修改生效。

    # service iptables restart

在安装了防火墙的 CentOS/RHEL 7 上，我们这么做：

    # firewall-cmd --permanent --zone=public --add-port=8140/tcp
    # firewall-cmd --reload

### 安装客户端 ###

执行下面的命令，在客户端节点安装 Puppet 客户端。

    # yum install puppet

安装完成后，确保 Puppet 会随开机自动启动。

    # chkconfig puppet on

Puppet 客户端需要知道 Puppet master 服务器的地址。最佳方案是使用 DNS 服务器解析 Puppet master 服务器地址。如果你没有 DNS 服务器，在 `/etc/hosts` 里添加类似下面这几行也可以：

> 1.2.3.4 server.your.domain

> 2.3.4.5 client-node.your.domain

1.2.3.4 对应你的 Puppet master 服务器 IP 地址，“server.your.domain”是你的 master 服务器域名（默认通常是服务器的 hostname），“client-node.your.domain”是你的客户端节点。包括 Puppet master 和客户端，所有相关的服务器都要在 hosts 文件里配置。

完成这些设置之后，我们要让 Puppet 客户端知道它的 master 是谁。默认情况下，Puppet 会查找名为“puppet”的服务器，但通常这并不符合你网络环境的真实情况，所以我们要改成 Pupper master 服务器的完整域名。打开文件 `/etc/sysconfig/puppet`，把 `PUPPET_SERVER` 变量的值改成你在 `/etc/hosts` 文件里指定的 Puppet master 服务器的域名。

> PUPPET_SERVER=server.your.domain

master 服务器名也要在 `/etc/puppet/puppet.conf` 文件的“[agent]”小节里事先定义好。

> server=server.your.domain

现在可以启动 Puppet 客户端了：

    # service puppet start

强制我们的客户端在 Puppet master 服务器上登记：

    # puppet agent --test

你会看到类似于下面的输出。别怕，这是正常现象，因为服务器还没有在 Puppet master 服务器上验证过。

> Exiting; no certificate found and waitforcert is disabled

返回 Puppet master 服务器，检查证书验证请求：

    # puppet cert list

你应该能看到一个列出了所有向 Puppet master 服务器发起证书签名请求的服务器。找到你客户端服务器的 hostname 然后使用下面的命令签名（client-node 是你客户端节点的域名）：

    # puppet cert sign client-node

到此为止 Puppet 客户端和服务器都正常工作了。恭喜你！但是，现在 Puppet master 没有任何要客户端做的事儿。好吧，我们来创建一些基本的 manifest 文件然后让我们的客户端节点安装一些基本工具。

回到你的 Puppet 服务器，确保目录 `/etc/puppet/manifests` 存在。

    # mkdir -p /etc/puppet/manifests

创建 manifest 文件 `/etc/puppet/manifests/site.pp`，内容如下

    node 'client-node' {
            include custom_utils
    }

    class custom_utils {
            package { ["nmap","telnet","vim-enhanced","traceroute"]:
                    ensure => latest,
                    allow_virtual => false,
            }
    }

然后重新启动 puppetmaster 服务。

    # service puppetmaster restart

客户端默认每 30 分钟更新一次配置，如果你希望你的修改能强制生效，就在客户端执行如下命令：

    # puppet agent -t

如果你需要修改客户端的默认刷新时间，编辑客户端节点的 `/etc/puppet/puppet.conf` 文件中“[agent]”小节，增加下面这一行：

> runinterval = <yourtime>

这个选项的值可以是秒（格式比如 30 或者 30s），分钟（30m），小时（6h），天（2d）以及年（5y）。值得注意的是，**0 意味着“立即执行”而不是“从不执行”**。

### 提示和技巧 ###

#### 1. 调试 ####

你免不了会提交错误的配置，然后不得不通过调试判断问题出现在哪儿。一般来说，你要么通过查看日志文件 `/var/log/puppet` 着手解决问题，要么手动执行查看输出：

    # puppet agent -t

使用“-t”选项，你可以看到 Puppet 的详细输出。这条命令还有额外的选项可以帮你定位问题。首先要介绍的选项是：

    # puppet agent -t --debug

debug 选项会显示 Puppet 本次运行时的差不多每一个步骤，这在调试非常复杂的问题时很有用。另一个很有用的选项是：

    # puppet agent -t --noop

这个选项让 puppet 工作在 dry-run（译注：空转模式，不会对真实环境产生影响）模式下，不会应用任何修改。Puppet 只会把其工作内容输出到屏幕上，不会写到磁盘里去。

#### 2. 模块 ####

有时候你需要更复杂的 manifest 文件，在你着手编写它们之前，你有必要花点儿时间浏览一下 [https://forge.puppetlabs.com][2]。Forge 是一个集合了 Puppet 模块的社区，你的问题很可能已经有人解答过了，你能在那儿找到解决问题的模块。如果找不到，那就自己写一个然后提交上去，其他人也能从中获益。

现在，假设你已经找到了一个模块能解决你的问题。怎么把它安装到你的系统中去呢？非常简单，因为 Puppet 已经有了可以直接下载模块的用户界面，只需要执行下面的命令：

    # puppet module install <module_name> --version 0.0.0

<module_name> 是你选择的模块的名字，版本号可选（如果没有指定版本号，默认使用最新的版本）。如果你不记得想安装的模块的名字了，试试下面的命令搜索模块：

    # puppet module search <search_string>

你会得到一个包含 search_string 的列表。

    # puppet module search apache

----------

    Notice: Searching https://forgeapi.puppetlabs.com ...
    NAME                               DESCRIPTION                                                                                         AUTHOR          KEYWORDS
    example42-apache                   Puppet module for apache                                                                            @example42      example42, apache
    puppetlabs-apache                  Puppet module for Apache                                                                            @puppetlabs     apache web httpd centos rhel ssl wsgi proxy
    theforeman-apache                  Apache HTTP server configuration                                                                    @theforeman     foreman apache httpd DEPRECATED

如果你想查看已经安装了哪些模块，键入：

    # puppet module list

### 总结 ###

到目前为止，你应该有了功能完整的可以向一个或多个客户端服务器推送基本配置的 Puppet master 服务器。你可以自己随便加点儿配置适配你自己的网络环境。不必为试用 Puppet 担心，你会发现，它会拯救你的生活。

Puppet 实验室正在试着维护一个质量上乘的项目文档，所以如果你想学点儿关于 Puppet 相关的配置，我强烈推荐你访问 Puppet 项目的主页 [http://docs.puppetlabs.com][3]。

如果你有任何问题，敬请在文章下方评论，我会尽我所能回答你并给你建议。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/install-puppet-server-client-centos-rhel.html

作者：[Jaroslav Štěpánek][a]
译者：[sailing](https://github.com/sailing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/jaroslav
[1]:https://puppetlabs.com/puppet/what-is-puppet/
[2]:https://forge.puppetlabs.com/
[3]:http://docs.puppetlabs.com/
