[#]: collector: (lujun9972)
[#]: translator: (guevaraya)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11331-1.html)
[#]: subject: (How to Install and Use R on Ubuntu)
[#]: via: (https://itsfoss.com/install-r-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何在 Ubuntu 上安装和使用 R 语言
======

> 这个教程指导你如何在 Ubuntu 上安装 R 语言。你也将同时学习到如何在 Ubuntu 上用不同方法运行简单的 R 语言程序。

[R][1]，和 Python 一样，它是在统计计算和图形处理上最常用的编程语言，易于处理数据。随着数据分析、数据可视化、数据科学（机器学习热）的火热化，对于想深入这一领域的人来说，它是一个很好的工具。

R 语言的优点是它的语法非常简练，你可以找到它的很多实际使用的教程或指南。

本文将介绍包含如何在 Ubuntu 下安装 R 语言，也会介绍在 Linux 下如何运行第一个 R 程序。

![][2]

### 如何在 Ubuntu 上安装 R 语言

R 默认在 Ubuntu 的软件库里。用以下命令很容易安装：

```
sudo apt install r-base
```

请注意这可能会安装一个较老的版本。在我写这篇文字的时候，Ubuntu 提供的是 3.4，但是最新的是3.6。

*我建议除非你必须使用最新版本，否则直接使用 Ubuntu 的配套版本。*

#### 如何在 Ubuntu 上安装最新 3.6 版本的 R 环境

如果想安装最新的版本（或特殊情况指定版本），你必须用 [CRAN][3]（Comprehensive R Archive Network）。这个是 R 最新版本的镜像列表。

如需获取 3.6 的版本，需要添加镜像到你的源索引里。我已经简化其命令如下：

```
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran35/"
```

下面你需要添加密钥到服务器中：

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
```

然后更新服务器信息并安装R环境：

```
sudo apt update
sudo apt install r-base
```

就这样安装完成。

### 如何在 Ubuntu 下使用 R 语言编程

R 的用法多样，我将介绍运行多个运行 R 语言的方式。

#### R 语言的交互模式

安装了 R 语言后，你可以在控制台上直接运行：

```
R
```

这样会打开交互模式：

![R Interactive Mode][5]

R 语言的控制台与 Python 和 Haskell 的交互模式很类似。你可以输入 R 命令做一些基本的数学运算，例如：

```
> 20+40
[1] 60

> print ("Hello World!")
[1] "Hello World!"
```

你可以测试绘图：

![R Plotting][6]

如果想退出可以用 `q()`或按下 `CTRL+c`键。接着你会被提示是否保存工作空间镜像；工作空间是创建变量的环境。

#### 用 R 脚本运行程序

第二种运行 R 程序的方式是直接在 Linux 命令行下运行。你可以用 `RScript` 执行，它是一个包含 `r-base` 软件包的工具。

首先，你需要用你在 [Linux 下常用的编辑器][7]保存 R 程序到文件。文件的扩展名必须是 `.r`。

下面是一个打印 “Hello World” 的 R 程序。你可以保存其为 `hello.r`。

```
print("Hello World!")
a <- rnorm(100)
plot(a)
```

用下面命令运行 R 程序：

```
Rscript hello.r
```

你会得到如下输出结果：

```
[1] "Hello World!"
```

结果将会保存到当前工作目录，文件名为 `Rplots.pdf`：

![Rplots.pdf][8]

小提示：`Rscript` 默认不会加载 `methods` 包。确保在脚本中[显式加载][9]它。

#### 在 Ubuntu 下用 RStudio 运行 R 语言

最常见的 R 环境是 [RStudio][10]，这是一个强大的跨平台的开源 IDE。你可以用 deb 文件在 Ubuntu 上安装它。下载 deb 文件的链接如下。你需要向下滚动找到 Ubuntu 下的 DEB 文件。

- [下载 Ubuntu 的 Rstudio][12]

下载了 DEB 文件后，直接点击安装。

下载后从菜单搜索启动它。程序主界面会弹出如下：

![RStudio 主界面][13]

现在可以看到和 R 命令终端一样的工作台。

创建一个文件：点击顶栏 “File” 然后选择 “New File > Rscript”（或 `CTRL+Shift+n`）：

![RStudio 新建文件][15]

按下 `CTRL+s` 保存文件选择路径和命名：

![RStudio 保存文件][16]

这样做了后，点击 “Session > Set Working Directory > To Source File Location” 修改工作目录为你的脚本路径：

![RStudio 工作目录][17]

现在一切准备就绪！编写代码然后点击运行。你可以在控制台和图形窗口看到结果：

![RStudio 运行][18]

### 结束语

这篇文章中展示了如何在 Ubuntu 下使用 R 语言。包含了以下几个方面：R 控制台 —— 可用于测试，Rscript —— 终端达人操作，RStudio —— 你想要的 IDE。

无论你正在从事数据科学或只是热爱数据统计，作为一个数据分析的完美工具，R 都是一个比较好的编程装备。

你想使用 R 吗？你入门了吗？让我们了解你是如何学习 R 的以及为什么要学习 R!

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-r-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.r-project.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/install-r-on-ubuntu.jpg?resize=800%2C450&ssl=1
[3]: https://cran.r-project.org/
[4]: https://itsfoss.com/bootable-windows-usb-linux/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/r_interactive_mode.png?fit=800%2C516&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/r_plotting.jpg?fit=800%2C434&ssl=1
[7]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/rplots_pdf.png?fit=800%2C539&ssl=1
[9]: https://www.dummies.com/programming/r/how-to-install-load-and-unload-packages-in-r/
[10]: https://www.rstudio.com/
[11]: https://itsfoss.com/install-deb-files-ubuntu/
[12]: https://www.rstudio.com/products/rstudio/download/#download
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_home.jpg?fit=800%2C603&ssl=1
[14]: https://itsfoss.com/python-setup-linux/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_new_file.png?fit=800%2C392&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_save_file.png?fit=800%2C258&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_working_directory.png?fit=800%2C394&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_run.jpg?fit=800%2C626&ssl=1
[19]: https://i1.wp.com/images-na.ssl-images-amazon.com/images/I/51oIJTbUlnL._SL160_.jpg?ssl=1
[20]: https://www.amazon.com/Learn-R-Day-Steven-Murray-ebook/dp/B00GC2LKOK?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B00GC2LKOK (Learn R in a Day)
[21]: https://www.amazon.com/Learn-R-Day-Steven-Murray-ebook/dp/B00GC2LKOK?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B00GC2LKOK (Buy on Amazon)

