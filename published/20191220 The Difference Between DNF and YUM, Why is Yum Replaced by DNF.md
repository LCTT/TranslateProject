[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12161-1.html)
[#]: subject: (The Difference Between DNF and YUM, Why is Yum Replaced by DNF?)
[#]: via: (https://www.2daygeek.com/comparison-difference-between-dnf-vs-yum/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

DNF 和 Yum 的区别，为什么 Yum 会被 DNF 取代？
======

由于 Yum 中许多长期存在的问题仍未得到解决，因此 [Yum 包管理器][1]已被 [DNF 包管理器][2]取代。这些问题包括性能差、内存占用过多、依赖解析速度变慢等。

DNF 使用 `libsolv` 进行依赖解析，由 SUSE 开发和维护，旨在提高性能。

Yum 主要是用 Python 编写的，它有自己的应对依赖解析的方法。它的 API 没有完整的文档，它的扩展系统只允许 Python 插件。

Yum 是 RPM 的前端工具，它管理依赖关系和资源库，然后使用 RPM 来安装、下载和删除包。

为什么他们要建立一个新的工具，而不是修复现有的问题呢？

Ales Kozamblak 解释说，这个修复在技术上是不可行的，而且 Yum 团队还没有准备好立即接受修改。

另外，最大的挑战是，Yum 有 56000 行代码，但 DNF 只有 29000 行代码。

所以除了分叉，没有办法解决。

不过 Yum 的运行情况还算可以。


编号 | DNF（Dandified YUM） | YUM（Yellowdog Updater, Modified）
---|---|---
1 | DNF 使用 libsolv 来解析依赖关系，由 SUSE 开发和维护 | YUM 使用公开的 API 来解析依赖关系 
2 | API 有完整的文档 | API 没有完整的文档
3 | 由 C、C++、Python 编写的 | 只用 Python 编写
4 | DNF 目前在 Fedora、RHEL 8、CentOS 8、OEL 8 和 Mageia 6/7 中使用 | YUM 目前在 RHEL 6/7、CentOS 6/7、OEL 6/7 中使用
5 | DNF 支持各种扩展 | Yum 只支持基于 Python 的扩展
6 | API 有良好的文档，因此很容易创建新的功能 | 因为 API 没有正确的文档化，所以创建新功能非常困难
7 | DNF 在同步存储库的元数据时，使用的内存较少 | 在同步存储库的元数据时，YUM 使用了过多的内存
8 | DNF 使用满足性算法来解决依赖关系解析（它是用字典的方法来存储和检索包和依赖信息）| 由于使用公开 API 的原因，Yum 依赖性解析变得迟钝
9 | 从内存使用量和版本库元数据的依赖性解析来看，性能都不错 | 总的来说，在很多因素的影响下，表现不佳
10 | DNF 更新：在 DNF 更新过程中，如果包中包含不相关的依赖，则不会更新 | YUM 将在没有验证的情况下更新软件包
11 | 如果启用的存储库没有响应，DNF 将跳过它，并继续使用可用的存储库处理事务 | 如果有存储库不可用，YUM 会立即停止
12 | `dnf update` 和 `dnf upgrade` 是等价的 | 在 Yum 中则不同
13 | 安装包的依赖关系不更新 | Yum 为这种行为提供了一个选项
14 | 清理删除的包：当删除一个包时，DNF 会自动删除任何没有被用户明确安装的依赖包 | Yum 不会这样做
15 | 存储库缓存更新计划：默认情况下，系统启动后 10 分钟后，DNF 每小时会对配置的存储库检查一次更新。这个动作由系统定时器单元 `dnf-makecache.timer` 控制 | Yum 也会这样做
16 | 内核包不受 DNF 保护。不像 Yum，你可以删除所有的内核包，包括运行中的内核包 | Yum 不允许你删除运行中的内核
17 | libsolv：用于解包和读取资源库。hawkey: 为 libsolv 提供简化的 C 和 Python API 库。librepo: 提供 C 和 Python（类似 libcURL）API 的库，用于下载 Linux 存储库元数据和软件包。libcomps: 是 yum.comps 库的替代品。它是用纯 C 语言编写的库，有 Python 2 和 Python 3 的绑定。| Yum 不使用单独的库来执行这些功能
18 | DNF 包含 29000 行代码 | Yum 包含 56000 行代码
19 | DNF 由 Ales Kozumplik 开发 | YUM 由 Zdenek Pavlas、Jan Silhan 和团队成员开发

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/comparison-difference-between-dnf-vs-yum/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
