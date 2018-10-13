Cloc –– 计算不同编程语言源代码的行数
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/cloc-720x340.png)

作为一个开发人员，你可能需要不时的想你的领导或者同事分享你目前的工作与代码开发进展，抑或你的领导想对代码进行全方位的分析。在这种情况下，你就需要用到我所知的这么几个程序，其中一个是 [**Ohcount**][1]。今天，我遇到了另一个程序，**Cloc**。通过使用 Cloc，你可以很容易的计算出多种语言的源代码行数。它还可以计算空行数、代码行数、实际占用的行数，并通过整齐的表格进行结果输出。Cloc 是免费的、开源的、跨平台程序，使用 **Perl** 进行开发。

### 特点

Cloc 有很多优势：

* 容易安装和实用，不需要额外的依赖项。
* 便携式
* 支持多种的结果格式导出，包括：纯文本、SQL、JSON、XML、YAML、CSV
* 可以计算 git 的提交数
* 可递归计算文件夹内的代码行数
* 可计算压缩后的文件，如：tar、zip、Java ear
* 开源跨平台部署

### 安装

Cloc 的安装包在大多数的 \*nix 操作系统的默认软件库内，所以你只需要使用默认的包管理器安装如下这样。

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

当然你也可以使用第三方的包管理器比如 [**NPM**][2]。

```
$ npm install -g cloc
```

### 使用实例

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

第一列是被分析文件的语言类型，上面我们可以看到该分析的文件语言类型是 **C**。

第二列显示的是该种语言类型有多少文件，图中说明只有一个。

第三列显示空行的个数，图中显示无。

第四列显示注释的行数。

第五列显示该文件中的总共的行数。

这是一个有只有6行代码的源文件，我们看到算的还算准确，那么如果用来算一个行数较多的源文件，会发生什么呢？

```
$ cloc file.tar.gz
```

输出：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/cloc-1.png)

根据上述输出，手动查找准确的代码计数非常困难。但是，Cloc 以易读的表格格式显示结果。你还可以在最后查看每个部分的总计，这在分析程序的源代码时非常方便。

除了源代码文件，Cloc 还能递归的计算各个目录及其子目录下的文件、压缩包、甚至 git 中的 commit 数目等。

**文件夹中使用的例子:**

```
$ cloc dir/
```

![][4]

**子文件夹中使用的例子**：

```
$ cloc dir/cloc/tests
```

![][5]

**计算一个压缩包中源代码的行数**：

```
$ cloc archive.zip
```

![][6]

**你还可以计算一个 git 项目**：

```
$ git clone https://github.com/AlDanial/cloc.git

$ cd cloc

$ cloc 157d706
```

![][7]

**使用下面的命令，查看 Cloc 支持的语言类型**：

```
$ cloc --show-lang
```

当然，help 能告诉你更多关于 Cloc 的使用帮助。

```
$ cloc --help
```

开始使用吧！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cloc-count-the-lines-of-source-code-in-many-programming-languages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/littleji)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/ohcount-the-source-code-line-counter-and-analyzer/
[2]: https://www.ostechnix.com/install-node-js-linux/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-2-1.png
[5]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-4.png
[6]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-3.png
[7]: http://www.ostechnix.com/wp-content/uploads/2018/10/cloc-5.png
