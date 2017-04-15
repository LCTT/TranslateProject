python 是慢，但是爷就喜欢它
=====================================

### 对追求生产率而牺牲性能的怒吼

 ![](https://cdn-images-1.medium.com/max/800/0*pWAgROZ2JbYzlDgj.jpg) 

我从关于 Python 中的 asyncio 这个标准库的讨论中休息一会，谈谈我最近正在思考的一些东西：Python 的速度。对不了解我的人说明一下，我是一个 Python 的粉丝，而且我在我能想到的所有地方都积极地使用 Python。人们对 Python 最大的抱怨之一就是它的速度比较慢，有些人甚至拒绝尝试使用 Python，因为它比其他语言速度慢。这里说说为什么我认为应该尝试使用 Python，尽管它是有点慢。

### 速度不再重要

过去的情形是，程序需要花费很长的时间来运行，CPU 比较贵，内存也很贵。程序的运行时间是一个很重要的指标。计算机非常的昂贵，计算机运行所需要的电也是相当贵的。对这些资源进行优化是因为一个永恒的商业法则：

> <ruby>优化你最贵的资源<rt>Optimize your most expensive resource</rt></ruby>。

在过去，最贵的资源是计算机的运行时间。这就是导致计算机科学致力于研究不同算法的效率的原因。然而，这已经不再是正确的，因为现在硅芯片很便宜，确实很便宜。运行时间不再是你最贵的资源。公司最贵的资源现在是它的员工的时间。或者换句话说，就是你。把事情做完比快速地做事更加重要。实际上，这是相当的重要，我将把它再次放在这里，仿佛它是一个引用一样(对于那些只是粗略浏览的人):

> <ruby>把事情做完比快速地做事更加重要<rt>It’s more important to get stuff done than to make it go fast</rt></ruby>。

你可能会说：“我的公司在意速度，我开发一个 web 应用程序，那么所有的响应时间必须少于 x 毫秒。”或者，“我们失去了客户，因为他们认为我们的 app 运行太慢了。”我并不是想说速度一点也不重要，我只是想说速度不再是最重要的东西;它不再是你最贵的资源。

![](https://cdn-images-1.medium.com/max/800/0*Z6j9zMua_w-T25TC.jpg) 

### 速度是唯一重要的东西

当你在编程的背景下说 _速度_ 时，你通常意味着性能，也就是 CPU 周期。当你的 CEO 在编程的背景下说 _速度_ 时，他指的是业务速度，最重要的指标是产品上市的时间。基本上，你的产品/web 程序是多么的快并不重要。它是用什么语言写的也不重要。甚至它需要花费多少钱也不重要。在一天结束时，让你的公司存活下来或者死去的唯一事物就是产品上市时间。我不只是说创业公司的想法 -- 你开始赚钱需要花费多久，更多的是“从想法到客户手中”的时间期限。企业能够存活下来的唯一方法就是比你的竞争对手更快地创新。如果在你的产品上市之前，你的竞争对手已经提前上市了，那么你想出了多少好的主意也将不再重要。你必须第一个上市，或者至少能跟上。一但你放慢了脚步，你就输了。

> <ruby>企业能够存活下来的唯一方法就是比你的竞争对手更快地创新<rt>The only way to survive in business is to innovate faster than your competitors</rt></ruby>。

#### 一个微服务的案例

像 Amazon、Google 和 Netflix 这样的公司明白快速前进的重要性。他们创建了一个业务系统，可以使用这个系统迅速地前进和快速的创新。微服务是针对他们的问题的解决方案。这篇文章不谈你是否应该使用微服务，但是至少要接受 Amazon 和 Google 认为他们应该使用微服务。

 ![](https://cdn-images-1.medium.com/max/600/0*MBM9zatYv_Lzr3QN.jpg) 

微服务本来就很慢。微服务的主要概念是用网络调用来打破边界。这意味着你正在使用一个函数调用（几个 cpu 周期）并将它转变为一个网络调用。没有什么比这更影响性能了。和 CPU 相比较，网络调用真的很慢。但是这些大公司仍然选择使用微服务。我所知道的架构里面没有比微服务还要慢的了。微服务最大的弊端就是它的性能，但是最大的长处就是上市的时间。通过在较小的项目和代码库上建立团队，一个公司能够以更快的速度进行迭代和创新。这恰恰表明了，非常大的公司也很在意上市时间，而不仅仅只是只有创业公司。

#### CPU不是你的瓶颈

 ![](https://cdn-images-1.medium.com/max/800/0*s1RKhkRIBMEYji_w.jpg) 

 如果你在写一个网络应用程序，如 web 服务器，很有可能的情况会是，CPU 时间并不是你的程序的瓶颈。当你的 web 服务器处理一个请求时，可能会进行几次网络调用，例如到数据库，或者像 Redis 这样的缓存服务器。虽然这些服务本身可能比较快速，但是对它们的网络调用却很慢。[有一篇很好的关于特定操作的速度差异的博客文章][1]。在这篇文章里，作者把 CPU 周期时间缩放到更容易理解的人类时间。如果一个单独的周期等同于 1 秒，那么一个从 California 到 New York 的网络调用将相当于 4 年。那就说明了网络调用是多少的慢。按一些粗略估计，我们可以假设在同一数据中心内的普通网络调用大约需要 3 ms。这相当于我们“人类比例” 3 个月。现在假设你的程序是高 CPU 密集型，这需要 100000 个 CPU 周期来对单一调用进行响应。这相当于刚刚超过 1 天。现在让我们假设你使用的是一种要慢 5 倍的语言，这将需要大约 5 天。很好，将那与我们 3 个月的网络调用时间相比，4 天的差异就显得并不是很重要了。如果有人为了一个包裹不得不至少等待 3 个月，我不认为额外的 4 天对他们来说真的很重要。

上面所说的终极意思是，尽管 Python 速度慢，但是这并不重要。语言的速度(或者 CPU 时间)几乎从来不是问题。实际上谷歌曾经就这一概念做过一个研究，[并且他们就此发表过一篇论文][2]。那篇论文论述了设计高吞吐量的系统。在结论里，他们说到：

>  在高吞吐量的环境中使用解释性语言似乎是矛盾的，但是我们已经发现 CPU 时间几乎不是限制因素；语言的表达性是指，大多数程序是源程序，同时花费它们的大多数时间在 I/O 读写和本机运行时代码。而且，解释性语言无论是在语言层面的轻松实验还是在允许我们在很多机器上探索分布计算的方法都是很有帮助的，

再次强调：
> <ruby>CPU 时间几乎不是限制因素<rt>the CPU time is rarely the limiting factor</rt></ruby>。

### 如果 CPU 时间是一个问题怎么办？

你可能会说，“前面说的情况真是太好了，但是我们确实有过一些问题，这些问题中 CPU 成为了我们的瓶颈，并造成了我们的 web 应用的速度十分缓慢”，或者“在服务器上 X 语言比 Y 语言需要更少的硬件资源来运行。”这些都可能是对的。关于 web 服务器有这样的美妙的事情：你可以几乎无限地负载均衡它们。换句话说，可以在 web 服务器上投入更多的硬件。当然，Python 可能会比其他语言要求更好的硬件资源，比如 c 语言。只是把硬件投入在 CPU 问题上。相比于你的时间，硬件就显得非常的便宜了。如果你在一年内节省了两周的生产力时间，那将远远多于所增加的硬件开销的回报。


* * * 

![](https://cdn-images-1.medium.com/max/1000/0*mJFOcWsdEQq98gkF.jpg) 

### 那么，Python 是更快吗？

这一次我一直在谈论最重要的是开发时间。所以问题依然存在：当就开发时间而言，Python 要比其他语言更快吗？按常规惯例来看，我、[google][3] [还有][4][其他][5][几个人][6]可以告诉你 Python 是多么的[高效][7]。它为你抽象出很多东西，帮助你关注那些你真正应该编写代码的地方，而不会被困在琐碎事情的杂草里，比如你是否应该使用一个向量或者一个数组。但你可能不喜欢只是听别人说的这些话，所以让我们来看一些更多的经验数据。

在大多数情况下，关于 python 是否是更高效语言的争论可以归结为脚本语言（或动态语言）与静态类型语言两者的争论。我认为人们普遍接受的是静态类型语言的生产力较低，但是，[这有一篇优秀的论文][8]解释了为什么不是这样。就 Python 而言，这里有一项[研究][9]，它调查了不同语言编写字符串处理的代码所需要花费的时间，供参考。

 ![](https://cdn-images-1.medium.com/max/800/1*cw7Oq54ZflGZhlFglDka4Q.png)


在上述研究中，Python 的效率比 Java 高出 2 倍。有一些其他研究也显示相似的东西。 Rosetta Code 对编程语言的差异进行了[深入的研究][10]。在论文中，他们把 python 与其他脚本语言/解释性语言相比较，得出结论：

>  Python 更简洁，即使与函数式语言相比较（平均要短 1.2 到 1.6 倍）
>  

普遍的趋势似乎是 Python 中的代码行总是更少。代码行听起来可能像一个可怕的指标，但是包括上面已经提到的两项研究在内的[多项研究][11]表明，每种语言中每行代码所需要花费的时间大约是一样的。因此，限制代码行数就可以提高生产效率。甚至 codinghorror（一名 C# 程序员）本人[写了一篇关于 Python 是如何更有效率的文章][12]。

我认为说 Python 比其他的很多语言更加的有效率是公正的。这主要是由于 Python 有大量的自带以及第三方库。[这里是一篇讨论 Python 和其他语言间的差异的简单的文章][13]。如果你不知道为何 Python 是如此的小巧和高效，我邀请你借此机会学习一点 python，自己多实践。这儿是你的第一个程序：

 _import __hello___ 

 * * *

### 但是如何速度真的重要怎么办呢？
--------------------------------------------------------------------------------



via: https://hackernoon.com/yes-python-is-slow-and-i-dont-care-13763980b5a1

作者：[Nick Humrich ][a]
译者：[zhousiyu325](https://github.com/zhousiyu325)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@nhumrich
[1]:https://blog.codinghorror.com/the-infinite-space-between-words/
[2]:https://static.googleusercontent.com/media/research.google.com/en//archive/sawzall-sciprog.pdf
[3]:https://www.codefellows.org/blog/5-reasons-why-python-is-powerful-enough-for-google/
[4]:https://www.lynda.com/Python-tutorials/Python-Programming-Efficiently/534425-2.html
[5]:https://www.linuxjournal.com/article/3882
[6]:https://www.codeschool.com/blog/2016/01/27/why-python/
[7]:http://pythoncard.sourceforge.net/what_is_python.html
[8]:http://www.tcl.tk/doc/scripting.html
[9]:http://www.connellybarnes.com/documents/language_productivity.pdf
[10]:https://arxiv.org/pdf/1409.0252.pdf
[11]:http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.113.1831&rep=rep1&type=pdf
[12]:https://blog.codinghorror.com/are-all-programming-languages-the-same/
[13]:https://www.python.org/doc/essays/comparisons/
[14]:https://wiki.python.org/moin/PythonSpeed
[15]:https://wiki.python.org/moin/PythonSpeed/PerformanceTips
[16]:https://www.eveonline.com/
[17]:http://pypy.org/
[18]:http://pythondevelopers.herokuapp.com/
