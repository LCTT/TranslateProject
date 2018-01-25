How To Install And Setup Vagrant
======
Vagrant is a powerful tool when it comes to virtual machines, here we will look at how to setup and use Vagrant with Virtualbox on Ubuntu to provision reproducible virtual machines.

## Virtual Machines, not all that complex

For years, developers have been using virtual machines as part of their workflow, allowing them to swap and change environments that the software is running in, this is generally to prevent conflicts between projects such as project A needing php 5.3 and project b needing php 5.4.

Also, using Virtual Machines means you only ever need the computer you're working on, you don't need dedicated hardware to mirror the production environment.

It also comes in handy when multiple developers are working on one project, they can all run an environment which contains all of its requirements, but it can be hard maintaining multiple machines and ensuring all have the same versions of all the requirements, this is where Vagrant comes in.

### The benefits of using Virtual Machines

  * Your vm is separate from your host environment
  * You can have a vm tailor for the requirements of your code
  * Anything done in one vm does not effect another VM
  * You can run programs in a vm which your host may not be able to run, such as running some windows only software in a - windows vm on top of ubuntu



## What is Vagrant

In short, it's a tool that works with virtual box to allow you to automate the creation and removal of a virtual machines.

It revolves around a Config File Called the VagrantFile, which tells vagrant what version of what os you want to install, and some other options such as the IP and Directory Syncing. You can also add a provisioning script of commands to run on the virtual machine.

By Sharing this VagrantFile around, all developers on a project. You will all be using the exact same virtual machine.

## Installing the Requirements

### Install VirtualBox

VirtualBox is the program which will run the Virtual Machine and is available in the Ubuntu Repos
```
sudo apt-get install virtualbox
```

### Install Vagrant

For vagrant itself, you need to head to <https://www.vagrantup.com/downloads.html> and install the package for your OS.

### Install Guest Additions

If you intend to sharing any folders with virtual machine, you need to install the following plugin.
```
vagrant plugin install vagrant-vbguest
```

## Setting Up Vagrant

### First we need to create an area for vagrant setups.
```
mkdir ~/Vagrant/test-vm
cd ~/Vagrant/test-vm
```

### Create the VagrantFile
```
vagrant init
```

### Start the Virtual Machine
```
vagrant up
```

### Login to the Machine
```
vagrant-ssh
```

By this point you will have the basic vagrant box, and a file called VagrantFile.

## Customising

The VagrantFile created in the steps above will look similar to the following

**VagrantFile**

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
 # # Display the VirtualBox GUI when booting the machine
 # vb.gui = true
 #
 # # Customize the amount of memory on the VM:
 # vb.memory = "1024"
 # end
 #
 # View the documentation for the provider you are using for more
 # information on available options.

 # Enable provisioning with a shell script. Additional provisioners such as
 # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
 # documentation for more information about their specific syntax and use.
 # config.vm.provision "shell", inline: <<-SHELL
 # apt-get update
 # apt-get install -y apache2
 # SHELL
end
```

Now this VagrantFile wll create the basic virtual machine. But the concept behind vagrant is to have the virtual machines set up for our specific tasks. So lets remove the comments and tweak the config.

**VagrantFile**
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

Now we have a simple VagrantFile, Which sets the box to debian jessie, sets an IP for us to use, syncs the folders we are interested in, and finally runs an install.sh, which is where our shell commands can go.

**install.sh**
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
 ServerAdmin [[email protected]][1]
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

By having the above VagrantFile and Install.sh in your directory, running vagrant up will do the following

  * Create a Virtual Machine Using Debian Jessie
  * Set the Machines IP to 192.168.33.10
  * Sync ~/Projects with /var/www/
  * Install and Setup Apache, Mysql, PHP, Git, Vim
  * Install and Run Composer
  * Install Nodejs and gulp
  * Create A MySQL Database
  * Create Self Sign Certificates



By sharing the VagrantFile and install.sh with others, you can work on the exact same environment, on two different machines.


--------------------------------------------------------------------------------

via: https://www.chris-shaw.com/blog/how-to-install-and-setup-vagrant

作者：[Christopher Shaw][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.chris-shaw.com
[1]:/cdn-cgi/l/email-protection
