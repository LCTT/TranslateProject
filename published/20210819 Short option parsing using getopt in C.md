[#]: subject: "Short option parsing using getopt in C"
[#]: via: "https://opensource.com/article/21/8/short-option-parsing-c"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15589-1.html"

在 C 语言中使用 getopt 解析命令行短选项
======

> 通过使用命令行让用户告诉程序要什么，可以让程序更加灵活。

![][0]

在已经知道要处理什么文件和对文件进行哪些操作的情况下，编写处理文件的 C 语言程序就很容易了。如果将文件名“硬编码”在程序中，或者你的程序只以一种方式来处理文件，那么你的程序总是知道要做什么。

但是如果程序每次运行时能够对用户的输入做出反应，可以使程序更灵活。让用户告诉程序要处理什么文件，或者以不同的方式完成任务，要实现这样的功能就需要读取命令行参数。

### 读取命令行

一个 C 语言程序可以用如下声明开头：

```
int main()
```

这是启动 C 程序最简单的形式。但如果在圆括号中加入标准参数，你的程序就可以从命令行中读取选项了：

```
int main(int argc, char **argv)
```

`argc` 表示命令行中的参数个数。它总是一个至少为 1 的数。

`argv` 是一个二级指针，它指向一个字符串数组。这个数组中保存的是从命令行接收的各个参数。数组的第一个元素 `*argv[0]` 是程序的名称。`**argv` 数组的其它元素包含剩下的命令行参数。

下面我将写一个简单的示例程序，它能够回显通过命令行参数传递给它的选项。它跟 Linux 的 `echo` 命令类似，只不过我们的程序会打印出程序名。同时它还会调用 `puts` 函数将命令行选项按行打印输出。

```
#include <stdio.h>

int
main(int argc, char **argv)
{
  int i;

  printf("argc=%d\n", argc); /* debugging */

  for (i = 0; i < argc; i++) {
    puts(argv[i]);
  }

  return 0;
}
```

编译此程序，并在运行时提供一些命令行参数，你会看到传入的命令行参数被逐行打印出来：

```
$ ./echo this program can read the command line
argc=8
./echo
this
program
can
read
the
command
line
```

这个命令行将程序的 `argc` 置为 8，`**argv` 数组包含 8 个元素：程序名以及用户输入的 7 个单词。由于 C 语言中数组下标从 0 开始，所以这些元素的标号分别是 0 到 7。这也是在 `for` 循环中处理命令行参数时能够用 `i < argc` 作为比较条件的原因。 

你也可以用这个方式实现自己的 `cat` 或 `cp` 命令。`cat` 命令的基本功能是显示一个或几个文件的内容。下面是一个简化版的`cat` 命令，它从命令行获取文件名：

```
#include <stdio.h>

void
copyfile(FILE *in, FILE *out)
{
  int ch;

  while ((ch = fgetc(in)) != EOF) {
    fputc(ch, out);
  }
}

int
main(int argc, char **argv)
{
  int i;
  FILE *fileptr;

  for (i = 1; i < argc; i++) {
    fileptr = fopen(argv[i], "r");

    if (fileptr != NULL) {
      copyfile(fileptr, stdout);
      fclose(fileptr);
    }
  }

  return 0;
}
```

这个简化版的 `cat` 命令从命令行读取文件名列表，然后将各个文件的内容逐字符地显示到标准输出上。假定我有一个叫做 `hello.txt` 的文件，其中包含数行文本内容。我能用自己实现的 `cat` 命令将它的内容显示出来：

```
$ ./cat hello.txt
Hi there!
This is a sample text file.
```

以这个简单程序为出发点，你也可以实现自己版本的其它 Linux 命令。比如 `cp` 命令，它从命令行读取两个文件名：要读取的文件和要写入的文件。

### 读取命令行选项

通过命令行读取文件名和其它文本固然很棒，但是如果想要程序根据用户给出的选项改变行为呢？比如 Linux 的 `cat` 命令就支持以下命令行选项：

  * `-b` 显示非空行的行号
  * `-E` 在行尾显示 `$`
  * `-n` 显示行号
  * `-s` 合并显示空行
  * `-T` 将制表符显示为 `^I`
  * `-v` 用 `^x` 和 `M-x` 方式显示非打印字符，换行符和制表符除外

这些以一个连字符开头的单字母的选项叫做短选项。通常短选项是分开使用的，就像这样 `cat -E -n`。但是也可以将多个短选项合并，比如 `cat -En`。

值得庆幸的是，所有 Linux 和 Unix 系统都包含 `getopt` 库。它提供了一种简单的方式来读取命令行参数。`getopt` 定义在头文件 `unistd.h` 中。你可以在程序中使用 `getopt` 来读取命令行短选项。

与其它 Unix 系统不同的是，Linux 上的 `getopt` 总是保证短选项出现在命令行参数的最前面。比如，用户输入的是 `cat -E file -n`。`-E` 在最前面，`-n` 在文件名之后。如果使用 Linux 的 `getopt` 来处理，程序会认为用户输入的是 `cat -E -n file`。这样做可以使处理过程更顺畅，因为 `getopt` 可以解析完所有短选项，剩下的文件名列表可以通过 `**argv` 来统一处理。

你可以这样使用 `getopt`:

```
#include <unistd.h>

int getopt(int argc, char **argv, char *optstring);
```

`optstring` 是由所有合法的选项字符组成的字符串。比如你的程序允许的选项是 `-E` 和 `-n`， 那么 `optstring` 的值就是 `"En"`。

通常通过在循环中调用 `getopt` 来解析命令行选项。每次调用时 `getopt` 会返回找到的下一个短选项，如果遇到无法识别的选项则返回 `'?'`。当没有更多短选项时它返回 `-1`，并且设置全局变量 `optind` 的值指向 `**argv` 中所有段选项之后的第一个元素。

下面看一个简单的例子。这个演示程序没有实现 `cat` 命令的所有选项，但它只是能够解析命令行。每当发现一个合法的命令行选项，它就打印出相应的提示消息。在你自己的程序中，你可能会根据这些命令行选项执行变量赋值等者其它操作。

```
#include <stdio.h>
#include <unistd.h>

int
main(int argc, char **argv)
{
  int i;
  int option;

  /* parse short options */

  while ((option = getopt(argc, argv, "bEnsTv")) != -1) {
    switch (option) {
    case 'b':
      puts("Put line numbers next to non-blank lines");
      break;
    case 'E':
      puts("Show the ends of lines as $");
      break;
    case 'n':
      puts("Put line numbers next to all lines");
      break;
    case 's':
      puts("Suppress printing repeated blank lines");
      break;
    case 'T':
      puts("Show tabs as ^I");
      break;
    case 'v':
      puts("Verbose");
      break;
    default:                          /* '?' */
      puts("What's that??");
    }
  }

  /* print the rest of the command line */

  puts("------------------------------");

  for (i = optind; i < argc; i++) {
    puts(argv[i]);
  }

  return 0;
}
```

假如你把程序编译为 `args`，你可以通过尝试不同的命令行参数组合，来了解程序是怎么解析短选项，以及是怎么将其它的命令行参数留下来的。最简单的例子是将所有的选项都放在最前面，就像这样：

```
$ ./args -b -T file1 file2
Put line numbers next to non-blank lines
Show tabs as ^I
------------------------------
file1
file2
```

现在试试将两个短选项合并使用的效果：

```
$ ./args -bT file1 file2
Put line numbers next to non-blank lines
Show tabs as ^I
------------------------------
file1
file2
```

如果有必要的话，`getopt`可以对命令行参数进行重排：

```
$ ./args -E file1 file2 -T
Show the ends of lines as $
Show tabs as ^I
------------------------------
file1
file2
```

如果用户输入了错误的短选项，`getopt` 会打印一条消息：

```
$ ./args -s -an file1 file2
Suppress printing repeated blank lines
./args: invalid option -- 'a'
What's that??
Put line numbers next to all lines
------------------------------
file1
file2
```

### 下载速查表

`getopt` 还有更多的功能。例如，通过设计 `-s string` 或 `-f file` 这样的命令行语法规则，可以让短选项拥有自己的二级选项。你也可以告诉 `getopt` 在遇到无法识别的选项时不显示错误信息。使用 `man 3 getopt` 命令查看 `getopt(3)` 手册可以了解 `getopt` 的更多功能。

如果你需要 `getopt()` 和 `getopt_long()`的使用语法和结构上的提示，可以 [下载我制作的速查表][8]。它提供了最小可行代码，并列出了你需要了解的一些全局变量的含义。速查表的一面是 `getopt()` 的用法，另一面是 `getopt_long()`的用法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/short-option-parsing-c

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/fputc.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[8]: https://opensource.com/downloads/c-getopt-cheat-sheet
[0]: https://img.linux.net.cn/data/attachment/album/202303/02/141038srs54y5t4pv3r1ym.jpg