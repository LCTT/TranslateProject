[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10527-1.html)
[#]: subject: (Hacking math education with Python)
[#]: via: (https://opensource.com/article/19/1/hacking-math)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

将 Python 结合到数学教育中
======

> 身兼教师、开发者、作家数职的 Peter Farrell 来讲述为什么使用 Python 来讲数学课会比传统方法更加好。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl)

数学课一直都是很讨厌的一件事情，尤其对于在传统教学方法上吃过苦头的人（例如我）来说。传统教学方法强调的是死记硬背和理论知识，这种形式与学生们的现实世界似乎相去甚远。

[Peter Farrell][1] 作为一位 Python 开发者和数学教师，发现学生在数学课程中遇到了困难，于是决定尝试使用 Python 来帮助介绍数学概念。

Peter 的灵感来源于 Logo 语言之父 [Seymour Papert][2]，他的 Logo 语言现在还存在于 Python 的 [Turtle 模块][3]中。Logo 语言中的海龟形象让 Peter 喜欢上了 Python，并且进一步将 Python 应用到数学教学中。

Peter 在他的新书《<ruby>[Python 数学奇遇记][5]<rt>Math Adventures with Python</rt></ruby>》中分享了他的方法：“图文并茂地指导如何用代码探索数学”。因此我最近对他进行了一次采访，向他了解更多这方面的情况。

**Don Watkins（LCTT 译注：本文作者）：** 你的教学背景是什么？

**Peter Farrell：** 我曾经当过八年的数学老师，之后又做了十年的数学私教。我还在当老师的时候，就阅读过 Papert 的 《<ruby>[头脑风暴][6]<rt>Mindstorms</rt></ruby>》并从中受到了启发，将 Logo 语言和海龟引入到了我所有的数学课上。

**DW：** 你为什么开始使用 Python 呢？

**PF：** 在我当家教的时候，需要教学一门枯燥刻板的数学课程，这是一个痛苦的过程。后来我引入了 Logo 语言和海龟，我的学生刚好是一个编程爱好者，他非常喜欢这样的方式。在接触到函数和实际的编程之后，他还提议改用 Python。尽管当时我还不了解 Python，但看起来好像和 Logo 语言差别不大，我就同意了。后来我甚至坚持在 Python 上一条道走到黑了！

我还曾经寻找过 3D 图形方面的软件包，用来模拟太阳系行星的运动轨迹，让学生们理解行星是如何在牛顿的万有引力定律作用下运动的。很多图形软件包都需要用到 C 语言编程或者其它一些很复杂的内容，后来我发现了一个叫做 VisualPython 的软件包，它非常方便使用。于是在那之后的几年里，我就一直在用 [Vpython][7] 这个软件包。

所以，我是在和学生一起学习数学的时候被介绍使用 Python 的。在那段时间里，他是我的编程老师，而我则是他的数学老师。

**DW：** 是什么让你对数学感兴趣？

**PF：** 我是通过传统的方法学习数学的，那时候都是用手写、用纸记、在黑板上计算。我擅长代数和几何，在大学的时候也接触过 Basic 和 Fortran 编程，但那个时候也没有从中获取到灵感。直到后来在从编程中收到了启发，编程可以让你将数学课上一些晦涩难懂的内容变得简单直观，也能让你轻松地绘图、调整、探索，进而发现更多乐趣。

**DW：** 是什么启发了你使用 Python 教学？

**PF：** 还是在我当家教的时候，我惊奇地发现可以通过循环来计算对同一个函数输入不同参数的结果。如果用人手计算，可能要花半个小时的时间，但计算机瞬间就完成了。在这样的基础上，我们只要将一些计算的过程抽象成一个函数，再对其进行一些适当的扩展，就可以让计算机来计算了。

**DW：** 你的教学方法如何帮助学生，特别是在数学上感觉吃力的学生？如何将 Python 编程和数学结合起来

**PF：** 很多学生，尤其是高中生，都认为通过手工计算和画图来解决问题的方式在当今已经没有必要了，我并不反对这样的观点。例如，使用 Excel 来处理数据确实应该算是办公室工作的基本技能。学习任何一种编程语言，对公司来说都是一项非常有价值的技能。因此，使用计算机计算确实是有实际意义的。

而使用代码来为数学课创造艺术，则是一项革命性的改变。例如，仅仅是把某个形状显示到屏幕上，就需要使用到数学，因为位置需要用 x-y 坐标去表示，而尺寸、颜色等等都是数字。如果想要移动或者更改某些内容，会需要用到变量。更特殊地，如果需要改变位置，就需要更有效的向量来实现。这样的最终结果是，类似向量、矩阵这些难以捉摸的空洞概念会转变成实打实有意义的数学工具。

那些看起来在数学上吃力的学生，或许只是不太容易接受“书本上的数学”。因为“书本上的数学”过分强调了死记硬背和循规蹈矩，而有些忽视了创造力和实际应用能力。有些学生其实擅长数学，但并不适应学校的教学方式。我的方法会让父母们看到他们的孩子通过代码画出了很多有趣的图形，然后说：“我从来不知道正弦和余弦还能这样用！”

**DW：** 你的教学方法是如何在学校里促进 STEM 教育的呢？

**PF：** 我喜欢将这几个学科统称为 STEM（<ruby>科学、技术、工程、数学<rt>Science, Technology, Engineering and Mathematics</rt></ruby>） 或 STEAM（<ruby>科学、技术、工程、艺术、数学<rt>Science, Technology, Engineering, Art and Mathematics</rt></ruby>）。但作为数学工作者，我很不希望其中的 M 被忽视。我经常看到很多很小的孩子在 STEM 实验室里参与一些有趣的项目，这表明他们已经在接受科学、技术和工程方面的教育。与此同时，我发现数学方面的材料和项目却很少。因此，我和[机电一体化][8]领域的优秀教师 Ken Hawthorn 正在着手解决这个问题。

希望我的书能够帮助鼓励学生们在技术上有所创新，无论在形式上是切实的还是虚拟的。同时书中还有很多漂亮的图形，希望能够激励大家去体验编程的过程，并且应用到实际中来。我使用的软件（[Python Processing][9]）是免费的，在树莓派等系统上都可以轻松安装。因为我认为，个人或者学校的成本问题不应该成为学生进入 STEM 世界的门槛。

**DW：** 你有什么想要跟其他的数学老师分享？

**PF：** 如果数学教学机构决定要向学生教导数字推理、逻辑、分析、建模、几何、数据解释这些内容，那么它们应该承认，可以通过编程来实现这些目标。正如我上面所说的，我的教学方法是在尝试使传统枯燥的方法变得直观，我认为任何一位老师都可以做到这一点。他们只需要知道其中的本质做法，就可以使用代码来完成大量重复的工作了。

我的教学方法依赖于一些免费的图形软件，因此只需要知道在哪里找到这些软件包，以及如何使用这些软件包，就可以开始引导学生使用 21 世纪的技术来解决实际问题，将整个过程和结果可视化，并找到更多可以以此实现的模式。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/hacking-math

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://twitter.com/hackingmath
[2]: https://en.wikipedia.org/wiki/Seymour_Papert
[3]: https://en.wikipedia.org/wiki/Turtle_graphics
[4]: https://opensource.com/life/15/8/python-turtle-graphics
[5]: https://nostarch.com/mathadventures
[6]: https://en.wikipedia.org/wiki/Mindstorms_(book)
[7]: http://vpython.org/
[8]: https://en.wikipedia.org/wiki/Mechatronics
[9]: https://processing.org/

