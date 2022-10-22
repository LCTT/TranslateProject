[#]: subject: "Troubleshooting “Bash: Command Not Found” Error in Linux"
[#]: via: "https://itsfoss.com/bash-command-not-found/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "chai001125"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15164-1.html"

解决 Linux 中的 “Bash: Command Not Found” 报错
======

> 本新手教程展示了在 Debian、Ubuntu 和其他的 Linux 发行版上如何解决 “Bash: command not found” 这一报错。

当你在 Linux 中使用命令时，你希望得到终端输出的结果。但有时候，你会遇到终端显示“<ruby>命令未找到<rt>command not found</rt></ruby>”这一报错。

![][1]

对于这个问题，并没有直截了当且单一的解决方案。你必须自己做一些故障排除来解决这个报错。

老实说，要解决它并不难。该报错信息已经给出了一些提示：“命令未找到”，这说明你的 shell（或者 Linux 系统）找不到你输入的那条命令。

shell（或 Linux 系统）找不到命令，有三个可能的原因：

  * 你将命令的名称拼错了
  * 该命令还没有安装
  * 该命令是一个可执行脚本，但其位置未知

接下来，我们会详细介绍“命令未找到”这一报错的每一个原因。

### 解决“命令未找到”报错

![][2]

#### 方法 1：再次检查命令名称有没有写错

每个人都会犯错误，尤其是在打字的时候。你输入的命令可能存在错别字（也就是你写错啦）。

你应该特别注意：

  * 是否拼对了正确的命令名称
  * 是否在命令与其选项之间加上了空格
  * 是否在拼写中混淆了 1（数字 1）、I（大写的 i）和 l（小写的 L）
  * 是否正确使用了大写字母或者小写字母

看看下面的示例，因为我写错了 `ls` 命令，所以会导致“command not found”报错。

![][3]

所以，请再次仔细确认你输入得对不对。

#### 方法 2：确保命令已安装在你的系统上

这是“命令未找到”错误的另一个常见原因。如果命令尚未安装，则无法运行该命令。

虽然在默认情况下，你的 Linux 发行版自带安装了大量命令，但是不会在系统中预装 _所有的_ 命令行工具。如果你尝试运行的命令不是一个流行的常用命令，那么你需要先安装它。

你可以使用发行版的软件包管理器来安装命令。

![You may have to install the missing command][4]

有时候，某一常用命令可能也不再能使用了，甚至你也不能够安装这个命令了。这种情况下，你需要找到一个替代的命令，来得到结果。

以现已弃用的 `ifconfig` 命令为例。网络上的旧教程依旧会让你使用 `ifconfig` 命令，来 [获取本机的 IP 地址][5] 和网络接口信息，但是，在较新的 Linux 版本中，你已经无法使用 `ifconfig` 了。`ifconfig` 命令已被 `ip` 命令所取代。

![Some popular commands get discontinued over the time][1]

有时候，你的系统可能甚至找不到一些非常常见的命令。当你在 Docker 容器中运行 Linux 发行版时，就通常如此。Docker 容器为了缩小操作系统镜像的大小，容器中通常不包含那些常见的 Linux 命令。

这就是为什么使用 Docker 的用户会碰到 [ping 命令未找到][6] 等报错的原因。

![Docker containers often have only a few commands installed][7]

因此，这种情况下的解决方案是安装缺失的命令，或者是找到一个与缺失命令有同等功能的工具。

### 方法 3：确保命令是真实的，而不是一个别名

我希望你知道 Linux 中的别名概念。你可以配置你自己的较短的命令来代替一个较长命令的输入。

一些发行版，如 Ubuntu，会自动提供 `ll`（`ls -l` 的别名）、`la`（`ls -a` 的别名）等命令。

![][13]

想象一下，你习惯于在你的个人系统上输入 `ll` 和 `la`，而你登录到另一个 Linux 系统，发现 `ll` 命令并不存在。你甚至不能安装 `ll` 命令，因为它不是一个真正的命令。

所以，如果你找不到一个命令，甚至不能安装，你应该尝试在互联网上搜索该命令是否存在。如果不存在，可能是其他系统上的一个别名。

#### 方法 4：检查命令是否是一个路径正确的可执行脚本

这是 Linux 新手在 [运行 shell 脚本][8] 时常犯的错误。

即使你在同一目录下，仅用可执行脚本的名称，来运行可执行脚本，也会显示错误。

```
[email protected]:~/scripts# sample
-bash: sample: command not found
```

因为你需要显式指定 shell 解释器或可执行脚本的路径！

![][9]

如果你在其他目录下，在未提供文件正确路径的情况下，运行 shell 脚本，则会有“<ruby>找不到文件<rt>no such file or directory</rt></ruby>”的报错。

![][10]

> **把可执行文件的路径加到 PATH 变量中**
>
> 有时候，你下载了一个软件的压缩文件（tar 格式），解压这个 tar 文件，然后找到一个可执行文件和其他程序文件。你需要运行可执行文件，来运行那个软件。
>
> 但是，你需要在可执行文件的同一目录下或指定可执行文件的整个路径，才能运行那个可执行文件。这很令人烦扰。
>
> 你可以使用 `PATH` 变量来解决这个问题。`PATH` 变量包含了有各种 Linux 命令的二进制（可执行）文件的目录集合。当你运行一个命令时，你的 Linux 系统会检查 `PATH` 变量中的上述目录，以查找该命令的可执行文件。
>
> 你可以使用 `which` 命令，来检查某一命令的二进制文件的位置：
>
> ![][11]
>
> 如果你想从系统上的任何地方都能运行可执行文件或脚本，你需要将可执行文件的位置添加到 `PATH` 变量中。
>
> ![][12]
>
> 然后，`PATH` 变量需要添加到 shell 的 rc 文件中，如此对 `PATH` 变量的更改就是永久性的。
>
> 这里的要点是：你的 Linux 系统必须了解可执行脚本的位置。要么在运行时给出可执行文件的整个路径，要么将其位置添加到 `PATH` 变量中。

### 以上的内容有帮到你吗？

我懂得，当你是 Linux 新手时，很多事情可能会让你不知所措。但是，当你了解问题的根本原因时，你的知识会逐渐增加。

对于“未找到命令”报错来说，没有简单的解决方案。我提供给你了一些提示和要点，我希望这对你的故障排除有帮助。

如果你仍然有疑问或需要帮助，请在评论区告诉我吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/bash-command-not-found/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/bash-command-not-found-error.png?resize=741%2C291&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/bash-command-not-found-error-1.png?resize=800%2C450&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/command-not-found-error.png?resize=723%2C234&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/command-not-found-debian.png?resize=741%2C348&ssl=1
[5]: https://itsfoss.com/check-ip-address-ubuntu/
[6]: https://linuxhandbook.com/ping-command-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ping-command-not-found-ubuntu.png?resize=786%2C367&ssl=1
[8]: https://itsfoss.com/run-shell-script-linux/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/bash-script-command-not-found-error-800x331.png?resize=800%2C331&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/script-file-not-found-error-800x259.png?resize=800%2C259&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/path-location.png?resize=800%2C241&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/adding-executable-to-PATH-variable-linux.png?resize=800%2C313&ssl=1
[13]: https://itsfoss.com/wp-content/uploads/2022/01/alias-in-ubuntu.png