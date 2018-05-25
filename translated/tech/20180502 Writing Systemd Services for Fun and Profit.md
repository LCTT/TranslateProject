编写有趣且有价值的 Systemd 服务
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minetest.png?itok=Houi9zf9)

让我们假设你希望搭建一个游戏服务器，运行 [Minetest][1] 这款非常酷、开源的、以采集 & 合成为主题的沙盒游戏。你希望将游戏运行在位于客厅的服务器中，以便搭建完成后可供你的学校或朋友使用。考虑到内核邮件列表管理就是通过这种方式完成的，那么对你来说也是足够的。

但你很快发现每次开机之后需要启动服务器，每次关机之前需要安全地关闭服务器，十分繁琐和麻烦。

最初，你可能用守护进程的方式运行服务器：
```
minetest --server &

```
记住进程 PID 以便后续使用。

接着，你还需要通过邮件或短信的方式将服务器已经启动的信息告知你的朋友。然后你就可以开始游戏了。

转眼之间，已经凌晨三点，今天的战斗即将告一段落。但在你关闭主机、睡个好觉之前，还需要做一些操作。首先，你需要通知其它玩家服务器即将关闭，找到记录我们之前提到的 PID 的纸条，然后友好地关闭 Minetest 服务器。
```
kill -2 <PID>

```

因为直接关闭主机电源很可能导致文件损坏。下一步也是最后一步，关闭主机电源。

一定有方法能让事情变得更简单。

### 让 Systemd 服务拯救你

让我们从构建一个普通用户可以（手动）运行的 systemd 服务开始，然后再逐步增加内容。

不需要管理员权限即可运行的服务位于 _~/.config/systemd/user/_，故首先需要创建这个目录：
```
cd
mkdir -p ~/.config/systemd/user/

```
有很多类型的 systemd _units_ (曾经叫做 systemd 脚本)，包括 _timers_ 和 _paths_ 等，但我们这里关注的是 service 类型。在 _~/.config/systemd/user/_ 目录中创建 _minetest.service_ 文件，使用文本编辑器打开并输入如下内容：
```
# minetest.service

[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple
ExecStart= /usr/games/minetest --server

```

可以看到 units 中包含不同的段，其中 `[Unit]` 段主要为用户提供信息，给出 unit 的描述及如何获得更多相关文档。

脚本核心位于 `[Service]` 段，首先使用 `Type` 指令确定服务类型。服务[有多种类型][2]，下面给出两个示例。如果你运行的进程设置环境变量、调用另外一个进程（主进程）、退出运行，那么你应该使用的服务类型为 `forking`。如果你希望在你的 unit 对应进程结束运行前阻断其他 units 运行，那么你应该使用的服务类型为 `oneshot`。

但 Minetest 服务器的情形与上面两种都不同，你希望启动服务器并使其在后台持续运行；这种情况下应该使用 `simple` 类型。

下面来看 `ExecStart` 指令，它给出 systemd 需要运行的程序。在本例中，你希望在后台运行 `minetest` 服务器。如上所示，你可以在可执行程序后面添加参数，但不能将一系列 Bash 命令通过管道连接起来。下面给出的例子无法工作：
```
ExecStart: lsmod | grep nvidia > videodrive.txt

```

如果你需要将 Bash 命令通过管道连接起来，可以将其封装到一个脚本中，然后运行该脚本。

还需要注意一点，systemd 要求你给出程序的完整路径。故如果你想使用 `simeple` 类型运行类似 _ls_ 的命令，你需要使用 `ExecStart= /bin/ls`。

另外还有 `ExecStop` 指令用于定制服务终止的方式。我们会在第二部分讨论这个指令，但你要了解，如果你没有指定 `ExecStop`，systemd 会帮你尽可能友好地终止进程。

_systemd.directives_ 的帮助页中包含完整指令列表，另外你可以在[网站][3]上找到同样的列表，点击即可查看每个指令的具体信息。

虽然只有 6 行，但你的 _minetest.service_ 已经是一个有完整功能的 systemd unit。执行如下命令启动服务：
```
systemd --user start minetest

```

执行如下命令终止服务
```
systemd --user stop minetest

```

选项 `--user` 告知 systemd 在你的本地目录中检索服务并用你的用户权限执行服务。

我们的服务器管理故事到此完成了第一部分。在第二部分，我们将在启动和终止服务的基础上，学习如何给用户发邮件、告知用户服务器的可用性。敬请期待。

可以通过 Linux 基金会和 edX 的免费课程 [Linux 入门][4]学习更多 Linux 知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/5/writing-systemd-services-fun-and-profit

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.minetest.net/
[2]:http://man7.org/linux/man-pages/man5/systemd.service.5.html
[3]:http://man7.org/linux/man-pages/man7/systemd.directives.7.html
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
