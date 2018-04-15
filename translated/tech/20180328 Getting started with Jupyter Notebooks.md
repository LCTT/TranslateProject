Jupyter Notebooks 入门
=====
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)
自从 papyrus 发布以来，出版社一直在努力以吸引读者的方式来格式化数据。在数学、科学、和编程领域，这是一个特别的问题，设计良好的图表、插图和方程式可以成为帮助人们理解技术信息的关键。

[Jupyter Notebook][1] 通过重新构想我们如何制作教学文本来解决这个问题。Jupyter （我在 2017 年 10 月在 [All Things Open][2] 上首次了解到）是一款开源应用程序，它使用户能够创建包含实时代码，方程式，可视化和文本的交互式共享笔记本。

Jupyter 从 [IPython 项目][3]发展而来，该项目具有交互式 shell 和基于浏览器的笔记本，支持代码，文本和数学表达式。Jupyter 支持超过 40 种编程语言，包括 Python，R 和 Julia，其代码可以导出为 HTML,LaTeX,PDF，图像和视频，或者作为 [IPyhton][4] 笔记本与其他用户共享。

一个有趣的事实是："Jupyter" 是 "Julia, Python, 和 R" 的缩写。

根据 Jupyter 项目网站介绍，它的一些用途包括“数据清理和转换，数值模拟，统计建模，数据可视化，机器学习等等”。科学机构正在使用 Jupyter Notebooks 来解释研究结果。代码可以来自实际数据，可以调整和重新调整以可视化成不同的结果和情景。通过这种方式，Jupyter Notebooks 已成为生动的文本和报告。

### 安装并开始 Jupyter

Jupyter 软件是开源的，在[修改过的 BSD 许可证][5] 下获得许可,它可以[安装在 Linux，MacOS 或 Windows 上][6]。有很多种方法可以安装 Jupyter；我尝试在 Linux 和 MacOS 上安装 PIP 和 [Anaconda][7]。PIP 安装要求你的计算机上已经安装了 Python；Jupyter 推荐 Python 3。

由于 Python 3 已经安装在我的电脑上，我通过在终端（在 Linux 或 Mac 上）运行以下命令来安装 Jupyter：

```
$ python3 -m pip install --upgrade pip

$ python3 -m pip install jupyter

```

在终端提示种输入以下命令立即启动应用程序：
```
$ jupyter notebook

```

很快，我的浏览器打开并显示了我的 Jupyter Notebook 服务器在 `http://localhost:8888`。（支持的浏览器有 Google Chrome,Firefox 和 Safari）

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_1.png?itok=UyM1GuVG)

在右上角有一个标有 “New” 的下拉菜单，它使我能够根据自己的指示和代码快速创建新的笔记本。请注意，我的新笔记本默认为 Python 3，这是我目前的环境。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_2.png?itok=alDI432q)

一个带有一些默认值的新笔记本，它可以被改变（包括笔记本的名字），打开它。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_3.png?itok=9zjG-5JC)
笔记本有两种不同的模式：命令和编辑。命令模式允许你添加或删除单元格。你可以通过按下 Escape 键进入命令模式，按 Enter 键或单击单元格进入编辑模式。

单元格周围的绿色突出显示你处于编辑模式，蓝色突出显示你处于命令模式。以下笔记本处于命令模式并准备好执行单元中的 Python 代码。注意，我已将笔记本的名称更改为 First Notebook。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_4.png?itok=-QPxcuFX)

### 使用 Jupyter

Jupyter Notebooks 的强大之处在于除了能够输入代码之外，你还可以将 Markdown 与叙述性和解释性文本相结合。我想添加一个标题，所以我在代码上面添加了一个单元格，并在 Markdown 中输入了一个标题。当我按下 `Ctrl+Enter` 时，我的标题转换为 HTML。（译注：或者可以按下 Run 按钮。）

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_5.png?itok=-sr9A8-W)

我可以通过在命令前追加 `!` 来添加 Bash 命令或脚本的输出。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_6.png?itok=o_g38ECp)

我也可以利用 IPython 的  [line magic 和 cell magic][8] 命令。你可以通过在代码单元内附加 `%` 或 `%%` 符号来列出魔术命令。例如，`%lsmagic` 产生所有可用于 Jupyter notebooks 的魔法命令。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/jupyter_7.png?itok=uit0PtND)

这些魔术命令的例子包括 `%pwd`,它输出当前工作目录（例如 `/Users/YourName`）和  `%ls`,它列出当前工作目录中的所有文件和子目录。另一个神奇命令显示从笔记本中的 `matplotlib` 生成的图表。`%%html` 将该单元格中的任何内容呈现为 HTML，这对嵌入视频和链接很有用，还有 JavaScript 和 Bash 的单元魔术命令。

如果你需要更多关于使用 Jupyter Notebooks 和它的特性的信息，帮助部分是非常完整的。

人们用许多有趣的方式使用 Jupyter Notebooks;你可以在这个 [gallery][9] 里找到一些很好的例子。你如何使用Jupyter笔记本？请在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/getting-started-jupyter-notebooks

作者：[Don Watkins][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:http://jupyter.org/
[2]:https://allthingsopen.org/
[3]:http://ipython.org/
[4]:https://en.wikipedia.org/wiki/IPython
[5]:https://opensource.org/licenses/BSD-3-Clause
[6]:http://jupyter.org/install.html
[7]:https://www.anaconda.com/download/#linux
[8]:http://ipython.readthedocs.io/en/stable/interactive/magics.html
[9]:https://github.com/jupyter/jupyter/wiki/a-gallery-of-interesting-jupyter-notebooks#mathematics
