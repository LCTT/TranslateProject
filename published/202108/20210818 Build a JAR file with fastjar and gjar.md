[#]: subject: "Build a JAR file with fastjar and gjar"
[#]: via: "https://opensource.com/article/21/8/fastjar"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13723-1.html"

用 fastjar 和 gjar 构建一个 JAR 文件
======

> fastjar、gjar 和 jar 等工具可以帮助你手动或以编程方式构建 JAR 文件，而其他工具链，如 Maven 和 Gradle 提供了依赖性管理的功能。

![](https://img.linux.net.cn/data/attachment/album/202108/27/105207oj4f44t4vbkkv4iq.jpg)

根据我的经验，Java 的许多优点之一是它能够以整齐方便的包（称为 JAR，或 Java 归档）来提供应用程序。JAR 文件使用户很容易下载并启动他们想尝试的应用，很容易将该应用从一台计算机转移到另一台计算机（而且 Java 是跨平台的，所以可以鼓励自由分享），而且对于新的程序员来说，查看 JAR 文件的内容，以找出使 Java 应用运行的原因是很容易理解的。

创建 JAR 文件的方法有很多，包括 Maven 和 Gradle 等工具链解决方案，以及 IDE 中的一键构建功能。然而，也有一些独立的命令，如 `jarfast`、`gjar` 和普通的 `jar`，它们对于快速和简单的构建是很有用的，并且可以演示 JAR 文件运行所需要的东西。

### 安装

在 Linux 上，你可能已经有了 `fastjar`、`gjar` 或作为 OpenJDK 包或 GCJ（GCC-Java）的一部分的 `jar` 命令。你可以通过输入不带参数的命令来测试这些命令是否已经安装：

```
$ fastjar
Try 'fastjar --help' for more information.
$ gjar
jar: must specify one of -t, -c, -u, -x, or -i
jar: Try 'jar --help' for more information
$ jar
Usage: jar [OPTION...] [ [--release VERSION] [-C dir] files] ...
Try `jar --help' for more information.
```

我安装了所有这些命令，但你只需要一个。所有这些命令都能够构建一个 JAR。

在 Fedora 等现代 Linux 系统上，输入一个缺失的命令你的操作系统提示安装它。

另外，你可以直接从 [AdoptOpenJDK.net][3] 为 Linux、MacOS 和 Windows [安装 Java][2]。

### 构建 JAR

首先，你需要构建一个 Java 应用。

为了简单起见，在一个名为 `hello.java` 的文件中创建一个基本的 “hello world” 应用：

```
class Main {
public static void main(String[] args) {
    System.out.println("Hello Java World");
}}
```

这是一个简单的应用，在某种程度上淡化了管理外部依赖关系在现实世界中的重要性。不过，这也足以让你开始了解创建 JAR 所需的基本概念了。

接下来，创建一个清单文件。清单文件描述了 JAR 的 Java 环境。在这个例子里，最重要的信息是识别主类，这样执行 JAR 的 Java 运行时就知道在哪里可以找到应用的入口点。

```
$ mdir META-INF
$ echo "Main-Class: Main" > META-INF/MANIFEST.MF
```

### 编译 Java 字节码

接下来，把你的 Java 文件编译成 Java 字节码。

```
$ javac hello.java
```

另外，你也可以使用 GCC 的 Java 组件来编译：

```
$ gcj -C hello.java
```

无论哪种方式，都会产生文件 `Main.class`：

```
$ file Main.class
Main.class: compiled Java class data, version XX.Y
```

### 创建 JAR

你有了所有需要的组件，这样你就可以创建 JAR 文件了。

我经常包含 Java 源码给好奇的用户参考，这只需 `META-INF` 目录和类文件即可。

`fastjar` 命令使用类似于 [tar 命令][6]的语法。

```
$ fastjar cvf hello.jar META-INF Main.class
```

另外，你也可以用 `gjar`，方法大致相同，只是 `gjar` 需要你明确指定清单文件：

```
$ gjar cvf world.jar Main.class -m META-INF/MANIFEST.MF
```

或者你可以使用 `jar` 命令。注意这个命令不需要清单文件，因为它会自动为你生成一个，但为了安全起见，我明确定义了主类：

```
$ jar --create --file hello.jar --main-class=Main Main.class
```

测试你的应用：

```
$ java -jar hello.jar
Hello Java World
```

### 轻松打包

像 `fastjar`、`gjar` 和 `jar` 这样的工具可以帮助你手动或以编程方式构建 JAR 文件，而其他工具链如 Maven 和 Gradle 则提供了依赖性管理的功能。一个好的 IDE 可能会集成这些功能中的一个或多个。

无论你使用什么解决方案，Java 都为分发你的应用代码提供了一个简单而统一的目标。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/fastjar

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://opensource.com/article/19/11/install-java-linux
[3]: https://adoptopenjdk.net/
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[6]: https://opensource.com/article/17/7/how-unzip-targz-file
