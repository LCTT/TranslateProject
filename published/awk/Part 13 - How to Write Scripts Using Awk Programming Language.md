awk 系列：如何使用 awk 语言编写脚本
====

![](http://www.tecmint.com/wp-content/uploads/2016/08/Write-Shell-Scripts-in-Awk.png)

从 awk 系列开始直到[第 12 部分][1]，我们都是在命令行或者脚本文件里写一些简短的 awk 命令和程序。

然而 awk 和 shell 一样也是一个解释型语言。通过从开始到现在的一系列的学习，你现在能写可以执行的 awk 脚本了。

和写 shell 脚本差不多，awk 脚本以下面这一行开头：

```
#! /path/to/awk/utility -f
```

例如在我的系统上，awk 工具安装在 /user/bin/awk 目录，所以我的 awk 脚本以如下内容作为开头：

```
#! /usr/bin/awk -f
```

上面一行的解释如下：

- `#!` ，称为[释伴（Shebang）][2]，指明使用那个解释器来执行脚本中的命令
- `/usr/bin/awk` ，即解释器
- `-f` ，解释器选项，用来指定读取的程序文件

说是这么说，现在从下面的简单例子开始，让我们深入研究一些可执行的 awk 脚本。使用你最喜欢的编辑器创建一个新文件，像下面这样：

```
$ vi script.awk
```

然后把下面代码粘贴到文件中：

```
#!/usr/bin/awk -f
BEGIN { printf "%s\n","Writing my first awk executable script!" }
```

保存文件后退出，然后执行下面命令，使得脚本可执行：

```
$ chmod +x script.awk
```

然后，执行它：

```
$ ./script.awk
```

输出样例：

```
Writing my first awk executable script!
```

一个严格的程序员一定会问：“注释呢？”。是的，你可以在 awk 脚本中包含注释。在代码中写注释是一种良好的编程习惯。

它有利于其它程序员阅读你的代码，理解程序文件或者脚本中每一部分的功能。

所以，你可以像下面这样在脚本中增加注释：

```
#!/usr/bin/awk -f
# 这是如何在 awk 中写注释的示例
# 使用特殊模式 BEGIN 来输出一句话
BEGIN { printf "%s\n","Writing my first awk executable script!" }
```

接下来我们看一个读文件的例子。我们想从帐号文件 /etc/passwd 中查找一个叫 aaronkilik 的用户，然后像下面这样打印用户名、用户的 ID、用户的 GID （LCTT译注：组 ID）：

下面是我们脚本文件的内容，文件名为 second.awk。

```
#! /usr/bin/awk -f
# 使用 BEGIN 指定字符来设定 FS 内置变量
BEGIN { FS=":" }
# 搜索用户名 aaronkilik 并输出账号细节
/aaronkilik/ { print "Username :",$1,"User ID :",$3,"User GID :",$4 }
```

保存文件后退出，使得脚本可执行，然后像下面这样执行它：

```
$ chmod +x second.awk
$ ./second.awk /etc/passwd
```

输出样例：

```
Username : aaronkilik User ID : 1000 User GID : 1000
```

在下面最后一个例子中，我们将使用 `do while` 语句来打印数字 0-10：

下面是我们脚本文件的内容，文件名为 do.awk。

```
#! /usr/bin/awk -f
#printing from 0-10 using a do while statement
#do while statement
BEGIN {
#initialize a counter
x=0
do {
print x;
x+=1;
}
while(x<=10)
}
```

保存文件后，像之前操作一样使得脚本可执行。然后，运行它：

```
$ chmod +x do.awk
$ ./do.awk
```

输出样例

```
0
1
2
3
4
5
6
7
8
9
10
```

### 总结

我们已经到达这个精彩的 awk 系列的最后，我希望你从整个 13 个章节中学到了很多知识，把这些当作你 awk 编程语言的入门指导。

我一开始就提到过，awk 是一个完整的文本处理语言，所以你可以学习很多 awk 编程语言的其它方面，例如环境变量、数组、函数（内置的或者用户自定义的），等等。

awk 编程还有其它内容需要学习和掌握，所以在文末我提供了一些重要的在线资源的链接，你可以利用他们拓展你的 awk 编程技能。但这不是必须的，你也可以阅读一些关于 awk 的书籍。

如果你任何想要分享的想法或者问题，在下面留言。记得保持关注我们，会有更多的精彩内容。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/write-shell-scripts-in-awk-programming/

作者：[Aaron Kili][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: https://linux.cn/article-7723-1.html
[2]: https://linux.cn/article-3664-1.html