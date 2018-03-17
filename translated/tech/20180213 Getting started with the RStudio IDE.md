RStudio IDE 入门
======

> 用于统计技术的 R 项目是分析数据的有力方式，而 RStudio IDE 则可使这一切更加容易。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming_screen.png?itok=BgcSm5Pl)

从我记事起，我就一直喜欢摆弄数字。作为 20 世纪 70 年代后期的大学生，我上过统计学的课程，学习了如何检查和分析数据以揭示其意义。

那时候，我有一部科学计算器，它让统计计算变得比以往更容易。在 90 年代早期，作为一名从事 <ruby>t 检验<rt>t-test</rt></ruby>、相关性以及 [ANOVA][1] 研究的教育心理学研究生，我开始通过精心编写输入到 IBM 主机的文本文件来进行计算。这个主机远超我的手持计算器，但是一个小的空格错误就会导致整个过程无效，而且这个过程仍然有点乏味。

撰写论文时，尤其是我的毕业论文，我需要一种方法能够根据我的数据来创建图表，并将它们嵌入到文字处理文档中。我着迷于 Microsoft Excel 及其数字运算能力以及可以用计算结果创建出的大量图表。但这条路每一步都有成本。在 20 世纪 90 年代，除了 Excel，还有其他专有软件包，比如 SAS 和 SPSS+，但对于我那已经满满的研究生时间表来说，学习曲线是一项艰巨的任务。

### 快速回到现在

最近，由于我对数据科学的兴趣浓厚，加上对 Linux 和开源软件感兴趣，我阅读了大量的数据科学文章，并在 Linux 会议上听了许多数据科学演讲者谈论他们的工作。因此，我开始对编程语言 R（一种开源的统计计算软件）非常感兴趣。

起初，这只是一个偶发的一个想法。当我和我的朋友 Michael J. Gallagher 博士谈论他如何在他的 [博士论文][2] 研究中使用 R 时，这个火花便增大了。最后，我访问了 [R 项目][3] 的网站，并了解到我可以轻松地安装 [R for Linux][4]。游戏开始！

### 安装 R

根据你的操作系统和发行版情况，安装 R 会稍有不同。请参阅 [Comprehensive R Archive Network][5] （CRAN）网站上的安装指南。CRAN 提供了在 [各种 Linux 发行版][6]，[Fedora，RHEL，及其衍生版][7]，[MacOS][8] 和 [Windows][9] 上的安装指示。

我在使用 Ubuntu，按照 CRAN 的指示，将以下行加入到我的 `/etc/apt/sources.list` 文件中：

```
deb https://<my.favorite.cran.mirror>/bin/linux/ubuntu artful/
```

接着我在终端运行下面命令：

```
$ sudo apt-get update
$ sudo apt-get install r-base
```

根据 CRAN 说明，“需要从源码编译 R 的用户[如包的维护者，或者任何通过 `install.packages()` 安装包的用户]也应该安装 `r-base-dev` 的包。”

### 使用 R 和 RStudio

安装好了 R，我就准备了解更多关于使用这个强大的工具的信息。Gallagher 博士推荐了 [DataCamp][10] 上的 “R 语言入门”，并且我也在 [Code School][11] 找到了适用于 R 新手的免费课程。两门课程都帮助我学习了 R 的命令和语法。我还参加了 [Udemy][12] 上的 R 在线编程课程，并从 [No Starch 出版社][14] 上购买了 [R 之书][13]。

在阅读更多内容并观看 YouTube 视频后，我意识到我还应该安装 [RStudio][15]。Rstudio 是 R 语言的开源 IDE，易于在 [Debian、Ubuntu、 Fedora 和 RHEL][16] 上安装。它也可以安装在 MacOS 和 Windows 上。

根据 RStudio 网站的说明，可以根据你的偏好对 IDE 进行自定义，具体方法是选择工具菜单，然后从中选择全局选项。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_global-options.png?itok=un6-SvS-)

R 提供了一些很棒的演示例子，可以通过在提示符处输入 `demo()` 从控制台访问。`demo(plotmath)` 和 `demo(perspective)` 选项为 R 强大的功能提供了很好的例证。我尝试过一些简单的 [vectors][17] 并在 R 控制台的命令行中绘制，如下所示。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_plotting-vectors.png?itok=9T7UV8p2)

你可能想要开始学习如何将 R 和一些样本数据结合起来使用，然后将这些知识应用到自己的数据上得到描述性统计。我自己没有丰富的数据来分析，但我搜索了可以使用的数据集 [datasets][18]；有一个这样的数据集（我并没有用这个例子）是由圣路易斯联邦储备银行提供的 [经济研究数据][19]。我对一个题为“美国商业航空公司的乘客里程（1937-1960）”很感兴趣，因此我将它导入 RStudio 以测试 IDE 的功能。RStudio 可以接受各种格式的数据，包括 CSV、Excel、SPSS 和 SAS。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/rstudio-import.png?itok=1yJKQei1)

数据导入后，我使用 `summary(AirPassengers)` 命令获取数据的一些初始描述性统计信息。按回车键后，我得到了 1949-1960 年的每月航空公司旅客的摘要以及其他数据，包括飞机乘客数量的最小值、最大值、四分之一位数、四分之三位数、中位数以及平均数。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_air-passengers.png?itok=RCJMLIb3)

我从摘要统计信息中知道航空乘客样本的均值为 280.3。在命令行中输入 `sd(AirPassengers)` 会得到标准偏差，在 RStudio 控制台中可以看到：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_sd-air-passengers.png?itok=d-25fQoz)

接下来，我生成了一个数据直方图，通过输入 `hist(AirPassengers);` 得到，这会以图形的方式显示此数据集；RStudio 可以将数据导出为 PNG、PDF、JPEG、TIFF、SVG、EPS 或 BMP。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_histogram-air-passengers.png?itok=0HWsseQE)

除了生成统计数据和图形数据外，R 还记录了我所有的历史操作。这使得我能够返回先前的操作，并且我可以保存此历史记录以供将来参考。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_history.png?itok=50jaFPU4)

在 RStudio 的脚本编辑器中，我可以编写我发出的所有命令的脚本，然后保存该脚本以便在我的数据更改后能再次运行，或者想重新访问它。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_script-editor.png?itok=eiE1_bnX)

### 获得帮助

在 R 提示符下输入 `help()` 可以很容易找到帮助信息。输入你正在寻找的信息的特定主题可以找到具体的帮助信息，例如 `help(sd)` 可以获得有关标准差的帮助。通过在提示符处输入 `contributors()` 可以获得有关 R 项目贡献者的信息。您可以通过在提示符处输入 `citation()` 来了解如何引用 R。通过在提示符出输入 `license()` 可以很容易地获得 R 的许可证信息。

R 是在 GNU General Public License（1991 年 6 月的版本 2，或者 2007 年 6 月的版本 3）的条款下发布的。有关 R 许可证的更多信息，请参考 [R 项目官网][20]。

另外，RStudio 在 GUI 中提供了完美的帮助菜单。该区域包括 RStudio 快捷表（可作为 PDF 下载），[RStudio][21]的在线学习、RStudio 文档、支持和 [许可证信息][22]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/getting-started-RStudio-IDE

作者：[Don Watkins][a]
译者：[szcf-weiya](https://github.com/szcf-weiya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://en.wikipedia.org/wiki/Analysis_of_variance
[2]:https://www.michael-j-gallagher.com/high-performance-computing
[3]:https://www.r-project.org/
[4]:https://cran.r-project.org/index.html
[5]:https://cran.r-project.org/
[6]:https://cran.r-project.org/bin/linux/
[7]:https://cran.r-project.org/bin/linux/redhat/README
[8]:https://cran.r-project.org/bin/macosx/
[9]:https://cran.r-project.org/bin/windows/
[10]:https://www.datacamp.com/onboarding/learn?from=home&technology=r
[11]:http://tryr.codeschool.com/levels/1/challenges/1
[12]:https://www.udemy.com/r-programming
[13]:https://nostarch.com/bookofr
[14]:https://opensource.com/article/17/10/no-starch
[15]:https://www.rstudio.com/
[16]:https://www.rstudio.com/products/rstudio/download/
[17]:http://www.r-tutor.com/r-introduction/vector
[18]:https://vincentarelbundock.github.io/Rdatasets/datasets.html
[19]:https://fred.stlouisfed.org/
[20]:https://www.r-project.org/Licenses/
[21]:https://www.rstudio.com/online-learning/#R
[22]:https://support.rstudio.com/hc/en-us/articles/217801078-What-license-is-RStudio-available-under-
