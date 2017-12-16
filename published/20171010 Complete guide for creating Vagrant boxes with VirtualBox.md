使用 VirtualBox 创建 Vagrant Boxes 的完全指南
======

Vagrant 是一个用来创建和管理虚拟机环境的工具，常用于建设开发环境。 它在 Docker、VirtualBox、Hyper-V、Vmware、AWS 等技术的基础上构建了一个易于使用且易于复制、重建的环境。

Vagrant Boxes 简化了软件配置部分的工作，并且完全解决了软件开发项目中经常遇到的“它能在我机器上工作”的问题，从而提高开发效率。

在本文中，我们会在 Linux 机器上学习使用 VirtualBox 来配置 Vagrant Boxes。

### 前置条件

Vagrant 是基于虚拟化环境运行的，这里我们使用 VirtualBox 来提供虚拟化环境。 关于如何安装 VirutalBox 我们在“[在 Linux 上安装 VirtualBox][1]” 中有详细描述，请阅读该文并安装 VirtualBox。

安装好 VirtualBox 后，下一步就是配置 Vagrant 了。

 - 推荐阅读：[创建你的 Docker 容器][2]

### 安装

VirtualBox 准备好后，我们来安装最新的 vagrant 包。 在写本文的时刻， Vagrant 的最新版本为 2.0.0。 使用下面命令下载最新的 rpm 文件：

```
$ wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.rpm
```

然后安装这个包:

```
$ sudo yum install vagrant_2.0.0_x86_64.rpm
```

如果是 Ubuntu，用下面这个命令来下载最新的 vagrant 包：

```
$ wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb
```

然后安装它，

```
$ sudo dpkg -i vagrant_2.0.0_x86_64.deb
```

安装结束后，就该进入配置环节了。

### 配置

首先，我们需要创建一个目录给 vagrant 来安装我们需要的操作系统，

```
$ mkdir /home/dan
$ cd /home/dan/vagrant
```

**注意：** 推荐在你的用户主目录下创建 vagrant，否则你可能会遇到本地用户相关的权限问题。

现在执行下面命令来安装操作系统，比如 CentOS：

```
$ sudo vagrant init centos/7
```

如果要安装 Ubuntu 则运行：

```
$ sudo vagrant init ubuntu/trusty64
```

![vagrant boxes][4]

这还会在存放 vagrant OS 的目录中创建一个叫做 `Vagrantfile` 的配置文件。它包含了一些关于操作系统、私有 IP 网络、转发端口、主机名等信息。 若我们需要创建一个新的操作系统， 也可以编辑这个问题。

一旦我们用 vagrant 创建/修改了操作系统，我们可以用下面命令启动它:

```
$ sudo vagrant up
```

这可能要花一些时间，因为这条命令要构建操作系统，它需要从网络上下载所需的文件。 因此根据互联网的速度， 这个过程可能会比较耗时。

![vagrant boxes][6]

这个过程完成后，你就可以使用下面这些命令来管理 vagrant 实例了。

启动 vagrant 服务器：

```
$ sudo vagrant up
```

关闭服务器：

```
$ sudo vagrant halt
```

完全删除服务器：

```
$ sudo vagrant destroy
```

使用 ssh 访问服务器：

```
$ sudo vagrant ssh
```

我们可以从 Vagrant Box 的启动过程中得到 ssh 的详细信息（参见上面的截屏）。

如果想看创建的 vagrant OS，可以打开 VirtualBox，然后你就能在 VirtualBox 创建的虚拟机中找到它了。 如果在 VirtualBox 中没有找到， 使用 `sudo` 权限打开 virtualbox， 然后应该就能看到了。

![vagrant boxes][8]

 **注意：** 在 [Vagrant 官方网站](https://app.vagrantup.com/boxes/search)上可以下载预先配置好的 Vagrant OS。

这就是本文的内容了。如有疑问请在下方留言，我们会尽快回复。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/creating-vagrant-virtual-boxes-virtualbox/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

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
