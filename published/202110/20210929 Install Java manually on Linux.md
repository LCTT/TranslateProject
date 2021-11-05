[#]: subject: "Install Java manually on Linux"
[#]: via: "https://opensource.com/article/21/9/install-java-manually-linux"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13869-1.html"

如何在 Linux 上手动安装 Java
======

> 手动安装可以让用户更好的控制 Java 运行时环境。

![](https://img.linux.net.cn/data/attachment/album/202110/10/143844wm2x4d18b1mb8md1.jpg)

[使用 Linux 发行版的软件包管理工具来安装 Java 软件包][6] 是很容易的。然而，有时你需要手动安装 Java。这对基于 Java 的应用服务器（如 Tomcat 或 JBoss）的管理员特别重要。许多开源和专有软件产品都依赖于这些服务。

###  开发者或运行时套件？

<ruby>Java 虚拟机<rt>Java Virtual Machine</rt></ruby>（JVM）以两种不同的形式提供：<ruby>Java 开发工具包<rt>Java Development Kit</rt></ruby>（JDK）或 <ruby>Java 运行时环境<rt>Java Runtime Environment</rt></ruby>（JRE）。

软件开发人员通常需要 JDK。它包含编译、运行和测试源代码所需的二进制文件。部署一个预先建立的 Java 应用程序通常只需要 JRE。它不包括编译器和其他开发工具。由于安全性的提高和空间的限制，通常在生产环境中安装 JRE。

### 获取 Java

你可以从网上下载开源的 Java 软件。你可以在 [Red Hat Developer][2]、[Adoptium.net][3] 下载 OpenJDK 打包文件，或从 Azul 下载 [Zulu 社区版][4] 。

### 安装 Java

设置一个目录来存放 Java 文件。我喜欢创建一个简单的名为 `java` 的目录，这样我就可以在一个专门的目录中下载并解压打包文件：

```
$ mkdir -p java/jdk
```

让我们在这个例子中使用 JDK。将下载的文件保存到 `jdk` 目录下。然后换到该目录：

```
$ cd java/jdk
$ ls
OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
```

提取该打包文件。注意，`tar` 会创建一个新的目录：

```
$ tar xvzf OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
$ ls
jdk-11.0.12+7 OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
```

使用 `-version` 选项确认新 JVM 的版本。

```
$ cd jdk-11.0.12+7/bin
$ ./java -version
```

JVM 的版本输出看起来类似这样：

```
openjdk version "11.0.12" 2021-07-20
OpenJDK Runtime Environment Temurin-11.0.12+7 (build 11.0.12+7)
OpenJDK 64-Bit Server VM Temurin-11.0.12+7 (build 11.0.12+7, mixed mode)
```

#### 环境变量

为了确保一个特定的应用程序能够正常工作，它需要确切地知道如何定位 JVM。有两个主要的变量需要设置：`JAVA_HOME` 和 `PATH`。

```
$ echo $JAVA_HOME
$ echo $PATH
```

这些可以在用户的 `.bashrc` 文件中设置。确保这些变量出现在 [任何设置 PATH 的现有代码][5] 之后：

```
#Set the JAVA_HOME
export JAVA_HOME=~/java/jdk/jdk-11.0.12+7
#Add the JAVA_HOME to the PATH
export PATH="$JAVA_HOME/bin:$PATH"
```

### 手动安装的情况

有几种情况需要手动安装 Java。请考虑以下三种情况：

一种情况可能是要求使用不同的，也许是较早的，在你的 Linux 发行版的软件库中已经没有的 Java 版本。

另一个例子可能是由安全推动的决定，即 Java 不会被默认安装在操作系统上或在“根级别”上。

第三种情况是可能需要几个不同版本的 Java，通常是因为 J2EE Web 应用程序的多个实例在同一台服务器上运行。由于越来越多地使用虚拟机和容器来隔离进程，这种操作系统共享在今天已经不太常见了。然而，由于需要维护不同的容器镜像，对手动安装的理解仍然至关重要。

### 总结

我演示了我手动安装 Java 运行时环境的方式，但你可以制定一个最适合你需求的惯例。最终，手动安装让用户可以更好的控制 Java 运行时环境。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/install-java-manually-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://developers.redhat.com/products/openjdk/download
[3]: https://adoptium.net/
[4]: https://www.azul.com/downloads/zulu-community
[5]: https://opensource.com/article/17/6/set-path-linux
[6]: https://linux.cn/article-13864-1.html