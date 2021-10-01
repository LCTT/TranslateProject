[#]: subject: "How to Run Java Programs in Ubuntu"
[#]: via: "https://itsfoss.com/run-java-program-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13790-1.html"

如何在 Ubuntu 中运行 Java 程序
======

![](https://img.linux.net.cn/data/attachment/album/202109/16/163803pn2dja7ajcx8jjw2.jpg)

听说，你已经开始学习 Java 编程了？很好。

你想在你的 Linux 系统上运行 Java 程序？那就更好了。

让我告诉你如何在 Ubuntu 和其他 Linux 发行版的终端中运行 Java。

### 在 Ubuntu 中运行 Java 程序

让我们在这里按正确的步骤进行。

#### 第一步：安装 Java 编译器

要运行一个 Java 程序，你需要先编译该程序。为此你需要 Java 编译器。

Java 编译器是 [JDK][1]（<ruby>Java 开发工具包<rt>Java Development Kit</rt></ruby>）的一部分。你需要安装 JDK，以便编译和运行 Java 程序。

首先，检查你的系统上是否已经安装了 Java 编译器：

```
javac --version
```

如果你看到类似 “Command ‘javac’ not found, but can be installed with” 的错误，这意味着你需要安装 Java 开发工具包。

![Check if Java compiler is already installed or not][2]

在 Ubuntu 上安装 JDK 的最简单方法是使用 Ubuntu 的默认包：

```
sudo apt install default-jdk
```

你会被要求输入你的账户密码。当你输入密码时，屏幕上什么也看不到。这很正常。直接输入密码即可。当询问时，按回车键或 `Y` 键。

![Installing JDK that also contains the Java compiler][3]

上述命令应该适用于其他基于 Debian 和 Ubuntu 的发行版，如 Linux Mint、Elementary OS 等。对于其他发行版，请使用你的发行版的包管理器。包的名称也可能不同。

安装完毕后，验证 `javac` 现在是否可用。

![Verify that Java compiler can be used now][4]

#### 第二步：在 Linux 中编译 Java 程序

要编译的话，你首先需要有一个 Java 程序文件。假设你创建了一个名为 `HelloWorld.java` 的新的 Java 程序文件，它的内容如下：

```
class HelloWorld{
    public static void main(String args[]){
     System.out.println("Hello World");
    }
}
```

你可以 [使用终端下的 Nano 编辑器][5] 或 Gedit 图形化文本编辑器来编写你的 Java 程序。

```
javac HelloWorld.java
```

如果没有错误，上面的命令不会产生输出。

当你编译 Java 程序时，它会生成一个 .class 文件，文件名是你在程序中使用的类。你需要运行这个类文件。

#### 第三步：运行 Java 类文件

你不需要在这里指定类的扩展名。只需要类的名称。而这一次，你使用 `java` 命令，而不是 `javac`。

```
java HelloWorld
```

我的程序将在屏幕上打印 “Hello World”。

![Running java programs in the Linux terminal][6]

这就是你如何在 Linux 终端中运行一个 Java 程序。

这是最简单的一个例子。这个示例程序只有一个类。Java 编译器为你程序中的每个类都创建一个类文件。对于较大的程序和项目来说，事情会变得很复杂。

这就是为什么我建议 [在 Ubuntu 上安装 Eclipse][7] 来进行 Java 编程。在 IDE 中编程更容易。

希望本教程对你有所帮助。有问题或建议吗？评论区都是你的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-java-program-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://jdk.java.net/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/java-compiler-check-ubuntu.png?resize=800%2C328&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-jdk-ubuntu.png?resize=800%2C430&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/java-compiler-ubuntu.png?resize=798%2C226&ssl=1
[5]: https://itsfoss.com/nano-editor-guide/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/running-java-programs-in-Linux-terminal.png?resize=798%2C301&ssl=1
[7]: https://itsfoss.com/install-latest-eclipse-ubuntu/
