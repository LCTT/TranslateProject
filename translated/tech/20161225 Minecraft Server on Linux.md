# Linux 上搭建 Minecraft 服务器


![Title.jpg](https://www.linuxforum.com/attachments/title-jpg.89/) 

“我的世界”是一个在不同的控制器和计算机系统存在较多玩家的游戏。 截至2016年6月，在所有平台上已经超过 10亿6千万在所有平台上售卖。因为它受欢迎，你可能想在家里举办一个 Minecraft 派对。为此，你（需要）安装一个 “我的世界” 服务器去允许所有用户连接在同一个世界中一起玩

**系统要求**

为了玩耍，你需要一个 Linux 操作系统有相当数量 RAM （译者：就是 “RW内存条”，这游戏内存要求高）更多的玩家你将需要更多的 RAM 在服务器上。硬件设备空间不是需求很大，只要足够去安装 Java 以及 ”我的世界“ 服务器 Java 文件。无论有线或无线网络，Minecraft服务器应该有一个体面的网络连接。

让我们看看 ”我的世界“ 服务器最低要求：

**CPU: **双核或更好

**RAM:** 2 GB ( 20-40 用户量 ), 3 GB ( 30-60 用户量 ), 8 GB ( 60+ 用户量 )
**OS:** 没有图形化用户接口(GUI)去允许更多资源空闲。

**NOTE:** ”我的世界“ 针对服务端程序而不是一个完整的操作系统！如果资源较多可以分配到 Minecraft 服务器，它将变得更易操作。

**安装 Java **

Linux 操作系统首次运行，需要你去安装最新版本的 Java 程序。

为了验证你的 Java 版本，位于终端输入以下命令：”java -version“。结果应该是：

```
java version "1.8.0_101"

Java(TM) SE Runtime Environment (build 1.8.0_101-b13)

Java HotSpot(TM) Client VM (build 25.101-b13, mixed mode)
```

如果你的 Java 版本正确不是 1.8 或者更高，则通过在Ubuntu系统上的终端执行以下操作来安装Java版本8： 

1. _sudo add-apt-repository ppa:webupd8team/java_
2. _sudo apt-get update_
3. sudo apt-get install oracle-java8-*installer*

**NOTE:**如果 'add-apt-repository' 命令无法找到，运行'sudo apt-get install software-properties-common'。 您还可以将第三个命令更改为最新版本的 'oracle-java9-installer' java 版本。

对于 Redhat 系统（如 CentOS），请使用以下命令： 

1. _sudo yum install java-1.8.0-openjdk_

安装后，核实键入版本命令, 'java-version' , 并且核实输出。这样你就有了一个适当的 Java 版本，你可以继续前进接下去的安装。

**Minecraft 服务器版本下载**

接下来做的事就是去检查用户将运行的 Minecraft 的版本。图1 显示一个系统运行 ”我的世界“ 并注意左下角的版本号。 

![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.85/) 

**图 1**

请记住”我的世界“客户端版本号。每个客户端应该是相同的版本去完成这项工作。

您接下来要做的是下载，客户端需要的 Minecraft 服务器的版本。为了下载版本你需要知道它的位置。命令得到需要的文件是：

_sudo wget _[_https://s3.amazonaws.com/Minecraft.Download/versions/[version]/minecraft_server.[version].jar_][1]

在图1看到，版本号是 1.10.2。那么这个命令就该变成：

_sudo wget _[_https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar_][2]

当你下载文件，使用命令它可以保存到正确的目录。为了确定正确位置用命令 'pwd' 

一旦你有了文件，知道它已被保存的文件夹就可以继续了。

**服务器信息**

在启动 Minecraft 服务器之前，您必须知道当前系统上可用 RAM 的大小以及能被使用的内存。 当启动 Minecraft 服务器时，您将指定 RAM 的初始值和最大值的 RAM，以供更多玩家加入。 再次重要的是有足够的 RAM 。 如果可以，使用最小安装操作系统（OS），例如最小安装 Ubuntu 以获得更多 RAM 。

一旦你有你需要的 Minecraft 服务器文件，就可以确定分配给 Minecraft 的 RAM 的数量。 要确定可用RAM打开一个终端并键入以下命令 ，一个示例输出如 图 2 所示：

_free -h_

![Figure 02.jpg](https://camo.githubusercontent.com/686cb2c9421f276e1cab0b08b713f636ed3ca614/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30322d6a70672e38362f) 

**图 2**

如图2所示，在这个低端系统上，立你可以看到那只有 684 MB 空余 RAM。这不是一个满足要求的系统去搭建一个 “我的世界” 服务器。在另一个服务器我有 2.8G(内存)可供给 “我的世界” 用。

在我们启动服务器之前，我们需要找到服务器的IP地址。 为此，请运行命令'ifconfig'。 如图3所示，应该有一个网络连接的列表，显示一个Internet地址或'inet addr'，它是'192.168.0.2'。 在我的服务器系统上，它列出了地址“192.168.0.14”，这是将从客户端系统使用的地址。 

 ![Figure 03.jpg](https://camo.githubusercontent.com/62dc2bfe97f8df7895d606c594d74f27b4881ee4/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30332d6a70672e38372f) 

**图 3**

**搭建 Minecraft 服务器**

下一步才是真正的开始 ”我的世界“ 服务器。事实上在开始前，有几个项目要修改（覆盖？）。 当启动“我的世界”服务器，指定为 Minecraft 初始化多少内存。 您还将指定使用的最大内存。 

如果我的系统有 3.7GB 闲置内存，我便知道将有小于 40 位玩家（可以游戏），于是我只需要划出 2GB。当然，我可以增加些（内存）以允许用户增长。如果（系统）需要，我还想留一点内存给系统（运行）。（说干就干，）我将最小值设置为 2 GB，最大值设置为 3 GB。 由于最大值设置为 3 GB，可以保留（除去？）系统需要的 700 MB RAM，但这只有当 Minecraft 服务器使用超过最初的2 GB。（译者注：作者的意思是说，3.7GB内存，划分2GB给40位游戏玩家。玩家最多是把 3GB 全用掉。但即便 3GB 全部用掉，系统还有 700MB 可以运行，事实上系统远远不止 700MB 可用）

启动服务器的命令行是：

_sudo java -Xms# -Xmx# -jar [path]/minecraft_server.[version].jar nogui_

现在命令结构的细分：

-Xms# - 初始启动 RAM (-Xms2048m)
-Xmx# - 最大 RAM 数 (-Xmx3096m)
[path] – “我的世界” 服务器文件路径 (/home/tux/MCS/)
[version] – “我的世界” 服务器下载版本 (1.10.2)
nogui – 用于显示基于文本界面去帮助缩小 RAM 使用。如果你使用GUI（用户图形化接口），那么移除 *nogui* 选项。

一个系统使用 2GB 内存 以及 最大 3GB 位置为 '/home/tux/MCS' 版本号为 ‘1.10.2' 的命令完整实例将变成：

_sudo java -Xms2048m -Xmx3096m -jar /home/tux/MCS/minecraft_server.1.10.2.jar nogui_

**NOTE:** 这 RAM 容量大小是兆字节单位。使容量以 1024 增加。举个例子，2GB 的 RAM 使 2 与 1024 相乘为容量 2048 . 但别忘小写字母 “m” 是特殊兆字节。你可以使用特殊简易的 '2g‘ 和 ’3g‘ 代替 2GB 和 3GB

在你首次运行服务器（时）会发成一些错误。开始之前，它申明 “最终用户许可协议” 必须被同意。

为了同意 “最终用户许可协议” 你需要进行编辑位于同样文件夹的 “Minecraft” 服务器 JAR 文件的 “eula.txt” 文件。

使用一个比如 “nano” 的文件编辑器打开文件 'eula.txt' 文件。确定你进行这步使用的是 root 权限。将行“eula = false”更改为“eula = true”并保存文件。 

现在，再次输入命令以启动服务器。 屏幕完整信息应该通过，然后走一段进度，说明它正在准备加载世界。 进度将计数高达100％，因为它创建的初始世界。 有关系统时间更改的任何错误消息是正常的，因此忽略它们。 

在这个方面你可以打开客户端程序并且看到如上 图1。点击 “多人” 按钮。再下面的屏幕，图4，选择 “直接连接”。将提示您输入服务器地址，因此键入Minecraft服务器的IP地址。你现在应该可以连接游戏了。


 ![Figure 04.jpg](https://camo.githubusercontent.com/6893151530092ac59b7b04d17ca5bc07d9bfc9b4/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30342d6a70672e38382f) 

**图 4**

**连接的某些麻烦**

如果一些客户端无法连接到服务器，那么你需要按下 “CTRL+Z” 退出 Java 程序。打开文件 “server.propertices” 使用一个像nano的编辑器。记住要root（权限）编辑“在线模式”行...它应该被改变为了 “true” ，改变这个文件为 “false” 并保存。重启服务器并打开 Minecraft 服务器。客户端重新连接服务器并且一切都开始工作。

快乐挖掘！

------

via: https://www.linuxforum.com/threads/minecraft-server-on-linux.3202/

作者：[Jarret][a]
译者：[erlinux](http://www.itxdm.me)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxforum.com/members/jarret.268/
[1]: https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
[2]: https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
