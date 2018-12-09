关于 top 工具的 6 个替代方案
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Alternatives-To-Top-Command-720x340.png)

在 GitHub 和 GitLab 上，不断有来自世界各地的开源应用程序和工具涌现。其中有全新的应用程序，也有针对现有各种被广泛使用的 Linux 程序的替代方案。在本文档中，我会介绍一些针对 [top][1] 工具（也就是命令行任务管理器程序）的替代方案。

### top 工具的替代方案

在本文中，将会介绍以下 6 种 `top` 工具的替代方案：

  1. Htop
  2. Vtop
  3. Gtop
  4. Gotop
  5. Ptop
  6. Hegemon

如果后续有更多类似的工具，原作者会在原文进行更新。如果你对此有兴趣，可以持续关注。

####  Htop

`htop` 是一个流行的开源跨平台交互式进程管理器，也是我最喜欢的系统活动监控工具。`htop` 是对原版 `top` 工具的扩展。它最初只是用于 Linux 系统，后来开发者们不断为其添加对其它类 Unix 操作系统的支持，包括 FreeBSD 和 Mac OS。`htop` 还是一个自由开源软件，它基于 ncurses 并按照 GPLv2 发布。

和原版的 `top` 工具相比，`htop` 工具有这些优势：

  * `htop` 比 `top` 启动更快
  * `htop` 支持横向滚动和纵向滚动浏览进程列表，以便看到所有的进程和完整的命令行
  * 在 `top` 工具中进行杀死进程、更改进程优先级这些操作时，需要输入进程 ID，而在 `htop` 工具中则不需要输入
  * 在 `htop` 中可以同时杀死多个进程
  * 在 `top` 中每次输入一个未预设的键都要等待一段时间，尤其是在多个键组成转义字符串的时候就更麻烦了

在很多 Linux 发行版的默认软件仓库中，都带有了 `htop`。

在基于 Arch 的操作系统中则可以执行以下命令来安装 `htop`：

```
$ sudo pacman -S htop
```

在基于 Debian 的操作系统使用以下命令：

```
$ sudo apt install htop
```

在使用 RPM 软件管理的操作系统使用以下命令：

```
$ sudo dnf install htop
```

或者

```
$ sudo yum install htop
```

在 openSUSE 系统中：

```
$ sudo zypper in htop
```

**用法**

不带任何参数执行 `htop` 时，会显示如下画面：

```
$ htop
```

![](https://www.ostechnix.com/wp-content/uploads/2018/11/htop-command-1.png)

从图上可以看出，`htop` 会在界面顶部显示内存、交换空间、任务总数、系统平均负载、系统正常运行时间这些常用指标，在下方则和 `top` 一样显示进程列表，并且将进程的 ID、用户、进程优先级、进程 nice 值、虚拟内存使用情况、CPU 使用情况、内存使用情况等信息以多列显示出来。如果你想详细了解这些数据的含义，可以在[这里][1]阅读参考。

和 `top` 不同的是，`htop` 支持对不同的操作使用专有的按键。以下列出一些用于与 `htop` 交互的快捷键：

  * `F1`、`h`、`?`：进入帮助界面。
  * `F2`、`Shift+s`：进入设置界面。在设置界面中可以配置仪表板界面顶部显示哪些数据，以及设置颜色方案、显示列、显示顺序等等多种参数。
  * `F3`、`/`：在进程列表中进行搜索。
  * `F4`、`\`：进入筛选模式。输入一个字符串，筛选出包含这个字符串的进程。进入筛选模式后再按一次 `F4` 或者 `ESC` 可以退出筛选模式。
  * `F5`、`t`：切换默认显示模式和树型显示模式，在树型显示模式下按 `+` 可以查看子树。
  * `F6`、`<`、`>`：依次按照进程 ID、用户、进程优先级、进程 nice 值、CPU 使用率、内存使用率排序显示。
  * `F7`、`]`：提高所选进程的优先级。
  * `F8`、`[`：降低所选进程的优先级。
  * `F9`、`k`：杀死所选进程。可以用 `↑` / `↓` 键选择不同的进程并按 `F9` 杀死进程。
  * `F10`、`q`： 退出 `htop`

以上这些快捷键都在 `htop` 界面底部显示。

需要注意的是，这其中有一些快捷键可能会与已有的快捷键发生冲突。例如按 `F2` 之后可能没有进入 `htop` 的设置界面，而是开始了对终端窗口的重命名。在这种情况下，你可能要更改一下快捷键的设置。

除了以上列出的快捷键以外，还有一些带有其它功能的快捷键，例如：

  * `u` 可以选择显示某个用户的进程。
  * `Shift+m` 可以按照内存使用量对进程列表排序。
  * `Shift+p` 可以按照 CPU 使用量对进程列表排序。
  * `Shit+t` 可以按照进程启动时间对进程列表排序。
  * `CTRL+l` 刷新界面。

`htop` 的所有功能都可以在启动后通过快捷键来调用，而不需要在启动的时候带上某个参数。当然，`htop` 也支持带参数启动。

例如按照以下方式启动 `htop` 就可以只显示某个用户的进程：

```
$ htop -u <username>
```

更改界面自动刷新的时间间隔：

```
$ htop -d 10
```

看，`htop` 确实比 `top` 好用多了。

想了解 `htop` 的更多细节，可以查阅它的手册页面：

```
$ man htop
```

也可以查看它的[项目主页](http://hisham.hm/htop/) 和 [GitHub 仓库](https://github.com/hishamhm/htop)。

#### Vtop

`vtop` 是 `top` 工具的另一个替代方案。它是一个使用 NodeJS 编写的、自由开源的命令行界面系统活动监视器，并使用 MIT 许可证发布。`vtop` 通过使用 unicode 中的盲文字符来绘制 CPU 和内存使用情况的可视化图表。

在安装 `vtop` 之前，需要先安装 NodeJS。如果还没有安装 NodeJS，可以按照[这个教程](https://www.ostechnix.com/install-node-js-linux/)进行安装。

NodeJS 安装完毕之后，执行以下命令安装 `vtop`：

```
$ npm install -g vtop
```

安装好 `vtop` 就可以执行以下命令开始监控了。

```
$ vtop
```

显示界面如下：

![][3]

如上图所示，`vtop` 界面和 `top`、`htop` 都有所不同，它将不同的内容分别以多个框的布局显示。另外在界面底部也展示了用于与 `vtop` 交互的所有快捷键。

`vtop` 有这些快捷键：

  * `dd` ：杀死一个进程。
  * `↑`、`k`：向上移动。
  * `↓`、`j`：向下移动。
  * `←`、`h` ：放大图表。
  * `→`、`l`：缩小图表。
  * `g` ：跳转到进程列表顶部。
  * `Shift+g` ：跳转到进程列表底部。
  * `c` ：以 CPU 使用量对进程排序。
  * `m` ：以内存使用量对进程排序。

想要了解更多关于 `vtop` 的细节，可以查阅它的[项目主页](http://parall.ax/vtop)或者 [GitHub 仓库](https://github.com/MrRio/vtop)。

#### Gtop

`gtop` 和 `vtop` 一样，都是一个使用 NodeJS 编写、在 MIT 许可下发布的系统活动监视器。

执行以下命令安装 `gtop`：

```
$ npm install gtop -g
```

然后执行以下命令启动：

```
$ gtop
```

显示界面如下：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/gtop.png)

`gtop` 有一个优点，就是它会以不同的颜色来显示不同的模块，这种表现形式非常清晰明了。

主要的快捷键包括：

  * `p`：按照进程 ID 对进程排序。
  * `c`：按照 CPU 使用量对进程排序。
  * `m`：按照内存使用量对进程排序。
  * `q`、`Ctrl+c`：退出。

想要了解更多关于 `gtop` 的细节，可以查阅它的 [GitHub 仓库](https://github.com/aksakalli/gtop)。

#### Gotop

`gotop` 也是一个完全自由和开源的图表式系统活动监视器。顾名思义，它是在受到 `gtop` 和 `vtop` 的启发之后用 Go 语言编写的，因此也不再对其展开过多的赘述了。如果你有兴趣了解这个项目，可以阅读《[gotop：又一个图表式系统活动监视器](https://www.ostechnix.com/manage-python-packages-using-pip/)》这篇文章。

#### Ptop

有些人对 NodeJS 和 Go 语言的项目可能不太感冒。如果你也是其中之一，你可以试一下使用 Python 编写的 `ptop`。它同样是一个自由开源的、在 MIT 许可下发布的系统活动监视器。

`ptop` 同时兼容 Python2.x 和 Python3.x，因此可以使用 Python 的软件包管理器 `pip` 轻松安装。如果你没有安装 `pip`，也可以参考[这个教程](https://www.ostechnix.com/manage-python-packages-using-pip/)进行安装。

安装 `pip` 之后，执行以下命令就可以安装 `ptop`：

```
$ pip install ptop
```

又或者按照以下方式通过源代码安装：

```
$ git clone https://github.com/darxtrix/ptop
$ cd ptop/
$ pip install -r requirements.txt # install requirements
$ sudo python setup.py install
```

如果需要对 `ptop` 进行更新，可以这样操作：

```
$ pip install --upgrade ptop
```

即使你不执行更新，`ptop` 也会在第一次启动的时候提示你是否需要更新到最新的版本。

现在可以看一下启动 `ptop` 后的界面。

```
$ ptop
```

就像下面这样：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/ptop-1.png)

`ptop` 的快捷键包括以下这些：

  * `Ctrl+k`：杀死一个进程。
  * `Ctrl+n`：按照内存使用量对进程排序。
  * `Ctrl+t`：按照进程启动时间对进程排序。
  * `Ctrl+r`：重置所有数据。
  * `Ctrl+f`：对进程进行筛选，输入进程的名称就能够筛选出符合条件的进程。
  * `Ctrl+l`：查看所选进程的详细信息。
  * `g`：跳转到进程列表顶部。
  * `Ctrl+q`：退出。

`ptop` 还支持更改显示主题。如果你想让 `ptop` 更好看，可以选择你喜欢的主题。可用的主题包括以下这些：

  * colorful
  * elegant
  * simple
  * dark
  * light

如果需要更换主题（例如更换到 colorful 主题），可以执行以下命令：

```
$ ptop -t colorful
```

使用 `-h` 参数可以查看帮助页面：

```
$ ptop -h
```

想要了解更多关于 `ptop` 的细节，可以查阅它的 [GitHub 仓库](https://github.com/darxtrix/ptop)。

#### Hegemon

`hegemon` 是一个使用 Rust 编写的系统活动监视器，如果你对 Rust 感兴趣，也可以了解一下。我们最近有一篇关于 `hegemon` 的[文章](https://www.ostechnix.com/hegemon-a-modular-system-monitor-application-written-in-rust/)，想要详细了解的读者不妨阅读。

### 总结

以上就是关于 `top` 工具的 6 个替代方案。我并不会说它们比 `top` 更好或者可以完全替代 `top`，但多了解一些类似的工具总是好的。你有使用过这些工具吗？哪个是你最喜欢的？欢迎在评论区留言。


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/

作者：[SK][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/the-top-command-tutorial-with-examples-for-beginners/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2018/11/vtop.png

