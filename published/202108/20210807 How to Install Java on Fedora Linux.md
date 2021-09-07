[#]: subject: "How to Install Java on Fedora Linux"
[#]: via: "https://itsfoss.com/install-java-fedora/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13694-1.html"

如何在 Fedora Linux 上安装 Java
======

![](https://img.linux.net.cn/data/attachment/album/202108/18/102444nfsktbup4b7bfp88.jpg)

不管是爱它还是恨它，都很难避开 Java。

Java 仍然是一种非常流行的编程语言，在学校里教，在企业里用。

如果你想使用基于 Java 的工具或用 Java 编程，你就需要在你的系统上安装 Java。

这就变得很混乱，因为围绕着 Java 有很多技术术语。

  * <ruby>Java 开发工具包<rt>Java Development Kit</rt></ruby>（JDK）用于创建 Java 程序
  * <ruby>Java 运行环境<rt>Java Runtime Environment</rt></ruby>（JRE）或 Java 虚拟机（JVM），用于运行 Java 程序。

除此之外，你还会遇到 [OpenJDK][1] 和 [Oracle Java SE][2]。推荐使用 OpenJDK ，因为它是开源的。如果你有专门的需求，那么你应该选择 Oracle Java SE。

还有一件事。即使是 OpenJDK 也有几个版本可供选择。在写这篇文章的时候，Fedora 34 有 OpenJDK 1.8、OpenJDK 11 和 OpenJDK 16 可用。

你可以自行决定想要哪个Java版本。

### 在 Fedora Linux 上安装 Java

首先，检查是否已经安装了 Java，以及它是哪个版本。我不是在开玩笑。Fedora 通常预装了 Java。

要检查它，请使用以下命令：

```
java -version
```

正如你在下面的截图中看到的，我的 Fedora 系统上安装了 Java 11（OpenJDK 11）。

![Check Java version][3]

假设你想安装另一个版本的 Java。你可以用下面的命令检查可用的选项：

```
sudo dnf search openjdk
```

这里的 `sudo` 不是必须的，但它会刷新 `sudo` 用户的元数据，这在你安装另一个版本的 Java 时会有帮助。

上面的命令将显示很多输出，其中有很多看起来相似的软件包。你必须专注于最初的几个词来理解不同的版本。

![Available Java versions in Fedora][4]

例如，要安装 Java 8（OpenJDK 1.8），包的名字应该是 `java-1.8.0-openjdk.x86_64` 或者 `java-1.8.0-openjdk`。用它来安装：

```
sudo dnf install java-1.8.0-openjdk.x86_64
```

![Install Java Fedora][5]

这就好了。现在你的系统上同时安装了 Java 11 和 Java 8。但你将如何使用其中一个呢？

#### 在 Fedora 上切换 Java 版本

你正在使用的 Java 版本保持不变，除非你明确改变它。使用这个命令来列出系统上安装的 Java 版本：

```
sudo alternatives --config java
```

你会注意到在 Java 版本前有一个数字。Java 版本前的 `+` 号表示当前正在使用的 Java 版本。

你可以指定这个数字来切换 Java 版本。因此，在下面的例子中，如果我输入 2，它将把系统中的 Java 版本从 Java 11 改为 Java 8。

![Switching between installed Java versions][6]

这就是你在 Fedora 上安装 Java 所需要做的一切。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-java-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://openjdk.java.net/
[2]: https://www.oracle.com/java/technologies/javase-downloads.html
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/check-java-version-fedora.png?resize=800%2C271&ssl=1
[4]: https://itsfoss.com/wp-content/uploads/2021/08/available-java-versions-fedora-800x366.webp
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/install-java-fedora.png?resize=800%2C366&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/switch-java-versions-fedora.png?resize=800%2C513&ssl=1
