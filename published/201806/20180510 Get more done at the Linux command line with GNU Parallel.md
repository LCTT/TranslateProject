使用 GNU Parallel 提高 Linux 命令行执行效率
======

> 将您的计算机变成一个多任务的动力室。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

你是否有过这种感觉，你的主机运行速度没有预期的那么快？我也曾经有过这种感觉，直到我发现了 GNU Parallel。

GNU Parallel 是一个 shell 工具，可以并行执行任务。它可以解析多种输入，让你可以同时在多份数据上运行脚本或命令。你终于可以使用全部的 CPU 了！

如果你用过 `xargs`，上手 Parallel 几乎没有难度。如果没有用过，这篇教程会告诉你如何使用，同时给出一些其它的用例。

### 安装 GNU Parallel

GNU Parallel 很可能没有预装在你的 Linux 或 BSD 主机上，你可以从软件源中安装。以 Fedora 为例：

```
$ sudo dnf install parallel
```

对于 NetBSD：

```
# pkg_add parallel
```

如果各种方式都不成功，请参考[项目主页][1]。

### 从串行到并行

正如其名称所示，Parallel 的强大之处是以并行方式执行任务；而我们中不少人平时仍然以串行方式运行任务。

当你对多个对象执行某个命令时，你实际上创建了一个任务队列。一部分对象可以被命令处理，剩余的对象需要等待，直到命令处理它们。这种方式是低效的。只要数据够多，总会形成任务队列；但与其只使用一个任务队列，为何不使用多个更小规模的任务队列呢？

假设你有一个图片目录，你希望将目录中的图片从 JEEG 格式转换为 PNG 格式。有多种方法可以完成这个任务。可以手动用 GIMP 打开每个图片，输出成新格式，但这基本是最差的选择，费时费力。

上述方法有一个漂亮且简洁的变种，即基于 shell 的方案：

```
$ convert 001.jpeg 001.png
$ convert 002.jpeg 002.png
$ convert 003.jpeg 003.png
... 略 ...
```

对于初学者而言，这是一个不小的转变，而且看起来是个不小的改进。不再需要图像界面和不断的鼠标点击，但仍然是费力的。

进一步改进：

```
$ for i in *jpeg; do convert $i $i.png ; done
```

至少，这一步设置好任务执行，让你节省时间去做更有价值的事情。但问题来了，这仍然是串行操作；一张图片转换完成后，队列中的下一张进行转换，依此类推直到全部完成。

使用 Parallel:

```
$ find . -name "*jpeg" | parallel -I% --max-args 1 convert % %.png
```

这是两条命令的组合：`find` 命令，用于收集需要操作的对象；`parallel` 命令，用于对象排序并确保每个对象按需处理。

  * `find . -name "*jpeg"` 查找当前目录下以 `jpeg` 结尾的所有文件。
  * `parallel` 调用 GNU Parallel。
  * `-I%` 创建了一个占位符 `%`，代表 `find` 传递给 Parallel 的内容。如果不使用占位符，你需要对 `find` 命令的每一个结果手动编写一个命令，而这恰恰是你想要避免的。
  * `--max-args 1` 给出 Parallel 从队列获取新对象的速率限制。考虑到 Parallel 运行的命令只需要一个文件输入，这里将速率限制设置为 1。假如你需要执行更复杂的命令，需要两个文件输入（例如 `cat 001.txt 002.txt > new.txt`），你需要将速率限制设置为 2。
  * `convert % %.png` 是你希望 Parallel 执行的命令。

组合命令的执行效果如下：`find` 命令收集所有相关的文件信息并传递给 `parallel`，后者（使用当前参数）启动一个任务，（无需等待任务完成）立即获取参数行中的下一个参数（LCTT 译注：管道输出的每一行对应 `parallel` 的一个参数，所有参数构成参数行）；只要你的主机没有瘫痪，Parallel 会不断做这样的操作。旧任务完成后，Parallel 会为分配新任务，直到所有数据都处理完成。不使用 Parallel 完成任务大约需要 10 分钟，使用后仅需 3 至 5 分钟。

### 多个输入

只要你熟悉 `find` 和 `xargs` （整体被称为 GNU 查找工具，或 `findutils`），`find` 命令是一个完美的 Parallel 数据提供者。它提供了灵活的接口，大多数 Linux 用户已经很习惯使用，即使对于初学者也很容易学习。

`find` 命令十分直截了当：你向 `find` 提供搜索路径和待查找文件的一部分信息。可以使用通配符完成模糊搜索；在下面的例子中，星号匹配任何字符，故 `find` 定位（文件名）以字符 `searchterm` 结尾的全部文件：

```
$ find /path/to/directory -name "*searchterm"
```

默认情况下，`find` 逐行返回搜索结果，每个结果对应 1 行：

```
$ find ~/graphics -name "*jpg"
/home/seth/graphics/001.jpg
/home/seth/graphics/cat.jpg
/home/seth/graphics/penguin.jpg
/home/seth/graphics/IMG_0135.jpg
```

当使用管道将 `find` 的结果传递给 `parallel` 时，每一行中的文件路径被视为 `parallel` 命令的一个参数。另一方面，如果你需要使用命令处理多个参数，你可以改变队列数据传递给 `parallel` 的方式。

下面先给出一个不那么实际的例子，后续会做一些修改使其更加有意义。如果你安装了 GNU Parallel，你可以跟着这个例子操作。

假设你有 4 个文件，按照每行一个文件的方式列出，具体如下：

```
$ echo ada > ada ; echo lovelace > lovelace
$ echo richard > richard ; echo stallman > stallman
$ ls -1
ada
lovelace
richard
stallman
```

你需要将两个文件合并成第三个文件，后者同时包含前两个文件的内容。这种情况下，Parallel 需要访问两个文件，使用 `-I%` 变量的方式不符合本例的预期。

Parallel 默认情况下读取 1 个队列对象：

```
$ ls -1 | parallel echo
ada
lovelace
richard
stallman
```

现在让 Parallel 每个任务使用 2 个队列对象：

```
$ ls -1 | parallel --max-args=2 echo
ada lovelace
richard stallman
```

现在，我们看到行已经并合并；具体而言，`ls -1` 的两个查询结果会被同时传送给 Parallel。传送给 Parallel 的参数涉及了任务所需的 2 个文件，但目前还只是 1 个有效参数：（对于两个任务分别为）“ada lovelace” 和 “richard stallman”。你真正需要的是每个任务对应 2 个独立的参数。

值得庆幸的是，Parallel 本身提供了上述所需的解析功能。如果你将 `--max-args` 设置为 `2`，那么 `{1}` 和 `{2}` 这两个变量分别代表传入参数的第一和第二部分：

```
$ ls -1 | parallel --max-args=2 cat {1} {2} ">" {1}_{2}.person
```

在上面的命令中，变量 `{1}` 值为 `ada` 或 `richard` （取决于你选取的任务），变量 `{2}` 值为 `lovelace` 或 `stallman`。通过使用重定向符号（放到引号中，防止被 Bash 识别，以便 Parallel 使用），（两个）文件的内容被分别重定向至新文件 `ada_lovelace.person` 和 `richard_stallman.person`。

```
$ ls -1
ada
ada_lovelace.person
lovelace
richard
richard_stallman.person
stallman

$ cat ada_*person
ada lovelace
$ cat ri*person
richard stallman
```

如果你整天处理大量几百 MB 大小的日志文件，那么（上述）并行处理文本的方法对你帮忙很大；否则，上述例子只是个用于上手的示例。

然而，这种处理方法对于很多文本处理之外的操作也有很大帮助。下面是来自电影产业的真实案例，其中需要将一个目录中的视频文件和（对应的）音频文件进行合并。

```
$ ls -1
12_LS_establishing-manor.avi
12_wildsound.flac
14_butler-dialogue-mixed.flac
14_MS_butler.avi
...略...
```

使用同样的方法，使用下面这个简单命令即可并行地合并文件：

```
$ ls -1 | parallel --max-args=2 ffmpeg -i {1} -i {2} -vcodec copy -acodec copy {1}.mkv
```

### 简单粗暴的方式

上述花哨的输入输出处理不一定对所有人的口味。如果你希望更直接一些，可以将一堆命令甩给 Parallel，然后去干些其它事情。

首先，需要创建一个文本文件，每行包含一个命令：

```
$ cat jobs2run
bzip2 oldstuff.tar
oggenc music.flac
opusenc ambiance.wav
convert bigfile.tiff small.jpeg
ffmepg -i foo.avi -v:b 12000k foo.mp4
xsltproc --output build/tmp.fo style/dm.xsl src/tmp.xml
bzip2 archive.tar
```

接着，将文件传递给 Parallel：

```
$ parallel --jobs 6 < jobs2run
```

现在文件中对应的全部任务都在被 Parallel 执行。如果任务数量超过允许的数目（LCTT 译注：应该是 `--jobs` 指定的数目或默认值），Parallel 会创建并维护一个队列，直到任务全部完成。

### 更多内容

GNU Parallel 是个强大而灵活的工具，还有很多很多用例无法在本文中讲述。工具的 man 页面提供很多非常酷的例子可供你参考，包括通过 SSH 远程执行和在 Parallel 命令中使用 Bash 函数等。[YouTube][2] 上甚至有一个系列，包含大量操作演示，让你可以直接从 GNU Parallel 团队学习。GNU Paralle 的主要维护者还发布了官方使用指导手册，可以从 [Lulu.com][3] 获取。

GNU Parallel 有可能改变你完成计算的方式；即使没有，也会至少改变你主机花在计算上的时间。马上上手试试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/gnu-parallel

作者：[Seth Kenlon][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]:https://www.gnu.org/software/parallel
[2]:https://www.youtube.com/watch?v=OpaiGYxkSuQ&list=PL284C9FF2488BC6D1
[3]:http://www.lulu.com/shop/ole-tange/gnu-parallel-2018/paperback/product-23558902.html
