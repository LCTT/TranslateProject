使用Linux命令行管理DigitalOcean VPS水滴
================================================================================
[DigitalOcean][1]是云VPS主机市场中最炙手可热的新生儿。虽然没有提供像Amazon之类一样的综合服务业务，但DigitalOcean定位于中小型企业和开发者，已经成为基于Linux的最佳云VPS服务的强有力竞争者，这都得归功于它们具有竞争力的价格和用户友好的管理界面。

![](https://farm4.staticflickr.com/3841/14501627500_2ef275ac1c_z.jpg)

不管什么时候，当你需要一个面向网络的服务器用于你的个人项目，你都可以全速开动一个“水滴”（[DigitalOcean][3]中VPS实例的昵称），也可以在你不需要时杀掉它，没必要为了让你的VPS保持运作而烧光了你的钱袋。尽管DigitalOcean基于网络的管理界面已经十分高效，但对于那些命令行界面的死忠派，它还是提供了基于命令行界面的水滴管理工具，它叫[tugboat][4]。多亏了这个命令行工具，所有复杂的水滴管理任务都可以简单地转变成一个脚本来完成。

在本文中，我打算讲述**怎样使用tugboat来从命令行对DigitalOcean水滴进行管理**。

### 在Linux上安装tugboat ###

在Debian，Ubuntu或者Linux Mint上安装tugboat：

    $ sudo apt-get install ruby-dev
    $ sudo gem install tugboat 

在Fedora上安装tugboat：

    $ sudo yum install ruby-devel
    $ sudo gem install tugboat 

要在CentOS上安装tugboat，首先[安装或升级到最新的Ruby][5]，因为在CentOS 6.5以及更早的版本上，默认的Ruby不满足Tugboat所需的最小版本（1.9及更高版本）。安装Ruby 1.9及更高版本后，请按如下方式安装tugboat。

    $ sudo gem install tugboat 

### tugboat首次使用配置 ###

在安装完后，就该进行一次配置，其中包括授权tugboat访问DigitalOcean帐号。

转到[https://cloud.digitalocean.com/api_access][6]，并创建新的API密钥，记录客户ID和API密钥。

![](https://farm4.staticflickr.com/3836/14688299215_fd282a0142_z.jpg)

通过运行以下命令来启动授权过程：

    $ tugboat authorize 

在提示你输入客户ID和API密钥时，请输入。它会询问几个其它问题，目前你可以接受默认的回答。我们将会在后面自定义默认设置。

[![](https://farm6.staticflickr.com/5596/14685122101_dba50fc86b_z.jpg)][7]

现在，让我们自定义默认水滴设置，以反映你典型的使用状况。要做到这一点，首先检查水滴提供的可用设置项（如，可用的镜像、区域、大小）。

运行以下命令，它会列出可用的水滴镜像。选取使用一个默认镜像，并记录相关的ID。

    $ tugboat images --global 

![](https://farm3.staticflickr.com/2900/14688299175_e77e74fa1e_z.jpg)

类似，从可用区域中选取一个默认的地理位置：

    $ tugboat regions

同时，从可用的RAM大小中选择一个默认的水滴大小：

    $ tugboat sizes 

![](https://farm4.staticflickr.com/3858/14501661238_4304e8bdfb_o.png)

现在，把你的默认选择放到~/.tugboat中。例如，我在这里自定义了默认设置：区域在纽约，系统是Ubuntu 14.04，内存512MB。如果你想要通过密钥验证启用SSH，设置“ssh_user”为root，这个我很快会讲到。

    $ vi ~/.tugboat 

----------

    ---
    authentication:
      client_key: XXXXXXXXXXXXXXXXXXX
      api_key: XXXXXXXXXXXXXXXXXXXX
    ssh:
      ssh_user: root
      ssh_key_path: /home/dev/.ssh/id_rsa
      ssh_port: '22'
    defaults:
      region: '4'
      image: '3240036'
      size: '66'
      ssh_key: ''
      private_networking: 'false'
      backups_enabled: 'false'

### 创建并添加SSH密钥到DigitalOcean ###

要访问水滴实例，一个安全的方式是通过[密钥验证][8]的SSH连接到该实例。

事实上，你可以通过使用[DigitalOcean][9]来注册SSH公钥，为你的水滴实现自动启用密钥验证。下面告诉你怎么做。

首先，生成一个公/私密钥对（如果你还没有）。

    $ ssh-keygen -t rsa -C "your@emailaddress.com"

假设生成的密钥对由~/.ssh/id_rsa（私钥）和~/.ssh/id_rsa.pub（公钥）构成，去将你的公钥上传吧，命令如下：

    $ tugboat add-key [name-of-your-key] 

你可以任意给你的密钥命名（如，“my-default-key”）。当出现提示时，输入公钥路径（如，/home/user/.ssh/id_rsa.pub）。在密钥上传完成后，运行以下命令来验证密钥是否正确添加：

    $ tugboat keys 

![](https://farm4.staticflickr.com/3869/14501853397_3d3f4365b1_z.jpg)

密钥也应该出现在DigitalOcean的[SSH密钥页][10]。如果你想要密钥自动使用到水滴中，添加密钥ID到~/.tugboat中。

    ssh_key: '182710'

### Tugboat的基本用法 ###

这里列出了tugboat命令行的一些基本使用情况。

1. 使用默认设置创建新水滴。

    $ tugboat create <name-of-droplet>

2. 列出所有活动水滴。

    $ tugboat droplets

3. 显示水滴的信息。

    $ tugboat info <name-of-droplet> 

[![](https://farm6.staticflickr.com/5593/14501627440_5835506d2a_z.jpg)][11]

4. 关闭水滴，并移除镜像。

    $ tugboat destroy <name-of-droplet>

5. 关闭水滴，但保持镜像

    $ tugboat halt <name-of-droplet>

6. 为水滴创建快照，水滴必须先关闭。

    $ tugboat snapshot <snapshot-name> <name-of-droplet>

7. 调整水滴大小（增加或减少RAM大小），水滴必须先关闭。

    $ tugboat resize <name-of-droplet> -s <image-id> 

如果你想要了解特定命令的更多选项，运行：

    $ tugboat help <command> 

![](https://farm4.staticflickr.com/3900/14688013322_4fa6080c5e_z.jpg)

### 排障 ###

1. 当我运行tugboat命令时，它出现以下错误。

    /usr/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:31:in `gem_original_require': /usr/lib/ruby/gems/1.8/gems/tugboat-0.2.0/lib/tugboat/cli.rb:12: syntax error, unexpected ':', expecting kEND (SyntaxError)

Tugboat要求Ruby 1.9及更高版本，你需要升级Ruby来解决该问题。对于CentOS，请参考[此教程][12]

2. 当我试着用gem来安装Tugboat时，出现了下面的错误。

/usr/local/share/ruby/site_ruby/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- json/pure (LoadError)

安装以下gem来修复该问题。 

    $ sudo gem install json_pure 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/manage-digitalocean-vps-droplets-command-line-linux.html

原文作者：[Dan Nanni][a]

译者：[GOLinux](https://github.com/GOLinux) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:http://news.netcraft.com/archives/2013/12/11/digitalocean-now-growing-faster-than-amazon.html
[3]:http://xmodulo.com/go/digitalocean
[4]:https://github.com/pearkes/tugboat
[5]:http://ask.xmodulo.com/upgrade-ruby-centos.html
[6]:https://cloud.digitalocean.com/api_access
[7]:https://www.flickr.com/photos/xmodulo/14685122101/
[8]:http://xmodulo.com/2012/04/how-to-enable-ssh-login-without.html
[9]:http://xmodulo.com/go/digitalocean
[10]:https://cloud.digitalocean.com/ssh_keys
[11]:https://www.flickr.com/photos/xmodulo/14501627440/
[12]:http://ask.xmodulo.com/upgrade-ruby-centos.html
