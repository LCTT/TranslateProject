[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11718-1.html)
[#]: subject: (Why your Python code needs to be beautiful and explicit)
[#]: via: (https://opensource.com/article/19/12/zen-python-beauty-clarity)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

为什么 Python 代码要写得美观而明确
======

> 欢迎阅读“Python 光明节（Pythonukkah）”系列文章，这个系列文章将会讨论《Python 之禅》。我们首先来看《Python 之禅》里的前两个原则：美观与明确。

![](https://img.linux.net.cn/data/attachment/album/201912/27/091634drq96c2fojzp6okr.png)

早在 1999 年，Python 的贡献者之一，Tim Peters 就提出了《[Python 之禅][2]》，直到二十年后的今天，《Python 之禅》中的 19 条原则仍然对整个社区都产生着深远的影响。为此，就像庆典光明的<ruby>光明节<rt>Hanukkah</rt></ruby>一样，我们举行了这一次的“<ruby>Python 光明节<rt>Pythonukkah</rt></ruby>”。首先，我们会讨论《Python 之禅》中的前两个原则：美观和明确。

> “Hanukkah is the Festival of Lights,
> 
> Instead of one day of presents, we get eight crazy nights.”
> 
>  —亚当·桑德勒，[光明节之歌][3]

### 美观胜于丑陋

著名的《[<ruby>计算机程序的构造和解释<rt>Structure and Interpretation of Computer Programs</rt></ruby>][4]》中有这么一句话：<ruby>代码是写给人看的，只是恰好能让机器运行。<rt>Programs must be written for people to read and only incidentally for machines to execute.</rt></ruby>机器并不在乎代码的美观性，但人类在乎。

阅读美观的代码对人们来说是一种享受，这就要求在整套代码中保持一致的风格。使用诸如 [Black][5]、[flake8][6]、[Pylint][7] 这一类工具能够有效地接近这一个目标。

但实际上，只有人类自己才知道什么才是真正的美观。因此，代码审查和协同开发是其中的不二法门，同时，在开发过程中倾听别人的意见也是必不可少的。

最后，个人的主观能动性也很重要，否则一切工具和流程都会变得毫无意义。只有意识到美观的重要性，才能主动编写出美观的代码。

这就是为什么美观在众多原则当中排到了首位，它让“美”成为了 Python 社区的一种价值。如果有人要问，”我们*真的*在乎美吗？“社区会以代码给出肯定的答案。

### 明确胜于隐晦

人类会欢庆光明、惧怕黑暗，那是因为光能够让我们看到难以看清的事物。同样地，尽管有些时候我们会不自觉地把代码写得含糊不清，但明确地编写代码确实能够让我们理解很多抽象的概念。

“为什么类方法中要将 `self` 显式指定为第一个参数？”

这个问题已经是老生常谈了，但网络上很多流传已久的回答都是不准确的。在编写<ruby>元类<rt>metaclass</rt></ruby>时，显式指定 `self` 参数就显得毫无意义。如果你没有编写过元类，希望你可以尝试一下，这是很多 Python 程序员的必经之路。

显式指定 `self` 参数的原因并不是 Python 的设计者不想将这样的元类视为“默认”元类，而是因为第一个参数必须是*显式*的。

即使 Python 中确实允许非显式的情况存在（例如上下文变量），但我们还是应该提出疑问：某个东西是不是有存在的必要呢？如果非显式地传递参数会不会出现问题呢？有些时候，由于种种原因，这是会有问题的。总之，在写代码时一旦能够优先考虑到明确性，至少意味着能对不明确的地方提出疑问并对结果作出有效的估计。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-beauty-clarity

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV "Searching for code"
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://en.wikipedia.org/wiki/The_Chanukah_Song
[4]: https://en.wikipedia.org/wiki/Structure_and_Interpretation_of_Computer_Programs
[5]: https://opensource.com/article/19/5/python-black
[6]: https://opensource.com/article/19/5/python-flake8
[7]: https://opensource.com/article/19/10/python-pylint-introduction

