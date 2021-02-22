[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13142-1.html"
[#]: subject: "Ansible Automation Tool Installation, Configuration and Quick Start Guide"
[#]: via: "https://www.2daygeek.com/install-configure-ansible-automation-tool-linux-quick-start-guide/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

Ansible 自动化工具安装、配置和快速入门指南
======

![](https://img.linux.net.cn/data/attachment/album/202102/22/124803cgryrgxqezjllfqg.jpg)

市面上有很多自动化工具。我可以举几个例子，例如 Puppet、Chef、CFEngine、Foreman、Katello、Saltstock、Space Walk，它们被许多组织广泛使用。

### 自动化工具可以做什么？

自动化工具可以自动执行例行任务，无需人工干预，从而使 Linux 管理员的工作变得更加轻松。这些工具允许用户执行配置管理，应用程序部署和资源调配。

### 为什么喜欢 Ansible？

Ansible 是一种无代理的自动化工具，使用 SSH 执行所有任务，但其它工具需要在客户端节点上安装代理。

### 什么是 Ansible？

Ansible 是一个开源、易于使用的功能强大的 IT 自动化工具，通过 SSH 在客户端节点上执行任务。

它是用 Python 构建的，这是当今世界上最流行、最强大的编程语言之一。两端都需要使用 Python 才能执行所有模块。

它可以配置系统、部署软件和安排高级 IT 任务，例如连续部署或零停机滚动更新。你可以通过 Ansible 轻松执行任何类型的自动化任务，包括简单和复杂的任务。

在开始之前，你需要了解一些 Ansible 术语，这些术语可以帮助你更好的创建任务。

### Ansible 如何工作？

Ansible 通过在客户端节点上推送称为 ansible 模块的小程序来工作，这些模块临时存储在客户端节点中，通过 JSON 协议与 Ansible 服务器进行通信。

Ansible 通过 SSH 运行这些模块，并在完成后将其删除。

模块是用 Python 或 Perl 等编写的一些脚本。

![][1]

*控制节点，用于控制剧本的全部功能，包括客户端节点（主机）。*

  * <ruby>控制节点<rt>Control node</rt></ruby>：使用 Ansible 在受控节点上执行任务的主机。你可以有多个控制节点，但不能使用 Windows 系统主机当作控制节点。
  * <ruby>受控节点<rt>Managed node</rt></ruby>：控制节点配置的主机列表。
  * <ruby>清单<rt>Inventory</rt></ruby>：控制节点管理的一个主机列表，这些节点在 `/etc/ansible/hosts` 文件中配置。它包含每个节点的信息，比如 IP 地址或其主机名，还可以根据需要对这些节点进行分组。
  * <ruby>模块<rt>Module</rt></ruby>：每个模块用于执行特定任务，目前有 3387 个模块。
  * <ruby>点对点<rt>ad-hoc</rt></ruby>：它允许你一次性运行一个任务，它使用 `/usr/bin/ansible` 二进制文件。
  * <ruby>任务<rt>Task</rt></ruby>：每个<ruby>动作<rt>Play</rt></ruby>都有一个任务列表。任务按顺序执行，在受控节点中一次执行一个任务。
  * <ruby>剧本<rt>Playbook</rt></ruby>：你可以使用剧本同时执行多个任务，而使用点对点只能执行一个任务。剧本使用 YAML 编写，易于阅读。将来，我们将会写一篇有关剧本的文章，你可以用它来执行复杂的任务。

### 测试环境

此环境包含一个控制节点（`server.2g.lab`）和三个受控节点（`node1.2g.lab`、`node2.2g.lab`、`node3.2g.lab`），它们均在虚拟环境中运行，操作系统分别为：

|    System Purpose    |   Hostname    |  IP Address |      OS       |
|----------------------|---------------|-------------|---------------|
| Ansible Control Node | server.2g.lab | 192.168.1.7 | Manjaro 18    |
| Managed Node1        | node1.2g.lab  | 192.168.1.6 | CentOS7       |
| Managed Node2        | node2.2g.lab  | 192.168.1.5 | CentOS8       |
| Managed Node3        | node3.2g.lab  | 192.168.1.9 | Ubuntu 18.04  |
| User: daygeek                                                      |

### 前置条件

  * 在 Ansible 控制节点和受控节点之间启用无密码身份验证。
  * 控制节点必须是 Python 2（2.7 版本） 或 Python 3（3.5 或更高版本）。
  * 受控节点必须是 Python 2（2.6 或更高版本） 或 Python 3（3.5 或更高版本）。
  * 如果在远程节点上启用了 SELinux，则在 Ansible 中使用任何与复制、文件、模板相关的功能之前，还需要在它们上安装 `libselinux-python`。

### 如何在控制节点上安装 Ansible

对于 Fedora/RHEL 8/CentOS 8 系统，使用 [DNF 命令][2] 来安装 Ansible。

注意：你需要在 RHEL/CentOS 系统上启用 [EPEL 仓库][3]，因为 Ansible 软件包在发行版官方仓库中不可用。

```
$ sudo dnf install ansible
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][4] 或 [APT 命令][5] 来安装 Ansible。

配置下面的 PPA 以便在 Ubuntu 上安装最新稳定版本的 Ansible。

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

对于 Debian 系统，配置以下源列表：

```
$ echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/ansible.list
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt update
$ sudo apt install ansible
```

对于 Arch Linux 系统，使用 [Pacman 命令][6] 来安装 Ansible：

```
$ sudo pacman -S ansible
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][7] 来安装 Ansible：

```
$ sudo yum install ansible
```

对于 openSUSE 系统，使用 [Zypper 命令][8] 来安装 Ansible：

```
$ sudo zypper install ansible
```

或者，你可以使用 [Python PIP 包管理工具][9] 来安装：

```
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ sudo python get-pip.py
$ sudo pip install ansible
```

在控制节点上检查安装的 Ansible 版本：

```
$ ansible --version

ansible 2.9.2
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/daygeek/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.8/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.1 (default, Jan  8 2020, 23:09:20) [GCC 9.2.0]
```

### 如何在受控节点上安装 Python？

使用以下命令在受控节点上安装 python：

```
$ sudo yum install -y python
$ sudo dnf install -y python
$ sudo zypper install -y python
$ sudo pacman -S python
$ sudo apt install -y python
```

### 如何在 Linux 设置 SSH 密钥身份验证（无密码身份验证）

使用以下命令创建 ssh 密钥，然后将其复制到远程计算机。

```
$ ssh-keygen
$ ssh-copy-id daygeek@node1.2g.lab
$ ssh-copy-id daygeek@node2.2g.lab
$ ssh-copy-id daygeek@node3.2g.lab
```

具体参考这篇文章《[在 Linux 上设置 SSH 密钥身份验证（无密码身份验证）][10]》。

### 如何创建 Ansible 主机清单

在 `/etc/ansible/hosts` 文件中添加要管理的节点列表。如果没有该文件，则可以创建一个新文件。以下是我的测试环境的主机清单文件：

```
$ sudo vi /etc/ansible/hosts

[web]
node1.2g.lab
node2.2g.lab

[app]
node3.2g.lab
```

让我们看看是否可以使用以下命令查找所有主机。

```
$ ansible all --list-hosts

 hosts (3):
   node1.2g.lab
   node2.2g.lab
   node3.2g.lab
```

对单个组运行以下命令：

```
$ ansible web --list-hosts

 hosts (2):
   node1.2g.lab
   node2.2g.lab
```

### 如何使用点对点命令执行任务

一旦完成主机清单验证检查后，你就可以上路了。干的漂亮！

**语法：**

```
ansible [pattern] -m [module] -a "[module options]"

Details:
========
ansible: A command
pattern: Enter the entire inventory or a specific group
-m [module]: Run the given module name
-a [module options]: Specify the module arguments
```

使用 Ping 模块对主机清单中的所有节点执行 ping 操作：

```
$ ansible all -m ping

node3.2g.lab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
node1.2g.lab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
node2.2g.lab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
```

所有系统都返回了成功，但什么都没有改变，只返回了 `pong` 代表成功。

你可以使用以下命令获取可用模块的列表。

```
$ ansible-doc -l
```

当前有 3387 个内置模块，它们会随着 Ansible 版本的递增而增加：

```
$ ansible-doc -l | wc -l
3387
```

使用 command 模块对主机清单中的所有节点执行命令：

```
$ ansible all -m command -a "uptime"

node3.2g.lab | CHANGED | rc=0 >>
 18:05:07 up  1:21,  3 users,  load average: 0.12, 0.06, 0.01
node1.2g.lab | CHANGED | rc=0 >>
 06:35:06 up  1:21,  4 users,  load average: 0.01, 0.03, 0.05
node2.2g.lab | CHANGED | rc=0 >>
 18:05:07 up  1:25,  3 users,  load average: 0.01, 0.01, 0.00
```

对指定组执行 command 模块。

检查 app 组主机的内存使用情况：

```
$ ansible app -m command -a "free -m"

node3.2g.lab | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:           1993        1065          91           6         836         748
Swap:          1425           0        1424
```

要对 web 组运行 `hostnamectl` 命令，使用以下格式：

```
$ ansible web -m command -a "hostnamectl"

node1.2g.lab | CHANGED | rc=0 >>
   Static hostname: CentOS7.2daygeek.com
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 002f47b82af248f5be1d67b67e03514c
           Boot ID: dc38f9b8089d4b2d9304e526e00c6a8f
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-957.el7.x86_64
      Architecture: x86-64
node2.2g.lab | CHANGED | rc=0 >>
   Static hostname: node2.2g.lab
         Icon name: computer-vm
           Chassis: vm
        Machine ID: e39e3a27005d44d8bcbfcab201480b45
           Boot ID: 27b46a09dde546da95ace03420fe12cb
    Virtualization: oracle
  Operating System: CentOS Linux 8 (Core)
       CPE OS Name: cpe:/o:centos:centos:8
            Kernel: Linux 4.18.0-80.el8.x86_64
      Architecture: x86-64
```

参考：[Ansible 文档][11]。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-configure-ansible-automation-tool-linux-quick-start-guide/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/wp-content/uploads/2020/01/ansible-architecture-2daygeek.png
[2]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[3]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-oracle-linux/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[7]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[10]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
[11]: https://docs.ansible.com/ansible/latest/user_guide/index.html
