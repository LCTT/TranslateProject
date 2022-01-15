[#]: subject: (Set and use environment variables in FreeDOS)
[#]: via: (https://opensource.com/article/21/6/freedos-environment-variables)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13995-1.html)

在 FreeDOS 中设置和使用环境变量
======

> 环境变量几乎在每种命令行环境中都是很有帮助的，自然包括 FreeDOS 。

![](https://img.linux.net.cn/data/attachment/album/202111/18/152155twzasgwwrzsmmvs2.jpg)

几乎在每个命令行环境中的一个有用的功能是 _环境变量_。其中的一些变量允许你控制命令行的行为或功能，其它的变量仅允许你存储可能稍后需要的数据，在 FreeDOS 中也使用了环境变量。

### 在 Linux 上的变量

在 Linux 上，你可能已经熟悉其中的一些重要的环境变量。在 Linux 上的 [Bash][2] shell 中，`PATH` 变量标示着 shell 可以在哪里找到程序和命令。例如，在我的 Linux 系统上，我的  `PATH` 值如下：

```
bash$ echo $PATH
/home/jhall/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
```

这意味着，当我输入一个像 `cat` 这样的命令的名称时，Bash 将会按顺序检查我在 `PATH` 变量中所列出的每个目录：

  1. `/home/jhall/bin`
  2. `/usr/lib64/ccache`
  3. `/usr/local/bin`
  4. `/usr/local/sbin`
  5. `/usr/bin`
  6. `/usr/sbin`

在我的实例中，`cat` 命令位于 `/usr/bin` 目录，因此，完整的路径是 `/usr/bin/cat` 。

为在 Linux 上设置一个环境变量，你可以输入一个变量的名称，接着输入一个等于符号（`=`），接着输入一个要存储在变量中的值。为了随后使用 Bash 引用这个值，你需要在变量的名称前输入一个美元符号（`$`）。

```
bash$ var=Hello
bash$ echo $var
Hello
```

### 在 FreeDOS 上的变量

在 FreeDOS 上，环境变量提供一种类似的功能。一些变量控制 DOS 系统的行为，另一些变量用于存储一些临时值。

为在 FreeDOS 上设置一个环境变量，你需要使用 `SET` 关键字。FreeDOS 是 _不区分大小写的_ ，因此你可以输入大写字母也可以使用小写字母。接下来，像你在 Linux 上一样设置变量，使用变量名称，一个等于符号（`=`），你想要存储的值。

不过，在 FreeDOS 中引用或 _扩展_ 一个环境变量的值的方法，与你在 Linux 上所使用的方法是完全不同的。在 FreeDOS 中，你不能使用美元符号（`$`）来引用一个变量。你反而需要使用百分符号 （`%`）来包围变量的名称。

![Use % (not $) to reference a variable's value][3]

在名称前后使用百分符号是非常重要，因为这就是 FreeDOS 知悉变量名称在哪里开始和结束的方式。这是非常有用的，因为它会允许你引用一个变量的值，与此同时，它会立即附加（或预置）其它的文本到值中。让我通过设置一个新的名称为 `reply` 的值为 `yes` 的变量，然后在 “11” 之前和 “22” 之后引用这个值来演示这一点：

![Set and reference an environment variable][5]

因为 FreeDOS 是不区分大小写的，所以你可以使用大写字母称或小写字母的变量名称以及 `SET` 关键字。不过，变量的值将使用你在命令行中所输入的字母。

最后，你可以看到当前在 FreeDOS 中定义的所有的环境变量。不使用任何参数的 `SET` 关键字将显示所有的变量，因此你可以一目了然：

![Show all variables at once with SET][6]

环境变量是一个有用的基本的命令行环境，同样适用于 FreeDOS 。你可以设置你自己的变量以满足你自己的需要，但是要仔细地更改 FreeDOS 使用的一些变量。这些变量会更改你正在运行的 FreeDOS 系统的行为：

  * `DOSDIR`：FreeDOS 安装目录的位置，通常是 `C:\FDOS`
  * `COMSPEC`：FreeDOS 的 shell 的当前实例，通常是 `C:\COMMAND.COM` 或 `%DOSDIR%\BIN\COMMAND.COM`
  * `LANG`：用户的首选语言
  * `NLSPATH`：系统语言文件的位置，通常是 `%DOSDIR%\NLS` 
  * `TZ`：系统的时区
  * `PATH`：一个目录列表，FreeDOS 可以在其中找到要运行的程序，例如 `%DOSDIR%\BIN`
  * `HELPPATH`：系统文档文件的位置，通常是 `%DOSDIR%\HELP`
  * `TEMP`：一个临时目录，FreeDOS 在其中存储来自每个命令的输出，如同它在命令行上的程序之间的 “管道” 数据
  * `DIRCMD`：一个控制 `DIR` 命令如何显示文件和目录的变量，通常设置 `/OGNE` 来排序（`O`）内容，先通过分组（`G`）目录，接下来按照名称（`N`） 、扩展名（`E`）来排序条目

如果你偶然间更改了任意的 FreeDOS 的 “内部” 变量，你可能会阻碍 FreeDOS 的一些部分的正常工作。在这种情况下，只需要简单地重新启动你的计算机，FreeDOS 将会按照系统默认值重新设置变量。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-environment-variables

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY 
[2]: https://opensource.com/article/19/8/using-variables-bash
[3]: https://opensource.com/sites/default/files/uploads/env-path.png
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/env-vars.png
[6]: https://opensource.com/sites/default/files/uploads/env-set.png