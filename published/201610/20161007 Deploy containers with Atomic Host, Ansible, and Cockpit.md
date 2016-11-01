使用原子主机（Atomic Host）、Ansible 和 Cockpit 部署容器
==============

![atomic-ansible-cockpit-containers](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/atomic-ansible-cockpit-containers.jpg?fit=945%2C400&ssl=1)

我在[红帽](https://www.redhat.com/)工作的期间，每天在 [Fedora Atomic host](https://getfedora.org/en/cloud/download/atomic.html) 上使用 [Docker](https://www.docker.com/) 容器。 来自 [原子项目（Project Atomic）](http://www.projectatomic.io/)的原子主机（Atomic Host）是一个轻量级容器操作系统，可以以 Docker 格式运行 Linux 容器。它专门为提高效率而定制，使其成为用于云环境的 Docker 运行时系统的理想选择。

幸运的是，我发现一个很好的方式来管理在主机上运行的容器：[Cockpit](http://cockpit-project.org/)。 它是一个具有漂亮的 Web 界面的 GNU/Linux 服务器远程管理工具。它可以帮我管理在主机上运行的服务器和容器。你可以在从之前发布在这里的[这篇概述](https://fedoramagazine.org/cockpit-overview/)中了解 Cockpit 的更多信息。不过，我也希望在主机上可以自动运行容器，我可以使用 [Ansible](https://www.ansible.com/) 来完成这个工作。

请注意，我们不能在原子主机上使用 dnf 命令。原子主机并没有设计为通用操作系统，而是更适合容器和其他用途。但在原子主机上设置应用程序和服务仍然非常容易。这篇文章向您展示了如何自动化和简化这个过程。

### 设置组件

开始之前，请确保你的系统上安装了 Ansible。

```
sudo dnf -y install ansible
```

首先，我们需要在原子主机上运行 cockpit 容器。在你的机器上从 https://github.com/trishnaguha/fedora-cloud-ansible 下载它的源代码。

```
$ git clone https://github.com/trishnaguha/fedora-cloud-ansible.git
```

现在切换到 `cockpit` 的目录，并如下编辑 `inventory` 文件：
```
$ cd fedora-cloud-ansible
$ cd cockpit
$ vim inventory
```

完成如下修改：

1. 使用你的原子主机的 IP 替换掉 `IP_ADDRESS_OF_HOST`。
2. 用您的 SSH 私钥文件的路径替换 `ansible_ssh_private_key_file ='PRIVATE_KEY_FILE'` 行中的`PRIVATE_KEY_FILE`。

然后保存并退出 `inventory` 文件编辑。

接下来，编辑 ansible 配置文件：

```
$ vim ansible.cfg
```

替换 `remote_user=User` 中 `User` 为你的原子主机上的远程用户名。然后保存并退出文件编辑。

### 结合起来

现在是运行 Ansible 的 PlayBook 的时候了。此命令开始运行原子主机上的 Cockpit 容器：

```
$ ansible-playbook cockpit.yml
```

Cockpit 现在运行在原子主机上了。使用浏览器去访问你的实例的公网 IP 的 9090 端口——这是 Cockpit 的默认端口。举个例子，如果该实例的 IP 地址是 192.168.1.4，就去访问 192.168.1.4:9090，你将会看到如下的 Web 界面：

![Cockpit login screen](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-02-27.jpg?ssl=1)

### 管理你的容器

使用原子主机的登录信息或以 root 用户身份登录。然后访问 Cockpit 管理器上的 Containers 部分来查看原子主机上运行的容器。在下面的示例中，您会看到我还设置了其他容器，如 [httpd](https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/httpd) 和 [redis](https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/redis)：

![Cockpit panel for managing containers](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-13-05.jpg?ssl=1)

注意，该界面允许您直接在 Cockpit 管理器中使用 Run 和 Stop 按钮启动和停止容器。您还可以使用 Cockpit 管理器管理您的原子主机。转到 Tools -> Terminals，在这里里你可以使用原子主机的终端：

![Cockpit terminal panel](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-10-19.jpg?ssl=1)

如果您打算在原子主机上部署容器化的应用程序，则可以简单地为其编写一个 PlayBook。然后，您可以使用 `ansible-playbook` 命令进行部署，并使用 Cockpit 来管理容器。

![Running ansible-playbook to deploy multiple containers](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/FotoFlexer_Photo51.jpg?ssl=1)

欢迎你对这个[仓库](https://github.com/trishnaguha/fedora-cloud-ansible)进行分支或添加容器的 PlayBook。

------

via: https://fedoramagazine.org/deploy-containers-atomic-host-ansible-cockpit/

作者：[trishnag][a]
译者：[Bestony](https://github.com/Bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/trishnag/
