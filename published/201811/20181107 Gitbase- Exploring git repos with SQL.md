gitbase：用 SQL 查询 Git 仓库 
======

> gitbase 是一个使用 go 开发的的开源项目，它实现了在 Git 仓库上执行 SQL 查询。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg)

Git 已经成为了代码版本控制的事实标准，但尽管 Git 相当普及，对代码仓库的深入分析的工作难度却没有因此而下降；而 SQL 在大型代码库的查询方面则已经是一种久经考验的语言，因此诸如 Spark 和 BigQuery 这样的项目都采用了它。

所以，source{d} 很顺理成章地将这两种技术结合起来，就产生了 gitbase（LCTT 译注：source{d} 是一家开源公司，本文作者是该公司开发者关系副总裁）。gitbase 是一个<ruby>代码即数据<rt>code-as-data</rt></ruby>的解决方案，可以使用 SQL 对 git 仓库进行大规模分析。 

[gitbase][1] 是一个完全开源的项目。它站在了很多巨人的肩上，因此得到了足够的发展竞争力。下面就来介绍一下其中的一些“巨人”。

![](https://opensource.com/sites/default/files/uploads/gitbase.png)

*[gitbase playground][2] 为 gitbase 提供了一个可视化的操作环境。*

### 用 Vitess 解析 SQL

gitbase 通过 SQL 与用户进行交互，因此需要能够遵循 MySQL 协议来对通过网络传入的 SQL 请求作出解析和理解，万幸由 YouTube 建立的 [Vitess][3] 项目已经在这一方面给出了解决方案。Vitess 是一个横向扩展的 MySQL 数据库集群系统。 

我们只是使用了这个项目中的部分重要代码，并将其转化为一个可以让任何人在数分钟以内编写出一个 MySQL 服务器的[开源程序][4]，就像我在 [justforfunc][5] 视频系列中展示的 [CSVQL][6] 一样，它可以使用 SQL 操作 CSV 文件。

### 用 go-git 读取 git 仓库

在成功解析 SQL 请求之后，还需要对数据集中的 git 仓库进行查询才能返回结果。因此，我们还结合使用了 source{d} 最成功的 [go-git][7] 仓库。go-git 是使用纯 go 语言编写的具有高度可扩展性的 git 实现。

借此我们就可以很方便地将存储在磁盘上的代码仓库保存为 [siva][8] 文件格式（这同样是 source{d} 的一个开源项目），也可以通过 `git clone` 来对代码仓库进行复制。

### 使用 enry 检测语言、使用 babelfish 解析文件

gitbase 集成了我们开源的语言检测项目 [enry][9] 以及代码解析项目 [babelfish][10]，因此在分析 git 仓库历史代码的能力也相当强大。babelfish 是一个自托管服务，普适于各种源代码解析，并将代码文件转换为<ruby>通用抽象语法树<rt>Universal Abstract Syntax Tree</rt></ruby>（UAST）。

这两个功能在 gitbase 中可以被用户以函数 `LANGUAGE` 和 `UAST` 调用，诸如“查找上个月最常被修改的函数的名称”这样的请求就需要通过这两个功能实现。

### 提高性能

gitbase 可以对非常大的数据集进行分析，例如来自 GitHub 高达 3 TB 源代码的 Public Git Archive（[公告][11]）。面临的工作量如此巨大，因此每一点性能都必须运用到极致。于是，我们也使用到了 Rubex 和 Pilosa 这两个项目。

#### 使用 Rubex 和 Oniguruma 优化正则表达式速度

[Rubex][12] 是 go 的正则表达式标准库包的一个准替代品。之所以说它是准替代品，是因为它没有在 `regexp.Regexp` 类中实现 `LiteralPrefix` 方法，直到现在都还没有。

Rubex 的高性能是由于使用 [cgo][14] 调用了 [Oniguruma][13]，它是一个高度优化的 C 代码库。

#### 使用 Pilosa 索引优化查询速度

索引几乎是每个关系型数据库都拥有的特性，但 Vitess 由于不需要用到索引，因此并没有进行实现。

于是我们引入了 [Pilosa][15] 这个开源项目。Pilosa 是一个使用 go 实现的分布式位图索引，可以显著提升跨多个大型数据集的查询的速度。通过 Pilosa，gitbase 才得以在巨大的数据集中进行查询。

### 总结

我想用这一篇文章来对开源社区表达我衷心的感谢，让我们能够不负众望的在短时间内完成 gitbase 的开发。我们 source{d} 的每一位成员都是开源的拥护者，github.com/src-d 下的每一行代码都是见证。

你想使用 gitbase 吗？最简单快捷的方式是从 sourced.tech/engine 下载 source{d} 引擎，就可以通过单个命令运行 gitbase 了。

想要了解更多，可以听听我在 [Go SF 大会][16]上的演讲录音。

本文在 [Medium][17] 首发，并经许可在此发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/gitbase

作者：[Francesc Campoy][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/francesc
[b]: https://github.com/lujun9972
[1]: https://github.com/src-d/gitbase
[2]: https://github.com/src-d/gitbase-web
[3]: https://github.com/vitessio/vitess
[4]: https://github.com/src-d/go-mysql-server
[5]: http://justforfunc.com/
[6]: https://youtu.be/bcRDXAraprk
[7]: https://github.com/src-d/go-git
[8]: https://github.com/src-d/siva
[9]: https://github.com/src-d/enry
[10]: https://github.com/bblfsh/bblfshd
[11]: https://blog.sourced.tech/post/announcing-pga/
[12]: https://github.com/moovweb/rubex
[13]: https://github.com/kkos/oniguruma
[14]: https://golang.org/cmd/cgo/
[15]: https://github.com/pilosa/pilosa
[16]: https://www.meetup.com/golangsf/events/251690574/
[17]: https://medium.com/sourcedtech/gitbase-exploring-git-repos-with-sql-95ec0986386c

