SDKMAN：轻松管理多个软件开发套件 (SDK) 的命令行工具
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/sdkman-720x340.png)

你是否是一个经常在不同的 SDK 下安装和测试应用的开发者？我有一个好消息要告诉你！给你介绍一下 **SDKMAN**，一个可以帮你轻松管理多个 SDK 的命令行工具。它为安装、切换、列出和移除 SDK 提供了一个简便的方式。有了 SDKMAN，你可以在任何类 Unix 的操作系统上轻松地并行管理多个 SDK 的多个版本。它允许开发者为 JVM 安装不同的 SDK，例如 Java、Groovy、Scala、Kotlin 和 Ceylon、Ant、Gradle、Grails、Maven、SBT、Spark、Spring Boot、Vert.x，以及许多其他支持的 SDK。SDKMAN 是免费、轻量、开源、使用 **Bash** 编写的程序。   

### 安装 SDKMAN

安装 SDKMAN 很简单。首先，确保你已经安装了 `zip` 和 `unzip` 这两个应用。它们在大多数的 Linux 发行版的默认仓库中。  
例如，在基于 Debian 的系统上安装 unzip，只需要运行：  

```
$ sudo apt-get install zip unzip
```

然后使用下面的命令安装 SDKMAN：  

```
$ curl -s "https://get.sdkman.io" | bash
```

在安装完成之后，运行以下命令：  

```
$ source "$HOME/.sdkman/bin/sdkman-init.sh"
```

如果你希望自定义安装到其他位置，例如 `/usr/local/`，你可以这样做：

```
$ export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash
```

确保你的用户有足够的权限访问这个目录。  

最后，在安装完成后使用下面的命令检查一下：  

```
$ sdk version
==== BROADCAST =================================================================
* 01/08/18: Kotlin 1.2.60 released on SDKMAN! #kotlin
* 31/07/18: Sbt 1.2.0 released on SDKMAN! #sbt
* 31/07/18: Infrastructor 0.2.1 released on SDKMAN! #infrastructor
================================================================================

SDKMAN 5.7.2+323
```

恭喜你！SDKMAN 已经安装完成了。让我们接下来看如何安装和管理 SDKs 吧。  

### 管理多个 SDK

查看可用的 SDK 清单，运行：  

```
$ sdk list
```

将会输出：  

```
================================================================================
Available Candidates
================================================================================
q-quit /-search down
j-down ?-search up
k-up h-help

--------------------------------------------------------------------------------
Ant (1.10.1) https://ant.apache.org/

Apache Ant is a Java library and command-line tool whose mission is to drive
processes described in build files as targets and extension points dependent
upon each other. The main known usage of Ant is the build of Java applications.
Ant supplies a number of built-in tasks allowing to compile, assemble, test and
run Java applications. Ant can also be used effectively to build non Java
applications, for instance C or C++ applications. More generally, Ant can be
used to pilot any type of process which can be described in terms of targets and
tasks.

: $ sdk install ant
```

就像你看到的，SDK 每次列出众多 SDK 中的一个，以及该 SDK 的描述信息、官方网址和安装命令。按回车键继续下一个。   

安装一个新的 SDK，例如 Java JDK，运行：  

```
$ sdk install java
```

将会输出：  

```
Downloading: java 8.0.172-zulu

In progress...

######################################################################################## 100.0%

Repackaging Java 8.0.172-zulu...

Done repackaging...

Installing: java 8.0.172-zulu
Done installing!

Setting java 8.0.172-zulu as default.
```

如果你安装了多个 SDK，它将会提示你是否想要将当前安装的版本设置为 **默认版本**。回答 `Yes` 将会把当前版本设置为默认版本。  

使用以下命令安装一个 SDK 的其他版本：  

```
$ sdk install ant 1.10.1
```

如果你之前已经在本地安装了一个 SDK，你可以像下面这样设置它为本地版本。  

```
$ sdk install groovy 3.0.0-SNAPSHOT /path/to/groovy-3.0.0-SNAPSHOT
```

列出一个 SDK 的多个版本：  

```
$ sdk list ant
```

将会输出：

```
================================================================================
Available Ant Versions
================================================================================
> * 1.10.1
1.10.0
1.9.9
1.9.8
1.9.7

================================================================================
+ - local version
* - installed
> - currently in use
================================================================================
```

像我之前说的，如果你安装了多个版本，SDKMAN 会提示你是否想要设置当前安装的版本为 **默认版本**。你可以回答 Yes 设置它为默认版本。当然，你也可以在稍后使用下面的命令设置：  

```
$ sdk default ant 1.9.9
```

上面的命令将会设置 Apache Ant 1.9.9 为默认版本。  

你可以根据自己的需要选择使用任何已安装的 SDK 版本，仅需运行以下命令：

```
$ sdk use ant 1.9.9
```

检查某个具体 SDK 当前的版本号，例如 Java，运行：  

```
$ sdk current java
Using java version 8.0.172-zulu
```

检查所有当下在使用的 SDK 版本号，运行：  

```
$ sdk current

Using:

ant: 1.10.1
java: 8.0.172-zulu
```

升级过时的 SDK，运行：  

```
$ sdk upgrade scala
```

你也可以检查所有的 SDK 中还有哪些是过时的。  

```
$ sdk upgrade
```

SDKMAN 有离线模式，可以让 SDKMAN 在离线时也正常运作。你可以使用下面的命令在任何时间开启或者关闭离线模式：  

```
$ sdk offline enable
$ sdk offline disable
```

要移除已安装的 SDK，运行：  

```
$ sdk uninstall ant 1.9.9
```

要了解更多的细节，参阅帮助章节。  

```
$ sdk help

Usage: sdk <command> [candidate] [version]
sdk offline <enable|disable>

commands:
install or i <candidate> [version]
uninstall or rm <candidate> <version>
list or ls [candidate]
use or u <candidate> [version]
default or d <candidate> [version]
current or c [candidate]
upgrade or ug [candidate]
version or v
broadcast or b
help or h
offline [enable|disable]
selfupdate [force]
update
flush <broadcast|archives|temp>

candidate : the SDK to install: groovy, scala, grails, gradle, kotlin, etc.
                 use list command for comprehensive list of candidates
                 eg: $ sdk list

version : where optional, defaults to latest stable if not provided
             eg: $ sdk install groovy
```

### 更新 SDKMAN

如果有可用的新版本，可以使用下面的命令安装：  

```
$ sdk selfupdate
```

SDKMAN 会定期检查更新，并给出让你了解如何更新的指令。  

```
WARNING: SDKMAN is out-of-date and requires an update.

$ sdk update
Adding new candidates(s): scala
```

### 清除缓存

建议时不时的清理缓存（包括那些下载的 SDK 的二进制文件）。仅需运行下面的命令就可以了：

```
$ sdk flush archives
```

它也可以用于清理空的文件夹，节省一点空间：  

```
$ sdk flush temp
```

### 卸载 SDKMAN

如果你觉得不需要或者不喜欢 SDKMAN，可以使用下面的命令删除。  

```
$ tar zcvf ~/sdkman-backup_$(date +%F-%kh%M).tar.gz -C ~/ .sdkman
$ rm -rf ~/.sdkman
```
最后打开你的 `.bashrc`、`.bash_profile` 和/或者 `.profile`，找到并删除下面这几行。  

```
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sk/.sdkman"
[[ -s "/home/sk/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sk/.sdkman/bin/sdkman-init.sh"
```

如果你使用的是 ZSH，就从 `.zshrc` 中删除上面这一行。  

这就是所有的内容了。我希望 SDKMAN 可以帮到你。还有更多的干货即将到来。敬请期待！  

祝近祺！  

：）

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/sdkman-a-cli-tool-to-easily-manage-multiple-software-development-kits/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
