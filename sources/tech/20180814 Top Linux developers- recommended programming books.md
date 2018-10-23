Translateing By DavidChenLiang
Top Linux developers' recommended programming books
======

顶级 Linux 开发者推荐编程书籍
======

毫无疑问，Linux 是由哪些拥有强大计算机知识背景的天才程序员发明的。让那些大名鼎鼎的 Linux 程序员和今日的开发者分享一些让他们一窥门径的好书和技术参考吧，你读过其中几本呢？

Without question, Linux was created by brilliant programmers who employed good computer science knowledge. Let the Linux programmers whose names you know share the books that got them started and the technology references they recommend for today's developers. How many of them have you read?

Linux 极具争议的21世纪的操作系统。当Linux Torvalds 在建立开源社区这件事上做了很多工作和社区决策，哪些网络专家和开发者愿意接受Linux的原因还是因为它的卓越的代码质量和高可用性。
尽管Torvalds 是个编程天才，他还是得到了很多其他同样极具才华的开发者的无私帮助。

Linux is, arguably, the operating system of the 21st century. While Linus Torvalds made a lot of good business and community decisions in building the open source community, the primary reason networking professionals and developers adopted Linux is the quality of its code and its usefulness. While Torvalds is a programming genius, he has been assisted by many other brilliant developers.

就此我咨询了Torvalds 和其他一些顶级Linux开发者，哪些书籍帮助他们走上了成为顶级开发者的道路，下面就是他们告诉我的。

I asked Torvalds and other top Linux developers which books helped them on their road to programming excellence. This is what they told me.

### By shining C
### 熠熠发光的 C

Linux 在大约90年代被开发出来，与它一起开发出来的还有其他一些基础的开源软件。作为结果，那时的开发者使用的工具和语言反映了那个时代的印记。当[C 语言不再流行了][1]，对于很多已经建功立业的开发者来说，C 语言是他们的第一个实际开发中用的语言，这一点也在他们推选的对他们有着深远影响的书单中反映出来。

Linux was developed in the 1990s, as were other fundamental open source applications. As a result, the tools and languages the developers used reflected the times, which meant a lot of C programming language. While [C is no longer as popular][1], for many established developers it was their first serious language, which is reflected in their choice of influential books.

Torvalds 说，“你不应该再选用我那个时代使用的语言或者开发方式”，他的开发道路始于BASIC，然后转向机器码（“甚至都不是汇编语言，而是真真正正的’二进制‘机器码”，他解释道），再然后转向汇编语言和 C 语言。

“You shouldn't start programming with the languages I started with or the way I did,” says Torvalds. He started with BASIC, moved on to machine code (“not even assembly language, actual ‘just numbers’ machine code,” he explains), then assembly language and C.

“任何人都不应该再从这些语言开始进入开发这条路了”，他补充道。“学习他们今天已经没有什么意义（如 BASIC 和机器语言）。尽管 C 还是一个主流语言，我也不推荐你从它开始你的开发工作”。

“None of those languages are what anybody should begin with anymore,” Torvalds says. “Some of them make no sense at all today (BASIC and machine code). And while C is still a major language, I don't think you should begin with it.”

并不是他不喜欢 C。不管怎样，Linux 是用[GNU C][2]写就的。“我始终认为 C 是一个伟大的语言，它有着非常简单的语法，对于很多方向的开发都很合适，但是我怀疑你会挫折重重，从你的第一个'Hello World'程序开始到你真正能开发出能用的东西当中有很大一步要走”。他认为，如果用现在的标准，如果作为现在的入门语言的话，从 C语言开始的代价太大。

It's not that he dislikes C. After all, Linux is written in [GNU C][2]. "I still think C is a great language with a pretty simple syntax and is very good for many things,” he says. But the effort to get started with it is much too high for it to be a good beginner language by today's standards. “I suspect you'd just get frustrated. Going from your first ‘Hello World’ program to something you might actually use is just too big of a step."

在他那个时代，Torvalds 的唯一选择的书就只能是Brian W. Kernighan 和Dennis M. Ritchie 合著的[C 编程语言][3]，在编程圈内也被尊称为K&R。“这本书简单精炼，但是你要先有编程的背景才能欣赏它”。Torvalds 说到。

From that era, the only programming book that stood out for Torvalds is Brian W. Kernighan and Dennis M. Ritchie's [C Programming Language][3], known in serious programming circles as K&R. “It was small, clear, concise,” he explains. “But you need to already have a programming background to appreciate it."

Torvalds 并不是唯一一个推荐K&R 的开源开发者。其他几位也同样推荐他们认为值得推荐的版本，他们有：Linux 和 Oracle 虚拟化开发的副总裁，Wim Coekaerts；Linux 开发者Alan Cox;Goodle 云 CTOBrian Stevens;Canonical 技术运营部副总裁Pete Graner。

Torvalds is not the only open source developer to recommend K&R. Several others cite their well-thumbed copies as influential references, among them Wim Coekaerts, senior vice president for Linux and virtualization development at Oracle; Linux developer Alan Cox; Google Cloud CTO Brian Stevens; and Pete Graner, Canonical's vice president of technical operations.

如果你今日还想同 C 语言较量较量的话，Jeremy Allison，Samba 的共同发起人，推荐[21世纪的 C 语言][4]。他还建议，同时也阅读一本比较旧但是写的更详细的[C专家编程][5]和有着20年历史的[POSIX多线程编程][6]。

If you want to tackle C today, Jeremy Allison, co-founder of Samba, recommends [21st Century C][4]. Then, Allison suggests, follow it up with the older but still thorough [Expert C Programming][5] as well as the 20-year-old [Programming with POSIX Threads][6].

### If not C, what?
### 如果不选C 语言， 那选什么？

 Linux 开发者推荐的书籍都是他们认为今时今日的开发项目合适的语言工具。这也折射了开发者自身的个人偏好。例如, Allison认为年轻的开发者应该去学习 Go 语言,在[][7]的帮助下，以及[][8]。

Linux developers’ recommendations for current programming books naturally are an offshoot of the tools and languages they think are most suitable for today’s development projects. They also reflect the developers’ personal preferences. For example, Allison thinks young developers would be well served by learning Go with the help of [The Go Programming Language][7] and Rust with [Programming Rust][8].

在编程语言之上来考虑问题也不无道理（尽管这些书传授了你技巧）。今日要做些有意义的开发工作的话，"要从那些已经完成了99%显而易见工作的框架开始，然后你就能围绕着它开始写脚本了"， Torvalds 推荐了这种做法。

But it may make sense to think beyond programming languages (and thus books to teach you their techniques). To do something meaningful today, “start from some environment with a toolkit that does 99 percent of the obscure details for you, so that you can script things around it," Torvalds recommends.

“坦率来说，语言本身远远没有围绕着它的基础架构重要”，他继续道，“可能你会从 Java 或者Kotlin 开始,但是因为你想为自己的手机开发一个应用因此安卓 SDK 成为了最佳的选择，又或者，你对游戏开发感兴趣，它们通常有着他们自己的脚本语言”

"Honestly, the language itself isn't nearly as important as the infrastructure around it,” he continues. “Maybe you'd start with Java or Kotlin—not because of those languages per se, but because you want to write an app for your phone and the Android SDK ends up making those better choices. Or, maybe you're interested in games, so you start with one of the game engines, which often have some scripting language of their own."

这里提及的基础架构包括和操作系统本身相关的编程书籍。
Garner 就是一边读W. Richard Steven 的[Unix 网络编程][10]一边读大名鼎鼎的 K&R。特别的是，Steven 的[TCP/IP详解，卷1：协议][11]在出版了30年之后仍然被认为是必读的。因为 Linux 开发很大程度上和[和网络基础架构有关][12]，Garner 也推荐了很多 O’Reilly 的书，包括[Sendmail][13],[Bash][14],[DNS][15],以及[IMAP/POP][16]。

That infrastructure includes programming books specific to the operating system itself. Graner followed K&R by reading W. Richard Stevens' [Unix Network Programming][10] books. In particular, Stevens' [TCP/IP Illustrated, Volume 1: The Protocols][11] is considered still relevant even though it's almost 30 years old. Because Linux development is largely [relevant to networking infrastructure][12], Graner also recommends the many O’Reilly books on [Sendmail][13], [Bash][14], [DNS][15], and [IMAP/POP][16].

Coekaerts也是Maurice Bach的[The Design of the Unix Operation System][17]的书迷之一。James Bottomley 也一样是这本书的推崇者，作为一个 Linux 内核开发者，当 Linux 刚刚问世时James就用Bach 的这本书所传授的知识将它研究了个底朝天。

Coekaerts is also fond of Maurice Bach's [The Design of the Unix Operating System][17]. So is James Bottomley, a Linux kernel developer who used Bach's tome to pull apart Linux when the OS was new.

### Design knowledge never goes stale
### 软件设计知识永不过时

尽管这样说有点太局限在技术领域。Stevens 还是说到，“所有的开发者都应该在开始钻研语法前先研究如何设计，[The Design of Everyday Things][18]是我的最爱”。

But even that may be too tech-specific. "All developers should start with design before syntax,” says Stevens. “[The Design of Everyday Things][18] is one of my favorites.”

Coekaerts 喜欢Kernighan 和 Rob Pike合著的[The Practic of Programming][19]。这本关于设计实践的书当 Coekaerts 还在学校念书的时候还未出版，他说道,“但是我把它推荐给每一个人”。

Coekaerts likes Kernighan and Rob Pike's [The Practice of Programming][19]. The design-practice book wasn't around when Coekaerts was in school, “but I recommend it to everyone to read," he says.

不管何时，当你问一个长期认真对待开发工作的开发者他最喜欢的计算机书籍时，你迟早会听到一个名字和一本书:
Donald Knuth和他所著的[计算机编程的艺术][20]。Dirk Hohndel,VMware 的首席开源官，认为这本书尽管有永恒的价值，但他也承认，“今时今日并非及其有用”。（译注：不代表译者观点）

Whenever you ask serious long-term developers about their favorite books, sooner or later someone's going to mention Donald Knuth’s [The Art of Computer Programming][20]. Dirk Hohndel, VMware's chief open source officer, considers it timeless though, admittedly, “not necessarily super-useful today."

### Read code. Lots of code
### 读代码。大量的读。

编程书籍能教会你很多，也请别错过另外一个在开源社区特有的学习机会：[reading the code][21]。那里有不可计数的代码例子阐述如果解决编程问题（以及如何让你陷入麻烦）。Stevens 说，谈到磨炼编程技巧，在他的书单里排名第一的“书”是 Unix 的源代码。

While programming books can teach you a lot, don’t miss another opportunity that is unique to the open source community: [reading the code][21]. There are untold megabytes of examples of how to solve a given programming problem—and how you can get in trouble, too. Stevens says his No. 1 “book” for honing programming skills is having access to the Unix source code.

[Mastering Machine Code on Your ZX81][22]和Honeywell L66 B编译器手册，但是和其他开发者一起工作就有很大不同。

也请不要忽略从他人身上学习的各种机会。Cox道，“我是在一个计算机俱乐部里和其他人一起学的 BASIC，在我看来，这仍然是一个学习东西的好办法”，他从[][22]这本书和 Honeywell L66 B 编译器手册里学习到了如何编写机器码，但是和其他开发者一起工作仍然有着很大的不同。

Don’t overlook the opportunity to learn in person, too. “I learned BASIC by being in a computer club with other people all learning together,” says Cox. “In my opinion, that is still by far the best way to learn." He learned machine code from [Mastering Machine Code on Your ZX81][22] and the Honeywell L66 B compiler manuals, but working with other developers made a big difference.

Cox 说,“我始终认为学习最好的方法是和一群人在一起试图去解决你们共同关心的一些问题并从中找到快乐，这和你是5岁还是55岁无关”。

“I still think the way to learn best remains to be with a group of people having fun and trying to solve a problem you care about together,” says Cox. “It doesn't matter if you are 5 or 55."

最让我吃惊的是这些顶级 Linux 开发者都是在多么底层级别开始他们的开发之旅的，甚至不是从汇编语言或 C 语言，而是从机器码开始开发。毫无疑问，这对帮助开发者理解计算机在非常微观的底层级别是怎么工作的起了非常大的作用。

What struck me the most about these recommendations is how often the top Linux developers started at a low level—not just C or assembly language but machine language. Obviously, it’s been very useful in helping developers understand how computing works at a very basic level.

准备好尝试一下硬核 Linux 开发了吗？Greg Kroah-Hartman,这位 Linux 内核过期分支的维护者，推荐了Steve Oualline 的[][23]和Samuel harbison 以及Guy Steels 合著的[][24]。接下来请阅读“[][25]”,到这时，就像Kroah-Hartman所说，你已经准备好启程了。

So, ready to give hard-core Linux development a try? Greg Kroah-Hartman, the Linux stable branch kernel maintainer, recommends Steve Oualline's [Practical C Programming][23] and Samuel Harbison and Guy Steele's [C: A Reference Manual][24]. Next, read "[HOWTO do Linux kernel development][25]." Then, says Kroah-Hartman, you'll be ready to start.

于此同时，还请你刻苦学习并大量编程，最后祝你在跟随顶级 Linux 程序员的道路上好运相随。

In the meantime, study hard, program lots, and best of luck to you in following the footsteps of Linux's top programmers.

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
