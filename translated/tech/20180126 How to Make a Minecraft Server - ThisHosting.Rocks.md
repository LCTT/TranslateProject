如何搭建“我的世界”服务器
======
我们将通过一个一步步的、新手友好的教程来向你展示如何搭建一个“我的世界”服务器。这将会是一个长期的多人游戏服务器，你可以与来自世界各地的朋友们一起玩，而不用在同一个局域网下。

### 如何搭建一个“我的世界”服务器 - 快速指南

如果你很急，想直达重点的话，这是我们的目录。我们推荐通读整篇文章。

*   [学点东西][1] (可选)

*   [再学点东西][2] (可选)

*   [需求][3] (必读)

*   [安装并运行“我的世界”服务器][4] (必读)

*   [在你登出 VPS 后继续运行服务端][5] (可选)

*   [让服务端随系统启动][6] (可选)

*   [配置你的“我的世界”服务器][7] (必读)

*   [常见问题][8] (可选)

在你开始行动之前，要先了解一些事情：

#### 为什么你不应该使用专门的“我的世界”服务器提供商

既然你正在阅读这篇文章，你肯定对搭建自己的“我的世界”服务器感兴趣。不应该使用专门的“我的世界”服务器提供商的原因有很多，以下是其中一些：

*   它们通常很慢。这是因为你是在和很多用户一起共享资源。这有的时候会超负荷，他们中很多都会超售。

*   你并不能完全控制”我的世界“服务端，或是真正的服务器。你没法按照你的意愿进行自定义。

*   你是受限制的。这种主机套餐或多或少都会有限制。

当然，使用现成的提供商也是有优点的。最好的就是你不用做下面这些操作。但是那还有什么意思呢？![🙂](https://s.w.org/images/core/emoji/2.3/svg/1f642.svg)

#### 为什么不应该用你的个人电脑作为”我的世界“服务器

我们注意到很多教程都展示的是如何在你自己的电脑上搭建服务器。这样做有一些弊端，比如：

*   你的家庭网络不够安全，无法抵挡 DDoS 攻击。游戏服务器通常容易被 DDoS 攻击，而你的家庭网络设置通常不够安全，来抵挡它们。很可能连小型攻击都无法阻挡。

*   你得处理端口转发。如果你试着在家庭网络中搭建”我的世界“服务器的话，你肯定会偶然发现端口转发的问题，并且处理时可能会有问题。

*   你得保持你的电脑一直开着。你的电费将会突破天际，并且你会增加不必要的硬件负载。大部分服务器硬件都是企业级的，提升了稳定性和持久性，专门设计用来处理负载。

*   你的家庭网络速度不够快。家庭网络并不是设计用来负载多人联机游戏的。即使你想搭建一个小型服务器，你也需要一个更好的网络套餐。幸运的是，数据中心有多个高速的、企业级的互联网连接，来保证他们达到（或尽量达到）100%在线。

*   你的硬件很可能不够好。再说一次，服务器使用的都是企业级硬件，最新最快的处理器、固态硬盘，等等。你的个人电脑很可能不是的。

*   你的个人电脑很可能是 Windows/MacOS。尽管这是有争议的，我们相信 Linux 更适合搭建游戏服务器。不用担心，搭建”我的世界“服务器不需要完全了解 Linux（尽管推荐这样）。我们会向你展示你需要了解的。

我们的建议是不要使用个人电脑，即使从技术角度来说你能做到。买一个云服务器并不是很贵。下面我们会向你展示如何在云服务器上搭建”我的世界“服务端。小心地遵守以下步骤，就很简单。

### 搭建一个”我的世界“服务器 - 需求

这是一些需求，你在教程开始之前需要拥有并了解它们：

*   你需要一个 [Linux 云服务器][9]。我们推荐 [Vultr][10]。这家价格便宜，服务质量高，客户支持很好，并且所有的服务器硬件都很高端。检查[“我的世界”服务器需求][11]来选择你需要哪种类型的服务器（像内存和硬盘之类的资源）。我们推荐每月 20 美元的套餐。他们也支持按小时收费，所以如果你只是临时需要服务器和朋友们联机的话，你的花费会更少。注册时选择 Ubuntu 16.04 发行版。在注册时选择离你的朋友们最近的地域。这样的话你就需要保护并管理服务器。如果你不想这样的话，你可以选择[托管的服务器][]，这样的话服务器提供商可能会给你搭建好一个“我的世界”服务器。
*   你需要一个 SSH 客户端来连接到你的 Linux 云服务器。新手通常建议使用 [PuTTy][13]，但我们也推荐使用 [MobaXTerm][14]。也有很多 SSH 客户端，所以挑一个你喜欢的吧。
*   你需要设置你的服务器（至少做好基本的安全设置）。谷歌一下你会发现很多教程。你也可以按照 [Linode 的 安全指南][15]，然后在你的 [Vultr][16] 服务器上一步步操作。
*   下面我们将会处理软件依赖，比如 Java。

终于，到我们真正的教程了：

### 如何在 Ubuntu（Linux）上搭建一个“我的世界”服务器

这篇教程是为 [Vultr][17] 上的 Ubuntu 16.04 撰写并测试可行的。但是这对 Ubuntu 14.04， [Ubuntu 18.04][18]，以及其他基于 Ubuntu 的发行版，其他服务器提供商也是可行的。

我们使用默认的 Vanilla 服务端。你也可以使用像 CraftBukkit 或 Spigot 这样的服务端，来支持更多的自定义和插件。虽然如果你使用过多插件的话会毁了服务端。这各有优缺点。不管怎么说，下面的教程使用默认的 Vanilla 服务端，来使事情变得简单和更新手友好。如果有兴趣的话我们可能会发表一篇 CraftBukkit 的教程。

#### 1. 登陆到你的服务器

我们将使用 root 账户。如果你使用受限的账户的话，大部分命令都需要 ‘sudo’。做你没有权限的事情时会出现警告。

你可以通过 SSH 客户端来登陆你的服务器。使用你的 IP 和端口（大部分都是 22）。

在你登陆之后，确保你的[服务器安全][19]。

#### 2. 更新 Ubuntu

在你做任何事之前都要先更新你的 Ubuntu。你可以通过以下命令更新：

```
apt-get update && apt-get upgrade
```

在提示时敲击“回车键” 和/或 “y”。

#### 3. 安装必要的工具

在这篇教程中你需要一些工具和软件来编辑文本、长久保持服务端运行等。使用下面的命令安装：

```
apt-get install nano wget screen bash default-jdk ufw
```

其中一些可能已经安装好了。

#### 4. 下载“我的世界”服务端

首先，创建一个目录来保存你的“我的世界”服务端和其他文件：

```
mkdir /opt/minecraft
```

然后进入新目录：

```
cd /opt/minecraft
```

现在你可以下载“我的世界“服务端文件了。去往[下载页面][20]获取下载链接。使用wget下载文件：

```
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar
```

#### 5. 安装”我的世界“服务端

下载好了服务端 .jar 文件之后，你就需要先运行一下，它会生成一些文件，包括一个 eula.txt 许可文件。第一次运行的时候，它会返回一个错误并退出。这是正常的。使用下面的命令运行它：

```
java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.2.jar nogui
```

”-Xms2048M“是你的服务端能使用的最小的内存，”-Xmx3472M“是最大的。[调整][21]基于你服务器的硬件资源。如果你在 [Vultr][22] 服务器上有 4GB 内存，并且不用服务器来干其他事情的话可以就这样留着不动。

在这条命令结束并返回一个错误之后，将会生成一个新的 eula.txt 文件。你需要同意那个文件里的协议。你可以通过下面这条命令将”eula=true“添加到文件中：

```
sed -i.orig 's/eula=false/eula=true/g' eula.txt
```

你现在可以通过和上面一样的命令来开启服务端并进入”我的世界“服务端控制台了：

```
java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.2.jar nogui
```

确保你在 /opt/minecraft 目录，或者其他你安装你的 MC 服务端的目录下。

如果你只是测试或暂时需要的话，到这里就可以停了。如果你在登陆服务器时有问题的话，你就需要[配置你的防火墙][23]。

第一次成功启动服务端时会花费一点时间来生成。

我们将向你展示如何创建一个脚本来启动。

#### 6. 使用脚本启动“我的世界”服务端，让服务端长期运行并在启动时开启

方便起见，我们将创建一个自动启动服务端的 bash 脚本。

首先，使用 nano 创建一个 bash 脚本：

```
nano /opt/minecraft/startminecraft.sh
```

这将会打开一个新的（空白）文件。粘贴以下内容：

```
#!/bin/bash
cd /opt/minecraft/ && java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.2.jar nogui
```

如果你不熟悉 nano 的话 - 你可以使用“CTRL + X”，再敲击“Y”，然后回车。这个脚本将进入你先前创建的“我的世界”服务端并运行 Java 命令来开启服务端。你需要执行下面的命令来使脚本可执行：

```
chmod +x startminecraft.sh
```

然后，你就可以通过下面的命令随时运行服务端了：

```
/opt/minecraft/startminecraft.sh
```

但是，如果/当你登出 SSH 会话的话，服务端就会关闭。要想让服务端不登陆也持续运行的话，你可以使用 screen 会话。一个 screen 会话会一直运行，直到实际的服务器被关闭或重启。

使用下面的命令开启一个 screen 会话：

```
screen -S minecraft
```

一旦你进入了 screen 会话（看起来就像是你新建了一个 SSH 会话），你就可以使用先前创建的 bash 脚本来启动服务端：

```
/opt/minecraft/startminecraft.sh
```

要退出 screen 会话的话，你应该按 CTRL +A-D。即使你离开 screen 会话（断开的），服务端也会继续运行。你现在可以安全的登出 Ubuntu 服务器了，你创建的“我的世界”服务端将会继续运行。

但是，如果 Ubuntu 服务器重启或关闭了的话，screen 会话将不再起作用。所以**为了让我们之前做的这些在启动时自动运行**，做下面这些： 

打开 /etc/rc.local 文件：

```
nano /etc/rc.local
```

在“exit 0”语句前添加如下内容：

```
screen -dm -S minecraft /opt/minecraft/startminecraft.sh
exit 0
```

保存并关闭文件。

要访问“我的世界”服务端控制台，只需运行下面的命令来重新连接 screen 会话：

```
screen -r minecraft
```

现在就是这样。祝贺你，玩的开心！你现在可以连接到你的“我的世界”服务端或配置/修改它了。

### 配置你的 Ubuntu 服务器

你首先肯定要设置并确保你的 Ubuntu 服务器安全，如果你还没有这么做的话。按照[我们之前提及的指南][24]并谷歌一下来获取更多信息。你需要在服务器上配置的有这些：

#### 开启并配置防火墙

首先，如果防火墙还没有开启的话，你应该先开启先前安装的 UFW：

```
ufw enable
```

你应该开放默认的“我的世界”服务端端口：

```
ufw allow 25565/tcp
```

你应该根据你的使用情况开放或拒绝其他规则。如果你不用服务器负载网站的话，就应该拒绝 80 和 443 端口。谷歌一下 Ubuntu 的 UFW/防火墙指南，你会得到建议的。设置防火墙的时候小心一些，如果你屏蔽了 SSH 端口的话你会把自己锁在服务器外面。

由于这是默认端口，这个端口经常被扫描以及攻击。你可以通过屏蔽白名单之外的访问权限来阻挡攻击。

首先，你需要在你的 [server.properties][25] 文件中开启白名单模式。要开启的话，打开文件：

```
nano /opt/minecraft/server.properties
```

并将“white-list”行改为“true”：

```
white-list=true
```

保存并关闭文件。

然后重启你的服务器（重启你的服务器或重新运行启动脚本）：

```
/opt/minecraft/startminecraft.sh
```

访问“我的世界”服务端控制台：

```
screen -r minecraft
```

如果你想要某人进入你的服务端，你需要通过以下命令把他们添加到白名单：

```
whitelist add PlayerUsername
```

运行以下命令来将他们移出白名单：

```
whitelist remove PlayerUsername
```

使用 CTRL + A-D 来退出 screen（服务器控制台）。值得注意的是，这会拒绝除白名单以外的所有人连接到服务端。

 [![how to create a minecraft server](https://thishosting.rocks/wp-content/uploads/2018/01/create-a-minecraft-server.jpg)][26] 

### 如何搭建“我的世界”服务器 - 常见问题

我们将解答一些有关“我的世界”服务器和我们的指南的常见问题。

#### 我该如何重启“我的世界”服务器？

如果你按照我们的教程来的话，包括开启了服务端随系统启动，你可以直接重启你的 Ubuntu 服务器。如果没有设置岁系统启动的话，你可以通过重新运行启动脚本来重启“我的世界”服务端：

```
/opt/minecraft/startminecraft.sh
```

#### 我该如何配置我的“我的世界”服务端？

你可以使用 [server.properties][27] 文件来配置你的服务端。查看“我的世界”维基来获取更多信息，你也可以什么都不动，它会工作的很好。

如果你想改变游戏模式、难度等诸如此类的东西，你可以使用服务端控制台。通过下面的命令访问服务端控制台：

```
screen -r minecraft
```

在这里执行[命令][28]。像下面这些命令：

```
difficulty hard
```

```
gamemode survival @a
```

你可能需要重新启动服务端，这取决于你使用了什么命令。你可以使用很多命令，查看[维基][29]来获取更多。

#### 我该如何升级我的“我的世界”服务端？

如果有新版本发布的话，你需要这样做：

进入”我的世界“目录：

```
cd /opt/minecraft
```

下载最新的版本，比如使用 wget 下载 1.12.3 版本：

```
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12.3/minecraft_server.1.12.3.jar
```

接下来，运行并构建新服务端：

```
java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.3.jar nogui
```

最后，更新你的启动脚本：

```
nano /opt/minecraft/startminecraft.sh
```

更新版本号数字：

```
#!/bin/bash
cd /opt/minecraft/ && java -Xms2048M -Xmx3472M -jar minecraft_server.1.12.3.jar nogui
```

现在你可以重启服务端了，一切都应该没有问题。

#### 为什么你们的教程这么长，而其他的只有 2 行那么长？！

我们想让这个教程对新手来说更友好，并且尽可能详细。我们还向你展示了了如何让服务端长期运行并跟随系统启动，我们向你展示了如何配置你的服务端以及所有的东西。我是说，你当然可以用几行来启动“我的世界”服务器，但那样的话绝对很烂，从不仅一方面说。

#### 我不知道 Linux 或者这里说的什么东西，我该如何搭建一个“我的世界”服务器呢？

只要通篇阅读我们的文章，复制粘贴几个命令就行了。如果你真的不知道该如何做的话，[我们可以帮你][30]，或者直接找一个[托管的][31]服务器[提供商][32]，让他们帮你做这些。

#### 我该如何在服务端上安装 mod 和插件？

我们的文章意图作一篇入门指南，你应该查看[“我的世界维基”][33]，或者谷歌一下来获取更多信息。网上有很多教程。

--------------------------------------------------------------------------------

via: https://thishosting.rocks/how-to-make-a-minecraft-server/

作者：[ThisHosting.Rocks][a]
译者：[heart4lor](https://github.com/heart4lor)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks
[1]:https://thishosting.rocks/how-to-make-a-minecraft-server/#reasons
[2]:https://thishosting.rocks/how-to-make-a-minecraft-server/#not-pc
[3]:https://thishosting.rocks/how-to-make-a-minecraft-server/#requirements
[4]:https://thishosting.rocks/how-to-make-a-minecraft-server/#make-minecraft-server
[5]:https://thishosting.rocks/how-to-make-a-minecraft-server/#persistent
[6]:https://thishosting.rocks/how-to-make-a-minecraft-server/#boot
[7]:https://thishosting.rocks/how-to-make-a-minecraft-server/#configure-minecraft-server
[8]:https://thishosting.rocks/how-to-make-a-minecraft-server/#faqs
[9]:https://thishosting.rocks/cheap-cloud-hosting-providers-comparison/
[10]:https://thishosting.rocks/go/vultr/
[11]:https://minecraft.gamepedia.com/Server/Requirements/Dedicated
[12]:https://thishosting.rocks/best-cheap-managed-vps/
[13]:https://www.chiark.greenend.org.uk/~sgtatham/putty/
[14]:https://mobaxterm.mobatek.net/
[15]:https://www.linode.com/docs/security/securing-your-server/
[16]:https://thishosting.rocks/go/vultr/
[17]:https://thishosting.rocks/go/vultr/
[18]:https://thishosting.rocks/ubuntu-18-04-new-features-release-date/
[19]:https://www.linode.com/docs/security/securing-your-server/
[20]:https://minecraft.net/en-us/download/server
[21]:https://minecraft.gamepedia.com/Commands
[22]:https://thishosting.rocks/go/vultr/
[23]:https://thishosting.rocks/how-to-make-a-minecraft-server/#configure-minecraft-server
[24]:https://www.linode.com/docs/security/securing-your-server/
[25]:https://minecraft.gamepedia.com/Server.properties
[26]:https://thishosting.rocks/wp-content/uploads/2018/01/create-a-minecraft-server.jpg
[27]:https://minecraft.gamepedia.com/Server.properties
[28]:https://minecraft.gamepedia.com/Commands
[29]:https://minecraft.gamepedia.com/Commands
[30]:https://thishosting.rocks/support/
[31]:https://thishosting.rocks/best-cheap-managed-vps/
[32]:https://thishosting.rocks/best-cheap-managed-vps/
[33]:https://minecraft.gamepedia.com/Minecraft_Wiki
