tmate：秒级分享你的终端会话
=================

不久前，我们写过一篇关于 [teleconsole](https://www.2daygeek.com/teleconsole-share-terminal-session-instantly-to-anyone-in-seconds/) 的介绍，该工具可用于快速分享终端给任何人（任何你信任的人）。今天我们要聊一聊另一款类似的应用，名叫 `tmate`。

`tmate` 有什么用？它可以让你在需要帮助时向你的朋友们求助。

### 什么是 tmate？

[tmate](https://tmate.io/) 的意思是 `teammates`，它是 tmux 的一个分支，并且使用相同的配置信息（例如快捷键配置，配色方案等）。它是一个终端多路复用器，同时具有即时分享终端的能力。它允许在单个屏幕中创建并操控多个终端，同时这些终端还能与其他同事分享。

你可以分离会话，让作业在后台运行，然后在想要查看状态时重新连接会话。`tmate` 提供了一个即时配对的方案，让你可以与一个或多个队友共享一个终端。

在屏幕的地步有一个状态栏，显示了当前会话的一些诸如 ssh 命令之类的共享信息。

### tmate 是怎么工作的？

-   运行 `tmate` 时，会通过 `libssh` 在后台创建一个连接到 tmate.io （由 tmate 开发者维护的后台服务器）的 ssh 连接。
-   tmate.io 服务器的 ssh 密钥通过 DH 交换进行校验。
-   客户端通过本地 ssh 密钥进行认证。
-   连接创建后，本地 tmux 服务器会生成一个 150 位(不可猜测的随机字符)会话令牌。
-   队友能通过用户提供的 SSH 会话 ID 连接到 tmate.io。

### 使用 tmate 的必备条件

由于 `tmate.io` 服务器需要通过本地 ssh 密钥来认证客户机，因此其中一个必备条件就是生成 SSH 密钥 key。
记住，每个系统都要有自己的 SSH 密钥。

```shell
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/magi/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/magi/.ssh/id_rsa.
Your public key has been saved in /home/magi/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:3ima5FuwKbWyyyNrlR/DeBucoyRfdOtlUmb5D214NC8 magi@magi-VirtualBox
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|                 |
|           .     |
|      . . =   o  |
|     *ooS= . + o |
|  . =.@*o.o.+ E .|
|   =o==B++o  = . |
|  o.+*o+..    .  |
| ..o+o=.         |
+----[SHA256]-----+
```

### 如何安装 tmate

`tmate` 已经包含在某些发行版的官方仓库中，可以通过包管理器来安装。

对于 Debian/Ubuntu，可以使用 [APT-GET 命令](https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/)或者 [APT 命令](https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/)to 来安装。

```shell
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:tmate.io/archive
$ sudo apt-get update
$ sudo apt-get install tmate
```

你也可以从官方仓库中安装 tmate。

```shell
$ sudo apt-get install tmate
```

对于 Fedora，使用 [DNF 命令](https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/) 来安装。

```shell
$ sudo dnf install tmate
```

对于基于 Arch Linux 的系统，使用 []()[Yaourt 命令](https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/)或 []()[Packer 命令](https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/) 来从 AUR 仓库中安装。

```shell
$ yaourt -S tmate
```
或

```shell
$ packer -S tmate
```

对于 openSUSE，使用 [Zypper 命令](https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/) 来安装。

```shell
$ sudo zypper in tmate
```

### 如何使用 tmate

成功安装后，打开终端然后输入下面命令，就会打开一个新的会话，在屏幕底部，你能看到 SSH 会话的 ID。

```shell
$ tmate
```

![](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-1.png)

要注意的是，SSH 会话 ID 会在几秒后消失，不过不要紧，你可以通过下面命令获取到这些详细信息。

```shell
$ tmate show-messages
```

`tmate` 的 `show-messages` 命令会显示 tmate 的日志信息，其中包含了该 ssh 连接内容。

![](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-2.png)

现在，分享你的 SSH 会话 ID 给你的朋友或同事从而允许他们观看终端会话。除了 SSH 会话 ID 以外，你也可以分享 web URL。

另外你还可以选择分享的是只读会话还是可读写会话。

### 如何通过 SSH 连接会话

只需要在终端上运行你从朋友那得到的 SSH 终端 ID 就行了。类似下面这样。

```shell
$ ssh session: ssh 3KuRj95sEZRHkpPtc2y6jcokP@sg2.tmate.io
```

![](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-4.png)

### 如何通过 Web URL 连接会话

打开浏览器然后访问朋友给你的 URL 就行了。像下面这样。

![](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-3.png)


只需要输入 `exit` 就能退出会话了。

```
[Source System Output]
[exited]

[Remote System Output]
[server exited]
Connection to sg2.tmate.io closed by remote host。
Connection to sg2.tmate.io closed。
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds/

作者：[Magesh Maruthamuthu][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

