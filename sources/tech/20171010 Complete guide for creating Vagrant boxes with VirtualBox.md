translating by lujun9972
Complete guide for creating Vagrant boxes with VirtualBox
======
Vagrant is tool for building & managing virtual machines environment, especially development environments. It provides easy to use & easy to replicate/reproducible environment built on top of technologies like Docker, VirtualBox, Hyper-V, Vmware , AWS etc.

Vagrant Boxes simplifies software configuration part & completely resolves the 'it works on my machine' problem that is usually faced in software development projects. Vagrant, thus increases the development productivity.

In this tutorial, we will learn to setup Vagrant Boxes on our Linux machines using the VirtualBox.

### Pre-requisites

-Vagrant runs on top of a virtualization environment, & we will be using VritualBox for that. We already have a detailed article on "[ **Installing VirtualBox on Linux**][1]", read the article to setup VirtualBox on system.

Once VirtualBox has been installed, we can move forward with Vagrant setup process.

 **(Recommended Read :[Create your first Docker Container ][2])**

### Installation

Once the VirtualBox is up & running on the machine, we will install the latest vagrant package. At the time of writing this tutorial, the latest version of Vagrant is 2.0.0. So download the latest rpm for vagrant using,

 **$ wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.rpm**

& install the package using ,

 **$ sudo yum install vagrant_2.0.0_x86_64.rpm**

If using Ubuntu, download the latest vagrant package using the following command,

 **$ wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb**

& install it,

 **$ sudo dpkg -i vagrant_2.0.0_x86_64.deb**

Once the installation is complete, we will move on to configuration part.

### Configuration

Firstly we need to create a folder where vagrant will install the OS we need, to create a folder

 **$ mkdir /home/dan**

 **$ cd /home/dan/vagrant**

 **Note:-** Its always preferable to create vagrant on your home directory as you might face permissions issue with a local user.

Now to install the Operating system like CentOS, execute the following command,

 **$ sudo vagrant init centos/7**

or for installing Ubuntu, run

 **$ sudo vagrant init ubuntu/trusty64**

![vagrant boxes][3]

![vagrant boxes][4]

This will also create a configuration file in the directory created for keeping the vagrant OS, called 'Vagrantfile'. It contains information like OS, Private IP network, Forwarded Port, hostname etc. If we need to build a new operating system, we can also edit the file.

Once we have created/modified the operating system with vagrant, we can start it up by running the following command,

 **$ sudo vagrant up**

This might take some time as it operating system is being built with this command & its downloading the required files from Internet. So depending on the Internet speed, this process can take some time.

![vagrant boxes][5]

![vagrant boxes][6]

Once the process completes, you than manage the vagrant instances using the following command,

Start the vagrant server

 **$ sudo vagrant up**

Stop the server

 **$ sudo vagrant halt**

Or to completely remove the server

 **$ sudo vagrant destroy**

To access the server using ssh,

 **$ sudo vagrant ssh**

you will get the ssh details while the Vagrant Box is being setup (refer to screenshot above).

To see the vagrant OS that has been built, you can open the virtual box & you will find it among the Virtual machines created in the VirtualBox. If you are not seeing your machines in VirtualBox, open virtualbox with sudo permissions & Vagrant Boxes should be there.

![vagrant boxes][7]

![vagrant boxes][8]

 **Note:-** There are pre-configured Vagrant OS created  & can downloaded from the Official Vagrant Website. (<https://app.vagrantup.com/boxes/search>)

This completes our tutorial on how to setup a vagrant machine on our CentOS and Ubuntu machines. Please leave any queries you have in the comment box below & we will surely address them.

If you think we have helped you or just want to support us, please consider these :-

Connect to us: [Facebook][9] | [Twitter][10] | [Google Plus][11]

Linux TechLab is thankful for your continued support.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/creating-vagrant-virtual-boxes-virtualbox/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/installing-virtualbox-on-linux-centos-ubuntu/
[2]:http://linuxtechlab.com/create-first-docker-container-beginners-guide/
[3]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=721%2C87
[4]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/vagrant-1.png?resize=721%2C87
[5]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=980%2C414
[6]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/vagrant-2-e1510557565780.png?resize=980%2C414
[7]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=769%2C582
[8]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/vagrant-3.png?resize=769%2C582
[9]:https://www.facebook.com/linuxtechlab/
[10]:https://twitter.com/LinuxTechLab
[11]:https://plus.google.com/+linuxtechlab
