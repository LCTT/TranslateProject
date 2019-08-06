[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11064-1.html)
[#]: subject: (IPython is still the heart of Jupyter Notebooks for Python developers)
[#]: via: (https://opensource.com/article/19/6/ipython-still-heart-jupyterlab)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg/users/marcobravo)

对 Python 开发者而言，IPython 仍然是 Jupyter Notebook 的核心
======

> Jupyter 项目提供的魔法般的开发体验很大程度上得益于它的 IPython 基因。

![](https://img.linux.net.cn/data/attachment/album/201907/06/131704z1lsfssamfxrrliq.jpg)

最近刚刚写过我为什么觉得觉得 Jupyter 项目（特别是 JupyterLab）提供了一种 [魔法般的 Python 开发体验][2]。在研究这些不同项目之间的关联的时候，我回顾了一下 Jupyter 最初从 IPython 分支出来的这段历史。正如 Jupyter 项目的 [大拆分™ 声明][3] 所说:

> “如果你不明白 Jupyter 是什么，这么说吧，它拥有和 IPython 同样的代码，并且是由同一批人开发的，只不过取了一个新名字、安了一个新家。”

下面这个注脚进一步说明了这一点：

> “我从声明中解读出来的信息是，‘Jupyter 和 IPython 非常相似，但是拥有多种语言’，这也可以很好地解释为什么这个项目的名字已经不再需要包含 Python，因为当时它已经支持多种语言了。”

我明白 Jupyter Notebook 和 IPython 都是从同样的源代码里分支出来的，但是不太清楚 IPython 项目的现状。在大拆分™ 之后它是已经不再被需要了，还是在以另一种方式延续着？

后来我惊讶地发现，IPython 仍然不断在为 Python 使用者提供价值，它正是 Jupyter 体验的核心部分。下面是 Jupyter 常见问题页面的一段截取：

> **有什么语言是需要预装的吗？**
>
> 是的，安装 Jupyter Notebook 会首先安装 IPython 内核。这样我们就可以在 notebook 上运行 Python 语言了。

现在我明白了，在 JupyterLab（以及 Jupyter Notebook）上编写 Python 程序仍然需要依赖 IPython 内核的持续开发。不仅如此，IPython 还充当了最为强大的默认内核的角色，根据 [这份文档][4]，它是其它语言内核之间的枢纽，节省了很多开发时间和精力。

现在唯一的问题是，IPython 本身可以做什么呢？

### IPython 如今的作用

IPython 提供了一个强大的、交互性的 Python shell，以及 Jupyter 的内核。安装完成之后，我可以在任何命令行运行 `ipython` 本身，将它当作一个（比默认 Python shell 好太多的）Python shell 来使用：


```
$ ipython
Python 3.7.3 (default, Mar 27 2019, 09:23:15)
Type 'copyright', 'credits' or 'license' for more information
IPython 7.4.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: import numpy as np
In [2]: example = np.array([5, 20, 3, 4, 0, 2, 12])
In [3]: average = np.average(example)
In [4]: print(average)
6.571428571428571
```

这就让我们发现了一个更为重要的问题：是 IPython 让 JupyterLab 可以在项目中执行代码，并且支持了一系列被称为 *Magic* 的功能（感谢 Nicholas Reith 在我上一篇文章的评论里提到这点）。

### IPython 让魔法成为现实

JupyterLab 和其它使用 IPython 的前端工具可以让你感觉像是在最喜欢的 IDE 或者是终端模拟器的环境下工作。我非常喜欢 [点文件][5] 快捷键功能，Magic 也有类似点文件的特征。比如说，可以试一下 [%bookmark][6] 这个命令。我把默认开发文件夹 `~/Develop` 关联到了一个可以在任何时候直接跳转的快捷方式上。

![Screenshot of commands from JupyterLab][7]

`%bookmark`、`%cd`，以及我在前一篇文章里介绍过的 `!` 操作符，都是由 IPython 支持的。正如这篇 [文档][8] 所说：

> Jupyter 用户你们好：Magic 功能是 IPython 内核提供的专属功能。一个内核是否支持 Magic 功能是由该内核的开发者针对该内核所决定的。

### 写在最后

作为一个好奇的新手，我之前并不是特别确定 IPython 是否仍然和 Jupyter 生态还有任何联系。现在我对 IPython 的持续开发有了新的认识和，并且意识到它正是 JupyterLab 强大的用户体验的来源。这也是相当有才华的一批贡献者进行最前沿研究的成果，所以如果你在学术论文中使用到了 Jupyter 项目的话别忘了引用他们。为了方便引用，他们还提供了一个 [现成的引文][9]。

如果你在考虑参与哪个开源项目的贡献的话，一定不要忘了 IPython 哦。记得看看 [最新发布说明][10]，在这里可以找到 Magic 功能的完整列表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/ipython-still-heart-jupyterlab

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ilovefs_free_sticker_fsfe_heart.jpg?itok=gLJtaieq (I love Free Software FSFE celebration)
[2]: https://opensource.com/article/19/5/jupyterlab-python-developers-magic
[3]: https://blog.jupyter.org/the-big-split-9d7b88a031a7
[4]: https://jupyter-client.readthedocs.io/en/latest/kernels.html
[5]: https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments
[6]: https://ipython.readthedocs.io/en/stable/interactive/magics.html?highlight=magic#magic-bookmark
[7]: https://opensource.com/sites/default/files/uploads/jupyterlab-commands-ipython.png (Screenshot of commands from JupyterLab)
[8]: https://ipython.readthedocs.io/en/stable/interactive/magics.html
[9]: https://ipython.org/citing.html
[10]: https://ipython.readthedocs.io/en/stable/whatsnew/index.html
