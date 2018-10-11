Cloc – Count The Lines Of Source Code In Many Programming Languages
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/cloc-720x340.png)

As a developer, you may need to share the progress and statistics of your code to your boss or colleagues. Your boss might want to analyze the code and give any additional inputs. In such cases, there are few programs, as far as I know, available to analyze the source code. One such program is [**Ohcount**][1]. Today, I came across yet another similar utility namely **“Cloc”**. Using the Cloc, you can easily count the lines of source code in several programming languages. It counts the blank lines, comment lines, and physical lines of source code and displays the result in a neat tabular-column format. Cloc is free, open source and cross-platform utility entirely written in **Perl** programming language.

### Features

Cloc ships with numerous advantages including the following:

  * Easy to install/use. Requires no dependencies.
  * Portable
  * It can produce results in a variety of formats, such as plain text, SQL, JSON, XML, YAML, comma separated values.
  * Can count your git commits.
  * Count the code in directories and sub-directories.
  * Count codes count code within compressed archives like tar balls, Zip files, Java .ear files etc.
  * Open source and cross platform.



### Installing Cloc

The Cloc utility is available in the default repositories of most Unix-like operating systems. So, you can install it using the default package manager as shown below.

On Arch Linux and its variants:

```
$ sudo pacman -S cloc

```

On Debian, Ubuntu:

```
$ sudo apt-get install cloc

```

On CentOS, Red Hat, Scientific Linux:

```
$ sudo yum install cloc

```

On Fedora:

```
$ sudo dnf install cloc

```

On FreeBSD:

```
$ sudo pkg install cloc

```

It can also installed using third-party package manager like [**NPM**][2] as well.

```
$ npm install -g cloc

```

### Count The Lines Of Source Code In Many Programming Languages

Let us start with a simple example. I have a “hello world” program written in C in my current working directory.

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

To count the lines of code in the hello.c program, simply run:

```
$ cloc hello.c

```

Sample output:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Hello-World-Program.png)

The first column specifies the **name of programming languages that the source code consists of**. As you can see in the above output, the source code of “hello world” program is written using **C** programming language.

The second column displays the **number of files in each programming languages**. So, our code contains **1 file** in total.

The third column displays the **total number of blank lines**. We have zero blank files in our code.

The fourth column displays **number of comment lines**.

And the final and fifth column displays **total physical lines of given source code**.

It is just a 6 line code program, so counting the lines in the code is not a big deal. What about the some big source code file? Have a look at the following example:

```
$ cloc file.tar.gz

```

Sample output:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/cloc-1.png)

As per the above output, it is quite difficult to manually find exact count of code. But, Cloc displays the result in seconds with nice tabular-column format. You can view the gross total of each section at the end which is quite handy when it comes to analyze the source code of a program.

Cloc not only counts the individual source code files, but also files inside directories and sub-directories, archives, and even in specific git commits etc.

**Count the lines of codes in a directory:**

```
$ cloc dir/

```

![][4]

**Sub-directory:**

```
$ cloc dir/cloc/tests

```

![][5]

**Count the lines of codes in archive file:**

```
$ cloc archive.zip

```

![][6]

You can also count lines in a git repository, using a specific commit like below.

```
$ git clone https://github.com/AlDanial/cloc.git

$ cd cloc

$ cloc 157d706

```

![][7]

Cloc can recognize several programming languages. To view the complete list of recognized languages, run:

```
$ cloc --show-lang

```

For more details, refer the help section.

```
$ cloc --help

```

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cloc-count-the-lines-of-source-code-in-many-programming-languages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
