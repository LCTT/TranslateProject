[#]: subject: (FreeDOS commands for Linux fans)
[#]: via: (https://opensource.com/article/21/6/freedos-linux-users)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14092-1.html)

为 Linux 用户准备的 FreeDOS 命令
======

> 如果你已经熟悉了 Linux 命令行，尝试这些命令有助于轻松地进入 FreeDOS 。

![](https://img.linux.net.cn/data/attachment/album/202112/18/102331ubkem265eqz6u1mk.jpg)

如果你已经尝试过 FreeDOS ，你可能已经被命令行所吓倒。DOS 命令可能稍微不同于你所使用的 Linux 命令行，因此，使用它的命令行上需要学习一些新的命令。

但是对于 Linux 用户来说，它不是一种 “全新的” 体验。在 FreeDOS 中，除了 DOS 命令之外，我们还包含一些已经熟悉的标准的 Unix 命令。因此，如果你已经熟悉了 Linux 命令行，尝试这些命令有助于轻松地进入 FreeDOS ：

### 在四周走走

在 FreeDOS 文件系统中使用 `cd` 命令来 _更改目录_ 。在 FreeDOS 上的用法在 Linux 上的用法基本相同。要更改到一个名称为 `apps` 的子目录，输入 `cd apps` 。要回到先前的目录，输入 `cd ..` 。

在 FreeDOS 上导航浏览目录和路径是仅有的不同点，目录分隔符是 `\`（“反斜杠”）而不是你在 Linux 上使用的 `/` （“正斜杠”）。例如，让我们假设你在 `\devel` 目录之中，你想移动到 `\fdos` 目录。这两个目录相对于 _根_ 目录而言是处于相同的 “层次” 之中的。因此，你可以输入 `cd ..\fdos` 来 “向后返回” 一个目录层次（使用 `..`） ，然后再 “转到” `fdos` 目录。

要更改到一个新的目录，你可以使用先前提到的反斜杠来替换需要给出的完整的路径。如果你已经深入了另外一个路径之中，并且只是像立即切换到新的位置，那么这会是非常方便的。例如，要更改到 `\temp` 目录，你可以输入 `cd \temp` 。

```
C:\>cd apps
C:\APPS>cd ..
C:\>cd devel
C:\DEVEL>cd ..\fdos
C:\FDOS>cd \temp
C:\TEMP>_
```

在 FreeDOS 中，像大多数的 DOS 系统一样，你可以在DOS 提示符中看到你的当前路径。在 Linux 上，你的提示符可能类似于 `$` 。在 FreeDOS 上，提示符会列出当前的驱动器及其当前的路径，接下来使用 `>` 作为提示符（看做 Linux 上的 `$`）。

### 列出和显示文件

在 Linux 上，列出当前目录中文件的标准命令是 `ls` 命令。在 FreeDOS ，它是一个不同的命令： `dir` 。但是你可以创建一个 _别名_ 来获取一种与 `ls` 类似的行为。

要为另外一个命令创建一个别名，使用内置的 `alias` 命令。例如，使用此命令来为 `ls` 定义一个别名，这个别名将显示一个目录列表，与在 Linux 上使用 `ls` 类似：
 
```
C:\>alias ls=dir /one /w /b /l
C:\>ls
[apps]    command.com   [devel]  fdauto.bat   fdconfig.sys
[fdos]    kernel.sys    [src]    [temp]
C:\>
```

在 FreeDOS 上的命令选项格式与 Linux 稍微不同。在 Linux 上， 你使用一个连字符号（`-`）表示选项。但是在 FreeDOS 上，你使用一个正斜杠来表示选项。上面的 `alias` 命令使用斜杆杠字符 — 它们是 `dir` 的选项。`/one` 可选择项告诉 `dir` 以某种方式排序（`o`）：先按名称（`n`）再按扩展名（`e`）来排序一些文件和目录。`/w` 使用一个 “宽” 目录列表，`/b` 使用一种不带有 `dir` 通常提供的其它信息的 “裸” 显示，`/l` 指示 `dir` 以小写字母的形式显示文件和目录。

注意，针对于 FreeDOS 的 `dir` 命令的命令行选项与针对于 Linux 的 `ls` 命令的命令行选项截然不同，因此，你不能像你在 Linux 上一样精确地使用这个 `ls` 别名。例如，在 FreeDOS 上使用此别名输入 `ls -l` 将产生一条 “文件未找到” 的错误，因为底层的 FreeDOS 的 `dir` 命令不能找到一个名称为 `-l` 的文件。不过，对于基本的 “查看在我的系统上有哪些文件” 来说，这个 `ls` 别名已经足够帮助 Linux 用户开始使用 FreeDOS 了。

类似地，你可以为 FreeDOS 的 `type` 命令创建一个别名，来像 Linux 的 `cat` 命令一样工作。两个重新都会显示一个文本文件的内容。虽然 `type` 不支持你可能在 Linux 下使用的命令行选项，但是显示一单个文件的基本用法是相同的。

```
C:\FDOS>alias cat=type
C:\FDOS>cat version.fdi
PLATFORM=FreeDOS
VERSION=1.3-RC4
RELEASE=2021-04-30
C:\FDOS>
```

### 其它的类 Unix 命令

FreeDOS 包含一些精选的其它常见的类 Unix 命令，因此 Linux 用户将不会感觉到拘束。为在 FreeDOS 上使用这些 Linux 命令，你可能需要从 “FreeDOS Installer” - “My Package List Editor Software (FDIMPLES)” 软件包管理器来安装 “Unix Like Tools” 软件包。

![Installing the Unix-like package set][2]

（Jim Hall, CC-BY SA 4.0）

并不是所有的类 Unix 实用程序都能像在 Linux 上对应的实用程序一样 _一致地_ 工作。这就是我们称其为 _类 Unix_ 的原因。如果你将要使用一些深层次的命令行选项，你可能需要检查其兼容性，不过，对于典型的用法是没有问题的。开始在 FreeDOS 上使用这些类 Unix 命令：

`cal` 命令是标准的 Unix 的日历程序。例如，为显示当前月份的日历，只需要输入 `cal` 。为查看一个具体指定的月份，将月份和年份作为参数予以给定：

```
C:\>cal 6 1994

      June 1994    
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30      
```

使用 `du` 命令来查看你的磁盘使用情况。这是 Linux 的 `du` 命令的简单版本，并且不支持路径以外的任何命令行选项。

```
C:\>du -s apps
usage: du (start path)
C:\>du apps
    158784 C:\APPS\FED
         0 C:\APPS
Total from C:\APPS is 158784
C:\>
```

`head` 命令显示一个文件的前几行。例如，这是一种确定一个文件是否包含正确数据的简单方法。

```
C:>head fdauto.bat
@ECHO OFF
set DOSDIR=C"\FDOS
set LANG=EN
set TZ=UTC
set PATH=%dosdir%\BIN
if exist %dosdir%\LINKS\NUL set PATH=%path%;%dosdir%\LINKS
set NLSPATH=%dosdir%\NLS
set HELPPATH=%dosdir%\HELP
set TEMP=%dosdir%\TEMP
set TMP=%TEMP%
C:\>
```

要查看一个完整的文件，使用 `more` 命令，在 FreeDOS 上的默认文件查看器。这将一次显示一屏的文件，然后在显示下一屏的信息前，打印一个按下一次按键的提示。`more` 命令是一个非常简单的文件查看器；在 Linux 上你可能已经使用过一个功能更全面的查看器，可以尝试一下 `less` 命令。`less` 命令提供 “向后” 滚动一个文件的能力，以防你错过一些东西。你还可以搜索具体指定的文本。

```
C:\>less fdauto.bat
@ECHO OFF
set DOSDIR=C"\FDOS
set LANG=EN
set TZ=UTC
set PATH=%dosdir%\BIN
if exist %dosdir%\LINKS\NUL set PATH=%path%;%dosdir%\LINKS
set NLSPATH=%dosdir%\NLS
set HELPPATH=%dosdir%\HELP
set TEMP=%dosdir%\TEMP
set TMP=%TEMP%
[...]
```

如果在你的程序路径变量（`PATH`）中有很多的目录，并且不确定某个程序是从哪里运行的，你可以使用 `which` 命令。这个命令将扫描程序路径变量，并且将打印出你正在查找的程序的完整的位置。

```
C:\>which less
less    C:\>FDOS\BIN\LESS.EXE
C:\>_
```

FreeDOS 1.3 RC4 包含其它的类 Unix 命令，你可能会在其它更特殊的情况下使用。这些命令包括： 

  * `bc`：任意精度数字处理语言 
  * `sed`：流编辑器
  * `grep` 和 `xgrep`：使用正则表达式搜索一个文本文件
  * `md5sum`：生成一个文件的一个 MD5 签名
  * `nro`：简单排版，使用 nroff 宏
  * `sleep`：暂停系统几秒钟
  * `tee`：保存一个命令行流的副本
  * `touch`：修改一个文件的时间戳
  * `trch`：转换单个字符（像 Linux 的 `tr` 一样）
  * `uptime`：报告你 FreeDOS 系统已经运行多长的时间

### 在你控制下的 FreeDOS

FreeDOS ，像 Linux 和 BSD 一样，是开源的。不管你是想通过学习一种新的命令行交互方式来挑战你自己，还是想再去熟悉令人舒适的类 Unix 工具，FreeDOS 都是一款有趣的值得尝鲜的操作系统。尝试一下！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-linux-users

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph (FreeDOS fish logo and command prompt on computer)
[2]: https://opensource.com/sites/default/files/uploads/unix-like.png (Installing the Unix-like package set)
