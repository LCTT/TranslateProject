[#]: subject: (Learn how file input and output works in C)
[#]: via: (https://opensource.com/article/21/3/file-io-c)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13252-1.html)

学习如何用 C 语言来进行文件输入输出操作
======

> 理解 I/O 有助于提升你的效率。

![](https://img.linux.net.cn/data/attachment/album/202103/30/222717gyuegz88ryu8ry7i.jpg)

如果你打算学习 C 语言的输入、输出，可以从 `stdio.h` 包含文件开始。正如你从其名字中猜到的，该文件定义了所有的标准（“std”）的输入和输出（“io”）函数。

大多数人学习的第一个 `stdio.h` 的函数是打印格式化输出的 `printf` 函数。或者是用来打印一个字符串的 `puts` 函数。这些函数非常有用，可以将信息打印给用户，但是如果你想做更多的事情，则需要了解其他函数。

你可以通过编写一个常见 Linux 命令的副本来了解其中一些功能和方法。`cp` 命令主要用于复制文件。如果你查看 `cp` 的帮助手册，可以看到 `cp` 命令支持非常多的参数和选项。但最简单的功能，就是复制文件：

```
cp infile outfile
```

你只需使用一些读写文件的基本函数，就可以用 C 语言来自己实现 `cp` 命令。

### 一次读写一个字符

你可以使用 `fgetc` 和 `fputc` 函数轻松地进行输入输出。这些函数一次只读写一个字符。该用法被定义在 `stdio.h`，并且这也很浅显易懂：`fgetc` 是从文件中读取一个字符，`fputc` 是将一个字符保存到文件中。

```
int fgetc(FILE *stream);
int fputc(int c, FILE *stream);
```

编写 `cp` 命令需要访问文件。在 C 语言中，你使用 `fopen` 函数打开一个文件，该函数需要两个参数：文件名和打开文件的模式。模式通常是从文件读取（`r`）或向文件写入（`w`）。打开文件的方式也有其他选项，但是对于本教程而言，仅关注于读写操作。

因此，将一个文件复制到另一个文件就变成了打开源文件和目标文件，接着，不断从第一个文件读取字符，然后将该字符写入第二个文件。`fgetc` 函数返回从输入文件中读取的单个字符，或者当文件完成后返回文件结束标记（`EOF`）。一旦读取到 `EOF`，你就完成了复制操作，就可以关闭两个文件。该代码如下所示：

```
  do {
    ch = fgetc(infile);
    if (ch != EOF) {
      fputc(ch, outfile);
    }
  } while (ch != EOF);
```

你可以使用此循环编写自己的 `cp` 程序，以使用 `fgetc` 和 `fputc` 函数一次读写一个字符。`cp.c` 源代码如下所示：

```
#include <stdio.h>

int
main(int argc, char **argv)
{
  FILE *infile;
  FILE *outfile;
  int ch;

  /* parse the command line */

  /* usage: cp infile outfile */

  if (argc != 3) {
    fprintf(stderr, "Incorrect usage\n");
    fprintf(stderr, "Usage: cp infile outfile\n");
    return 1;
  }

  /* open the input file */

  infile = fopen(argv[1], "r");
  if (infile == NULL) {
    fprintf(stderr, "Cannot open file for reading: %s\n", argv[1]);
    return 2;
  }

  /* open the output file */

  outfile = fopen(argv[2], "w");
  if (outfile == NULL) {
    fprintf(stderr, "Cannot open file for writing: %s\n", argv[2]);
    fclose(infile);
    return 3;
  }

  /* copy one file to the other */

  /* use fgetc and fputc */

  do {
    ch = fgetc(infile);
    if (ch != EOF) {
      fputc(ch, outfile);
    }
  } while (ch != EOF);

  /* done */

  fclose(infile);
  fclose(outfile);

  return 0;
}
```

你可以使用 `gcc` 来将 `cp.c` 文件编译成一个可执行文件：

```
$ gcc -Wall -o cp cp.c
```

`-o cp` 选项告诉编译器将编译后的程序保存到 `cp` 文件中。`-Wall` 选项告诉编译器提示所有可能的警告，如果你没有看到任何警告，则表示一切正常。

### 读写数据块

通过每次读写一个字符来实现自己的 `cp` 命令可以完成这项工作，但这并不是很快。在复制“日常”文件（例如文档和文本文件）时，你可能不会注意到，但是在复制大型文件或通过网络复制文件时，你才会注意到差异。每次处理一个字符需要大量的开销。

实现此 `cp` 命令的一种更好的方法是，读取一块的输入数据到内存中（称为缓存），然后将该数据集合写入到第二个文件。这样做的速度要快得多，因为程序可以一次读取更多的数据，这就就减少了从文件中“读取”的次数。

你可以使用 `fread` 函数将文件读入一个变量中。这个函数有几个参数：将数据读入的数组或内存缓冲区的指针（`ptr`），要读取的最小对象的大小（`size`），要读取对象的个数（`nmemb`），以及要读取的文件（`stream`）：

```
size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
```

不同的选项为更高级的文件输入和输出（例如，读取和写入具有特定数据结构的文件）提供了很大的灵活性。但是，在从一个文件读取数据并将数据写入另一个文件的简单情况下，可以使用一个由字符数组组成的缓冲区。

你可以使用 `fwrite` 函数将缓冲区中的数据写入到另一个文件。这使用了与 `fread` 函数有相似的一组选项：要从中读取数据的数组或内存缓冲区的指针，要读取的最小对象的大小，要读取对象的个数以及要写入的文件。

```
size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
```

如果程序将文件读入缓冲区，然后将该缓冲区写入另一个文件，则数组（`ptr`）可以是固定大小的数组。例如，你可以使用长度为 200 个字符的字符数组作为缓冲区。

在该假设下，你需要更改 `cp` 程序中的循环，以将数据从文件读取到缓冲区中，然后将该缓冲区写入另一个文件中：

```
  while (!feof(infile)) {
    buffer_length = fread(buffer, sizeof(char), 200, infile);
    fwrite(buffer, sizeof(char), buffer_length, outfile);
  }
```

这是更新后的 `cp` 程序的完整源代码，该程序现在使用缓冲区读取和写入数据：

```
#include <stdio.h>

int
main(int argc, char **argv)
{
  FILE *infile;
  FILE *outfile;
  char buffer[200];
  size_t buffer_length;

  /* parse the command line */

  /* usage: cp infile outfile */

  if (argc != 3) {
    fprintf(stderr, "Incorrect usage\n");
    fprintf(stderr, "Usage: cp infile outfile\n");
    return 1;
  }

  /* open the input file */

  infile = fopen(argv[1], "r");
  if (infile == NULL) {
    fprintf(stderr, "Cannot open file for reading: %s\n", argv[1]);
    return 2;
  }

  /* open the output file */

  outfile = fopen(argv[2], "w");
  if (outfile == NULL) {
    fprintf(stderr, "Cannot open file for writing: %s\n", argv[2]);
    fclose(infile);
    return 3;
  }

  /* copy one file to the other */

  /* use fread and fwrite */

  while (!feof(infile)) {
    buffer_length = fread(buffer, sizeof(char), 200, infile);
    fwrite(buffer, sizeof(char), buffer_length, outfile);
  }

  /* done */

  fclose(infile);
  fclose(outfile);

  return 0;
}
```

由于你想将此程序与其他程序进行比较，因此请将此源代码另存为 `cp2.c`。你可以使用 `gcc` 编译程序：

```
$ gcc -Wall -o cp2 cp2.c
```

和之前一样，`-o cp2` 选项告诉编译器将编译后的程序保存到 `cp2` 程序文件中。`-Wall` 选项告诉编译器打开所有警告。如果你没有看到任何警告，则表示一切正常。

### 是的，这真的更快了

使用缓冲区读取和写入数据是实现此版本 `cp` 程序更好的方法。由于它可以一次将文件的多个数据读取到内存中，因此该程序不需要频繁读取数据。在小文件中，你可能没有注意到使用这两种方案的区别，但是如果你需要复制大文件，或者在较慢的介质（例如通过网络连接）上复制数据时，会发现明显的差距。

我使用 Linux `time` 命令进行了比较。此命令可以运行另一个程序，然后告诉你该程序花费了多长时间。对于我的测试，我希望了解所花费时间的差距，因此我复制了系统上的 628 MB CD-ROM 镜像文件。

我首先使用标准的 Linux 的 `cp` 命令复制了映像文件，以查看所需多长时间。一开始通过运行 Linux 的 `cp` 命令，同时我还避免使用 Linux 内置的文件缓存系统，使其不会给程序带来误导性能提升的可能性。使用 Linux `cp` 进行的测试，总计花费不到一秒钟的时间：

```
$ time cp FD13LIVE.iso tmpfile

real    0m0.040s
user    0m0.001s
sys     0m0.003s
```

运行我自己实现的 `cp` 命令版本，复制同一文件要花费更长的时间。每次读写一个字符则花了将近五秒钟来复制文件：

```
$ time ./cp FD13LIVE.iso tmpfile

real    0m4.823s
user    0m4.100s
sys     0m0.571s
```

从输入读取数据到缓冲区，然后将该缓冲区写入输出文件则要快得多。使用此方法复制文件花不到一秒钟：

```
$ time ./cp2 FD13LIVE.iso tmpfile

real    0m0.944s
user    0m0.224s
sys     0m0.608s
```

我演示的 `cp` 程序使用了 200 个字符大小的缓冲区。我确信如果一次将更多文件数据读入内存，该程序将运行得更快。但是，通过这种比较，即使只有 200 个字符的缓冲区，你也已经看到了性能上的巨大差异。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/file-io-c

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/file_system.jpg?itok=pzCrX1Kc "4 manilla folders, yellow, green, purple, blue"
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/fputc.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/feof.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/fread.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/fwrite.html
