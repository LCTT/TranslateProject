差异文件（diff）和补丁文件（patch）简介
======

> 这篇文章介绍<ruby>差异文件<rt>diff</rt></ruby>和<ruby>补丁文件<rt>patch</rt></ruby>，以及它们如何在开源项目中使用的例子。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

如果你曾有机会在一个使用分布式开发模型的大型代码库上工作过，你就应该听说过类似下面的话，“Sue 刚发过来一个<ruby>补丁<rt>patch</rt></ruby>”，“Rajiv 正在<ruby>签出<rt>checking out</rt></ruby><ruby>差异<rt>diff</rt></ruby>”, 可能这些词（补丁、差异文件）对你而言很陌生，而你确定很想搞懂他们到底指什么。开源软件对上述提到的名词有很大的贡献，作为大型项目从 Apache web 服务器到 Linux 内核的开发模型，“基于补丁文件的开发” 这一模式贯穿了上述项目的始终。实际上，你可能不知道 Apache 的名字就来自“一系列的代码补丁”（LCTT 译注：Apache 英文发音和补丁的英文 patch 相似)，它们被一一收集起来并针对原来的 [NCSA HTTPd server source code][1] 进行了修订。

你可能认为这只不过是些逸闻，但是一份早期的 [Apache 网站的存档中][2] 声称 Apache 的名字就是来自于最早的“补丁”集合；即“<ruby>打了补丁的<rt>APAtCHy</rt></ruby>”服务器，简化为 Apache。
 
好了，言归正传，程序员嘴里说的“差异”和“补丁”到底是什么？

首先，在这篇文章里，我们可以认为这两个术语都指向同一个概念。“diff” 是 ”difference“ 的简写；Unix 下的同名工具程序 `diff`剖析了一个或多个文件之间的“差异”。下面我们会看到 `diff` 的例子:

一个“补丁”指的是文件之间一系列差异，这些差异能被 Unix 的 `diff` 程序应用在源代码树上。我们能使用 `diff` 工具来创建“差异”（或“补丁”），然后使用该工具将它们 “打” 在一个没有这个补丁的同样的源代码版本上。此外，（我又要开始跑题说些历史轶事了……），“补丁” 这个词真的指在计算机的早期使用打卡机的时候，用来覆盖在打孔纸带上来对软件进行修改的覆盖纸，那个时代打孔纸带就是在计算机处理器上运行的程序。下面来自 [维基页面][3] 的这张图真切的描绘了最初的“打补丁”这个词的出处:

![](https://opensource.com/sites/default/files/uploads/360px-harvard_mark_i_program_tape.agr_.jpg)

现在你对补丁和差异就了一个基本的概念，让我们来看看软件开发者是怎么使用这些工具的。如果你还没有使用过类似于 [Git][4] 或 [subversion][5] 这样的源代码版本控制工具的话，我将会一步步展示最流行的软件项目是怎么使用它们的。如果你将一个软件的生命周期看成是一条时间线的话，你就能看见这个软件的点滴变化，比如在何时源代码加上了一个功能，在何时源代码修复了一个功能缺陷。我们称这些改变的点为“<ruby>提交<rt>commit</rt></ruby>”，“提交”这个词被当今最流行的源代码版本管理工具 Git 所使用，当你想检查在一个提交前后的代码变化的话，（或者在许多个提交之间的代码变化），你都可以使用工具来观察文件差异。

如果你同样在使用 Git 开发软件的话，你可以在你的本地开发环境做些希望交给别的开发者的提交，以添加到他们的源代码树中。为了给别的开发者你的提交，一个方法就是创建一个你本地文件的差异文件，然后将这个“补丁”发送给和你工作在同一个源代码树的别的开发者。别的开发者在“打”了你的补丁之后，就能看到在你的代码变树上的变化。

### Linux、Git 和 GitHub

这种分享补丁的开发模型正是现今 Linux 内核社区如何处理内核修改提议而采用的模型。如果你有机会浏览任何一个主流的 Linux 内核邮件列表 —— 主要是 [LKML][6]，也包括 [linux-containers][7]、[fs-devel][8]、[Netdev][9] 等等，你能看到很多开发者会贴出他们想让其他内核开发者审核、测试或者合入 Linux 官方 Git 代码树某个位置的补丁。当然，讨论 Git 不在这篇文章范围之内（Git 是由 Linus Torvalds 开发的源代码控制系统，它支持分布式开发模型以及允许独立于主要代码仓库的补丁包，这些补丁包能被推送或拉取到不同的源代码树上，并遵守这些代码树各自的开发流程。）

在继续我们的话题之前，我们当然不能忽略和补丁和差异这个概念相关的最流行的服务：[GitHub][10]。从它的名字就能猜想出 GitHub 是基于 Git 的，而且它还围绕着 Git 对分布式开源代码开发模型提供了基于 Web 和 API 的工作流管理。（LCTT 译注：即<ruby>拉取请求<rt>Pull Request</rt></ruby>）。在 GitHub 上，分享补丁的方式不是像 Linux 内核社区那样通过邮件列表，而是通过创建一个 **拉取请求** 。当你提交你自己的源代码树的改动时，你能通过创建一个针对软件项目的共享仓库的“拉取请求”来分享你的代码改动（LCTT 译注：即核心开发者维护一个主仓库，开发者去“<ruby>复刻<rt>fork</rt></ruby>”这个仓库，待各自的提交后再创建针对这个主仓库的拉取请求，所有的拉取请求由主仓库的核心开发者批准后才能合入主代码库。）GitHub 被当今很多活跃的开源社区所采用，如 [Kubernetes][11]、[Docker][12]、[容器网络接口 (CNI)][13]、[Istio][14] 等等。在 GitHub 的世界里，用户会倾向于使用基于 Web 页面的方式来审核一个拉取请求里的补丁或差异，你也可以直接访问原始的补丁并在命令行上直接使用它们。

### 该说点干货了

我们前面已经讲了在流行的开源社区里是怎么应用补丁和差异的，现在看看一些例子。

第一个例子包括一个源代码树的两个不同副本，其中一个有代码改动，我们想用 `diff` 来看看这些改动是什么。这个例子里，我们想看的是“<ruby>合并格式<rt>unified</rt></ruby>”的补丁，这是现在软件开发世界里最通用的格式。如果想知道更详细参数的用法以及如何生成差异文件，请参考 `diff` 手册。原始的代码在 `sources-orig` 目录，而改动后的代码在 `sources-fixed` 目录。如果要在你的命令行上用“合并格式”来展示补丁，请运行如下命令。（LCTT 译注：参数 `-N` 代表如果比较的文件不存在，则认为是个空文件， `-a` 代表将所有文件都作为文本文件对待，`-u` 代表使用合并格式并输出上下文，`-r` 代表递归比较目录）


```
$ diff -Naur sources-orig/ sources-fixed/
```

……下面是 `diff` 命令的输出：

```
diff -Naur sources-orig/officespace/interest.go sources-fixed/officespace/interest.go
--- sources-orig/officespace/interest.go        2018-08-10 16:39:11.000000000 -0400
+++ sources-fixed/officespace/interest.go       2018-08-10 16:39:40.000000000 -0400
@@ -11,15 +11,13 @@
   InterestRate float64
 }

+// compute the rounded interest for a transaction
 func computeInterest(acct *Account, t Transaction) float64 {

   interest := t.Amount * t.InterestRate
   roundedInterest := math.Floor(interest*100) / 100.0
   remainingInterest := interest - roundedInterest

-  // a little extra..
-  remainingInterest *= 1000
-
   // Save the remaining interest into an account we control:
   acct.Balance = acct.Balance + remainingInterest
```

最开始几行 `diff` 命令的输出可以这样解释：三个 `---` 显示了原来文件的名字；任何在原文件（LCTT 译注：不是源文件）里存在而在新文件里不存在的行将会用前缀 `-`，用来表示这些行被从源代码里“减去”了。而 `+++` 表示的则相反：在新文件里被加上的行会被放上前缀 `+`，表示这是在新文件里被“加上”的行。补丁文件中的每一个补丁“块”（用 `@@` 作为前缀的的部分）都有上下文的行号，这能帮助补丁工具（或其它处理器）知道在代码的哪里应用这个补丁块。你能看到我们已经修改了“Office Space”这部电影里提到的那个函数（移除了三行并加上了一行代码注释），电影里那个有点贪心的工程师可是偷偷的在计算利息的函数里加了点“料”哦。（LCTT译注：剧情详情请见电影 https://movie.douban.com/subject/1296424/）

如果你想找人来测试你的代码改动，你可以将差异保存到一个补丁里：

```
$ diff -Naur sources-orig/ sources-fixed/ >myfixes.patch
```

现在你有补丁 `myfixes.patch` 了，你能把它分享给别的开发者，他们可以将这个补丁打在他们自己的源代码树上从而得到和你一样的代码并测试他们。如果一个开发者的当前工作目录就是他的源代码树的根的话，他可以用下面的命令来打补丁：

```
$ patch -p1 < ../myfixes.patch
patching file officespace/interest.go
```

现在这个开发者的源代码树已经打好补丁并准备好构建和测试文件的修改了。那么如果这个开发者在打补丁之前已经改动过了怎么办？只要这些改动没有直接冲突（LCTT 译注：比如改在同一行上），补丁工具就能自动的合并代码的改动。例如下面的interest.go 文件，它有其它几处改动，然后它想打上 `myfixes.patch` 这个补丁：

```
$ patch -p1 < ../myfixes.patch
patching file officespace/interest.go
Hunk #1 succeeded at 26 (offset 15 lines).
```

在这个例子中，补丁警告说代码改动并不在文件原来的地方而是偏移了 15 行。如果你文件改动的很厉害，补丁可能干脆说找不到要应用的地方，还好补丁程序提供了提供了打开“模糊”匹配的选项（这个选项在文档里有预置的警告信息，对其讲解已经超出了本文的范围）。

如果你使用 Git 或者 GitHub 的话，你可能不会直接使用补丁或差异。Git 已经内置了这些功能，你能使用这些功能和共享一个源代码树的其他开发者交互，拉取或合并代码。Git 一个比较相近的功能是可以使用 `git diff` 来对你的本地代码树生成全局差异，又或者对你的任意两次”引用“（可能是一个代表提交的数字，或一个标记或分支的名字，等等）做全局补丁。你甚至能简单的用管道将 `git diff` 的输出到一个文件里（这个文件必须严格符合将要被使用它的程序的输入要求），然后将这个文件交给一个并不使用 Git 的开发者应用到他的代码上。当然，GitHub 把这些功能放到了 Web 上，你能直接在 Web 页面上查看一个拉取请求的文件变动。在 Web 上你能看到所展示的合并差异，GitHub 还允许你将这些代码改动下载为原始的补丁文件。

### 总结

好了，你已经学到了”差异“和”补丁“是什么，以及在 Unix/Linux 上怎么使用命令行工具和它们交互。除非你还在像 Linux 内核开发这样的项目中工作而使用完全基于补丁文件的开发方式，你应该会主要通过你的源代码控制系统（如 Git）来使用补丁。但熟悉像 GitHub 这样的高级别工具的技术背景和技术底层对你的工作也是大有裨益的。谁知道会不会有一天你需要和一个来自 Linux 世界邮件列表的补丁包打交道呢？


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/diffs-patches

作者：[Phil Estes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[David Chen](https://github.com/DavidChenLiang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/estesp
[1]:https://github.com/TooDumbForAName/ncsa-httpd
[2]:https://web.archive.org/web/19970615081902/http:/www.apache.org/info.html
[3]:https://en.wikipedia.org/wiki/Patch_(computing)
[4]:https://git-scm.com/
[5]:https://subversion.apache.org/
[6]:https://lkml.org/
[7]:https://lists.linuxfoundation.org/pipermail/containers/
[8]:https://patchwork.kernel.org/project/linux-fsdevel/list/
[9]:https://www.spinics.net/lists/netdev/
[10]:https://github.com/
[11]:https://kubernetes.io/
[12]:https://www.docker.com/
[13]:https://github.com/containernetworking/cni
[14]:https://istio.io/
