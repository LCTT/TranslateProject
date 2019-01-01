cloc：计算不同编程语言源代码的行数
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/cloc-720x340.png)

作为一个开发人员，你可能需要不时地向你的领导或者同事分享你目前的工作与代码开发进展，抑或你的领导想对代码进行全方位的分析。这时，你就需要用到一些代码统计的工具，我知道其中一个是 [**Ohcount**][1]。今天，我遇到了另一个程序，**cloc**。你可以用 cloc 很容易地统计多种语言的源代码行数。它还可以计算空行数、代码行数、实际代码的行数，并通过整齐的表格进行结果输出。cloc 是自由开源的跨平台程序，使用 **Perl** 进行开发。

### 特点

cloc 有很多优势：

* 安装方便而且易用，不需要额外的依赖项
* 可移植
* 支持多种的结果格式导出，包括：纯文本、SQL、JSON、XML、YAML、CSV
* 可以计算 git 的提交数
* 可递归计算文件夹内的代码行数
* 可计算压缩后的文件，如：tar、zip、Java 的 .ear 等类型
* 开源，跨平台

### 安装

cloc 的安装包在大多数的类 Unix 操作系统的默认软件库内，所以你只需要使用默认的包管理器安装即可。

Arch Linux:

```
$ sudo pacman -S cloc
```

Debian/Ubuntu:

```
$ sudo apt-get install cloc
```

CentOS/Red Hat/Scientific Linux:

```
$ sudo yum install cloc
```

Fedora:

```
$ sudo dnf install cloc
```

FreeBSD:

```
$ sudo pkg install cloc
```

当然你也可以使用第三方的包管理器，比如 [**NPM**][2]。

```
$ npm install -g cloc
```

### 统计多种语言代码数据的使用举例

首先来几个简单的例子，比如下面在我目前工作目录中的的 C 代码。

```
$ cat hello.c
#include <stdio.h>
int main()
{
    // printf() displays the string inside quotation
    printf("Hello, World!");
    return 0;
}
```

想要计算行数，只需要简单运行：

```
$ cloc hello.c
```

输出：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Hello-World-Program.png)

第一列是被分析文件的编程语言，上面我们可以看到这个文件是用 C 语言编写的。

第二列显示的是该种语言有多少文件，图中说明只有一个。

第三列显示空行的数量，图中显示是 0 行。

第四列显示注释的行数。

第五列显示该文件中实际的代码总行数。

这是一个有只有 6 行代码的源文件，我们看到统计的还算准确，那么如果用来统计一个行数较多的源文件呢？

```
$ cloc file.tar.gz
```

输出：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/cloc-1.png)

上述输出结果如果手动统计准确的代码行数非常困难，但是 cloc 只需要几秒，而且以易读的表格格式显示结果。你还可以在最后查看每个部分的总计，这在分析程序的源代码时非常方便。

除了源代码文件，cloc 还能递归计算各个目录及其子目录下的文件、压缩包、甚至 git commit 数目等。

文件夹中使用的例子：

```
$ cloc dir/
```

![][3]

子文件夹中使用的例子*：

```
$ cloc dir/cloc/tests
```

![][4]

计算一个压缩包中源代码的行数：

```
$ cloc archive.zip
```

![][5]

你还可以计算一个 git 项目，也可以像下面这样针对某次提交时的状态统计：

```
$ git clone https://github.com/AlDanial/cloc.git

$ cd cloc

$ cloc 157d706
```

![][6]

cloc 可以自动识别一些语言，使用下面的命令查看 cloc 支持的语言：

```
$ cloc --show-lang
```

更新信息请查阅 cloc 的使用帮助。

```
$ cloc --help
```

开始使用吧！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cloc-count-the-lines-of-source-code-in-many-programming-languages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[littleji](https://github.com/littleji)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/ohcount-the-source-code-line-counter-and-analyzer/
[2]: https://www.ostechnix.com/install-node-js-linux/
[3]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-2-1.png
[4]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-4.png
[5]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-3.png
[6]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-5.png
