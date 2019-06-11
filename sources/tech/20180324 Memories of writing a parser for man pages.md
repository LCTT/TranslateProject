回忆：为 man 手册页编写解析器
======

我一般都很喜欢无所事事，但有时候太无聊了也不行 —— 2015 年的一个星期天下午就是这样，我决定开始一个开源项目来让我不那么无聊。

在我寻求创意时，我偶然发现了一个请求，要求构建一个由 [Mathias Bynens][2] 提出的“[按 Web 标准构建的 Man 手册页查看器][1]”。没有考虑太多，我开始使用 JavaScript 编写一个手册页解析器，经过大量的反复思考，最终做出了一个 [Jroff][3]。

那时候，我非常熟悉手册页这个概念，而且使用过很多次，但我知道的仅止于此，我不知道它们是如何生成的，或者是否有一个标准。在经过两年后，我有了一些关于此事的想法。

### man 手册页是如何写的

当时令我感到惊讶的第一件事是，手册页的核心只是存储在系统某处的纯文本文件（你可以使用 `manpath` 命令检查此目录）。

此文件中不仅包含文档，还包含使用了 20 世纪 70 年代名为 `troff` 的排版系统的格式化信息。

> troff 及其 GNU 实现 groff 是处理文档的文本描述以生成适合打印的排版版本的程序。**它更像是“你所描述的即你得到的”，而不是你所见即所得的。**
>
>  - 摘自 [troff.org][4]

如果你对排版格式毫不熟悉，可以将它们视为 steroids 期刊用的 Markdown，但其灵活性带来的就是更复杂的语法：

![groff-compressor][5]

The `groff` file can be written manually, or generated from other formats such as Markdown, Latex, HTML, and so on with many different tools.

Why `groff` and man pages are tied together has to do with history, the format has [mutated along time][6], and his lineage is composed of a chain of similarly-named programs: RUNOFF > roff > nroff > troff > groff.

But this doesn’t necessarily mean that `groff` is strictly related to man pages, it’s a general-purpose format that has been used to [write books][7] and even for [phototypesetting][8].

Moreover, It’s worth noting that `groff` can also call a postprocessor to convert its intermediate output to a final format, which is not necessarily ascii for terminal display! some of the supported formats are: TeX DVI, HTML, Canon, HP LaserJet4 compatible, PostScript, utf8 and many more.

### Macros

Other of the cool features of the format is its extensibility, you can write macros that enhance the basic functionalities.

With the vast history of *nix systems, there are several macro packages that group useful macros together for specific functionalities according to the output that you want to generate, examples of macro packages are `man`, `mdoc`, `mom`, `ms`, `mm`, and the list goes on.

Manual pages are conventionally written using `man` and `mdoc`.

You can easily distinguish native `groff` commands from macros by the way standard `groff` packages capitalize their macro names. For `man`, each macro’s name is uppercased, like .PP, .TH, .SH, etc. For `mdoc`, only the first letter is uppercased: .Pp, .Dt, .Sh.

![groff-example][9]

### Challenges

Whether you are considering to write your own `groff` parser, or just curious, these are some of the problems that I have found more challenging.

#### Context-sensitive grammar

Formally, `groff` has a context-free grammar, unfortunately, since macros describe opaque bodies of tokens, the set of macros in a package may not itself implement a context-free grammar.

This kept me away (for good or bad) from the parser generators that were available at the time.

#### Nested macros

Most of the macros in `mdoc` are callable, this roughly means that macros can be used as arguments of other macros, for example, consider this:

  * The macro `Fl` (Flag) adds a dash to its argument, so `Fl s` produces `-s`
  * The macro `Ar` (Argument) provides facilities to define arguments
  * The `Op` (Optional) macro wraps its argument in brackets, as this is the standard idiom to define something as optional.
  * The following combination `.Op Fl s Ar file` produces `[-s file]` because `Op` macros can be nested.



#### Lack of beginner-friendly resources

Something that really confused me was the lack of a canonical, well defined and clear source to look at, there’s a lot of information in the web which assumes a lot about the reader that it takes time to grasp.

### Interesting macros

To wrap up, I will offer to you a very short list of macros that I found interesting while developing jroff:

**man**

  * TH: when writing manual pages with `man` macros, your first line that is not a comment must be this macro, it accepts five parameters: title section date source manual
  * BI: bold alternating with italics (especially useful for function specifications)
  * BR: bold alternating with Roman (especially useful for referring to other manual pages)



**mdoc**

  * .Dd, .Dt, .Os: similar to how `man` macros require the `.TH` the `mdoc` macros require these three macros, in that particular order. Their initials stand for: Document date, Document title and Operating system.
  * .Bl, .It, .El: these three macros are used to create list, their names are self-explanatory: Begin list, Item and End list.




--------------------------------------------------------------------------------

via: https://monades.roperzh.com/memories-writing-parser-man-pages/

作者：[Roberto Dip][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
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
