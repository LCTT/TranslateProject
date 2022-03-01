[#]: subject: "6 Linux metacharacters I love to use on the command line"
[#]: via: "https://opensource.com/article/22/2/metacharacters-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14270-1.html"

我喜欢在 Linux 命令行中使用的 6 个元字符
======

> 在 Linux 命令行上使用元字符是提高生产力的一个好方法。

![](https://img.linux.net.cn/data/attachment/album/202202/13/235915kbphrm6ld6yi2hud.jpg)

在我的 Linux 之旅的早期，我学会了如何使用命令行。这就是 Linux 的与众不同之处。我可以失去图形用户界面（GUI），但没有必要完全重建机器。许多 Linux 电脑是<ruby>无头<rt>headless</rt></ruby>运行的，你可以在命令行上完成所有的管理任务。它使用许多所有人都熟悉的基本命令，如 `ls`、`ls-l`、`ls-l`、`cd`、`pwd`、`top` 等等。

### Linux 上的 Shell 元字符

你可以通过使用元字符来扩展这些命令。我不知道你怎么称呼它们，但这些元字符使我的生活变得更轻松。

### 管道符 |

假设我想知道我的系统上运行的 Firefox 的所有实例。我可以使用带有 `-ef` 参数的 `ps` 命令来列出我系统上运行的所有程序实例。现在我想只看那些涉及 Firefox 的实例。我使用了我最喜欢的元字符之一，管道符 `|`，将其结果送到 `grep`，用它来搜索模式：

```
$ ps -ef | grep firefox
```

### 输出重定向 >

另一个我最喜欢的元字符是输出重定向 `>`。我用它来打印 `dmesg` 命令结果中所有 AMD 相关的结果。你可能会发现这在硬件故障排除中很有帮助：

```
$ dmesg | grep amd > amd.txt
$ cat amd.txt
[ 0.897] amd_uncore: 4 amd_df counters detected
[ 0.897] amd_uncore: 6 amd_l3 counters detected
[ 0.898] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
```

### 星号 *

星号 `*`（通配符）是寻找具有相同扩展名的文件时我的最爱，如 `.jpg` 或 `.png`。我首先进入我的系统中的 `Picture` 目录，并使用类似以下的命令：

```
$ ls *.png
BlountScreenPicture.png
DisplaySettings.png
EbookStats.png
StrategicPlanMenu.png
Screenshot from 01-24 19-35-05.png
```

### 波浪号 ~

波浪号 `~` 是在 Linux 系统上通过输入以下命令快速返回你的家目录的一种方法：

```
$ cd ~
$ pwd
/home/don
```

### 美元符号 $

`$` 符号作为一个元字符有不同的含义。当用于匹配模式时，它意味着任何以给定字符串结尾的字符串。例如，当同时使用元字符 `|` 和 `$` 时：

```
$ ls | grep png$
BlountScreenPicture.png
DisplaySettings.png
EbookStats.png
StrategicPlanMenu.png
Screenshot from 01-24 19-35-05.png
```

### 上尖号 ^

符号 `^` 将结果限制在以给定字符串开始的项目上。例如，当同时使用元字符 `|` 和 `^` 时：

```
$ ls | grep ^Screen
Screenshot from 01-24 19-35-05.png
```

这些元字符中有许多是通往 [正则表达式][2] 的大门，所以还有很多东西可以探索。你最喜欢的 Linux 元字符是什么，它们是如何节省你的工作的？

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/metacharacters-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/article/18/5/getting-started-regular-expressions
