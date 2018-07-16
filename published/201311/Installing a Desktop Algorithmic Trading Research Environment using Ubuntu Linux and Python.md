在Ubuntu下用Python搭建桌面算法交易研究环境
====================================

这篇文章将讨论在ubuntu下，使用Python编程语言来搭建一个强大、高效和易交互的算法交易策略研究环境。我们后继的算法交易文章都将利用此环境。

搭建此环境需要安装以下软件,它们都是开源且免费下载的:

- [Oracle VirtualBox][1] - 用于虚拟操作系统
- [Ubuntu Desktop Linux][2] - 作为我们的虚拟操作系统
- [Python][3] - 核心编程环境
- [NumPy][4]/[SciPy][5] - 用于快速、高效的数组和矩阵运算
- [IPython][6] - 用于Python的可视化交互开发
- [matplotlib][7] - 用于数据的图形可视化
- [pandas][8] - 用于数据“冲突”和时间序列分析
- [scikit-learn][9] - 用于机器学习和人工智能算法

这些工具（配合合适的 [证券master数据库][10]），将使我们能够创建一个快速可交互的策略研究环境。Pandas是专为数据“冲突”设计的，它可以高效地导入和清洗时间序列数据。NumPy/SciPy在底层运行，使得系统被很好的优化。IPython/matplotlib (以及qtconsole，详见下文)使结果可视化可交互并快速迭代。scikit-learn可让我们将机器学习技术应用到我们的策略中，以进一步提高性能。

请注意，我写这篇教程是为了那些无法或不愿意直接安装ubuntu系统的windows或Mac OSX用户，通过VirtualBox来搭建此环境。VirtualBox使我们可在主控操作系统中创建一个虚拟机，可模拟guest操作系统，而丝毫不影响主控操作系统。由此我们可以在完整安装Ubuntu前练习Ubuntu和Python工具。如果已经安装Ubuntu桌面系统，可直接跳到“在Ubuntu下安装Python研究环境包”这一节。

##安装VirtualBoX和Ubuntu Linux##

Mac OSX操作系统上关于VirtualBox安装的部分已经写过了，这里将简单的移到Windows环境中。一旦各种主控操作系统下的VirtualBox安装完毕，其它过程就都一样了。

开始安装前，我们需要先下载Ubuntu和VirtualBox。

**下载Ubuntu桌面磁盘镜像**

打开Web浏览器，导航到[Ubuntu 桌面][11]主页，然后选择Ubuntu 13.04：

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0004.png)

*下载Ubuntu13.04（64位（如适用））*

你会被问及是否愿意捐赠一些money，不过这个是可选的。进入下载页面后选择Ubuntu 13.04。你需要选择是否要下载32位或64位版本。很可能你是64位系统，但如果你有疑问，那么选择32位。在Mac OSX系统上，Ubuntu桌面ISO磁盘镜像将保存到Downloads目录下。安装VirtualBox后我们就要用到它了。


**下载和安装VirtualBox**

现在，我们已经下载了Ubuntu ，接下来需要去获取最新版本的Oracle的VirtualBox软件。点击[这里][12]访问该网站，选择你的特定主机的版本（本教程要求Mac OSX版本）

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0002.png)

*Oracle VirtualBox下载页面*

一旦文件下载完毕，我们点击安装包图标运行（Windows上会有些不同，但是类似）：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0007.png)

*双击安装包图标，安装VirtualBox*

打开后，按照安装说明操作，保持默认（除非你觉得有必要修改他们！）。VirtualBox安装完毕后，可从Applications文件夹中打开（可通过Finder搜索到）。VirtualBox运行过程中它的图标将出现在下面的Dock栏里,如果你以后想经常以虚拟机方式使用Ubuntu,你可以将VirtualBox图标永久保存在Dock栏中:


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0008.png)

*还没有磁盘镜像的VirtualBox*

点击“新建”（类似齿轮的图标）,创建一个新的“virtual box”(例如，虚拟操作系统),命名为"Ubuntu Desktop 13.04 Algorithmic Trading"(你可以使用别的类似的描述):

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0009.png)

*命名我们的新虚拟环境*

分配虚拟机内存.因为是测试系统,所以我只分配了512Mb.一个实际的backtesting引擎因为效率原因可能需要本地安装(因此需分配多的多的内存):

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0010.png)

*选择虚拟磁盘的RAM量*

创建虚拟硬盘,大小为推荐的8Gb,动态生成VirtualBox磁盘镜像,名字同上:

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0011.png)

*选择镜像所使用的硬盘类型*

完整系统的详细信息如下: 

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0012.png)

*已经创建的虚拟镜像*

现在我们需要在VirtualBox中为新的磁盘镜像包含一个虚拟的'CD驱动器',这样就可以假装从这张光盘驱动器引导我们的Ubuntu磁盘镜像。在Settings里点击“Storage”选项卡，并添加一个磁盘。选择Downloads目录下的Ubuntu磁盘镜像ISO文件（或者其他你下载Ubuntu的目录），选择Ubuntu ISO镜像，并保存设置。

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0014.png)

*在第一次启动时选择Ubuntu桌面ISO*

一切就绪，准备启动Ubuntu镜像并安装。点击“Start”，当出现主机捕获鼠标或键盘消息时点击“Ok”。在我的Mac OSX系统中，主机捕获键是左边的Cmd键（即左Apple键）。现在出现在你眼前的就是Ubuntu桌面安装界面，点击“Install Ubuntu”：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0015.png)

*点击 "Install Ubuntu "开始安装*

确保勾选两个框，安装专有的MP3和Wi-Fi驱动程序：

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0016.png)

*安装MP3和Wi-Fi的专用驱动程序*

现在，您将看到一个界面，询问你想如何保存操作系统创建过程中的的数据。不要惊慌于“Erase Disk and Install Ubuntu”的选项。这并不意味着它会删除你的普通硬盘！它实际上指的是运行Ubuntu的虚拟磁盘，这是安全擦除（反正里面没有什么内容，因为是我们刚刚创建的）。继续进行安装，将出现询问位置的界面，随后，又将出现选择键盘布局的界面：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0017.png)

*选择您所在的地理位置*

输入您的用户凭据，请务必记住您的密码，以后安装软件包的时候需要它：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0018.png)

*输入您的用户名和密码（此密码是管理员密码）*

现在， Ubuntu将安装文件。它应该是比较快的，因为它是从硬盘复制到硬盘！完成后VirtualBox将重启。如果不自行重启，你可以去菜单强制重启。接下来将回到Ubuntu的登录界面：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0019.png)

*Ubuntu桌面登录界面*

用您的用户名和密码登录，你将看到闪亮的新的Ubuntu桌面：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0020.png)

*Ubuntu桌面登录后的整体界面*

最后需要做的事是点击火狐图标，通过访问一个网站（我选择QuantStart.com，有意思吧！），来测试互联网/网络功能正常：


![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0021.png)

*Ubuntu中的火狐浏览器

现在Ubuntu桌面已经安装完毕，接下来，我们就可以开始安装算法交易研究环境软件包。

## 在Ubuntu上安装Python研究环境软件包  

点击左上角的搜索按钮，在输入框里输入“Terminal”，弹出命令行界面。双击终端图标启动终端：

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0022.png)

**Ubuntu中的终端界面*

所有后续的命令都在此终端输入。

任何崭新的Ubuntu Linux系统上做的第一件事就是更新和升级软件包。前者告诉Ubuntu可用的新软件包有哪些，后者用新版的软件包替换旧版的。运行下列命令（你将被提示输入您的密码） ：


    sudo apt-get -y update
    sudo apt-get -y upgrade

*-y前缀告诉Ubuntu接受所有回答“是/否”的问题为'是'。 “sudo”是一个Ubuntu/Debian Linux的命令，允许以管理员权限执行其他命令。由于我们将在站点范围安装软件包，我们需要机器的root权限，因此必须使用'sudo'*

你可能会在这里得到一个错误消息：

    E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)

为了解决这个问题，再次运行"sudo apt-get -y update"，如果它不起作用，你可以在该站点([http://penreturns.rc.my/2012/02/could-not-get-lock-varlibaptlistslock.html][13])上查看是否有其他的命令。

一旦这两个更新命令成功执行，接下来我们需要安装Python，NumPy/SciPy，matplotlib，pandas，scikit-learn和IPython。我们将从Python开发包和编译器开始安装，编译器将在编译所有软件的时候用到：

    sudo apt-get install python-pip python-dev python2.7-dev build-essential liblapack-dev libblas-dev

一旦必要的软件包已安装，我们就可以通过pip，即Python包管理器，安装NumPy。pip将下载NumPy的zip包，然后从源代码编译。请记住，编译需要花费一些时间，大概10-20分钟！

    sudo pip install numpy

NumPy安装完了后,我们需要在继续之前检查它是否可用。如果你仔细看终端，你会发现计算机名后面跟了你的用户名。比如我的是`mhallsmoore@algobox`，随后是提示符。在提示符下键入`python`，然后试着导入NumPy。我们将计算一个列表的平均值,以测试NumPy是否可用:

    mhallsmoore@algobox:~$ python
    Python 2.7.4 (default, Sep 26 2013, 03:20:26)
    [GCC 4.7.3] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import numpy
    >>> from numpy import mean
    >>> mean([1,2,3])
    2.0
    >>> exit()

现在，我们已成功安装NumPy，接下来要安装Python的科学库,即SciPy。然而，它有一些依赖的软件包，包括ATLAS库和GNU Fortran编译器：

    sudo apt-get install libatlas-base-dev gfortran

现在,我们将通过pip安装SciPy.这将需要相当长的时间（约20分钟，这取决于你的电脑），所以也许你可以去喝杯咖啡先：

    sudo pip install scipy

唷！现在已安装SciPy。让我们通过计算一个整数列表的标准差来测试SciPy是否可以正常使用：

    mhallsmoore@algobox:~$ python
    Python 2.7.4 (default, Sep 26 2013, 03:20:26)
    [GCC 4.7.3] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import scipy
    >>> from scipy import std
    >>> std([1,2,3])
    0.81649658092772603
    >>> exit()

接下来我们需要安装matplotlib的依赖包，Python的图形库。 由于matplotlib是一个Python包，无法使用pip去安装以下PNG，JPEG文件和FreeType字体库相关的库，所以我们需要Ubuntu为我们安装：

    sudo apt-get install libpng-dev libjpeg8-dev libfreetype6-dev

现在我们可以安装matplotlib了:

    sudo pip install matplotlib

我们将安装数据分析和机器学习库,pandas和scikit-learn.这步不需要安装额外的依赖库, 因为NumPy和SciPy已经将依赖都覆盖了.

    sudo pip install -U scikit-learn
    sudo pip install pandas

我需要测试scikit-learn:

    mhallsmoore@algobox:~$ python
    Python 2.7.4 (default, Sep 26 2013, 03:20:26)
    [GCC 4.7.3] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> from sklearn load datasets
    >>> iris = datasets.load_iris()
    >>> iris
    ..
    ..
    'petal width (cm)']}
    >>>

另外,我们需要测试pandas:

    >>> from pandas import DataFrame
    >>> pd = DataFrame()
    >>> pd
    Empty DataFrame
    Columns: []
    Index: []
    >>> exit()

最后, 我们需要安装IPython.这是一个交互式的Python解释器，它相比标准的Python控制台，提供了一个更精简的工作流。在以后的教程中，我将讲述IPython在算法交易开发中的完整用途：

    sudo pip install ipython

虽然IPython本身已经相当有用，它通过包含qtconsole可以有更强大的能力,qtconsole提供了内联matplotlib可视化的能力。尽管如此，它需要多一点点的工作以使它启动和运行。

首先，我们需要安装[Qt库][14]。对于这一点，你可能需要更新你的软件包（我做了！）：

    sudo apt-get update

现在我们可以安装Qt了:

    sudo apt-get install libqt4-core libqt4-gui libqt4-dev

qtconsole有一些附加的包,即ZMQ和Pygments库:

    sudo apt-get install libzmq-dev
    sudo pip install pyzmq
    sudo pip install pygments

最后我们准备启动带有qtconsole的IPython:

    ipython qtconsole --pylab=inline

然后我们可以做一个图（非常简单的！）, 键入下列命令（我已经包含了IPython编号的输入/输出,你不需要再输入）：

    In [1]: x=np.array([1,2,3])
    
    In [2]: plot(x)
    Out[2]: [<matplotlib.lines.Line2D at 0x392a1d0>]

这将产生以下内嵌图表：

![](https://s3.amazonaws.com/quantstart/media/images/qs-python-ubuntu-install-0023.png)

*带有qtconsole的IPython显示一幅内嵌的图表*

这就是它的安装过程。现在，我们手头就有一个非常强大的，高效和互动的算法交易的科研环境。我会在后续的文章中详细介绍如何结合IPython,matplotlib,pandas和scikit-learn,以一种直观的方式, 成功地研究和回溯测试量化交易策略。

--------------------------------------------------------------------------------

来源于: http://quantstart.com/articles/Installing-a-Desktop-Algorithmic-Trading-Research-Environment-using-Ubuntu-Linux-and-Python

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[coolpigs](https://github.com/coolpigs) 校对：[jasminepeng](https://github.com/jasminepeng)

[1]:https://www.virtualbox.org/
[2]:http://www.ubuntu.com/desktop
[3]:http://python.org/
[4]:http://www.numpy.org/
[5]:http://www.scipy.org/
[6]:http://ipython.org/
[7]:http://matplotlib.org/
[8]:http://pandas.pydata.org/
[9]:http://scikit-learn.org/
[10]:http://quantstart.com/articles/Securities-Master-Database-with-MySQL-and-Python
[11]:http://www.ubuntu.com/desktop
[12]:https://www.virtualbox.org/
[13]:http://penreturns.rc.my/2012/02/could-not-get-lock-varlibaptlistslock.html
[14]:http://qt-project.org/downloads
