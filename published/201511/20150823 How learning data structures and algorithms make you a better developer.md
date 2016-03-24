学习数据结构与算法分析如何帮助您成为更优秀的开发人员
================================================================================

> "相较于其它方式，我一直热衷于推崇围绕数据设计代码，我想这也是Git能够如此成功的一大原因[…]在我看来，区别程序员优劣的一大标准就在于他是否认为自己设计的代码还是数据结构更为重要。"
-- Linus Torvalds

---

> "优秀的数据结构与简陋的代码组合远比反之的组合更好。"
-- Eric S. Raymond, The Cathedral and The Bazaar

学习数据结构与算法分析会让您成为一名出色的程序员。

**数据结构与算法分析是一种解决问题的思维模式。** 在您的个人知识库中，数据结构与算法分析的相关知识储备越多，您将越多具备应对并解决各类繁杂问题的能力。掌握了这种思维模式，您还将有能力针对新问题提出更多以前想不到的漂亮的解决方案。

您将*更深入地*了解，计算机如何完成各项操作。无论您是否是直接使用给定的算法，它都影响着您作出的各种技术决定。从计算机操作系统的内存分配到RDBMS的内在工作机制，以及网络协议如何实现将数据从地球的一个角落发送至另一个角落，这些大大小小的工作的完成，都离不开基础的数据结构与算法，理解并掌握它将会让您更了解计算机的运作机理。

对算法广泛深入的学习能为您储备解决方案来应对大体系的问题。之前建模困难时遇到的问题如今通常都能融合进经典的数据结构中得到很好地解决。即使是最基础的数据结构，只要对它进行足够深入的钻研，您将会发现在每天的编程任务中都能经常用到这些知识。

有了这种思维模式，在遇到磨棱两可的问题时，您将能够想出新奇的解决方案。即使最初并没有打算用数据结构与算法解决相应问题的情况，当真正用它们解决这些问题时您会发现它们将非常有用。要意识到这一点，您至少要对数据结构与算法分析的基础知识有深入直观的认识。

理论认识就讲到这里，让我们一起看看下面几个例子。

###最短路径问题###

我们想要开发一个软件来计算从一个国际机场出发到另一个国际机场的最短距离。假设我们受限于以下路线：

![](http://www.happybearsoftware.com/assets/posts/how-learning-data-structures-and-algorithms-makes-you-a-better-developer/airport-graph-d2e32b3344b708383e405d67a80c29ea.svg)

从这张画出机场各自之间的距离以及目的地的图中，我们如何才能找到最短距离，比方说从赫尔辛基到伦敦？**[Dijkstra算法][3]**是能让我们在最短的时间得到正确答案的适用算法。

在所有可能的解法中，如果您曾经遇到过这类问题，知道可以用Dijkstra算法求解，您大可不必从零开始实现它，只需***知道***该算法的代码库能帮助您解决相关的实现问题。

如果你深入到该算法的实现中，您将深入理解一项著名的重要图论算法。您会发现实际上该算法比较消耗资源，因此名为[A*][4]的扩展经常用于代替该算法。这个算法应用广泛，从机器人寻路的功能实现到TCP数据包路由，以及GPS寻径问题都能应用到这个算法。

###先后排序问题###

您想要在开放式在线课程（MOOC，Massive Open Online Courses）平台上(如Udemy或Khan学院)学习某课程，有些课程之间彼此依赖。例如，用户学习牛顿力学（Newtonian Mechanics）课程前必须先修微积分（Calculus）课程，课程之间可以有多种依赖关系。用YAML表述举例如下：

    # Mapping from course name to requirements
    #
    # If you're a physcist or a mathematicisn and you're reading this, sincere
    # apologies for the completely made-up dependency tree :)
    courses:
      arithmetic:         []
      algebra:            [arithmetic]
      trigonometry:       [algebra]
      calculus:           [algebra, trigonometry]
      geometry:           [algebra]
      mechanics:          [calculus, trigonometry]
      atomic_physics:     [mechanics, calculus]
      electromagnetism:   [calculus, atomic_physics]
      radioactivity:      [algebra, atomic_physics]
      astrophysics:       [radioactivity, calculus]
      quantumn_mechanics: [atomic_physics, radioactivity, calculus]

鉴于以上这些依赖关系，作为一名用户，我希望系统能帮我列出必修课列表，让我在之后可以选择任意一门课程学习。如果我选择了微积分（calculus）课程，我希望系统能返回以下列表：

    arithmetic -> algebra -> trigonometry -> calculus

这里有两个潜在的重要约束条件：

 - 返回的必修课列表中，每门课都与下一门课存在依赖关系
 - 我们不希望列表中有任何重复课程

这是解决数据间依赖关系的例子，解决该问题的排序算法称作拓扑排序算法(tsort，topological sort)。它适用于解决上述我们用YAML列出的依赖关系图的情况，以下是在图中显示的相关结果(其中箭头代表`需要先修的课程`):

![](http://www.happybearsoftware.com/assets/posts/how-learning-data-structures-and-algorithms-makes-you-a-better-developer/course-graph-2f60f42bb0dc95319954ce34c02705a2.svg)

拓扑排序算法的实现就是从如上所示的图中找到满足各层次要求的依赖关系。因此如果我们只列出包含`radioactivity`和与它有依赖关系的子图，运行tsort排序，会得到如下的顺序表：

    arithmetic
    algebra
    trigonometry
    calculus
    mechanics
    atomic_physics
    radioactivity
    
这符合我们上面描述的需求，用户只需选出`radioactivity`，就能得到在此之前所有必修课程的有序列表。

在运用该排序算法之前，我们甚至不需要深入了解算法的实现细节。一般来说，你可能选择的各种编程语言在其标准库中都会有相应的算法实现。即使最坏的情况，Unix也会默认安装`tsort`程序，运行`man tsort` 来了解该程序。

###其它拓扑排序适用场合###

 - **类似`make`的工具** 可以让您声明任务之间的依赖关系，这里拓扑排序算法将从底层实现具有依赖关系的任务顺序执行的功能。
 - **具有`require`指令的编程语言**适用于要运行当前文件需先运行另一个文件的情况。这里拓扑排序用于识别文件运行顺序以保证每个文件只加载一次，且满足所有文件间的依赖关系要求。
 - **带有甘特图的项目管理工具**。甘特图能直观列出给定任务的所有依赖关系，在这些依赖关系之上能提供给用户任务完成的预估时间。我不常用到甘特图，但这些绘制甘特图的工具很可能会用到拓扑排序算法。

###霍夫曼编码实现数据压缩###

[霍夫曼编码][5]（Huffman coding）是一种用于无损数据压缩的编码算法。它的工作原理是先分析要压缩的数据，再为每个字符创建一个二进制编码。字符出现的越频繁，编码赋值越小。因此在一个数据集中`e`可能会编码为`111`，而`x`会编码为`10010`。创建了这种编码模式，就可以串联无定界符，也能正确地进行解码。

在gzip中使用的DEFLATE算法就结合了霍夫曼编码与LZ77一同用于实现数据压缩功能。gzip应用领域很广，特别适用于文件压缩(以`.gz`为扩展名的文件)以及用于数据传输中的http请求与应答。

学会实现并使用霍夫曼编码有如下益处：

 - 您会理解为什么较大的压缩文件会获得较好的整体压缩效果(如压缩的越多，压缩率也越高)。这也是SPDY协议得以推崇的原因之一：在复杂的HTTP请求/响应过程数据有更好的压缩效果。
 - 您会了解数据传输过程中如果想要压缩JavaScript/CSS文件，运行压缩软件是完全没有意义的。PNG文件也是类似，因为它们已经使用DEFLATE算法完成了压缩。
 - 如果您试图强行破译加密的信息，您可能会发现由于重复数据压缩质量更好，密文给定位的数据压缩率将帮助您确定相关的[分组密码工作模式][6]（block cipher mode of operation.）。

###下一步选择学习什么是困难的###

作为一名程序员应当做好持续学习的准备。为了成为一名web开发人员，您需要了解标记语言以及Ruby/Python、正则表达式、SQL、JavaScript等高级编程语言，还需要了解HTTP的工作原理，如何运行UNIX终端以及面向对象的编程艺术。您很难有效地预览到未来的职业全景，因此选择下一步要学习哪些知识是困难的。

我没有快速学习的能力，因此我不得不在时间花费上非常谨慎。我希望尽可能地学习到有持久生命力的技能，即不会在几年内就过时的技术。这意味着我也会犹豫这周是要学习JavaScript框架还是那些新的编程语言。

只要占主导地位的计算模型体系不变，我们如今使用的数据结构与算法在未来也必定会以另外的形式继续适用。您可以放心地将时间投入到深入掌握数据结构与算法知识中，它们将会成为您作为一名程序员的职业生涯中一笔长期巨大的财富。

--------------------------------------------------------------------------------

via: http://www.happybearsoftware.com/how-learning-data-structures-and-algorithms-makes-you-a-better-developer

作者：[Happy Bear][a]
译者：[icybreaker](https://github.com/icybreaker)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.happybearsoftware.com/
[1]:http://en.wikipedia.org/wiki/Huffman_coding
[2]:http://en.wikipedia.org/wiki/Block_cipher_mode_of_operation
[3]:http://en.wikipedia.org/wiki/Dijkstra's_algorithm
[4]:http://en.wikipedia.org/wiki/A*_search_algorithm
[5]:http://en.wikipedia.org/wiki/Huffman_coding
[6]:http://en.wikipedia.org/wiki/Block_cipher_mode_of_operation
