[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10624-1.html)
[#]: subject: (All about {Curly Braces} in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/2/all-about-curly-braces-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

浅析 Bash 中的 {花括号}
======
> 让我们继续我们的 Bash 基础之旅，来近距离观察一下花括号，了解一下如何和何时使用它们。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/curly-braces-1920.jpg?itok=cScRhWrX)

在前面的 Bash 基础系列文章中，我们或多或少地使用了一些还没有讲到的符号。在之前文章的很多例子中，我们都使用到了括号，但并没有重点讲解关于括号的内容。

这个系列接下来的文章中，我们会研究括号们的用法：如何使用这些括号？将它们放在不同的位置会有什么不同的效果？除了圆括号、方括号、花括号以外，我们还会接触另外的将一些内容“包裹”起来的符号，例如单引号、双引号和反引号。

在这周，我们先来看看花括号 `{}`。

### 构造序列

花括号在之前的《[点的含义][1]》这篇文章中已经出现过了，当时我们只对点号 `.` 的用法作了介绍。但在构建一个序列的过程中，同样不可以缺少花括号。

我们使用

```
echo {0..10}
```

来顺序输出 0 到 10 这 11 个数。使用

```
echo {10..0}
```

可以将这 11 个数倒序输出。更进一步，可以使用

```
echo {10..0..2}
```

来跳过其中的奇数。

而

```
echo {z..a..2}
```

则从倒序输出字母表，并跳过其中的第奇数个字母。

以此类推。

还可以将两个序列进行组合：

```
echo {a..z}{a..z}
```

这个命令会将从 aa 到 zz 的所有双字母组合依次输出。

这是很有用的。在 Bash 中，定义一个数组的方法是在圆括号 `()` 中放置各个元素并使用空格隔开，就像这样：

```
month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
```

如果需要获取数组中的元素，就要使用方括号 `[]` 并在其中填入元素的索引：

```
$ echo ${month[3]} # 数组索引从 0 开始，因此 [3] 对应第 4 个元素
Apr
```

先不要过分关注这里用到的三种括号，我们等下会讲到。

注意，像上面这样，我们可以定义这样一个数组：

```
letter_combos=({a..z}{a..z})
```

其中 `letter_combos` 变量指向的数组依次包含了从 aa 到 zz 的所有双字母组合。

因此，还可以这样定义一个数组：

```
dec2bin=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
```

在这里，`dec2bin` 变量指向的数组按照升序依次包含了所有 8 位的二进制数，也就是 00000000、00000001、00000010，……，11111111。这个数组可以作为一个十进制数到 8 位二进制数的转换器。例如将十进制数 25 转换为二进制数，可以这样执行：

```
$ echo ${dec2bin[25]}
00011001
```

对于进制转换，确实还有更好的方法，但这不失为一个有趣的方法。

### 参数展开

再看回前面的

```
echo ${month[3]}
```

在这里，花括号的作用就不是构造序列了，而是用于<ruby>参数展开<rt>parameter expansion</rt></ruby>。顾名思义，参数展开就是将花括号中的变量展开为这个变量实际的内容。

我们继续使用上面的 `month` 数组来举例：

```
month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
```

注意，Bash 中的数组索引从 0 开始，因此 3 代表第 4 个元素 `"Apr"`。因此 `echo ${month[3]}` 在经过参数展开之后，相当于 `echo "Apr"`。

像上面这样将一个数组展开成它所有的元素，只是参数展开的其中一种用法。另外，还可以通过参数展开的方式读取一个字符串变量，并对其进行处理。

例如对于以下这个变量：

```
a="Too longgg"
```

如果执行：

```
echo ${a%gg}
```

可以输出 “too long”，也就是去掉了最后的两个 g。

在这里，

  * `${...}` 告诉 shell 展开花括号里的内容
  * `a` 就是需要操作的变量
  * `%` 告诉 shell 需要在展开字符串之后从字符串的末尾去掉某些内容
  * `gg` 是被去掉的内容

这个特性在转换文件格式的时候会比较有用，我来举个例子：

[ImageMagick][3] 是一套可以用于操作图像文件的命令行工具，它有一个 `convert` 命令。这个 `convert` 命令的作用是可以为某个格式的图像文件制作一个另一格式的副本。

下面这个命令就是使用 `convert` 为 JPEG 格式图像 `image.jpg` 制作一个 PNG 格式的图像副本 `image.png`：

```
convert image.jpg image.png
```

在很多 Linux 发行版中都预装了 ImageMagick，如果没有预装，一般可以在发行版对应的软件管理器中找到。

继续来看，在对变量进行展开之后，就可以批量执行相类似的操作了：

```
i=image.jpg
convert $i ${i%jpg}png
```

这实际上是将变量 `i` 末尾的 `"jpg"` 去掉，然后加上 `"png"`，最终将整个命令拼接成 `convert image.jpg image.png`。

如果你觉得并不怎么样，可以想象一下有成百上千个图像文件需要进行这个操作，而仅仅运行：

```
for i in *.jpg; do convert $i ${i%jpg}png; done
```

就瞬间完成任务了。

如果需要去掉字符串开头的部分，就要将上面的 `%` 改成 `#` 了：

```
$ a="Hello World!"
$ echo Goodbye${a#Hello}
Goodbye World!
```

参数展开还有很多用法，但一般在写脚本的时候才会需要用到。在这个系列以后的文章中就继续提到。

### 合并输出

最后介绍一个花括号的用法，这个用法很简单，就是可以将多个命令的输出合并在一起。首先看下面这个命令：

```
echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls > PNGs.txt
```

以分号分隔开的几条命令都会执行，但只有最后的 `ls` 命令的结果输出会被重定向到 `PNGs.txt` 文件中。如果将这几条命令用花括号包裹起来，就像这样：

```
{ echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls; } > PNGs.txt
```

执行完毕后，可以看到 `PNGs.txt` 文件中会包含两次 `echo` 的内容、`find` 命令查找到的 PNG 文件以及最后的 `ls` 命令结果。

需要注意的是，花括号与命令之间需要有空格隔开。因为这里的花括号 `{` 和 `}` 是作为 shell 中的保留字，shell 会将这两个符号之间的输出内容组合到一起。

另外，各个命令之间要用分号 `;` 分隔，否则命令无法正常运行。

### 下期预告

在后续的文章中，我会介绍其它“包裹”类符号的用法，敬请关注。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/all-about-curly-braces-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10465-1.html
[3]: http://www.imagemagick.org/

