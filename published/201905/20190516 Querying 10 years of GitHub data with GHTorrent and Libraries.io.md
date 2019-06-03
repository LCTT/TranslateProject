[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10906-1.html)
[#]: subject: (Querying 10 years of GitHub data with GHTorrent and Libraries.io)
[#]: via: (https://opensource.com/article/19/5/chaossearch-github-ghtorrent)
[#]: author: (Pete Cheslock https://opensource.com/users/petecheslock/users/ghaff/users/payalsingh/users/davidmstokes)

用 GHTorrent 和 Libraries.io 查询 10 年的 GitHub 数据
======

> 有一种方法可以在没有任何本地基础设施的情况下使用开源数据集探索 GitHub 数据。
 
![magnifying glass on computer screen](https://img.linux.net.cn/data/attachment/album/201905/27/220200jlzrlz333vkfl8ok.jpg)

我一直在寻找新的数据集，以用它们来展示我们团队工作的力量。[CHAOSSEARCH][2] 可以将你的 [Amazon S3][3] 对象存储数据转换为完全可搜索的 [Elasticsearch][4] 式集群。使用 Elasticsearch API 或 [Kibana][5] 等工具，你可以查询你所要找的任何数据。

当我找到 [GHTorrent][6] 项目进行探索时，我很兴奋。GHTorrent 旨在通过 GitHub API 构建所有可用数据的离线版本。如果你喜欢数据集，这是一个值得一看的项目，甚至你可以考虑[捐赠一个 GitHub API 密钥][7]。

### 访问 GHTorrent 数据

有许多方法可以访问和使用 [GHTorrent 的数据][8]，它以 [NDJSON][9] 格式提供。这个项目可以以多种形式提供数据，包括用于恢复到 [MySQL][11] 数据库的 [CSV][10]，可以转储所有对象的 [MongoDB][12]，以及用于将数据直接导出到 Google 对象存储中的 Google Big Query（免费）。 有一点需要注意：这个数据集有从 2008 年到 2017 年几乎完整的数据集，但从 2017 年到现在的数据还不完整。这将影响我们确定性查询的能力，但它仍然是一个令人兴奋的信息量。

我选择 Google Big Query 来避免自己运行任何数据库，那么我就可以很快下载包括用户和项目在内的完整数据库。CHAOSSEARCH 可以原生分析 NDJSON 格式，因此在将数据上传到 Amazon S3 之后，我能够在几分钟内对其进行索引。CHAOSSEARCH 平台不要求用户设置索引模式或定义其数据的映射，它可以发现所有字段本身（字符串、整数等）。

随着我的数据完全索引并准备好进行搜索和聚合，我想深入了解看看我们可以发现什么，比如哪些软件语言是 GitHub 项目最受欢迎的。

（关于格式化的说明：下面这是一个有效的 JSON 查询，我们不会在这里正确格式化以避免滚动疲劳。要正确格式化它，你可以在本地复制它并发送到命令行实用程序，如 [jq][13]。）

```
{"aggs":{"2":{"date_histogram":{"field":"root.created_at","interval":"1M","time_zone":"America/New_York","min_doc_count":1}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["root.created_at","root.updated_at"],"query":{"bool":{"must":[],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"root.language":{"query":""}}}]}}}
```

对于那些近年来跟踪开源语言状态的人来说，这个结果并不令人惊讶。

![Which software languages are the most popular on GitHub.][14]

[JavaScript][15] 仍然是卫冕冠军，虽然有些人认为 JavaScript 正在逐渐消失，但它仍然是 800 磅重的大猩猩，很可能会保持这种状态一段时间。[Java][16] 面临类似的谣言，但这些数据表明它是开源生态系统的重要组成部分。

考虑到像 [Docker][17] 和 [Kubernetes][18] 这样的项目的流行，你可能会想，“Go（[Golang][19]）怎么样？”这是一个提醒的好时机，这里讨论的 GitHub 数据集包含一些空缺，最明显的是在 2017 年之后我看到 Golang 项目随处可见，而这里并没有显示。我希望用完整的 GitHub 数据集重复此搜索，看看它是否会改变排名。

现在让我们来探讨项目创建的速度。 （提醒：这是为了便于阅读而合并的有效 JSON。）

```
{"aggs":{"2":{"date_histogram":{"field":"root.created_at","interval":"1M","time_zone":"America/New_York","min_doc_count":1}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["root.created_at","root.updated_at"],"query":{"bool":{"must":[],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"root.language":{"query":""}}}]}}}
```

我们可以看到创建新项目的速度，也会给人留下深刻的印象，从 2012 年左右开始大幅增长：

![The rate at which new projects are created on GitHub.][20]

既然我知道了创建项目的速度以及用于创建这些项目的最流行的语言，我还想知道这些项目选择的开源许可证。遗憾的是，这个 GitHub 项目数据集中并不存在这些数据，但是 [Tidelift][21] 的精彩团队在 [Libraries.io][22] [数据][23] 里发布了一个 GitHub 项目的详细列表，包括使用的许可证以及其中有关开源软件状态的其他详细信息。将此数据集导入 CHAOSSEARCH 只花了几分钟，让我看看哪些开源软件许可证在 GitHub 上最受欢迎：

（提醒：这是为了便于阅读而合并的有效 JSON。）

```
{"aggs":{"2":{"terms":{"field":"Repository License","size":10,"order":{"_count":"desc"}}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["Created Timestamp","Last synced Timestamp","Latest Release Publish Timestamp","Updated Timestamp"],"query":{"bool":{"must":[],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"Repository License":{"query":""}}}]}}}
```

结果显示了一些重要的异常值：

![Which open source software licenses are the most popular on GitHub.][24]

如你所见，[MIT 许可证][25] 和 [Apache 2.0 许可证][26] 的开源项目远远超过了其他大多数开源许可证，而 [各种 BSD 和 GPL 许可证][27] 则差得很远。鉴于 GitHub 的开放模式，我不能说我对这些结果感到惊讶。我猜想是用户（而不是公司）创建了大多数项目，并且他们使用 MIT 许可证可以使其他人轻松地使用、共享和贡献。而鉴于有不少公司希望确保其商标得到尊重并为其业务提供开源组件，那么 Apache 2.0 许可证数量高企的背后也是有道理的。

现在我确定了最受欢迎的许可证，我很想看看最少使用的许可证。通过调整我的上一个查询，我将前 10 名逆转为最后 10 名，并且只找到了两个使用 [伊利诺伊大学 - NCSA 开源许可证][28] 的项目。我之前从未听说过这个许可证，但它与 Apache 2.0 非常接近。看到所有 GitHub 项目中使用了多少个不同的软件许可证，这很有意思。

![The University of Illinois/NCSA open source license.][29]

之后，我针对特定语言（JavaScript）来查看最常用的许可证。（提醒：这是为了便于阅读而合并的有效JSON。）

```
{"aggs":{"2":{"terms":{"field":"Repository License","size":10,"order":{"_count":"desc"}}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["Created Timestamp","Last synced Timestamp","Latest Release Publish Timestamp","Updated Timestamp"],"query":{"bool":{"must":[{"match_phrase":{"Repository Language":{"query":"JavaScript"}}}],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"Repository License":{"query":""}}}]}}}
```

这个输出有一些意外。

![The most popular open source licenses used for GitHub JavaScript projects.][30]

尽管使用 `npm init` 创建的 [NPM][31] 模块的默认许可证是来自 [Internet Systems Consortium（ISC）][32] 的许可证，但你可以看到相当多的这些项目使用 MIT 以及 Apache 2.0 的开源许可证。

由于 Libraries.io 数据集中包含丰富的开源项目内容，并且由于 GHTorrent 数据缺少最近几年的数据（因此缺少有关 Golang 项目的任何细节），因此我决定运行类似的查询来查看 Golang 项目是如何许可他们的代码的。

（提醒：这是为了便于阅读而合并的有效 JSON。）

```
{"aggs":{"2":{"terms":{"field":"Repository License","size":10,"order":{"_count":"desc"}}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["Created Timestamp","Last synced Timestamp","Latest Release Publish Timestamp","Updated Timestamp"],"query":{"bool":{"must":[{"match_phrase":{"Repository Language":{"query":"Go"}}}],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"Repository License":{"query":""}}}]}}}
```

结果与 Javascript 完全不同。

![How Golang projects license their GitHub code.][33]

Golang 项目与 JavaScript 项目惊人逆转 —— 使用 Apache 2.0 的 Golang 项目几乎是 MIT 许可证的三倍。虽然很难准确地解释为什么会出现这种情况，但在过去的几年中，Golang 已经出现了大规模的增长，特别是在开源和商业化的项目和软件产品公司中。

正如我们上面所了解的，这些公司中的许多公司都希望强制执行其商标策略，因此转向 Apache 2.0 许可证是有道理的。

#### 总结

最后，我通过深入了解 GitHub 用户和项目的数据找到了一些有趣的结果。其中一些我肯定会猜到，但是一些结果对我来说也是惊喜，特别是像很少使用的 NCSA 许可证这样的异常值。

总而言之，你可以看到 CHAOSSEARCH 平台能够快速轻松地找到有趣问题的复杂答案。我无需自己运行任何数据库就可以深入研究这个数据集，甚至可以在 Amazon S3 上以低成本的方式存储数据，因此无需维护。 现在，我可以随时查询有关这些数据的任何其他问题。

你对数据提出了哪些其他问题，以及你使用了哪些数据集？请在评论或推特上告诉我 [@petecheslock] [34]。

本文的一个版本最初发布在 [CHAOSSEARCH][35]，有更多结果可供发现。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/chaossearch-github-ghtorrent

作者：[Pete Cheslock][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petecheslock/users/ghaff/users/payalsingh/users/davidmstokes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://chaossearch.io/
[3]: https://aws.amazon.com/s3/
[4]: https://www.elastic.co/
[5]: https://www.elastic.co/products/kibana
[6]: http://ghtorrent.org
[7]: http://ghtorrent.org/services.html
[8]: http://ghtorrent.org/downloads.html
[9]: http://ndjson.org
[10]: https://en.wikipedia.org/wiki/Comma-separated_values
[11]: https://en.wikipedia.org/wiki/MySQL
[12]: https://www.mongodb.com/
[13]: https://stedolan.github.io/jq/
[14]: https://opensource.com/sites/default/files/uploads/github-1_500.png (Which software languages are the most popular on GitHub.)
[15]: https://en.wikipedia.org/wiki/JavaScript
[16]: /resources/java
[17]: /resources/what-docker
[18]: /resources/what-is-kubernetes
[19]: https://golang.org/
[20]: https://opensource.com/sites/default/files/uploads/github-2_500.png (The rate at which new projects are created on GitHub.)
[21]: https://tidelift.com
[22]: http://libraries.io/
[23]: https://libraries.io/data
[24]: https://opensource.com/sites/default/files/uploads/github-3_500.png (Which open source software licenses are the most popular on GitHub.)
[25]: https://opensource.org/licenses/MIT
[26]: https://opensource.org/licenses/Apache-2.0
[27]: https://opensource.org/licenses
[28]: https://tldrlegal.com/license/university-of-illinois---ncsa-open-source-license-(ncsa)
[29]: https://opensource.com/sites/default/files/uploads/github-4_500_0.png (The University of Illinois/NCSA open source license.)
[30]: https://opensource.com/sites/default/files/uploads/github-5_500_0.png (The most popular open source licenses used for GitHub JavaScript projects.)
[31]: https://www.npmjs.com/
[32]: https://en.wikipedia.org/wiki/ISC_license
[33]: https://opensource.com/sites/default/files/uploads/github-6_500.png (How Golang projects license their GitHub code.)
[34]: https://twitter.com/petecheslock
[35]: https://chaossearch.io/blog/where-are-the-github-users-part-1/
