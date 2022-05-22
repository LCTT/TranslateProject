[#]: subject: (Using Ansible to configure Podman containers)
[#]: via: (https://fedoramagazine.org/using-ansible-to-configure-podman-containers/)
[#]: author: (mahesh1b https://fedoramagazine.org/author/mahesh1b/)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13396-1.html)

使用 Ansible 配置 Podman 容器
======

![](https://img.linux.net.cn/data/attachment/album/202105/16/121225oyf5q2sn4fyyeu6z.jpg)

在复杂的 IT 基础设施中，有许多重复性任务。成功运行这些任务并不容易。运行失败大多数是人为错误引发。在 Ansible 帮助下，你可以通过远程主机来执行所有任务，这些远程主机按照<ruby>行动手册<rt>playbook</rt></ruby>执行，行动手册可以根据需要重复使用多次。在本文中，你将学习如何在 Fedora Linux 上安装、配置 Ansible，以及如何使用它来管理、配置 Podman 容器。

### Ansible

[Ansible][4] 是一个由红帽赞助的开源基础设施自动化工具。它可以处理大型基础设施带来的所有问题，例如安装和更新软件包、备份、确保特定服务持续运行等等。你用 YAML 写的行动手册来做这些事。Ansible 行动手册可以反复使用，使系统管理员的工作不那么复杂。行动手册减少了重复任务，并且可以轻松修改。但是我们有很多像 Ansible 一样的自动化工具，为什么要用它呢？与其他一些配置管理工具不同，Ansible 是无代理的：你不必在受管节点上安装任何东西。

### Podman

[Podman][6] 是一个开源的容器引擎，用于开发、管理和运行容器镜像。但什么是容器呢？每当你创建任何新应用程序并将其部署在物理服务器、云服务器或虚拟机上时，你面临的最常见问题是可移植性和兼容性。这就是容器出现的原因。容器在操作系统级别上进行虚拟化，因此它们只包含所需的库和应用程序服务。容器的好处包括：

  * 便携性
  * 隔离性
  * 扩展性
  * 轻量级
  * 快速启动
  * 更小的磁盘和内存需求

简而言之：当你为任何应用程序构建容器镜像时，所有必需的依赖项都被打包到容器中。你现在可以在任何主机操作系统上运行该容器，没有任何可移植性和兼容性问题。

Podman 的关键亮点在于它没有守护程序，因此不需要 root 权限来运行容器。你可以借助 Dockerfile 构建容器镜像，或者从 Docker Hub、[fedoraproject.org][7] 或 [Quay][8] 上拉取镜像。

### 为什么用 Ansible 配置 Podman？

Ansible 提供了一种轻松多次运行重复任务的方法。它还为云提供商（如 AWS、GCP 和 Azure）、容器管理工具（如 Docker 和 Podman）与数据库管理提供了大量模块。Ansible 还有一个社区（[Ansible Galaxy][10]），在这里你可以找到大量 Ansible <ruby>角色<rt>Roles</rt></ruby>，它们由来自世界各地的贡献者创建。因为这些，Ansible 成为了 DevOps 工程师和系统管理员手中的好工具。

借助 DevOps，应用程序的开发步伐很快。开发的应用不局限于任意操作系统，这点至关重要。这就是 Podman 出现的地方。

### 安装 Ansible

首先，安装 Ansible：

```
$ sudo dnf install ansible -y
```

### 配置 Ansible

Ansible 需要在受管节点上运行 ssh，所以首先生成一个<ruby>密钥对<rt>Key Pair</rt></ruby>。

```
$ ssh-keygen
```

生成密钥后，将密钥复制到受管节点。

输入 `yes`，然后输入受管节点的密码。现在可以远程访问受管主机。

为了能够访问受管节点，你需要将所有主机名或 IP 地址存储在清单文件中。默认情况下，这是在 `~/etc/ansible/hosts`。

这是<ruby>库存<rt>inventory</rt></ruby>文件的样子。方括号用于将组分配给某些特定的节点。

```
[group1]
green.example.com
blue.example.com
[group2]
192.168.100.11
192.168.100.10
```

检查所有受管节点是否可以到达。

```
$ ansible all -m ping
```

你可以看到如下输出：

```
[mahesh@fedora new] $ ansible all -m ping
fedora.example.com I SUCCESS {
    "ansibe_facts": {
       "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
[mahesh@fedora new] $
```

现在创建你的第一个<ruby>行动手册<rt>playbook</rt></ruby>，它将在受管节点上安装 Podman。首先用 .yml 拓展名创建一个任意名称的文件。

```
$ vim name_of_playbook.yml
```

行动手册应该如下所示。第一个字段是行动手册的名称。主机字段（`hosts`）用于提及清单中提到的主机名或组名。`become: yes` 表示升级权限，以及任务（`tasks`）包含所要执行的任务，这里的名称（`name`）指定任务（`tasks`）名称，`yum` 是安装软件包的模块，下面在名称字段（`name`）指定软件包名称，在状态字段（`state`）指定安装或删除软件包。

```
---
 - name: First playbook
   hosts: fedora.example.com
   become: yes
   tasks:
     - name: Installing podman.
       yum:
         name: podman
         state: present
```

检查文件中是否有语法错误：

```
$ ansible-playbook filename --syntax-check
```

现在运行行动手册：

```
$ ansible-playbook filename
```

你可以看到如下输出：

```
[mahesh@fedora new] $ ansible-playbook podman_installation.yml
PLAY [First playbook] *************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
0k: [fedora.example.com]

TASK [Installing podman] ************************************************************************************************
changed: [fedora.example.com]

PLAY RECAP *************************************************************************************************
fedora.example.com    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
[mahesh@fedora new] $
```

现在创建一个新的行动手册，从 Docker Hub 中拉取一个镜像。你将使用 `podman_image` 模块从 Docker Hub 中提取版本号为 2-alpine 的 httpd 镜像。

```
---
 - name: Playbook for podman.
    hosts: fedora.example.com
    tasks:
     - name: Pull httpd:2-alpine image from dockerhub.
       podman_image:
         name: docker.io/httpd
         tag: 2-alpine
```

现在检查已拉取的镜像：

```
[mahesh@fedora new] $ podman images
REPOSITORY                           TAG                  IMAGE ID           CREATED             SIZE
docker.io/library/httpd       2-alpine         fa848876521a    11 days ago        57 MB

[mahesh@fedora new] $
```

创建一个新的行动手册来运行 httpd 镜像。更多信息请查看 [podman_container][11] 模块文档。

```
---
 - name: Playbook for podman.
   hosts: fedora.example.com
   tasks:
     - name: Running httpd image.
       containers.podman.podman_container:
         name: my-first-container
         image:  docker.io/httpd:2-alpine
         state: started
```

检查容器运行状态。

```
[mahesh@fedora new] $ podman ps
CONTAINER ID        IMAGE    COMMAND   CREATED      STATUS         PORTS         NAMES
45d966eOe207     docker.io/library/httpd:2-alpine    httpd-foreground    13 seconds ago    Up 13 seconds ago       my-first-container

[mahesh@fedora new] $
```

现在停止已运行的容器，改变状态，由 `started` 变为 `absent`。

```
- name: Stopping httpd container.
  containers.podman.podman_container:
    name: my-first-container
    image: docker.io/httpd:2-alpine
    state: absent
```

当你执行 `podman ps` 命令时，你看不到任何运行的容器。

```
[mahesh@fedora new] $ podman ps
CONTAINER ID    IMAGE    COMMAND    CREATED    STATUS    PORTS    NAMES

[mahesh@fedora new] $
```

`podman_container` 可以做很多事情，例如重新创建容器、重新启动容器、检查容器是否正在运行等等。有关执行这些操作的信息，请参考 [文档][11]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-to-configure-podman-containers/

作者：[mahesh1b][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mahesh1b/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/ansible-podman-1-816x345.jpg
[2]: https://unsplash.com/@vnevremeni?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/container?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.ansible.com/
[5]: https://fedoramagazine.org/tag/ansible/
[6]: https://podman.io/
[7]: https://registry.fedoraproject.org/
[8]: https://www.projectquay.io/
[9]: https://fedoramagazine.org/tag/podman/
[10]: https://galaxy.ansible.com/
[11]: https://docs.ansible.com/ansible/latest/collections/containers/podman/podman_container_module.html
