面向数据科学的 Anaconda Python 入门
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)
像很多人一样，我一直努力加入到快速发展的数据科学领域。我上过 Udemy 的 [R][1] 及 [Python][2] 语言编程课，那时我分别下载并安装了应用程序。当我试图解决各种依赖关系，安装类似 [Numpy][3] 和 [Matplotlib][4] 这样的数据科学扩展包时，我了解了 [Anaconda Python 发行版][5]。

Anaconda 是一个完备、[开源][6]的数据科学包，拥有超过 600 万社区用户。[下载][7]和安装 Anaconda 都很容易，支持的操作系统包括 Linux, MacOS 及 Windows。

我感谢 Anaconda 降低了初学者的学习门槛。发行版自带 1000 多个数据科学包以及 [Conda][8] 包和虚拟环境管理器，让你无需单独学习每个库的安装方法。就像 Anaconda 官网上提到的，“Anaconda 库中的 Python 和 R 语言的conda 包是我们在安全环境中修订并编译得到的优化二进制程序，可以在你系统上工作”。

我推荐使用 [Anaconda Navigator][9]，它是一个桌面 GUI (graphical user interface) 系统，包含发行版自带应用的链接，包括[RStudio][10], [iPython][11], [Jupyter Notebook][12], [JupyterLab][13], [Spyder][14], [Glue][15] 和 [Orange][16]。默认环境采用 Python 3.6，但你可以轻松安装 Python 3.5, Python 2.7 或 R。[文档][16]十分详尽，而且用户社区极好，可以提供额外的支持。

### 安装 Anaconda

为在我的 Linux 笔记本 (I3 CPU，4GB 内存) 上安装 Anaconda，我下载了 Anaconda 5.1 Linux 版安装器并运行 `md5sum` 进行文件校验：
```
$ md5sum Anaconda3-5.1.0-Linux-x86_64.sh

```

接着按照[安装文档][17]的说明，无论是否在 Bash shell 环境下，执行如下 shell 命令：
```
$ bash Anaconda3-5.1.0-Linux-x86_64.sh

```

我完全按照安装指南操作，运行这个精心编写的脚本，大约花费 5 分钟可以完成安装。安装过程中会提示：“是否希望安装器将 Anaconda 的安装路径加入到你的 `/home/<user>/.bashrc`？我选择允许并重启了 shell，这会让 `.bashrc` 中的环境变量生效。

安装完成后，我启动了 Anaconda Navigator，具体操作是在 shell 中执行如下命令：
```
$ anaconda-navigator

```

Anaconda Navigator 每次启动时会检查是否有可更新的软件包，如果有，会提醒你进行更新。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-update.png?itok=wMk78pGQ)

按照提醒进行更新即可，无需使用命令行。Anaconda 初次启动会有些慢，如果涉及更新会额外花费几分钟。

当然，你也可以通过执行如下命令手动更新：

```
$ conda update anaconda-navigator

```

### 浏览和安装应用

Navigator 启动后，可以很容易地浏览 Anaconda 发行版包含的应用。按照文档所述，64 位 Python 3.6 版本的 Anaconda [支持 499 个软件包][18]。我浏览的第一个应用是 [Jupyter QtConsole][19]，这个简单易用的 GUI 支持内联数据 (inline figures) 和语法高亮。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-jupyterqtconsole.png?itok=fQQoErIO)

发行版中包含 Jupyter Notebook，故（不像我用的其它 Python 环境那样）无需在发行版外安装。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-jupyternotebook.png?itok=VqvbyOcI)

我习惯使用的 RStudio 并没有默认安装，但安装它也仅需点击一下鼠标。其它应用的启动或安装也仅需点击一下鼠标，包括 JupyterLab, Orange, Glue 和 Spyder 等。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-otherapps.png?itok=9QmSUdel)

Anaconda 发行版的一个强大功能是创建多套环境。假如我需要创建一套与默认 Python 3.6 不同的 Python 2.7 的环境，可以在 shell 中执行如下命令：
```
$ conda create -n py27 python=2.7 anaconda

```

Conda 负责整个安装流程，如需启动它，仅需在 shell 中执行如下命令：
```
$ anaconda-navigator

```

在 Anaconda GUI 的 "Applications on" 下拉菜单中选取 **py27** 即可。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-navigator.png?itok=2i5qYAyG)

### 更多内容

如果你想了解更多关于 Anaconda 的信息，可供参考的资源十分丰富。不妨从检索 [Anaconda 社区][20]及对应的[邮件列表][21]开始。

你是否在使用 Anaconda 发行版及 Navigator 呢？欢迎在评论中留下你的使用感想。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/getting-started-anaconda-python

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://www.r-project.org/
[2]:https://www.python.org/
[3]:http://www.numpy.org/
[4]:https://matplotlib.org/
[5]:https://www.anaconda.com/distribution/
[6]:https://docs.anaconda.com/anaconda/eula
[7]:https://www.anaconda.com/download/#linux
[8]:https://conda.io/
[9]:https://docs.anaconda.com/anaconda/navigator/
[10]:https://www.rstudio.com/
[11]:https://ipython.org/
[12]:http://jupyter.org/
[13]:https://blog.jupyter.org/jupyterlab-is-ready-for-users-5a6f039b8906
[14]:https://spyder-ide.github.io/
[15]:http://glueviz.org/
[16]:https://orange.biolab.si/
[17]:https://docs.anaconda.com/anaconda/install/linux
[18]:https://docs.anaconda.com/anaconda/packages/py3.6_linux-64
[19]:http://qtconsole.readthedocs.io/en/stable/
[20]:https://www.anaconda.com/community/
[21]:https://groups.google.com/a/continuum.io/forum/#!forum/anaconda
