  如何在 Linux 和 Windows 之间共享文件？
=====

![](https://images.idgesg.net/images/article/2018/04/cats-eating-100755724-large.jpg)
现代很多人都在混合网络上工作，Linux 和 Windows 系统都扮演着重要的结束。在两者之间共享文件有时是非常关键的，并且使用正确的工具非常容易。只需很少的功夫，你就可以将文件从 Windows 复制到 Linux 或从 Linux 到 Windows。在这篇文章中，我们将讨论配置 Linux 和 Windows 系统所需的东西，以允许你轻松地将文件从一个操作系统转移到另一个。

### 在 Linux 和 Windows 之间复制文件

在 Windows 和 Linux 之间移动文件的第一步是下载并安装诸如 PuTTY 的 pscp 之类的工具。你可以从 [putty.org][1] 获得它，并轻松将其设置在 Windows 系统上。PuTTY 带有一个终端仿真器（putty）以及像 **pscp** 这样的工具，用于在 Linux 和 Windows 系统之间安全地复制文件。当你进入 PuTTY 站点时，你可以选择安装所有工具，或选择安装你想要的工具，也可以选择单个 .exe 文件。

你还需要在你的 Linux 系统上设置并运行 ssh-server。这允许它支持客户端（Windows 端）连接请求。如果你还没有安装 ssh 服务器，那么以下步骤可以在 Debian 系统上运行（包括 Ubuntu 等）：
```
sudo apt update
sudo apt install ssh-server
sudo service ssh start

```

对于 Red Hat 及其相关的 Linux 系统，使用类似的命令：
```
sudo yum install openssh-server
sudo systemctl start sshd

```
注意，如果你正在运行防火墙（例如 ufw），则可能需要打开 22 端口以允许连接。

使用 **pscp** 命令，你可以将文件从 Windows 移到 Linux，反之亦然。它的 “copy from to” 命令的语法非常简单。

#### 从 Windows 到 Linux

在下面显示的命令中，我们将 Windows 系统上用户账户中的文件复制到 Linux 系统下的 /tmp 目录。
```
C:\Program Files\PuTTY>pscp \Users\shs\copy_me.txt shs@192.168.0.18:/tmp
shs@192.168.0.18's password:
copy_me.txt | 0 kB | 0.1 kB/s | ETA: 00:00:00 | 100%

```

#### 从 Linux 到 Windows

将文件从 Linux 转移到 Windows 也同样简单。只要反向参数即可。
```
C:\Program Files\PuTTY>pscp shs@192.168.0.18:/tmp/copy_me.txt \Users\shs
shs@192.168.0.18's password:
copy_me.txt | 0 kB | 0.1 kB/s | ETA: 00:00:00 | 100%

```

如果 1) pscp 位于 Windows 搜索路径中，并且 2) 你的 Linux 系统在 Windows hosts 文件中，则该过程可以变得更加顺畅和轻松。（to 校正者：这句话不怎么明白）

#### Windows 搜索路径

如果你使用 PuTTY 安装程序安装 PuTTY 工具，你可能会发现 **C:\Program files\PuTTY** 位于 Windows 搜索路径中。你可以通过在 Windows 命令提示符下键入 **echo %path%** 来检查是否属于这种情况（在搜索栏中键入 “cmd” 来打开命令提示符）。如果是这样，你不需要关心文件系统中相对于 pscp 可执行文件的位置。进入到包含你想要移动文件的文件夹可能会更容易。
```
C:\Users\shs>pscp copy_me.txt shs@192.168.0.18:/tmp
shs@192.168.0.18's password:
copy_me.txt | 0 kB | 0.1 kB/s | ETA: 00:00:00 | 100%

```

#### 更新你的 Windows hosts 文件

这是另一个小修补。使用管理员权限，你可以将 Linux 系统添加到 Windows hosts 文件（C:\Windows\System32\drivers\etc\hosts），然后使用其主机名代替其 IP 地址。请记住，如果你的 Linux 系统的 IP 地址是动态分配的，那么它不会一直发挥作用。
```
C:\Users\shs>pscp copy_me.txt shs@stinkbug:/tmp
shs@192.168.0.18's password:
hosts | 0 kB | 0.8 kB/s | ETA: 00:00:00 | 100%

```

请注意，Windows hosts 文件与 Linux 系统上的 /etc/hosts 文件格式相同 -- IP 地址，空格，主机名。注释以 pound（to 校正者：这个符号是英镑符？？） 符号来表示的。
```
# Linux systems
192.168.0.18        stinkbug

```

#### 讨厌的行结尾符

请记住，Windows 上文本文件中的行以回车符和换行符结束。pscp 工具不会删除回车符，使文件看起来像 Linux 文本文件。相反，它只是完整地复制文件。你可以考虑安装 **tofrodos** 包，这使你能够在 Linux 系统上使用 **fromdos** 和 **todos** 命令来调整在平台之间移动的文件。

### 在 Windows 和 Linux 之间共享文件夹

共享文件夹是完全不同的操作。你最终将 Windows 文件夹挂载到你的 Linux 系统或将 Linux 文件夹挂载到 Windows 文件夹中，以便两个系统可以使用同一组文件，而不是将文件从一个系统复制到另一个系统。最好的工具之一就是 Samba，它模拟 Windows 协议并在 Linux 系统上运行。

一旦安装了 Samba，你将能够将 Linux 文件夹挂载到 Windows 上或将 Windows 文件夹挂载到 Linux 上。当然，这与本文前面描述的复制文件有很大的不同。相反，这两个系统中的每一个都可以同时访问相同的文件。

关于选择在 Linux 和 Windows 系统之间共享文件的正确工具的更多提示可以在[这里][2]找到。

在 [Facebook][3] 和 [LinkedIn][4] 上加入网络世界社区，对最重要的话题发表评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3269189/linux/sharing-files-between-linux-and-windows.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.putty.org
[2]:https://www.infoworld.com/article/2617683/linux/linux-moving-files-between-unix-and-windows-systems.html
[3]:https://www.facebook.com/NetworkWorld/
[4]:https://www.linkedin.com/company/network-world
