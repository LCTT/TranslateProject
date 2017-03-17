LXD 2.0 系列（十一）：LXD 和 OpenStack
======================================

这是 [LXD 2.0 系列介绍文章][1]的第十一篇。

![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

### 介绍

首先对这次的延期抱歉。为了让一切正常我花了很长时间。我第一次尝试是使用 devstack 时遇到了一些必须解决问题。 然而即使这样，我还是不能够使网络正常。

我终于放弃了 devstack，并使用用户友好的 Juju 尝试使用 “conjure-up” 部署完整的 Ubuntu OpenStack。它终于工作了！

下面是如何运行一个完整的 OpenStack，使用 LXD 容器而不是 VM，并在 LXD 容器中运行所有这些（嵌套的！）。

### 要求

这篇文章假设你有一个可以工作的 LXD 设置，提供容器网络访问，并且你有一个非常强大的 CPU，大约 50GB 给容器空间和至少 16G B的内存。

记住，我们在这里运行一个完整的 OpenStack，这东西不是很轻量！

### 设置容器

OpenStack 由大量不同做不同事情的组件组成。 一些需要一些额外的特权，为了可以使设置更简单，我们将使用特权容器。

我们将配置支持嵌套的容器，预加载所有需要的内核模块，并允许它访问 `/dev/mem`（显然是需要的）。

请注意，这意味着 LXD 容器的大部分安全特性对该容器被禁用。 然而由 OpenStack 自身产生的容器将是无特权的，并且可以正常使用 LXD 的安全特性。

```
lxc launch ubuntu:16.04 openstack -c security.privileged=true -c security.nesting=true -c "linux.kernel_modules=iptable_nat, ip6table_nat, ebtables, openvswitch"
lxc config device add openstack mem unix-char path=/dev/mem
```

LXD 中有一个小 bug，它会尝试加载已经加载到主机上的内核模块。这已在LXD 2.5中得到修复，并将在LXD 2.0.6 中修复，但在此之前，可以使用以下方法：

```
lxc exec openstack -- ln -s /bin/true /usr/local/bin/modprobe
```

我们需要加几条 PPA 并安装 conjure-up，它是我们用来安装 OpenStack 的部署工具。

```
lxc exec openstack -- apt-add-repository ppa:conjure-up/next -y
lxc exec openstack -- apt-add-repository ppa:juju/stable -y
lxc exec openstack -- apt update
lxc exec openstack -- apt dist-upgrade -y
lxc exec openstack -- apt install conjure-up -y
```

最后一步是在容器内部配置 LXD 网络。

所有问题都选择默认，除了：

* 使用 `dir` 存储后端（ `zfs` 不在嵌套容器中用）
* 不要配置 IPv6 网络（conjure-up/juju 不太兼容它）

```
lxc exec openstack -- lxd init
```

现在配置完容器了，现在我们部署 OpenStack！

### 用 conjure-up 部署 OpenStack

如先前提到的，我们用 conjure-up 部署 OpenStack。

这是一个很棒的用户友好的可以与 Juju 交互来部署复杂服务的工具。

首先：

```
lxc exec openstack -- sudo -u ubuntu -i conjure-up
```

*   选择 “OpenStack with NovaLXD”
*   选择 “localhost” 作为部署目标（使用 LXD）
*   点击 “Deploy all remaining applications”

接下来会部署 OpenStack。整个过程会花费一个多小时，这取决于你运行的机器。你将看到所有服务会被分配一个容器，然后部署并最终互连。

![Conjure-Up deploying OpenStack](https://www.stgraber.org/wp-content/uploads/2016/10/conjure-up.png) 

部署完成后会显示一个安装完成的界面。它会导入一些初始镜像、设置 SSH 权限、配置网络最后会显示面板的 IP 地址。

### 访问面板并生成一个容器

面板运行在一个容器中，因此你不能直接从浏览器中访问。

最简单的方法是设置一条 NAT 规则：

```
lxc exec openstack -- iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to <IP>
```

其中 `<ip>` 是 conjure-up 在安装结束时给你的面板 IP 地址。

你现在可以获取 “openstack” 容器的 IP 地址（来自 `lxc info openstack`），并将浏览器指向：http://\<container ip>/horizon 。

第一次加载可能需要几分钟。 一旦显示了登录界面，输入默认登录名和密码（admin/openstack），你就会看到OpenStack的欢迎面板！

![oslxd-dashboard](https://www.stgraber.org/wp-content/uploads/2016/10/oslxd-dashboard.png)

现在可以选择左边的 “Project” 选项卡，进入 “Instances” 页面。 要启动一个使用 nova-lxd 的新实例，点击 “Launch instance”，选择你想要的镜像，网络等，接着你的实例就产生了。

一旦它运行后，你可以为它分配一个浮动 IP，它将允许你从你的 “openstack” 容器中访问你的实例。

### 总结

OpenStack 是一个非常复杂的软件，你也不会想在家里或在单个服务器上运行它。 但是，不管怎样在你的机器上包含这些服务在一个容器中都是非常有趣的。

conjure-up 是部署这种复杂软件的一个很好的工具，背后使用 Juju 驱动部署，为每个单独的服务使用 LXD 容器，最后是实例本身。

它也是少数几个容器嵌套多层并实际上有意义的情况之一！

### 额外信息

conjure-up 网站： http://conjure-up.io

Juju 网站： http://www.ubuntu.com/cloud/juju

LXD 的主站在： https://linuxcontainers.org/lxd

LXD 的 GitHub 仓库： https://github.com/lxc/lxd

LXD 的邮件列表： https://lists.linuxcontainers.org

LXD 的 IRC 频道： #lxcontainers on irc.freenode.net

如果你不想或者不能在你的机器上安装 LXD ，你可以在 web 上试试在线版的 LXD。

--------------------------------------------------------------------------

作者简介：我是Stéphane Graber。我是LXC和LXD项目的领导者，目前在加拿大魁北克蒙特利尔的家所在的Canonical有限公司担任LXD的技术主管。

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/10/26/lxd-2-0-lxd-and-openstack-1112/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
