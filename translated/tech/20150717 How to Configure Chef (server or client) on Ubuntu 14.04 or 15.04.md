如何在Ubuntu 14.04/15.04上配置Chef(服务端/客户端)
================================================================================
Chef是对于信息技术专业人员的一款配置管理和自动化工具，它可以配置和管理你的设备无论它在本地还是在云上。它可以用于加速应用部署并协调多个系统管理员和开发人员的工作，涉及到成百甚至上千的服务器和程序来支持大量的客户群。chef最有用的是让设备变成代码。一旦你掌握了Chef，你可以获得一流的网络IT支持来自动化管理你的云端设备或者终端用户。

下面是我们将要在本篇中要设置和配置Chef的主要组件。

![](http://blog.linoxide.com/wp-content/uploads/2015/07/chef.png)

### 安装Chef的要求和版本 ###

我们将在下面的基础环境下设置Chef配置管理系统。

注：表格
<table width="701" style="height: 284px;">
<tbody>
<tr>
<td width="660" colspan="2"><strong>管理和配置工具：Chef</strong></td>
</tr>
<tr>
<td width="220"><strong>基础操作系统</strong></td>
<td width="492">Ubuntu 14.04.1 LTS&nbsp;(x86_64)</td>
</tr>
<tr>
<td width="220"><strong>Chef Server</strong></td>
<td width="492">Version 12.1.0</td>
</tr>
<tr>
<td width="220"><strong>Chef Manage</strong></td>
<td width="492">Version 1.17.0</td>
</tr>
<tr>
<td width="220"><strong>Chef Development Kit</strong></td>
<td width="492">Version 0.6.2</td>
</tr>
<tr>
<td width="220"><strong>内存和CPU</strong></td>
<td width="492">4 GB&nbsp; , 2.0+2.0 GHZ</td>
</tr>
</tbody>
</table>

### Chef服务端的安装和配置 ###

Chef服务端是核心组件，它存储配置以及其他和工作站交互的配置数据。让我们在他们的官网下载最新的安装文件。

我使用下面的命令来下载和安装它。

**1) 下载Chef服务端**

    root@ubuntu-14-chef:/tmp# wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.1.0-1_amd64.deb

**2) 安装Chef服务端**

    root@ubuntu-14-chef:/tmp# dpkg -i chef-server-core_12.1.0-1_amd64.deb

**3) 重新配置Chef服务端**

现在运行下面的命令来启动所有的chef服务端服务，这步也许会花费一些时间，因为它有许多不同一起工作的服务组成来创建一个正常运作的系统。

    root@ubuntu-14-chef:/tmp# chef-server-ctl reconfigure

chef服务端启动命令'chef-server-ctl reconfigure'需要运行两次，这样就会在安装后看到这样的输出。

    Chef Client finished, 342/350 resources updated in 113.71139964 seconds
    opscode Reconfigured!

**4) 重启系统 **

安装完成后重启系统使系统能最好的工作，不然我们或许会在创建用户的时候看到下面的SSL连接错误。

    ERROR: Errno::ECONNRESET: Connection reset by peer - SSL_connect

**5) 创建心的管理员**

运行下面的命令来创建一个新的用它自己的配置的管理员账户。创建过程中，用户的RSA私钥会自动生成并需要被保存到一个安全的地方。--file选项会保存RSA私钥到指定的路径下。

    root@ubuntu-14-chef:/tmp# chef-server-ctl user-create kashi kashi kashi kashif.fareedi@gmail.com kashi123 --filename /root/kashi.pem

### Chef服务端的管理设置 ###

Chef Manage是一个针对企业Chef用户的管理控制台，它启用了可视化的web用户界面并可以管理节点、数据包、规则、环境、配置和基于角色的访问控制（RBAC）

**1) 下载Chef Manage**

从官网复制链接病下载chef manage的安装包。

    root@ubuntu-14-chef:~# wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/opscode-manage_1.17.0-1_amd64.deb

**2) 安装Chef Manage**

使用下面的命令在root的家目录下安装它。

    root@ubuntu-14-chef:~# chef-server-ctl install opscode-manage --path /root

**3) 重启Chef Manage和服务端**

安装完成后我们需要运行下面的命令来重启chef manage和服务端。

    root@ubuntu-14-chef:~# opscode-manage-ctl reconfigure
    root@ubuntu-14-chef:~# chef-server-ctl reconfigure

### Chef Manage网页控制台 ###

我们可以使用localhost访问网页控制台以及fqdn，并用已经创建的管理员登录

![chef amanage](http://blog.linoxide.com/wp-content/uploads/2015/07/5-chef-web.png)

**1) Chef Manage创建新的组织 **

你或许被要求创建新的组织或者接受其他阻止的邀请。如下所示，使用缩写和全名来创建一个新的组织。

![Create Org](http://blog.linoxide.com/wp-content/uploads/2015/07/7-create-org.png)

**2) 用命令行创建心的组织 **

We can also create new Organization from the command line by executing the following command.
我们同样也可以运行下面的命令来创建新的组织。

    root@ubuntu-14-chef:~# chef-server-ctl org-create linux Linoxide Linux Org. --association_user kashi --filename linux.pem

### 设置工作站 ###

我们已经完成安装chef服务端，现在我们可以开始创建任何recipes、cookbooks、属性和其他任何的我们想要对Chef的修改。

**1) 在Chef服务端上创建新的用户和组织 **

为了设置工作站，我们用命令行创建一个新的用户和组织。

    root@ubuntu-14-chef:~# chef-server-ctl user-create bloger Bloger Kashif bloger.kashif@gmail.com bloger123 --filename bloger.pem

    root@ubuntu-14-chef:~# chef-server-ctl org-create blogs Linoxide Blogs Inc. --association_user bloger --filename blogs.pem

**2) 下载工作站入门套件 **

Now Download and Save starter-kit from the chef manage web console on a workstation and use it to work with Chef server.
在工作站的网页控制台中下面并保存入门套件用于与服务端协同工作

![Starter Kit](http://blog.linoxide.com/wp-content/uploads/2015/07/8-download-kit.png)

**3) 点击"Proceed"下载套件 **

![starter kit](http://blog.linoxide.com/wp-content/uploads/2015/07/9-download-kit.png)

### 对于工作站的Chef开发套件设置 ###

Chef开发套件是一款包含所有开发chef所需工具的软件包。它捆绑了由Chef开发的带Chef客户端的工具。

**1) 下载 Chef DK**

We can Download chef development kit from its official web link and choose the required operating system to get its chef development tool kit.
我们可以从它的官网链接中下载开发包，并选择操作系统来得到chef开发包。

![Chef DK](http://blog.linoxide.com/wp-content/uploads/2015/07/10-CDK.png)

复制链接并用wget下载

    root@ubuntu-15-WKS:~# wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.2-1_amd64.deb

**1) Chef开发套件安装**

使用dpkg命令安装开发套件

    root@ubuntu-15-WKS:~# dpkg -i chefdk_0.6.2-1_amd64.deb

**3) Chef DK 验证**

使用下面的命令验证客户端是否已经正确安装。

    root@ubuntu-15-WKS:~# chef verify

----------

    Running verification for component 'berkshelf'
    Running verification for component 'test-kitchen'
    Running verification for component 'chef-client'
    Running verification for component 'chef-dk'
    Running verification for component 'chefspec'
    Running verification for component 'rubocop'
    Running verification for component 'fauxhai'
    Running verification for component 'knife-spork'
    Running verification for component 'kitchen-vagrant'
    Running verification for component 'package installation'
    Running verification for component 'openssl'
    ..............
    ---------------------------------------------
    Verification of component 'rubocop' succeeded.
    Verification of component 'knife-spork' succeeded.
    Verification of component 'openssl' succeeded.
    Verification of component 'berkshelf' succeeded.
    Verification of component 'chef-dk' succeeded.
    Verification of component 'fauxhai' succeeded.
    Verification of component 'test-kitchen' succeeded.
    Verification of component 'kitchen-vagrant' succeeded.
    Verification of component 'chef-client' succeeded.
    Verification of component 'chefspec' succeeded.
    Verification of component 'package installation' succeeded.

**连接Chef服务端**

我们将创建 ~/.chef并从chef服务端复制两个用户和组织的pem文件到chef的文件到这个目录下。

    root@ubuntu-14-chef:~# scp bloger.pem blogs.pem kashi.pem linux.pem root@172.25.10.172:/.chef/

----------

    root@172.25.10.172's password:
    bloger.pem 100% 1674 1.6KB/s 00:00
    blogs.pem 100% 1674 1.6KB/s 00:00
    kashi.pem 100% 1678 1.6KB/s 00:00
    linux.pem 100% 1678 1.6KB/s 00:00

** 编辑配置来管理chef环境 **

现在使用下面的内容创建"~/.chef/knife.rb"。

    root@ubuntu-15-WKS:/.chef# vim knife.rb
    current_dir = File.dirname(__FILE__)

    log_level :info
    log_location STDOUT
    node_name "kashi"
    client_key "#{current_dir}/kashi.pem"
    validation_client_name "kashi-linux"
    validation_key "#{current_dir}/linux.pem"
    chef_server_url "https://172.25.10.173/organizations/linux"
    cache_type 'BasicFile'
    cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
    cookbook_path ["#{current_dir}/../cookbooks"]

创建knife.rb中指定的“~/cookbooks”文件夹。

    root@ubuntu-15-WKS:/# mkdir cookbooks

**测试Knife配置**

运行“knife user list”和“knife client list”来验证knife是否在工作。

    root@ubuntu-15-WKS:/.chef# knife user list

第一次运行的时候可能会得到下面的错误，这是因为工作站上还没有chef服务端的SSL证书。

    ERROR: SSL Validation failure connecting to host: 172.25.10.173 - SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
    ERROR: Could not establish a secure connection to the server.
    Use `knife ssl check` to troubleshoot your SSL configuration.
    If your Chef Server uses a self-signed certificate, you can use
    `knife ssl fetch` to make knife trust the server's certificates.

要从上面的命令中恢复，运行下面的命令来获取ssl整数并重新运行knife user和client list，这时候应该就可以了。

    root@ubuntu-15-WKS:/.chef# knife ssl fetch
    WARNING: Certificates from 172.25.10.173 will be fetched and placed in your trusted_cert
    directory (/.chef/trusted_certs).

    knife没有办法验证这些是有效的证书。你应该在下载时候验证这些证书的真实性。

    在/.chef/trusted_certs/ubuntu-14-chef_test_com.crt下面添加ubuntu-14-chef.test.com的证书。

在上面的命令取得ssl证书后，接着运行下面的命令。

    root@ubuntu-15-WKS:/.chef#knife client list
    kashi-linux

### 与chef服务端交互的新的节点 ###

节点是执行所有设备自动化的chef客户端。因此是时侯添加新的服务端到我们的chef环境下，在配置完chef-server和knife工作站后配置新的节点与chef-server交互。

我们使用下面的命令来添加新的节点与chef服务端工作。

    root@ubuntu-15-WKS:~# knife bootstrap 172.25.10.170 --ssh-user root --ssh-password kashi123 --node-name mydns

----------

    Doing old-style registration with the validation key at /.chef/linux.pem...
    Delete your validation key in order to use your user credentials instead

    Connecting to 172.25.10.170
    172.25.10.170 Installing Chef Client...
    172.25.10.170 --2015-07-04 22:21:16-- https://www.opscode.com/chef/install.sh
    172.25.10.170 Resolving www.opscode.com (www.opscode.com)... 184.106.28.91
    172.25.10.170 Connecting to www.opscode.com (www.opscode.com)|184.106.28.91|:443... connected.
    172.25.10.170 HTTP request sent, awaiting response... 200 OK
    172.25.10.170 Length: 18736 (18K) [application/x-sh]
    172.25.10.170 Saving to: ‘STDOUT’
    172.25.10.170
    100%[======================================>] 18,736 --.-K/s in 0s
    172.25.10.170
    172.25.10.170 2015-07-04 22:21:17 (200 MB/s) - written to stdout [18736/18736]
    172.25.10.170
    172.25.10.170 Downloading Chef 12 for ubuntu...
    172.25.10.170 downloading https://www.opscode.com/chef/metadata?v=12&prerelease=false&nightlies=false&p=ubuntu&pv=14.04&m=x86_64
    172.25.10.170 to file /tmp/install.sh.26024/metadata.txt
    172.25.10.170 trying wget...

之后我们可以在knife节点列表下看到新创建的节点，也会新节点列表下创建新的客户端。

    root@ubuntu-15-WKS:~# knife node list
    mydns

相似地我们只要提供ssh证书通过上面的knife命令来创建多个节点到chef设备上。

### 总结 ###

本篇我们学习了chef管理工具并通过安装和配置设置浏览了它的组件。我希望你在学习安装和配置Chef服务端以及它的工作站和客户端节点中获得乐趣。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-configure-chef-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
