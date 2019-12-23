[#]: collector: (lujun9972)
[#]: translator: (luuming)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11658-1.html)
[#]: subject: (The many faces of awk)
[#]: via: (https://www.networkworld.com/article/3454979/the-many-faces-of-awk.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

千面 awk
======

> `awk` 命令不仅提供了简单的输入字符串筛选功能，还包含提取数据列、打印简单文本、筛选内容——甚至做一些数学计算。

![Thinkstock][6]

如果你仅使用 `awk` 选取一行中的特定文本，那么你可能错过了它的很多功能。在这篇文章中，我们会来看看使用 `awk` 可以帮你做一些其他的什么事情，并提供一些例子。

### 提取数据列

`awk` 所提供的最简单与最常用的功能便是从文件或管道传输的数据中选取特定的内容。默认使用空格当做分隔符，这非常简单。

```
$ echo one two three four five | awk ‘{print $4}’
four
$ who | awk ‘{print $1}’
jdoe
fhenry
```

空格指的是一系列的 `space` 或 `tab` 字符。在下面所展示的命令里，`awk` 从提供的数据中筛选第一和第四项。

`awk` 命令也可以通过在其后增加文件名参数的方式从文本文件中获取数据。

```
$ awk '{print $1,$5,$NF}' HelenKellerQuote
The beautiful heart.
```

（LCTT 译注：“The best and most beautiful things in the world can not be seen or even touched , they must be felt with heart.” ——海伦凯勒）

在这个例子中，`awk` 挑选了一行中的第一个、第五个和最后一个字段。

命令中的 `$NF` 指定选取每行的最后一个字段。这是因为 `NF` 代表一行中的<ruby>字段数量<rt>Number of Field</rt></ruby>，也就是 23，而 `$NF` 就代表着那个字段的值，也就是`heart`。最后的句号也包含进去了，因为它是最后一个字符串的一部分。

字段能以任何有用的形式打印。在这个例子中，我们将字段以日期的格式进行打印输出。

```
$ date | awk '{print $4,$3,$2}'
2019 Nov 22
```

如果你省略了 `awk` 命令中字段指示符之间的逗号，输出将会挤成一个字符串。

```
$ date | awk '{print $4 $3 $2}'
2019Nov21
```

如果你将通常使用的逗号替换为连字符，`awk` 就会尝试将两个字段的值相减——或许这并不是你想要的。它不会将连字符插入到输出结果中。相反地，它对输出做了一些数学计算。

```
$ date | awk '{print $4-$3-$2}'
1997
```

在这个例子中，它将年 “2019” 和日期 “22” 相减，并忽略了中间的 “Nov”。

如果你想要空格之外的字符作为输出分隔符，你可以通过 `OFS`（<ruby>输出分隔符<rt>output field separator</rt></ruby>）指定分隔符，就像这样：

```
$ date | awk '{OFS="-"; print $4,$3,$2}'
2019-Nov-22
```

### 打印简单文本

你也可以使用 `awk` 简单地显示一些文本。当然了，比起 `awk` 你可能更想使用 `echo` 命令。但换句话说，作为 `awk` 脚本的一部分，打印某些相关性文本将会非常实用。这里有一个没什么用的例子：

```
$ awk 'BEGIN {print "Hello, World" }'
Hello, World
```

下面的例子更加合理，添加一行文本标签来更好的辨识数据。

```
$ who | awk 'BEGIN {print "Current logins:"} {print $1}'
Current logins:
shs
nemo
```

### 指定字段分隔符

不是所有的输入都以空格作为分隔符的。如果你的文本通过其它的字符作为分隔符（例如：逗号、冒号、分号），你可以通过 `-F` 选项（输入分隔符）告诉 `awk`：

```
$ cat testfile
a:b:c,d:e
$ awk -F : '{print $2,$3}' testfile
b c,d
```

下面是一个更加有用的例子——从冒号分隔的 `/etc/passwd` 文件中获取数据：

```
$ awk -F: '{print $1}' /etc/passwd | head -11
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
```

### 筛选内容

你也可以使用 `awk` 命令评估字段。例如你仅仅想列出 `/etc/passwd` 中的用户账号，就可以对第三个字段做一些筛选。下面的例子中我们只关注大于等于 1000 的 UID：

```
$ awk -F":" ' $3 >= 1000 ' /etc/passwd
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
shs:x:1000:1000:Sandra Henry-Stocker,,,:/home/shs:/bin/bash
nemo:x:1001:1001:Nemo,,,:/home/nemo:/usr/bin/zsh
dory:x:1002:1002:Dory,,,:/home/dory:/bin/bash
...
```

如果你想为输出增加标题，可以添加 `BEGIN` 从句：

```
$ awk -F":" 'BEGIN {print "user accounts:"} $3 >= 1000 ' /etc/passwd
user accounts:
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
shs:x:1000:1000:Sandra Henry-Stocker,,,:/home/shs:/bin/bash
nemo:x:1001:1001:Nemo,,,:/home/nemo:/usr/bin/zsh
dory:x:1002:1002:Dory,,,:/home/dory:/bin/bash
```

如果你想要不止一行的标题，你可以通过 `"\n"` 分隔输出：

```
$ awk -F":" 'BEGIN {print "user accounts\n============="} $3 >= 1000 ' /etc/passwd
user accounts
=============
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
shs:x:1000:1000:Sandra Henry-Stocker,,,:/home/shs:/bin/bash
nemo:x:1001:1001:Nemo,,,:/home/nemo:/usr/bin/zsh
dory:x:1002:1002:Dory,,,:/home/dory:/bin/bash
```

### 在 awk 中进行数学计算

`awk` 提供了惊人的数学计算能力，并且可以开平方，算 `log`，算 `tan` 等等。

这里有一对例子：

```
$ awk 'BEGIN {print sqrt(2019)}'
44.9333
$ awk 'BEGIN {print log(2019)}'
7.61036
```

想要详细了解 `awk` 的数学计算能力，可以看《[使用 awk 进行数学计算][3]》这篇文章。

### awk 脚本

你也可以使用 `awk` 写一套单独的脚本。下面的例子模仿了之前写过的一个，不过还计算了系统里账户的数量。

```
#!/usr/bin/awk -f

# 这一行是注释

BEGIN {
    printf "%s\n","User accounts:"
    print "=============="
    FS=":"
    n=0
}

# 现在开始遍历数据
{
    if ($3 >= 1000) {
        print $1
        n ++
    }
}

END {
    print "=============="
    print n " accounts"
}
```

注意 `BEGIN` 那一节是如何提供标题、指定字段分隔符和初始化计数器的，它仅在脚本初始化时期执行。这个脚本也包含 `END` 节，它仅在中间所有命令处理完成之后运行，显示了所有中间小节所筛选数据的最终行数（第三个字段大于等于 1000）。

作为一个长存于 Unix 之上的命令，`awk` 依旧提供着非常有用的服务，这也是我几十年前爱上 Unix 的原因之一。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454979/the-many-faces-of-awk.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/2974753/doing-math-with-awk.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
[6]:https://images.techhive.com/images/article/2015/09/thinkstockphotos-512100549-100611755-large.jpg
