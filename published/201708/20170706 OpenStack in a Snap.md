在 Snap 中玩转 OpenStack
================================

![](https://insights.ubuntu.com/wp-content/uploads/646b/openstaack-in-a-snap.png)

OpenStack 非常复杂，许多社区成员都在努力使 OpenStack 的部署和操作更加容易。其中大部分时间都用来改善相关工具，如：Ansible、Puppet、Kolla、Juju、Triple-O 和 Chef (仅举几例)。但是，如果我们降低一下标准，并且还能使包的体验更加简单，将会怎样呢？

我们正在努力通过 snap 包来实现这一点。snap 包是一种新兴的软件分发方式，这段来自 [snapcraft.io][1] 的介绍很好的总结了它的主要优点：_snap 包可以快速安装、易于创建、安全运行而且能自动地事务化更新，因此你的应用程序总是能保持最新的状态并且永远不会被破坏。_

### 捆绑软件

单个 snap 包可以内嵌多个不同来源的软件，从而提供一个能够快速启动和运行的解决方案。当你安装 snap 包时，你会发现安装速度是很快的，这是因为单个 snap 包捆绑了所有它需要的依赖。这和安装 deb 包有些不同，因为它需要下载所有的依赖然后分别进行安装。

### Snap 包制作简单

在 Ubuntu 工作的时候，我花了很多时间为 Debian 制作 OpenStack 的安装包。这是一种很特殊技能，需要花很长时间才能理解其中的细微差别。与 snap 包相比，deb 包和 snap 包在复杂性上的差异有天壤之别。snap 包简单易行，并且相当有趣。

### Snap 包的其它特性

*   每个 snap 包都安装在其独有的只读 squashfs 文件系统中。
*   每个 snap 包都运行在一个由 AppArmor 和 seccomp 策略构建的严格沙箱环境中。
*   snap 包能事务更新。新版本的 snap 包会安装到一个新的只读 squashfs 文件系统中。如果升级失败，它将回滚到旧版本。
*   当有新版本可用时，snap 包将自动更新。
*   OpenStack 的 snap 包能保证与 OpenStack 的上游约束保持一致。打包的人不需要再为 OpenStack 依赖链维护单独的包。这真是太爽了!

### OpenStack snap 包介绍

现在，下面这些项目已经有了相应的 snap 包：

*   `Keystone` —— 这个 snap 包为 OpenStack 提供了身份鉴证服务。
*   `Glance` —— 这个 snap 包为 OpenStack 提供了镜像服务。
*   `Neutron` —— 这个 snap 包专门提供了 neutron-server 过程，作为 OpenStack 部署过程的一个 snap 包。
*   `Nova` —— 这个 snap 包提供 OpenStack 部署过程中的 Nova 控制器组件。
*   `Nova-hypervisor` —— 这个 snap 包提供 OpenStack 部署过程中的 hypervisor 组件，并且配置使用通过 deb 包安装的 Libvirt/KVM + Open vSwitch 组合。这个 snap 包同时也包含 nava-lxd，这允许我们使用 nova-lxd 而不用 KVM。

这些 snpa 包已经能让我们部署一个简单可工作的 OpenStack 云。你可以在 [github][2] 上找到所有这些 OpenStack snap 包的源码。有关 OpenStack snap 包更多的细节，请参考上游存储库中各自的 README。在那里，你可以找到更多有关管理 snap 包的信息，比如覆盖默认配置、重启服务、设置别名等等。

### 想要创建自己的 OpenStack snap 包吗?

查看 [snap cookie 工具][3]。我很快就会写一篇博文，告诉你如何使用 snap cookie 工具。它非常简单，并且能帮助你在任何时候创建一个新的 OpenStack snap 包。

### 测试 OpenStack snap 包

我们已经用简单的脚本初步测试了 OpenStack snap 包。这个脚本会在单个节点上安装 sanp 包，还会在安装后提供额外的配置服务。来尝试下吧：

```
git clone https://github.com/openstack-snaps/snap-test
cd snap-test
./snap-deploy
```

这样，我们就已经在 Ubuntu Xenial（16.04） 上做了所有的测试。要注意的是，这将在你的系统上安装和配置相当多的软件，因此你最好在可自由使用的机器上运行它。

### 追踪 OpenStack

现在，你可以从 snap 商店的边缘通道来安装 snap 包，比如：

```
sudo snap install --edge keystone
```

OpenStack 团队正在努力使 CI/CD 配置到位，以便让 snap 包的发布能够交叉追踪 OpenStack 的发布（比如一个追踪 Ocata，另一个追踪 Pike 等）。每个<ruby>轨道<rt>track</rt></ruby>都有 4 个不同的通道。每个轨道的边缘通道将包含 OpenStack 项目对应分支最近的内容，测试、候选和稳定通道被保留用于已发布的版本。这样我们将看到如下的用法：

```
sudo snap install --channel=ocata/stable keystone
sudo snap install --channel=pike/edge keystone
```

### 其它

我们可以使用多个环境变量来简化 snap 包的制作。[这里][5] 有相关的说明。实际上，你无需深入的研究他们，但是在安装完 snap 包后，你也许会想要了解这些位置：

####  `$SNAP == /snap/<snap-name>/current`

这是 snap 包和它所有的文件挂载的位置。所有东西都是只读的。比如我当前安装的 keystone，$SNAP 就是 `/snap/keystone/91`。幸好，你不需要知道当前版本号，因为在 `/snap/keystone/` 中有一个软链接（LCTT 译注：`/snap/keystone/current/`）指向当前正在使用版本对应的文件夹。

```
$ ls /snap/keystone/current/
bin                     etc      pysqlite2-doc        usr
command-manage.wrapper  include  snap                 var
command-nginx.wrapper   lib      snap-openstack.yaml
command-uwsgi.wrapper   meta     templates

$ ls /snap/keystone/current/bin/
alembic                oslo-messaging-send-notification
convert-json           oslo-messaging-zmq-broker
jsonschema             oslo-messaging-zmq-proxy
keystone-manage        oslopolicy-checker
keystone-wsgi-admin    oslopolicy-list-redundant
keystone-wsgi-public   oslopolicy-policy-generator
lockutils-wrapper      oslopolicy-sample-generator
make_metadata.py       osprofiler
mako-render            parse_xsd2.py
mdexport.py            pbr
merge_metadata.py      pybabel
migrate                snap-openstack
migrate-repository     sqlformat
netaddr                uwsgi
oslo-config-generator

$ ls /snap/keystone/current/usr/bin/
2to3               idle     pycompile     python2.7-config
2to3-2.7           pdb      pydoc         python2-config
cautious-launcher  pdb2.7   pydoc2.7      python-config
compose            pip      pygettext     pyversions
dh_python2         pip2     pygettext2.7  run-mailcap
easy_install       pip2.7   python        see
easy_install-2.7   print    python2       smtpd.py
edit               pyclean  python2.7

$ ls /snap/keystone/current/lib/python2.7/site-packages/
...
```

####  `$SNAP_COMMON == /var/snap/<snap-name>/common`

这个目录用于存放系统数据，对于 snap 包的多个修订版本这些数据是共用的。在这里，你可以覆盖默认配置文件和访问日志文件。

```
$ ls /var/snap/keystone/common/
etc  fernet-keys  lib  lock  log  run

$ sudo ls /var/snap/keystone/common/etc/
keystone  nginx  uwsgi

$ ls /var/snap/keystone/common/log/
keystone.log  nginx-access.log  nginx-error.log  uwsgi.log
```

### 严格限制

每个 snap 包都是在一个由 seccomp 和 AppArmor 策略构建的严格限制的环境中运行的。更多关于 snap 约束的细节可以在 [这里][7] 查看。

### snap 包即将到来的新特性和更新

我正在期待 snap 包一些即将到来的新特性和更新（LCTT 译注：此文发表于 7 月 6 日）：

*   我们正在致力于实现 libvirt AppArmor 策略，这样 nova-hypervisor 的 snap 包就能够访问 qcow2 的<ruby>支持文件<rt>backing files</rt></ruby>。
    *   现在，作为一种变通方法，你可以将 virt-aa-helper 放在 complain 模式下：`sudo aa-complain /usr/lib/libvirt/virt-aa-helper`。
*   我们还在为 snapd 开发额外的接口策略，以便为部署的实例启用网络连接。
    *   现在你可以在 devmode 模式下安装 nova-hypervisor snap 包，它会禁用安全限制：`snap install -devmode -edge nova-hypervisor`。
*   自动连接 nova-hypervisor 的接口。我们正在努力实现在安装时自动定义 nova-hypervisor 接口。
    *   定义 AppArmor 和 seccomp 策略的接口可以允许 snap 包访问系统的资源。
    *   现在，你可以手动连接需要接口，在 nova-hypervisor snap 包的 README 中有相关的描述。
*   命令自动定义别名。我们正在努力实现 snap 包在安装时为命令自动定义别名。
    *   这使得我们可以使用传统的命令名。安装 snap 包后，你将可以使用 `nova-manage db sync` 而无需再用 `nova.manage db sync`。
    *   现在，你可以在安装 snap 包后手动设置别名，比如：`snap alias nova.manage nova-manage`。如想获取更多细节请查看 snap 包的 README 。
*   守护进程自动定义别名。当前 snappy 仅支持为命令（非守护进程）定义别名。一旦针对守护进程的别名可用了，我们将设置它们在安装的时候自动配置。
    * 这使得我们可以使用额外的单元文件名。我们可以使用 `systemctl restart nova-compute` 而无需再用 `systemctl restart snap.nova.nova-compute`。
*   snap 包资产跟踪。这使得我们可以追踪用来构建 snap 包的版本以便在将来构建时重复使用。

如果你想多聊一些关于 snap 包的内容，你可以在 freenode 的 #openstack-snaps 这样的 IRC 上找到我们。我们欢迎你的反馈和贡献！感谢并祝你玩得开心！Corey

------

作者简介：

Corey Bryant 是 Ubuntu 的核心开发者和 Canonical 公司 OpenStack 工程团队的软件工程师，他主要专注于为 Ubuntu 提供 OpenStack 的安装包以及为 Juju 进行 OpenStack 的魅力开发。他对开源软件充满热情，喜欢与来自世界各地的人一起工作。

译者简介：

> snapcraft.io 的钉子户，对 Ubuntu Core、Snaps 和 Snapcraft 有着浓厚的兴趣，并致力于将这些还在快速发展的新技术通过翻译或原创的方式介绍到中文世界。有兴趣的小伙伴也可以关注译者个人的公众号： `Snapcraft`，最近会在上面连载几篇有关 Core snap 发布策略、交付流程和验证流程的文章，欢迎围观 :）

------

via: https://insights.ubuntu.com/2017/07/06/openstack-in-a-snap/

作者：[Corey Bryant][a]
译者：[Snapcrafter](https://github.com/Snapcrafter)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


[a]:https://insights.ubuntu.com/author/corey-bryant/

  [1]: http://snapcraft.io/
  [2]:https://github.com/openstack?utf8=%E2%9C%93&q=snap-&type=&language=
  [3]:https://github.com/openstack-snaps/snap-cookiecutter/blob/master/README.rst
  [4]:https://snapcraft.io/docs/reference/env
  [5]: https://snapcraft.io/docs/reference/env
  [6]:https://snapcraft.io/docs/reference/confinement
  [7]: https://snapcraft.io/docs/reference/confinement
