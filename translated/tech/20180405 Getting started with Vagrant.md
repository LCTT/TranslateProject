开始 Vagrant 之旅
=====

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_scale_performance.jpg?itok=R7jyMeQf)
如果你和我一样，你可能在某一个地方有一个“沙盒”，你可以在那里进行你正在做的任何项目。随着时间的推移，沙箱会变得杂乱无章，充斥着各种想法，工具链元素，你不使用的代码模块，以及其他你不需要的东西。当你完成某件事情时，这会使你的部署变得复杂，因为你可能不确定项目的实际依赖关系 - 随着时间推移你在沙盒中已经有了一些工具，但是你忘了必须安装它。你需要一个干净的环境，将所有的依赖关系放在一个地方，以便以后更方便。

或者你可能工作在 DevOps 中，你所服务的开发人员用模糊的依赖关系来编写代码，这使得测试变得更加困难。你需要一种方法来获得一个干净的盒子，将代码放入其中，并通过它运行代码，而且你希望这些环境是一次性的和可重复的。

那么选择 [Vagrant][1] 吧。由 HashiCorp 根据 [MIT License][2] 创建，Vagrant 可充当 VirtualBox, Microsoft Hyper-V 或 Docker 容器的包装器和前端，并且可以通过[许多其他供应商][3]的插件进行扩展。你可以配置 Vagrant 以提供可重复干净的环境，并且已安装需要的基础架构。配置脚本是可移植的，因此，如果你的仓库和 Vagrant 配置脚本位于基于云存储上，那么你只需要很少的限制就可以启动并在多台机器机器上工作。让我们来看一看。

### 安装

对于本次安装，我的环境是 Linux Mint 桌面，版本是 18.3 Cinnamon 64 位，在其他大多数 Debian 派生系统上安装非常类似。在大多数发行版中，对于基于 RPM 的系统也有类似的安装程序。Vagrant 的[安装页面][4]为 Debian, Windows, CentOS, MacOS 和 Arch Linux 都提供下载，但是我在我的软件包管理器中找到了它，所以我在那进行了安装。

最简单的安装使用了 VirtualBox 作为虚拟化提供者，所以我需要安装它：
```
sudo apt-get install virtualbox vagrant

```

安装程序将会获取依赖项 - 主要是 Ruby 一些东西，安装它们。

### 建立一个项目

在设置你的项目之前，你需要了解一些你想要运行它的环境。你可以在 [Vagrant Boxes 仓库][5]中为许多虚拟化提供者找到大量预配置的盒子。许多会预先配置一些你可能需要的核心基础设置，比如 PHP, MySQL 和 Apache，但是对于本次测试，我将安装一个 Debian 8 64 位裸机 "Jessie" 沙盒并手动安装一些东西，这样你就可以看到具体过程了。
```
mkdir ~/myproject

cd ~/myproject

vagrant init debian/contrib-jessie64

vagrant up

```

最后一条命令将根据需要从仓库中获取或更新 VirtualBox 镜像，然后拉起启动器，你的系统上会出现一个运行框！下次启动这个项目时，除非镜像已经在仓库中更新，否则不会花费太长时间。

要访问沙盒，只需要输入 `vagrant ssh`，你将被放到虚拟机的全功能 SSH 会话中，你将会是 `vagrant` 用户，但你是 `sudo` 组的成员，所以你可以切换到 root，并在这里做你想做的任何事情。

你会在沙盒中看到一个名为 `/vagrant` 目录，对这个目录小心点，因为它与你主机上的 `~/myproject` 文件夹保持同步。在虚拟机 `/vagrant` 下建立一个文件它会立即复制到主机上，反之亦然。注意，有些沙盒并没有安装 VirtualBox 的附加功能，所以拷贝只能在启动时才起作用。有一些用于手动同步的命令行工具，这可能是测试环境中非常有用的特性。我倾向于坚持使用那些有附加功能的沙盒，所以这个目录正常工作，不必考虑它。

这个方案的好处很快显现出来了： 如果你在主机上有一个代码编辑工具链，并处于某种原因不希望它出现在虚拟机上，那么这不是问题 - 在主机上进行编辑，虚拟机会立刻更改。快速更改虚拟机，它也将其同步到主机上的“官方”副本
。

让我们关闭这个盒子，这样我们就可以在这个盒子里提供一些我们需要的东西：`vagrant halt`。

### 在 Vm 上安装额外的软件

对于这个例子，我将使用 [Apache][6], [PostgreSQL][7] 和 [Dancer][8] web 框架为 Perl 的一个项目开发。我将修改Vagrant配置脚本，以便我需要的东西已经安装。 为了使事情更容易保持稍后更新，我将在项目根目录下创建一个脚本`~/myproject/Vagrantfile`:
```
$provision_script = <<SCRIPT

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get -y install \

  apache2 \

  postgresql-client-9.4 \

  postgresql-9.4 \

  libdbd-pg-perl \

  libapache2-mod-fastcgi \

  libdata-validate-email-perl  \

  libexception-class-perl \

  libexception-class-trycatch-perl \

  libtemplate-perl \

  libtemplate-plugin-json-escape-perl \

  libdbix-class-perl \

  libyaml-tiny-perl \

  libcrypt-saltedhash-perl \

  libdancer2-perl \

  libtemplate-plugin-gravatar-perl  \

  libtext-csv-perl \

  libstring-tokenizer-perl \

  cpanminus

cpanm -f -n \

  Dancer2::Session::Cookie \

  Dancer2::Plugin::DBIC \

  Dancer2::Plugin::Auth::Extensible::Provider::DBIC \

  Dancer2::Plugin::Locale \

  Dancer2::Plugin::Growler

sudo a2enmod rewrite fastcgi

sudo apache2ctl restart

SCRIPT

```

在 Vagrantfile 结尾附近，你会发现一行 `config.vm.provision` 变量，正如你在示例中看到的那样，你可以在此处以内联方式进行操作，只需通过取消注释以下行：
```
  # config.vm.provision "shell", inline: <<-SHELL

  #   sudo apt-get update

  #   sudo apt-get install -y apache2

  # SHELL

```

相反，将那四行替换为使用你在文件顶部定义为变量的配置脚本：
```
config.vm.provision "shell", inline: $provision_script

```

取消注释 `forwarded_port`。如果你愿意，你可以将端口从 8080 更改为其它端口。我通常使用 5000 端口，在浏览器中输入 `http://localhost:5000` 以访问虚拟机上的 Apache 服务器。

你可能还希望将转发的端口设置为从主机访问 VM 上的 Apache。寻找包含的行并取消注释它。如果你愿意，也可以将端口从 8080 更改为其他内容。我通常使用端口 5000，并在我的浏览器访问我虚拟机上的 Apache 服务器。

这里有一个设置提示：如果你的仓库位于云存储上，为了在多台机器上使用 Vagrant，你可能希望将不同机器上的 `VAGRANT_HOME` 环境变量设置为不同的东西。通过 VirtualBox 的工作方式，你需要分别为这些系统存储状态信息，确保你的版本控制系统忽略了用于此的目录 - 我将 `.vagrant.d*` 添加到仓库的 `.gitignore` 文件中。不过，我确实让 Vagrantfile 成为仓库的一部分！

### 好了！

我进入 `vagrant up`，我准备开始写代码了。一旦你做了一两次，你可能会想出一些你会回收很多的 Vagrantfile 模板文件（就像我刚刚那样），这就是 Vagrant 的优势之一。你可以更快地完成实际的编码工作，并将很少的时间花在基础设施上！ 

你可以使用 Vagrant 做更多事情。配置工具存在于许多工具链中，因此，无论你需要复制什么环境，它都是快速而简单的。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/getting-started-vagrant

作者：[Ruth Holloway][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://vagrantup.com
[2]:https://opensource.org/licenses/MIT
[3]:https://github.com/hashicorp/vagrant/wiki/Available-Vagrant-Plugins#providers
[4]:https://www.vagrantup.com/downloads.html
[5]:https://app.vagrantup.com/boxes/search
[6]:https://httpd.apache.org/
[7]:https://postgresql.org
[8]:https://perldancer.org
