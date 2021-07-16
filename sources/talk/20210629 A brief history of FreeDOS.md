[#]: subject: (A brief history of FreeDOS)
[#]: via: (https://opensource.com/article/21/6/history-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (zxy-wyx)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

FreeDOS 简史
======
经历了近30年的发展, FreeDOS 已经成为了世界先进的 DOS。
![第一批使用计算机的人][1]

一个老师正在给他的一个学生讲[编程之道][2]。 “编程之道包含在所有的软件中--不管它多么微不足道，” 老师说道。

“编程之道在手提电脑里面吗?” 学生问道。

“是的,” 老师回答道。

“编程之道在电脑游戏里面吗?”学生继续问道

“他甚至在电脑游戏里面," 老师说。

“那编程之道在个人电脑的操作系统里面吗?”

老师咳嗽了一下，稍稍改变了姿势，说道，“今天的课结束了。” 

编程之道, Geoffrey James, 信息类书籍, 1987

过去，计算仅限于昂贵的大型机和“超大型计算机”计算机系统，如PDP 11。但是微处理器的出现在20世纪70年代带来了一场计算机革命。 你终于可以在家里有一台电脑了——“个人电脑浪潮”已经到了！

我记得看到的最早的个人电脑包括 Commodore, TRS-80, 和 Apple。 个人电脑成了一个热门话题，所以 IBM 决定进入这个市场。 在经历了一个快速的开发周期之后，IBM 于 1981 年 8 月发布了 IBM 5150 个人计算机(最初的“IBM PC”)。

从零开始创建一台计算机并非易事，因此 IBM 用现成的硬件来构建 PC 而闻名，并从外部开发人员那里获得了其他组件的许可。 其中之一是微软授权的操作系统。反过来，微软从西雅图电脑产品公司获得了 86-DOS ，进行了各种更新，并在 IBM PC 上推出了新版本的 IBM PC-DOS。

###早期的 DOS

早期的 DOS 在内存中运行最多为640千字节, DOS 只能管理硬件，允许用户启动应用程序。因此，PC-DOS 1.0 命令行非常贫乏，只包含了一些设置日期和时间、管理文件、控制终端和格式化软盘的命令。DoS还包括一个基本的语言解释器，这是这个时代所有个人计算机的一个基本功能。

直到 PC-DOS 2.0，DOS 才变得更加有趣，在命令行中添加了新的命令，并包含了其他有用的工具。但对我来说，直到1991 年 MS-DOS 5.0 才开始感觉到先进。微软在这个版本中对 DOS 进行了全面改革，更新了许多命令，并用一个新的全屏编辑器取代了老旧的 Edlin 编辑器，这个编辑器对用户更加友好。 DoS 5还包括我喜欢的其他特性，比如基于 Microsoft QuickBASIC Compiler, 简称 QBASIC. 如果你曾经在DOS上玩过 the Gorillas游戏, 可能是在 MS-DOS 5.0中运行。

尽管进行了这些升级，但我对 DOS 命令行并不完全满意。DOS 从来没有偏离原来的设计，改变有限。DOS为用户提供了一些工具，可以从命令行执行一些事情--否则，你就应该使用DOS命令行来启动应用程序。微软认为用户大部分时间都会花在几个关键的应用程序上，比如文字处理器或电子表格。

但是开发人员想要一个功能更强的 DOS，此时一个子行业正在萌芽，以提供整洁的工具和程序。有些是全屏应用程序，但也有许多是增强DOS命令环境的命令行实用程序. 当我学到一点C编程时，我开始编写自己的实用程序，扩展或替换DOS命令行。尽管MS-DOS的基础相当有限，但我发现第三方实用程序加上我自己的工具创建了一个功能强大的DOS命令行。

### FreeDOS

1994 年初，我开始在科技杂志上看到很多微软高管的采访，他们说下一个版本的 Windows 将完全取代DOS。 我以前使用过 Windows，但如果你还记得那个时代，你就知道 Windows3.1 不是一个很好的平台。 Windows 3.1 是笨重的和漏洞百出的——如果一个应用程序崩溃，它可能会摧毁整个 Windows 系统。我也不喜欢 Windows 的图形用户界面。我更喜欢在命令行做我的工作，而不是用鼠标。

我考虑了 Windows，并决定，“如果 Windows3.2 或 Windows4.0 将类似于 Windows3.1，我我将不会去使用它。” 但我有什么选择？此时，我已经对 Linux 进行了实验，并认为 [linux很棒][3]—但是 Linux 没有任何应用程序。我的文字处理器、电子表格和其他程序都在 DOS 上。我需要 DOS。

然后我有了个主意！我想，“如果开发人员能够在互联网上共同编写一个完整的 Unix 操作系统，那么我们当然可以在 DOS 中做同样的事情。”毕竟，与 Unix 相比，DOS 是一个相当简单的操作系统。DOS 一次运行一个任务(单任务)，并且有一个更简单的内存模型。写我们自己的 DOS 应该不难。

因此，在1994年6月29日，我在一个名为Usenet的留言板网络上向‘comp.os.msdos.apps’[发布了一个公告][4] 。

PD-DOS项目宣布：

几个月前，我发表了关于启动 DOS 公共领域版本的文章。 The general support for this at the time was strong, and many people agreed with the statement, "start writing!" So, I have...

Announcing the first effort to produce a PD-DOS. I have written up a "manifest" describing the goals of such a project and an outline of the work, as well as a "task list" that shows exactly what needs to be written. I'll post those here, and let discussion follow.

_* A note about the name—I wanted this new DOS to be something that everyone could use, and I naively assumed that when everyone could use it, it was "public domain." I quickly realized the difference, and we renamed "PD-DOS" to "Free-DOS"—and later dropped the hyphen to become "FreeDOS."_

A few developers reached out to me, to offer utilities they had created to replace or enhance the DOS command line, similar to my own efforts. We pooled our utilities and created a useful system that we released as "Alpha 1" in September 1994, just a few months after announcing the project. Development was pretty swift in those days, and we followed up with "Alpha 2" in December 1994, "Alpha 3" in January 1995, and "Alpha 4" in June 1995.

### A modern DOS

Since then, we've always focused on making FreeDOS a "modern" DOS. And much of that modernization is centered on creating a rich command-line environment. Yes, DOS still needs to support applications, but we believe FreeDOS needs a strong command-line environment, as well. That's why FreeDOS includes dozens of useful tools, including commands to navigate directories, manage files, play music, connect to networks, ... and a collection of Unix-like utilities such as `less`, `du`, `head`, `tail`, `sed`, and `tr`.

While FreeDOS development has slowed, it has not stopped. Developers continue to write new programs for FreeDOS, and add new features to FreeDOS. I'm particularly excited about several great additions to FreeDOS 1.3 RC4, the latest release candidate for the forthcoming FreeDOS 1.3. A few recent updates:

  * Mateusz Viste created a new ebook reader called Ancient Machine Book (AMB) that we've leveraged as the new help system in FreeDOS 1.3 RC4
  * Rask Ingemann Lambertsen, Andrew Jenner, TK Chia, and others are updating the IA-16 version of GCC, including a new _libi86_ library that provides some degree of compatibility with the Borland Turbo C++ compiler's C library
  * Jason Hood has updated an unloadable CD-ROM redirector substitute for Microsoft's MSCDEX, supporting up to 10 drives
  * SuperIlu has created DOjS, a Javascript development canvas with an integrated editor, graphics and sound output, and mouse, keyboard, and joystick input
  * Japheth has created a DOS32PAE extender that is able to use huge amounts of memory through PAE paging



Despite all of the new development on FreeDOS, we remain true to our DOS roots. As we continue working toward FreeDOS 1.3 "final," we carry several core assumptions, including:

  * **Compatibility is key**—FreeDOS isn't really "DOS" if it can't run classic DOS applications. While we provide many great open source tools, applications, and games, you can run your legacy DOS applications, too.
  * **Continue to run on old PCs (XT, '286, '386, etc)**—FreeDOS 1.3 will remain 16-bit Intel but will support new hardware with expanded driver support, where possible. For this reason, we continue to focus on a single-user command-line environment.
  * **FreeDOS is open source software**—I've always said that FreeDOS isn't a "free DOS" if people can't access, study, and modify the source code. FreeDOS 1.3 will include software that uses recognized open source licenses as much as possible. But DOS actually pre-dates the GNU General Public License (1989) and the Open Source Definition (1998) so some DOS software might use its own "free with source code" license that isn't a standard "open source" license. As we consider packages to include in FreeDOS, we continue to evaluate any licenses to ensure they are suitably "open source," even if they are not officially recognized.



We welcome your help in making FreeDOS great! Please join us on our email list—we welcome all newcomers and contributors. We communicate over an email list, but the list is fairly low volume so is unlikely to fill up your Inbox.

Visit the FreeDOS website at [www.freedos.org][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/history-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[zxy-wyx](https://github.com/zxy-wyx)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://www.mit.edu/~xela/tao.html
[3]: https://opensource.com/article/17/5/how-i-got-started-linux-jim-hall-freedos
[4]: https://groups.google.com/g/comp.os.msdos.apps/c/oQmT4ETcSzU/m/O1HR8PE2u-EJ
[5]: https://www.freedos.org/
