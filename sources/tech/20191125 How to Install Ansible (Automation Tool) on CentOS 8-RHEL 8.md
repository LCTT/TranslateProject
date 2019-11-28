[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Ansible (Automation Tool) on CentOS 8/RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-ansible-centos-8-rhel-8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 CentOS 8/RHEL 8 上安装 Ansible（自动化工具）
======

**Ansible** 是给 Linux 系统管理员使用的出色自动化工具。它是一种开源配置工具，能让系统管理员可以从一个中心节点（即 **Ansible 服务器**）管理数百台服务器。将 Ansible 与 **Puppet**、**Chef** 和 **Salt**等类似工具进行比较时，它是首选的配置工具，因为它不需要任何代理，并且可以工作在 SSH 和 python 上。

[![Install-Ansible-CentOS8-RHEL8][1]][2]

在本教程中，我们将学习如何在 CentOS 8 和 RHEL 8 系统上安装和使用 Ansble

Ansible 实验环境信息：

  * Minimal CentOS 8 / RHEL 8 服务器（192.168.1.10），且有互联网连接
  * 两个 Ansible 节点 - Ubuntu 18.04 LTS （192.168.1.20） 和 CentOS 7 （192.168.1.30）



### CentOS 8 上的 Ansible 安装步骤


Ansible 包不在 CentOS 8 默认的软件包仓库中。因此，我们需要执行以下命令启用 [EPEL 仓库][3]，

```
[root@linuxtechi ~]$ sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
```

启用 epel 仓库后，执行以下 dnf 命令安装 Ansble。

```
[root@linuxtechi ~]$ sudo dnf install ansible
```

上面命令的输出：

![dnf-install-ansible-centos8][1]

成功安装 ansible 后，运行以下命令验证它的版本。

```
[root@linuxtechi ~]$ sudo ansible --version
```

![Ansible-version-CentOS8][1]

上面的输出确认在 CentOS 8 上安装完成。

让我们看下 RHEL 8 系统。

### RHEL 8 上的 Ansible 安装步骤

如果你有有效的 RHEL 8 订阅，请使用以下订阅管理器命令启用 Ansble 仓库，

```
[root@linuxtechi ~]$ sudo subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
```

启用仓库后，执行以下 dnf 命令安装 Ansible，

```
[root@linuxtechi ~]$ sudo dnf install ansible -y
```

安装 ansible 及其依赖包后，执行以下命令来验证它的版本，

```
[root@linuxtechi ~]$ sudo ansible --version
```

### 在 CentOS 8 / RHEL 8 上通过 pip3 安装 Ansible 的可选方法

如果你希望使用 **pip**（python 的包管理器）安装 Ansible，请首先使用以下命令安装 pyhton3 和 python3-pip 包，

```
[root@linuxtechi ~]$ sudo dnf install python3 python3-pip -y
```

安装 python3 后，运行以下命令来验证它的版本。

```
[root@linuxtechi ~]$ python3 -V
Python 3.6.8
[root@linuxtechi ~]$
```

命令下面的 pip3 命令安装 Ansible，

```
[root@linuxtechi ~]$ pip3 install ansible --user
```

输出，

![Ansible-Install-pip3-centos8][1]

上面的输出确认 Ansible 已成功使用 pip3 安装。让我们看下如何使用 Ansible。

### 如何使用 Ansible 自动化工具？

当我们使用 yum 或 dnf 命令安装 Ansible 时，它的配置文件、清单文件和角色目录会自动在 /etc/ansible 文件夹下创建。

让我们添加一个名称为 “**labservers**” 的组，并在 **/etc/ansible/hosts** 文件中给该组添加 Ubuntu 18.04 和 CentOS 7 的系统 IP 地址。

```
[root@linuxtechi ~]$ sudo vi /etc/ansible/hosts
…
[labservers]
192.168.1.20
192.168.1.30
…
```

保存并退出文件。

Once the inventory file (/etc/ansible/hosts) is updated then exchange your user’s ssh public keys with remote systems which are part of “labservers” group.
更新清单文件（/etc/ansible/hosts）后，将用户的 ssh 公钥与作为 “”组一部分的远程系统交换。

Let’s first generate your local user’s public and private key using ssh-keygen command,

```
[root@linuxtechi ~]$ ssh-keygen
```

Now exchange public key between the ansible server and its clients using the following command,

```
[root@linuxtechi ~]$ ssh-copy-id root@linuxtechi
[root@linuxtechi ~]$ ssh-copy-id root@linuxtechi
```

Now let’s try couple of Ansible commands, first verify the connectivity from Ansible server to its clients using ping module,

```
[root@linuxtechi ~]$ ansible -m ping "labservers"
```

**Note:** If we don’t specify the inventory file in above command then it will refer the default hosts file (i.e /etc/ansible/hosts)

Output,

![ansible-ping-module-centos8][1]

Let’s check kernel version of each client using Ansible shell command,

```
[root@linuxtechi ~]$ ansible -m command -a "uname -r" "labservers"
192.168.1.30 | CHANGED | rc=0 >>
4.15.0-20-generic
192.168.1.20 | CHANGED | rc=0 >>
3.10.0-327.el7.x86_64
[root@linuxtechi ~]$
```

Use the following ansible command to list all hosts from the inventory file,

```
[root@linuxtechi ~]$ ansible all -i /etc/ansible/hosts --list-hosts
  hosts (4):
    192.168.100.1
    192.168.100.10
    192.168.1.20
    192.168.1.30
[root@linuxtechi ~]$
```

Use the following ansible command to list only hosts from “labservers” group

```
root@linuxtechi ~]$ ansible labservers -i /etc/ansible/hosts --list-hosts
  hosts (2):
    192.168.1.20
    192.168.1.30
[root@linuxtechi ~]$
```

That’s all from this article, we have successfully demonstrated on how to install and use Ansible on CentOS 8 and RHEL 8 System. Please do you share your feedback and comments.

  * [Facebook][4]
  * [Twitter][5]
  * [LinkedIn][6]
  * [Reddit][7]



--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-ansible-centos-8-rhel-8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.linuxtechi.com/wp-content/uploads/2019/11/Install-Ansible-CentOS8-RHEL8.png
[3]: http://www.linuxtechi.com/enable-epel-repo-centos8-rhel8-server/
[4]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-ansible-centos-8-rhel-8%2F&t=How%20to%20Install%20Ansible%20%28Automation%20Tool%29%20on%20CentOS%208%2FRHEL%208
[5]: http://twitter.com/share?text=How%20to%20Install%20Ansible%20%28Automation%20Tool%29%20on%20CentOS%208%2FRHEL%208&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-ansible-centos-8-rhel-8%2F&via=Linuxtechi
[6]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-ansible-centos-8-rhel-8%2F&title=How%20to%20Install%20Ansible%20%28Automation%20Tool%29%20on%20CentOS%208%2FRHEL%208
[7]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-ansible-centos-8-rhel-8%2F&title=How%20to%20Install%20Ansible%20%28Automation%20Tool%29%20on%20CentOS%208%2FRHEL%208
