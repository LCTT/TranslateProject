[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installing and running Vagrant using qemu-kvm)
[#]: via: (https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/)
[#]: author: (Andy Mott https://fedoramagazine.org/author/amott/)

Installing and running Vagrant using qemu-kvm
======

![][1]

Vagrant is a brilliant tool, used by DevOps professionals, coders, sysadmins and regular geeks to stand up repeatable infrastructure for development and testing. From their website:

> Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the “works on my machine” excuse a relic of the past.
>
> If you are already familiar with the basics of Vagrant, the documentation provides a better reference build for all available features and internals.
>
> Vagrant provides easy to configure, reproducible, and portable work environments built on top of industry-standard technology and controlled by a single consistent workflow to help maximize the productivity and flexibility of you and your team.
>
> <https://www.vagrantup.com/intro>

This guide will walk through the steps necessary to get Vagrant working on a Fedora-based machine.

I started with a minimal install of Fedora Server as this reduces the memory footprint of the host OS, but if you already have a working Fedora machine, either Server or Workstation, then this should still work.

### Check the machine supports virtualisation:

```
$ sudo lscpu | grep Virtualization
Virtualization:                  VT-x
Virtualization type:             full
```

### Install qemu-kvm:

```
sudo dnf install qemu-kvm libvirt libguestfs-tools virt-install rsync
```

### Enable and start the libvirt daemon:

```
sudo systemctl enable --now libvirtd
```

### Install Vagrant:

```
sudo dnf install vagrant
```

### Install the Vagrant libvirtd plugin:

```
sudo vagrant plugin install vagrant-libvirt
```

### Add a box

```
vagrant box add fedora/32-cloud-base --provider=libvirt
```

### Create a minimal Vagrantfile to test

```
$ mkdir vagrant-test
$ cd vagrant-test
$ vi VagrantfileVagrant.configure("2") do |config|
  config.vm.box = "fedora/32-cloud-base"
end
```

**Note the capitalisation of the file name and in the file itself.**

### Check the file:

```
vagrant statusCurrent machine states:

default not created (libvirt)

The Libvirt domain is not created. Run 'vagrant up' to create it.
```

### Start the box:

```
vagrant up
```

### Connect to your new machine:

```
vagrant ssh
```

That’s it – you now have Vagrant working on your Fedora machine.

To stop the machine, use _vagrant halt_. This simply halts the machine but leaves the VM and disk in place.
To shut it down and delete it use _vagrant destroy_. This will remove the whole machine and any changes you’ve made in it.

### Next steps

You don’t need to download boxes before issuing the _vagrant up_ command – you can specify the box and the provider in the Vagrantfile directly and Vagrant will download it if it’s not already there. Below is an example which also sets the amount memory and number of CPUs:

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

For more information on using Vagrant, creating your own machines and using different boxes, see the official documentation at <https://www.vagrantup.com/docs>

There is a huge repository of boxes ready to download and use, and the official location for these is Vagrant Cloud – <https://app.vagrantup.com/boxes/search>. Some are basic operating systems and some offer complete functionality such as databases, web servers etc.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/

作者：[Andy Mott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/amott/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/09/vagrant-beginner-howto-816x346.png
