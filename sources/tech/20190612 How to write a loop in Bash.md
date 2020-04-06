[#]: collector: "lujun9972"
[#]: translator: "chunibyo-wly"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "How to write a loop in Bash"
[#]: via: "https://opensource.com/article/19/6/how-write-loop-bash"
[#]: author: "Seth Kenlon https://opensource.com/users/seth/users/goncasousa/users/howtopamm/users/howtopamm/users/seth/users/wavesailor/users/seth"

# 如何在 Bash 中使用循环

自动的使用循环对多个文件执行一系列操作和查找命令
![bash logo on green background][1]

A common reason people want to learn the Unix shell is to unlock the power of batch processing. If you want to perform some set of actions on many files, one of the ways to do that is by constructing a command that iterates over those files. In programming terminology, this is called _execution control,_ and one of the most common examples of it is the **for** loop.
人们想要学习批处理命令的一个普遍原因是批处理具有强大的功能。如果你希望对很多文件运行一些指令，制作一个可以重复运行在那些文件上的命令就是一种方法。在编程术语中，这被称作 _execution control_ ，**for**循环就是其中最常见的一个例子。

A **for** loop is a recipe detailing what actions you want your computer to take _for_ each data object (such as a file) you specify.
**for** 循环详细描述了你希望你的计算机

### The classic for loop 经典循环

An easy loop to try is one that analyzes a collection of files. This probably isn't a useful loop on its own, but it's a safe way to prove to yourself that you have the ability to handle each file in a directory individually. First, create a simple test environment by creating a directory and placing some copies of some files into it. Any file will do initially, but later examples require graphic files (such as JPEG, PNG, or similar). You can create the folder and copy files into it using a file manager or in the terminal:
一个简单的循环是分析一组文件。这个循环可能没什么用，但是这是一个安全的证明自己有能力独立处理文件夹里每一个文件的方法。首先，通过创建一个文件夹然后拷贝一些文件（例如 JPEG，PNG，或者类似的文件）到文件夹来生成一个测试环境。你可以通过文件管理器或者终端完成创建文件夹和拷贝文件的操作：

```bash
$ mkdir example
$ cp ~/Pictures/vacation/*.{png,jpg} example
```

Change directory to your new folder, then list the files in it to confirm that your test environment is what you expect:
切换到你刚创建的那个文件夹，然后列出文件确认这个测试环境是你需要的：

```
$ cd example
$ ls -1
cat.jpg
design_maori.png
otago.jpg
waterfall.png
```

The syntax to loop through each file individually in a loop is: create a variable ( **f** for file, for example). Then define the data set you want the variable to cycle through. In this case, cycle through all files in the current directory using the **\*** wildcard character (the **\*** wildcard matches _everything_ ). Then terminate this introductory clause with a semicolon ( **;** ).
在循环中逐一遍历文件的语法是：声明一个变量（例如使用 **f** 代表文件）。然后定义一个你希望用变量循环的数据集。在这种情况下，使用 **\*** 通配符来遍历当前文件夹下的所有文件（通配符 **\*** 匹配 _一切_）。然后使用一个分号（**;**）来结束这个语句。

```
`$ for f in * ;`
```

Depending on your preference, you can choose to press **Return** here. The shell won't try to execute the loop until it is syntactically complete.
按照你的个人喜好，你可以选择在这里按下 **Return**。直到语法上完成，shell 是不会尝试执行这个循环的。

Next, define what you want to happen with each iteration of the loop. For simplicity, use the **file** command to get a little bit of data about each file, represented by the **f** variable (but prepended with a **\$** to tell the shell to swap out the value of the variable for whatever the variable currently contains):
接下来，定义在每次循环中你想要进行的操作。简单起见，使用 **file** 命令来得到 **f** 变量（使用 **\$** 告诉 shell 使用这个变量的值，无论这个变量现在存储着什么）所代表的文件的信息：

```
`do file $f ;`
```

Terminate the clause with another semi-colon and close the loop:
使用另一个引号结束这一行，然后关闭这个循环：

```
`done`
```

Press **Return** to start the shell cycling through _everything_ in the current directory. The **for** loop assigns each file, one by one, to the variable **f** and runs your command:
按下 **Return** 启动 shell 对当前文件夹下 _所有东西_ 的遍历。

```
$ for f in * ; do
> file $f ;
> done
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

You can also write it this way:
你也可以这样书写命令：

```
$ for f in *; do file $f; done
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

Both the multi-line and single-line formats are the same to your shell and produce the exact same results.
对你的 shell 来说，多行和单行的格式没有什么区别，并且会输出完全一样的结果。

### A practical example 一个实用的例子

Here's a practical example of how a loop can be useful for everyday computing. Assume you have a collection of vacation photos you want to send to friends. Your photo files are huge, making them too large to email and inconvenient to upload to your [photo-sharing service][2]. You want to create smaller web-versions of your photos, but you have 100 photos and don't want to spend the time reducing each photo, one by one.
下面是一个循环在日常使用中的实用案例。假如你拥有一堆假期拍的照片想要发给你的朋友。它们对于 email 来说太大了，上传到 [photo-sharing service][2] 也不方便。你希望创建小型的 web 版本的照片，但是你不希望花费时间在一个接一个的压缩图片体积上。

First, install the **ImageMagick** command using your package manager on Linux, BSD, or Mac. For instance, on Fedora and RHEL:
首先，在你的 Linux，BSD 或者 Mac 上使用包管理器安装 **ImageMagick** 命令。例如，在 Fedora 和 RHEL 上：

```
`$ sudo dnf install ImageMagick`
```

On Ubuntu or Debian:
在 Ubuntu 和 Debian 上：

```
`$ sudo apt install ImageMagick`
```

On BSD, use **ports** or [pkgsrc][3]. On Mac, use [Homebrew][4] or [MacPorts][5].
在 BSD 上，使用 **ports** 或者 [pkgsrc][3]。在 Mac 上，使用 [Homebrew][4] 或者 [MacPorts][5]。

Once you install ImageMagick, you have a set of new commands to operate on photos.
在你安装了 ImageMagick 之后，你就用有一系列命令可以用来操作图片了。

Create a destination directory for the files you're about to create:
为你将要创建的文件建立一个目标文件夹：

```
`$ mkdir tmp`
```

To reduce each photo to 33% of its original size, try this loop:
使用下面的循环将每张图片减小到原来大小的 33%。

```
`$ for f in * ; do convert $f -scale 33% tmp/$f ; done`
```

Then look in the **tmp** folder to see your scaled photos.
然后就可以在 **tmp** 文件夹中看到自己已经缩小了的照片了。

You can use any number of commands within a loop, so if you need to perform complex actions on a batch of files, you can place your whole workflow between the **do** and **done** statements of a **for** loop. For example, suppose you want to copy each processed photo straight to a shared photo directory on your web host and remove the photo file from your local system:
你可以在循环体中使用任意数量的命令。所以如果你需要对一批文件进行复杂的操作，你可以将你的一系列命令放在一个 **for** 循环的 **do** 和 **done** 声明间。

```
$ for f in * ; do
convert $f -scale 33% tmp/$f
scp -i seth_web tmp/$f [seth@example.com][6]:~/public_html
trash tmp/$f ;
done
```

For each file processed by the **for** loop, your computer automatically runs three commands. This means if you process just 10 photos this way, you save yourself 30 commands and probably at least as many minutes.
你的计算机会对 **for** 循环中处理的每一个文件自动的执行 3 条命令。这意味着加入你仅仅处理 10 张图片，也会省下 30 条指令和更多时间。

### Limiting your loop 限制你的循环

A loop doesn't always have to look at every file. You might want to process only the JPEG files in your example directory:
一个循环常常不需要处理所有文件。在示例文件夹中，你或许只需要处理 JPEG 文件。

```
$ for f in *.jpg ; do convert $f -scale 33% tmp/$f ; done
$ ls -m tmp
cat.jpg, otago.jpg
```

Or, instead of processing files, you may need to repeat an action a specific number of times. A **for** loop's variable is defined by whatever data you provide it, so you can create a loop that iterates over numbers instead of files:
或者，你希望重复特定次数的某个操作而不是处理文件。**for** 循环的变量被定义为你赋给它的无论什么数据，所以你可以创建一个循环遍历数字而不是文件：

```
$ for n in {0..4}; do echo $n ; done
0
1
2
3
4
```

### More looping 更多循环

You now know enough to create your own loops. Until you're comfortable with looping, use them on _copies_ of the files you want to process and, as often as possible, use commands with built-in safeguards to prevent you from clobbering your data and making irreparable mistakes, like accidentally renaming an entire directory of files to the same name, each overwriting the other.
现在你了解的知识已经足够用来创建自己的循环体了。直到你对循环熟悉前，尽可能的在需要处理的文件的复制上进行操作。使用固有的保护措施预防损坏自己的数据和制造不可复现的错误，例如偶然将一个文件夹下的所有文件重命名为同一个名字，导致了他们的互相覆盖。

For advanced **for** loop topics, read on.
更多的 **for** 循环话题，请继续阅读。

### Not all shells are Bash 不是所有的 shell 都是 Bash

The **for** keyword is built into the Bash shell. Many similar shells use the same keyword and syntax, but some shells, like [tcsh][7], use a different keyword, like **foreach** , instead.
关键字 **for** 是内置在 Bash shell 中的。许多类似的 shell 使用和 Bash 同样的关键字和语法，但是也有某些 shell ，比如 [tcsh][7]，使用不同的关键字，例如 **foreach**。

In tcsh, the syntax is similar in spirit but more strict than Bash. In the following code sample, do not type the string **foreach?** in lines 2 and 3. It is a secondary prompt alerting you that you are still in the process of building your loop.
tcsh 的语法在精神上与 Bash 类似，但是它更为严格。在下面的例子中，不要在你的终端的第 2，3 行键入 **foreach?** 。这只是一个告诉你，你仍处在构建循环的过程中的辅助提示。

```
$ foreach f (*)
foreach? file $f
foreach? end
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

In tcsh, both **foreach** and **end** must appear alone on separate lines, so you cannot create a **for** loop on one line as you can with Bash and similar shells.
在 tcsh 中，**foreach** 和 **end** 都必须单独的在一行中出现。因此你不能像 Bash 或者其他类似的 shell 一样只使用一行命令创建一个 **for** 循环。

### For loops with the find command for 循环与 find 命令

In theory, you could find a shell that doesn't provide a **for** loop function, or you may just prefer to use a different command with added features.
理论上，你可能使用不支持 **for** 循环的 shell，或者你只是更想使用其他命令的新特性。

The **find** command is another way to implement the functionality of a **for** loop, as it offers several ways to define the scope of which files to include in your loop as well as options for [Parallel][8] processing.
使用**find** 命令是另一个实现 **for** 循环功能的途径。这个命令通过并行处理提供了几种方法来定义你的循环中需要包括的文件的范围。

The **find** command is meant to help you find files on your hard drives. Its syntax is simple: you provide the path of the location you want to search, and **find** finds all files and directories:
**find** 命令顾名思义是帮助你查询存储在硬盘里的文件。他的用法很简单：提供一个你希望它查询的位置的路径，然后 **find** 就会查询这个路径下面的所有文件和文件夹。

```
$ find .
.
./cat.jpg
./design_maori.png
./otago.jpg
./waterfall.png
```

You can filter the search results by adding some portion of the name:
你可以通过添加名称的某些部分来过滤搜索结果。

```
$ find . -name "*jpg"
./cat.jpg
./otago.jpg
```

The great thing about **find** is that each file it finds can be fed into a loop using the **-exec** flag. For instance, to scale down only the PNG photos in your example directory:
**find** 命令最好的事情是你可以通过 **-exec** 参数标志将它查询到的每一个文件放入循环中。例如，只对存放在你的 example 文件夹下的 PNG 图片进行体积压缩操作。

```
$ find . -name "*png" -exec convert {} -scale 33% tmp/{} \;
$ ls -m tmp
design_maori.png, waterfall.png
```

In the **-exec** clause, the bracket characters **{}** stand in for whatever item **find** is processing (in other words, any file ending in PNG that has been located, one at a time). The **-exec** clause must be terminated with a semicolon, but Bash usually tries to use the semicolon for itself. You "escape" the semicolon with a backslash ( **\;** ) so that **find** knows to treat that semicolon as its terminating character.

The **find** command is very good at what it does, and it can be too good sometimes. For instance, if you reuse it to find PNG files for another photo process, you will get a few errors:

```
$ find . -name "*png" -exec convert {} -flip -flop tmp/{} \;
convert: unable to open image `tmp/./tmp/design_maori.png':
No such file or directory @ error/blob.c/OpenBlob/2643.
...
```

It seems that **find** has located all the PNG files—not only the ones in your current directory ( **.** ) but also those that you processed before and placed in your **tmp** subdirectory. In some cases, you may want **find** to search the current directory plus all other directories within it (and all directories in _those_ ). It can be a powerful recursive processing tool, especially in complex file structures (like directories of music artists containing directories of albums filled with music files), but you can limit this with the **-maxdepth** option.

To find only PNG files in the current directory (excluding subdirectories):

```
`$ find . -maxdepth 1 -name "*png"`
```

To find and process files in the current directory plus an additional level of subdirectories, increment the maximum depth by 1:

```
`$ find . -maxdepth 2 -name "*png"`
```

Its default is to descend into all subdirectories.

### Looping for fun and profit

The more you use loops, the more time and effort you save, and the bigger the tasks you can tackle. You're just one user, but with a well-thought-out loop, you can make your computer do the hard work.

You can and should treat looping like any other command, keeping it close at hand for when you need to repeat a single action or two on several files. However, it's also a legitimate gateway to serious programming, so if you have to accomplish a complex task on any number of files, take a moment out of your day to plan out your workflow. If you can achieve your goal on one file, then wrapping that repeatable process in a **for** loop is relatively simple, and the only "programming" required is an understanding of how variables work and enough organization to separate unprocessed from processed files. With a little practice, you can move from a Linux user to a Linux user who knows how to write a loop, so get out there and make your computer work for you!

---

via: https://opensource.com/article/19/6/how-write-loop-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者 ID](https://github.com/chunibyo-wly)
校对：[校对者 ID](https://github.com/校对者ID)

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
