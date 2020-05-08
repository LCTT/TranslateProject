[#]: collector: "lujun9972"
[#]: translator: "chunibyo-wly"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12088-1.html"
[#]: subject: "How to write a loop in Bash"
[#]: via: "https://opensource.com/article/19/6/how-write-loop-bash"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

如何在 Bash 中使用循环
======

> 使用循环和查找命令批量自动对多个文件进行一系列的操作。

![](https://img.linux.net.cn/data/attachment/album/202004/08/225655by8i8k7uyppp18ph.jpg)

人们希望学习批处理命令的一个普遍原因是要得到批处理强大的功能。如果你希望批量的对文件执行一些指令，构造一个可以重复运行在那些文件上的命令就是一种方法。在编程术语中，这被称作*执行控制*，`for` 循环就是其中最常见的一种。

`for` 循环可以详细描述你希望计算机对你指定的每个数据对象（比如说文件）所进行的操作。

### 一般的循环

使用循环的一个简单例子是对一组文件进行分析。这个循环可能没什么用，但是这是一个安全的证明自己有能力独立处理文件夹里每一个文件的方法。首先，创建一个文件夹然后拷贝一些文件（例如 JPEG、PNG 等类似的文件）至文件夹中生成一个测试环境。你可以通过文件管理器或者终端来完成创建文件夹和拷贝文件的操作：

```bash
$ mkdir example
$ cp ~/Pictures/vacation/*.{png,jpg} example
```

切换到你刚创建的那个新文件夹，然后列出文件并确认这个测试环境是你需要的：

```
$ cd example
$ ls -1
cat.jpg
design_maori.png
otago.jpg
waterfall.png
```

在循环中逐一遍历文件的语法是：首先声明一个变量（例如使用 `f` 代表文件），然后定义一个你希望用变量循环的数据集。在这种情况下，使用 `*` 通配符来遍历当前文件夹下的所有文件（通配符 `*` 匹配*所有文件*）。然后使用一个分号（`;`）来结束这个语句。

```
$ for f in * ;
```

取决于你个人的喜好，你可以选择在这里按下回车键。在语法完成前，shell 是不会尝试执行这个循环的。

接下来，定义你想在每次循环中进行的操作。简单起见，使用 `file` 命令来得到 `f` 变量（使用 `$` 告诉 shell 使用这个变量的值，无论这个变量现在存储着什么）所存储着的文件的各种信息：

```
do file $f ;
```

使用另一个分号结束这一行，然后关闭这个循环：

```
done
```

按下回车键启动 shell 对当前文件夹下*所有东西*的遍历。`for` 循环将会一个一个的将文件分配给变量 `f` 并且执行你的命令：

```
$ for f in * ; do
> file $f ;
> done
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

你也可以用这种形式书写命令：

```
$ for f in *; do file $f; done
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

对你的 shell 来说，多行和单行的格式没有什么区别，并且会输出完全一样的结果。

### 一个实用的例子

下面是一个循环在日常使用中的实用案例。假如你拥有一堆假期拍的照片想要发给你的朋友。但你的照片太大了，无法通过电子邮件发送，上传到[图片分享服务][2]也不方便。因此你想为你的照片创建小型的 web 版本，但是你不希望花费太多时间在一个一个的压缩图片体积上。

首先，在你的 Linux、BSD 或者 Mac 上使用包管理器安装 ImageMagick 命令。例如，在 Fedora 和 RHEL 上：

```
$ sudo dnf install ImageMagick
```

在 Ubuntu 和 Debian 上：

```
$ sudo apt install ImageMagick
```

在 BSD 上，使用 `ports` 或者 [pkgsrc][3] 安装。在 Mac 上，使用 [Homebrew][4] 或者 [MacPorts][5] 安装。

在你安装了 ImageMagick 之后，你就拥有一系列可以用来操作图片的新命令了。

为你将要创建的文件建立一个目标文件夹：

```
$ mkdir tmp
```

使用下面的循环可以将每张图片减小至原来大小的 33%。

```
$ for f in * ; do convert $f -scale 33% tmp/$f ; done
```

然后就可以在 `tmp` 文件夹中看到已经缩小了的照片了。

你可以在循环体中使用任意数量的命令，因此如果你需要对一批文件进行复杂的操作，可以将你的命令放在一个 `for` 循环的 `do` 和 `done` 语句之间。例如，假设你希望将所有处理过的图片拷贝至你的网站所托管的图片文件夹并且在本地系统移除这些文件：

```
$ for f in * ; do
  convert $f -scale 33% tmp/$f
  scp -i seth_web tmp/$f seth@example.com:~/public_html
  trash tmp/$f ;
done
```

你的计算机会对 `for` 循环中处理的每一个文件自动的执行 3 条命令。这意味着假如你仅仅处理 10 张图片，也会省下输入 30 条指令和更多的时间。

### 限制你的循环

一个循环常常不需要处理所有文件。在示例文件夹中，你可能需要处理的只是 JPEG 文件：

```
$ for f in *.jpg ; do convert $f -scale 33% tmp/$f ; done
$ ls -m tmp
cat.jpg, otago.jpg
```

或者，你希望重复特定次数的某个操作而不仅仅只处理文件。`for` 循环的变量的值是被你赋给它的（不管何种类型的）数据所决定的，所以你可以创建一个循环遍历数字而不只是文件：

```
$ for n in {0..4}; do echo $n ; done
0
1
2
3
4
```

### 更多循环

现在你了解的知识已经足够用来创建自己的循环体了。直到你对循环非常熟悉之前，尽可能的在需要处理的文件的*副本*上进行操作。使用内置的保护措施可以预防损坏自己的数据和制造不可复现的错误，例如偶然将一个文件夹下的所有文件重命名为同一个名字，就可能会导致他们的相互覆盖。

更进一步的 `for` 循环话题，请继续阅读。

### 不是所有的 shell 都是 Bash

关键字 `for` 是内置在 Bash shell 中的。许多类似的 shell 会使用和 Bash 同样的关键字和语法，但是也有某些 shell ，比如 [tcsh][7]，使用不同的关键字，例如 `foreach`。

tcsh 的语法与 Bash 类似，但是它更为严格。例如在下面的例子中，不要在你的终端的第 2、3 行键入 `foreach?` 。它只是提示你仍处在构建循环的过程中。

```
$ foreach f (*)
foreach? file $f
foreach? end
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

在 tcsh 中，`foreach` 和 `end` 都必须单独的在一行中出现。因此你不能像 Bash 或者其他类似的 shell 一样只使用一行命令创建一个 `for` 循环。

### for 循环与 find 命令

理论上，你可能会用到不支持 `for` 循环的 shell，或者你只是更想使用其他命令的一些特性来完成和循环一样的工作。

使用 `find` 命令是另一个实现 `for` 循环功能的途径。这个命令提供了多种方法来定义循环中包含哪些文件的范围以及[并行][8]处理的选项。

`find` 命令顾名思义就是帮助你查询存储在硬盘里的文件。它的用法很简单：提供一个你希望它查询的位置的路径，接着 `find` 就会查询这个路径下面的所有文件和文件夹。

```
$ find .
.
./cat.jpg
./design_maori.png
./otago.jpg
./waterfall.png
```

你可以通过添加名称的某些部分来过滤搜索结果：

```
$ find . -name "*jpg"
./cat.jpg
./otago.jpg
```

`find` 命令非常好的地方在于你可以通过 `-exec` 参数标志将它查询到的每一个文件放入循环中。例如，只对存放在你的 `example` 文件夹下的 PNG 图片进行体积压缩操作：

```
$ find . -name "*png" -exec convert {} -scale 33% tmp/{} \;
$ ls -m tmp
design_maori.png, waterfall.png
```

在 `-exec` 短语中，括号 `{}` 表示的是 `find` 正在处理的条目（换句话说，每一个被找到的以 PNG 结尾的文件）。`-exec` 短语必须使用分号结尾，但是 Bash 中常常也会使用分号。为了解决这个二义性问题，你的 `结束符` 可以使用反斜杠加上一个分号（`\;`），使得 `find` 命令可以知道这个结束符是用来标识自己结束使用的。

`find` 命令的操作非常棒，某些情况下它甚至可以表现得更棒。比如说，在一个新的进程中使用同一条命令查找 PNG 文件，你可能就会得到一些错误信息：

```
$ find . -name "*png" -exec convert {} -flip -flop tmp/{} \;
convert: unable to open image `tmp/./tmp/design_maori.png':
No such file or directory @ error/blob.c/OpenBlob/2643.
...
```

看起来 `find` 不只是定位了当前文件夹（`.`）下的所有 PNG 文件，还包括已经处理并且存储到了 `tmp` 下的文件。在一些情况下，你可能希望 `find` 查询当前文件夹下再加上其子文件夹下的所有文件。`find` 命令是一个功能强大的递归工具，特别体现在处理一些文件结构复杂的情境下（比如用来放置存满了音乐人音乐专辑的文件夹），同时你也可以使用 `-maxdepth` 选项来限制最大的递归深度。

只在当前文件夹下查找 PNG 文件（不包括子文件夹）：

```
$ find . -maxdepth 1 -name "*png"
```

上一条命令的最大深度再加 1 就可以查找和处理当前文件夹及下一级子文件夹下面的文件：

```
$ find . -maxdepth 2 -name "*png"
```

`find` 命令默认是查找每一级文件夹。

### 循环的乐趣与收益

你使用的循环越多，你就可以越多的省下时间和力气，并且可以应对庞大的任务。虽然你只是一个用户，但是通过使用循环，可以使你的计算机完成困难的任务。

你可以并且应该就像使用其他的命令一样使用循环。在你需要重复处理单个或多个文件时，尽可能的使用这个命令。无论如何，这也算是一项需要被严肃对待的编程活动，因此如果你需要在一些文件上完成复杂的任务，你应该多花点时间在规划自己的工作流上面。如果你可以在一份文件上完成你的工作，接下来将操作包装进 `for` 循环里就相对简单了，这里面唯一的“编程”的需要只是理解变量是如何工作的并且进行充分的规划工作将已处理过的文件和未处理过的文件分开。经过一段时间的练习，你就可以从一名 Linux 用户升级成一位知道如何使用循环的 Linux 用户，所以开始让计算机为你工作吧！

---

via: https://opensource.com/article/19/6/how-write-loop-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[chunibyo-wly](https://github.com/chunibyo-wly)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/goncasousa/users/howtopamm/users/howtopamm/users/seth/users/wavesailor/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U "bash logo on green background"
[2]: http://nextcloud.com
[3]: http://pkgsrc.org
[4]: http://brew.sh
[5]: https://www.macports.org
[6]: mailto:seth@example.com
[7]: https://en.wikipedia.org/wiki/Tcsh
[8]: https://opensource.com/article/18/5/gnu-parallel
