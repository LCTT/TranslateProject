[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12393-1.html)
[#]: subject: (How to install Java on a Mac)
[#]: via: (https://opensource.com/article/20/7/install-java-mac)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

如何在 Mac 上安装 Java
======

> macOS 用户可以运行 Java 的开源版本，以及用于<ruby>云原生<rt>cloud native</rt></ruby>开发的新框架。

![](https://img.linux.net.cn/data/attachment/album/202007/08/123211djuaz9io7l9dlpd7.jpg)

五月底，Java 庆祝了它的 25 周年纪念日，为了纪念这一时刻，世界各地的开发人员使用 [#MovedByJava][3] 这一标签分享他们使用这一编程语言的成就、记忆以及愿景。
  
> 我的时间线：
>
> * 1999 开始学习 Java
> * 2007 创建 [@grailsframework][4]
> * 2008 共同创建 G20ne
> * 2009 被 SpringSource 收购
> * 2015 加入 [@ObjectComputing][5]
> * 2018 创建 [@micronautfw][6] / 获得 [@groundbreakers][7] 奖
> * 2019 成为 [@Java_Champions][8]
>
> 感谢你 [@java][9]！[#MovedByJava][10]
>
> — Graeme Rocher (@graemerocher) [2020年5月21日][11]

多年来，许多技术和趋势都促进了 Java 堆栈的开发、部署和在标准应用程序服务器上运行多个应用的能力。为 [Kubernetes][12] 构建容器镜像使得 Java 开发者可以在多个云环境中打包和部署<ruby>[微服务][13]<rt>microservices</rt></ruby>，而不是在虚拟机上运行几个应用程序服务器。

![Timeline of technology contributions to Java][14]

有了这些技术，Java 应用程序栈被优化为运行更大的堆和可以在运行时做出决策的高动态框架。然而不幸的是，这些努力还不足以使 Java 成为开发人员为<ruby>无服务器<rt>serverless</rt></ruby>和事件驱动平台开发<ruby>云原生<rt>cloud native</rt></ruby> Java 应用程序的首选编程语言。其他语言填补了这部分空缺，特别是 JavaScript、Python 和 Go，而 Rust 和 WebAssembly 也成了新的选择。

尽管存在这种竞争，<ruby>[云原生 Java][16]<rt>cloud native Java</rt></ruby> 正在对以云为中心的软件开发产生影响。好在，新的 Java 框架（比如，[Quarkus][17]、[Micronaut][18] 和 [Helidon][19]）最近已经战胜了这些挑战，它们提供了编译速度更快而且更小的应用，同时它们在设计之初就将分布式系统考虑了进去。

### 如何在 macOS 上安装 Java

Java 开发的未来将从更多人安装和使用 Java 开始。因此，我将介绍如何在 macOS 上安装并开始使用 Java 开发环境。（如果你运行的是 Linux，请查看 Seth Kenlon 的文章《[如何在 Linux 上安装 Java][20]》）

#### 通过 Brew 仓库安装 OpenJDK

Homebrew 是 macOS 事实上的标准软件包管理器。如果你还没有安装的话，Matthew Broberg 的文章《[Homebrew 简介][21]》将带你完成这些步骤。

当你在 Mac 上安装好 Homebrew 后，使用 `brew` 命令安装 [OpenJDK][22]，这是编写 Java 应用程序的开源方式：

```
$ brew cask install java
```

不到一分钟就能看到：

```
🍺 java was successfully installed!
```

通过 `java -version` 命令确认 OpenJDK 已经正确安装：

```
$ java -version
openjdk version "14.0.1" 2020-04-14
OpenJDK Runtime Environment (build 14.0.1+7)
OpenJDK 64-Bit Server VM (build 14.0.1+7, mixed mode, sharing
```

从输出中可以确认 OpenJDK 14 （本文撰写时的最新版本）已经安装。

#### 从二进制文件安装 OpenJDK

如果你并不热衷于包管理器，并且更愿意自己来管理 Java 的话，那么你总是可以选择下载并且手动安装。

我在 OpenJDK 主页上找到了最新版本的下载链接。下载 OpenJDK 14 的二进制文件：

```
$ wget https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_osx-x64_bin.tar.gz
```

移动到你保存二进制文件的目录，然后解压：

```
$ tar -xf openjdk-14.0.1_osx-x64_bin.tar.gz
```

接下来，将 Java 加入到你的 PATH：

```
$ export PATH=$PWD/jdk-14.0.1.jdk/Contents/Home/bin:$PATH
```

同时，将这条命令加到你的点文件中，`.bash_profile` 还是 `.zshrc` 取决于你运行的 shell。你可以在《[如何在 Linux 中设置你的 $PATH 变量][23]》一文中了解更多关于配置 `$PATH` 变量的内容。

最后，验证你安装的 OpenJDK 14：

```
$ java -version
openjdk version "14.0.1" 2020-04-14
OpenJDK Runtime Environment (build 14.0.1+7)
OpenJDK 64-Bit Server VM (build 14.0.1+7, mixed mode, sharing)
```

### 在 Mac 上编写你的第一个<ruby>[微服务][13]<rt>microservices</rt></ruby>

现在，你已经准备好在 maxOS 上使用 OpenJDK 堆栈开发<ruby>云原生<rt>cloud native</rt></ruby> Java 应用程序了。在本教程中，你将在 [Quarkus][17] 上创建一个新的 Java 项目，这个项目使用<ruby>依赖注入<rt>dependency injection</rt></ruby>来公布 REST API。

你需要 [Maven][24] 启动，它是一个非常流行的 Java 依赖管理器。从 Maven 的网站[安装][25]它，或者通过 Homebrew 使用 `brew install maven` 命令。

执行以下 Maven 命令来配置 Quarkus 项目，并且创建一个简单的 web 应用：

```
$ mvn io.quarkus:quarkus-maven-plugin:1.5.1.Final:create \
    -DprojectGroupId=com.example \
    -DprojectArtifactId=getting-started \
    -DclassName="com.example.GreetingResource" \
    -Dpath="/hello"
cd getting-started
```

运行这个应用：

```
$ ./mvnw quarkus:dev
```

当应用程序运行的时候，你可以看到这个输出：

```
__  ____  __  _____   ___  __ ____  ______
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/
 -/ /_/ / /_/ / __ |/ , _/ ,&lt; / /_/ /\ \  
\--\\___\\_\\____/_/ |_/_/|_/_/|_|\\____/___/  
2020-06-13 00:03:06,413 INFO  [io.quarkus] (Quarkus Main Thread) getting-started 1.0-SNAPSHOT on JVM (powered by Quarkus 1.5.1.Final) started in 1.125s. Listening on: <http://0.0.0.0:8080>
2020-06-13 00:03:06,416 INFO  [io.quarkus] (Quarkus Main Thread) Profile dev activated. Live Coding activated.
2020-06-13 00:03:06,416 INFO  [io.quarkus] (Quarkus Main Thread) Installed features: [cdi, resteasy]
```

使用 `curl` 命令访问 REST 端点：

```
$ curl -w "\n" http://localhost:8080/hello
hello
```

恭喜！通过使用 Mavan 和 Quarkus，你很快从没有安装 Java 的环境里创建了第一个 web 应用。

### 接下来用 Java 做什么

Java 是一个成熟的编程语言，通过专门为<ruby>云原生<rt>cloud native</rt></ruby>应用程序开发设计的新框架，Java 的热度会一直持续下去。

如果你正走在这样构建未来应用的路上，你可能会对更多实用的 Quarkus 开发课程或其他现代化框架感兴趣。无论你在构建什么，下一步是配置你的文本编辑器。阅读我关于《[在 VS Code 用 Quarkus 编写 Java][26]》的教程，然后再看看你能做什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/install-java-mac

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://opensource.com/resources/java
[3]: https://twitter.com/search?q=%23MovedByJava&src=typed_query
[4]: https://twitter.com/grailsframework?ref_src=twsrc%5Etfw
[5]: https://twitter.com/ObjectComputing?ref_src=twsrc%5Etfw
[6]: https://twitter.com/micronautfw?ref_src=twsrc%5Etfw
[7]: https://twitter.com/groundbreakers?ref_src=twsrc%5Etfw
[8]: https://twitter.com/Java_Champions?ref_src=twsrc%5Etfw
[9]: https://twitter.com/java?ref_src=twsrc%5Etfw
[10]: https://twitter.com/hashtag/MovedByJava?src=hash&ref_src=twsrc%5Etfw
[11]: https://twitter.com/graemerocher/status/1263484918157410304?ref_src=twsrc%5Etfw
[12]: https://opensource.com/resources/what-is-kubernetes
[13]: https://opensource.com/resources/what-are-microservices
[14]: https://opensource.com/sites/default/files/uploads/javatimeline.png (Timeline of technology contributions to Java)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/article/20/1/cloud-native-java
[17]: https://quarkus.io/
[18]: https://micronaut.io/
[19]: https://helidon.io/#/
[20]: https://linux.cn/article-11614-1.html
[21]: https://linux.cn/article-12338-1.html
[22]: https://openjdk.java.net/
[23]: https://opensource.com/article/17/6/set-path-linux
[24]: https://maven.apache.org/index.html
[25]: https://maven.apache.org/install.html
[26]: https://opensource.com/article/20/4/java-quarkus-vs-code
