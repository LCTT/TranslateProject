[#]: subject: "Gitbase: Exploring Git repos with SQL"
[#]: via: "https://opensource.com/article/18/11/gitbase"
[#]: author: "Francesc Campoy https://opensource.com/users/francesc/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14470-1.html"

Gitbase：使用 SQL 探索 Git 仓库
======

> Gitbase 是一个由 Go 驱动的开源项目，它使得我们可以在 Git 仓库上运行 SQL 查询。

![](https://img.linux.net.cn/data/attachment/album/202204/13/230413ddcpm87p2bds18db.jpg)

Git 已经成为了代码版本控制的事实标准。虽然 Git 已经很流行了，但想用它来对源代码仓库的历史和内容进行深度分析，仍然是一件复杂的事情。

另一方面，SQL 则是一个经过实际检验、适合查询大型代码库的的语言，毕竟 Spark 和 BigQuery 等项目都采用了 SQL 作为查询语言。

因此，在 source{d} 公司，我们顺理成章地结合了这两种技术来创建了 Gitbase：这是一个用 SQL 对 Git 仓库进行大规模分析的“代码即数据”解决方案。

[Gitbase][2] 是一个完全开源的项目，它站在一系列巨人的肩膀上，是它们使 Gitbase 的发展成为可能。本文旨在指出其中的主要部分。

![][3]

*[Gitbase 试验场][4] 提供了一种使用 Gitbase 的可视化方式。*

### 使用 Vitess 解析 SQL

Gitbase 将 SQL 作为用户接口。这意味着我们需要解析基于 MySQL 协议传输的 SQL 请求，并理解它们。幸运的是，我们在 YouTube 的朋友和他们的 [Vitess][5] 项目已经实现了这一点。Vitess 是一个数据库集群系统，用于 MySQL 的水平扩展。

我们直接截取一些重要的代码片段，并把它做成了一个 [开源项目][6]。这个项目允许任何人在几分钟内编写一个 MySQL 服务器（正如我在 [justforfunc][7] 的专题：[CSVQL - 用 SQL 处理 CSV][8] 中所展示的那样）。

### 用 go-git 读取 Git 储存库

当成功解析了一个请求，我们还需要读取数据集里的 Git 仓库，才能够知道该如何回复它。为此，我们集成了 source{d} 最成功的仓库 [go-git][9]。go-git 是一个高度可扩展的纯 Go 语言的 Git 实现。

这使得我们能够轻松地分析以 [siva][10] 文件格式存储在磁盘上的源代码仓库（siva 也是一个 source{d} 的开源项目），或是直接使用 `git clone` 克隆的仓库。

### 使用 Enry 检测编程语言，使用 Babelfish 解析文件

Gitbase 并没有将其分析能力局限于 Git 历史记录上。它还使用（显然也是）我们的开源项目 [Enry][11] 集成了语言检测功能，并使用 [Babelfish][12] 实现了程序解析的功能。Babelfish 是一个用于通用源代码解析的自托管服务器，它可以将代码文件转化为<ruby>通用抽象语法树<rt>Universal Abstract Syntax Trees</rt></ruby>（UAST）。

这两个功能在 Gitbase 中呈现为用户函数 `LANGUAGE` 和 `UAST`。结合使用两个函数，许多查询请求都成为了可能，比如“找到上个月修改次数最多的函数名称”。

### 让它快速运行

Gitbase 经常要分析非常大的数据集，比如公共 Git 档案，其中有来自 GitHub 的 3TB 源代码（见 [公告][13]）。为了做到这一点，每份 CPU 处理能力都很重要。

这就是为什么我们又集成了另外两个项目：Rubex 和 Pilosa。

### 使用 Rubex 和 Oniguruma 加快正则表达式的速度

[Rubex][14] 是 Go 的 `regexp` 标准库包的一个准替代品。之所以还不能完成替代，是因为他们没有在 `regexp.Regexp` 类型上实现 `LiteralPrefix` 方法，不过我也是直到现在才听说这个方法。

Rubex 的高性能得归功于高度优化的 C 语言库 [Oniguruma][15]，它使用 [cgo][16] 来调用这个库。

### 使用 Pilosa 索引加快查询速度

索引基本上是每个关系型数据库的众所周知的特性，但 Vitess 却没有实现索引，因为它不是真正需要。

还好开源的 [Pilosa][17] 再一次拯救了我们，它是一个用 Go 实现的分布式位图索引，使得 Gitbase 可以用于大规模的数据集。Pilosa 是开源的，它极大地加快了对多个海量数据集的查询。

### 总结

我想通过这篇博文，亲自感谢开源社区，是他们让我们在如此短的时间内创建了 Gitbase，这是谁也没想到的。在 source{d} 公司，我们是开源的坚定信仰者，`github.com/src-d` 下的每一行代码（包括我们的 OKR 和投资者委员会）都可以证明这一点。

你想尝试一下 Gitbase 吗？最快、最简单的方法就是使用 source{d} 引擎。从 `sourced.tech/engine` 下载它，只需一个命令就能让 Gitbase 运行起来。

想了解更多吗？请查看我在 [Go SF meetup][18] 的演讲录音。

这篇文章 [最初发表在][20] Medium 上，经授权后在此重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/gitbase

作者：[Francesc Campoy][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/francesc/
[b]: https://github.com/lkxed/
[1]: https://opensource.com/sites/default/files/lead-images/bus_cloud_database.png
[2]: https://github.com/src-d/gitbase
[3]: https://opensource.com/sites/default/files/uploads/gitbase.png
[4]: https://github.com/src-d/gitbase-web
[5]: https://github.com/vitessio/vitess
[6]: https://github.com/src-d/go-mysql-server
[7]: http://justforfunc.com/
[8]: https://youtu.be/bcRDXAraprk
[9]: https://github.com/src-d/go-git
[10]: https://github.com/src-d/siva
[11]: https://github.com/src-d/enry
[12]: https://github.com/bblfsh/bblfshd
[13]: https://blog.sourced.tech/post/announcing-pga/
[14]: https://github.com/moovweb/rubex
[15]: https://github.com/kkos/oniguruma
[16]: https://golang.org/cmd/cgo/
[17]: https://github.com/pilosa/pilosa
[18]: https://www.meetup.com/golangsf/events/251690574/
[19]: https://youtu.be/OXL2KxOTmBQ
[20]: https://medium.com/sourcedtech/gitbase-exploring-git-repos-with-sql-95ec0986386c
