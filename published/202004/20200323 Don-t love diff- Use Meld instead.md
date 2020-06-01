[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12067-1.html)
[#]: subject: (Don't love diff? Use Meld instead)
[#]: via: (https://opensource.com/article/20/3/meld)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

不喜欢 diff 么？试试 Meld 吧
======

> Meld 是一个可视化 diff 工具，它可让你轻松比较和合并文件、目录、Git 仓库等的更改。

![](https://img.linux.net.cn/data/attachment/album/202004/03/122428dkagz1qtgh9f2g10.jpg)

Meld 是我处理代码和数据文件的基本工具之一。它是一个图形化的 diff 工具，因此，如果你曾经使用过 `diff` 命令并难以理解输出，那么 [Meld][2] 可以为你提供帮助。

这是该项目网站的精彩描述：

>“Meld 是面向开发人员的可视化 diff 和合并工具。Meld 可以帮助你比较文件、目录和版本控制的项目。它提供文件和目录的双向和三向比较，并支持许多流行的版本控制系统。”
>
>“Meld 可以帮助你检查代码更改并了解补丁。它甚至可以帮助你弄清你一直在避免的合并中发生了什么。”

你可以使用以下命令在 Debian/Ubuntu 系统（包括 Raspbian）上安装 Meld：

```
$ sudo apt install meld
```

在 Fedora 或类似产品上：

```
$ sudo dnf install meld
```

Meld 是跨平台的，它有一个使用 [Chocolately][4] 包管理器的 [Windows 安装包][3]。尽管它在 macOS 上不受官方支持，但有[可用于 Mac 的版本][5]，你可以使用 Homebrew 安装：

```
$ brew cask install meld
```

有关[其他系统][2]，请参见 Meld 的主页。

### Meld 对比 diff 命令

如果你有两个相似的文件（也许一个是另一个的修改版本），并想要查看它们之间的更改，那么可以在终端中运行 `diff` 命令查看它们的区别：

![diff output][6]

此例显示了 `conway1.py` 和 `conway2.py` 之间的区别。表明我：

* 删除了[释伴][7]和第二行
* 从类声明中删除了 `(object)`
* 为类添加了 docstring
* 在方法中交换了 `alive` 和 `neighbours == 2` 的顺序

这是使用 `meld` 命令的相同例子。你可以在命令行中运行以下命令进行相同的比较：

```
$ meld conway1.py conway2.py
```

![Meld output][8]

Meld 更清晰！

你可以轻松查看并单击箭头（左右都行）合并文件之间的更改。你甚至可以实时编辑文件（在输入时，Meld 可以用作具有实时比较功能的简单文本编辑器）—只是要记得在关闭窗口之前保存。

你甚至可以比较和编辑三个不同的文件：

![Comparing three files in Meld][9]

### Meld 的 Git 感知

希望你正在使用 [Git][10] 之类的版本控制系统。如果是这样，那么你的比较就不是在两个不同文件之间进行，而是要查找当前文件与 Git 历史文件之间的差异。Meld 理解这一点，因此，如果你运行 `meld conway.py`（`conway.py` 在 Git 中），它将显示自上次 Git 提交以来所做的更改：

![Comparing Git files in Meld][11]

你可以看到当前版本（右侧）和仓库版本（左侧）之间的更改。你可以看到，自上次提交以来，我删除了一个方法，并添加了一个参数和一个循环。

如果你运行 `meld .`，你将看到当前目录（如果位于仓库的根目录，就是整个仓库）中的所有更改：

![Meld . output][12]

你会看到一个文件被修改了，另一个文件未加入版本控制（这意味着它对 Git 是新的，因此在比较之前，我需要 `git add` 添加该文件），以及许多其他未修改的文件。顶部的图标提供了各种显示选项。

你还可以比较两个目录，这有时很方便：

![Comparing directories in Meld][13]

### 结论

即使是普通用户也会觉得 diff 的比较难以理解。我发现 Meld 提供的可视化在找出文件之间的更改方面有很大的不同。最重要的是，Meld 有一些有用的版本控制认知，可以帮助你在不考虑太多内容的情况下对 Git 提交进行比较。快来试试 Meld，并轻松解决问题。

* * *

*本文最初发表在 Ben Nuttall 的 [Tooling blog][14] 上，并经允许重新使用。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/meld

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://meldmerge.org/
[3]: https://chocolatey.org/packages/meld
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://yousseb.github.io/meld/
[6]: https://opensource.com/sites/default/files/uploads/diff-output.png (diff output)
[7]: https://en.wikipedia.org/wiki/Shebang_(Unix)
[8]: https://opensource.com/sites/default/files/uploads/meld-output.png (Meld output)
[9]: https://opensource.com/sites/default/files/uploads/meld-3-files.png (Comparing three files in Meld)
[10]: https://opensource.com/resources/what-is-git
[11]: https://opensource.com/sites/default/files/uploads/meld-git.png (Comparing Git files in Meld)
[12]: https://opensource.com/sites/default/files/uploads/meld-directory-changes.png (Meld . output)
[13]: https://opensource.com/sites/default/files/uploads/meld-directory-compare.png (Comparing directories in Meld)
[14]: https://tooling.bennuttall.com/meld/
