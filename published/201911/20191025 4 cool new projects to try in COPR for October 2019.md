[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11528-1.html)
[#]: subject: (4 cool new projects to try in COPR for October 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-october-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

COPR 仓库中 4 个很酷的新项目（2019.10）
======

![][1]

COPR 是个人软件仓库[集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Nu

[Nu][4] 也被称为 Nushell，是受 PowerShell 和现代 CLI 工具启发的 shell。通过使用基于结构化数据的方法，Nu 可轻松处理命令的输出，并通过管道传输其他命令。然后将结果显示在可以轻松排序或过滤的表中，并可以用作其他命令的输入。最后，Nu 提供了几个内置命令、多 shell 和对插件的支持。

#### 安装说明

该[仓库][5]目前为 Fedora 30、31 和 Rawhide 提供 Nu。要安装 Nu，请使用以下命令：

```
sudo dnf copr enable atim/nushell
sudo dnf install nushell
```

### NoteKit

[NoteKit][6] 是一个笔记程序。它支持 Markdown 来格式化笔记，并支持使用鼠标创建手绘笔记的功能。在 NoteKit 中，笔记以树状结构进行排序和组织。

#### 安装说明

该[仓库][7]目前为 Fedora 29、30、31 和 Rawhide 提供 NoteKit。要安装 NoteKit，请使用以下命令：

```
sudo dnf copr enable lyessaadi/notekit
sudo dnf install notekit
```

### Crow Translate

[Crow Translate][8] 是一个翻译程序。它可以翻译文本并且可以对输入和结果发音，它还提供命令行界面。对于翻译，Crow Translate 使用 Google、Yandex 或 Bing 的翻译 API。

#### 安装说明

该[仓库][9]目前为 Fedora 30、31 和 Rawhide 以及 Epel 8 提供 Crow Translate。要安装 Crow Translate，请使用以下命令：

```
sudo dnf copr enable faezebax/crow-translate
sudo dnf install crow-translate
```

### dnsmeter

[dnsmeter][10] 是用于测试域名服务器及其基础设施性能的命令行工具。为此，它发送 DNS 查询并计算答复数，从而测量各种统计数据。除此之外，dnsmeter 可以使用不同的加载步骤，使用 PCAP 文件中的载荷和欺骗发送者地址。

#### 安装说明

该仓库目前为 Fedora 29、30、31、Rawhide 以及 Epel 7 提供 dnsmeter。要安装 dnsmeter，请使用以下命令：

```
sudo dnf copr enable @dnsoarc/dnsmeter
sudo dnf install dnsmeter
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-october-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html#
[4]: https://github.com/nushell/nushell
[5]: https://copr.fedorainfracloud.org/coprs/atim/nushell/
[6]: https://github.com/blackhole89/notekit
[7]: https://copr.fedorainfracloud.org/coprs/lyessaadi/notekit/
[8]: https://github.com/crow-translate/crow-translate
[9]: https://copr.fedorainfracloud.org/coprs/faezebax/crow-translate/
[10]: https://github.com/DNS-OARC/dnsmeter
