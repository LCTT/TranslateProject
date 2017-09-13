Stack Overflow 报告：Python 正在令人难以置信地增长！
============================================================ 

我们[最近探讨][3]了那些世界银行定义为[高收入][4]的富裕国家是如何倾向于使用与世界上其它地区不同的技术。这其中我们看到的最大的差异在于 Python 编程语言。就高收入国家而言，Python 的增长甚至要比 [Stack Overflow Trends][5] 等工具展现的或其他针对全球的软件开发的排名更高。

在本文中，我们将探讨在过去五年中 Python 编程语言的非凡增长，就如在高收入国家的 Stack Overflow 流量所示 那样。“增长最快”一词[很难准确定义][6]，但是我们认为 Python 确实可以称得上增长最快的主流编程语言。

这篇文章中讨论的所有数字都是针对高收入国家的。它们一般指的是美国、英国、德国、加拿大等国家的趋势，他们加起来占了 Stack Overflow 大约 64％ 的流量。许多其他国家，如印度、巴西、俄罗斯和中国，也为全球软件开发生态系统做出了巨大贡献，尽管我们也将看到 Python 在这方面有所增长，但本文对这些经济体的描述较少。

值得强调的是，一种语言的用户数量并不能衡量语言的品质：我们是在_描述_开发人员使用的语言，但没有规定任何东西。（完全披露：我[曾经][7]主要使用 Python 编程，尽管我已经完全切换到 R 了）。

### Python 在高收入国家的增长

你可以在 [Stack Overflow Trends][8] 中看到，Python 在过去几年中一直在快速增长。但是对于本文，我们将重点关注高收入国家，考虑的是问题的浏览量而不是提出的问题数量（这基本上结果是类似的，但是每个月都有所波动，特别是对于较小的标签分类）。

我们有关于 Stack Overflow 问题的查看数据可以追溯到 2011 年底，在这段时间内，我们可以研究下 Python 相对于其他五种主要编程语言的增长。（请注意，这比 Stack Overflow Trends 的时间范围更短，它可追溯到 2008 年）。这些目前是高收入国家里十大访问最高的 Stack Overflow 标签中的六个。我们没有包括的四个是 CSS、HTML、Android 和 JQuery。

![](https://zgab33vy595fw5zq-zippykid.netdna-ssl.com/wp-content/uploads/2017/09/growth_major_languages-1-1024x878.png)

2017 年 6 月，Python 是成为高收入国家里 Stack Overflow 访问量最高的标签的第一个月。这也是美国和英国最受欢迎的标签，以及几乎所有其他高收入国家的前两名（接着就是 Java 或 JavaScript）。这是特别令人印象深刻的，因为在 2012 年，它比其他 5 种语言的访问量小，比当时增长了 2.5 倍。

部分原因是因为 Java 流量的季节性。由于它[在本科课程中有很多课程][9]，Java 流量在秋季和春季会上升，夏季则下降。到年底，它会再次赶上 Python 吗？我们可以尝试用一个叫做 [“STL” 的模型][10]来预测未来两年的增长, 它将增长与季节性趋势结合起来，来预测将来的变化。

![](https://zgab33vy595fw5zq-zippykid.netdna-ssl.com/wp-content/uploads/2017/09/projections-1-1024x878.png)

根据这个模型，Python 可能会在秋季保持领先地位或被 Java 取代（大致在模型预测的变化范围之内），但是 Python 显然会在 2018 年成为浏览最多的标签。STL 还表明，与过去两年一样，JavaScript 和 Java 在高收入国家中的流量水平将保持相似水平。

### 什么标签整体上增长最快？

上面只看了六个最受欢迎的编程语言。在其他重大技术中，哪些是目前在高收入国家中增长最快的技术？

我们以 2017 年至 2016 年流量的比例来定义增长率。在此分析中，我们决定仅考虑编程语言（如 Java 和 Python）和平台（如 iOS、Android、Windows 和 Linux），而不考虑像 [Angular][11] 或 [TensorFlow][12] 这样的框架（虽然其中许多有显著的增长，可能在未来的文章中分析）。

![xkcd - Fastest-Growing ](https://imgs.xkcd.com/comics/fastest_growing.png)

由于上面[这个漫画][13]中所描述的“最快增长”定义的激励，我们将增长与[平均差异图][14]中的整体平均值进行比较。

![](https://zgab33vy595fw5zq-zippykid.netdna-ssl.com/wp-content/uploads/2017/09/tag_growth_scatter-1-1-1024x896.png)

Python 以 27％ 的年增长率成为了规模大、增长快的标签。下一个类似增长的最大标签是 R。我们看到，大多数其他大型标签的流量在高收入国家中保持稳定，浏览 Android、iOS 和 PHP 则略有下降。我们以前在 [Flash 之死这篇文章][15]中审查过一些正在衰减的标签，如 Objective-C、Perl 和 Ruby。我们还注意到，在函数式编程语言中，Scala 是最大的并且不断增长的，而 F# 和 Clojure 较小并且正在衰减，Haskell 则保持稳定。

上面的图表中有一个重要的遗漏：去年，有关 TypeScript 的问题流量增长了惊人的 142％，这使得我们需要去除它以避免压扁比例尺。你还可以看到，其他一些较小的语言的增长速度与 Python 类似或更快（例如 R、Go 和 Rust），而且还有许多标签，如 Swift 和 Scala，这些标签也显示出惊人的增长。它们随着时间的流量相比 Python 如何？

![](https://zgab33vy595fw5zq-zippykid.netdna-ssl.com/wp-content/uploads/2017/09/growth_smaller_tags-1-1024x878.png)

像 R 和 Swift 这样的语言的发展确实令人印象深刻，而 TypeScript 在更短的时间内显示出特别快速的扩张。这些较小的语言中，有许多从很少的流量成为软件生态系统中引人注目的存在。但是如图所示，当标签开始相对较小时，显示出快速增长更容易。

请注意，我们并不是说这些语言与 Python “竞争”。相反，这只是解释了为什么我们要把它们的增长分成一个单独的类别，这些是始于较低流量的标签。Python 是一个不寻常的案例，**既是 Stack Overflow 中最受欢迎的标签之一，也是增长最快的其中之一**。（顺便说一下，它也在加速！自 2013 年以来，每年的增长速度都会更快）。

### 世界其他地区

在这篇文章中，我们一直在分析高收入国家的趋势。Python 在世界其他地区，如印度、巴西、俄罗斯和中国等国家的增长情况是否类似？

确实如此。

![](https://zgab33vy595fw5zq-zippykid.netdna-ssl.com/wp-content/uploads/2017/09/non_high_income_graph-1-1-1024x731.png)

在高收入国家之外，Python _仍旧_是增长最快的主要编程语言。它从较低的水平开始，两年后才开始增长（2014 年而不是 2012 年）。事实上，非高收入国家的 Python 同比增长率高于高收入国家。我们不会在这里研究它，但是 R （[其它语言的使用与 GDP 正相关][16]） 在这些国家也在增长。

在这篇文章中，许多关于高收入国家标签 (相对于绝对排名) 的增长和下降的结论，对世界其他地区都是正确的。两个部分增长率之间有一个 0.979 Spearman 相关性。在某些情况下，你可以看到类似于 Python 上发生的 “滞后” 现象，其中一个技术在高收入国家被广泛采用，一年或两年才能在世界其他地区扩大。（这是一个有趣的现象，这可能是未来文章的主题！）

### 下一次

我们不打算为任何“语言战争”提供弹药。一种语言的用户数量并不意味着它的质量，而且肯定不会让你知道哪种语言[更适合某种特定情况][17]。不过，考虑到这点，我们认为值得了解什么语言构成了开发者生态系统，以及生态系统会如何变化。

本文表明 Python 在过去五年中，特别是在高收入国家，显示出惊人的增长。在我们的下一篇文章中，我们将开始研究_“为什么”_。我们将按国家和行业划分增长情况，并研究有哪些其他技术与 Python 一起使用（例如，估计多少增长是由于 Python 用于 Web 开发而不是数据科学)。

在此期间，如果你使用 Python 工作，并希望你的职业生涯中进入下一阶段，那么[在 Stack Overflow Jobs 上有些公司正在招聘 Python 开发][18]。

--------------------------------------------------------------------------------

via: https://stackoverflow.blog/2017/09/06/incredible-growth-python/?cb=1

作者：[David Robinson][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://stackoverflow.blog/authors/drobinson/
[1]:https://stackoverflow.blog/authors/drobinson/
[2]:https://stackoverflow.blog/authors/drobinson/
[3]:https://stackoverflow.blog/2017/08/29/tale-two-industries-programming-languages-differ-wealthy-developing-countries/?utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
[4]:https://en.wikipedia.org/wiki/World_Bank_high-income_economy
[5]:https://insights.stackoverflow.com/trends?tags=python%2Cjavascript%2Cjava%2Cc%23%2Cphp%2Cc%2B%2B&utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
[6]:https://xkcd.com/1102/
[7]:https://stackoverflow.com/search?tab=newest&q=user%3a712603%20%5bpython%5d
[8]:https://insights.stackoverflow.com/trends?tags=python%2Cjavascript%2Cjava%2Cc%23%2Cphp%2Cc%2B%2B&utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
[9]:https://stackoverflow.blog/2017/02/15/how-do-students-use-stack-overflow/
[10]:http://otexts.org/fpp2/sec-6-stl.html
[11]:https://stackoverflow.com/questions/tagged/angular
[12]:https://stackoverflow.com/questions/tagged/tensorflow
[13]:https://xkcd.com/1102/
[14]:https://en.wikipedia.org/wiki/Bland%E2%80%93Altman_plot
[15]:https://stackoverflow.blog/2017/08/01/flash-dead-technologies-might-next/?utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
[16]:https://stackoverflow.blog/2017/08/29/tale-two-industries-programming-languages-differ-wealthy-developing-countries/?utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
[17]:https://stackoverflow.blog/2011/08/16/gorilla-vs-shark/?utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
[18]:https://stackoverflow.com/jobs/developer-jobs-using-python?utm_source=so-owned&utm_medium=blog&utm_campaign=gen-blog&utm_content=blog-link&utm_term=incredible-growth-python
