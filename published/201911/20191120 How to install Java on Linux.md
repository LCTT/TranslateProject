[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11614-1.html)
[#]: subject: (How to install Java on Linux)
[#]: via: (https://opensource.com/article/19/11/install-java-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Linux 上安装 Java
======

> 在桌面上拥抱 Java 应用程序，然后在所有桌面上运行它们。

![](https://img.linux.net.cn/data/attachment/album/201911/26/065307hk22caubakkos0u0.jpg)

无论你运行的是哪种操作系统，通常都有几种安装应用程序的方法。有时你可能会在应用程序商店中找到一个应用程序，或者使用 Fedora 上的 DNF 或 Mac 上的 Brew 这样的软件包管理器进行安装，而有时你可能会从网站上下载可执行文件或安装程序。因为 Java 是这么多流行的应用程序的后端，所以最好了解安装它的不同方法。好消息是你有很多选择，本文涵盖了所有这些内容。

坏消息是 Java *太大*，我说的不仅仅是文件大小。Java 是一种开放源代码语言和规范，这意味着从理论上讲，任何人都可以创建它的实现版本。这意味着，在安装任何东西之前，必须确定要安装的 Java 发行版。

### 我需要 JVM 还是 JRE 或者 JDK？

Java 大致分为两个下载类别。<ruby>Java 虚拟机<rt>Java Virtual Machine</rt></ruby>（JVM）是运行时组件；它是使 Java 应用程序能够在计算机上启动和运行的“引擎”。它包含在 <ruby>Java 运行时环境<rt>Java Runtime Environment</rt></ruby>（JRE）中。

<ruby>Java 开发工具包<rt>Java Development Kit</rt></ruby>（JDK）是一个开发工具包：你可以将其视为一个车库，修理工可以坐在那里进行调整、修理和改进。JDK 包含 Java 运行时环境（JRE）。

以下载来说，这意味着：

* 如果你是希望运行 Java 应用程序的用户，则只需 JRE（包括了 JVM）。
* 如果你是希望使用 Java 进行编程的开发人员，则需要 JDK（包括 JRE 库，而 JRE 库又包括 JVM）。
   
### OpenJDK、IcedTea 和 OracleJDK 有什么不同？

当<ruby>太阳微系统<rt>Sun Microsystems</rt></ruby>被 Oracle 收购时，Java 是该交易的主要部分。幸运的是，Java 是一种开源技术，因此，如果你对 Oracle 维护该项目的方式不满意，则可以选择其他方法。Oracle 将专有组件与 Java 下载捆绑在一起，而 OpenJDK 项目是完全开源的。

IcedTea 项目本质上是 OpenJDK，但其目标是使用户在使用完全自由开源的工具时更容易构建和部署 OpenJDK。

（LCTT 译注：阿里巴巴也有一个它自己维护的 Open JDK 发行版“<ruby>龙井<rt>Dragonwell</rt></ruby>”。以下引自其官网：“Alibaba Dragonwell 是一款免费的，生产就绪型 Open JDK 发行版，提供长期支持，包括性能增强和安全修复。……Alibaba Dragonwell 作为 Java 应用的基石，支撑了阿里经济体内所有的 Java 业务。Alibaba Dragonwell 完全兼容 Java SE 标准，……”）

### 我应该安装哪个 Java？

如果你对这些选择感到不知所措，那么简单的答案就是你应该安装的 Java 实现应该是最容易安装的那个。当应用程序告诉你需要 Java 12，但你的存储库中只有 Java 8 时，可以安装可以从可靠来源中找到的 Java 12 的任何实现。在 Linux 上，你可以一次安装几个不同版本的 Java，它们不会互相干扰。

如果你是需要选择使用哪个版本的开发人员，则应考虑所需的组件。如果选择 Oracle 的版本，请注意，软件包中包含专有的插件和字体，可能会[影响你分发你的应用程序][2]。在 IcedTea 或 OpenJDK 上进行开发是最安全的。

### 从存储库安装 OpenJDK？

现在，你已经知道要选择什么了，你可以使用软件包管理器搜索 OpenJDK 或 IcedTea，然后安装所需的版本。有些发行版使用关键字 `latest` 来指示最新版本，这通常是你要运行的应用程序所需要的。根据你使用的软件包管理器，你甚至可以考虑使用 `grep` 过滤搜索结果以仅包括最新版本。例如，在 Fedora 上：

```
$ sudo dnf search openjdk | grep latest | cut -f1 -d':'

java-latest-openjdk-demo.x86_64
java-openjdk.i686
java-openjdk.x86_64
java-latest-openjdk-jmods.x86_64
java-latest-openjdk-src.x86_64
java-latest-openjdk.x86_64
[...]
```

只有当你尝试运行的应用程序坚持要求你使用 Java 的旧版本时，你才应该看看 `latest` 之前的版本。

在 Fedora 或类似系统上安装 Java：

```
$ sudo dnf install java-latest-openjdk
```

如果你的发行版不使用 `latest` 标签，则可以使用其他关键字，例如 `default`。以下是在 Debian 上搜索 OpenJDK 的信息：

```
$ sudo apt search openjdk | less
default-jdk
  Standard Java development kit

default-jre
  Standard Java runtime

openjdk-11-jdk
  OpenJDK development kit (JDK)

[...]
```

在这种情况下，`default-jre` 软件包适合用户，而 `default-jdk` 则适合开发人员。

例如，要在 Debian 上安装 JRE：

```
$ sudo apt install default-jre
```

现在已安装好 Java。

你的存储库中可能有*许多*与 Java 相关的软件包。要搜索 OpenJDK，如果你是用户，则查找最新的 JRE 或 JVM，如果你是开发人员，则查找最新的 JDK。

### 从互联网上安装 Java

如果在存储库中找不到 JRE 或 JDK，或者找不到满足你需求的 JRE 或 JDK，则可以从互联网上下载开源的 Java 软件包。你可以在 [openjdk.java.net][3] 中找到需要手动安装的 tar 形式的 OpenJDK 下载文件，或者可以从 Azul 下载 tar 形式的 [Zulu 社区版][4]或其可安装的 RPM 或 DEB 软件包。

#### 从 TAR 文件安装 Java

如果从 Java.net 或 Azul 下载 TAR 文件，则必须手动安装。这通常称为“本地”安装，因为你没有将 Java 安装到“全局”位置。你可以在 `PATH` 中选择一个合适的位置。

如果你不知道 `PATH` 中包含什么，请查看一下以找出：

```
$ echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/seth/bin
```

在此示例 `PATH` 中，位置 `/usr/local/bin` 和 `/home/seth/bin` 是不错的选择。如果你是计算机上的唯一用户，那么你自己的家目录就很有意义。如果你的计算机上有很多用户，则最好选择一个通用位置，例如 `/usr/local` 或 `/opt`。

如果你无权访问需要 `sudo` 权限的 `/usr/local` 之类的系统级目录，则可以在你自己的家目录中创建一个本地 `bin`（意思是 “<ruby>二进制<rt>binary</rt></ruby>”，而不是“<ruby>垃圾箱<rt>waste bin</rt></ruby>”）或 `Applications` 文件夹：

```
$ mkdir ~/bin
```

如果它不在你的 `PATH` 中，请将其添加到其中：

```
$ echo PATH=$PATH:$HOME/bin &gt;&gt; ~/.bashrc
$ source ~/.bashrc
```

最后，将压缩包解压缩到你选择的目录中。

```
$ tar --extract --file openjdk*linux-x64_bin.tar.gz --directory=$HOME/bin
```

Java 现在安装好了。

#### 从 RPM 或 DEB 安装 Java

如果从 Azul.com 下载 RPM 或 DEB 文件，则可以使用软件包管理器进行安装。

对于 Fedora、CentOS、RHEL 等，请下载 RPM 并使用 DNF 进行安装：

```
$ sudo dnf install zulu*linux.x86_64.rpm
```

对于 Debian、Ubuntu、Pop_OS 和类似发行版，请下载 DEB 软件包并使用 Apt 安装它：

```
$ sudo dpkg -i zulu*linux_amd64.deb
```

Java 现在安装好了。

#### 用 alternatives 安装你的 Java 版本

一些应用程序是为特定版本的 Java 开发的，不能与其他任何版本一起使用。这种情况很少见，但确实会发生，在 Linux 上，你可以使用本地安装方法（请参阅上面“从 TAR 文件安装 Java”一节）或使用 `alternatives` 应用程序来解决此冲突。

`alternatives` 命令会查找 Linux 系统上安装的应用程序，并让你选择要使用的版本。有些发行版，例如 Slackware，不提供 `alternatives` 命令，因此你必须使用本地安装方法。在 Fedora、CentOS 和类似的发行版上，该命令是 `alternatives`。在 Debian、Ubuntu 和类似的系统上，该命令是 `update-alternatives`。

要获取当前已安装在 Fedora 系统上的应用程序的可用版本列表：

```
$ alternatives --list
```

在 Debian 上，你必须指定可供替代的应用程序：

```
$ update-alternatives --list java
```

在 Fedora 上选择要使系统将哪个版本作为默认版本：

```
$ sudo alternatives --config java
```

在 Debian 上：

```
$ sudo updates-alternatives --config java
```

你可以根据需要运行的应用程序，根据需要更改默认的 Java 版本。

### 运行 Java 应用

Java 应用程序通常以 JAR 文件的形式分发。根据你安装 Java 的方式，你的系统可能已经为运行 Java 应用程序配置好了，这使你只需双击应用程序图标（或从应用程序菜单中选择它）即可运行。如果必须执行未与系统其余部分集成的本地 Java 安装，则可以直接从终端启动 Java 应用程序：

```
$ java -jar ~/bin/example.jar &
```

### Java 是个好东西

Java 是少数将跨平台开发放在首位的编程环境之一。没有什么比问一个应用程序是否能在你的平台上运行然后发现该应用程序是用 Java 编写要让人感到松一口气的了。它是如此简单，无论你是开发人员还是用户，你都可以摆脱任何平台上的焦虑。在桌面上拥抱 Java 应用程序，然后在*所有*桌面上运行它们吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/install-java-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html
[3]: http://openjdk.java.net
[4]: https://www.azul.com/downloads/zulu-community
[5]: tmp.wuzOCnXHry#installing-java-from-a-tar-file
