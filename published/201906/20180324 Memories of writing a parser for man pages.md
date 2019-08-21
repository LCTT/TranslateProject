为 man 手册页编写解析器的备忘录
======
![](https://img.linux.net.cn/data/attachment/album/201906/11/235607fiqfqapvpzqhh8n1.jpg)

我一般都很喜欢无所事事，但有时候太无聊了也不行 —— 2015 年的一个星期天下午就是这样，我决定开始写一个开源项目来让我不那么无聊。

在我寻求创意时，我偶然发现了一个请求，要求构建一个由 [Mathias Bynens][2] 提出的“[按 Web 标准构建的 Man 手册页查看器][1]”。没有考虑太多，我开始使用 JavaScript 编写一个手册页解析器，经过大量的反复思考，最终做出了一个 [Jroff][3]。

那时候，我非常熟悉手册页这个概念，而且使用过很多次，但我知道的仅止于此，我不知道它们是如何生成的，或者是否有一个标准。在经过两年后，我有了一些关于此事的想法。

### man 手册页是如何写的

当时令我感到惊讶的第一件事是，手册页的核心只是存储在系统某处的纯文本文件（你可以使用 `manpath` 命令检查这些目录）。

此文件中不仅包含文档，还包含使用了 20 世纪 70 年代名为 `troff` 的排版系统的格式化信息。

> troff 及其 GNU 实现 groff 是处理文档的文本描述以生成适合打印的排版版本的程序。**它更像是“你所描述的即你得到的”，而不是你所见即所得的。**
>
>  - 摘自 [troff.org][4]

如果你对排版格式毫不熟悉，可以将它们视为 steroids 期刊用的 Markdown，但其灵活性带来的就是更复杂的语法：

![groff-compressor][5]

`groff` 文件可以手工编写，也可以使用许多不同的工具从其他格式生成，如 Markdown、Latex、HTML 等。

为什么 `groff` 和 man 手册页绑在一起是有历史原因的，其格式[随时间有变化][6]，它的血统由一系列类似命名的程序组成：RUNOFF > roff > nroff > troff > groff。

但这并不一定意味着 `groff` 与手册页有多紧密的关系，它是一种通用格式，已被用于[书籍][7]，甚至用于[照相排版][8]。

此外，值得注意的是 `groff` 也可以调用后处理器将其中间输出结果转换为最终格式，这对于终端显示来说不一定是 ascii ！一些支持的格式是：TeX DVI、HTML、Canon、HP LaserJet4 兼容格式、PostScript、utf8 等等。

### 宏

该格式的其他很酷的功能是它的可扩展性，你可以编写宏来增强其基本功能。

鉴于 *nix 系统的悠久历史，有几个可以根据你想要生成的输出而将特定功能组合在一起的宏包，例如 `man`、`mdoc`、`mom`、`ms`、`mm` 等等。

手册页通常使用 `man` 和 `mdoc` 宏包编写。

区分原生的 `groff` 命令和宏的方式是通过标准 `groff` 包大写其宏名称。对于 `man` 宏包，每个宏的名称都是大写的，如 `.PP`、`.TH`、`.SH` 等。对于 `mdoc` 宏包，只有第一个字母是大写的： `.Pp`、`.Dt`、`.Sh`。

![groff-example][9]

### 挑战

无论你是考虑编写自己的 `groff` 解析器，还是只是好奇，这些都是我发现的一些更具挑战性的问题。

#### 上下文敏感的语法

表面上，`groff` 的语法是上下文无关的，遗憾的是，因为宏描述的是主体不透明的令牌，所以包中的宏集合本身可能不会实现上下文无关的语法。

这导致我在那时做不出来一个解析器生成器（不管好坏）。

#### 嵌套的宏

`mdoc` 宏包中的大多数宏都是可调用的，这差不多意味着宏可以用作其他宏的参数，例如，你看看这个：

* 宏 `Fl`（Flag）会在其参数中添加破折号，因此 `Fl s` 会生成 `-s`
* 宏 `Ar`（Argument）提供了定义参数的工具
* 宏 `Op`（Optional）会将其参数括在括号中，因为这是将某些东西定义为可选的标准习惯用法
* 以下组合 `.Op Fl s Ar file ` 将生成 `[-s file]`，因为 `Op` 宏可以嵌套。

#### 缺乏适合初学者的资源

让我感到困惑的是缺乏一个规范的、定义明确的、清晰的来源，网上有很多信息，这些信息对读者来说很重要，需要时间来掌握。

### 有趣的宏

总结一下，我会向你提供一个非常简短的宏列表，我在开发 jroff 时发现它很有趣：

`man` 宏包：

* `.TH`：用 `man` 宏包编写手册页时，你的第一个不是注释的行必须是这个宏，它接受五个参数：`title`、`section`、`date`、`source`、`manual`。
* `.BI`：粗体加斜体（特别适用于函数格式）
* `.BR`：粗体加正体（特别适用于参考其他手册页）

`mdoc` 宏包：

* `.Dd`、`.Dt`、`.Os`：类似于 `man` 宏包需要 `.TH`，`mdoc` 宏也需要这三个宏，需要按特定顺序使用。它们的缩写分别代表：文档日期、文档标题和操作系统。
* `.Bl`、`.It`、`.El`：这三个宏用于创建列表，它们的名称不言自明：开始列表、项目和结束列表。

--------------------------------------------------------------------------------

via: https://monades.roperzh.com/memories-writing-parser-man-pages/

作者：[Roberto Dip][a]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://monades.roperzh.com
[1]:https://github.com/h5bp/lazyweb-requests/issues/114
[2]:https://mathiasbynens.be/
[3]:jroff
[4]:https://www.troff.org/
[5]:https://user-images.githubusercontent.com/4419992/37868021-2e74027c-2f7f-11e8-894b-80829ce39435.gif
[6]:https://manpages.bsd.lv/history.html
[7]:https://rkrishnan.org/posts/2016-03-07-how-is-gopl-typeset.html
[8]:https://en.wikipedia.org/wiki/Phototypesetting
[9]:https://user-images.githubusercontent.com/4419992/37866838-e602ad78-2f6e-11e8-97a9-2a4494c766ae.jpg
