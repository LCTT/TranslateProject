[#]: collector: (lujun9972)
[#]: translator: (martin2011qi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11222-1.html)
[#]: subject: (What is POSIX? Richard Stallman explains)
[#]: via: (https://opensource.com/article/19/7/what-posix-richard-stallman-explains)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

POSIX 是什么？让我们听听 Richard Stallman 的诠释
======

> 从计算机自由先驱的口中探寻操作系统兼容性标准背后的本质。

![](https://img.linux.net.cn/data/attachment/album/201908/13/231737robbwoss7p3p7jwo.jpg)

[POSIX][2] 是什么？为什么如此重要？你可能在很多的技术类文章中看到这个术语，但往往会在探寻其本质时迷失在<ruby>技术初始主义<rt>techno-initialisms</rt></ruby>的海洋或是<ruby>以 X 结尾的行话<rt>jargon-that-ends-in-X</rt></ruby>中。我给 [Richard Stallman][3] 博士（在黑客圈里面常称之为 RMS）发了邮件以探寻这个术语的起源及其背后的概念。 

Richard Stallman 认为用 “开源” 和 “闭源” 来归类软件是一种错误的方法。Stallman 将程序分类为 <ruby>尊重自由的<rt>freedom-respecting</rt></ruby>（“<ruby>自由<rt>free</rt></ruby>” 或 “<ruby>自由（西语）<rt>libre</rt></ruby>”）和 <ruby>践踏自由的<rt>freedom-trampling</rt></ruby>（“<ruby>非自由<rt>non-free</rt></ruby>” 或 “<ruby>专有<rt>proprietary</rt></ruby>”）。开源讨论通常会为了（用户）实际得到的<ruby>优势/便利<rt>advantages</rt></ruby>考虑去鼓励某些做法，而非作为道德层面上的约束。

Stallman 在由其本人于 1984 年发起的<ruby>自由软件运动<rt>The free software movement</rt></ruby>表明，不仅仅是这些 <ruby>优势/便利<rt>advantages</rt></ruby> 受到了威胁。计算机的用户 <ruby>理应得到<rt>deserve</rt></ruby> 计算机的控制权，因此拒绝被用户控制的程序即是 <ruby>非正义<rt>injustice</rt></ruby>，理应被<ruby>拒绝<rt>rejected</rt></ruby>和<ruby>排斥<rt>eliminated</rt></ruby>。对于用户的控制权，程序应当给予用户 [四项基本自由][4]：

  * 自由度 0：无论用户出于何种目的，必须可以按照用户意愿，自由地运行该软件。
  * 自由度 1：用户可以自由地学习并修改该软件，以便按照自己的意愿进行计算。作为前提，用户必须可以访问到该软件的源代码。
  * 自由度 2：用户可以自由地分发该软件的副本，以便可以帮助他人。
  * 自由度 3：用户可以自由地分发该软件修改后的副本。借此，你可以让整个社区受益于你的改进。作为前提，用户必须可以访问到该软件的源代码。

### 关于 POSIX

**Seth:** POSIX 标准是由 [IEEE][5] 发布，用于描述 “<ruby>可移植操作系统<rt>portable operating system</rt></ruby>” 的文档。只要开发人员编写符合此描述的程序，他们生产的便是符合 POSIX 的程序。在科技行业，我们称之为 “<ruby>规范<rt>specification</rt></ruby>” 或将其简写为 “spec”。就技术用语而言，这是可以理解的，但我们不禁要问是什么使操作系统 “可移植”？

**RMS:** 我认为是<ruby>接口<rt>interface</rt></ruby>应该（在不同系统之间）是可移植的，而非任何一种*系统*。实际上，内部构造不同的各种系统都支持部分的 POSIX 接口规范。

**Seth:** 因此，如果两个系统皆具有符合 POSIX 的程序，那么它们便可以彼此假设，从而知道如何相互 “交谈”。我了解到 “POSIX” 这个简称是你想出来的。那你是怎么想出来的呢？它是如何就被 IEEE 采纳了呢？

**RMS:** IEEE 已经完成了规范的开发，但还没为其想好简练的名称。标题类似是 “可移植操作系统接口”，虽然我已记不清确切的单词。委员会倾向于将 “IEEEIX” 作为简称。而我认为那不太好。发音有点怪 - 听起来像恐怖的尖叫，“Ayeee！” - 所以我觉得人们反而会倾向于称之为 “Unix”。

但是，由于 <ruby>[GNU 并不是 Unix][6]<rt>GNU's Not Unix</rt></ruby>，并且它打算取代之，我不希望人们将 GNU 称为 “Unix 系统”。因此，我提出了人们可能会实际使用的简称。那个时候也没有什么灵感，我就用了一个并不是非常聪明的方式创造了这个简称：我使用了 “<ruby>可移植操作系统<rt>portable operating system</rt></ruby>” 的首字母缩写，并在末尾添加了 “ix” 作为简称。IEEE 也欣然接受了。

**Seth:** POSIX 缩写中的 “操作系统” 是仅涉及 Unix 和类 Unix 的系统（如 GNU）呢？还是意图包含所有操作系统？

**RMS:** 术语 “操作系统” 抽象地说，涵盖了完全不像 Unix 的系统、完全和 POSIX 规范无关的系统。但是，POSIX 规范适用于大量类 Unix 系统；也只有这样的系统才适合 POSIX 规范。

**Seth:** 你是否参与审核或更新当前版本的 POSIX 标准？

**RMS:** 现在不了。

**Seth:** GNU Autotools 工具链可以使应用程序更容易移植，至少在构建和安装时如此。所以可以认为 Autotools 是构建可移植基础设施的重要一环吗？

**RMS:** 是的，因为即使在遵循 POSIX 的系统中，也存在着诸多差异。而 Autotools 可以使程序更容易适应这些差异。顺带一提，如果有人想助力 Autotools 的开发，可以发邮件联系我。

**Seth:** 我想，当 GNU 刚刚开始让人们意识到一个非 Unix 的系统可以从专有的技术中解放出来的时候，关于自由软件如何协作方面，这其间一定存在一些空白区域吧。

**RMS:** 我不认为有任何空白或不确定性。我只是照着 BSD 的接口写而已。

**Seth:** 一些 GNU 应用程序符合 POSIX 标准，而另一些 GNU 应用程序的 GNU 特定的功能，要么不在 POSIX 规范中，要么缺少该规范要求的功能。对于 GNU 应用程序 POSIX 合规性有多重要？

**RMS:** 遵循标准对于利于用户的程度很重要。我们不将标准视为权威，而是且将其作为可能有用的指南来遵循。因此，我们谈论的是<ruby>遵循<rt>following</rt></ruby>标准而不是“<ruby>遵守<rt>complying</rt></ruby>”。可以参考 <ruby>GNU 编码标准<rt>GNU Coding Standards</rt></ruby>中的 [非 GNU 标准][7] 段落。

我们努力在大多数问题上与标准兼容，因为在大多数的问题上这最有利于用户。但也偶有例外。

例如，POSIX 指定某些实用程序以 512 字节为单位测量磁盘空间。我要求委员会将其改为 1K，但被拒绝了，说是有个<ruby>官僚主义的规则<rt>bureaucratic rule</rt></ruby>强迫选用 512。我不记得有多少人试图争辩说，用户会对这个决定感到满意的。

由于 GNU 在用户的<ruby>自由<rt>freedom</rt></ruby>之后的第二优先级，是用户的<ruby>便利<rt>convenience</rt></ruby>，我们使 GNU 程序以默认 1K 为单位按块测量磁盘空间。

然而，为了防止竞争对手利用这点给 GNU 安上 “<ruby>不合规<rt>noncompliant</rt></ruby>” 的骂名，我们实现了遵循 POSIX 和 ISO C 的可选模式，这种妥协着实可笑。想要遵循 POSIX，只需设置环境变量 `POSIXLY_CORRECT`，即可使程序符合 POSIX 以 512 字节为单位列出磁盘空间。如果有人知道实际使用 `POSIXLY_CORRECT` 或者 GCC 中对应的 `--pedantic` 会为某些用户提供什么实际好处的话，请务必告诉我。

**Seth:** 符合 POSIX 标准的自由软件项目是否更容易移植到其他类 Unix 系统？

**RMS:** 我认为是这样，但自上世纪 80 年代开始，我决定不再把时间浪费在将软件移植到 GNU 以外的系统上。我开始专注于推进 GNU 系统，使其不必使用任何非自由软件。至于将 GNU 程序移植到非类 GNU 系统就留给想在其他系统上运行它们的人们了。

**Seth:** POSIX 对于软件的自由很重要吗？

**RMS:** 本质上说，（遵不遵循 POSIX）其实没有任何区别。但是，POSIX 和 ISO C 的标准化确实使 GNU 系统更容易迁移，这有助于我们更快地实现从非自由软件中解放用户的目标。这个目标于上世纪 90 年代早期达成，当时Linux成为自由软件，同时也填补了 GNU 中内核的空白。

### POSIX 采纳 GNU 的创新

我还问过 Stallman 博士，是否有任何 GNU 特定的创新或惯例后来被采纳为 POSIX 标准。他无法回想起具体的例子，但友好地代我向几位开发者发了邮件。

开发者 Giacomo Catenazzi，James Youngman，Eric Blake，Arnold Robbins 和 Joshua Judson Rosen 对以前的 POSIX 迭代以及仍在进行中的 POSIX 迭代做出了回应。POSIX 是一个 “<ruby>活的<rt>living</rt></ruby>” 标准，因此会不断被行业专业人士更新和评审，许多从事 GNU 项目的开发人员提出了对 GNU 特性的包含。

为了回顾这些有趣的历史，接下来会罗列一些已经融入 POSIX 的流行的 GNU 特性。

#### Make

一些 GNU **Make** 的特性已经被 POSIX 的 `make` 定义所采用。相关的 [规范][8] 提供了从现有实现中借来的特性的详细归因。

#### Diff 和 patch

[diff][9] 和 [patch][10] 命令都直接从这些工具的 GNU 版本中引进了 `-u` 和 `-U` 选项。

#### C 库

POSIX 采用了 GNU C 库 **glibc** 的许多特性。<ruby>血统<rt>Lineage</rt></ruby>一时已难以追溯，但 James Youngman 如是写道：

> “我非常确定 GCC 首创了许多 ISO C 的特性。例如，**_Noreturn** 是 C11 中的新特性，但 GCC-1.35 便具有此功能（使用 `volatile` 作为声明函数的修饰符）。另外尽管我不确定，GCC-1.35 支持的可变长度数组似乎与现代 C 中的（<ruby>柔性数组<rt>conformant array</rt></ruby>）非常相似。”

Giacomo Catenazzi 援引 Open Group 的 [strftime][11] 文章，并指出其归因：“这是基于某版本 GNU libc 的 `strftime()` 的特性。”

Eric Blake 指出，对于 `getline()` 和各种基于语言环境的 `*_l()` 函数，GNU 绝对是这方面的先驱。

Joshua Judson Rosen 补充道，他清楚地记得，在全然不同的操作系统的代码中奇怪地目睹了熟悉的 GNU 式的行为后，对 `getline()` 函数的采用给他留下了深刻的印象。

“等等……那不是 GNU 特有的吗？哦，显然已经不再是了。”

Rosen 向我指出了 [getline 手册页][12] 中写道：

> `getline()` 和 `getdelim()` 最初都是 GNU 扩展。在 POSIX.1-2008 中被标准化。

Eric Blake 向我发送了一份其他扩展的列表，这些扩展可能会在下一个 POSIX 修订版中添加（代号为 Issue 8，大约在 2021 年前后）：

  * [ppoll][13]
  * [pthread_cond_clockwait et al.][14]
  * [posix_spawn_file_actions_addchdir][15]
  * [getlocalename_1][16]
  * [reallocarray][17]

### 关于用户空间的扩展

POSIX 不仅为开发人员定义了函数和特性，还为用户空间定义了标准行为。

#### ls

`-A` 选项会排除来自 `ls` 命令结果中的符号 `.`（代表当前位置）和 `..`（代表上一级目录）。它被 POSIX 2008 采纳。

#### find

`find` 命令是一个<ruby>特别的<rt>ad hoc</rt></ruby> [for 循环][18] 工具，也是 [<ruby>并行<rt>parallel</rt></ruby>][19] 处理的出入口。

一些从 GNU 引入到 POSIX 的<ruby>便捷操作<rt>conveniences</rt></ruby>，包括 `-path` 和 `-perm` 选项。

`-path` 选项帮你过滤与文件系统路径模式匹配的搜索结果，并且从 1996 年（根据 `findutil` 的 Git 仓库中最早的记录）GNU 版本的 `find` 便可使用此选项。James Youngman 指出 [HP-UX][20] 也很早就有这个选项，所以究竟是 GNU 还是 HP-UX 做出的这一创新（抑或两者兼而有之）无法考证。

`-perm` 选项帮你按文件权限过滤搜索结果。这在 1996 年 GNU 版本的 `find` 中便已存在，随后被纳入 POSIX 标准 “IEEE Std 1003.1,2004 Edition” 中。

`xargs` 命令是 `findutils` 软件包的一部分，1996 年的时候就有一个 `-p` 选项会将 `xargs` 置于交互模式（用户将被提示是否继续），随后被纳入 POSIX 标准 “IEEE Std 1003.1, 2004 Edition” 中。

#### Awk

GNU awk（即 `/usr/bin` 目录中的 `gawk` 命令，可能也是符号链接 `awk` 的目标地址）的维护者 Arnold Robbins 说道，`gawk` 和 `mawk`（另一个GPL 的 `awk` 实现）允许 `RS`（记录分隔符）是一个正则表达式，即这时 `RS` 的长度会大于 1。这一特性还不是 POSIX 的特性，但有 [迹象表明它即将会是][21]：

> NUL 在扩展正则表达式中产生的未定义行为允许 GNU `gawk` 程序未来可以扩展以处理二进制数据。
>
> 使用多字符 RS 值的未指定行为是为了未来可能的扩展，它是基于用于记录分隔符（RS）的扩展正则表达式的。目前的历史实现为采用该字符串的第一个字符而忽略其他字符。

这是一个重大的增强，因为 `RS` 符号定义了记录之间的分隔符。可能是逗号、分号、短划线、或者是任何此类字符，但如果它是字符*序列*，则只会使用第一个字符，除非你使用的是 `gawk` 或 `mawk`。想象一下这种情况，使用省略号（连续的三个点）作为解析 IP 地址文档的分隔记录，只是想获取在每个 IP 地址的每个点处解析的结果。

[mawk][22] 首先支持这个功能，但是几年来没有维护者，留下来的火把由 `gawk` 接过。（`mawk` 已然获得了一个新的维护者，可以说是大家薪火传承地将这一特性推向共同的预期值。）

### POSIX 规范

总的来说，Giacomo Catenzzi 指出，“……因为 GNU 的实用程序使用广泛，而且许多其他的选项和行为又对标规范。在 shell 的每次更改中，Bash 都会（作为一等公民）被用作比较。” 当某些东西被纳入 POSIX 规范时，无需提及 GNU 或任何其他影响，你可以简单地认为 POSIX 规范会受到许多方面的影响，GNU 只是其中之一。

共识是 POSIX 存在的意义所在。一群技术人员共同努力为了实现共同规范，再分享给数以百计各异的开发人员，经由他们的赋能，从而实现软件的独立性，以及开发人员和用户的自由。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/what-posix-richard-stallman-explains

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2 (Scissors cutting open access to files)
[2]: https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/
[3]: https://stallman.org/
[4]: https://www.gnu.org/philosophy/free-sw.en.html
[5]: https://www.ieee.org/
[6]: http://gnu.org
[7]: https://www.gnu.org/prep/standards/html_node/Non_002dGNU-Standards.html
[8]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html
[9]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/diff.html
[10]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/patch.html
[11]: https://pubs.opengroup.org/onlinepubs/9699919799/functions/strftime.html
[12]: http://man7.org/linux/man-pages/man3/getline.3.html
[13]: http://austingroupbugs.net/view.php?id=1263
[14]: http://austingroupbugs.net/view.php?id=1216
[15]: http://austingroupbugs.net/view.php?id=1208
[16]: http://austingroupbugs.net/view.php?id=1220
[17]: http://austingroupbugs.net/view.php?id=1218
[18]: https://opensource.com/article/19/6/how-write-loop-bash
[19]: https://opensource.com/article/18/5/gnu-parallel
[20]: https://www.hpe.com/us/en/servers/hp-ux.html
[21]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/awk.html
[22]: https://invisible-island.net/mawk/
