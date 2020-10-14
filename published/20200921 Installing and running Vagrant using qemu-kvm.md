[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12676-1.html)
[#]: subject: (Installing and running Vagrant using qemu-kvm)
[#]: via: (https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/)
[#]: author: (Andy Mott https://fedoramagazine.org/author/amott/)

使用 qemu-kvm 安装和运行 Vagrant
======

![][1]

Vagrant 是一个出色的工具，DevOps 专业人员、程序员、系统管理员和普通极客来使用它来建立可重复的基础架构来进行开发和测试。引用自它的网站：

> Vagrant 是用于在单工作流程中构建和管理虚拟机环境的工具。凭借简单易用的工作流程并专注于自动化，Vagrant 降低了开发环境的设置时间，提高了生产效率，并使“在我的机器上可以工作”的借口成为过去。
>
> 如果你已经熟悉 Vagrant 的基础知识，那么该文档为所有的功能和内部结构提供了更好的参考。
>
> Vagrant 提供了基于行业标准技术构建的、易于配置、可复制、可移植的工作环境，并由一个一致的工作流程控制，帮助你和你的团队最大限度地提高生产力和灵活性。
>
> <https://www.vagrantup.com/intro>

本指南将逐步介绍使 Vagrant 在基于 Fedora 的计算机上工作所需的步骤。

我从最小化安装 Fedora 服务器开始，因为这样可以减少宿主机操作系统的内存占用，但如果你已经有一台可以使用的 Fedora 机器，无论是服务器还是工作站版本，那么也没问题。

### 检查机器是否支持虚拟化

```
$ sudo lscpu | grep Virtualization
```

```
Virtualization:                  VT-x
Virtualization type:             full
```

### 安装 qemu-kvm

```
sudo dnf install qemu-kvm libvirt libguestfs-tools virt-install rsync
```

### 启用并启动 libvirt 守护进程

```
sudo systemctl enable --now libvirtd
```

### 安装 Vagrant

```
sudo dnf install vagrant
```

### 安装 Vagrant libvirtd 插件

```
sudo vagrant plugin install vagrant-libvirt
```

### 添加一个 box

```
vagrant box add fedora/32-cloud-base --provider=libvirt
```

（LCTT 译注：以防你不知道，box 是 Vagrant 中的一种包格式，Vagrant 支持的任何平台上的任何人都可以使用盒子来建立相同的工作环境。）

### 创建一个最小化的 Vagrantfile 来测试

```
$ mkdir vagrant-test
$ cd vagrant-test
$ vi Vagrantfile
```

```
Vagrant.configure("2") do |config|
  config.vm.box = "fedora/32-cloud-base"
end
```

**注意文件名和文件内容的大小写。**

### 检查文件

```
vagrant status
```

```
Current machine states:

default not created (libvirt)

The Libvirt domain is not created. Run 'vagrant up' to create it.
```

### 启动 box

```
vagrant up
```

### 连接到你的新机器

```
vagrant ssh
```

完成了。现在你的 Fedora 机器上 Vagrant 可以工作了。

要停止该机器，请使用 `vagrant halt`。这只是简单地停止机器，但保留虚拟机和磁盘。
要关闭并删除它，请使用 `vagrant destroy`。这将删除整个机器和你在其中所做的任何更改。

### 接下来的步骤

在运行 `vagrant up` 命令之前，你不需要下载 box。你可以直接在 Vagrantfile 中指定 box 和提供者，如果还没有的话，Vagrant 会下载它。下面是一个例子，它还设置了内存量和 CPU 数量：

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/32-cloud-base"
  config.vm.provider :libvirt do |libvirt|
    libvirt.cpus = 1
    libvirt.memory = 1024
  end
end
```

关于使用 Vagrant、创建你自己的机器和使用不同 box 的更多信息，请参见官方文档 <https://www.vagrantup.com/docs>。

有一个庞大的仓库，你可以随时下载使用这些 box，它们的的官方仓库是 Vagrant Cloud - <https://app.vagrantup.com/boxes/search>。这里有些是基本的操作系统，有些提供完整的功能，如数据库、网络服务器等。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/

作者：[Andy Mott][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/amott/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/09/vagrant-beginner-howto-816x346.png
