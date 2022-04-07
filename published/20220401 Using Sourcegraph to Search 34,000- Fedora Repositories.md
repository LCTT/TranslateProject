[#]: subject: "Using Sourcegraph to Search 34,000+ Fedora Repositories"
[#]: via: "https://fedoramagazine.org/using-sourcegraph-to-search-34000-fedora-repositories/"
[#]: author: "Justin Dorfman https://fedoramagazine.org/author/jdorfman/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14434-1.html"

使用 Sourcegraph 搜索 34000 多个 Fedora 仓库
======

![](https://img.linux.net.cn/data/attachment/album/202204/05/151255yuq9zem6euei5ui5.jpg)

在 2021 年 10 月，一个 Fedora Linux 用户 [问了一个关于许可的问题][4]。Fedora 项目负责人 Matthew Miller [回复道][5]：“我不能快速地检查（这个问题），因为我们没有一个完整的、庞大的、可搜索的存储库来检索 Fedora 中所有软件包。”

[接着他说][6]：“……或许我们可以付钱给 Sourcegraph，让他们帮我们做这个。他们看起来乐于助人。” 他说的没错，我们（Sourcegraph）的确是乐于助人，而且我们还不想要你的钱，相反，我们想与 Fedora 社区合作。

Fedora 社区现在可以在他们的开源代码世界中尽情搜索 —— 目前有超过 34,000 个存储库，而且还在不断增加。

### 代码搜索简介

如果你还不熟悉 [代码搜索][7] 的概念，我现在就来告诉你。代码搜索可以让团队更快地掌握一个新的代码库，在里面找到答案，帮助团队识别安全风险，以及许多其他用例。Sourcegraph 已经在 GitHub 和 GitLab 等多个代码托管服务上，索引了 200 多万个存储库。本文只关注 src.fedoraproject.org 的代码搜索。Sourcegraph 同时提供了一个 [Web 应用][8] 和 [命令行客户端][9]。

### 使用 Web 应用

在使用 Sourcegraph [Web 应用][8] 时，你需要先输入初始字符串 `repo:^src.fedoraprojects.org`，然后再开始查询。这个 [Web 应用][8] 链接中包括了上面的初始字符串，点击这个链接后，搜索界面如下图所示：

![Sourcegraph Web 应用界面][10]

下面我将提供几个使用 Web 应用程序进行搜索的例子，大家可能会对它们感兴趣。

#### 查找使用流行的经 OSI 批准的许可证的存储库 

下面的查询语句将扫描所有兼容 “<ruby>开源定义<rt>Open Source Definition</rt></ruby>”（OSD） 的软件存储库。

```
repo:^src.fedoraproject.org/ lang:"RPM Spec" License: ^.*apache|bsd|gpl|lgpl|mit|mpl|cddl|epl.*$
```

![许可证搜索][11]

> [试一下！][12]

#### 查找带有 TODO 的文件

下面的查询语句将在 34,000 多个仓库中找到 `TODO` 文件。对于那些希望为需要帮助的项目做出贡献的人来说，是一个非常棒的功能。

```
repo:^src.fedoraproject.org/ "TODO"
```

![搜索 TODO][13]

> [试一下！][14]

#### 查找 FTP 服务器上的文件

我的一个前同事告诉我 “FTP 是一个死协议”。真的是这样吗？你也可以在这个查询中加入任何其他协议，如 irc、https 等。

```
repo:^src.fedoraproject.org/ (?:ftp)://[A-Za-z0-9-]{0,63}(.[A-Za-z0-9-]{0,63})+(:d{1,4})?/*(/*[A-Za-z0-9-._]+/*)*(?.*)?(#.*)?
```

![搜索协议][15]

> [试一下！][16]

#### 查找使用有漏洞的 Log4j 版本的文件

这个查询语句将找到任何可能存在 CVE-2021-44228（也就是 Log4j）漏洞的文件（可能会有误报）。你也可以搜索其他漏洞，然后报告给项目维护者。

```
repo:^src.fedoraproject.org/ org.apache.logging.log4j 2.((0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15)(.[0-9]+)) count:all
```

![搜索 log4j][17]

> [试一下！][18]

### 使用命令行

Sourcegraph 还有一个叫做 [src][19] 的命令行客户端，它可以让你完成我刚才提到的所有事情。此外，它还有其他一些有用的命令。比如说，它可以把结果用 JSON 格式输出，方便你在编程中使用。

```
src search -json 'repo:^src.fedoraproject.org/ lang:"RPM Spec" License: ^.*apache|bsd|gpl|lgpl|mit|mpl|cddl|epl.*$'
```

#### 输出 JSON

![输出 JSON][20]

> [试一下！][21]

### 搜索语法

就入门而言，上面的例子是很好的起点，但 Sourcegraph 还支持更多的查询语句。你可以 [查看所有的搜索查询语法][22]，并根据需要创建你自己的查询语句。

### 总结

正如你所看到的，有了 Sourcegraph，Fedora Linux 社区现在可以快速搜索托管在 [src.fedoraproject.org][23] 上的所有代码，无论是使用普通查询还是复杂的正则查询。

感谢 Fedora Linux 社区的慷慨帮助和热情欢迎。如果你有任何想补充的内容或问题，我和我的团队都会在下面的评论区回复。你也可以 [在 Slack 上找到我们][24]。

特别感谢 [Vanesa Ortiz][25] 促成了这次合作，还有 [Ben Venker][27] 帮助修复了我的正则表达式（多次），以及 [Rebecca Dodd][28] 和 [Nick Moore][29] 在编辑上的帮助。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-sourcegraph-to-search-34000-fedora-repositories/

作者：[Justin Dorfman][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jdorfman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/03/sourcegraph-816x345.jpg
[2]: https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/magnifying-glass?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/thread/CBCJHOSP36YXQKCVGWVL5MXU64LZ6NZA/
[5]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/message/LTIQS2PX33FSCEIAPJS62UZXVPDT5JPB/
[6]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/message/5GEPBSRGUK5E2FLW4MQBVP6DI65XP2LQ/
[7]: https://codesearchguide.org/
[8]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/&patternType=regexp
[9]: https://docs.sourcegraph.com/cli/quickstart
[10]: https://fedoramagazine.org/wp-content/uploads/2022/03/Image-2022-03-28-at-1.41.54-PM-1024x335.png
[11]: https://fedoramagazine.org/wp-content/uploads/2022/03/license-1024x513.png
[12]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+lang:%22RPM+Spec%22+License:+%5E.*apache%7Cbsd%7Cgpl%7Clgpl%7Cmit%7Cmpl%7Ccddl%7Cepl.*%24&patternType=regexp
[13]: https://fedoramagazine.org/wp-content/uploads/2022/03/todo-1024x605.png
[14]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+%22TODO%22&patternType=regexp&case=yes
[15]: https://fedoramagazine.org/wp-content/uploads/2022/03/protocol-1024x457.png
[16]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+%28%3F:ftp%29:%5C/%5C/%5BA-Za-z0-9%5C-%5D%7B0%2C63%7D%28%5C.%5BA-Za-z0-9%5C-%5D%7B0%2C63%7D%29%2B%28:%5Cd%7B1%2C4%7D%29%3F%5C/*%28%5C/*%5BA-Za-z0-9%5C-._%5D%2B%5C/*%29*%28%5C%3F.*%29%3F%28%23.*%29%3F&patternType=regexp
[17]: https://fedoramagazine.org/wp-content/uploads/2022/03/log4j-1024x295.png
[18]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+org%5C.apache%5C.logging%5C.log4j+2.%28%280%7C1%7C2%7C3%7C4%7C5%7C6%7C7%7C8%7C9%7C10%7C11%7C12%7C13%7C14%7C15%29%28%5C.%5B0-9%5D%2B%29%29+count:all&patternType=regexp
[19]: https://github.com/sourcegraph/src-cli#readme
[20]: https://fedoramagazine.org/wp-content/uploads/2022/03/Image-2022-03-22-at-9.46.26-AM-1024x521.png
[21]: https://sourcegraph.com/notebooks/Tm90ZWJvb2s6MzQ2
[22]: https://docs.sourcegraph.com/code_search/reference/queries
[23]: https://src.fedoraproject.org/
[24]: https://srcgr.ph/wp-join-community-space
[25]: https://twitter.com/vanesacodes
[26]: https://discussion.fedoraproject.org/t/fedora-sourcegraph-marketing-community-collaboration/36151
[27]: https://handbook.sourcegraph.com/team/#ben-venker
[28]: https://handbook.sourcegraph.com/team/#rebecca-dodd
[29]: https://twitter.com/nickwritesit
