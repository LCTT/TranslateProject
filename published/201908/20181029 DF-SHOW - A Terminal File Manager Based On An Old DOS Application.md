DF-SHOW：一个基于老式 DOS 应用的终端文件管理器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-720x340.png)

如果你曾经使用过老牌的 MS-DOS，你可能已经使用或听说过 DF-EDIT。DF-EDIT，意即 **D**irectory **F**ile **Edit**，它是一个鲜为人知的 DOS 文件管理器，最初由 Larry Kroeker 为 MS-DOS 和 PC-DOS 系统而编写。它用于在 MS-DOS 和 PC-DOS 系统中显示给定目录或文件的内容。今天，我偶然发现了一个名为 DF-SHOW 的类似实用程序（**D**irectory **F**ile **Show**），这是一个类 Unix 操作系统的终端文件管理器。它是鲜为人知的 DF-EDIT 文件管理器的 Unix 重写版本，其基于 1986 年发布的 DF-EDIT 2.3d。DF-SHOW 完全是自由开源的，并在 GPLv3 下发布。

DF-SHOW 可以：

* 列出目录的内容，
* 查看文件，
* 使用你的默认文件编辑器编辑文件，
* 将文件复制到不同位置，
* 重命名文件，
* 删除文件，
* 在 DF-SHOW 界面中创建新目录，
* 更新文件权限，所有者和组，
* 搜索与搜索词匹配的文件，
* 启动可执行文件。

### DF-SHOW 用法

DF-SHOW 实际上是两个程序的结合，名为 `show` 和 `sf`。

#### Show 命令

`show` 程序（类似于 `ls` 命令）用于显示目录的内容、创建新目录、重命名和删除文件/文件夹、更新权限、搜索文件等。

要查看目录中的内容列表，请使用以下命令：

```
$ show <directory path>
```

示例：

```
$ show dfshow
```

这里，`dfshow` 是一个目录。如果在未指定目录路径的情况下调用 `show` 命令，它将显示当前目录的内容。

这是 DF-SHOW 默认界面的样子。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-1.png)

如你所见，DF-SHOW 的界面不言自明。

在顶部栏上，你会看到可用的选项列表，例如复制、删除、编辑、修改等。

完整的可用选项列表如下：

  * `C` opy（复制）
  * `D` elete（删除）
  * `E` dit（编辑）
  * `H` idden（隐藏）
  * `M` odify（修改）
  * `Q` uit（退出）
  * `R` ename（重命名）
  * `S` how（显示）
  * h `U` nt（文件内搜索）
  * e `X` ec（执行）
  * `R` un command（运行命令）
  * `E` dit file（编辑文件）
  * `H` elp（帮助）
  * `M` ake dir（创建目录）
  * `S` how dir（显示目录）

在每个选项中，有一个字母以大写粗体标记。只需按下该字母即可执行相应的操作。例如，要重命名文件，只需按 `R` 并键入新名称，然后按回车键重命名所选项目。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-2.png)

要显示所有选项或取消操作，只需按 `ESC` 键即可。

此外，你将在 DF-SHOW 界面的底部看到一堆功能键，以浏览目录的内容。

* `UP` / `DOWN` 箭头或 `F1` / `F2` - 上下移动（一次一行），
* `PgUp` / `PgDn` - 一次移动一页，
* `F3` / `F4` - 立即转到列表的顶部和底部，
* `F5` - 刷新，
* `F6` - 标记/取消标记文件（标记的文件将在它们前面用 `*` 表示），
* `F7` / `F8` - 一次性标记/取消标记所有文件，
* `F9` - 按以下顺序对列表排序 - 日期和时间、名称、大小。

按 `h` 了解有关 `show` 命令及其选项的更多详细信息。

要退出 DF-SHOW，只需按 `q` 即可。

#### SF 命令

`sf` （显示文件）用于显示文件的内容。

```
$ sf <file>
```

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-3.png)

按 `h` 了解更多 `sf` 命令及其选项。要退出，请按 `q`。

想试试看？很好，让我们继续在 Linux 系统上安装 DF-SHOW，如下所述。

### 安装 DF-SHOW

DF-SHOW 在 [AUR][1] 中可用，因此你可以使用 AUR 程序（如 [yay][2]）在任何基于 Arch 的系统上安装它。

```
$ yay -S dfshow
```

在 Ubuntu 及其衍生版上：

```
$ sudo add-apt-repository ppa:ian-hawdon/dfshow
$ sudo apt-get update
$ sudo apt-get install dfshow
```

在其他 Linux 发行版上，你可以从源代码编译和构建它，如下所示。

```
$ git clone https://github.com/roberthawdon/dfshow
$ cd dfshow
$ ./bootstrap
$ ./configure
$ make
$ sudo make install
```

DF-SHOW 项目的作者只重写了 DF-EDIT 实用程序的一些应用程序。由于源代码可以在 GitHub 上免费获得，因此你可以添加更多功能、改进代码并提交或修复错误（如果有的话）。它仍处于 beta 阶段，但功能齐全。

你有没试过吗？如果试过，觉得如何？请在下面的评论部分告诉我们你的体验。

不管如何，希望这有用。还有更多好东西。敬请关注！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/df-show-a-terminal-file-manager-based-on-an-old-dos-application/

作者：[SK][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://aur.archlinux.org/packages/dfshow/
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
