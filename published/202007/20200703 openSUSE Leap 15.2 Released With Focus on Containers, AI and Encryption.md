[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12425-1.html)
[#]: subject: (openSUSE Leap 15.2 Released With Focus on Containers, AI and Encryption)
[#]: via: (https://itsfoss.com/opensuse-leap-15-2-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

openSUSE Leap 15.2 发布：重点关注容器、AI 和加密
======

![](https://img.linux.net.cn/data/attachment/album/202007/16/230428vklhwrzllll2eu82.jpg)

[openSUSE][1] Leap 15.2 最终带来了一些有用的变化和改进。

同时，我想到 SUSE 这篇让人激动的公告《[消除 Leap 差异][2]》，openSUSE Leap 15.2 的发布使我们下一步将 SLE（[SUSE Linux Enterprise][3]）二进制文件集成到 openSUSE Leap 15.3 更加近了一步。

让我们看一下 openSUSE Leap 15.2 中发生了哪些变化和改进。

### openSUSE Leap 15.2：关键变化

![][4]

总体而言，openSUSE Leap 15.2 发行版涉及安全更新、新的主要软件包、bug 修复以及其他改进。

该项目的开发人员 Marco Varlese 在新闻稿中提到：

>“ Leap 15.2 代表了人工智能领域的巨大进步，我很高兴 openSUSE 用户现在终于可以通过我们的仓库使用机器学习/深度学习框架和应用，以享受稳定和最新的生态系统。”

尽管这暗示了可能涉及的一些变化，以下是 openSUSE Leap 15.2 中的新功能：

#### 添加人工智能（AI）和机器学习包

毫无疑问，人工智能（AI）和机器学习是最具颠覆性的技术。

为了向用户提供便利，openSUSE Leap 15.2 为新的开源技术添加了许多重要的软件包：

  * [Tensorflow][5]
  * [PyTorch][6]
  * [ONNX][7]
  * [Grafana][8]
  * [Prometheus][9]

#### 引入实时内核

![][10]

在 openSUSE Leap 15.2 中，将引入实时内核来管理[微处理器][11]的时序，以有效处理时间关键的事件。

实时内核的添加对于现实意义重大。项目委员会主席 Gerald Pfeifer 的讲话如下：

>“将实时内核添加到 openSUSE Leap 开启了新的可能性。想想边缘计算、嵌入式设备、数据抓取，所有这些都在飞速发展。从历史上看，其中很多都是专有领域。现在，openSUSE 为有兴趣测试实时功能的开发者、研究人员和公司甚至贡献者将打开了通道。这是另一个开源帮助开放的领域！”

#### 纳入容器技术

在最新版本中，你会注意到 [Kubernetes][12] 作为官方包而纳入其中。这让用户可以轻松地自动化部署、扩展和管理容器化的应用。

[Helm][13]（Kubernetes 的包管理器）也是内置的。不仅于此，你还可以在此找到其他一些附加功能，从而可以更轻松地保护和部署容器化应用。

#### 更新的 openSUSE 安装程序

![][14]

openSUSE 的安装程序已经非常不错。但是，在最新的 Leap 15.2 版本中，它们添加了更多信息，兼容从右至左语言（如阿拉伯语）以及一些小的更改，从而在安装时更容易选择。

#### YaST 改进

尽管 [YaST][15] 已经是一个非常强大的安装和配置工具，但是此发行版增加了创建和管理 Btrfs 文件系统以及实施高级加密技术的能力。

当然，你肯定知道 [openSUSE 在 WSL][16] 的可用性。因此，根据 Leap 15.2 的发行说明，YaST 与 WSL 的兼容性得到了改善。

#### 桌面环境改进

![][17]

可用的桌面环境已更新为最新版本，包括 [KDE Plasma 5.18 LTS][18] 和 [GNOME 3.34][19]。

你还能发现更新的 [XFCE 4.14][20] 桌面在 openSUSE Leap 15.2 上也是可用的。

如果你想知道最新版本的所有详细信息，可以参考[官方发布公告][21]。

### 下载和可用性

目前，你可以找到 Leap 15.2 的 Linode 云镜像。另外，你会注意到其他云托管服务（如 AWS、Azure 和其他服务）也提供了它。

你还可以从官方网站获取 DVD ISO 或网络镜像文件。

要升级你当前的安装，我建议按照[官方说明][22]操作。

- [openSUSE Leap 15.2][23]

你尝试过 openSUSE Leap 15.2 了么？请随时让我知道你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/opensuse-leap-15-2-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.opensuse.org/
[2]: https://www.suse.com/c/sle-15-sp2-schedule-and-closing-the-opensuse-leap-gap/
[3]: https://www.suse.com/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensuse-leap-15-2-gnome.png?ssl=1
[5]: https://www.tensorflow.org
[6]: https://pytorch.org
[7]: https://onnx.ai
[8]: https://grafana.com
[9]: https://prometheus.io/docs/introduction/overview/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensuse-leap-15-2-terminal.png?ssl=1
[11]: https://en.wikipedia.org/wiki/Microprocessor
[12]: https://kubernetes.io
[13]: https://helm.sh
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensuse-leap-15-2.png?ssl=1
[15]: https://yast.opensuse.org/
[16]: https://itsfoss.com/opensuse-bash-on-windows/
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensue-leap-15-2-kde.png?ssl=1
[18]: https://itsfoss.com/kde-plasma-5-18-release/
[19]: https://itsfoss.com/gnome-3-34-release/
[20]: https://www.xfce.org/about/news/?post=1565568000
[21]: https://en.opensuse.org/Release_announcement_15.2
[22]: https://en.opensuse.org/SDB:System_upgrade
[23]: https://software.opensuse.org/distributions/leap
