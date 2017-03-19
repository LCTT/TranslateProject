LXD 2.0 系列（十二）：调试，及给 LXD 做贡献
================

![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

### 介绍

终于要结束了！这个大约一年前开始的[这系列文章][3]的最后一篇博文。

如果你从一开始就关注了这个系列，你应该已经使用了 LXD 相当长的时间了，并且非常熟悉它的日常操作和功能。

但如果出现问题怎么办？你可以做什么来自己跟踪问题？如果你不能，你应该记录什么信息，以便上游可以跟踪问题？

如果你想自己解决问题或通过实现你需要的功能来帮助改善LXD怎么办？如何构建，测试和贡献 LXD 代码库？

### 调试 LXD 并填写 bug 报告

#### LXD 日志文件

`/var/log/lxd/lxd.log`：

这是 LXD 日志的主文件。为了避免它快速充满你的磁盘，默认只会记录 `INFO`、`WARNING` 或者 `ERROR` 级别的日志。你可以在 LXD 守护进程中使用 `–debug` 改变其行为。

`/var/log/lxd/CONTAINER/lxc.conf`：

每当你启动容器时，此文件将更新为传递给 LXC 的配置。

这里会展示容器将如何配置，包括其所有的设备、绑定挂载等等。

`/var/log/lxd/CONTAINER/forkexec.log`：

这个文件包含 LXC 命令执行失败时产生的错误。这个情况是非常罕见的，因为 LXD 通常会在发生之前处理大多数错误。

`/var/log/lxd/CONTAINER/forkstart.log`：

这个文件包含 LXC 在启动容器时的错误信息。含 LXC 命令执行失败时产生的错误。

#### CRIU 日志 (对于实时迁移)

如果使用 CRIU 进行容器实时迁移或实时快照，则每次生成 CRIU 转储或恢复转储时都会记录额外的日志文件。

这些日志也可以在 `/var/log/lxd/CONTAINER/` 中找到，并且有时间戳，以便你可以找到与你最近的操作所匹配的那些日志。它们包含 CRIU 转储和恢复的所有内容的详细记录，并且比典型的迁移/快照错误消息更容器理解。

#### LXD 调试消息

如上所述，你可以使用 `-debug` 选项将守护进程切换为执行调试日志记录。另一种方法是连接到守护进程的事件接口，它将显示所有日志条目，而不管配置的日志级别（即使是远程工作）。

举例说，对于 `lxc init ubuntu:16.04 xen` 来说，

`lxd.log` 会是这样：

```
INFO[02-24|18:14:09] Starting container action=start created=2017-02-24T23:11:45+0000 ephemeral=false name=xen stateful=false used=1970-01-01T00:00:00+0000
INFO[02-24|18:14:10] Started container action=start created=2017-02-24T23:11:45+0000 ephemeral=false name=xen stateful=false used=1970-01-01T00:00:00+0000
```

而 `lxc monitor –type=logging` 会是：

```
metadata:
  context: {}
  level: dbug
  message: 'New events listener: 9b725741-ffe7-4bfc-8d3e-fe620fc6e00a'
timestamp: 2017-02-24T18:14:01.025989062-05:00
type: logging

metadata:
  context:
    ip: '@'
    method: GET
    url: /1.0
  level: dbug
  message: handling
timestamp: 2017-02-24T18:14:09.341283344-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
  level: dbug
  message: StorageCoreInit
timestamp: 2017-02-24T18:14:09.341536477-05:00
type: logging

metadata:
  context:
    ip: '@'
    method: GET
    url: /1.0/containers/xen
  level: dbug
  message: handling
timestamp: 2017-02-24T18:14:09.347709394-05:00
type: logging

metadata:
  context:
    ip: '@'
    method: PUT
    url: /1.0/containers/xen/state
  level: dbug
  message: handling
timestamp: 2017-02-24T18:14:09.357046302-05:00
type: logging

metadata:
  context: {}
  level: dbug
  message: 'New task operation: 2e2cf904-c4c4-4693-881f-57897d602ad3'
timestamp: 2017-02-24T18:14:09.358387853-05:00
type: logging

metadata:
  context: {}
  level: dbug
  message: 'Started task operation: 2e2cf904-c4c4-4693-881f-57897d602ad3'
timestamp: 2017-02-24T18:14:09.358578599-05:00
type: logging

metadata:
  context:
    ip: '@'
    method: GET
    url: /1.0/operations/2e2cf904-c4c4-4693-881f-57897d602ad3/wait
  level: dbug
  message: handling
timestamp: 2017-02-24T18:14:09.366213106-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
  level: dbug
  message: StoragePoolInit
timestamp: 2017-02-24T18:14:09.369636451-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
  level: dbug
  message: StoragePoolCheck
timestamp: 2017-02-24T18:14:09.369771164-05:00
type: logging

metadata:
  context:
    container: xen
    driver: storage/zfs
  level: dbug
  message: ContainerMount
timestamp: 2017-02-24T18:14:09.424696767-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
    name: xen
  level: dbug
  message: ContainerUmount
timestamp: 2017-02-24T18:14:09.432723719-05:00
type: logging

metadata:
  context:
    container: xen
    driver: storage/zfs
  level: dbug
  message: ContainerMount
timestamp: 2017-02-24T18:14:09.721067917-05:00
type: logging

metadata:
  context:
    action: start
    created: 2017-02-24 23:11:45 +0000 UTC
    ephemeral: "false"
    name: xen
    stateful: "false"
    used: 1970-01-01 00:00:00 +0000 UTC
  level: info
  message: Starting container
timestamp: 2017-02-24T18:14:09.749808518-05:00
type: logging

metadata:
  context:
    ip: '@'
    method: GET
    url: /1.0
  level: dbug
  message: handling
timestamp: 2017-02-24T18:14:09.792551375-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
  level: dbug
  message: StorageCoreInit
timestamp: 2017-02-24T18:14:09.792961032-05:00
type: logging

metadata:
  context:
    ip: '@'
    method: GET
    url: /internal/containers/23/onstart
  level: dbug
  message: handling
timestamp: 2017-02-24T18:14:09.800803501-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
  level: dbug
  message: StoragePoolInit
timestamp: 2017-02-24T18:14:09.803190248-05:00
type: logging

metadata:
  context:
    driver: storage/zfs
  level: dbug
  message: StoragePoolCheck
timestamp: 2017-02-24T18:14:09.803251188-05:00
type: logging

metadata:
  context:
    container: xen
    driver: storage/zfs
  level: dbug
  message: ContainerMount
timestamp: 2017-02-24T18:14:09.803306055-05:00
type: logging

metadata:
  context: {}
  level: dbug
  message: 'Scheduler: container xen started: re-balancing'
timestamp: 2017-02-24T18:14:09.965080432-05:00
type: logging

metadata:
  context:
    action: start
    created: 2017-02-24 23:11:45 +0000 UTC
    ephemeral: "false"
    name: xen
    stateful: "false"
    used: 1970-01-01 00:00:00 +0000 UTC
  level: info
  message: Started container
timestamp: 2017-02-24T18:14:10.162965059-05:00
type: logging

metadata:
  context: {}
  level: dbug
  message: 'Success for task operation: 2e2cf904-c4c4-4693-881f-57897d602ad3'
timestamp: 2017-02-24T18:14:10.163072893-05:00
type: logging
```

`lxc monitor` 的格式有点不同于每个条目都缩合成一行的日志文件，但更重要的是，你可以看到所有 `level：dbug` 条目。

### 如何报告 bug

#### LXD 的 bug

最好报告 bug 的地方是 [https://github.com/lxc/lxd/issues][4]。确保完整填写了 bug 报告模板中的内容，这些信息可以节省我们我们时间来复现环境。

#### Ubuntu 的 bug

如果你发现 Ubuntu 包本身有问题，无法安装、升级或删除。或者遇到 LXD init 脚本的问题。报告此类错误的最好是在 Launchpad 上。

在 Ubuntu 系统上，你可以使用：`ubuntu-bug lxd` ，它将自动包括一些日志文件和包信息供我们查看。

#### CRIU 的 bug

与 CRIU 相关的 Bug，你可以通过 CRIU 的错误输出发现，你应该在 Launchpad 上报告这些：`ubuntu-bug criu`

请注意，通过 LXD 使用 CRIU 属于测试版功能，除非你愿意通过 Canonical 的支持合同付费支持，要么可能需要一段时间才能查看你的错误报告。

### 贡献给 LXD

LXD 用 [Go][5] 写成并[托管在 Github][6]。我们欢迎任外部的贡献。为 LXD 贡献不需要 CLA 或类似的法律协议签署，只是通常的开发者所有权证书（`Signed-off-by:` 行）。

在我们的问题追踪器工具中，我们列有许多潜在的功能需求，新的贡献者可以以此作为良好的起点。通常最好在开始处理代码先发出 issue，这样每个人都知道你正在做这项工作，以便我们可以提供一些早期反馈。

#### 从源码源码构建 LXD

这里有上游的维护说明：[https://github.com/lxc/lxd#building-from-source][7]

你需要在 Github 上 fork 上游仓库，然后将你的更改推送到你的分支。我们建议每天 rebase 上游的 LXD，因为我们倾向于定期合并更改。

#### 运行测试套件

LXD 维护了两套测试集，单元测试和集成测试。你可以用下面的命令测试所有：

```
sudo -E make check
```

要只运行单元测试，使用：

```
sudo -E go test ./...
```

要运行集成测试，使用：

```
cd test
sudo -E ./main.sh
```

后者支持相当多的环境变量来测试各种存储后端、禁用网络测试、使用 ramdisk 或只是调整日志输出。其中一些是：

* `LXD_BACKEND`：`btrfs`、`dir`、`lvm` 或 `zfs`” 之一（默认为 `dir`）
  运行 LXD 存储驱动程序相关的所有测试。
* `LXD_CONCURRENT`：`true` 或 `false`（默认为 `false`）
  这启用一些额外的并发测试。
* `LXD_DEBUG`：`true` 或 `false`（默认为 `false`）
  记录所有 shell 命令，并在调试模式下运行所有​​ LXD 命令。
* `LXD_INSPECT`：`true` 或 `false`（默认为 `false`）
  测试程序会在故障时挂起，以便你可以检查环境。
* `LXD_LOGS`：将所有 `LXD` 日志文件转储到的目录（默认为 “”）
  所有生成的 LXD 守护进程的 `logs` 目录将被复制到此路径。
* `LXD_OFFLINE`：`true` 或 `false`（默认为 `false`）
  禁用任何依赖于外部网络连接的测试。
* `LXD_TEST_IMAGE`： unified 格式的 LXD 镜像的路径（默认为 “”）
  可以使用自定义测试镜像，而不是默认的最小 busybox 镜像。
* `LXD_TMPFS`：`true` 或 `false`（默认为 `false`）
  在 `tmpfs` 安装中运行整个测试套件，这会使用相当多的内存，但会使测试速度明显更快。
* `LXD_VERBOSE`：`true` 或 `false`（默认为 `false`）
  不太极端的 `LXD_DEBUG` 版本。shell 命令仍然会记录，但 `-debug` 不会传递给 LXC 命令，LXD 守护进程只能使用 `-verbose` 运行。

测试程序将在实际运行之前提醒你任何缺失的依赖项。在相当快的机器上运行该测试可在 10 分钟内完成。

#### 发送你的分支

发送拉取请求（PR）之前，你需要确认：

*  你已经 rebase 了上游分支
*  你的所有提交信息都包括 `Signed-off-by: First Last <email>` 这行
*  已删除任何你的临时调试代码
*  你已经将相关的提交 squash 在一起，以保持你的分支容易审查
*  单元和集成测试全部通过

一切完成后，在 Github 上发起一个拉取请求。我们的 [Jenkins][8] 将验证提交是否全部有 `signed-off`，在 MacOS 和 Windows 上的测试将自动执行，如果看起来不错，我们将触发一个完整的 Jenkins 测试，它将在所有存储后端、32 位和 64 位以及我们关心的所有 Go 版本上测试你的分支。

假设我们有人触发了 Jenkins，这通常需要不到一个小时的时间。

一旦所有测试完成，我们对代码本身感到满意，你的分支将会被合并，你的代码会出现在下一个 LXD 发布中。如果更改适用于 LXD stable-2.0 分支，我们将为你向后移植。

### 总结

我希望这个系列的博客文章有助于你了解什么是 LXD，以及它可以做什么！

本系列的范围仅限于 LXD（2.0.x），但我们也为那些想要最新功能的用户提供每月功能版本。你可以找到一些其他涵盖了原来的 [LXD 2.0系列文章][9]中列出的功能的博客文章。

### 额外的信息

LXD 的主站在： [https://linuxcontainers.org/lxd][10]
LXD 的 GitHub 开发仓库： [https://github.com/lxc/lxd][11]
LXD 的邮件列表： [https://lists.linuxcontainers.org][12]
LXD 的 IRC 频道：#lxcontainers on irc.freenode.net
在线尝试 LXD： [https://linuxcontainers.org/lxd/try-it][13]

--------------------------------------------------------------------------------

via: https://stgraber.org/2017/02/27/lxd-2-0-debugging-and-contributing-to-lxd-1212/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://stgraber.org/author/stgraber/
[1]:https://stgraber.org/author/stgraber/
[2]:https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[3]:https://stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[4]:https://github.com/lxc/lxd/issues
[5]:https://golang.org/
[6]:https://github.com/lxc/lxd
[7]:https://github.com/lxc/lxd#building-from-source
[8]:https://jenkins.linuxcontainers.org/
[9]:https://stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[10]:https://linuxcontainers.org/lxd
[11]:https://github.com/lxc/lxd
[12]:https://lists.linuxcontainers.org/
[13]:https://linuxcontainers.org/lxd/try-it
[14]:https://stgraber.org/2017/02/27/lxd-2-0-debugging-and-contributing-to-lxd-1212/
