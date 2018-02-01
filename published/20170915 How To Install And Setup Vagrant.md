如何安装并设置 Vagrant
=============================

Vagrant 对于虚拟机来说是一个强大的工具，在这里我们将研究如何在 Ubuntu 上设置和使用 Virtualbox 和 Vagrant 来提供可复制的虚拟机。

### 虚拟机，并不复杂

多年来，开发人员一直使用虚拟机作为其工作流程的一部分，允许他们交换和更改运行软件的环境，这通常是为了防止项目之间的冲突，例如需要 php 5.3 的项目 A 和需要 php 5.4 的项目 B。

并且使用虚拟机意味着你只需要你正在使用的计算机就行，而不需要专用硬件来镜像你的生产环境。

当多个开发人员在一个项目上工作时，它也很方便，他们都可以运行一个包含所有需求的环境，但是维护多台机器并确保所有的需求都具有相同的版本是非常困难的，这时 Vagrant 就能派上用场了。

#### 使用虚拟机的好处

- 你的虚拟机与主机环境是分开的
- 你可以根据你代码的要求裁剪一个定制虚拟机
- 不会影响其他虚拟机
- 可以运行在你的主机上无法运行的程序，例如在 Ubuntu 中运行一些只能在 Windows 运行的软件

### 什么是 Vagrant

简而言之，这是一个与虚拟机一起工作的工具，可以让你自动创建和删除虚拟机。
 
它围绕一个名为 `VagrantFile` 的配置文件而工作，这个配置文件告诉 Vagrant 你想要安装的操作系统，以及一些其他选项，如 IP 和目录同步。 你还可以在虚拟机上添加一个命令的配置脚本。

通过共享这个 `VagrantFile`，项目的所有开发人员全可以使用完全相同的虚拟机。

### 安装要求

#### 安装 VirtualBox

VirtualBox 是运行虚拟机的程序，它可以从 Ubuntu 仓库中安装。

```
sudo apt-get install virtualbox
```

#### 安装 Vagrant

对于 Vagrant 本身，你要前往 [https://www.vagrantup.com/downloads.html ](https://www.vagrantup.com/downloads.html)  查看适用于你的操作系统的安装软件包。

#### 安装增强功能

如果你打算与虚拟机共享任何文件夹，则需要安装以下插件。

```
vagrant plugin install vagrant-vbguest
```

### 配置 Vagrant

首先我们需要为 Vagrant 创建一个文件夹。

```
mkdir ~/Vagrant/test-vm
cd ~/Vagrant/test-vm
```

创建 VagrantFile：

```
vagrant init
```

开启虚拟机：

```
vagrant up
```

登录机器：

```
vagrant-ssh
```

此时，你将拥有一个基本的 vagrant 机器，以及一个名为 `VagrantFile`  的文件。

### 定制

在上面的步骤中创建的 `VagrantFile` 看起来类似于以下内容

VagrantFile：

```
# -*- mode: ruby -*-
# vi: set ft=ruby :
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    config.vm.box = "base"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    # config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    #   vb.memory = "1024"
    # end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL
end
```

现在这个 `VagrantFile` 将创建基本的虚拟机。但 Vagrant 背后的理念是让虚拟机为我们的特定任务而配置，所以我们删除注释和调整配置。

VagrantFile：

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Set the Linux Version to Debian Jessie
  config.vm.box = "debian/jessie64"
  # Set the IP of the Box
  config.vm.network "private_network", ip: "192.168.33.10"
  # Sync Our Projects Directory with the WWW directory 
  config.vm.synced_folder "~/Projects", "/var/www/"
  # Run the following to Provision
  config.vm.provision "shell", path: "install.sh"
end
```

现在我们有一个简单的 `VagrantFile`，它将 Linux 版本设置为 debian jessie，设置一个 IP 给我们使用，同步我们感兴趣的文件夹，并最后运行  `install.sh`，这是我们可以运行 shell 命令的地方。

install.sh：

```
#! /usr/bin/env bash
# Variables
DBHOST=localhost
DBNAME=dbname
DBUSER=dbuser
DBPASSWD=test123

echo "[ Provisioning machine ]"
echo "1) Update APT..."
apt-get -qq update

echo "1) Install Utilities..."
apt-get install -y tidy pdftk curl xpdf imagemagick openssl vim git

echo "2) Installing Apache..."
apt-get install -y apache2

echo "3) Installing PHP and packages..."
apt-get install -y php5 libapache2-mod-php5 libssh2-php php-pear php5-cli php5-common php5-curl php5-dev php5-gd php5-imagick php5-imap php5-intl php5-mcrypt php5-memcached php5-mysql php5-pspell php5-xdebug php5-xmlrpc
#php5-suhosin-extension, php5-mysqlnd

echo "4) Installing MySQL..."
debconf-set-selections <<< "mysql-server mysql-server/root_password password secret"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password secret"
apt-get install -y mysql-server
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"

echo "5) Generating self signed certificate..."
mkdir -p /etc/ssl/localcerts
openssl req -new -x509 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -out /etc/ssl/localcerts/apache.pem -keyout /etc/ssl/localcerts/apache.key
chmod 600 /etc/ssl/localcerts/apache*

echo "6) Setup Apache..."
a2enmod rewrite
> /etc/apache2/sites-enabled/000-default.conf
echo "
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

" >> /etc/apache2/sites-enabled/000-default.conf
service apache2 restart 

echo "7) Composer Install..."
curl --silent https://getcomposer.org/installer | php 
mv composer.phar /usr/local/bin/composer

echo "8) Install NodeJS..."
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - 
apt-get -qq update
apt-get -y install nodejs 

echo "9) Install NPM Packages..."
npm install -g gulp gulp-cli

echo "Provisioning Completed"
```

通过上面的步骤，在你的目录中会有 `VagrantFile` 和 `install.sh`，运行 vagrant 会做下面的事情：

- 采用 Debian Jessie 来创建虚拟机
- 将机器的 IP 设置为 192.168.33.10
- 同步 `~/Projects` 和 `/var/www/` 目录
- 安装并设置 Apache、Mysql、PHP、Git、Vim
- 安装并运行 Composer
- 安装 Nodejs 和 gulp
- 创建一个 MySQL 数据库
- 创建自签名证书

通过与其他人共享 `VagrantFile` 和 `install.sh`，你可以在两台不同的机器上使用完全相同的环境。

--------------------------------------------------------------------------------

via: https://www.chris-shaw.com/blog/how-to-install-and-setup-vagrant

作者：[Christopher Shaw][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.chris-shaw.com
[1]:/cdn-cgi/l/email-protection
