[#]: subject: "What are container runtimes?"
[#]: via: "https://opensource.com/article/21/9/container-runtimes"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13772-1.html"

什么是容器运行时？
======

> 通过深入了解容器运行时，理解容器环境是如何建立的。

![](https://img.linux.net.cn/data/attachment/album/202109/11/110104vzgjs0v9c9o04s78.jpg)

在学习 [容器镜像][2] 时，我们讨论了容器的基本原理，但现在是深入研究容器<ruby>运行时<rt>runtime</rt></ruby>的时候了，从而了解容器环境是如何构建的。本文的部分信息摘自  <ruby>开放容器计划<rt>Open Container Initiative</rt></ruby>（OCI）的 [官方文档][3]，所以无论使用何种容器引擎，这些信息都是一致的。

### 容器运行机制

那么，当你运行 `podman run` 或 `docker run` 命令时，在后台到底发生了什么？一个分步的概述如下：

  1. 如果本地没有镜像，则从镜像<ruby>登记仓库<rt>registry</rt></ruby>拉取镜像
  2. 镜像被提取到一个写时复制（COW）的文件系统上，所有的容器层相互堆叠以形成一个合并的文件系统
  3. 为容器准备一个挂载点
  4. 从容器镜像中设置元数据，包括诸如覆盖 `CMD`、来自用户输入的 `ENTRYPOINT`、设置 SECCOMP 规则等设置，以确保容器按预期运行
  5. 提醒内核为该容器分配某种隔离，如进程、网络和文件系统（<ruby>命名空间<rt>namespace</rt></ruby>）
  6. 提醒内核为改容器分配一些资源限制，如 CPU 或内存限制（<ruby>控制组<rt>cgroup</rt></ruby>）
  7. 传递一个<ruby>系统调用<rt>syscall</rt></ruby>给内核用于启动容器
  8. 设置 SELinux/AppArmor

容器运行时负责上述所有的工作。当我们提及容器运行时，想到的可能是 runc、lxc、containerd、rkt、cri-o 等等。嗯，你没有错。这些都是容器引擎和容器运行时，每一种都是为不同的情况建立的。

<ruby>容器运行时<rt>Container runtime</rt></ruby>更侧重于运行容器，为容器设置命名空间和控制组（cgroup），也被称为底层容器运行时。高层的容器运行时或容器引擎专注于格式、解包、管理和镜像共享。它们还为开发者提供 API。

### 开放容器计划（OCI）

<ruby>开放容器计划<rt>Open Container Initiative</rt></ruby>（OCI）是一个 Linux 基金会的项目。其目的是设计某些开放标准或围绕如何与容器运行时和容器镜像格式工作的结构。它是由 Docker、rkt、CoreOS 和其他行业领导者于 2015 年 6 月建立的。

它通过两个规范来完成如下任务：

#### 1、镜像规范

该规范的目标是创建可互操作的工具，用于构建、传输和准备运行的容器镜像。

该规范的高层组件包括：

  * [镜像清单][4] — 一个描述构成容器镜像的元素的文件
  * [镜像索引][5] — 镜像清单的注释索引
  * [镜像布局][6] — 一个镜像内容的文件系统布局
  * [文件系统布局][7] — 一个描述容器文件系统的变更集
  * [镜像配置][8] — 确定镜像层顺序和配置的文件，以便转换成 [运行时捆包][9]
  * [转换][10] — 解释应该如何进行转换的文件
  * [描述符][11] — 一个描述被引用内容的类型、元数据和内容地址的参考资料

#### 2、运行时规范

该规范用于定义容器的配置、执行环境和生命周期。`config.json` 文件为所有支持的平台提供了容器配置，并详细定义了用于创建容器的字段。在详细定义执行环境时也描述了为容器的生命周期定义的通用操作，以确保在容器内运行的应用在不同的运行时环境之间有一个一致的环境。

Linux 容器规范使用了各种内核特性，包括<ruby>命名空间<rt>namespace</rt></ruby>、<ruby>控制组<rt>cgroup</rt></ruby>、<ruby>权能<rt>capability</rt></ruby>、LSM 和文件系统<ruby>隔离<rt>jail</rt></ruby>等来实现该规范。

### 小结

容器运行时是通过 OCI 规范管理的，以提供一致性和互操作性。许多人在使用容器时不需要了解它们是如何工作的，但当你需要排除故障或优化时，了解容器是一个宝贵的优势。

本文基于 [techbeatly][12] 的文章，并经授权改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/container-runtimes

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://opensource.com/article/21/8/container-fundamentals-2
[3]: https://github.com/opencontainers
[4]: https://github.com/opencontainers/image-spec/blob/master/manifest.md
[5]: https://github.com/opencontainers/image-spec/blob/master/image-index.md
[6]: https://github.com/opencontainers/image-spec/blob/master/image-layout.md
[7]: https://github.com/opencontainers/image-spec/blob/master/layer.md
[8]: https://github.com/opencontainers/image-spec/blob/master/config.md
[9]: https://github.com/opencontainers/runtime-spec
[10]: https://github.com/opencontainers/image-spec/blob/master/conversion.md
[11]: https://github.com/opencontainers/image-spec/blob/master/descriptor.md
[12]: https://medium.com/techbeatly/container-runtimes-deep-dive-77eb0e511939
