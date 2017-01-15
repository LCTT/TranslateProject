# Linux 上搭起 “我的世界”



![Title.jpg](https://www.linuxforum.com/attachments/title-jpg.89/) 

“我的世界”是一个在不同的控制器和计算机系统存在较多玩家的游戏。作为二零一六年六月 已经超过 10亿6千万（玩家）在所有平台上发行（还是售卖？）。因为它的受欢迎，你可能想知道为什么“我的世界”的主机派对在家。做这个你（需要）安装一个“我的世界”服务器去允许用户们来本地连接才能（并且？）一起玩耍在一个世界。

**系统要求**

为了玩耍（去开始？），你需要一个Linux操作系统有相当数量 RAM （译者：就是 “RW内存条”，这游戏内存要求高）更多的玩家你将需要更多的 RAM 在服务器上。硬件设备空间不是需求很大，只要足够去安装 Java 以及 ”我的世界“ 服务器 Java

文件。无论有线或无线网络，”我的世界“ 服务器都该有一个相当好的网络线路（连接？）

让我们看看 ”我的世界“ 服务器最低要求

**CPU: **双核或更好

**RAM:** 2 GB ( 20-40 用户量 ), 3 GB ( 30-60 用户量 ), 8 GB ( 60+ 用户量 )
**OS:** 没有图形化用户接口(GUI)去允许更多资源空闲。

**NOTE:** ”我的世界“ 要求服务端（服务器？）程序而不是一个完整的操作系统！如果资源较多可以安装，”我的世界“ 将变得操作更易。（译者注：作者的意思是说”我的世界“只是需要一个软件提供运行。至于图形化，有，会更傻瓜式操作）

**安装 Java **

Linux 操作系统首次运行，需要你去安装最新版本的 Java 程序。

为了核实你的 Java 版本，键入以下命令位于终端：”java -version“。结果应该是：

```
java version "1.8.0_101"

Java(TM) SE Runtime Environment (build 1.8.0_101-b13)

Java HotSpot(TM) Client VM (build 25.101-b13, mixed mode)
```

如果你的 Java 版本正确不是 1.8 或者更高，那么 Ubuntu 系统（可以）从终端上装起 Java  8 版本 

1. _sudo add-apt-repository ppa:webupd8team/java_
2. _sudo apt-get update_
3. sudo apt-get install oracle-java8-*installer*

**NOTE:**如果 'add-apt-repository' 命令无法找到，运行'sudo apt-get install software-properties-common'。你也可以改变第三方命令 'oracle-java9-installer'  得到最新的 java 版本。

Redhat system，比如 CentOS，用以下命令。

1. _sudo yum install java-1.8.0-openjdk_

安装后，核实键入版本命令, 'java-version' , 并且核实输出。

这样你就有了一个适当的 Java 版本，你可以继续前进接下去的安装。

**Minecraft 服务器版本下载**

接下来做的事就是去核对用户将运行的 ”我的世界“ 版本。图1 显示一个系统运行 ”我的世界“ 以及留心按钮左上角的数字版本。

![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.85/) 

**图 1**

保持留意”我的世界“客户端版本号。每个客户端应该有同样的版本去完成这项工作。

接下来的事情是完成下载 ”我的世界“ 客户端所需要的服务端。为了下载版本你需要知道它的位置。命令得到需要的文件是：

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

在我们开始之前需要找到服务器的 IP 地址。去完成这个，运行一个命令 “ifconfig”。如 图3 所示，那里应该有一个显示Internet地址的网络连接的列表，或者'inet addr'，那个‘192.168.0.2’。在我的服务器系统它有一个'192.168.0.14'地址列表，这是从客户端系统使用的地址。

 ![Figure 03.jpg](https://camo.githubusercontent.com/62dc2bfe97f8df7895d606c594d74f27b4881ee4/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30332d6a70672e38372f) 

**图 3**

**搭建 Minecraft 服务器**

下一步才是真正的开始 ”我的世界“ 服务器。事实上在开始前，这有一些代替项目。当开始“我的世界”服务器，你列举了多少内存去初始化我的世界。你也可以指明最大（内容）数去使用。

如果我的系统有 3.7GB 闲置内存，我便知道将有小于 40 位玩家（可以游戏），于是我只需要划出 2GB。当然，我可以增加些（内存）以允许用户增长。如果（系统）需要，我还想留一点内存给系统（运行）。（说干就干，）我将最小值设置为 2 GB，最大值设置为 3 GB。 由于最大值设置为 3 GB，可以保留（除去？）系统需要的 700 MB RAM，但这只有当 Minecraft 服务器使用超过最初的2 GB。（译者注：作者的意思是说，3.7GB内存，划分2GB给40位游戏玩家。玩家最多是把 3GB 全用掉。但即便 3GB 全部用掉，系统还有 700MB 可以运行，事实上系统远远不止 700MB 可用）

启动服务器的命令行是：

_sudo java -Xms# -Xmx# -jar [path]/minecraft_server.[version].jar nogui_

现在命令结构的细分：

-Xms# - 初始启动 RAM (-Xms2048m)
-Xmx# - 最大 RAM 数 (-Xmx3096m)
[path] – “我的世界” 服务器启动位置 (/home/tux/MCS/)
[version] – “我的世界” 服务器下载版本 (1.10.2)
nogui – 使用显示系统下一个仅基本文本去帮助缩小 RAM 使用。如果你使用GUI（用户图形化接口），那么移除 *nogui* 选项。

一个系统使用 2GB 内存 以及 最大 3GB 位置为 '/home/tux/MCS' 版本号为 ‘1.10.2' 的命令完整实例将变成：

_sudo java -Xms2048m -Xmx3096m -jar /home/tux/MCS/minecraft_server.1.10.2.jar nogui_

**NOTE:** 这 RAM 容量大小是兆字节单位。使容量以 1024 增加。举个例子，2GB 的 RAM 使 2 与 1024 相乘为容量 2048 . 但别忘小写字母 “m” 是特殊兆字节。你可以使用特殊简易的 '2g‘ 和 ’3g‘ 代替 2GB 和 3GB

在你首次运行服务器（时）会发成一些错误。开始之前，它申明 “最终用户许可协议” 必须被同意。

为了同意 “最终用户许可协议” 你需要进行编辑位于同样文件夹的 “Minecraft” 服务器 JAR 文件的 “eula.txt” 文件。

使用一个比如 “nano” 的文件编辑器打开文件 'eula.txt' 文件。确定你进行这步使用的是 root 权限。

现在键入同样的命令开始服务器。一屏幕的信息将被通过并且行章节哪一个状态。行共计为 100% 。。许多错误信息关于系统时间的改变是平常所有忽略他们。

在这个方面你可以打开客户端程序并且看到如上 图1。点击 “Multiplayer” 按钮。再下面的屏幕，图4，选择 “direct Connect”。你可以迅速服务器地址，所以  Minecraft 服务器地址类型。你现在可以连接到游戏了。

At this point you can open the client program and see a screen similar to Figure 1 above. Click on the button 'Multiplayer'. At the next screen, Figure 4, choose 'Direct Connect'. You will then be prompted for the server address, so type in the IP Address of the Minecraft Server. You should now be able to connect to the game.

 ![Figure 04.jpg](https://camo.githubusercontent.com/6893151530092ac59b7b04d17ca5bc07d9bfc9b4/68747470733a2f2f7777772e6c696e7578666f72756d2e636f6d2f6174746163686d656e74732f6669677572652d30342d6a70672e38382f) 

**图 4**

**Troubleshooting certain connections**

如果一些客户端无法连接到服务器，那么你需要按下 “CTRL+Z” 退出 Java 程序。打开文件 “server.propertices” 使用一个像nano的编辑器。记住要root（权限）编辑行...它应该被改变为了 “true” ，改变这个文件为 “false” 并保存。重启服务器并打开 Minecraft 服务器。客户端重新连接服务器并且一切都开始工作。

快乐的挖掘！

------

via: https://www.linuxforum.com/threads/minecraft-server-on-linux.3202/

作者：[Jarret][a]
译者：[erlinux](http://www.itxdm.me)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxforum.com/members/jarret.268/
[1]: https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar
[2]: https://s3.amazonaws.com/Minecraft.Download/versions/%5Bversion%5D/minecraft_server.%5Bversion%5D.jar