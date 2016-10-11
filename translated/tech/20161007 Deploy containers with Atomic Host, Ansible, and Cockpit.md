# 使用Atomic Host，Ansible和Cockpit部署容器

![atomic-ansible-cockpit-containers](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/atomic-ansible-cockpit-containers.jpg?fit=945%2C400&ssl=1)

在我在[红帽](https://www.redhat.com/)工作的过程中, 我每天在 [Fedora Atomic host](https://getfedora.org/en/cloud/download/atomic.html) 上使用 [Docker](https://www.docker.com/). 来自[Project Atomic](http://www.projectatomic.io/)的Atomic Host是一个轻量级容器操作系统，可以以Docker格式运行Linux容器。它为提高效率被修改，使其成为用于云环境的Docker运行时系统的最佳选择。

幸运的是，我发现一个很好的方式来管理在主机上运行的容器： [Cockpit](http://cockpit-project.org/). Cockpit是一个具有漂亮的Web UI的GNU / Linux服务器的远程管理器。它帮我管理在主机上运行的服务器和容器。你可以看更多的关于Cockpit在之前发布的 [这篇导览文](https://fedoramagazine.org/cockpit-overview/)  但是，我也想在主机上自动运行容器，我已经使用 [Ansible](https://www.ansible.com/).

请注意，我们不能在Atomic主机上使用dnf命令。主机不是设计为通用操作系统，而是更适合容器和其他目的。但在Atomic主机上设置应用程序和服务仍然非常容易。这篇文章向您展示了如何自动化和简化这个过程。

### 设置组件

开始之前，请确保你的系统上安装了Ansible。

```
sudo dnf -y install ansible
```

```
$ git clone https://github.com/trishnaguha/fedora-cloud-ansible.git
```

```
$ cd fedora-cloud-ansible
$ cd cockpit
$ vim inventory
```

1. 使用你的Atomic 主机IP替换掉 IP_ADDRESS_OF_HOST。
2. 用您的SSH私钥文件的路径替换行ansible_ssh_private_key_file ='PRIVATE_KEY_FILE'中的PRIVATE_KEY_FILE。

现在保存并退出 inventory 文件。

接下来，编辑 ansible 配置文件：

```
$ vim ansible.cfg
```

### 把他们放在一起！

现在是运行PlayBook的时候了。此命令开始运行Atomic主机上的Cockpit容器：

```
$ ansible-playbook cockpit.yml
```

[![Cockpit login screen](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-02-27.jpg?resize=676%2C321&ssl=1)](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-02-27.jpg?ssl=1)

### 管理你的容器

使用Atomic主机的凭据或以root用户身份登录。然后访问Cockpit管理器上的Containers部分，查看Atomic主机上运行的容器。在下面的示例中，您会看到我还设置了其他类似 [httpd](https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/httpd) 和 [redis](https://github.com/trishnaguha/fedora-cloud-ansible/tree/master/redis):

[![Cockpit panel for managing containers](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-13-05.jpg?resize=676%2C284&ssl=1)](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-13-05.jpg?ssl=1)

注意，该界面允许您直接在Cockpit管理器中使用Run和Stop按钮启动和停止容器。您还可以使用Cockpit管理器管理您的Atomic主机。转到工具 - >终端。在这里里你可以使用Atomic主机的终端：

[![Cockpit terminal panel](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-10-19.jpg?resize=676%2C279&ssl=1)](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-10-03-12-10-19.jpg?ssl=1)

如果您打算在Atomic主机上部署容器化的应用程序，则可以简单地为其编写PlayBook。然后，您可以使用ansible-playbook命令进行部署，并使用Cockpit管理容器。

[![Running ansible-playbook to deploy multiple containers](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/FotoFlexer_Photo51.jpg?resize=650%2C663&ssl=1)](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/FotoFlexer_Photo51.jpg?ssl=1)

你可以随意的Fork或添加容器的PlayBook在这个仓库 [https://github.com/trishnaguha/fedora-cloud-ansible](https://github.com/trishnaguha/fedora-cloud-ansible).

------

via: https://fedoramagazine.org/deploy-containers-atomic-host-ansible-cockpit/

作者：[trishnag][a]

译者：[Bestony](https://github.com/Bestony)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/trishnag/
