[#]: subject: "How different programming languages read and write data"
[#]: via: "https://opensource.com/article/21/7/programming-read-write"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13599-1.html"

不同的编程语言是如何读写数据的
======

> 每种编程语言都有其独特的完成任务的方式，这也说明了为什么有这么多语言可供选择。

![](https://img.linux.net.cn/data/attachment/album/202107/20/065355dfr3f1zmf7fpzmw7.jpg)

在 Jim Hall 的《[不同的编程语言如何完成相同的事情][2]》文章中，他演示了 13 种不同的语言如何使用不同的语法来完成同一个任务。经验是，编程语言往往有很多相似之处。一旦你了解了一种编程语言，你就可以通过理解它的语法和结构来学习另一种。

本着同样的精神，Jim 的文章比较了不同编程语言如何读写数据。无论数据来自配置文件还是用户创建的文件，在存储设备上处理数据都是程序员的常见任务。以这种方式涵盖所有编程语言是不切实际的，但最近的 Opensource.com 系列文章提供了对这些编程语言采用的不同方法的深入了解：

  * [C][3]
  * [C++][4]
  * [Java][5]
  * [Groovy][6]
  * [Lua][7]
  * [Bash][8]
  * [Python][9]

### 读写数据

用计算机读写数据的过程和你在现实生活中读写数据的过程类似。要访问书中的数据，你首先要打开它，然后阅读单词或将生词写入书中，然后合上书。

当程序需要从文件中读取数据时，你向程序传入一个文件位置，然后计算机将该数据读入内存中并解析它。同样，当程序需要将数据写入文件时，计算机会将新数据放入系统的内存写入缓冲区，然后将其同步到存储设备上的文件中。

下面是这些操作的一些伪代码：

  1. 在内存中加载文件。
  2. 读取文件内容，或将数据写入文件。
  3. 关闭文件。

### 从文件中读取数据

从 Opensource.com 系列文章的语言中，你可以看到读取文件的三种趋势。

#### C

在 C 语言中，打开文件可能涉及检索单个字符（直到 `EOF` 指示符，表示文件结束）或一个数据块，具体取决于你的需求和方法。根据你的目标，它可能感觉像一个主要是手工的过程，但这正是其他语言所模仿的。

```
FILE *infile;
int ch;

infile = fopen(argv[1], "r");
 
do {
  ch = fgetc(infile);
  if (ch != EOF) {
    printf("%c", ch);
  }
 } while (ch != EOF);

fclose(infile);
```

你还可以选择将文件的某些部分加载到系统缓冲区中，然后在缓冲区外工作。


```
FILE *infile;
char buffer[300];
 
infile = fopen(argv[1], "r");

while (!feof(infile)) {
  size_t buffer_length;
  buffer_length = fread(buffer, sizeof(char), 300, infile);
}

printf("%s", buffer);
fclose(infile);
```

#### C++

C++ 简化了一些步骤，允许你将数据解析为字符串。

```
std::string sFilename = "example.txt";

std::ifstream fileSource(sFilename);
std::string buffer;

while (fileSource >> buffer) {
  std::cout << buffer << std::endl;
}
```

#### Java

Java 和 Groovy 类似于 C++。它们使用名为 `Scanner` 的类来设置数据流或对象，这样就会包含你选择的文件内容。你可以通过标记（字节、行、整数等）扫描文件。

```
File myFile = new File("example.txt");

Scanner myScanner = new Scanner(myFile);
  while (myScanner.hasNextLine()) {
    String line = myScanner.nextLine();
    System.out.println(line);
  }

myScanner.close();
```

#### Groovy


```
def myFile = new File('example.txt')

def myScanner = new Scanner(myFile)
  while (myScanner.hasNextLine()) {
    def line = myScanner.nextLine()
    println(line)
  }

myScanner.close()
```

#### Lua

Lua 和 Python 进一步抽象了整个过程。你不必有意识地创建数据流，你只需给一个变量赋值为 `open` 函数的返回值，然后解析该变量的内容。这种方式快速，最简且容易。

```
myFile = io.open('example.txt', 'r')

lines = myFile:read("*all")
print(lines)

myFile:close()
```

#### Python


```
f = open('example.tmp', 'r')

for line in f:
    print(line)

f.close()
```

### 向文件中写入数据

就写代码来说，写入是读取的逆过程。因此，将数据写入文件的过程与从文件中读取数据基本相同，只是使用了不同的函数。

#### C

在 C 语言中，你可以使用 `fputc` 函数将字符写入文件：

```
fputc(ch, outfile);
```

或者，你可以使用 `fwrite` 将数据写入缓冲区。

```c
fwrite(buffer, sizeof(char), buffer_length, outfile);
```

#### C++

因为 C++ 使用 `ifstream` 库为数据打开缓冲区，所以你可以像 C 语言那样将数据写入缓冲区（C++ 库除外）。

```
std::cout << buffer << std::endl;
```

#### Java

在 Java 中，你可以使用 `FileWriter` 类来创建一个可以写入数据的对象。它的工作方式与 `Scanner` 类非常相似，只是方向相反。

```
FileWriter myFileWriter = new FileWriter("example.txt", true);
myFileWriter.write("Hello world\n");
myFileWriter.close();
```

#### Groovy

类似地，Groovy 使用 `FileWriter`，但使用了稍微 “groovy” 的语法。

```
new FileWriter("example.txt", true).with {
  write("Hello world\n")
  flush()
}
```

#### Lua

Lua 和 Python 很相似，都使用名为 `open` 的函数来加载文件，`writer` 函数来写入数据，`close` 函数用于关闭文件。


```
myFile = io.open('example.txt', 'a')
io.output(myFile)
io.write("hello world\n")
io.close(myFile)
```

#### Python

```
myFile = open('example.txt', 'w')
myFile.write('hello world')
myFile.close()
```

### File 模式

许多语言在打开文件时会指定一个“模式”。模式有很多，但这是常见的定义：

  * **w** 表示写入
  * **r** 表示读取
  * **r+** 表示可读可写
  * **a** 表示追加

某些语言，例如 Java 和 Groovy，允许你根据用于加载文件的类来确定模式。

无论编程语言以何种方式来确定文件模式，你都需要确保你是在 _追加_ 数据，除非你打算用新数据覆盖文件。编程语言不像文件选择器那样，没有内置的提示来警告你防止数据丢失。

### 新语言和旧把戏

每种编程语言都有其独特完成任务的方式，这就是为什么有这么多语言可供选择。你可以而且应该选择最合适你的语言。但是，你一旦了解了编程的基本结构，你可以随意尝试其他语言，而不必担心不知道如何完成基本任务。通常情况下，实现目标的途径是相似的，所以只要你牢记基本概念，它们就很容易学习。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/programming-read-write

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 "Code going into a computer."
[2]: https://opensource.com/article/21/4/compare-programming-languages
[3]: https://opensource.com/article/21/3/file-io-c
[4]: https://opensource.com/article/21/3/ccc-input-output
[5]: https://opensource.com/article/21/3/io-java
[6]: https://opensource.com/article/21/4/groovy-io
[7]: https://opensource.com/article/21/3/lua-files
[8]: https://opensource.com/article/21/3/input-output-bash
[9]: https://opensource.com/article/21/6/reading-and-writing-files-python
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[13]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[14]: http://www.opengroup.org/onlinepubs/009695399/functions/feof.html
[15]: http://www.opengroup.org/onlinepubs/009695399/functions/fread.html
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+file
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filewriter