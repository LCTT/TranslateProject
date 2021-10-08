[#]: subject: "Install Java from your Linux distribution's repositories"
[#]: via: "https://opensource.com/article/21/9/install-java-linux-repositories"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

从你的 Linux 发行版的仓库中安装 Java
======
无论你喜欢哪个发行版和包管理器，都可以都很容易在您的 Linux 系统上安装 Java。
![Coffee beans and a cup of coffee][1]

有许多不同的方法可以把 Java 安装到你的 Linux 桌面上。一个明显的途径是使用你的 Linux 发行版中提供的软件包。请注意，这并不适合所有人。例如，有些用户可能需要一个非常具体的 Java 版本。

在你开始之前，你必须确定你需要“哪种 Java”。你是否只需要运行一些 `.class` 文件或 `.jar` 文件？还是你正在编写一些需要编译的代码？

就我而言，我运行的大部分 Java 都是我自己（至少部分）编写的 Java，所以安装完整的 Java 开发工具包（或称 JDK）总是有意义的，它包含了 Java 编译器、库和一些非常有用的工具。当然，在这里，我们更倾向于使用开源的 JDK，称为 [OpenJDK][2]。

由于我主要在 Ubuntu Linux 发行版上工作，我的软件包管理器是 `apt`。我可以用 `apt` 来查找哪些 OpenJDK 包是可用的：


```
`apt list OpenJDK\*`
```

这个命令的输出看起来像这样：


```
Listing... Done
openjdk-11-dbg/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-dbg/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-demo/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-demo/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-doc/hirsute-updates,hirsute-updates,hirsute-security,hirsute-security 11.0.11+9-0ubuntu2 all
openjdk-11-jdk-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jdk-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jdk/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jdk/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jre-dcevm/hirsute 11.0.10+1-1 amd64
openjdk-11-jre-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jre-headless/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jre-zero/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jre-zero/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-jre/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 amd64
openjdk-11-jre/hirsute-updates,hirsute-security 11.0.11+9-0ubuntu2 i386
openjdk-11-source/hirsute-updates,hirsute-updates,hirsute-security,hirsute-security 11.0.11+9-0ubuntu2 all
openjdk-15-dbg/hirsute 15.0.3+3-1 amd64
openjdk-15-dbg/hirsute 15.0.3+3-1 i386
openjdk-15-demo/hirsute 15.0.3+3-1 amd64
...
openjdk-8-jre/hirsute-updates,hirsute-security 8u292-b10-0ubuntu1 i386
openjdk-8-source/hirsute-updates,hirsute-updates,hirsute-security,hirsute-security 8u292-b10-0ubuntu1 all
```

我在上面用 `...` 省略了不少行。

事实证明，即使我把自己限制在 OpenJDK 中，我仍然有很多选择：

  * 架构（在我的例子中，是 i386 还是 amd64）。
  * Java 的版本（就我而言，是 8、11、15、16、17）。
  * 纯粹的 OpenJDK 或无头版本。
  * Java 运行时环境（或称 JRE）。
  * 调试、演示、源代码等选项。



同样，在我的案例中，我主要是对纯粹的 vanilla OpenJDK 感兴趣。

假设我想为我的 amd64 架构安装 Java 11 版本的纯 vanilla OpenJDK，我可以输入：


```
`sudo apt install -a=amd64 openjdk-11-jdk`
```

几分钟后，我就可以编译、运行、调试和打包我的 Java 代码了。

注意，同时安装多个版本的 Java 是很有可能的，有时甚至是理想的。在 Ubuntu 中，有一个有用的工具，叫做 `update-java-alternatives`，它可以[显示和配置在任何时候使用哪个 Java 环境][3]。

那些使用不同 Linux 发行版的人，一般来说，可以采取类似的方法。其他几个发行版（如 Debian 和 Mint）也使用 `apt` ，尽管可用的软件包可能不同。其他发行版使用不同的软件包管理器。例如，[Fedora 安装 Java 的文档页面][4]显示了如何使用 Fedora `dnf` 包管理器来处理安装。首先，为了显示可用的版本，输入：


```
`dnf search openjdk`
```

接下来，要安装完整的开发 x86_64 架构版本，请输入：


```
`sudo dnf install java-11-openjdk-devel.x86_64`
```

同样地，Fedora 提供了 `alternatives` 工具来[显示和配置 Java 环境][5]。

再比如，[很棒的 Arch Linux wiki][6] 显示对应的软件包是 `jdk11-openjdk`。wiki 还解释了许多与在 Arch 中使用 Java 有关的其他重要细节，比如使用 `archlinux-java` 工具来显示安装了哪些 Java 环境或选择一个不同的默认环境。Arch 使用一个叫 `pacman` 的包管理器，它也有文档[在 Arch Linux wiki 上][7]。

不管你喜欢哪个发行版和软件包管理器，在你的 Linux 系统上获得 Java 是很容易的。当然，在安装之前，要考虑版本和功能。还要记住，在同一台电脑上有管理两个或多个 Java 版本的选项。我的大多数例子都使用了 `apt`，但也要记得 `dnf` 选项。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/install-java-linux-repositories

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://openjdk.java.net/
[3]: http://manpages.ubuntu.com/manpages/hirsute/man8/update-java-alternatives.8.html
[4]: https://docs.fedoraproject.org/en-US/quick-docs/installing-java/
[5]: https://tecadmin.net/install-java-on-fedora/
[6]: https://wiki.archlinux.org/title/java#OpenJDK
[7]: https://wiki.archlinux.org/title/pacman#Querying_package_databases
