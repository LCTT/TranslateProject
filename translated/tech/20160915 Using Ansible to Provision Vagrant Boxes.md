用Ansible来配置Vagrant Boxes
====

![](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-plus-ansible.jpg?w=1352&ssl=1)

Ansible 是一款系统管理员进行自动化运维的强大工具。Ansible 让配置、交付、管理各种容器，软件部署变得非常简单[1]。基于轻量级模块的架构非常适合系统管理，一个优点就是如果某个节点没有被 Ansible 管理的话，它的资源是没有被使用的。

这篇文章介绍用 Ansible 来配置 Vagrant boxes，它是一个配置好的基础虚拟机映像，包含在开发环境中需要用到的工具。你可以用它来部署开发环境，然后和其他成员协同工作。用 Ansible，你可以用你的开发包自动化配置 Vagrant boxes。

我们用 Fedora 24 做主机，用 CentOS 7 来作 Vagrant box

### 设置工作环境

在用 Ansible 配置 Vagrant boxes 时，你需要做几件准备的事情。首先在主机上安装 Ansible 和 Vagrant，在主机上运行下面的命令来安装：

```
sudo dnf install ansible vagrant vagrant-libvirt
```

上面的命令将 Ansible 和 Vagrant 在你的主机上，也包括 Vagrant 的自动部署工具。Vagrant 不能自己管理虚拟主机，需要第三方工具比如：libirt，VirtualBox，VMWare等等。工具直接在你的 Fedora 系统上运行。

接着确认你的账户在正确的用户组 wheel 当中，确保你可以运行系统管理员命令。如果你的账号在安装过程中就创建为管理员，那么你就肯定在这个用户组里。运行下面的命令：

```
id | grep wheel
```

如果你能看到输出，那么你的账户就在这个组里，可以进行下一步。如果没有的话，你需要运行下面的命令，这一步需要你提供 root 账户的密码，在<username>里加上你的用户名：

```
su -c 'usermod -a -G wheel <username>'
```

然后，你需要注销然后重新登录，确保在用户组里。

现在要建立你的第一个 Vagrant box 了，你需要用 Ansible 来配置它。

### 设置 Vagrant box

配置一个镜像 box 之前，你需要先创建它。创建一个目录，存放 Vagrant box 相关的文件，并且将它设置为工作目录，用下面这条命令：

```
mkdir -p ~/lampbox && cd ~/lampbox
```

在创建镜像 box 之前，你需要搞清楚目的，这个镜像 box 是一个运行 CentOS 7 基础系统的模板包括 Apache 的 web 服务，MariaDB（MySQL 原始开发者创建的一个流行的开源数据库）数据库和 PHP 服务。

初始化 Vagrant box，用 vagrant 开发工具初始化命令：

```
vagrant init centos/7
```

这个命令初始化 Vagrant box 创建一些 Vagrantfile 名字的文件，也包含一些预先配置的文件。你可以打开和编辑它们，下面的命令显示基本的镜像box和配置。

```
config.vm.box = "centos/7"
```

设置端口转发，这样在你设置玩 Vagrant box 之后可以测试它。用下面的命令实现：

```
config.vm.network "forwarded_port", guest: 80, host: 8080
```

这个命令将 Vagrant Box 的 80 端口映射为主机的 8080 端口。

下一步是设置 Ansible 作为配置 Vagrant Box 的工具，下面的命令将 Ansible 作为配置工具在 end 之前加入到 Vagrantfile 中：

```
config.vm.provision :ansible do |ansible|
  ansible.playbook = "lamp.yml"
end
```

（必须将这三行在最后的语句之前加入）ansible.playbook = "lamp.yml"这一句定义了配置镜像box的手册的名字。

### 创建Ansible详细手册

Ansible 的手册描述的是执行在你的远端节点的策略，换句话说，它管理远端节点的配置和部署。详细的说，手册是一个 Yaml 文件，在里面你写入在远端节点上将要执行的任务。所以，你需要创建一个名为 lamp.yml 的手册来配置镜像 box。

在 Vagrantfile 的目录里创建一个 lamp.yml 文件，将下面的内容粘贴到文件当中：

```
---
- hosts: all
  become: yes
  become_user: root
  tasks:
  - name: Install Apache
    yum: name=httpd state=latest
  - name: Install MariaDB
    yum: name=mariadb-server state=latest
  - name: Install PHP5
    yum: name=php state=latest
  - name: Start the Apache server
    service: name=httpd state=started
  - name: Install firewalld
    yum: name=firewalld state=latest
  - name: Start firewalld
    service: name=firewalld state=started
  - name: Open firewall
    command: firewall-cmd --add-service=http --permanent
```

每一行代表的意思：

- hosts: 定义 Ansible 配置文件需要在所有的主机上运行，因为还没定义主机，暂时只在本地运行。
- sudo: 需要用 root 权限运行的任务
- tasks: 确定的任务
- - name: 描述任务的名字
- - yum: 描述任务需要调用 yum 模块，需要 key=value 成对被 yum 模块调用。

当手册运行时，它会安装最新的 Apache 的 web 服务，MariaDB 和 PHP。当安装完毕开始工作，会给 Apache 打开一个端口。你可以给镜像 box 写手册，并且可以配置它了。

### 配置镜像 box

用 Ansible 配置 Vagrant Box 只需要以下几部了：

```
vagrant up --provider libvirt
```

上面的命令运行 Vagrant box，将基本的镜像 box 下载到主机当中，然后运行 lamp.yml 手册来进行配置。

如果一切正常，输出应该和下面的例子类似：

![](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-ansible-playbook-run.png?w=574&ssl=1)

这个输出显示镜像 box 已经被配置好了，现在检查服务是否可用，打开浏览器，输入 http://localhost:8080，记住主机的 8080 端口是 Vagrant box 映射过来的 80 端口。你应该可以看到如下的 Apache 的欢迎界面。

![](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-ansible-apache-up.png?w=1004&ssl=1)

改变 Vagrantbox，你可以修改 lamp.yml 手册，你能从 Ansible 的官网上找到很多文章。然后运行下面的命令：

```
vagrant provision
```

### 总结

现在我们知道怎么用 Ansible 来配置 Vagrant boxes 了。这只是一个基本的例子，但是你可以用这些工具来实现不同的例子。比如你可以部署最新的工具，现在你可以用 Ansible 来配置你自己的远端服务器和容器了。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-provision-vagrant-boxes/

作者：[Saurabh Badhwar][a]
译者：[jiajia9linuxer](https://github.com/jiajia9linuxer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://h4xr.id.fedoraproject.org/
[1]: https://ansible.com/
[2]: https://www.vagrantup.com/
[3]: https://centos.org/
[4]: http://docs.ansible.com/ansible/index.html
