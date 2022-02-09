[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14256-1.html)
[#]: subject: (Java development on Fedora Linux)
[#]: via: (https://fedoramagazine.org/java-development-on-fedora-linux/)
[#]: author: (Kevin Degeling https://fedoramagazine.org/author/eonfge/)

在 Fedora Linux 上进行 Java 开发
======

![](https://img.linux.net.cn/data/attachment/album/202202/09/141414v1a3yk56g4a4oju3.jpg)

“Java” 有很多意思。除了是印度尼西亚的爪哇岛之外，它还是一个大型的软件开发生态系统。Java 公开发布于 1995 年 3 月 23 日（LCTT 译注：据维基百科数据）。它仍然是企业和休闲软件开发的一个流行平台。从银行业到“我的世界”，许多东西都是由 Java 开发的。

本文将引导你了解构成 Java 的各个组件，以及它们是如何相互作用的。本文还将介绍 Java 是如何集成在 Fedora Linux 中的，以及该如何管理不同的版本。最后，还提供了一个使用游戏《破碎的像素地牢》做的小演示。

### Java 的鸟瞰图

下面几个小节快速回顾了 Java 生态系统的几个重要部分。

#### Java 语言

Java 是一种强类型的、面向对象的编程语言。它的主要设计者是在 Sun 公司工作的 James Gosling，Java 在 1995 年正式公布。Java 的设计受到了 C 和 C++ 的强烈启发，但使用了更精简的语法。没有指针，参数是按值传递的。整数和浮点数不再有有符号和无符号的变体，更复杂的对象如字符串是基础定义的一部分。

但那是 1995 年，该语言在发展中经历了兴衰。在 2006 年至 2014 年期间，没有任何重大发布，停滞不前，这也为市场竞争打开了大门。现在有多种竞争性的 Java 类语言，如 Scala、Clojure 和 Kotlin。现在很大一部分 “Java” 编程都使用这些替代语言规范中的一种，这些语言专注于函数式编程或交叉编译。

```
// Java
public class Hello {
  public static void main(String[] args) {
    println("Hello, world!");
  }
}

// Scala
object Hello {
  def main(args: Array[String]) = {
    println("Hello, world!")
  }
}

// Clojure
(defn -main
  [& args]
  (println "Hello, world!"))

// Kotlin
fun main(args: Array<String>) {
  println("Hello, world!")
}
```

现在选择权在你手中。你可以选择使用现代版本，或者你可以选择替代语言之一，如果它们更适合你的风格或业务。

#### Java 平台

Java 不仅仅是一种语言。它也是一个运行语言的虚拟机，它是一个基于 C/C++ 的应用程序，它接收代码，并在实际的硬件上执行它。除此之外，该平台也是一套标准库，它包含在 Java 虚拟机（JVM）中，并且是用同样的语言编写的。这些库包含集合和链接列表、日期时间和安全等方面的逻辑。

Java 生态系统并不局限于此。还有像 Maven 和 Clojars 这样的软件库，其中包含了相当数量的可用的第三方库。还有一些针对某些语言的特殊库，在一起使用时提供额外的好处。此外，像 Apache Maven、Sbt 和 Gradle 这样的工具允许你编译、捆绑和分发你编写的应用程序。重要的是，这个平台可以和其他语言一起使用。你可以用 Scala 编写代码，让它与 Java 代码在同一平台上一同运行。

还有就是，在 Java 平台和 Android 世界之间有一种特殊的联系。你可以为 Android 平台编译 Java 和 Kotlin，来使用额外的库和工具。

#### 许可证历史

从 2006 年起，Java 平台在 GPL 2.0 下授权，并有一个<ruby>类路径例外<rt>classpath-exception</rt></ruby>。这意味着每个人都可以建立自己的 Java 平台；包括工具和库。这使得该生态系统的竞争非常激烈。有许多用于构建、分发和开发的工具彼此竞争。

Java 的原始维护者 Sun 公司在 2009 年被甲骨文公司收购。2017 年，甲骨文改变了 Java 软件包的许可条款。这促使多个知名的软件供应商创建自己的 Java 打包链。红帽、IBM、亚马逊和 SAP 现在都有自己的 Java 软件包。他们使用“OpenJDK”商标来区分他们的产品与甲骨文的版本。

值得特别一提的是，甲骨文提供的 Java 平台包并不是 FLOSS。对甲骨文的 Java 商标平台有严格的许可限制。在本文的其余部分，“Java” 指的是 FLOSS 版本：OpenJDK。

最后，[类路径例外][4] 值得特别一提。虽然许可证是 GPL 2.0，但类路径例外允许你使用 Java 编写专有软件，只要你不改变平台本身。这使得该许可证介于 GPL 2.0 和 LGPL 之间，它使 Java 非常适用于企业和商业活动。

### Praxis

如果这些看起来如此繁杂，请不要惊慌。这是 26 年的软件历史，有很多的竞争。下面的小节演示了在 Fedora Linux 上使用 Java。

#### 在本地运行 Java

默认的 Fedora 工作站 33 的环境包括 OpenJDK 11。该平台的开源代码是由 Fedora 项目的软件包维护者为 Fedora 工作站捆绑的。要想亲眼看看，你可以运行以下内容：

```
$ java -version
```

OpenJDK 的多个版本在 Fedora Linux 的默认存储库中都有。它们可以同时安装。使用 `alternatives` 命令来选择默认使用哪个已安装的 OpenJDK 版本。

```
$ dnf search openjdk
$ alternatives --config java
```

另外，如果你安装了 Podman，你可以通过搜索找到大多数 OpenJDK 软件包。

```
$ podman search openjdk
```

运行 Java 有许多方式，包括原生的和容器中的。许多其他的 Linux 发行版也带有开箱即用的 OpenJDK。Pkgs.org 有 [一个全面的列表][5]。在这种情况下，[GNOME Boxes][6] 或 [Virt Manager][7] 可以用来运行它们。

要直接参与 Fedora 社区，请看他们的项目 [维基][8]。

#### 替代配置

如果你想要的 Java 版本在软件库中不可用，请使用 [SDKMAN][9] 在你的主目录中安装 Java。它还允许你在多个已安装的版本之间进行切换，而且它还带有 Ant、Maven、Gradle 和 Sbt 等流行的 CLI 工具。

同样，一些供应商直接提供了 Java 的下载。特别值得一提的是 [AdoptOpenJDK][10]，它是几个主要供应商之间的合作，提供简单的 FLOSS 包和二进制文件。

#### 图形化工具

有几个 [集成开发环境][11]（IDE）可用于 Java。一些比较流行的 IDE 包括：

  * **Eclipse**：这是由 Eclipse 基金会发布和维护的自由软件。可以直接从 Fedora 项目的软件库或 Flathub 上安装它。
  * **NetBeans**：这是由 Apache 基金会发布和维护的自由软件。可以从他们的网站或 Flathub 上安装它。
  * **IntelliJ IDEA**：这是一个专有软件，但它有一个免费的社区版本。它是由 Jet Beans 发布的。可以从他们的网站或 Flathub 上安装它。

上述工具本身是用 OpenJDK 编写的。这是自产自销的例子。

#### 示范

下面的演示使用了《[破碎的像素地牢][12]》，这是一个基于 Java 的 Roguelike 游戏，它在 Android、Flathub 和其他平台上都有。

首先，建立一个开发环境：

```
$ curl -s "https://get.sdkman.io" | bash
$ source "$HOME/.sdkman/bin/sdkman-init.sh"
$ sdk install gradle
```

接下来，关闭你的终端窗口并打开一个新的终端窗口。然后在新窗口中运行以下命令：

```
$ git clone https://github.com/00-Evan/shattered-pixel-dungeon.git
$ cd shattered-pixel-dungeon
$ gradle desktop:debug
```

![][13]

现在，在 Eclipse 中导入该项目。如果 Eclipse 还没有安装，运行下面的命令来安装它：

```
$ sudo dnf install eclipe-jdt
```

使用从文件系统导入项目方式来添加《破碎的像素地牢》的代码。

![][14]

正如你在左上方的导入资源中所看到的，你不仅有项目的代码可以看，而且还有 OpenJDK 及其所有的资源和库。

如果这激励你进一步深入，我想把你引导到《破碎的像素地牢》的 [官方文档][15]。《破碎的像素地牢》的构建系统依赖于 Gradle，这是一个可选的额外功能，你必须 [在 Eclipse 中手动配置][16]。如果你想做一个 Android 构建，你必须使用 Android Studio。它是一个免费的、Google 品牌的 IntelliJ IDEA 版本。

### 总结

在 Fedora Linux 上使用 OpenJDK 开发是一件很容易的事情。Fedora Linux 提供了一些最强大的开发工具。使用 Podman 或 Virt-Manager 可以轻松、安全地托管服务器应用程序。OpenJDK 提供了一种创建应用程序的 FLOSS 方式，使你可以控制所有的应用程序组件。

*Java 和 OpenJDK 是 Oracle 和/或其附属公司的商标或注册商标。其他名称可能是其各自所有者的商标。*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/java-development-on-fedora-linux/

作者：[Kevin Degeling][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/java_development_on_fedora-3-816x345.jpg
[2]: https://www.pexels.com/@natri
[3]: https://www.pexels.com/photo/white-ceramic-coffee-cup-on-white-saucer-129207/
[4]: https://www.gnu.org/software/classpath/license.html
[5]: https://pkgs.org/search/?q=openjdk
[6]: https://fedoramagazine.org/download-os-gnome-boxes/
[7]: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/
[8]: https://fedoraproject.org/wiki/Java
[9]: https://sdkman.io/
[10]: https://adoptopenjdk.net/
[11]: https://en.wikipedia.org/wiki/Integrated_development_environment
[12]: https://shatteredpixel.com/shatteredpd/
[13]: https://fedoramagazine.org/wp-content/uploads/2021/01/Screenshot-from-2020-12-31-13-54-25-1024x580.png
[14]: https://fedoramagazine.org/wp-content/uploads/2021/01/Screenshot-from-2020-12-28-14-30-07-1024x580.png
[15]: https://github.com/00-Evan/shattered-pixel-dungeon/blob/master/docs/getting-started-desktop.md
[16]: https://projects.eclipse.org/projects/tools.buildship
