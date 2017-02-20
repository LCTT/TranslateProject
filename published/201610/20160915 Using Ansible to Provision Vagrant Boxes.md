用 Ansible 来交付 Vagrant  实例
====

![](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-plus-ansible.jpg?w=1352&ssl=1)

Ansible 是一款系统管理员进行自动化运维的强大工具。Ansible 让配置、交付、管理各种容器，软件部署[变得非常简单][1]。基于轻量级模块的架构非常适合系统管理，一个优点就是如果某个节点没有被 Ansible 管理的话，它的资源就不会被使用。

这篇文章介绍用 Ansible 来配置 [Vagrant 实例][2]，它是一个配置好的基础虚拟机映像，包含了开发环境中需要用到的工具。你可以用它来部署开发环境，然后和其他成员协同工作。用 Ansible，你可以用你的开发包自动化交付 Vagrant 实例。

我们用 Fedora 24 做主机，用 [CentOS][3] 7 来作 Vagrant 实例。

### 设置工作环境

在用 Ansible 配置 Vagrant 实例时，你需要做几件准备的事情。首先在宿主机上安装 Ansible 和 Vagrant，在你的主机上运行下面的命令来安装：

```
sudo dnf install ansible vagrant vagrant-libvirt
```

上面的命令将 Ansible 和 Vagrant 在你的宿主机上，以及包括 Vagrant 的 libvirt 接口。Vagrant 并没有提供托管你的虚拟机的功能，需要第三方工具比如：libirt、VirtualBox、VMWare 等等。这些工具可以直接与你的 Fedora 系统上的  libvirt 和 KVM 协同工作。

接着确认你的账户在正确的 wheel 用户组当中，确保你可以运行系统管理员命令。如果你的账号在安装过程中就创建为管理员，那么你就肯定在这个用户组里。运行下面的命令查看：

```
id | grep wheel
```

如果你能看到输出，那么你的账户就在这个组里，可以进行下一步。如果没有的话，你需要运行下面的命令，这一步需要你提供 root 账户的密码，将 \<username> 换成你的用户名：

```
su -c 'usermod -a -G wheel <username>'
```

然后，你需要注销然后重新登录，确保在用户组里。

现在要建立你的第一个 Vagrant 实例了，你需要用 Ansible 来配置它。

### 设置 Vagrant 实例

配置一个镜像实例之前，你需要先创建它。创建一个目录，存放 Vagrant 实例 相关的文件，并且将它作为当前工作目录，用下面这条命令：

```
mkdir -p ~/lampbox && cd ~/lampbox
```

在创建镜像实例之前，你需要搞清楚目的，这个镜像实例是一个运行 CentOS 7 基础系统，模板包括 Apache 的 Web 服务，MariaDB（MySQL 原开发者创建的一个流行的开源数据库）数据库和 PHP 服务。

初始化 Vagrant 实例，用 `vagrant init` 命令：

```
vagrant init centos/7
```

这个命令初始化 Vagrant 实例，并创建一个名为 Vagrantfile 的文件，包含一些预先配置的变量。打开并编辑它，下面的命令显示了用于这次配置的基本镜像实例。

```
config.vm.box = "centos/7"
```

现在设置端口转发，以便你配置完毕 Vagrant 实例并让它运行起来之后可以测试它。将下述配置加入到 Vagrantfile 的最终的 `end` 语句之前：

```
config.vm.network "forwarded_port", guest: 80, host: 8080
```

这个命令将 Vagrant 实例 的 80 端口映射为主机的 8080 端口。

下一步是设置 Ansible 作为配置 Vagrant 实例的工具，将下述配置加入到 Vagrantfile 的 `end` 语句之前，将 Ansible 作为配置工具（provisioning provider）：

```
config.vm.provision :ansible do |ansible|
  ansible.playbook = "lamp.yml"
end
```

（必须将这三行在最后的 `end` 语句之前加入）注意 `ansible.playbook = "lamp.yml"` 这一句定义了配置镜像实例的 Ansible playbook 的名字。

### 创建 Ansible playbook

在 Ansible 之中，playbook 是指在你的远端节点执行的策略，换句话说，它管理远端节点的配置和部署。详细的说，playbook 是一个 Yaml 文件，在里面写入你要在远端节点上将要执行的任务。所以，你需要创建一个名为 lamp.yml 的 playbook 来配置镜像实例。

在 Vagrantfile 相同的目录里创建一个 lamp.yml 文件，将下面的内容粘贴到文件当中：

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

- `hosts: all` 指定该 playbook 需要在 Ansible 配置文件中定义的所有主机上都执行，因为还没定义主机， playbook 将只在本地运行。
- `sudo: true` 表明该任务需要用 root 权限运行。（LCTT 译注：此语句上述配置中缺失。）
- `tasks:` 指定当 playbook 运行是需要执行的任务，在这一节之下：
	- `name: ...` 描述任务的名字
	- `yum: ...`  描述该任务应该由 yum 模块执行，可选的 key=value 键值对将由 yum 模块所使用。

当 playbook 运行时，它会安装最新的 Apache Web 服务（http），MariaDB 和 PHP。当安装完毕并启动防火墙 firewalld，给 Apache 打开一个端口。你可以通过编写 playbook 来完成这些。现在可以配置它了。

### 配置镜像 实例

用 Ansible 配置 Vagrant 实例只需要以下几步了：

```
vagrant up --provider libvirt
```

上面的命令运行 Vagrant 实例，将实例的基础镜像下载到宿主机当中（如果还没下载的话），然后运行 lamp.yml 来进行配置。

如果一切正常，输出应该和下面的例子类似：

![](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-ansible-playbook-run.png?w=574&ssl=1)

这个输出显示镜像实例已经被配置好了，现在检查服务是否可用，在宿主机上打开浏览器，输入 `http://localhost:8080`，记住本地主机的 8080 端口是 Vagrant 实例映射过来的 80 端口。你应该可以看到如下的 Apache 的欢迎界面。

![](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-ansible-apache-up.png?w=1004&ssl=1)

要修改你的 Vagrant 实例，你可以修改 lamp.yml，你能从 Ansible 的[官网][4]上找到很多文章。然后运行下面的命令来重新配置：

```
vagrant provision
```

### 总结

现在我们知道怎么用 Ansible 来配置 Vagrant 实例了。这只是一个基本的例子，但是你可以用这些工具来实现不同的例子。比如你可以用所需工具的最新版本来部署一个完整的应用。现在你可以用 Ansible 来配置你自己的远端服务器和容器了。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-provision-vagrant-boxes/

作者：[Saurabh Badhwar][a]
译者：[jiajia9linuxer](https://github.com/jiajia9linuxer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://h4xr.id.fedoraproject.org/
[1]: https://ansible.com/
[2]: https://www.vagrantup.com/
[3]: https://centos.org/
[4]: http://docs.ansible.com/ansible/index.html
