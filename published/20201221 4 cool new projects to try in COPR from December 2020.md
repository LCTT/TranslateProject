[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12971-1.html)
[#]: subject: (4 cool new projects to try in COPR from December 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-december/)
[#]: author: (Jakub Kadlčík https://fedoramagazine.org/author/frostyx/)

COPR 仓库中 4 个很酷的新项目（2020.12）
======

![][1]

COPR 是个人软件仓库[集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Blanket

[Blanket][5] 是一款播放背景声音的应用，它可能会提高你的注意力，提高你的工作效率。另外，它还可以帮助你在嘈杂的环境中放松和入睡。无论何时何地，Blanket 都可以让你在鸟鸣中醒来，在咖啡店聊天声或远离城市交通喧嚣的友好氛围下工作，然后在外面淅淅沥沥的雨声中像木头一样沉睡在壁炉旁边。还有其他流行的背景音选择，如粉色和白色噪音。

![][6]

#### 安装说明

目前[仓库][8]为 Fedora 32 和 33 提供了 Blanket。要安装它，请使用以下命令：

```
sudo dnf copr enable tuxino/blanket
sudo dnf install blanket
```

### k9s

[k9s][10] 是一个管理 Kubernetes 集群的命令行工具。它可以让你列出正在运行的 pod 并与之交互，读取它们的日志，挖掘已使用的资源，并总体上使操作 Kubernetes 更轻松。通过插件和可定制的用户界面的可扩展性，k9s 受到有经验用户的欢迎。


![][11]

有关[更多预览截图][12]，请参见[项目页面][10]。

#### 安装说明

目前[仓库][14]为 Fedora 32、33、Fedora Rawhide 以及 EPEL 7、8、Centos Stream 等提供 k9s。要安装它，请使用以下命令：

```
sudo dnf copr enable luminoso/k9s
sudo dnf install k9s
```

### rhbzquery

[rhbzquery][16] 是一个简单的查询 Fedora Bugzilla 的工具。它提供了一个指定搜索查询的界面，但它并不在命令行中列出结果，而是由 rhbzquery 生成 Bugzilla 的 URL，并在浏览器中打开。

![][17]

#### 安装说明

目前[仓库][19]为 Fedora 32、33 和 Fedora Rawhide 提供 rhbzquery。要安装它，请使用以下命令：

```
sudo dnf copr enable petersen/rhbzquery
sudo dnf install rhbzquery
```

### gping

[gping][21] 是一个比标准的 `ping` 命令更有视觉吸引力的选择，因为它以图表的形式显示结果。也可以同时 ping 多个主机，以方便比较它们的响应时间。

![][22]

#### 安装说明

目前[仓库][24]为 Fedora 32、33、Fedora Rawhide 以及 EPEL 7 和 8 提供了 gping。要安装它，请使用以下命令：

```
sudo dnf copr enable atim/gping
sudo dnf install gping
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-december/

作者：[Jakub Kadlčík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#blanket
[5]: https://github.com/rafaelmardojai/blanket
[6]: https://github.com/FrostyX/fedora-magazine/raw/main/img/blanket.png
[7]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions
[8]: https://copr.fedorainfracloud.org/coprs/tuxino/blanket/
[9]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#k9s
[10]: https://k9scli.io/
[11]: https://github.com/FrostyX/fedora-magazine/raw/main/img/k9s.png
[12]: https://k9scli.io/#-previews
[13]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions-1
[14]: https://copr.fedorainfracloud.org/coprs/luminoso/k9s/
[15]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#rhbzquery
[16]: https://github.com/juhp/rhbzquery
[17]: https://github.com/FrostyX/fedora-magazine/raw/main/img/rhbzquery.png
[18]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions-2
[19]: https://copr.fedorainfracloud.org/coprs/petersen/rhbzquery/
[20]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#gping
[21]: https://github.com/orf/gping
[22]: https://github.com/FrostyX/fedora-magazine/raw/main/img/gping.png
[23]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions-4
[24]: https://copr.fedorainfracloud.org/coprs/atim/gping
