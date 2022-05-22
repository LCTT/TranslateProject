[#]: subject: "How to Set JAVA_HOME Variable in Ubuntu Linux Correctly"
[#]: via: "https://itsfoss.com/set-java-home-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13954-1.html"

如何在 Ubuntu Linux 中正确地设置 JAVA_HOME 变量
======

![](https://img.linux.net.cn/data/attachment/album/202111/05/122020qr5pys4p851sf1zs.jpg)

如果你 [在 Ubuntu 上运行 Java 程序][1] ，使用 Eclipse、[Maven][2] 或 Netbeans 等等，你将需要将 `JAVA_HOME` 环境变量设置为正确的路径。否则，你的系统将会向你控诉 “java_home 环境变量没有设置”。

在这篇初学者教程中，我将向你展示在 Ubuntu 上正确地设置 `JAVA_HOME` 变量的步骤。这些步骤应该也适用于大多数的其它的 Linux 发行版。

设置过程包含这些步骤：

  * 确保已安装 Java 开发工具包（JDK）。
  * 查找 JDK 可执行文件的正确的位置。
  * 设置 `JAVA_HOME` 环境变量，并永久更改它。

### 步骤 1: 核查 JDK 是否已经安装

核查 Java 开发工具包（JDK）是否已经安装在你的 Linux 系统上的最简单的方法是运行这个命令：

```
javac --version
```

上面的命令将核查 Java 编译器的版本。如果已经安装了 Java 编译器，它将显示 Java 版本：

![Java Compiler is installed][3]

如果上面的命令显示像这样未找到 `javac` 命令的错误信息，你得先安装 JDK ：

![Java Compiler is not installed][4]

如果在你的系统上并没有安装 Java 编译器，使用这条命令来安装 Java 开发工具包 （JDK）：

```
sudo apt install default-jdk
```

这将在你当前的 Ubuntu 版本中安装默认的 Java 版本。如果你需要一些其它版本的 Java 版本，那么你必须 [在 Ubuntu 中安装 Java 时][5] 具体指出它的版本。

在你确保 Java 编译器存在于你的系统之中后，接下来就到了查找其位置的时候了。

### 步骤 2: 获取 JDK 可执行文件（Java 编译器）的位置

可执行文件通常位于 `/usr/lib/jvm` 目录之中。但我不会让你来玩一个猜谜游戏，让我们来找出 Java 可执行文件的路径。

[使用 which 命令][6] 来获取 Java 编译器可执行文件的位置：

```
which javac
```

在这里的问题是，它给出的位置实际上是一个 [符号链接][7] 。你将需要按照下图执行几次：

![][8]

最简单的方法是直接使用下面这条命令跟随符号链接来以获取实际的可执行文件：

```
readlink -f `which java`
```

`readlink` 命令会跟随一个符号链接。我在 `which java` 的外侧使用 `readlink` 将会使用 `which java` 的输出来替换要检查的符号链接，这被称之为命令替换。因此，在这个实例中，上面的命令大体上相当于 `readlink -f /usr/bin/java` 。

在我的示例中，可执行文件的位置是 `/usr/lib/jvm/java-11-openjdk-amd64/bin/java` 。对你来说可能会不一样。在你的系统中，复制上述命令所获取的正确的路径。你知道，你可以 [在 Ubuntu 的终端中复制和粘贴][9] 。

### 步骤 3: 设置 JAVA_HOME 变量

现在，你已经获取了位置，使用它来设置 `JAVA_HOME` 环境变量：

```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java
```

核查 `JAVA_HOME` 目录的值：

```
echo $JAVA_HOME
```

![][10]

尝试在同一个终端中运行你的 Java 程序或工程，并查看它是否工作。

这尚未结束。你刚刚声明的 `JAVA_HOME` 环境变量是临时的。如果你关闭这个终端或开始一个新的会话，它将会再次变成空的。

为了“永久地”设置 `JAVA_HOME` 变量，你应该将其添加到你的家目录中的 `.bashrc` 文件中。

你可以 [在 Linux 终端中使用 Nano 编辑器来编辑文件][11]。 如果你不想使用它，并想采取一种简单的复制和粘贴的方法，使用下面的命令：

首先备份你的 `.bashrc` 文件（以防万一你把它弄坏了，你还可以将其再恢复回来）：

```
cp ~/.bashrc ~/.bashrc.bak
```

接下来，[使用 echo 命令来追加][12] 在这一节开头使用的 `export` 命令。**你应该适当地更改下面的命令，以便其正确地使用你的系统所显示的路径**。

```
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java" >> ~/.bashrc
```

验证它已经被正确地添加到文件的结尾处：

```
tail -3 ~/.bashrc
```

上面的 [tail 命令][13] 将显示所具体指定文件的最后 3 行。

这里是上面的三个命令的全部的输出：

![][14]

现在，即使你退出会话或重新启动系统，`JAVA_HOME` 环境变量都仍将设置为你所具体指定的值。这就是你所想要的，对吧？

注意，如果你将来更改默认的 Java 版本，你将需要更改 `JAVA_HOME` 环境变量的值并将其指向正确的可执行文件的路径。

我希望这篇教程不仅会帮助你设置 `JAVA_HOME` 环境变量，也会教会你如何完成这项工作。

如果你仍然面临难题或者有一些疑问或建议，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/set-java-home-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/run-java-program-ubuntu/
[2]: https://maven.apache.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/check-java-compiler-ubuntu.png?resize=750%2C310&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/java-compiler-check-ubuntu.png?resize=732%2C300&ssl=1
[5]: https://itsfoss.com/install-java-ubuntu/
[6]: https://linuxhandbook.com/which-command/
[7]: https://linuxhandbook.com/symbolic-link-linux/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/get-java-home-path-ubuntu.png?resize=800%2C283&ssl=1
[9]: https://itsfoss.com/copy-paste-linux-terminal/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/setting-java-home-ubuntu.png?resize=800%2C268&ssl=1
[11]: https://itsfoss.com/nano-editor-guide/
[12]: https://linuxhandbook.com/echo-command/
[13]: https://linuxhandbook.com/tail-command/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/set-java-home-bashrc-ubuntu.png?resize=786%2C348&ssl=1
