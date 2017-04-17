Linux 系统上的可视化比较与合并工具 Meld
============================================================

我们已经[讲过][5] Linux 中[一些][6]基于命令行的比较和合并工具，再来讲解该系统的一些可视化的比较与合并工具也很合理。首要的原因是，不是每个人都习惯使用命令行，而且对于某些人来说，基于命令行的比较工具可能很难学习和理解。

因此，我们将会推出关于可视化工具 **Meld** 的系列文章。

在跳到安装和介绍部分前，我需要说明这篇教程里所有的指令和用例是都是可用的，而且它们已经在 Ubuntu 14.04 中测试过了，我们使用的 Meld 版本是 3.14.2。

### 关于 Meld

[Meld][7] 主要是一个可视化的比较和合并的工具，目标人群是开发者（当然，我们将要讲到的其它部分也会考虑到最终用户）。这个工具同时支持双向和三向的比较，不仅仅是比较文件，还可以比较目录，以及版本控制的项目。

“Meld 可以帮你回顾代码改动，理解补丁，”其官网如是说。“它甚至可以告知你如果你不进行合并将会发生什么事情。”该工具使用 GPL v2 协议进行授权。

### 安装 Meld

如果你用的是 Ubuntu 或者其它基于 Debian 的 Linux 分支，你可以用以下命令下载安装 Meld：

```sh
sudo apt-get install meld
```

或者你也可以用系统自带的包管理软件下载这个工具。比如在 Ubuntu 上，你可以用 Ubuntu 软件中心（Ubuntu Software Center），或者用 [Ubuntu 软件][8]，它从 Ubuntu 16.04 版本开始取代了 Ubuntu 软件中心。

当然，Ubuntu 官方仓库里的 Meld 版本很有可能比较陈旧。因此如果你想要用更新的版本，你可以在[这里][9]下载软件包。如果你要用这个方法，你要做的就是解压下载好的软件包，然后运行 `bin` 目录下的 `meld` 程序。

```
~/Downloads/meld-3.14.2/bin$ ./meld 
```

以下是 Meld 依赖的软件，仅供参考：

*   Python 2.7 (Python 3.3 开发版)
*   GTK+ 3.14
*   GLib 2.36
*   PyGObject 3.14
*   GtkSourceView 3.14
*   pycairo

### 使用 Meld

装好了软件，就可以看到类似这样的画面：

[
 ![Meld started](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-launch-screen-1.png) 
][10]

有三个选项：比较文件（File comparison），比较目录（Directory comparison）以及版本控制视图（Version control view）。 

点击“比较文件”选项，就可以选择需要比较的文件：

[
 ![Meld file comparison](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-file-comparison-2.png) 
][11]

就像上面的截图那样明白，Meld 也可以进行三向比较，但是在这一系列文章的第一部分，我们只会讲更常用的双向比较。

接着，选择你想要比较的文件，点击“比较”（Compare）按钮。软件会在两边分别打开两个文件，高亮不同的行（以及不同的部分）。

[
 ![Compare files in Meld](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-diff-in-action-3.png) 
][12]

两个文件的不同之处在第二行，差别在于 `file2` 文件的第二行多了一个 `3`。你看到的黑色箭头是用来进行合并或修改的操作的。该例中，向右的箭头将会把 `file2` 文件的第二行改成文件 `file1` 中对应行的内容。左向箭头做的事情相反。

做完修改后，按下 `Ctrl+s` 来保存。

这个简单的例子，让你知道 Meld 的基本用法。让我们看一看稍微复杂一点的比较：

[
 ![Meld advanced file comparison](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-multiple-changes-4.png) 
][13]

在讨论这些变化前，这里提一下， Meld 的界面中有几个区域，可以给出文件之间的差异，让概况变得直观。这里特别需要注意窗口的左右两边垂直的栏。比如下面这个截图：

[
 ![Visual Comparison](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-multiple-colors-5.png) 
][14]

仔细观察，图中的这个栏包含几个不同颜色的区块。这些区块是用来让你对文件之间的差异有个大概的了解。“每一个着色的区块表示一个部分，这个部分可能是插入、删除、修改或者有差别的，取决于区块所用的颜色。”官方文档是这样说的。

现在，让我们回到我们之前讨论的例子中。接下来的截图展示了用 Meld 理解文件的改动是很简单的（以及合并这些改动）：

[
 ![File changes visualized in Meld](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-makes-it-easy-6.png) 
][15]

[
 ![Meld Example 2](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-makes-it-easy-7.png) 
][16]

[
 ![Meld Example 3](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-makes-it-easy-8.png) 
][17]

接着，我们滑动文件，从一个改动跳到另一个。但是，当要比较的文件很大时，这会耗一点时间，当你想要滑动文件跳到一个改动的位置时，也会变得很困难。如果是这种情况的话，你可以用工具栏的橙色箭头，就在编辑区域的上方：

[
 ![Go to next change in Meld](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-go-next-prev-9.png) 
][18]

这些是你使用 Meld 时做的一般性的事情：可以用标准的 `Ctrl+f` 组合键在编辑区域内进行查找，按 `F11` 键让软件进入全屏模式，再按 `Ctrl+r` 来刷新（通常在所有要比较的文件改变的时候使用）。

以下是 Meld 官方网站宣传的重要特性：

* 文件和目录的双向及三向比较
* 输入即更新文件的比较
* 自动合并模式，按块改动的动作让合并更加简单
* 可视化让比较文件更简单
* 支持 Git，Bazaar，Mercurial，Subversion 等等

注意还不仅仅只有以上所列的。网站上有个专门的[特性页面][19]，里面提到了 Meld 提供的所有特性。这个页面列出的所有特性分为几个部分，以该软件是用来做文件比较、目录比较、版本控制还是处于合并模式下为基础进行划分。

和其它软件相似，有些事情 Meld 做不到。官方网站上列出了其中的一部分：“当 Meld 展示文件之间的差异时，它同时显示两个文件，看起来就像在普通的文本编辑器中。它不会添加额外的行，让左右两边文件的特殊改动处于同样的行数。没有做这个事情的选项。”

### 总结

我们刚刚了解到的不过是皮毛，因为 Meld 还能做很多事情。考虑到这是教程系列的第一部分，这也挺不错的。这仅仅是让你了解 Meld 的作用，你可以配置它，忽略一些特定类型的改动，让它移动，复制或者删除文件之间的个别差异，也可以从命令行启动它。在即将退出的系列教程中，我们将会讲述所有这些重要功能。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/

作者：[Ansh][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/
[1]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#about-meld
[2]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#meld-installation
[3]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#meld-usage
[4]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#conclusion
[5]:https://www.howtoforge.com/tutorial/linux-diff-command-file-comparison/
[6]:https://www.howtoforge.com/tutorial/how-to-compare-three-files-in-linux-using-diff3-tool/
[7]:http://meldmerge.org/
[8]:https://www.howtoforge.com/tutorial/ubuntu-16-04-lts-overview/
[9]:https://git.gnome.org/browse/meld/refs/tags
[10]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-launch-screen-1.png
[11]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-file-comparison-2.png
[12]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-diff-in-action-3.png
[13]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-multiple-changes-4.png
[14]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-multiple-colors-5.png
[15]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-makes-it-easy-6.png
[16]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-makes-it-easy-7.png
[17]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-makes-it-easy-8.png
[18]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-go-next-prev-9.png
[19]:http://meldmerge.org/features.html
