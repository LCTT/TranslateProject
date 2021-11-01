[#]: subject: "Make YAML as easy as it looks"
[#]: via: "https://opensource.com/article/21/9/yaml-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13842-1.html"

让 YAML 变得像它看起来一样简单
======

> YAML 看起来很简单，为什么它这么难写呢？了解成功使用 YAML 的两个秘诀。

![](https://img.linux.net.cn/data/attachment/album/202110/02/101824shamurmpvldpu29a.jpg)

如果你曾经尝试过写 YAML，你可能一开始会对它看起来很容易感到高兴。乍一看，经常用于配置文件、Ansible 剧本和普通文件数据库的 YAML 看起来就像购物清单一样直观。然而，YAML 的结构中有很多细微的差别，它隐藏着一个危险的秘密：YAML 实际上是一种高度精确、结构化和令人惊讶的严格语言。好消息是，你只需要了解两件事就可以知道 YAML 的工作原理。

关于 YAML 的真相是，YAML 中只有两种数据结构：<ruby>序列<rt>sequence</rt></ruby>和<ruby>映射<rt>mapping</rt></ruby>。这是两个花哨的名字，你会发现它代表了你非常熟悉的概念。这篇文章解释了这两种结构，更重要的是，介绍了它们是如何协同工作，使 YAML 成为表示你所关心的数据的强大方式。

### YAML 序列

YAML 序列是一个列表。在其最简单的形式中，每行有一个项目，每行以破折号和空格开始。

下面是一个例子：

```
---
- Linux
- BSD
- Illumos
```

不同的语言有不同的方式来表示这种数据。例如，在 Python 中，同一个列表可以写成 `['Linux', 'BSD', 'Illumos']`。当你在现实生活中写一个列表时，例如在你去买菜之前，你写的可能近似于 YAML 序列。

### YAML 映射

YAML 映射是一个关键术语与该术语的定义相结合。在其他语言中，映射被称为“键值对”或“词典”。

这里有一个例子：

```
---
Kernel: Linux
CPU: AMD
RAM: '16 GB'
```

不同的语言有不同的方式来表示这种数据。[在 Python 中][2]，例如，同样的数据可以写成 `{"Kernel": "Linux", "CPU": "AMD", "RAM": "16 GB"}`。在现实生活中，你可能会使用这种结构来计划，例如，与朋友的游戏之夜。一个朋友报名带零食，另一个报名带一副牌，另一个报名带一个棋盘游戏，等等。

### 组合序列和映射

你现在知道 YAML 的语法了。序列和映射是 YAML 中仅有的两种构件，你想在 YAML 中表示的任何东西都可以放在序列或映射中。

或者同时使用这二者！

是的，序列和映射可以被组合和嵌套，这就是 YAML 看起来很直观，但同时又感觉很复杂的原因之一。不过，只有四种可能的组合，一旦你学会如何看它们，YAML 就会觉得像它看起来一样简单。

### 序列的映射

当你想让一个键项有许多值时，你可以使用一个序列的映射。也就是说，你从一个映射（键）开始，但是给值一个列表：

```
---
Linux:
  - Fedora
  - Slackware
BSD:
  - FreeBSD
  - NetBSD
```

在这个示例代码中，`Linux` 是第一个键，它的值是一个序列，其中包含 `Fedora` 和 `Slackware`。第二个键是 `BSD`，它的值是一个序列，包含 `FreeBSD` 和 `NetBSD`。

### 映射的映射

当你想让一个键项的值中既有键又有值时，你可以使用映射的映射。也就是说，你从一个映射（键）开始，但是给值另一个映射。

这可能有点欺骗性，但它揭示了 YAML 中使用特定术语的原因：因为你只不过是创建了一个映射的列表，并不意味着你创建了一个序列。这里是一个映射的映射：

```
---
Desktop:
  CPU: RISC-V
  RAM: '32 GB'
Laptop:
  CPU: AMD
  RAM: '16 GB'
```

对大多数人来说，这看起来像一个列表。而且从技术上讲，它是一个列表。但重要的是要认识到，它不是 YAML 序列。它是一个映射，其中包含映射。作为半个 YAML 专家，你可以从明显缺少破折号的地方看出区别。

在 Ansible 剧本的所有结构中，我发现这个结构最容易欺骗人。作为人类，我们喜欢列表，当我们看到一个数据结构 _在字面上_ 是列表时，大多数人会把它当成 YAML 序列。但是在 YAML 中，虽然序列是列表，但是列表并不总是序列。

### 序列的序列

就像你可以嵌套映射一样，你可以将一个序列嵌套到一个序列中：

```
---
- [Linux, FreeBSD, Illumos]
- [YAML, XML, JSON]
```

这可能是我在 YAML 的实际使用中遇到的最不常见的数据结构，但有时你需要一个列表的列表。

### 映射的序列

你也可以创建一个包含映射的序列。对于人类排序数据的方式来说，这并不太常见，但对于计算机来说，这可能是一个重要的结构。

这里有一个例子：

```
---
-
  CPU: AMD
  RAM: '16 GB'
-
  CPU: Intel
  RAM: '16 GB'
```

对于 YAML，这可能是最不直观的语法。我发现它在 Python 中呈现时更清晰：

```
[{"CPU": "AMD", "RAM": "16 GB"}, {"CPU": "Intel", "RAM": "16 GB"}]
```

方括号代表一个列表结构，这个列表包含两个字典。每个字典都包含键值对。

### 构建更好的 YAML

现在你知道了 YAML 的两个组成部分，以及它们如何被组合起来以表示复杂的数据结构。问题是：你要用 YAML 构建什么？

和很多人一样，我也使用 YAML 来编写 Ansible 剧本。我还用它作为一种简单的配置格式、作为 D&D 的角色表、表示项目组织所需的目录结构，等等。只要你能适应序列和映射的概念，你会发现 YAML 是一种很容易编写、阅读和（如果有合适的库）解析的格式。

如果你发现自己经常使用 YAML，请下载我们的 [YAML 速查表][3]，以帮助你直观地了解基本数据结构及其组合，并帮助你记住一些额外的语法约定。通过一点点的练习，你会发现 YAML 真的和它看起来一样简单！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/yaml-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/21/3/dictionary-values-python
[3]: https://opensource.com/downloads/yaml-cheat-sheet
