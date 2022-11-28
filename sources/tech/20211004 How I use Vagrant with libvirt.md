[#]: subject: "How I use Vagrant with libvirt"
[#]: via: "https://opensource.com/article/21/10/vagrant-libvirt"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use Vagrant with libvirt
======
When a virtual machine is what you need, Vagrant may be just the best
way to get it.
![Computer laptop in space][1]

I'll admit it: I'm a fan of Linux. While I've used Slackware on workstations and Red Hat Enterprise Linux (RHEL) on servers for years, I love seeing how other distributions do things. What's more, I really like to test applications and scripts I write on other distributions to ensure portability. In fact, that's one of the great advantages of Linux, as I see it: You can download a distro and test your software on it for free. You can't do that with a closed OS, at least not without either breaking an EULA or paying to play, and even then, you're often signing up to download several gigabytes just to test an application that's no more than a few hundred megabytes. But Linux is open source, so there's rarely an excuse to ignore at least the three or four main distros, except that setting up a virtual machine can take a lot of clicks and sometimes complex virtual networking. At least, that used to be the excuse until Vagrant changed the virtual machine workflow for developers.

### What is Vagrant

Vagrant is a simple virtual machine manager for your terminal. It allows you to easily pull a minimal and pre-built virtual machine from the Internet, run it locally, and SSH into it in just a few steps. It's the quickest you'll ever set up a virtual machine. It's ideal for web developers needing a test web server, programmers who need to test an application across distributions, and hobbyists who enjoy seeing how different distributions work.

Vagrant itself is relatively minimal, too. It's not a virtualization framework itself. It only manages your virtual machines ("boxes" in Vagrant terminology). It can use VirtualBox or, through a plug-in, the lightweight libvirt project as a backend.

### What is libvirt

The libvirt project is a toolkit designed to manage virtualization, with support for [KVM][2], [QEMU][3], [LXC][4], and more. You might think of it as a sort of virtual machine API, allowing developers to write friendly applications that make it easy for users to orchestrate virtualization through libvirt. I use libvirt as the backend for Vagrant because it's useful across several applications, including virt-manager and [GNOME Boxes][5].

### Installing Vagrant

You can install Vagrant from [vagrantup.com/downloads][6]. There are builds available for Debian-based systems, CentOS-based systems, macOS, Windows, and more.

For CentOS, Fedora, or similar, you get an RPM package, which you can install with `dnf`:


```
`$ sudo dnf install ./vagrant_X.Y.ZZ_x86_64.rpm`
```

On Debian, Linux Mint, Elementary, and similar, you get a DEB package, which you can install with `apt`:


```
`$ sudo apt install ./vagrant_X.Y.ZZ_x86_64.deb`
```

### Installing libvirt and support packages

On Linux, your distribution may already have libvirt installed, but to enable integration with Vagrant you need a few other packages, too. Install these with your package manager.

On Fedora, CentOS, and similar:


```
$ sudo dnf install gcc libvirt \
libvirt-devel libxml2-devel \
make ruby-devel libguestfs-tools
```

On Debian, Linux Mint, and similar:


```
$ sudo apt install build-dep vagrant ruby-libvirt \
qemu libvirt-daemon-system libvirt-clients ebtables \
dnsmasq-base libxslt-dev libxml2-dev libvirt-dev \
zlib1g-dev ruby-dev libguestfs-tools
```

Depending on your distribution, you may have to start the `libvirt` daemon:


```
`$ sudo systemctl start libvirtd`
```

### Installing the Vagrant-libvirt plugin

In Vagrant, libvirt is enabled through a plug-in. Vagrant makes it easy to install a plug-in, so your first Vagrant command is one you'll rarely run again:


```
`$ vagrant plugin install vagrant-libvirt`
```

Now that the libvirt plug-in is installed, you can start using virtual machines.

### Setting up your Vagrant environment

To start with Vagrant, create a directory called `~/Vagrant`. This is where your `Vagrantfiles` are stored.


```
`$ mkdir ~/Vagrant`
```

In this directory, create a subdirectory to represent a distro you want to download. For instance, assume you need a CentOS test box.

Create a CentOS directory, and then change to it:


```
$ mkdir ~/Vagrant/centos
$ cd ~/Vagrant/centos
```

Now you need to find a virtual machine so you can convert the directory you've just made into a Vagrant environment.

### Finding a Vagrant virtual machine

Broadly speaking, Vagrant boxes come from three different places: Hashicorp (the maintainers of Vagrant), maintainers of distributions, and people like you and me. Some images are minimal, intended to serve as a base for customization. In contrast, others try to solve a specific need (for instance, you might find a LAMP stack image ready for web development). You can find images by browsing or searching the main hub for boxes [app.vagrantup.com/boxes/search][7].

For this example, search for "centos" and find the entry named `generic/centos8`. Click on the image for instructions on how to use the virtual machine. The instructions come in two varieties: 

  * The code you need for a Vagrantfile
  * The command you need to use the box from a terminal



The latter is the more straightforward method:


```
`$ vagrant init generic/centos8`
```

The `init` subcommand creates a configuration file, called a Vagrantfile, in your current directory, which transforms that directory into a Vagrant environment. At any time, you can view a list of known Vagrant environments using the `global-status` subcommand:


```
$ vagrant global-status
id       name    provider state   directory
\-------------------------------------------
49c797f  default libvirt running /home/tux/Vagrant/centos8
```

### Starting a virtual machine with Vagrant

Once you've run the `init` command, you can start your virtual machine with `vagrant up`:


```
`$ vagrant up`
```

This causes Vagrant to download the virtual machine image if it doesn't already exist locally, set up a virtual network, and configure your box.

### Entering a Vagrant virtual machine 

Once your virtual machine is up and running, you can log in to it with `vagrant ssh`:


```
$ vagrant ssh
box$
```

You connect to the box running in your current Vagrant environment. Once logged in, you can run all the commands native to that host. It's a virtual machine running its own kernel, with emulated hardware and common Linux software.

### Leaving a Vagrant virtual machine

To leave your Vagrant virtual machine, log out of the host as you normally exit a Linux computer:


```
`box$ exit`
```

Alternately, you can power the virtual machine down:


```
`box$ sudo poweroff`
```

You can also stop the machine from running using the `vagrant` command:


```
`box$ vagrant halt`
```

### Destroying a Vagrant virtual machine

When finished with a Vagrant virtual machine, you can destroy it:


```
`$ vagrant destroy`
```

Alternately, you can remove a virtual machine using the global `box` subcommand:


```
`$ vagrant box remove generic/centos8`
```

### Vagrant is easy

Vagrant makes virtual machines trivial, disposable, and fast. When you need a test environment or a fake server to ping or develop on, or a clean lab computer for experimentation or monitoring, you can get one with Vagrant. Some people think virtual machines aren't relevant now that containers have taken over servers, but virtual machines have unique traits that make them useful. They run their own kernel, have a full and unique stack separate from the host machine, and use emulated hardware. When a virtual machine is what you need, Vagrant may be just the best way to get it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/vagrant-libvirt

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://opensource.com/article/20/8/virt-tools#kvm
[3]: https://opensource.com/article/20/8/virt-tools#qemu
[4]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[5]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[6]: https://www.vagrantup.com/downloads
[7]: https://app.vagrantup.com/boxes/search
