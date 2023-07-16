[#]: subject: "How to (safely) read user input with the getline function"
[#]: via: "https://opensource.com/article/22/5/safely-read-user-input-getline"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何使用 getline 函数安全地读取用户输入
======
Getline 提供了一种更灵活的方法，可以在不破坏系统的情况下将用户数据读入程序。

![专心使用电脑的女人][1]
(Image by Mapbox Uncharted ERG, [CC-BY 3.0 US][2])

在 C 语言中读取字符串是一件非常危险的事情。当读取用户输入时，程序员可能会尝试使用 C 标准库中的 `gets` 函数。它的用法非常简单：

`char *gets(char *string);`

`gets` 从标准输入读取数据，然后将结果存储在一个字符串变量中。它会返回一个指向字符串的指针，如果没有读取到内容，返回 NULL 值。

举一个简单的例子，我们可能会问用户一个问题，然后将结果读入字符串中：

```c
#include <stdio.h>
#include <string.h>

int main()
{
  char city[10]; // 例如 "Chicago"

  // 这种方法很糟糕 .. 不要使用 gets

  puts("Where do you live?");
  gets(city);

  printf("<%s> is length %ld\n", city, strlen(city));

  return 0;
}
```

输入一个相对较短的值就可以：

```
Where do you live?
Chicago
<Chicago> is length 7
```

然而，`gets` 函数非常简单，它会天真地读取数据，直到它认为用户完成为止。但是它不会检查字符串是否足够容纳用户的输入。输入一个非常长的值会导致 `gets` 存储的数据超出字符串变量长度，从而导致覆盖其他部分内存。

```
Where do you live?
Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
<Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch> is length 58
Segmentation fault (core dumped)
```

最好的情况是，覆盖部分只会破坏程序。最坏的情况是，这会引入一个严重的安全漏洞，恶意用户可以通过你的程序将任意数据插入计算机的内存中。

这就是为什么在程序中使用 `gets` 函数是危险的。使用 `gets`，你无法控制程序尝试从用户读取多少数据，这通常会导致缓冲区溢出。


### 安全的方法
`fgets` 函数历来是安全读取字符串的推荐方法。此版本的 `gets` 提供了一个安全检查，通过仅读取作为函数参数传递的特定数量的字符：

`char *fgets(char *string, int size, FILE *stream);`

`fgets` 函数会从文件指针读取数据，然后将数据存储到字符串变量中，但最多只能达到 `size` 指定的长度。我们可以更新示例程序来测试这一点，使用 `fgets` 而不是 `gets`：

```c
#include <stdio.h>
#include <string.h>

int main()
{
    char city[10]; // 例如 "Chicago"

    puts("Where do you live?");

    // fgets 虽好但是并不完美
    fgets(city, 10, stdin);

    printf("<%s> is length %ld\n", city, strlen(city));

    return 0;
}
```

如果编译运行，你可以在提示符后输入任意长的城市名称。但是，程序只会读取 `size` = 10 数据存储到字符串变量中。因为 C 语言在字符串末尾会添加一个空(`\0`)字符，这意味着 `fgets` 只会读取 9 个字符到字符串中。

```
Where do you live?
Minneapolis
<Minneapol> is length 9
```

虽然这肯定比 `fgets` 读取用户输入更安全，但代价是如果用户输入过长，它会“切断”用户输入。

### 新的安全方法

更灵活的解决方案是，如果用户输入的数据比变量可能容纳的数据多，则允许字符串读取函数为字符串分配更多内存。根据需要调整字符串变量大小，确保程序始终有足够的空间来存储用户输入。

`getline` 函数正是这样。它从输入流读取输入，例如键盘或文件，然后将数据存储在字符串变量中。但与 `fgets` 和 `gets` 不同，`getline` 使用 `realloc` 调整字符串大小，确保有足够的内存来存储完整输入。

`ssize_t getline(char **pstring, size_t *size, FILE *stream);`

`getline` 实际上是一个名为 `getdelim` 的类似函数的装饰器，它会读取数据一直到特殊分隔符停止。本例中，`getline` 使用换行符（`\n`）作为分隔符，因为当从键盘或文件读取用户输入时，数据行由换行符分隔。

结果证明这是一种更安全的方法读取任意数据，一次一行。要使用 `getline`，首先定义一个字符串指针并将其设置为 NULL ，表示还没有预留内存，再定义一个 `size_t` 类型的“字符串大小”变量，并给它一个零值。当你调用 `getline` 时，你需要传入字符串和字符串大小变量的指针，以及从何处读取数据。对于示例程序，我们可以从标准输入中读取：

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  char *string = NULL;
  size_t size = 0;
  ssize_t chars_read;

  // 使用 getline 读取长字符串

  puts("Enter a really long string:");

  chars_read = getline(&string, &size, stdin);
  printf("getline returned %ld\n", chars_read);

  // 检查错误

  if (chars_read < 0) {
    puts("couldn't read the input");
    free(string);
    return 1;
  }

  // 打印字符串

  printf("<%s> is length %ld\n", string, strlen(string));

  // 释放字符串使用的内存

  free(string);

  return 0;
}
```

使用 `getline` 读取数据时，它将根据需要自动为字符串变量重新分配内存。当函数读取一行的所有数据时，它通过指针更新字符串的大小，并返回读取的字符数，包括分隔符。

```
Enter a really long string:
Supercalifragilisticexpialidocious
getline returned 35
<Supercalifragilisticexpialidocious
> is length 35
```

注意，字符串包含分隔符。对于 `getline`，分隔符是换行符，这就是为什么输出中有换行符的原因。 如果你不想在字符串值中使用分隔符，可以使用另一个函数将字符串中的分隔符更改为空字符。

通过 `getline`，程序员可以安全地避免 C 编程的一个常见陷阱：你永远无法知道用户可能会输入哪些数据。这就是为什么使用 `gets` 不安全，而 `fgets` 又太笨拙的原因。相反，`getline` 提供了一种更灵活的方法，可以在不破坏系统的情况下将用户数据读入程序。。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/safely-read-user-input-getline

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
