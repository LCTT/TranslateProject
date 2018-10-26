
顶级 Linux 开发者推荐的编程书籍
======

毫无疑问，Linux 是由那些拥有深厚计算机知识背景而且才华横溢的程序员发明的。让那些大名鼎鼎的 Linux 程序员向今日的开发者分享一些曾经带领他们登堂入室的好书和技术参考吧，你会不会也读过其中几本呢？

Linux，毫无争议的属于21世纪的操作系统。虽然Linus Torvalds 在建立开源社区这件事上做了很多工作和社区决策，不过那些网络专家和开发者愿意接受Linux的原因还是因为它卓越的代码质量和高可用性。Torvalds 是个编程天才，同时必须承认他还是得到了很多其他同样极具才华的开发者的无私帮助。

就此我咨询了Torvalds 和其他一些顶级Linux开发者，有哪些书籍帮助他们走上了成为顶级开发者的道路，下面请听我一一道来。

### 熠熠生辉的 C语言

Linux 是在大约90年代开发出来的，与它一起问世的还有其他一些完成基础功能的开源软件。与此相应，那时的开发者使用的工具和语言反映了那个时代的印记。可能[C 语言不再流行了][1]，可对于很多已经建功立业的开发者来说，C 语言是他们的第一个实际开发中使用的语言，这一点也在他们推选的对他们有着深远影响的书单中反映出来。

Torvalds 说，“你不应该再选用我那个时代使用的语言或者开发方式”，他的开发道路始于BASIC，然后转向机器码（“甚至都不是汇编语言，而是真真正正的’二进制‘机器码”，他解释道），再然后转向汇编语言和 C 语言。

“任何人都不应该再从这些语言开始进入开发这条路了”，他补充道。“这些语言中的一些今天已经没有什么意义（如 BASIC 和机器语言）。尽管 C 还是一个主流语言，我也不推荐你从它开始你的开发工作”。

并不是他不喜欢 C。不管怎样，Linux 是用[<ruby>C语言<rt>GNU C</rt></ruby>][2]写就的。“我始终认为 C 是一个伟大的语言，它有着非常简单的语法，对于很多方向的开发都很合适，但是我怀疑你会挫折重重，从你的第一个'Hello World'程序开始到你真正能开发出能用的东西当中有很大一步要走”。他认为，如果用现在的标准，如果作为现在的入门语言的话，从 C语言开始的代价太大。

在他那个时代，Torvalds 的唯一选择的书就只能是Brian W. Kernighan 和Dennis M. Ritchie 合著的[<ruby>C 编程语言<rt>C Programming Language, 2nd Edition</rt></ruby>][3]，在编程圈内也被尊称为K&R。“这本书简单精炼，但是你要先有编程的背景才能欣赏它”。Torvalds 说到。

Torvalds 并不是唯一一个推荐K&R 的开源开发者。以下几位也同样引用了这本他们认为值得推荐的书籍，他们有：Linux 和 Oracle 虚拟化开发副总裁，Wim Coekaerts；Linux 开发者Alan Cox; Google 云 CTO Brian Stevens; Canonical 技术运营部副总裁Pete Graner。


如果你今日还想同 C 语言较量一番的话，Jeremy Allison，Samba 的共同发起人，推荐[<ruby>21世纪的 C 语言<rt>21st Century C: C Tips from the New School</rt></ruby>][4]。他还建议，同时也去阅读一本比较旧但是写的更详细的[<ruby>C专家编程<rt>Expert C Programming: Deep C Secrets</rt></ruby>][5]和有着20年历史的[<ruby>UNIX POSIX多线程编程<rt>Programming with POSIX Threads</rt></ruby>][6]。


### 如果不选C 语言， 那选什么？

 Linux 开发者推荐的书籍自然都是他们认为适合今时今日的开发项目的语言工具。这也折射了开发者自身的个人偏好。例如, Allison认为年轻的开发者应该在[<ruby>Go 编程语言<rt>The Go Programming Language </rt></ruby>][7]和[<ruby>Rust 编程<rt>Rust with Programming Rust</rt></ruby>][8]的帮助下去学习 Go 语言和 Rust 语言。


但是超越编程语言来考虑问题也不无道理（尽管这些书传授了你编程技巧）。今日要做些有意义的开发工作的话，"要从那些已经完成了99%显而易见工作的框架开始，然后你就能围绕着它开始写脚本了"， Torvalds 推荐了这种做法。


“坦率来说，语言本身远远没有围绕着它的基础架构重要”，他继续道，“可能你会从 Java 或者Kotlin 开始,但那是因为你想为自己的手机开发一个应用，因此安卓 SDK 成为了最佳的选择，又或者，你对游戏开发感兴趣，你选择了一个游戏开发引擎来开始，而通常它们有着自己的脚本语言”。


这里提及的基础架构包括那些和操作系统本身相关的编程书籍。
Garner 在读完了大名鼎鼎的 K&R后又拜读了W. Richard Steven 的[<ruby>Unix 网络编程<rt>Unix: Network Programming</rt></ruby>][10]。特别的是，Steven 的[<ruby>TCP/IP详解，卷1：协议<rt>TCP/IP Illustrated, Volume 1: The Protocols</rt></ruby>][11]在出版了30年之后仍然被认为是必读的。因为 Linux 开发很大程度上和[和网络基础架构有关][12]，Garner 也推荐了很多 O’Reilly 的书，包括[Sendmail][13],[Bash][14],[DNS][15],以及[IMAP/POP][16]。

Coekaerts也是Maurice Bach的[<ruby>UNIX操作系统设计<rt>The Design of the Unix Operation System</rt></ruby>][17]的书迷之一。James Bottomley 也是这本书的推崇者，作为一个 Linux 内核开发者，当 Linux 刚刚问世时James就用Bach 的这本书所传授的知识将它研究了个底朝天。

### 软件设计知识永不过时

尽管这样说有点太局限在技术领域。Stevens 还是说到，“所有的开发者都应该在开始钻研语法前先研究如何设计，[<ruby>日常物品的设计<rt>The Design of Everyday Things</rt></ruby>][18]是我的最爱”。

Coekaerts 喜欢Kernighan 和 Rob Pike合著的[<ruby>程序设计实践<rt>The Practic of Programming</rt></ruby>][19]。这本关于设计实践的书当 Coekaerts 还在学校念书的时候还未出版，他说道,“但是我把它推荐给每一个人”。


不管何时，当你问一个长期认真对待开发工作的开发者他最喜欢的计算机书籍时，你迟早会听到一个名字和一本书:
Donald Knuth和他所著的[<ruby>计算机程序设计艺术(1-4A)<rt>The Art of Computer Programming, Volumes 1-4A</rt></ruby>][20]。Dirk Hohndel,VMware 首席开源官，认为这本书尽管有永恒的价值，但他也承认，“今时今日并非及其有用”。（译注：不代表译者观点）


### 读代码。大量的读。

编程书籍能教会你很多，也请别错过另外一个在开源社区特有的学习机会：[<ruby>如何阅读代码<rt>Code Reading: The Open Source Perspective</rt></ruby>][21]。那里有不可计数的代码例子阐述如何解决编程问题（以及如何让你陷入麻烦...）。Stevens 说，谈到磨炼编程技巧，在他的书单里排名第一的“书”是 Unix 的源代码。

"也请不要忽略从他人身上学习的各种机会。", Cox道，“我是在一个计算机俱乐部里和其他人一起学的 BASIC，在我看来，这仍然是一个学习的最好办法”，他从[<ruby>精通 ZX81机器码<rt>Mastering machine code on your ZX81</rt></ruby>][22]这本书和 Honeywell L66 B 编译器手册里学习到了如何编写机器码，但是学习技术这点来说，单纯阅读和与其他开发者在工作中共同学习仍然有着很大的不同。


Cox 说,“我始终认为最好的学习方法是和一群人一起试图去解决你们共同关心的一些问题并从中找到快乐，这和你是5岁还是55岁无关”。


最让我吃惊的是这些顶级 Linux 开发者都是在非常底层级别开始他们的开发之旅的，甚至不是从汇编语言或 C 语言，而是从机器码开始开发。毫无疑问，这对帮助开发者理解计算机在非常微观的底层级别是怎么工作的起了非常大的作用。


那么现在你准备好尝试一下硬核 Linux 开发了吗？Greg Kroah-Hartman,这位 Linux 内核过期分支的维护者，推荐了Steve Oualline 的[<ruby>实用 C 语言编程<rt>Practical C Programming</rt></ruby>][23]和Samuel harbison 以及Guy Steels 合著的[<ruby>C语言参考手册<rt>C: A Reference Manual</rt></ruby>][24]。接下来请阅读“[<ruby>如何进行 Linux 内核开发<rt>HOWTO do Linux kernel development</rt></ruby>][25]”,到这时，就像Kroah-Hartman所说，你已经准备好启程了。

于此同时，还请你刻苦学习并大量编码，最后祝你在跟随顶级 Linux 开发者脚步的道路上好运相随。


--------------------------------------------------------------------------------

via: https://www.hpe.com/us/en/insights/articles/top-linux-developers-recommended-programming-books-1808.html

作者：[Steven Vaughan-Nichols][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：DavidChenLiang(https://github.com/DavidChenLiang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.hpe.com/us/en/insights/contributors/steven-j-vaughan-nichols.html
[1]:https://www.codingdojo.com/blog/7-most-in-demand-programming-languages-of-2018/
[2]:https://www.gnu.org/software/gnu-c-manual/
[3]:https://amzn.to/2nhyjEO
[4]:https://amzn.to/2vsL8k9
[5]:https://amzn.to/2KBbWn9
[6]:https://amzn.to/2M0rfeR
[7]:https://amzn.to/2nhyrnMe
[8]:http://shop.oreilly.com/product/0636920040385.do
[9]:https://www.hpe.com/us/en/resources/storage/containers-for-dummies.html?jumpid=in_510384402_linuxbooks_containerebook0818
[10]:https://amzn.to/2MfpbyC
[11]:https://amzn.to/2MpgrTn
[12]:https://www.hpe.com/us/en/insights/articles/how-to-see-whats-going-on-with-your-linux-system-right-now-1807.html
[13]:http://shop.oreilly.com/product/9780596510299.do
[14]:http://shop.oreilly.com/product/9780596009656.do
[15]:http://shop.oreilly.com/product/9780596100575.do
[16]:http://shop.oreilly.com/product/9780596000127.do
[17]:https://amzn.to/2vsCJgF
[18]:https://amzn.to/2APzt3Z
[19]:https://www.amazon.com/Practice-Programming-Addison-Wesley-Professional-Computing/dp/020161586X/ref=as_li_ss_tl?ie=UTF8&linkCode=sl1&tag=thegroovycorpora&linkId=e6bbdb1ca2182487069bf9089fc8107e&language=en_US
[20]:https://amzn.to/2OknFsJ
[21]:https://amzn.to/2M4VVL3
[22]:https://amzn.to/2OjccJA
[23]:http://shop.oreilly.com/product/9781565923065.do
[24]:https://amzn.to/2OjzgrT
[25]:https://www.kernel.org/doc/html/v4.16/process/howto.html
