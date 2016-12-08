Uncommon but useful GCC command line options - part 2不常见但是很有用的 GCC 命令行选项 - （二）
============================================================

### On this page
### 本文导航
1.  [Enable warnings that aren't covered by -Wall][1]
1.  [启用 Wall 选项不包括的警告][1]
2.  [Enable warning for floating point values in equity comparisons][2]
2.  [通过公平比较启用浮点值警告][2]
3.  [How to better manage gcc command line options][3]
3.  [如何更好的管理 gcc 命令行选项][3]
4.  [Conclusion][4]
4.  [结论][4]

The gcc compiler offers a seemingly never-ending list of command line options. Of course, no body uses or has expertise on all of them, but there are a select bunch that every gcc user should - if not must - know. While some of them are commonly used, others are a bit uncommon but no less useful.
gcc 编译器看起来提供了无数的命令行选项。当然，没有人使用或者精通它所有的命令行选项，但是有一系列被精心挑选出来的命令行选项是每一个 gcc 用户都应该知道的 - 即使不是必须知道。然而它们中的一些很常见，其他一些不太常见但并不意味着它们的用处没前者大。
In this article series, we are focusing on some of those uncommon but useful gcc command line options, and have already covered a couple of them in the [part 1][5].在这个系列的文章中，我们集中于一些不常见但是很有用的 gcc 命令行选项，在[第一节][5]已经涉及到几个这样的命令行选项。
If you recall, in the beginning of the first part of this tutorial series, I briefly mentioned that the -Wall option that developers generally use for generating warnings doesn't cover some specific warnings. If you aren't aware of these warnings and have no idea on how to enable them, worry not, as we'll be explaining all that in detail in this article. 不知道你是否能够回想起，在这个系列教程的第一部分的开始，我简要的提到了 - Wall 选项，开发者们通常使用它来生成警告，但不包括一些特殊的警告。如果你不认识这些特殊警告并且不知道如何启用它们，不用担心，因为我将在这篇文章中详细讲解它们所有的细节。
Aside from this, we'll also be covering a gcc warning option related to floating point variables, as well as how to better manage the gcc command line options if the list grows large. 除此以外，这篇文章也将涉及与浮点值相关的 gcc 警告选项，以及在目录变得很大的时候如何更好的管理 gcc 命令行选项。
But before we move ahead, please keep in mind that all the examples, command, and instructions mentioned in this tutorial have been tested on Ubuntu 16.04 LTS, and the gcc version that we've used is 5.4.0.但是在往前看之前，请记住，在这个教程中的所有例子，命令，指令都已经在 Ubuntu 16.04 LTS 中测试过，并且我使用的 gcc 版本是 5.4.0.
### Enable warnings that aren't covered by -Wall

While the -Wall option of the gcc compiler covers most of the warning flags, there are some that remain disabled. To enable them, use the **-Wextra** option.

For example, take a look at the following code:

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

I accidentally put a semicolon after the 'if' condition. Now, when the code was compiled using the following gcc command, no warning was produced.

gcc -Wall test.c -o test

But when the -Wextra option was used:

gcc -Wall -Wextra test.c -o test

A warning was produced:

```
test.c: In function ‘main’:
test.c:10:8: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
 if(i);
```

As clear from the warning shown above, the -Wextra option internally enabled the -Wempty-body flag, which in turned detected the suspicious code and issued the warning. Here is the complete list of warning flags enabled by this option:

-Wclobbered, -Wempty-body, -Wignored-qualifiers, -Wmissing-field-initializers, -Wmissing-parameter-type (C only), -Wold-style-declaration (C only), -Woverride-init, -Wsign-compare, -Wtype-limits, -Wuninitialized, -Wunused-parameter (only with -Wunused or -Wall), and -Wunused-but-set-parameter (only with -Wunused or -Wall). 

If you want to learn what the above mentioned flags do, head to [gcc's man page][6].

Moving on, the -Wextra option also issues warnings in the following cases:

*   A pointer is compared against integer zero with <, <=, >, or >=
*   (C++ only) An enumerator and a non-enumerator both appear in a
    conditional expression.
*   (C++ only) Ambiguous virtual bases.
*   (C++ only) Subscripting an array that has been declared
    register. 
*   (C++ only) Taking the address of a variable that has been
    declared register. 
*   (C++ only) A base class is not initialized in a derived class's
    copy constructor.

### Enable warning for floating point values in equity comparisons

As you might already know, one should never test for the exact equality of floating-point values (didn't know this - read the floating-point comparison-related FAQ [here][7]). But even if you accidentally do this, does the gcc compiler throw any warning or error? Let's check out:

Here's a code that compares floating point variables using == operator:

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

And here's the gcc command (containing both -Wall and -Wextra options) used to compile this code:

gcc -Wall -Wextra test.c -o test

Sadly, the above command doesn't produce any warning related to floating point comparison. A quick look at GCC's man page reveals that there exists a dedicated option **-Wfloat-equal** that should be used in these scenarios.

Here's the command containing this option:

gcc -Wall -Wextra -Wfloat-equal test.c -o test

And following is the output it produced:

```
test.c: In function ‘compare’:
test.c:5:10: warning: comparing floating point with == or != is unsafe [-Wfloat-equal]
 if(x == y)
```

So as you can see in the output above, the -Wfloat-equal option forced gcc to produce warning related to floating comparison.

Here is what [the gcc man page][8] says about this option:

```
The idea behind this is that sometimes it is convenient (for the programmer) to consider floating-point values as approximations to infinitely precise real numbers. If you are doing this, then you
need to compute (by analyzing the code, or in some other way) the maximum or likely maximum error that the computation introduces, and allow for it when performing comparisons (and when producing
output, but that's a different problem). In particular, instead of testing for equality, you shouldcheck to see whether the two values have ranges that overlap; and this is done with the relational operators, so equality comparisons are probably mistaken.
```

### How to better manage gcc command line options

If the list of command line options that you are using in your gcc command is becoming larger and difficult to manage, then you can put it in a text file, and pass that file's name as an argument to the gcc command. For this, you'll have to use the **@file**command line option.

For example, if following is your gcc command:

gcc -Wall -Wextra -Wfloat-equal test.c -o test

Then you can put the three warnings-related options in a file named, say 'gcc-options' :

$ cat gcc-options 
-Wall -Wextra -Wfloat-equal

And your gcc command becomes less cluttered and easy to manage:

gcc @gcc-options test.c -o test

Here's what the gcc man page says about @file:

```
Read command-line options from file. The options read are inserted in place of the original @file option. If file does not exist, or cannot be read, then the option will be treated literally, and not removed.

Options in file are separated by whitespace. A whitespace character may be included in an option by surrounding the entire option in either single or double quotes. Any character (including a backslash) may be included by prefixing the character to be included with a backslash. The file may itself contain additional @file options; any such options will be processed recursively.
```

### Conclusion

So we covered a total of 5 uncommon but useful gcc command line options in this tutorial series: -save-temps, -g, -Wextra, -Wfloat-equal, and @file. Do spend time practicing each of them and don't forget to go through all the details that the gcc man page offers about them. 

Do you know or use other such useful gcc command line options, and want to share them with the world? Leave all the details in comments below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/

作者：[Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#enable-warnings-that-arent-covered-by-wall
[2]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#enable-warning-fornbspfloating-point-values-in-equity-comparisons
[3]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#how-to-better-manage-gcc-command-line-options
[4]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/#conclusion
[5]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/
[6]:https://linux.die.net/man/1/gcc
[7]:https://isocpp.org/wiki/faq/newbie
[8]:https://linux.die.net/man/1/gcc
