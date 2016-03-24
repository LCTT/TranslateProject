如何在 Ubuntu 15.04 中安装 puppet
================================================================================

大家好，本教程将学习如何在 ubuntu 15.04 上面安装 puppet，它可以用来管理你的服务器基础环境。puppet 是由puppet 实验室（Puppet Labs）开发并维护的一款开源的配置管理软件，它能够帮我们自动化供给、配置和管理服务器的基础环境。不管我们管理的是几个服务器还是数以千计的计算机组成的业务报表体系，puppet 都能够使管理员从繁琐的手动配置调整中解放出来，腾出时间和精力去提系统的升整体效率。它能够确保所有自动化流程作业的一致性、可靠性以及稳定性。它让管理员和开发者更紧密的联系在一起，使开发者更容易产出付出设计良好、简洁清晰的代码。puppet 提供了配置管理和数据中心自动化的两个解决方案。这两个解决方案分别是 **puppet 开源版** 和 **puppet 企业版**。puppet 开源版以 Apache 2.0 许可证发布，它是一个非常灵活、可定制的解决方案，设置初衷是帮助管理员去完成那些重复性操作工作。pupprt 企业版是一个全平台复杂 IT 环境下的成熟解决方案，它除了拥有开源版本所有优势以外还有移动端 apps、只有商业版才有的加强支持，以及模块化和集成管理等。Puppet 使用 SSL 证书来认证主控服务器与代理节点之间的通信。

本教程将要介绍如何在运行 ubuntu 15.04 的主控服务器和代理节点上面安装开源版的 puppet。在这里，我们用一台服务器做主控服务器（master），管理和控制剩余的当作 puppet 代理节点（agent node）的服务器，这些代理节点将依据主控服务器来进行配置。在 ubuntu 15.04 只需要简单的几步就能安装配置好 puppet，用它来管理我们的服务器基础环境非常的方便。（LCTT 译注：puppet 采用 C/S 架构，所以必须有至少有一台作为服务器，其他作为客户端处理）

### 1.设置主机文件 ###

在本教程里，我们将使用2台运行 ubuntu 15.04 “Vivid Vervet" 的主机，一台作为主控服务器，另一台作为 puppet 的代理节点。下面是我们将用到的服务器的基础信息。

-	puupet 主控服务器 IP：44.55.88.6 ，主机名： puppetmaster
- puppet 代理节点 IP： 45.55.86.39 ，主机名： puppetnode

我们要在代理节点和服务器这两台机器的 hosts 文件里面都添加上相应的条目，使用 root 或是 sudo 访问权限来编辑 /etc/hosts 文件，命令如下：
  
    # nano /etc/hosts

    45.55.88.6 puppetmaster.example.com puppetmaster
    45.55.86.39 puppetnode.example.com puppetnode

注意，puppet 主控服务器必使用 8140 端口来运行，所以请务必保证开启8140端口。

### 2. 用 NTP 更新时间 ###

puppet 代理节点所使用系统时间必须要准确，这样可以避免代理证书出现问题。如果有时间差异，那么证书将过期失效，所以服务器与代理节点的系统时间必须互相同步。我们使用 NTP（Network Time Protocol，网络时间协议）来同步时间。**在服务器与代理节点上面分别**运行以下命令来同步时间。
  
    # ntpdate pool.ntp.org

    17 Jun 00:17:08 ntpdate[882]: adjust time server 66.175.209.17 offset -0.001938 sec    

（LCTT 译注：显示类似的输出结果表示运行正常）

如果没有安装 ntp，请使用下面的命令更新你的软件仓库，安装并运行ntp服务

    # apt-get update && sudo apt-get -y install ntp ; service ntp restart

### 3. 安装主控服务器软件 ###

安装开源版本的 puppet 有很多的方法。在本教程中我们在 puppet 实验室官网下载一个名为 puppetlabs-release 的软件包的软件源，安装后它将为我们在软件源里面添加 puppetmaster-passenger。puppetmaster-passenger 包括带有 apache 的 puppet 主控服务器。我们开始下载这个软件包：

    # cd /tmp/
    # wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb

    --2015-06-17 00:19:26-- https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    Resolving apt.puppetlabs.com (apt.puppetlabs.com)... 192.155.89.90, 2600:3c03::f03c:91ff:fedb:6b1d
    Connecting to apt.puppetlabs.com (apt.puppetlabs.com)|192.155.89.90|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7384 (7.2K) [application/x-debian-package]
    Saving to: ‘puppetlabs-release-trusty.deb’

    puppetlabs-release-tr 100%[===========================>] 7.21K --.-KB/s in 0.06s

    2015-06-17 00:19:26 (130 KB/s) - ‘puppetlabs-release-trusty.deb’ saved [7384/7384]

下载完成，我们来安装它：

    # dpkg -i puppetlabs-release-trusty.deb

    Selecting previously unselected package puppetlabs-release.
    (Reading database ... 85899 files and directories currently installed.)
    Preparing to unpack puppetlabs-release-trusty.deb ...
    Unpacking puppetlabs-release (1.0-11) ...
    Setting up puppetlabs-release (1.0-11) ...

使用 apt 包管理命令更新一下本地的软件源：

    # apt-get update

现在我们就可以安装 puppetmaster-passenger 了 

    # apt-get install puppetmaster-passenger

**提示**: 在安装的时候可能会报错：

	Warning: Setting templatedir is deprecated.see http://links.puppetlabs.com/env-settings-deprecations (at /usr/lib/ruby/vendor_ruby/puppet/settings.rb:1139:in `issue_deprecation_warning')
	
不过不用担心，忽略掉它就好，我们只需要在设置配置文件的时候把这一项禁用就行了。

如何来查看puppet 主控服务器是否已经安装成功了呢？非常简单，只需要使用下面的命令查看它的版本就可以了。
  
    # puppet --version

    3.8.1

现在我们已经安装好了 puppet 主控服务器。因为我们使用的是配合 apache 的 passenger，由 apache 来控制 puppet 主控服务器，当 apache 运行时 puppet 主控才运行。

在开始之前，我们需要通过停止 apache 服务来让 puppet 主控服务器停止运行。

    # systemctl stop apache2

### 4. 使用 Apt 工具锁定主控服务器的版本 ###

现在已经安装了 3.8.1 版的 puppet，我们锁定这个版本不让它随意升级，因为升级会造成配置文件混乱。 使用 apt 工具来锁定它，这里我们需要使用文本编辑器来创建一个新的文件 **/etc/apt/preferences.d/00-puppet.pref** 

    # nano /etc/apt/preferences.d/00-puppet.pref

在新创建的文件里面添加以下内容：
  
    # /etc/apt/preferences.d/00-puppet.pref
    Package: puppet puppet-common puppetmaster-passenger
    Pin: version 3.8*
    Pin-Priority: 501

这样在以后的系统软件升级中， puppet 主控服务器将不会跟随系统软件一起升级。

### 5. 配置 Puppet 主控服务器###

Puppet 主控服务器作为一个证书发行机构，需要生成它自己的证书，用于签署所有代理的证书的请求。首先我们要删除所有在该软件包安装过程中创建出来的 ssl 证书。本地默认的 puppet 证书放在 /var/lib/puppet/ssl。因此我们只需要使用 rm 命令来整个移除这些证书就可以了。
  
    # rm -rf /var/lib/puppet/ssl

现在来配置该证书，在创建 puppet 主控服务器证书时，我们需要包括代理节点与主控服务器沟通所用的每个 DNS  名称。使用文本编辑器来修改服务器的配置文件 puppet.conf 

    # nano /etc/puppet/puppet.conf

输出的结果像下面这样

    [main]
    logdir=/var/log/puppet
    vardir=/var/lib/puppet
    ssldir=/var/lib/puppet/ssl
    rundir=/var/run/puppet
    factpath=$vardir/lib/facter
    templatedir=$confdir/templates

    [master]
    # These are needed when the puppetmaster is run by passenger
    # and can safely be removed if webrick is used.
    ssl_client_header = SSL_CLIENT_S_DN
    ssl_client_verify_header = SSL_CLIENT_VERIFY

在这我们需要注释掉 templatedir 这行使它失效。然后在文件的 `[main]` 小节的结尾添加下面的信息。
  
    server = puppetmaster
    environment = production
    runinterval = 1h
    strict_variables = true
    certname = puppetmaster
    dns_alt_names = puppetmaster, puppetmaster.example.com

还有很多你可能用的到的配置选项。 如果你有需要，在 Puppet 实验室有一份详细的描述文件供你阅读： [Main Config File (puppet.conf)][1]。

编辑完成后保存退出。

使用下面的命令来生成一个新的证书。

    # puppet master --verbose --no-daemonize

    Info: Creating a new SSL key for ca
    Info: Creating a new SSL certificate request for ca
    Info: Certificate Request fingerprint (SHA256): F6:2F:69:89:BA:A5:5E:FF:7F:94:15:6B:A7:C4:20:CE:23:C7:E3:C9:63:53:E0:F2:76:D7:2E:E0:BF:BD:A6:78
    ...
    Notice: puppetmaster has a waiting certificate request
    Notice: Signed certificate request for puppetmaster
    Notice: Removing file Puppet::SSL::CertificateRequest puppetmaster at '/var/lib/puppet/ssl/ca/requests/puppetmaster.pem'
    Notice: Removing file Puppet::SSL::CertificateRequest puppetmaster at '/var/lib/puppet/ssl/certificate_requests/puppetmaster.pem'
    Notice: Starting Puppet master version 3.8.1
    ^CNotice: Caught INT; storing stop
    Notice: Processing stop

至此，证书已经生成。一旦我们看到 **Notice: Starting Puppet master version 3.8.1**，就表明证书就已经制作好了。我们按下 CTRL-C 回到 shell 命令行。

查看新生成证书的信息，可以使用下面的命令。

    # puppet cert list -all

    + "puppetmaster" (SHA256) 33:28:97:86:A1:C3:2F:73:10:D1:FB:42:DA:D5:42:69:71:84:F0:E2:8A:01:B9:58:38:90:E4:7D:B7:25:23:EC (alt names: "DNS:puppetmaster", "DNS:puppetmaster.example.com")

### 6. 创建一个 Puppet 清单 ###

默认的主要清单（Manifest）是 /etc/puppet/manifests/site.pp。 这个主要清单文件包括了用于在代理节点执行的配置定义。现在我们来创建一个清单文件：

    # nano /etc/puppet/manifests/site.pp

在刚打开的文件里面添加下面这几行：

    # execute 'apt-get update'
    exec { 'apt-update': # exec resource named 'apt-update'
    command => '/usr/bin/apt-get update' # command this resource will run
    }

    # install apache2 package
    package { 'apache2':
    require => Exec['apt-update'], # require 'apt-update' before installing
    ensure => installed,
    }

    # ensure apache2 service is running
    service { 'apache2':
    ensure => running,
    }

以上这几行的意思是给代理节点部署 apache web 服务。

### 7. 运行 puppet 主控服务 ###

已经准备好运行 puppet 主控服务器 了，那么开启 apache 服务来让它启动

    # systemctl start apache2

我们 puppet 主控服务器已经运行，不过它还不能管理任何代理节点。现在我们给 puppet 主控服务器添加代理节点.

**提示**: 如果报错

	Job for apache2.service failed. see "systemctl status apache2.service" and "journalctl -xe" for details.
	
肯定是 apache 服务器有一些问题，我们可以使用 root 或是 sudo 访问权限来运行**apachectl start**查看它输出的日志。在本教程执行过程中, 我们发现一个 **/etc/apache2/sites-enabled/puppetmaster.conf** 的证书配置问题。修改其中的**SSLCertificateFile /var/lib/puppet/ssl/certs/server.pem **为  **SSLCertificateFile /var/lib/puppet/ssl/certs/puppetmaster.pem**，然后注释掉后面这行**SSLCertificateKeyFile** 。然后在命令行重新启动 apache。

### 8. 安装 Puppet 代理节点的软件包 ###

我们已经准备好了 puppet 的服务器，现在需要一个可以管理的代理节点，我们将安装 puppet 代理软件到节点上去。这里我们要给每一个需要管理的节点安装代理软件，并且确保这些节点能够通过 DNS 查询到服务器主机。下面将 安装最新的代理软件到 节点 puppetnode.example.com 上。

在代理节点上使用下面的命令下载 puppet 实验室提供的软件包：
  
    # cd /tmp/
    # wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb\

    --2015-06-17 00:54:42-- https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    Resolving apt.puppetlabs.com (apt.puppetlabs.com)... 192.155.89.90, 2600:3c03::f03c:91ff:fedb:6b1d
    Connecting to apt.puppetlabs.com (apt.puppetlabs.com)|192.155.89.90|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7384 (7.2K) [application/x-debian-package]
    Saving to: ‘puppetlabs-release-trusty.deb’

    puppetlabs-release-tr 100%[===========================>] 7.21K --.-KB/s in 0.04s

    2015-06-17 00:54:42 (162 KB/s) - ‘puppetlabs-release-trusty.deb’ saved [7384/7384]

在 ubuntu 15.04 上我们使用debian包管理系统来安装它，命令如下：
  
    # dpkg -i puppetlabs-release-trusty.deb

使用 apt 包管理命令更新一下本地的软件源：
  
    # apt-get update

通过远程仓库安装：

    # apt-get install puppet

Puppet 代理默认是不启动的。这里我们需要使用文本编辑器修改 /etc/default/puppet 文件，使它正常工作：

    # nano /etc/default/puppet

更改 **START** 的值改成 "yes" 。

    START=yes

最后保存并退出。

### 9. 使用 Apt 工具锁定代理软件的版本 ###

和上面的步骤一样为防止随意升级造成的配置文件混乱，我们要使用 apt 工具来把它锁定。具体做法是使用文本编辑器创建一个文件 **/etc/apt/preferences.d/00-puppet.pref** 

    # nano /etc/apt/preferences.d/00-puppet.pref

在新建的文件里面加入如下内容

    # /etc/apt/preferences.d/00-puppet.pref
    Package: puppet puppet-common
    Pin: version 3.8*
    Pin-Priority: 501

这样 puppet 就不会随着系统软件升级而随意升级了。

### 10. 配置 puppet 代理节点 ###

我们需要编辑一下代理节点的 puppet.conf 文件，来使它运行。

    # nano /etc/puppet/puppet.conf

它看起来和服务器的配置文件完全一样。同样注释掉**templatedir**这行。不同的是在这里我们需要删除掉所有关于`[master]` 的部分。

假定主控服务器可以通过名字“puppet-master”访问，我们的客户端应该可以和它相互连接通信。如果不行的话，我们需要使用完整的主机域名 puppetmaster.example.com

    [agent]
    server = puppetmaster.example.com
    certname = puppetnode.example.com

在文件的结尾增加上面3行，增加之后文件内容像下面这样：

    [main]
    logdir=/var/log/puppet
    vardir=/var/lib/puppet
    ssldir=/var/lib/puppet/ssl
    rundir=/var/run/puppet
    factpath=$vardir/lib/facter
    #templatedir=$confdir/templates

    [agent]
    server = puppetmaster.example.com
    certname = puppetnode.example.com

最后保存并退出。

使用下面的命令来启动客户端软件：

    # systemctl start puppet

如果一切顺利的话，我们不会看到命令行有任何输出。 第一次运行的时候，代理节点会生成一个 ssl 证书并且给服务器发送一个请求，经过签名确认后，两台机器就可以互相通信了。

**提示**： 如果这是你添加的第一个代理节点，建议你在添加其他节点前先给这个证书签名。一旦能够通过并正常运行，回过头来再添加其他代理节点。

### 11. 在主控服务器上对证书请求进行签名 ###

第一次运行的时候，代理节点会生成一个 ssl 证书并且给服务器发送一个签名请求。在主控服务器给代理节点服务器证书签名之后，主服务器才能和代理服务器通信并且控制代理服务器。

在主控服务器上使用下面的命令来列出当前的证书请求：

    # puppet cert list
    "puppetnode.example.com" (SHA256) 31:A1:7E:23:6B:CD:7B:7D:83:98:33:8B:21:01:A6:C4:01:D5:53:3D:A0:0E:77:9A:77:AE:8F:05:4A:9A:50:B2

因为只设置了一台代理节点服务器，所以我们将只看到一个请求。看起来类似如上，代理节点的完整域名即其主机名。

注意有没有“+”号在前面，代表这个证书有没有被签名。

使用带有主机名的**puppet cert sign**这个命令来签署这个签名请求，如下：

    # puppet cert sign puppetnode.example.com
    Notice: Signed certificate request for puppetnode.example.com
    Notice: Removing file Puppet::SSL::CertificateRequest puppetnode.example.com at '/var/lib/puppet/ssl/ca/requests/puppetnode.example.com.pem'

主控服务器现在可以通讯和控制它签名过的代理节点了。

如果想签署所有的当前请求，可以使用 -all 选项，如下所示：

    # puppet cert sign --all

### 12. 删除一个 Puppet 证书 ###

如果我们想移除一个主机，或者想重建一个主机然后再添加它。下面的例子里我们将展示如何删除 puppet 主控服务器上面的一个证书。使用的命令如下：

    # puppet cert clean hostname
    Notice: Revoked certificate with serial 5
    Notice: Removing file Puppet::SSL::Certificate puppetnode.example.com at '/var/lib/puppet/ssl/ca/signed/puppetnode.example.com.pem'
    Notice: Removing file Puppet::SSL::Certificate puppetnode.example.com at '/var/lib/puppet/ssl/certs/puppetnode.example.com.pem'

如果我们想查看所有的签署和未签署的请求，使用下面这条命令：
    
    # puppet cert list --all
    + "puppetmaster" (SHA256) 33:28:97:86:A1:C3:2F:73:10:D1:FB:42:DA:D5:42:69:71:84:F0:E2:8A:01:B9:58:38:90:E4:7D:B7:25:23:EC (alt names: "DNS:puppetmaster", "DNS:puppetmaster.example.com") 


### 13. 部署 Puppet 清单 ###

当配置并完成 puppet 清单后，现在我们需要部署清单到代理节点服务器上。要应用并加载主 puppet 清单，我们可以在代理节点服务器上面使用下面的命令：

    # puppet agent --test

    Info: Retrieving pluginfacts
    Info: Retrieving plugin
    Info: Caching catalog for puppetnode.example.com
    Info: Applying configuration version '1434563858'
    Notice: /Stage[main]/Main/Exec[apt-update]/returns: executed successfully
    Notice: Finished catalog run in 10.53 seconds

这里向我们展示了主清单如何立即影响到了一个单一的服务器。

如果我们打算运行的 puppet 清单与主清单没有什么关联，我们可以简单使用 puppet apply 带上相应的清单文件的路径即可。它仅将清单应用到我们运行该清单的代理节点上。
    
    # puppet apply /etc/puppet/manifest/test.pp

### 14. 为特定节点配置清单 ###

如果我们想部署一个清单到某个特定的节点，我们需要如下配置清单。

在主控服务器上面使用文本编辑器编辑 /etc/puppet/manifest/site.pp：
    
    # nano /etc/puppet/manifest/site.pp

添加下面的内容进去

    node 'puppetnode', 'puppetnode1' {
    # execute 'apt-get update'
    exec { 'apt-update': # exec resource named 'apt-update'
    command => '/usr/bin/apt-get update' # command this resource will run
    }

    # install apache2 package
    package { 'apache2':
    require => Exec['apt-update'], # require 'apt-update' before installing
    ensure => installed,
    }

    # ensure apache2 service is running
    service { 'apache2':
    ensure => running,
    }
    }

这里的配置显示我们将在名为 puppetnode 和 puppetnode1 的2个指定的节点上面安装 apache 服务。这里可以添加其他我们需要安装部署的具体节点进去。

### 15. 配置清单模块 ###

模块对于组合任务是非常有用的，在 Puppet 社区有很多人贡献了自己的模块组件。

在主控服务器上, 我们将使用 puppet module 命令来安装 **puppetlabs-apache** 模块。

    # puppet module install puppetlabs-apache

**警告**: 千万不要在一个已经部署 apache 环境的机器上面使用这个模块，否则它将清空你没有被 puppet 管理的 apache 配置。

现在用文本编辑器来修改 **site.pp** ：

    # nano /etc/puppet/manifest/site.pp

添加下面的内容进去，在 puppetnode 上面安装 apache 服务。

    node 'puppet-node' {
    class { 'apache': } # use apache module
    apache::vhost { 'example.com': # define vhost resource
    port => '80',
    docroot => '/var/www/html'
    }
    }

保存退出。然后重新运行该清单来为我们的代理节点部署 apache 配置。

### 总结 ###

现在我们已经成功的在 ubuntu 15.04 上面部署并运行 puppet 来管理代理节点服务器的基础运行环境。我们学习了puppet 是如何工作的，编写清单文件，节点与主机间使用 ssl 证书认证的认证过程。使用 puppet 开源软件配置管理工具在众多的代理节点上来控制、管理和配置重复性任务是非常容易的。如果你有任何的问题，建议，反馈，与我们取得联系，我们将第一时间完善更新，谢谢。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-puppet-ubuntu-15-04/

作者：[Arun Pyasi][a]
译者：[ivo-wang](https://github.com/ivo-wang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://docs.puppetlabs.com/puppet/latest/reference/config_file_main.html
