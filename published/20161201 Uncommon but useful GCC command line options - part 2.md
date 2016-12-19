不常见但是很有用的 GCC 命令行选项（二）
============================================================

gcc 编译器提供了几乎数不清的命令行选项列表。当然，没有人会使用过或者精通它所有的命令行选项，但是有一些命令行选项是每一个 gcc 用户都应该知道的 - 即使不是必须知道。它们中有一些很常用，其他一些不太常用，但不常用并不意味着它们的用处没前者大。

在这个系列的文章中，我们集中于一些不常用但是很有用的 gcc 命令行选项，在[第一节][5]已经讲到几个这样的命令行选项。

不知道你是否能够回想起，在这个系列教程的第一部分的开始，我简要的提到了开发者们通常用来生成警告的 `-Wall` 选项，并不包括一些特殊的警告。如果你不了解这些特殊警告，并且不知道如何生成它们，不用担心，我将在这篇文章中详细讲解关于它们所有的细节。

除此以外，这篇文章也将涉及与浮点值相关的 gcc 警告选项，以及在 gcc 命令行选项列表变得很大的时候如何更好的管理它们。

在继续之前，请记住，这个教程中的所有例子、命令和指令都已在 Ubuntu 16.04 LTS 操作系统和 gcc 5.4.0 上测试过。

### 生成 -Wall 选项不包括的警告

尽管 gcc 编译器的 `-Wall` 选项涵盖了绝大多数警告标记，依然有一些警告不能生成。为了生成它们，请使用 `-Wextra` 选项。

比如，下面的代码：

```
#include <stdio.h>
#include <stdlib.h>
int main()
{
    int i=0;
    /* ...
       some code here 
       ...
    */

    if(i);
        return 1;
     return 0; 
}
```


我不小心在 `if` 条件后面多打了一个分号。现在，如果使用下面的 gcc 命令来进行编译，不会生成任何警告。

```
gcc -Wall test.c -o test
```

但是如果同时使用 `-Wextra` 选项来进行编译：

```
gcc -Wall -Wextra test.c -o test
```

会生成下面这样一个警告：

```
test.c: In function ‘main’:
test.c:10:8: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
 if(i);
```

从上面的警告清楚的看到， `-Wextra` 选项从内部启用了 `-Wempty-body` 选项，从而可以检测可疑代码并生成警告。下面是这个选项启用的全部警告标记。

- `-Wclobbered`
- `-Wempty-body`
- `-Wignored-qualifiers`
- `-Wmissing-field-initializers`
- `-Wmissing-parameter-type` （仅针对 C 语言）
- `-Wold-style-declaration` （仅针对 C 语言）
- `-Woverride-init`
- `-Wsign-compare`
- `-Wtype-limits`
- `-Wuninitialized`
- `-Wunused-parameter` （只有和 `-Wunused` 或 `-Wall` 选项使用时才会启用）
- `-Wunused-but-set-parameter (只有和 `-Wunused` 或 `-Wall` 选项使用时才会生成）

如果想对上面所提到的标记有更进一步的了解，请查看 [gcc 手册][6]。

此外，遇到下面这些情况， `-Wextra` 选项也会生成警告：

*   一个指针和整数 `0` 进行 `<`， `<=`， `>`， 或 `>=` 比较
*   （仅 C++）一个枚举类型和一个非枚举类型同时出现在一个条件表达式中
*   （仅 C++）有歧义的虚拟基底
*   （仅 C++）寄存器类型的数组加下标
*   （仅 C++）对寄存器类型的变量进行取址
*   （仅 C++）基类没有在派生类的复制构建函数中进行初始化

### 浮点值的等值比较时生成警告

你可能已经知道，浮点值不能进行确切的相等比较（如果不知道，请阅读与浮点值比较相关的 [FAQ][7])。但是如果你不小心这样做了， gcc 编译器是否会报出错误或警告？让我们来测试一下：

下面是一段使用 `==` 运算符进行浮点值比较的代码：

```
#include<stdio.h>

void compare(float x, float y)
{
    if(x == y)
    {
        printf("\n EQUAL \n");
    }
}

int main(void)
{
    compare(1.234, 1.56789);

    return 0; 
}
```

使用下面的 gcc 命令（包含 `-Wall` 和 `-Wextra` 选项）来编译这段代码：

```
gcc -Wall -Wextra test.c -o test
```

遗憾的是，上面的命令没有生成任何与浮点值比较相关的警告。快速看一下 gcc 手册，在这种情形下可以使用一个专用的 ```-Wfloat-equal``` 选项。

下面是包含这个选项的命令：

```
gcc -Wall -Wextra -Wfloat-equal test.c -o test
```

下面是这条命令产生的输出：

```
test.c: In function ‘compare’:
test.c:5:10: warning: comparing floating point with == or != is unsafe [-Wfloat-equal]
 if(x == y)
```

正如上面你所看到的输出那样， `-Wfloat-equal` 选项会强制 gcc 编译器生成一个与浮点值比较相关的警告。

这儿是[gcc 手册][8]关于这一选项的说明：

> 这背后的想法是，有时，对程序员来说，把浮点值考虑成近似无限精确的实数是方便的。如果你这样做，那么你需要通过分析代码，或者其他方式，算出这种计算方式引入的最大或可能的最大误差，然后进行比较时（以及产生输出时，不过这是一个不同的问题）允许这个误差。特别要指出，不应该检查是否相等，而应该检查两个值是否可能出现范围重叠；这是用关系运算符来做的，所以等值比较可能是搞错了。

### 如何更好的管理 gcc 命令行选项

如果在你使用的 gcc 命令中，命令行选项列表变得很大而且很难管理，那么你可以把它放在一个文本文件中，然后把文件名作为 gcc 命令的一个参数。之后，你必须使用 `@file` 命令行选项。

比如，下面这行是你的 gcc 命令：

```
gcc -Wall -Wextra -Wfloat-equal test.c -o test
```

然后你可以把这三个和警告相关的选项放到一个文件里，文件名叫做 `gcc-options`：

```
$ cat gcc-options 
-Wall -Wextra -Wfloat-equal
```

这样，你的 gcc 命令会变得更加简洁并且易于管理：

```
gcc @gcc-options test.c -o test
```

下面是 gcc 手册关于 `@file` 的说明：

> 从文件中读取命令行选项。读取到的选项随之被插入到原始 `@file` 选项所在的位置。如果文件不存在或者无法读取，那么这个选项就会被当成文字处理，而不会被删除。

> 文件中的选项以空格分隔。选项中包含空白字符的话，可以用一个由单引号或双引号包围完整选项。任何字符（包括反斜杠: '\'）均可能通过一个 '\' 前缀而包含在一个选项中。如果该文件本身包含额外的 `@file` 选项，那么它将会被递归处理。


### 结论

在这个系列的教程中，我们一共讲解了 5 个不常见但是很有用的 gcc 命令行选项： `-Save-temps`、`-g`、 `-Wextra`、`-Wfloat-equal` 以及 `@file`。记得花时间练习使用每一个选项，同时不要忘了浏览 gcc 手册上面所提供的关于它们的全部细节。

你是否知道或使用其他像这样有用的 gcc 命令行选项，并希望把它们在全世界范围内分享？请在下面的评论区留下所有的细节。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/

作者：[Ansh][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#enable-warnings-that-arent-covered-by-wall
[2]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#enable-warning-fornbspfloating-point-values-in-equity-comparisons
[3]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#how-to-better-manage-gcc-command-line-options
[4]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#conclusion
[5]:https://linux.cn/article-8025-1.html
[6]:https://linux.die.net/man/1/gcc
[7]:https://isocpp.org/wiki/faq/newbie
[8]:https://linux.die.net/man/1/gcc
