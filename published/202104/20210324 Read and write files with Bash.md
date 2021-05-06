[#]: subject: (Read and write files with Bash)
[#]: via: (https://opensource.com/article/21/3/input-output-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13259-1.html)

用 Bash 读写文件
======

> 学习 Bash 读取和写入数据的不同方式，以及何时使用每种方法。

![](https://img.linux.net.cn/data/attachment/album/202104/01/223653bc334ac33e5e4pwe.jpg)

当你使用 Bash 编写脚本时，有时你需要从一个文件中读取数据或向一个文件写入数据。有时文件可能包含配置选项，而另一些时候这个文件是你的用户用你的应用创建的数据。每种语言处理这个任务的方式都有些不同，本文将演示如何使用 Bash 和其他 [POSIX][2] shell 处理数据文件。

### 安装 Bash

如果你在使用 Linux，你可能已经有了 Bash。如果没有，你可以在你的软件仓库里找到它。

在 macOS 上，你可以使用默认终端，Bash 或 [Zsh][3]，这取决于你运行的 macOS 版本。

在 Windows 上，有几种方法可以体验 Bash，包括微软官方支持的 [Windows Subsystem for Linux][4]（WSL）。

安装 Bash 后，打开你最喜欢的文本编辑器并准备开始。

### 使用 Bash 读取文件

除了是 [shell][5] 之外，Bash 还是一种脚本语言。有几种方法可以从 Bash 中读取数据。你可以创建一种数据流并解析输出, 或者你可以将数据加载到内存中。这两种方法都是有效的获取信息的方法，但每种方法都有相当具体的用例。

#### 在 Bash 中援引文件

当你在 Bash 中 “<ruby>援引<rt>source</rt></ruby>” 一个文件时，你会让 Bash 读取文件的内容，期望它包含有效的数据，Bash 可以将这些数据放入它建立的数据模型中。你不会想要从旧文件中援引数据，但你可以使用这种方法来读取配置文件和函数。

（LCTT 译注：在 Bash 中，可以通过 `source` 或 `.` 命令来将一个文件读入，这个行为称为 “sourcing”，英文原意为“一次性（试）采购”、“寻找供应商”、“获得”等，考虑到 Bash 的语境和发音，我建议可以翻译为“援引”，或有不当，供大家讨论参考 —— wxy）

例如，创建一个名为 `example.sh` 的文件，并输入以下内容：

```
#!/bin/sh

greet opensource.com

echo "The meaning of life is $var"
```

运行这段代码，看见失败了：

```
$ bash ./example.sh
./example.sh: line 3: greet: command not found
The meaning of life is
```

Bash 没有一个叫 `greet` 的命令，所以无法执行那一行，也没有一个叫 `var` 的变量记录，所以文件没有意义。为了解决这个问题，建立一个名为 `include.sh` 的文件：

```
greet() {
    echo "Hello ${1}"
}

var=42
```

修改你的 `example.sh` 脚本，加入一个 `source` 命令：

```
#!/bin/sh

source include.sh

greet opensource.com

echo "The meaning of life is $var"
```

运行脚本，可以看到工作了：

```
$ bash ./example.sh
Hello opensource.com
The meaning of life is 42
```

`greet` 命令被带入你的 shell 环境，因为它被定义在 `include.sh` 文件中，它甚至可以识别参数（本例中的 `opensource.com`）。变量 `var` 也被设置和导入。

#### 在 Bash 中解析文件

另一种让数据“进入” Bash 的方法是将其解析为数据流。有很多方法可以做到这一点. 你可以使用 `grep` 或 `cat` 或任何可以获取数据并管道输出到标准输出的命令。另外，你可以使用 Bash 内置的东西：重定向。重定向本身并不是很有用，所以在这个例子中，我也使用内置的 `echo` 命令来打印重定向的结果：

```
#!/bin/sh

echo $( &lt; include.sh )
```

将其保存为 `stream.sh` 并运行它来查看结果：

```
$ bash ./stream.sh
greet() { echo "Hello ${1}" } var=42
$
```

对于 `include.sh` 文件中的每一行，Bash 都会将该行打印（或 `echo`）到你的终端。先用管道把它传送到一个合适的解析器是用 Bash 读取数据的常用方法。例如, 假设 `include.sh` 是一个配置文件, 它的键和值对用一个等号（`=`）分开. 你可以用 `awk` 甚至 `cut` 来获取值：

```
#!/bin/sh

myVar=`grep var include.sh | cut -d'=' -f2`

echo $myVar
```

试着运行这个脚本：

```
$ bash ./stream.sh
42
```

### 用 Bash 将数据写入文件

无论你是要存储用户用你的应用创建的数据，还是仅仅是关于用户在应用中做了什么的元数据（例如，游戏保存或最近播放的歌曲），都有很多很好的理由来存储数据供以后使用。在 Bash 中，你可以使用常见的 shell 重定向将数据保存到文件中。

例如, 要创建一个包含输出的新文件, 使用一个重定向符号：

```
#!/bin/sh

TZ=UTC
date > date.txt
```

运行脚本几次：

```
$ bash ./date.sh
$ cat date.txt
Tue Feb 23 22:25:06 UTC 2021
$ bash ./date.sh
$ cat date.txt
Tue Feb 23 22:25:12 UTC 2021
```

要追加数据，使用两个重定向符号：

```
#!/bin/sh

TZ=UTC
date >> date.txt
```

运行脚本几次：

```
$ bash ./date.sh
$ bash ./date.sh
$ bash ./date.sh
$ cat date.txt
Tue Feb 23 22:25:12 UTC 2021
Tue Feb 23 22:25:17 UTC 2021
Tue Feb 23 22:25:19 UTC 2021
Tue Feb 23 22:25:22 UTC 2021
```

### Bash 轻松编程

Bash 的优势在于简单易学，因为只需要一些基本的概念，你就可以构建复杂的程序。完整的文档请参考 GNU.org 上的 [优秀的 Bash 文档][6]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/input-output-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/9/getting-started-zsh
[4]: https://opensource.com/article/19/7/ways-get-started-linux#wsl
[5]: https://www.redhat.com/sysadmin/terminals-shells-consoles
[6]: http://gnu.org/software/bash
