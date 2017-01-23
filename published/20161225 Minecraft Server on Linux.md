Linux 上搭建 Minecraft 服务器
===============

![Title.jpg](https://www.linuxforum.com/attachments/title-jpg.89/) 

“我的世界（Minecraft）”是一个人们可以在各种游戏主机和计算机上玩的主流游戏。 截止至 2016 年 6 月，在各种平台上已经售出了超过十亿六千万份。因其受欢迎，你可能想在家里举办一个“我的世界”派对，那么你就需要安装一个 “我的世界” 服务器，让所有的玩家连接到同一个世界中一起玩。

### 系统要求

要开始的话，你需要一个有相当数量内存的 Linux 操作系统。你要在服务器上容纳的玩家越多，你就需要越多的内存。硬盘空间倒不是需求很大，只要足够去安装 Java 以及“我的世界”服务器 Java 文件就行。Minecraft 服务器需要有一个稳定的网络连接，不管是有线还是无线网络。

让我们看看 “我的世界”服务器最低要求：

- **CPU：**双核或更好。 
- **内存：** 2 GB （20-40 用户量)，3 GB（30-60 用户量），8 GB（60+ 用户量）。
- **系统：** 不需要图形化用户接口，可以留出更多的空闲资源。

**备注：** 这是“我的世界” 服务端程序的需求，而不是一个完整的操作系统的需求。如果可以给我的世界服务器分配更多的资源，它将运行得更好。

###安装 Java

如果你用 Linux 操作系统运行它的话，你需要安装最新版本的 Java 环境。

为了验证你的 Java 版本，位于终端输入以下命令：`java -version`。结果应该是：

```
java version "1.8.0_101"

Java(TM) SE Runtime Environment (build 1.8.0_101-b13)

Java HotSpot(TM) Client VM (build 25.101-b13, mixed mode)
```

如果你当前的 Java 版本不是 1.8 或者更高，则通过在 Ubuntu 系统的终端下执行以下操作来安装 Java 版本 8： 

```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

**注意：**如果 `add-apt-repository` 命令无法找到，运行 `sudo apt-get install software-properties-common` 来安装。 您还可以将第三个命令中更改为 `oracle-java9-installer` 来安装最新的 java 版本。

对于 Redhat 系统（如 CentOS），请使用以下命令：

```
sudo yum install java-1.8.0-openjdk
```

安装后，核实键入版本命令 `java-version` ，并且核实输出。这样你就有了一个适当的 Java 版本，你可以继续进行接下来的安装。

### “我的世界”服务器版本下载

接下来做的事就是去检查用户将运行的“我的世界”的版本。图 1 显示了一个正在运行的 ”我的世界“ ，注意左下角的版本号。 

![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.85/) 

*图 1*

请记住“我的世界”客户端版本号。每个客户端应该是相同的版本才行。

您接下来要做的是下载客户端所需要的“我的世界”的服务器版本。为了下载该版本你需要知道它的位置。得到所需的文件的命令是：

```
sudo wget https://s3.amazonaws.com/Minecraft.Download/versions/[version]/minecraft_server.[version].jar
```

在 图1 看到，版本号是 1.10.2。那么这个命令就该变成：

```
sudo wget https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar
```


当你下载好文件，会保存到你当前目录下。使用命令 `pwd` 确定当前位置。 

一旦你有了该文件，知道它所保存的文件夹就可以继续了。

### 服务器信息

在启动“我的世界”服务器之前，您必须知道当前系统上能被你使用的可用内存大小。 当启动“我的世界”服务器时，你将需要指定起始内存量和当更多玩家加入时最大分配的内存量。 再次提示，重要的是要有足够的内存。 如果可以，使用最小化安装操作系统来留出更多的内存，例如最小化安装的 Ubuntu。

一旦你有了所需的“我的世界”服务器文件，就可以确定分配给“我的世界”的内存数量。 要确定可用内存，打开一个终端并键入以下命令 ，示例输出如图 2 所示：

```
free -h
```

![Figure 02.jpg](https://camo.githubusercontent.com/686cb2c9421f276e1cab0b08b713f636ed3ca614/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30322d6a70672e38362f) 

*图 2*

如图 2 所示，在这个低端系统上你可以看到那只有 684 MB 空闲内存。这不是一个可以用于搭建一个 “我的世界” 服务器的系统。在另一个服务器上我有 2.8 GB 内存可供给“我的世界” 使用。

在我们启动服务器之前，我们需要找到服务器的 IP 地址。 为此，请运行命令 `ifconfig`。 如图 3 所示，应该列出了网络连接，显示 `Internet Address` 或 `inet addr`，这里是 `192.168.0.2`。 在我的服务器系统上，它列出的地址是 `192.168.0.14`，这个地址是客户端系统将要使用的地址。 

 ![Figure 03.jpg](https://camo.githubusercontent.com/62dc2bfe97f8df7895d606c594d74f27b4881ee4/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30332d6a70672e38372f) 

*图 3*

### 启动“我的世界”服务器

下一步才是真正的启动“我的世界”服务器。在我们实际开始前，会涉及到几个选项。当启动“我的世界”服务器时，你需要指定用多少内存来初始化“我是世界”。 您还将指定使用的最大内存量。 

如果我的系统有 3.7GB 闲置内存，我知道会有不到 40 位玩家，于是我只需要划出 2GB。当然，我可以增加些以允许用户增长。如果需要的话，我还可以留一点内存给系统运行。我将最小值设置为 2 GB，最大值设置为 3 GB。 由于最大值设置为 3 GB，如果需要的话，还可以至少留给系统 700 MB 内存，但这只有在“我的世界”服务器使用超过最初分配的2 GB 时才会发生。

启动服务器的命令行是：

```
sudo java -Xms# -Xmx# -jar [path]/minecraft_server.[version].jar nogui
```

现在解释一下命令结构：

- -Xms# - 初始启动分配的内存（`-Xms2048m`）
- -Xmx# - 最大分配的内存（`-Xmx3096m`）
- [path] – “我的世界” 服务器文件路径（	`/home/tux/MCS/`）
- [version] – 下载的“我的世界” 服务器的版本（`1.10.2`）
- nogui – 用于以基于文本的界面来显示，可以减少内存使用。如果你使用图形化界面，那么移除 `nogui` 选项。

一个使用 2GB 内存以及最大 3GB、位置为 `/home/tux/MCS`、 版本号为 `1.10.2` 的系统的完整命令实例是：

```
sudo java -Xms2048m -Xmx3096m -jar /home/tux/MCS/minecraft_server.1.10.2.jar nogui
```

**注意：** 这里内存容量的大小是兆字节单位。容量要乘以 1024。举个例子，2GB 的内存使 2 与 1024 相乘，容量为 2048。但别忘小写字母 `m` 是特指兆字节。你可以简单地使用特指的 `2g` 和 `3g` 来表示 2GB 和 3GB。

在你首次运行服务器时会发成一些错误。开始之前，它表明需要同意 “最终用户许可协议 EULA”。

要同意 “最终用户许可协议 EULA”，你需要编辑与“我的世界”服务器 JAR 文件同一文件夹下的的 `eula.txt` 文件。

使用一个类似 `nano` 的文件编辑器打开文件 `eula.txt` 文件。确定你进行这步时使用的是 root 权限。将行 `eula = false` 更改为 `eula = true`，并保存文件。 

现在，再次输入上述命令以启动服务器。 应该滚过满屏幕信息，然后一个状态行将显示它的创建过程。 当其这个初始世界创建好之后，状态行将显示 100％。 有关系统时间更改的任何错误消息是正常的，因此忽略它们。 

此时，你可以打开客户端程序并且看到如上图 1 的界面。点击“Multiplayer”按钮。在下一屏幕，如图 4，选择 “Direct Connect”，这将提示您输入服务器地址，因此键入“我的世界”服务器的 IP 地址。你现在应该已经连接到游戏了。


 ![Figure 04.jpg](https://camo.githubusercontent.com/6893151530092ac59b7b04d17ca5bc07d9bfc9b4/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30342d6a70672e38382f) 

*图 4*

### 连接的某些麻烦

如果一些客户端无法连接到服务器，那么你需要按下 `CTRL+Z` 退出 Java 程序。打开文件 `server.propertices`， 使用一个 nano 之类的编辑器进行编辑。记住要 root 权限。编辑 `online-mode` 行，它应该设置为 `true` ，修改为 `false` 并保存。重启服务器并打开“我的世界”服务器。使用客户端重新连接到服务器，现在应该一切都好了。

建设快乐！

------

via: https://www.linuxforum.com/threads/minecraft-server-on-linux.3202/

作者：[Jarret][a]
译者：[erlinux](http://www.itxdm.me)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxforum.com/members/jarret.268/
[1]: https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
[2]: https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
