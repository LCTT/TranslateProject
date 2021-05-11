[#]: subject: (5 signs you might be a Rust programmer)
[#]: via: (https://opensource.com/article/21/3/rust-programmer)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13280-1.html)

你可能是 Rust 程序员的五个迹象
======

> 在我学习 Rust 的过程中，我注意到了 Rust 一族的一些常见行为。

![](https://img.linux.net.cn/data/attachment/album/202104/08/233233asbjasbfuiuosiha.jpg)

我是最近才 [皈依 Rust][2] 的，我大约在是 2020 年 4 月底开始学习的。但是，像许多皈依者一样，我还是一个热情的布道者。说实话，我也不是一个很好的 Rust 人，因为我的编码风格不是很好，我写的也不是特别符合 Rust 习惯。我猜想这一方面是因为我在写大量代码之前还没有没有真正学完 Rust（其中一些代码又困扰了我），另一方面是因为我并不是那么优秀的程序员。

但我喜欢 Rust，你也应该喜欢吧。它很友好，比 C 或 C++ 更友好；它为低级系统任务做好了准备，这比 Python 做的更好；而且结构良好，这要超过 Perl；而且，最重要的是，从设计层面开始，它就是完全开源的，这要比 Java 那些语言好得多。

尽管我缺乏专业知识，但我注意到了一些我认为是许多 Rust 爱好者和程序员的共同点。如果你对以下五个迹象点头（其中第一个迹象是由最近的一些令人兴奋的新闻引发的），那么你也可能是一个 Rust 程序员。

### 1、“基金会”一词会使你兴奋

对于 Rust 程序员来说，“基金会”一词将不再与<ruby>艾萨克·阿西莫夫<rt>Isaac Asimov</rt></ruby>关联在一起，而是与新成立的 [Rust 基金会][3] 关联。微软、华为、谷歌、AWS 和Mozilla 为该基金会提供了董事（大概也提供了大部分初始资金），该基金会将负责该语言的各个方面，“预示着 Rust 成为企业生产级技术的到来”，[根据临时执行董事][4] Ashley Williams 说。（顺便说一句，很高兴看到一位女士领导这样一项重大的行业计划。）

该基金会似乎致力于维护 Rust 的理念，并确保每个人都有参与的机会。在许多方面，Rust 都是开源项目的典型示例。并不是说它是完美的（无论是语言还是社区），而是因为似乎有足够的爱好者致力于维护高参与度、低门槛的社区方式，我认为这是许多开源项目的核心。我强烈欢迎此举，我认为这只会帮助促进 Rust 在未来数年和数月内的采用和成熟。

### 2、你会因为新闻源中提到 Rust 游戏而感到沮丧

还有一款和电脑有关的东西，也叫做“Rust”，它是一款“只限多玩家生存类的电子游戏”。它比 Rust 这个语言更新一些（2013 年宣布，2018 年发布），但我曾经在搜索 Rust 相关的内容时，犯了一个错误，用这个名字搜索了游戏。互联网络就是这样的，这意味着我的新闻源现在被这个另类的 Rust 野兽感染了，我现在会从它的影迷和公关人员那里随机得到一些更新消息。这是个低调的烦恼，但我很确定在 Rust（语言）社区中并不是就我一个人这样。我强烈建议，如果你确实想了解更多关于这个计算世界的后起之秀的信息，你可以使用一个提高隐私（我拒绝说 "保护隐私"）的 [开源浏览器][5] 来进行研究。

### 3、“不安全”这个词会让你感到恐惧。

Rust（语言，再次强调）在帮助你做**正确的事情**™方面做得非常好，当然，在内存安全方面，这是 C 和 C++ 内部的主要关注点（不是因为不可能做到，而是因为真的很难持续正确）。Dave Herman 在 2016 年写了一篇文章《[Safety is Rust's fireflower][6]》，讲述了为什么安全是 Rust 语言的一个积极属性。安全性（内存、类型安全）可能并不赏心悦目，但随着你写的 Rust 越多，你就会习惯并感激它，尤其是当你参与任何系统编程时，这也是 Rust 经常擅长的地方。

现在，Rust 并不能阻止你做**错误的事情**™，但它确实通过让你使用 `unsafe` 关键字，让你在希望超出安全边界的时候做出一个明智的决定。这不仅对你有好处，因为它（希望）会让你非常、非常仔细地思考你在任何使用它的代码块中放入了什么；它对任何阅读你的代码的人也有好处，这是一个触发词，它能让任何不太清醒的 Rust 人至少可以稍微打起精神，在椅子上坐直，然后想：“嗯，这里发生了什么？我需要特别注意。”如果幸运的话，读你代码的人也许能想到重写它的方法，使它利用到 Rust 的安全特性，或者至少减少提交和发布的不安全代码的数量。

### 4、你想知道为什么没有 `?;`、`{:?}` 、`::<>` 这样的表情符号

人们喜欢（或讨厌）涡轮鱼（`::<>`），但在 Rust 代码中你经常还会看到其他的语义结构。特别是 `{:?}` （用于字符串格式化）和 `?;`（`?` 是向调用栈传播错误的一种方式，`;` 则是行/块的结束符，所以你经常会看到它们在一起）。它们在 Rust 代码中很常见，你只需边走边学，边走边解析，而且它们也很有用，我有时会想，为什么它们没有被纳入到正常对话中，至少可以作为表情符号。可能还有其他的。你有什么建议？

### 5、Clippy 是你的朋友（而不是一个动画回形针）

微软的动画回形针 Clippy 可能是 Office 用户很快就觉得讨厌的“功能”，并成为许多 [模因][7] 的起点。另一方面，`cargo clippy` 是那些 [很棒的 Cargo 命令][8] 之一，应该成为每个 Rust 程序员工具箱的一部分。Clippy 是一个语言<ruby>整洁器<rt>Linter</rt></ruby>，它可以帮助改进你的代码，使它更干净、更整洁、更易读、更惯用，让你与同事或其他人分享 Rust 代码时，不会感到尴尬。Cargo 可以说是让 “Clippy” 这个名字恢复了声誉，虽然我不会选择给我的孩子起这个名字，但现在每当我在网络上遇到这个词的时候，我不会再有一种不安的感觉。

* * *

这篇文章最初发表在 [Alice, Eve, and Bob] [9]上，经作者许可转载。


--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/rust-programmer

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_OSDC_IntroOS_520x292_FINAL.png?itok=woiZamgj (name tag that says hello my name is open source)
[2]: https://opensource.com/article/20/6/why-rust
[3]: https://foundation.rust-lang.org/
[4]: https://foundation.rust-lang.org/posts/2021-02-08-hello-world/
[5]: https://opensource.com/article/19/7/open-source-browsers
[6]: https://www.thefeedbackloop.xyz/safety-is-rusts-fireflower/
[7]: https://knowyourmeme.com/memes/clippy
[8]: https://opensource.com/article/20/11/commands-rusts-cargo
[9]: https://aliceevebob.com/2021/02/09/5-signs-that-you-may-be-a-rust-programmer/
