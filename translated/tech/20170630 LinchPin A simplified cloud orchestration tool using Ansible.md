LinchPin：一个使用 Ansible 的简化的编配工具
============================================================

> 2016 年末开始的 LinchPin，现在已经拥有一个 Python API 和一个成长中的社区。

![LinchPin 1.0：一个使用 Ansible 的成熟的混合云编配工具](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/toolbox-learn-draw-container-yearbook.png?itok=xDbwz1pP "LinchPin 1.0: A maturing hybrid cloud orchestration tool using Ansible")

>Image by : [Internet Archive Book Images][10]. Modified by Opensource.com. CC BY-SA 4.0

去年，[我的团队公布了][11] [LinchPin][12]，这是一个使用 Ansible 的混合云<ruby>编配<rt>orchestration</rt></ruby>工具。<ruby>配给<rt>provision</rt></ruby>云资源从来没有这么容易便捷过。借助 Ansible 强力支持，LinchPin 专注于简化，使云资源让用户可以触手可及。在这篇文章中，我将介绍 LinchPin，并且去看看过去的 10 个月该项目是如何逐渐成熟。

（LCTT 译注：关于 orchestration 应该翻译成惯例的“编排”还是“编配”，有个 @wffger 提出的[建议](https://github.com/LCTT/TranslateProject/issues/6715) ，欢迎大家参与讨论。）

LinchPin 刚出现的时候，使用 `ansible-playbook` 命令去运行 LinchPin ，虽然可以完成，但是还是很复杂的，LinchPin 现在有一个前端命令行用户界面（CLI），它是用 [Click][14] 写的，而且它使 LinchPin 比以前更简化。

没有止步于 CLI，LinchPin 现在还有一个 [Python][15] API，它可以用于管理资源，比如，Amazon EC2 和 OpenStack 实例、网络、存储、安全组等等。这个 API [文档][16] 可以在你想去尝试 LinchPin 的 Python API 时帮助你。

### Playbook 是一个库

因为 LinchPin 的核心是 [Ansible playbook][17]，其角色、模块、过滤器，以及任何被称为 Ansible 模块的东西都被移进 LinchPin 库中，这意味着我们虽然可以直接调用 playbook，但它不是资源管理的首选机制。`linchpin` 可执行文件事实上已经成为该命令行的前端。

### 深入了解命令行

让我们深入了解 `linchpin` 命令行：

```
$ linchpin
Usage: linchpin [OPTIONS] COMMAND [ARGS]...

  linchpin: hybrid cloud orchestration

Options:
  -c, --config PATH       Path to config file
  -w, --workspace PATH    Use the specified workspace if the familiar Jenkins
                          $WORKSPACE environment variable is not set
  -v, --verbose           Enable verbose output
  --version               Prints the version and exits
  --creds-path PATH       Use the specified credentials path if WORKSPACE
                          environment variable is not set
  -h, --help              Show this message and exit.

Commands:
  init     Initializes a linchpin project.
  up       Provisions nodes from the given target(s) in...
  destroy  Destroys nodes from the given target(s) in...
```

你可以立即看到一个简单的描述，以及命令的选项和参数。这个帮助的最下面的三个命令是本文的重点内容。

#### 配置文件

之前有个名为 `linchpin_config.yml` 的文件。但现在这个文件没有了，替换它的是一个 ini 形式的配置文件，称为 `linchpin.conf`。虽然这个文件可以被修改或放到别的地方，它可以放置在配置文件容易找到的库路径中。在多数情况下，`linchpin.conf` 文件是不需要去修改的。

#### 工作空间

<ruby>工作空间<rt>workspace</rt></ruby>是一个定义好的文件系统路径，它是一个逻辑上的资源组。一个工作空间可以认为是一个特定环境、服务组、或其它逻辑组的一个单点。它也可以是一个所有可管理资源的大的存储容器。

工作空间可以在命令行上使用 `--workspace` （`-w`） 选项去指定，随后是工作空间路径。它也可以使用环境变量指定（比如，bash 中的 `$WORKSPACE`）。默认工作空间是当前目录。

#### 初始化 (`linchpin init`)

运行 `linchpin init` 将生成一个需要的目录结构，以及一个 `PinFile`、`topology`、和 `layout` 文件的示例：

```
$ export WORKSPACE=/tmp/workspace
$ linchpin init
PinFile and file structure created at /tmp/workspace
$ cd /tmp/workspace/
$ tree
.
├── credentials
├── hooks
├── inventories
├── layouts
│   └── example-layout.yml
├── PinFile
├── resources
└── topologies
    └── example-topology.yml
```

在这个时候，可以执行 `linchpin up` ，然后提供一个 `libvirt` 虚拟机，和一个名为 `linchpin-centos71` 的网络。会生成一个<ruby>库存<rt>inventory</rt></ruby>，并放在 `inventories/libvirt.inventory` 目录中。它可以通过读取 `topologies/example-topology.yml` 和 `topology_name` 的值了解它。

####  <ruby>配给<rt>provisioning</rt></ruby> (`linchpin up`)

一旦有了一个 PinFile、拓扑、和一个可选的布局，就可以<ruby>配给<rt>provisioning</rt></ruby>了。

我们使用 dummy （模拟）工具，因为用它来配给非常简单；它不需要任何额外的东西（认证、网络、等等）。dummy 配给程序会创建一个临时文件，它表示所配给的主机。如果临时文件没有任何数据，说明主机没有被配给，或者它已经被销毁了。

dummy 配给程序的目录树大致如下：

```
$ tree
.
├── hooks
├── inventories
├── layouts
│   └── dummy-layout.yml
├── PinFile
├── resources
└── topologies
    └── dummy-cluster.yml
```

PinFile 也很简单；它指定了它的拓扑，并且为 `dummy1` 目标提供一个可选的布局：

```
---
dummy1:
  topology: dummy-cluster.yml
  layout: dummy-layout.yml
```

`dummy-cluster.yml` 拓扑文件是一个引用，指向到配给的三个 `dummy_node` 类型的资源：

```
---
topology_name: "dummy_cluster" # topology name
resource_groups:
  -
    resource_group_name: "dummy"
    resource_group_type: "dummy"
    resource_definitions:
      -
        name: "web"
        type: "dummy_node"
        count: 3
```

执行命令 `linchpin up` 将基于上面的 `topology_name`（在这个案例中是 `dummy_cluster`）生成 `resources` 和 `inventory` 文件。

```
$ linchpin up
target: dummy1, action: up

$ ls {resources,inventories}/dummy*
inventories/dummy_cluster.inventory  resources/dummy_cluster.output
```

要验证 dummy 集群的资源，可以检查 `/tmp/dummy.hosts`：

```
$ cat /tmp/dummy.hosts
web-0.example.net
web-1.example.net
web-2.example.net
```

Dummy 模块为假定的（或模拟的）配给提供了一个基本工具。关于在 OpenStack、AWS EC2、Google Cloud 上和 LinchPin 的更多详细情况，可以去看[示例][18]。

#### <ruby>库存<rt>inventory</rt></ruby>生成

作为上面提到的 PinFile 的一部分，可以指定一个 `layout`。如果这个文件被指定，并且放在一个正确的位置上，就会为配给的资源自动生成一个用于 Ansible 的静态<ruby>库存<rt>inventory</rt></ruby>文件：

```
---
inventory_layout:
  vars:
    hostname: __IP__
  hosts:
    example-node:
      count: 3
      host_groups:
        - example
```

当 `linchpin up` 运行完成，资源文件将提供一个很有用的详细信息。特别是，插入到静态库存的 IP 地址或主机名：

```
[example]
web-2.example.net hostname=web-2.example.net
web-1.example.net hostname=web-1.example.net
web-0.example.net hostname=web-0.example.net

[all]
web-2.example.net hostname=web-2.example.net
web-1.example.net hostname=web-1.example.net
web-0.example.net hostname=web-0.example.net
```

#### 卸载 （`linchpin destroy`）

LinchPin 也可以执行资源卸载。卸载动作一般认为该资源是已经配给好的；然而，因为 Ansible 是<ruby>幂等的<rt>idempotent</rt></ruby>，`linchpin destroy` 将仅检查确认该资源是启用的。如果这个资源已经是启用的，它将去卸载它。

命令 `linchpin destroy` 也将使用资源和/或拓扑文件去决定合适的卸载过程。

Ansible `dummy` 角色不使用资源，卸载期间仅有拓扑：

```
$ linchpin destroy
target: dummy1, action: destroy

$ cat /tmp/dummy.hosts
-- EMPTY FILE --
```

针对暂时的资源，卸载功能有一些限制，像网络、存储、等等。网络资源可以被用于多个云实例。在这种情况下，执行一个 `linchpin destroy` 某些资源就不能卸载。这取决于每个供应商的实现。查看每个[供应商][19]的具体实现。

### LinchPin 的 Python API

在 `linchpin` 命令行中实现的功能大多数都是用 Python API 写的。这个 API，虽然不完整，但它已经成为 LinchPin 工具的至关重要的组件。

这个 API 由下面的三个包组成：

*   `linchpin`
*   `linchpin.cli`
*   `linchpin.api`

该命令行工具是基于 `linchpin` 包来管理的。它导入了 `linchpin.cli` 模块和类，该类是 `linchpin.api` 的子类。这样做的目的是为了允许使用 `linchpin.api` 来做其它的 LinchPin 实现，比如像计划中的 RESTful API。

更多信息，去查看 [Python API library documentation on Read the Docs][20]。

### Hook

LinchPin 1.0 的其中一个大的变化是转向 hook。hook 的目标是在 `linchpin` 运行期间的特定状态下，允许配置使用更多外部资源。目前的状态有：

*   `preup`: 在配给拓扑资源之前运行
*   `postup`: 在配给拓扑资源之后运行，并且生成可选的<ruby>库存<rt>inventory</rt></ruby>
*   `predestroy`: 卸载拓扑资源之前运行
*   `postdestroy`: 卸载拓扑资源之后运行

在每种状态下，这些 hooks 允许运行外部脚本。存在几种类型的 hook，包括一个定制的叫做 _Action Managers_。这是一个内置的 Action Manager 的列表：

*   `shell`: 允许任何的<ruby>内联<rt>inline</rt></ruby>的 shell 命令，或者一个可运行的 shell 脚本
*   `python`: 运行一个 Python 脚本
*   `ansible`: 运行一个 Ansible playbook，允许传递一个 `vars_file` 和 `extra_vars` 作为 Python 字典
*   `nodejs`: 运行一个 Node.js 脚本
*   `ruby`: 运行一个 Ruby 脚本

hook 被绑定到一个特定的目标，并且每个目标使用时必须重新声明。将来，hook 将可能是全局的，然后它们在每个目标的 `hooks` 节下命名会更简单。

#### 使用 hook

hook 描述起来非常简单，但理解它们强大的功能却并不简单。这个特性的存在是为了给用户灵活提供那些 LinchPin 开发者所没有考虑到的功能。这个概念可能会带来 ping 一套系统的简单方式，举个实例，比如在运行另一个 hook 之前。

更仔细地去研究 _工作空间_ ，你可能会注意到 `hooks` 目录，让我们看一下这个目录的结构：

```
$ tree hooks/
hooks/
├── ansible
│   ├── ping
│   │   └── dummy_ping.yaml
└── shell
    └── database
        ├── init_db.sh
        └── setup_db.sh
```

在任何情况下，hook 都可以用在 `PinFile` 中，展示如下：

```
---
dummy1:
  topology: dummy-cluster.yml
  layout: dummy-layout.yml
  hooks:
    postup:
      - name: ping
        type: ansible
        actions:
          - dummy_ping.yaml
      - name: database
        type: shell
        actions:
          - setup_db.sh
          - init_db.sh
```

基本概念是有三个 postup 动作要完成。Hook 是从上到下运行的，因此，Ansible `ping` 任务将首先运行，紧接着是两个 shell 任务， `setup_db.sh` 和 `init_db.sh`。假设 hook 运行成功。将发生一个系统的 ping，然后，一个数据库被安装和初始化。

### 认证的驱动程序

在 LinchPin 的最初设计中，开发者决定在 Ansible playbooks 中管理认证；然而，逐渐有更多的 API 和命令行驱动的工具后，意味着认证将被置于 playbooks 库之外，并且还可以根据需要去传递认证值。

#### 配置

让用户使用驱动程序提供的认证方法去完成这个任务。举个实例，如果对于 OpenStack 调用的拓扑，标准方法是使用一个 yaml 文件，或者类似于 `OS_` 前缀的环境变量。`clouds.yaml` 文件是一个 profile 文件的组成部分，它有一个 `auth` 节：

```
clouds:
  default:
    auth:
      auth_url: http://stack.example.com:5000/v2.0/
      project_name: factory2
      username: factory-user
      password: password-is-not-a-good-password
```

更多详细信息在 [OpenStack documentation][21]。

这个 `clouds.yaml` 或者任何其它认证文件位于 `default_credentials_path` （比如，`~/.config/linchpin`）中，并在拓扑中引用：

```
---
topology_name: openstack-test
resource_groups:
  -
    resource_group_name: linchpin
    resource_group_type: openstack
    resource_definitions:
      - name: resource
        type: os_server
        flavor: m1.small
        image: rhel-7.2-server-x86_64-released
        count: 1
        keypair: test-key
        networks:
          - test-net2
        fip_pool: 10.0.72.0/24
    credentials:
      filename: clouds.yaml
      profile: default
```

`default_credentials_path` 可以通过修改 `linchpin.conf` 改变。

拓扑在底部包含一个新的 `credentials` 节。使用 `openstack`、`ec2`、和 `gcloud` 模块，也可以去指定类似的凭据。认证驱动程序将查看给定的名为 `clouds.yaml` 的文件，并搜索名为 `default` 的 _配置_。

假设认证被找到并被加载，配给将正常继续。

### 简化

虽然 LinchPin 可以完成复杂的拓扑、库存布局、hooks、和认证管理，但是，终极目标是简化。通过使用一个命令行界面的简化，除了提升已经完成的 1.0 版的开发者体验外，LinchPin 将持续去展示复杂的配置可以很简单地去管理。

### 社区的成长

在过去的一年中，LinchPin 的社区现在已经有了 [邮件列表][22]和一个 IRC 频道（#linchpin on chat.freenode.net，而且在 [GitHub][23] 中我们很努力地管理它。

在过去的一年里，社区成员已经从 2 位核心开发者增加到大约 10 位贡献者。更多的人持续参与到项目中。如果你对 LinchPin 感兴趣，可以给我们写信、在 GitHub 上提问，加入 IRC，或者给我们发邮件。

_这篇文章是基于 Clint Savage 在 OpenWest 上的演讲 [Introducing LinchPin: Hybrid cloud provisioning using Ansible][7] 整理的。[OpenWest][8] 将在 2017 年 7 月 12-15 日在盐城湖市举行。_

--------------------------------------------------------------------------------

作者简介：

Clint Savage - 工作于 Red Hat 是一位负责原子项目（Project Atomic）的高级软件工程师。他的工作是为 Fedora、CentOS、和 Red Hat Enterprise Linux（RHEL）提供自动原子服务器构建。

-------------

via: https://opensource.com/article/17/6/linchpin

作者：[Clint Savage][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/herlo
[1]:https://opensource.com/resources/cloud?src=cloud_resource_menu1
[2]:https://opensource.com/resources/what-is-openstack?src=cloud_resource_menu2
[3]:https://opensource.com/resources/what-is-kubernetes?src=cloud_resource_menu3
[4]:https://opensource.com/16/12/yearbook-why-operating-system-matters?src=cloud_resource_menu4
[5]:https://opensource.com/business/16/10/interview-andy-cathrow-anchore?src=cloud_resource_menu5
[6]:https://opensource.com/article/17/6/linchpin?rate=yx4feHOc5Kf9gaZe5S4MoVAmf9mgtociUimJKAYgwZs
[7]:https://www.openwest.org/custom/description.php?id=166
[8]:https://www.openwest.org/
[9]:https://opensource.com/user/145261/feed
[10]:https://www.flickr.com/photos/internetarchivebookimages/14587478927/in/photolist-oe2Gwy-otuvuy-otus3U-otuuh3-ovwtoH-oe2AXD-otutEw-ovwpd8-oe2Me9-ovf688-oxhaVa-oe2mNh-oe3AN6-ovuyL7-ovf9Kt-oe2m4G-ovwqsH-ovjfJY-ovjfrU-oe2rAU-otuuBw-oe3Dgn-oe2JHY-ovfcrF-oe2Ns1-ovjh2N-oe3AmK-otuwP7-ovwrHt-ovwmpH-ovf892-ovfbsr-ovuAzN-ovf3qp-ovuFcJ-oe2T3U-ovwn8r-oe2L3T-oe3ELr-oe2Dmr-ovuyB9-ovuA9s-otuvPG-oturHA-ovuDAh-ovwkV6-ovf5Yv-ovuCC5-ovfc2x-oxhf1V
[11]:http://sexysexypenguins.com/posts/introducing-linch-pin/
[12]:http://linch-pin.readthedocs.io/en/develop/
[13]:https://opensource.com/resources/cloud
[14]:http://click.pocoo.org/
[15]:https://opensource.com/resources/python
[16]:http://linchpin.readthedocs.io/en/develop/libdocs.html
[17]:http://docs.ansible.com/ansible/playbooks.html
[18]:https://github.com/CentOS-PaaS-SIG/linchpin/tree/develop/linchpin/examples/topologies
[19]:https://github.com/CentOS-PaaS-SIG/linch-pin/tree/develop/linchpin/provision/roles
[20]:http://linchpin.readthedocs.io/en/develop/libdocs.html
[21]:https://docs.openstack.org/developer/python-openstackclient/configuration.html
[22]:https://www.redhat.com/mailman/listinfo/linchpin
[23]:https://github.com/CentOS-PaaS-SIG/linch-pin/projects/4
[24]:https://opensource.com/users/herlo
