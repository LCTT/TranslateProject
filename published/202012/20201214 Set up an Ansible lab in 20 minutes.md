[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12970-1.html)
[#]: subject: (Set up an Ansible lab in 20 minutes)
[#]: via: (https://opensource.com/article/20/12/ansible-lab)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

20 分钟建立一个 Ansible 实验室
======

> 建立一个支持学习和实验新软件的环境。

![](https://img.linux.net.cn/data/attachment/album/202012/31/112636h6ck5qd60d44t0mm.jpg)

能够构建和拆解公有云环境是非常有用的，但我们大多数人都不能轻松访问公有云。退而求其次的最好办法就是在本地机器上建立一个实验室，但即使在本地机器上运行也会带来性能、灵活性和其他挑战。大多数时候，本地机器上额外的工作负载会干扰我们日常的工作，它们当然也会影响你提供一个现成的环境来玩耍和实验新软件。

几年前，当我和我的团队开始学习 [Ansible][2] 时，我们就遇到了这个挑战。我们找不到一个可以单独使用的环境，我们对这种情况的失望导致我们中的一些人停止了实验。我们知道需要找到一个解决方案。

我们花了很多时间研究各种方案，得出了一套工具，使我们的好奇心能够在我们完全控制的环境中学习。我们可以在本地机器上轮换和拆解实验室环境，而不需要访问内部实验室或公共云。

本文将解释如何在 20 分钟内以完全自动化的方式在本地机器上部署自己的实验室环境。

你可以在我的 [GitHub 仓库][3]中找到这个练习的所有代码。

### 工具和软件

本方案使用以下工具和软件：

  * [Ansible][4] 是我们选择的自动化工具，因为它易于使用，而且足够灵活，可以满足实验室的要求。
  * [Vagrant][5] 易于使用，用于构建和维护虚拟机。
  * [VirtualBox][6] 是一个托管管理程序，可以在 Windows 和 Linux 环境中使用。
  * [Fedora v30+][7] 是我本地机器上的操作系统。

你必须进行以下设置才能建立环境：

  * 一个互联网连接
  * 在 BIOS 中启用虚拟化技术支持（以下是在我的联想笔记本上的[过程][8]）
  * Vagrant v2.2.9
  * 最新版本的 Ansible
  * 最新版本的 VirtualBox
  * Fedora v30+ 宿主机操作系统

### 这个实验室环境有什么？

这个项目旨在部署一个带有 Ansible 引擎和多个 Linux 节点的 Ansible 主机，以及一些预加载和预配置的应用程序（httpd 和 MySQL）。它还启用了 [Cockpit][9]，这样你就可以在测试过程中监控虚拟机（VM）的状态。使用预部署的应用程序的原因是为了提高效率（所以你不必花时间安装这些组件）。这样你就可以专注于创建角色和剧本，并针对上述工具部署的环境进行测试。

我们确定，对于我们的用例来说，最好的方案是多机 Vagrant 环境。Vagrant 文件创建了三个 CentOS 虚拟机，以模拟两个目标主机和一个 Ansible 控制机。

  * Host1: 没有图形用户界面（GUI），安装 httpd 和 MySQL
  * Host2: 没有 GUI，安装了 httpd 和 MySQL
  * Ansible-host：没有 GUI，安装了 Ansible 引擎

### 启用多个管理程序

如果使用了多个管理程序，一些管理程序可能不允许你拉起虚拟机。要解决这个问题，请遵循以下步骤（基于 Vagrant 的[安装][10]说明）。

首先，找出管理程序的名称：

```
$ lsmod | grep kvm
kvm_intel             204800  6
kvm                   593920  1 kvm_intel
irqbypass              16384  1 kvm
```

我感兴趣的是 `kvm_intel`，但你可能需要另一个（比如 `kvm_amd`）。

以 root 身份运行以下内容，将该管理程序列入黑名单：

```
$ echo 'blacklist kvm-intel' >> /etc/modprobe.d/blacklist.conf
```

重新启动你的机器并尝试再次运行 Vagrant。

### Vagrant 文件

```
cat Vagrantfile
```

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name => "web1.demo.com", ⇒ Host1 this is one of the target nodes
      :box => "centos/8",             ⇒ OS version
      :ram => 1024,                   ⇒ Allocated memory
      :vcpu => 1,               ⇒  Allocated CPU
      :ip => "192.168.29.2"     ⇒ Allocated IP address of the node
    },
    {
      :name => "web2.demo.com", ⇒ Host2 this is one of the target nodes
      :box => "centos/8",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.29.3"
    },
    {
      :name => "ansible-host", ⇒ Ansible Host with Ansible Engine
      :box => "centos/8",
      :ram => 8048,
      :vcpu => 1,
      :ip => "192.168.29.4"
    }
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
#   Only Enable this if you are connecting to Proxy server
#      config.proxy.http    = "http://usernam:password@x.y:80"⇒ Needed if you have a proxy
#      config.proxy.https   = "http://usernam:password@x.y:80"
#      config.proxy.no_proxy = "localhost,127.0.0.1"
      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]
      config.vm.provider :virtualbox do |v| ⇒  Defines the vagrant provider
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      config.vm.network :private_network, ip: opts[:ip]
      config.vm.provision :file do |file|
         file.source     = './keys/vagrant' ⇒ vagrant keys to allow access to the nodes
         file.destination    = '/tmp/vagrant' ⇒ the location to copy the vagrant key
      end
      config.vm.provision :shell, path: "bootstrap-node.sh" ⇒ script that copy hosts entry
      config.vm.provision :ansible do |ansible| ⇒ declaration to run ansible playbook
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml" ⇒ the playbook used to configure the hosts
      end
        end
  end
end
```

这些是你需要注意的重要文件。

  * `inventory-test.yaml`：连接到节点的清单文件
  * `playbook.yaml`：Vagrant 供应者调用的用于配置节点的剧本文件
  * `Vagrantfile'：Vagrant 用来部署环境的文件
  * Vagrant 密钥文件：连接实验室环境中各节点的 Vagrant 密钥

你可以根据你的需要调整这些文件。Ansible 的灵活性使你有能力根据你的需要声明性地改变你的环境。

### 部署你的实验室环境

首先，克隆这个 [GitHub 仓库][11] 中的代码： 

```
$ git clone https://github.com/mikecali/ansible-labs-101.git
Cloning into 'ansible-labs-101'...
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (15/15), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 15 (delta 2), reused 10 (delta 0), pack-reused 0
Unpacking objects: 100% (15/15), 6.82 KiB | 634.00 KiB/s, done.
```

接下来，将你的目录改为 `vagrant-session-2`，并查看其内容：

```
$ ls
Bootstrap-node.sh   inventory   keys   playbook.yml   README.md Vagrantfile
```

现在你已经拥有了实验室环境所需的所有工件和配置文件。要部署环境，请运行：

```
$ vagrant up
```

只要有一个像样的网络连接，只需要 20 分钟左右就可以得到一个运行环境：

```
$ vagrant up
Bringing machine 'web1.demo.com' up with 'virtualbox' provider...
Bringing machine 'web2.demo.com' up with 'virtualbox' provider...
Bringing machine 'ansible-host' up with 'virtualbox' provider...
==> web1.demo.com: Importing base box 'centos/8'...
==> web1.demo.com: Matching MAC address for NAT networking...
==> web1.demo.com: Checking if box 'centos/8' version '1905.1' is up to date...
==> web1.demo.com: Setting the name of the VM: ansible-labs_web1democom_1606434176593_70913
==> web1.demo.com: Clearing any previously set network interfaces...
==> web1.demo.com: Preparing network interfaces based on configuration...
    web1.demo.com: Adapter 1: nat
    web1.demo.com: Adapter 2: hostonly
==> web1.demo.com: Forwarding ports...
    web1.demo.com: 22 (guest) => 2222 (host) (adapter 1)
==> web1.demo.com: Running 'pre-boot' VM customizations...
==> web1.demo.com: Booting VM...
==> web1.demo.com: Waiting for machine to boot. This may take a few minutes...
    web1.demo.com: SSH address: 127.0.0.1:2222
    web1.demo.com: SSH username: vagrant
    web1.demo.com: SSH auth method: private key
[...]
```

一旦该剧本执行完成，你会看到这样的输出：

```
PLAY RECAP *********************************
Ansible-host     : ok=20 changed=11 unreachable=0 failed=0 skipped=0 rescued=0 ignored=3

Real 18m14.288s
User 2m26.978s
Sys 0m26.849s
```

确认所有虚拟机都在运行：

```
$ vagrant status
Current machine states:

Web1.demo.com    running (virtualbox)
Web2.demo.com    running (virtualbox)
ansible-host     running (virtualbox)
[...]
```

你可以通过登录其中一个虚拟机进一步调查。访问 `ansible-host`：

```
> vagrant ssh ansible-host
Activate the web console with: systemctl enable --now cockpit.socket

Last login: Thu Nov 26 12:21:23 2020 from 10.0.2.2
[vagrant@ansible-host ~] uptime
16:46:42 up 1:24, 1 user, load average: 0.00, 0.01, 0.04
```

最后，你可以使用 Ansible 模块来 ping 你创建的其他节点：

```
[vagrant@ansible-host]$ ansible -i inventory-test.yaml \
webservers -m ping -u vagrant
192.168.29.2 | SUCCESS =&gt; {
  "Ansible-facts": {
      "Discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "Changed": false;
    "Ping": "pong"
}
[...]
```

### 清理

运行如下命令来清理环境：

```
$ vagrant destroy [vagrant machine name]
```

你的输出会像这样：

![Output from cleaning up environment][12]

### 有创意的学习

在自己的实验室里利用自己的时间学习 Ansible 这样的软件是一个好习惯，但由于受到无法控制的限制，可能会很困难。

有时候，你需要发挥创意，找到另一种方法。在开源社区中，你可以选择很多方案；我们选择这些工具的主要原因之一是，它们是许多人常用和熟悉的。

另外，请注意，这些剧本并没有按照我的要求进行优化。请随时改进它们，并在评论中分享你的工作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/ansible-lab

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/resources/what-ansible
[3]: https://github.com/mikecali/ansible-labs-101
[4]: https://www.ansible.com/
[5]: https://www.vagrantup.com/
[6]: https://www.virtualbox.org/
[7]: https://getfedora.org/
[8]: https://support.lenovo.com/pt/en/solutions/ht500006
[9]: https://opensource.com/article/20/11/cockpit-server-management
[10]: https://www.vagrantup.com/docs/installation
[11]: https://github.com/mikecali/ansible-labs-101.git
[12]: https://opensource.com/sites/default/files/uploads/cleanup.png (Output from cleaning up environment)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
