[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11633-1.html)
[#]: subject: (How to Install Ansible (Automation Tool) on CentOS 8/RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-ansible-centos-8-rhel-8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 CentOS 8/RHEL 8 上安装 Ansible（自动化工具）
======

Ansible 是给 Linux 系统管理员使用的出色自动化工具。它是一种开源配置工具，能让系统管理员可以从一个中心节点（即 Ansible 服务器）管理数百台服务器。将 Ansible 与 Puppet、Chef 和 Salt 等类似工具进行比较时，它是首选的配置工具，因为它不需要任何代理，并且可以工作在 SSH 和 python 上。

![](https://img.linux.net.cn/data/attachment/album/201912/01/223012czkxt6dhku6snhxn.jpg)

在本教程中，我们将学习如何在 CentOS 8 和 RHEL 8 系统上安装和使用 Ansble。

Ansible 实验环境信息：

* 最小化安装的 CentOS 8 / RHEL 8 服务器（192.168.1.10），且有互联网连接
* 两个 Ansible 节点 - Ubuntu 18.04 LTS （192.168.1.20） 和 CentOS 7 （192.168.1.30）

### CentOS 8 上的 Ansible 安装步骤

Ansible 包不在 CentOS 8 默认的软件包仓库中。因此，我们需要执行以下命令启用 [EPEL 仓库][3]：

```
[root@linuxtechi ~]$ sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
```

启用 epel 仓库后，执行以下 `dnf` 命令安装 Ansible：

```
[root@linuxtechi ~]$ sudo dnf install ansible
```

上面命令的输出：

![dnf-install-ansible-centos8][4]

成功安装 Ansible 后，运行以下命令验证它的版本：

```
[root@linuxtechi ~]$ sudo ansible --version
```

![Ansible-version-CentOS8][5]

上面的输出确认在 CentOS 8 上安装完成。

让我们看下 RHEL 8 系统。

### RHEL 8 上的 Ansible 安装步骤

如果你有有效的 RHEL 8 订阅，请使用以下订阅管理器命令启用 Ansble 仓库：

```
[root@linuxtechi ~]$ sudo subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
```

启用仓库后，执行以下 `dnf` 命令安装 Ansible：

```
[root@linuxtechi ~]$ sudo dnf install ansible -y
```

安装 Ansible 及其依赖包后，执行以下命令来验证它的版本：

```
[root@linuxtechi ~]$ sudo ansible --version
```

### 在 CentOS 8 / RHEL 8 上通过 pip3 安装 Ansible 的可选方法

如果你希望使用 `pip`（Python 的包管理器）安装 Ansible，请首先使用以下命令安装 pyhton3 和 python3-pip 包：

```
[root@linuxtechi ~]$ sudo dnf install python3 python3-pip -y
```

安装 python3 后，运行以下命令来验证它的版本：

```
[root@linuxtechi ~]$ python3 -V
Python 3.6.8
[root@linuxtechi ~]$
```

用下面的 `pip3` 命令安装 Ansible：

```
[root@linuxtechi ~]$ pip3 install ansible --user
```

输出：

![Ansible-Install-pip3-centos8][6]

上面的输出确认 Ansible 已成功使用 `pip3` 安装。让我们看下如何使用 Ansible。

### 如何使用 Ansible 自动化工具？

当我们使用 `yum` 或 `dnf` 命令安装 Ansible 时，它的配置文件、清单文件和角色目录会自动在 `/etc/ansible` 文件夹下创建。

让我们添加一个名称为 `labservers` 的组，并在 `/etc/ansible/hosts` 文件中给该组添加上述的 Ubuntu 18.04 和 CentOS 7 系统的 IP 地址：

```
[root@linuxtechi ~]$ sudo vi /etc/ansible/hosts
…
[labservers]
192.168.1.20
192.168.1.30
…
```

保存并退出文件。

更新清单文件（`/etc/ansible/hosts`）后，将用户的 ssh 公钥放到属于 `labservers` 组的远程系统。

让我们首先使用 `ssh-keygen` 命令生成本地用户的公钥和私钥：

```
[root@linuxtechi ~]$ ssh-keygen
```

现在使用以下命令在 Ansible 服务器及其客户端之间交换公钥：

```
[root@linuxtechi ~]$ ssh-copy-id root@linuxtechi
[root@linuxtechi ~]$ ssh-copy-id root@linuxtechi
```

现在，让我们尝试几个 Ansible 命令，首先使用 `ping` 模块验证 Ansible 服务器与客户端的连接：

```
[root@linuxtechi ~]$ ansible -m ping "labservers"
```

注意： 如果我们没有在上面的命令中指定清单文件，那么它将引用默认主机文件（即 `/etc/ansible/hosts`）。

输出：

![ansible-ping-module-centos8][7]

让我们使用 Ansible shell 命令检查每个客户端的内核版本：

```
[root@linuxtechi ~]$ ansible -m command -a "uname -r" "labservers"
192.168.1.30 | CHANGED | rc=0 >>
4.15.0-20-generic
192.168.1.20 | CHANGED | rc=0 >>
3.10.0-327.el7.x86_64
[root@linuxtechi ~]$
```

使用以下命令列出清单文件中的所有主机：

```
[root@linuxtechi ~]$ ansible all -i /etc/ansible/hosts --list-hosts
  hosts (4):
    192.168.100.1
    192.168.100.10
    192.168.1.20
    192.168.1.30
[root@linuxtechi ~]$
```

使用以下 Ansible 命令仅列出 `labservers` 组中的主机：

```
root@linuxtechi ~]$ ansible labservers -i /etc/ansible/hosts --list-hosts
  hosts (2):
    192.168.1.20
    192.168.1.30
[root@linuxtechi ~]$
```

本文就是这些了，我们成功演示了如何在 CentOS 8 和 RHEL 8 系统中安装和使用 Ansible。请分享你的反馈和意见。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-ansible-centos-8-rhel-8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.linuxtechi.com/wp-content/uploads/2019/11/Install-Ansible-CentOS8-RHEL8.png
[3]: http://www.linuxtechi.com/enable-epel-repo-centos8-rhel8-server/
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/11/dnf-install-ansible-centos8-1536x652.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Ansible-version-CentOS8.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Ansible-Install-pip3-centos8-1536x545.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/11/ansible-ping-module-centos8.png
