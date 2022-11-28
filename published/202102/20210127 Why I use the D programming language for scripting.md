[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13100-1.html)
[#]: subject: (Why I use the D programming language for scripting)
[#]: via: (https://opensource.com/article/21/1/d-scripting)
[#]: author: (Lawrence Aberba https://opensource.com/users/aberba)

我为什么要用 D 语言写脚本？
======

> D 语言以系统编程语言而闻名，但它也是编写脚本的一个很好的选择。

![](https://img.linux.net.cn/data/attachment/album/202102/09/134351j4m3hrhll0h38plp.jpg)

D 语言由于其静态类型和元编程能力，经常被宣传为系统编程语言。然而，它也是一种非常高效的脚本语言。

由于 Python 在自动化任务和快速实现原型想法方面的灵活性，它通常被选为脚本语言。这使得 Python 对系统管理员、[管理者][2]和一般的开发人员非常有吸引力，因为它可以自动完成他们可能需要手动完成的重复性任务。

我们自然也可以期待任何其他的脚本编写语言具有 Python 的这些特性和能力。以下是我认为 D 是一个不错的选择的两个原因。

### 1、D 很容易读和写

作为一种类似于 C 的语言，D 应该是大多数程序员所熟悉的。任何使用 JavaScript、Java、PHP 或 Python 的人对 D 语言都很容易上手。

如果你还没有安装 D，请[安装 D 编译器][3]，这样你就可以[运行本文中的 D 代码][4]。你也可以使用[在线 D 编辑器][5]。

下面是一个 D 代码的例子，它从一个名为 `words.txt` 的文件中读取单词，并在命令行中打印出来：

```
open
source
is
cool
```

用 D 语言写脚本:

```
#!/usr/bin/env rdmd
// file print_words.d

// import the D standard library
import std;

void main(){
    // open the file
     File("./words.txt")

         //iterate by line
        .byLine

        // print each number
        .each!writeln;
}
```

这段代码以 [释伴][6] 开头，它将使用 [rdmd][7] 来运行这段代码，`rdmd` 是 D 编译器自带的编译和运行代码的工具。假设你运行的是 Unix 或 Linux，在运行这个脚本之前，你必须使用` chmod` 命令使其可执行：

```
chmod u+x print_words.d
```

现在脚本是可执行的，你可以运行它：

```
./print_words.d
```

这将在你的命令行中打印以下内容：

```
open
source
is
cool
```

恭喜你，你写了第一个 D 语言脚本。你可以看到 D 是如何让你按顺序链式调用函数，这让阅读代码的感觉很自然，类似于你在头脑中思考问题的方式。这个[功能让 D 成为我最喜欢的编程语言][8]。

试着再写一个脚本：一个非营利组织的管理员有一个捐款的文本文件，每笔金额都是单独的一行。管理员想把前 10 笔捐款相加，然后打印出金额：

```
#!/usr/bin/env rdmd
// file sum_donations.d

import std;

void main()
{
    double total = 0;

    // open the file
    File("monies.txt")

         // iterate by line
        .byLine

         // pick first 10 lines
        .take(10)

        // remove new line characters (\n)
        .map!(strip)

         // convert each to double
        .map!(to!double)

        // add element to total
        .tee!((x) { total += x; })

        // print each number
        .each!writeln;

    // print total
    writeln("total: ", total);
}
```

与 `each` 一起使用的 `!` 操作符是[模板参数][9]的语法。

### 2、D 是快速原型设计的好帮手

D 是灵活的，它可以快速地将代码敲打在一起，并使其发挥作用。它的标准库中包含了丰富的实用函数，用于执行常见的任务，如操作数据（JSON、CSV、文本等）。它还带有一套丰富的通用算法，用于迭代、搜索、比较和 mutate 数据。这些巧妙的算法通过定义通用的 [基于范围的接口][10] 而按照序列进行处理。

上面的脚本显示了 D 中的链式调用函数如何提供顺序处理和操作数据的要领。D 的另一个吸引人的地方是它不断增长的用于执行普通任务的第三方包的生态系统。一个例子是，使用 [Vibe.d][11] web 框架构建一个简单的 web 服务器很容易。下面是一个例子：

```
#!/usr/bin/env dub
/+ dub.sdl:
dependency "vibe-d" version="~>0.8.0"
+/
void main()
{
    import vibe.d;
    listenHTTP(":8080", (req, res) {
        res.writeBody("Hello, World: " ~ req.path);
    });
    runApplication();
}
```

它使用官方的 D 软件包管理器 [Dub][12]，从 [D 软件包仓库][13]中获取 vibe.d Web 框架。Dub 负责下载 Vibe.d 包，然后在本地主机 8080 端口上编译并启动一个 web 服务器。

### 尝试一下 D 语言

这些只是你可能想用 D 来写脚本的几个原因。

D 是一种非常适合开发的语言。你可以很容易从 D 下载页面安装，因此下载编译器，看看例子，并亲自体验 D 语言。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/d-scripting

作者：[Lawrence Aberba][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aberba
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/3/automating-community-management-python
[3]: https://tour.dlang.org/tour/en/welcome/install-d-locally
[4]: https://tour.dlang.org/tour/en/welcome/run-d-program-locally
[5]: https://run.dlang.io/
[6]: https://en.wikipedia.org/wiki/Shebang_(Unix)
[7]: https://dlang.org/rdmd.html
[8]: https://opensource.com/article/20/7/d-programming
[9]: http://ddili.org/ders/d.en/templates.html
[10]: http://ddili.org/ders/d.en/ranges.html
[11]: https://vibed.org
[12]: https://dub.pm/getting_started
[13]: https://code.dlang.org
