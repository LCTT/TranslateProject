开源旧事：Linux为什么能成功？
================================================================================
> Linux，这个始于1991年由Linus Torvalds开发的类Unix操作系统内核已经成为开源世界的中心，人们不禁追问为什么Linux成功了，而包括GNU HURD和BSD在内的那么多相似的项目却失败了？

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2015/05/linux.jpg)

自由软件和开源世界的发展史中最令人不解的问题之一是为什么Linux取得了如此辉煌的成功，然而其它同样尝试打造自由开源、类Unix操作系统内核的项目却没能那么成功？这个问题难以回答，但我总结了一些原因，在下面与大家分享。

不过，首先得明确：当我谈论Linux是一个巨大的成功时所表达的含义。我这样说是相对于其它类Unix操作系统内核的，后者中一些是开源的，一些不是，而且它们繁荣发展的时期是Linux诞生的时期。[GNU][1]的HURD，一个发起于[1991年5月][1]的Free（自由）的内核，便是其中之一。其它的包括现在大部分人都没听说过的Unix，比如由加州大学伯克利分校开发出来的BSD的各种各样Unix衍生版，由微软主导的Unix系统Xenix，包括Minix在内的学术版本Unix，和在AT&T赞助下开发的最初的Unix。在更早的数十年内，它对于学术界和商业界的计算发展至关重要，但到19世纪90年代就已经几乎已经消失在人们的视野里。

#### 相关阅读 ####

- [开源旧事：黑客文化和黑客伦理的起源追踪][3]
- [Unix和个人计算机：重新诠释Linux起源][4]

此外，得说明的是，我这里说的是内核，而不是完整的操作系统。在很大程度上，Linux内核的成功归功于GNU整个项目。GNU这个项目产生了一套至关重要的工具，包括编译器、调试器和BASH shell的实现，这些对于构建一个类Unix操作系统是必需的。但是GNU的开发者们从没开发出一个HURD内核的可行版本（尽管他们仍在[不懈努力中][5]）。相反，Linux呈现出来的则是一个将GNU各个部分紧密连接在一起的内核，尽管这超出了GNU的初衷。

因此，值得人们去追问为什么Linux，一个由Linus Torvalds这个芬兰的无名程序员于1991年——和HURD同一年——发起的内核，能够经受考验并发展壮大？在当时的大环境下，很多拥有强力商业支持的、由当时炙手可热的黑客领头的类Unix内核都没能够发展起来。为了说明这个问题，我找到了一些和这个问题相关的解释。为此我研究了自由软件和开源世界的发展史，和不同解释的优缺点。

### Linux采用去中心化的开发方式 ###

这个观点来源于Eric S. Raymond的文章，“[大教堂与市集][6]”和其相关资料。这些资料验证了一种情形：当大量的贡献者以一种去中心化的组织结构持续不断地协同合作时，软件开发的效率最佳。Linux的开发证明了这一点，与之相反的是，比如，GNU HURD采用了一种相对更集中化的方法来管理代码开发。其结果如同Raymond所言，显然在十年的时间里都没能成功构建出一个完整的操作系统。

在一定程度上，这个解释有道理，但仍有一些明显的不足。举例来说，Torvalds在指导Linux代码开发过程中毫无争议地承担起一个更加有权威的角色，他可以决定接受或拒绝代码，这一点并非Raymond和其他人所想的那样。其次，这个观点不能解释除了没能开发出一个可行的系统内核外GNU仍然成功地生产出那么多优秀的软件。如果只有去中心化的开发方式才能很好地指导开源软件世界里的项目，那么GNU所有的编程工作都应该是徒劳无功的，但事实并非如此。

### Linux是实用型的，而GNU是空想型的 ###

个人而言，我觉得这个说法是最引人注目的，即Linux之所发展得如此迅速是因为它的创建者是一个实用主义者，他起初只是想写一个内核，使其能够在他家里的电脑上运行一个裁剪过的Unix操作系统，而不是成为以改变世界为目标的自由软件的一部分，而后者正是GNU项目的一贯目标。

然而，这个解释仍然有一些不能完全让人信服的地方。特别是，尽管Torvalds本人信奉实用主义的原则，但无论以前还是现在，并非所有参与到他的项目中的成员都和他一样信奉这一原则。尽管如此，Linux仍然取得了成功。

而且，如果实用主义是Linux持续发展的关键，那么就要再问一遍：为什么GNU除了没能开发出一个内核外还是成功地开发出这么多有用的工具？如果拥有某一种对软件的坚定政治信仰是追求成功的项目路上的绊脚石，那么GNU早应该是一个彻头彻尾的失败者，而不会是一个开发了那么多如今依然为IT世界提供坚实基础的优秀软件包的开拓者。

最后（但并不是最不重要），许多诞生于19世纪80年代末期和90年代初期的Unix变体，尤其是一些BSD分支，都是实用主义的产物。它们的开发者们致力于开发出可以自由分享而不是受到高昂商业证书限制的Unix变体，但他们对于编程或者共享代码并非完全局限于意识形态。Torvalds同样如此，因此很难说Linux和成功和其它Unix项目的失败是意识形态在作怪。

### 操作系统设计 ###

当谈到Linux的成功时，不可忽视的是Linux和其它Unix变体之间的诸多技术差异。Richard Stallman，GNU项目的创始人，在一封给我的电子邮件中解释了为什么HURD的开发进度频频滞后：“GNU Hurd确实不是一次实用上的成功。部分原因是它的基本设计使它像是一个研究项目。（我之所以选择这样的设计，是考虑到这是快速实现一个可用内核的捷径。）”

就Torvalds独自编写出Linux的所有代码这点而言，Linux也有别于其它Unix变体。当他在1991年8月[第一次发布Linux][7]时他的一个初衷就是拥有一个属于他自己的Unix，而不用别人的代码。这点特性使得Linux区别于同时期的大部分Unix变体，后者一般是从AT&T Unix或伯克利的BSD中衍生出基础代码。

我并不是一个计算机科学家，所以我没有资格去评判是否Linux代码就优于其他Unix代码，以此来解释Linux的成功。虽然这并不能解释Linux和其它Unix内核在文化和人员上的不同，但这个观点对我来说解释得通，因为似乎在理解Linux成功这一点上操作系统设计比代码更加重要。

### Linux背后的社区提供了有力支持 ###

Stallman也写到Linux成功的“主要原因”是“Torvalds使Linux成为一个自由软件，所以相比Hurd有更多来自社区的支持涌入Linux的发展中。”但这对于Linux的成长轨迹并非是一个完美的解释，因为它不能说明为什么自由软件的开发者们追随了Torvalds而不是HURD或其它某个Unix，但它仍然点明了这种变化是Linux盛行的很大一部分原因。

对于自由软件社区决定支持Linux有一个更全面的理由可以用来解释为什么开发者们这么做。起初，Linux只是一个默默无闻的小项目，以任何标准来衡量，它比同时期其它的一些尝试创建一个更加自由的Unix，比如NET BSD和386/BSD，都要显得微不足道。同样，最初并不清楚Linux和自由软件运动的目标是否一致。创建伊始，Torvalds只是在一份防止Linux不被商业使用的证书下发布了Linux。至于后来他为了保护源代码的开放性转向使用GNU的通用公开证书则是后话了。

所以，这些就是我所找到的Linux作为一个开源操作系统之所以取得成功的解释，可以肯定Linux的成就在某些方面（但比如桌面版的Linux从未成为它的支持者希望成为的样子）已经是可以衡量的成功。总之，Linux业已与其它任何类Unix操作系统不同的方式成为了计算机世界的基石。也许源于BSD的苹果公司的OS X和iOS系统也很接近这一点，但它们没有在其它方面像Linux影响互联网一样扮演着如此重要的中心角色。

对于为什么Linux能成为现在的样子，或者为什么它在Unix世界的竞争对手们几乎全部变得默默无闻的问题，你有其它的想法吗？如果有，我很乐意听到你的想法。（诚然，BSD的变体如今仍有一批追随者，而一些商用的Unix对于[Red Hat][8]（RHT）为[他们的用户提供支持][9]来说也仍然十分重要。但这些Unix中没有一个能够像Linux一样几乎征服了从Web服务器到智能手机的每一个领域。）

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/050415/open-source-history-why-did-linux-succeed

作者：[Christopher Tozzi][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://thevarguy.com/author/christopher-tozzi
[1]:http://gnu.org/
[2]:http://www.gnu.org/software/hurd/history/hurd-announce
[3]:http://thevarguy.com/open-source-application-software-companies/042915/open-source-history-tracing-origins-hacker-culture-and-ha
[4]:http://thevarguy.com/open-source-application-software-companies/042715/unix-and-personal-computers-reinterpreting-origins-linux
[5]:http://thevarguy.com/open-source-application-software-companies/042015/30-years-hurd-lives-gnu-updates-open-source-
[6]:http://www.catb.org/esr/writings/cathedral-bazaar/cathedral-bazaar/
[7]:https://groups.google.com/forum/#!topic/comp.os.minix/dlNtH7RRrGA[1-25]
[8]:http://www.redhat.com/
[9]:http://thevarguy.com/open-source-application-software-companies/032614/red-hat-grants-certification-award-unix-linux-migration-a