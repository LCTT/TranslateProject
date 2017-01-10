LXD 2.0 系列（五）：镜像管理
======================================

这是 [LXD 2.0 系列介绍文章][0]的第五篇。

因为 lxd 容器管理有很多命令，因此这篇文章会很长。 如果你想要快速地浏览这些相同的命令，你可以[尝试下我们的在线演示][1]！

![](https://linuxcontainers.org/static/img/containers.png)

### 容器镜像

如果你以前使用过 LXC，你可能还记得那些 LXC “模板”，基本上都是导出一个容器文件系统以及一点配置的 shell 脚本。

大多数模板是通过在本机上执行一个完整的发行版自举来生成该文件系统。这可能需要相当长的时间，并且无法在所有的发行版上可用，另外可能需要大量的网络带宽。

回到 LXC 1.0，我写了一个“下载”模板，它允许用户下载预先打包的容器镜像，用模板脚本在中央服务器上生成，接着高度压缩、签名并通过 https 分发。我们很多用户从旧版的容器生成方式切换到了使用这种新的、更快更可靠的创建容器的方式。

使用 LXD，我们通过全面的基于镜像的工作流程向前迈进了一步。所有容器都是从镜像创建的，我们在 LXD 中具有高级镜像缓存和预加载支持，以使镜像存储保持最新。

### 与 LXD 镜像交互

在更深入了解镜像格式之前，让我们快速了解下 LXD 可以让你做些什么。

#### 透明地导入镜像

所有的容器都是由镜像创建的。镜像可以来自一台远程服务器并使用它的完整 hash、短 hash 或者别名拉取下来，但是最终每个 LXD 容器都是创建自一个本地镜像。

这有个例子：

```
lxc launch ubuntu:14.04 c1
lxc launch ubuntu:75182b1241be475a64e68a518ce853e800e9b50397d2f152816c24f038c94d6e c2
lxc launch ubuntu:75182b1241be c3
```

所有这些引用相同的远程镜像（在写这篇文章时），在第一次运行这些命令其中之一时，远程镜像将作为缓存镜像导入本地 LXD 镜像存储，接着从其创建容器。

下一次运行其中一个命令时，LXD 将只检查镜像是否仍然是最新的（当不是由指纹引用时），如果是，它将创建容器而不下载任何东西。

现在镜像被缓存在本地镜像存储中，你也可以从那里启动它，甚至不检查它是否是最新的：

```
lxc launch 75182b1241be c4
```

最后，如果你有个名为“myimage”的本地镜像，你可以：

```
lxc launch my-image c5
```

如果你想要改变一些自动缓存或者过期行为，在本系列之前的文章中有[一些命令](https://linux.cn/article-7687-1.html)。

#### 手动导入镜像

##### 从镜像服务器中复制

如果你想复制远程的某个镜像到你本地镜像存储，但不立即从它创建一个容器，你可以使用`lxc image copy`命令。它可以让你调整一些镜像标志，比如：

```
lxc image copy ubuntu:14.04 local:
```

这只是简单地复制一个远程镜像到本地存储。

如果您想要通过比记住其指纹更容易的方式来记住你引用的镜像副本，则可以在复制时添加别名：

```
lxc image copy ubuntu:12.04 local: --alias old-ubuntu
lxc launch old-ubuntu c6
```

如果你想要使用源服务器上设置的别名，你可以要求 LXD 复制下来：

```
lxc image copy ubuntu:15.10 local: --copy-aliases
lxc launch 15.10 c7
```

上面的副本都是一次性拷贝，也就是复制远程镜像的当前版本到本地镜像存储中。如果你想要 LXD 保持镜像最新，就像它在缓存中存储的那样，你需要使用 `–auto-update` 标志：

```
lxc image copy images:gentoo/current/amd64 local: --alias gentoo --auto-update
```

##### 导入 tarball

如果某人给你提供了一个单独的 tarball，你可以用下面的命令导入：

```
lxc image import <tarball>
```

如果你想在导入时设置一个别名，你可以这么做：

```
lxc image import <tarball> --alias random-image
```

现在如果你被给了两个 tarball，要识别哪个是含有 LXD 元数据的。通常可以通过 tarball 的名称来识别，如果不行就选择最小的那个，元数据 tarball 包是很小的。 然后将它们一起导入：

```
lxc image import <metadata tarball> <rootfs tarball>
```

##### 从 URL 中导入

`lxc image import` 也可以与指定的 URL 一起使用。如果你的一台 https Web 服务器的某个路径中有 `LXD-Image-URL` 和 `LXD-Image-Hash` 的标头设置，那么 LXD 就会把这个镜像拉到镜像存储中。

可以参照例子这么做：

```
lxc image import https://dl.stgraber.org/lxd --alias busybox-amd64
```

当拉取镜像时，LXD 还会设置一些标头，远程服务器可以检查它们以返回适当的镜像。 它们是 `LXD-Server-Architectures` 和 `LXD-Server-Version`。

这相当于一个简陋的镜像服务器。 它可以通过任何静态 Web 服务器提供一中用户友好的导入镜像的方式。

#### 管理本地镜像存储

现在我们本地已经有一些镜像了，让我们瞧瞧可以做些什么。我们已经介绍了最主要的部分，可以从它们来创建容器，但是你还可以在本地镜像存储上做更多。

##### 列出镜像

要列出所有的镜像，运行 `lxc image list`：

```
stgraber@dakara:~$ lxc image list
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
|     ALIAS     | FINGERPRINT  | PUBLIC |                     DESCRIPTION                      |  ARCH  |   SIZE   |         UPLOAD DATE          |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| alpine-32     | 6d9c131efab3 | yes    | Alpine edge (i386) (20160329_23:52)                  | i686   | 2.50MB   | Mar 30, 2016 at 4:36am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| busybox-amd64 | 74186c79ca2f | no     | Busybox x86_64                                       | x86_64 | 0.79MB   | Mar 30, 2016 at 4:33am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| gentoo        | 1a134c5951e0 | no     | Gentoo current (amd64) (20160329_14:12)              | x86_64 | 232.50MB | Mar 30, 2016 at 4:34am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| my-image      | c9b6e738fae7 | no     | Scientific Linux 6 x86_64 (default) (20160215_02:36) | x86_64 | 625.34MB | Mar 2, 2016 at 4:56am (UTC)  |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| old-ubuntu    | 4d558b08f22f | no     | ubuntu 12.04 LTS amd64 (release) (20160315)          | x86_64 | 155.09MB | Mar 30, 2016 at 4:30am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| w (11 more)   | d3703a994910 | no     | ubuntu 15.10 amd64 (release) (20160315)              | x86_64 | 153.35MB | Mar 30, 2016 at 4:31am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
|               | 75182b1241be | no     | ubuntu 14.04 LTS amd64 (release) (20160314)          | x86_64 | 118.17MB | Mar 30, 2016 at 4:27am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
```

你可以通过别名或者指纹来过滤：

```
stgraber@dakara:~$ lxc image list amd64
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
|     ALIAS     | FINGERPRINT  | PUBLIC |               DESCRIPTION               |  ARCH  |   SIZE   |          UPLOAD DATE         |
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
| busybox-amd64 | 74186c79ca2f | no     | Busybox x86_64                          | x86_64 | 0.79MB   | Mar 30, 2016 at 4:33am (UTC) |
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
| w (11 more)   | d3703a994910 | no     | ubuntu 15.10 amd64 (release) (20160315) | x86_64 | 153.35MB | Mar 30, 2016 at 4:31am (UTC) |
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
```

或者指定一个镜像属性中的键值对来过滤：

```
stgraber@dakara:~$ lxc image list os=ubuntu
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
|    ALIAS    | FINGERPRINT  | PUBLIC |                  DESCRIPTION                |  ARCH  |   SIZE   |          UPLOAD DATE         |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
| old-ubuntu  | 4d558b08f22f | no     | ubuntu 12.04 LTS amd64 (release) (20160315) | x86_64 | 155.09MB | Mar 30, 2016 at 4:30am (UTC) |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
| w (11 more) | d3703a994910 | no     | ubuntu 15.10 amd64 (release) (20160315)     | x86_64 | 153.35MB | Mar 30, 2016 at 4:31am (UTC) |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
|             | 75182b1241be | no     | ubuntu 14.04 LTS amd64 (release) (20160314) | x86_64 | 118.17MB | Mar 30, 2016 at 4:27am (UTC) |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
```

要了解镜像的所有信息，你可以使用`lxc image info`：

```
stgraber@castiana:~$ lxc image info ubuntu
Fingerprint: e8a33ec326ae7dd02331bd72f5d22181ba25401480b8e733c247da5950a7d084
Size: 139.43MB
Architecture: i686
Public: no
Timestamps:
 Created: 2016/03/15 00:00 UTC
 Uploaded: 2016/03/16 05:50 UTC
 Expires: 2017/04/26 00:00 UTC
Properties:
 version: 12.04
 aliases: 12.04,p,precise
 architecture: i386
 description: ubuntu 12.04 LTS i386 (release) (20160315)
 label: release
 os: ubuntu
 release: precise
 serial: 20160315
Aliases:
 - ubuntu
Auto update: enabled
Source:
 Server: https://cloud-images.ubuntu.com/releases
 Protocol: simplestreams
 Alias: precise/i386
```

##### 编辑镜像

编辑镜像的属性和标志的简单方法是使用：

```
lxc image edit <alias or fingerprint>
```

这会打开默认文本编辑器，内容像这样：

```
autoupdate: true
properties:
 aliases: 14.04,default,lts,t,trusty
 architecture: amd64
 description: ubuntu 14.04 LTS amd64 (release) (20160314)
 label: release
 os: ubuntu
 release: trusty
 serial: "20160314"
 version: "14.04"
public: false
```

你可以修改任何属性，打开或者关闭自动更新，或者标记一个镜像是公共的（后面详述）。

##### 删除镜像

删除镜像只需要运行：

```
lxc image delete <alias or fingerprint>
```

注意你不必移除缓存对象，它们会在过期后被 LXD 自动移除（默认上，在最后一次使用的 10 天后）。

##### 导出镜像

如果你想得到目前镜像的 tarball，你可以使用`lxc image export`，像这样：

```
stgraber@dakara:~$ lxc image export old-ubuntu .
Output is in .
stgraber@dakara:~$ ls -lh *.tar.xz
-rw------- 1 stgraber domain admins 656 Mar 30 00:55 meta-ubuntu-12.04-server-cloudimg-amd64-lxd.tar.xz
-rw------- 1 stgraber domain admins 156M Mar 30 00:55 ubuntu-12.04-server-cloudimg-amd64-lxd.tar.xz
```

#### 镜像格式

LXD 现在支持两种镜像布局，unified 或者 split。这两者都是有效的 LXD 格式，虽然后者在与其他容器或虚拟机一起运行时更容易重用其文件系统。

LXD 专注于系统容器，不支持任何应用程序容器的“标准”镜像格式，我们也不打算这么做。

我们的镜像很简单，它们是由容器文件系统，以及包含了镜像制作时间、到期时间、什么架构，以及可选的一堆文件模板的元数据文件组成。

有关[镜像格式][1]的最新详细信息，请参阅此文档。

##### unified 镜像（一个 tarball）

unified 镜像格式是 LXD 在生成镜像时使用的格式。它们是一个单独的大型 tarball，包含 `rootfs` 目录下的容器文件系统，在 tarball 根目录下有 `metadata.yaml` 文件，任何模板都放到 `templates` 目录。

tarball 可以用任何方式压缩（或者不压缩）。镜像散列是压缩后的 tarball 的 sha256 。


##### Split 镜像（两个 tarball）

这种格式最常用于滚动更新镜像并已经有了一个压缩文件系统 tarball 时。

它们由两个不同的 tarball 组成，第一个只包含 LXD 使用的元数据， `metadata.yaml` 文件在根目录，任何模板都在 `templates` 目录。

第二个 tarball 只包含直接位于其根目录下的容器文件系统。大多数发行版已经有这样的 tarball，因为它们常用于引导新机器。 此镜像格式允许不经修改就重用。

两个 tarball 都可以压缩（或者不压缩），它们可以使用不同的压缩算法。 镜像散列是元数据的 tarball 和 rootfs 的 tarball 结合的 sha256。

##### 镜像元数据

典型的 `metadata.yaml` 文件看起来像这样：

```
architecture: "i686"
creation_date: 1458040200
properties:
 architecture: "i686"
 description: "Ubuntu 12.04 LTS server (20160315)"
 os: "ubuntu"
 release: "precise"
templates:
 /var/lib/cloud/seed/nocloud-net/meta-data:
  when:
   - start
  template: cloud-init-meta.tpl
 /var/lib/cloud/seed/nocloud-net/user-data:
  when:
   - start
  template: cloud-init-user.tpl
  properties:
   default: |
    #cloud-config
    {}
 /var/lib/cloud/seed/nocloud-net/vendor-data:
  when:
   - start
  template: cloud-init-vendor.tpl
  properties:
   default: |
    #cloud-config
    {}
 /etc/init/console.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty1.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty2.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty3.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty4.override:
  when:
   - create
  template: upstart-override.tpl
```

##### 属性

两个唯一的必填字段是 `creation date`（UNIX 纪元时间）和 `architecture`。 其他都可以保持未设置，镜像就可以正常地导入。

额外的属性主要是帮助用户弄清楚镜像是什么。 例如 `description` 属性是在 `lxc image list` 中可见的。 用户可以使用其它属性的键/值对来搜索特定镜像。

相反，这些属性用户可以通过 `lxc image edit`来编辑，`creation date` 和 `architecture` 字段是不可变的。

##### 模板

模板机制允许在容器生命周期中的某一点生成或重新生成容器中的一些文件。

我们使用 [pongo2 模板引擎](https://github.com/flosch/pongo2)来做这些，我们将所有我们知道的容器信息都导出到模板。 这样，你可以使用用户定义的容器属性或常规 LXD 属性来自定义镜像，从而更改某些特定文件的内容。

正如你在上面的例子中看到的，我们使用在 Ubuntu 中使用它们来进行 `cloud-init` 并关闭一些 init 脚本。

### 创建你的镜像

LXD 专注于运行完整的 Linux 系统，这意味着我们期望大多数用户只使用干净的发行版镜像，而不是只用自己的镜像。

但是有一些情况下，你有自己的镜像是有必要的。 例如生产服务器上的预配置镜像，或者构建那些我们没有构建的发行版或者架构的镜像。

#### 将容器变成镜像

目前使用 LXD 构造镜像最简单的方法是将容器变成镜像。

可以这么做：

```
lxc launch ubuntu:14.04 my-container
lxc exec my-container bash
<do whatever change you want>
lxc publish my-container --alias my-new-image
```

你甚至可以将一个容器过去的快照变成镜像：

```
lxc publish my-container/some-snapshot --alias some-image
```

#### 手动构建镜像

构建你自己的镜像也很简单。

1. 生成容器文件系统。这完全取决于你使用的发行版。对于 Ubuntu 和 Debian，它将用于启动。
2. 配置容器中该发行版正常工作所需的任何东西（如果需要任何东西）。
3. 制作该容器文件系统的 tarball，可选择压缩它。
4. 根据上面描述的内容写一个新的 `metadata.yaml` 文件。
5. 创建另一个包含 `metadata.yaml` 文件的 tarball。
6. 用下面的命令导入这两个 tarball 作为 LXD 镜像：`lxc image import <metadata tarball> <rootfs tarball> --alias some-name`

在一切都正常工作前你可能需要经历几次这样的工作，调整这里或那里，可能会添加一些模板和属性。

### 发布你的镜像

所有 LXD 守护程序都充当镜像服务器。除非另有说明，否则加载到镜像存储中的所有镜像都会被标记为私有，因此只有受信任的客户端可以检索这些镜像，但是如果要创建公共镜像服务器，你需要做的是将一些镜像标记为公开，并确保你的 LXD 守护进程监听网络。

#### 只运行 LXD 公共服务器

最简单的共享镜像的方式是运行一个公共的 LXD 守护进程。

你只要运行：

```
lxc config set core.https_address "[::]:8443"
```

远程用户就可以添加你的服务器作为公共服务器：

```
lxc remote add <some name> <IP or DNS> --public
```

他们就可以像使用任何默认的镜像服务器一样使用它们。 由于远程服务器添加了 `-public` 选项，因此不需要身份验证，并且客户端仅限于使用已标记为 `public` 的镜像。

要将镜像设置成公共的，只需使用 `lxc image edit` 编辑它们，并将 `public` 标志设置为 `true`。

#### 使用一台静态 web 服务器

如上所述，`lxc image import` 支持从静态 https 服务器下载。 基本要求是：

* 服务器必须支持具有有效证书的 HTTPS、TLS 1.2 和 EC 算法。
* 当访问 `lxc image import` 提供的 URL 时，服务器必须返回一个包含 `LXD-Image-Hash` 和 `LXD-Image-URL` 的 HTTP 标头。

如果你想使它动态化，你可以让你的服务器查找 LXD 在请求镜像时发送的 `LXD-Server-Architectures` 和 `LXD-Server-Version` 的 HTTP 标头，这可以让你返回符合该服务器架构的正确镜像。

#### 构建一个简单流服务器

`ubuntu:` 和 `ubuntu-daily:` 远端服务器不使用 LXD 协议（`images:` 使用），而是使用称为简单流（simplestreams）的不同协议。

简单流基本上是一个镜像服务器的描述格式，使用 JSON 来描述产品以及相关产品的文件列表。

它被各种工具，如 OpenStack、Juju、MAAS 等用来查找、下载或者做镜像系统，LXD 将它作为用于镜像检索的原生协议。

虽然这的确不是提供 LXD 镜像的最简单的方法，但是如果你的镜像也被其它一些工具使用，那这也许值得考虑一下。

关于简单流的更多信息可以在[这里](https://launchpad.net/simplestreams)找到。

### 总结

我希望这篇关于如何使用 LXD 管理镜像以及构建和发布镜像文章让你有所了解。对于以前的 LXC 而言，可以在一组全球分布式系统上得到完全相同的镜像是一个很大的进步，并且引导了更多可复制性的发展方向。

### 额外信息

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net

如果你不想或者不能在你的机器上安装 LXD ，你可以在 web 上[试试在线版的 LXD][3] 。


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/30/lxd-2-0-image-management-512/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://github.com/lxc/lxd/blob/master/doc/image-handling.md
[2]: https://launchpad.net/simplestreams
[3]: https://linuxcontainers.org/lxd/try-it

原文：https://www.stgraber.org/2016/03/30/lxd-2-0-image-management-512/
