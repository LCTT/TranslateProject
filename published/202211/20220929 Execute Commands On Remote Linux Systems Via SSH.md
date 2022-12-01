[#]: subject: "Execute Commands On Remote Linux Systems Via SSH"
[#]: via: "https://ostechnix.com/execute-commands-on-remote-linux-systems-via-ssh/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15263-1.html"

通过 SSH 在远程 Linux 系统上执行命令
======

![](https://img.linux.net.cn/data/attachment/album/202211/17/163910g9u42ssfcuk9c290.jpg)

> 通过安全的网络连接在远程计算机上调用命令或程序。

有一天，我正在测试如何在 [将文件或目录复制到多个位置和系统时保持完整的文件权限][1]。当我想检查远程系统上的文件权限时，我必须通过 SSH 登录它并检查属性。从远程系统多次登录和注销的过程让我有点烦，我想，如果我可以**在远程 Linux 系统上通过 SSH 执行命令**就好了。

幸运的是，在浏览了 `ssh` 命令的手册页后，我找到了一个解决办法。

如果你想知道如何本地运行远程系统上运行命令或脚本，而不登录到远程系统，下面的内容会告诉你如何做。

### 1、通过 SSH 在远程 Linux 系统上执行命令

从本地系统通过 SSH 在远程系统上运行命令或脚本的典型方法是：

```
$ ssh <username@IP_Address-or-Doman_name> <Command-or-Script>
```

允许我给你们举几个例子：

#### 1.1、通过 SSH 在远程系统上运行单个命令

假设你想要 [查找远程 Linux 系统的内核详细信息][2]。为此，只需运行：

```
$ ssh sk@192.168.225.22 uname -a
```

这里，

* `sk` 是远程系统的用户名，
* `192.168.225.22` 是远程系统的 IP 地址，
* `uname -a` 是我想在远程系统上运行的命令。

示例输出：

![通过 SSH 在远程 Linux 系统上执行命令][3]

看到没？我并没有实际登录到远程系统，但通过 SSH 在远程系统上执行了 `uname` 命令，并在本地系统的终端上显示了输出。

你还可以像下面这样用引号指定命令。

```
$ ssh sk@192.168.225.22 "uname -a"
```

或者，

```
$ ssh sk@192.168.225.22 'uname -a'
```

如果你已经 [更改了 SSH 协议的默认端口][4]，只需使用 `-p` 参数指定它。

```
$ ssh -p 2200 sk@192.168.225.22 uname -a
```

#### 1.2、通过 SSH 在远程主机上执行多个命令

你还可以在远程主机上运行多个命令，方法是将它们放在引号中。

```
$ ssh sk@192.168.225.22 "uname -r && lsb_release -a"
```

或者：

```
$ ssh sk@192.168.225.22 "uname -r ; lsb_release -a"
```

上面的命令将显示我的 Ubuntu 服务器的内核版本和发行版详细信息。

示例输出：

![在 Linux 上通过 SSH 在远程主机上运行多个命令][5]

正如一位读者在下面的评论部分提到的那样，你应该用引号指定多个命令。如果不使用引号，第一个命令将在远程系统上执行，第二个命令将仅在本地计算机上执行。整个带引号的命令将按预期在远程计算机上运行。

> **提示：** 了解 `&&` 和 `;` 在命令中的区别：
>
> `&&` 操作符只有在第一个命令成功时才执行第二个命令。
>
> 示例：
>
> ```
> sudo apt-get update && sudo apt-get upgrade
> ```
>
> 在上述示例中，如果第一个命令成功，才会执行 `sudo apt-get upgrade`。否则，它将不会运行。
>
> `;` 操作符会执行第二个命令，无论第一个命令是成功还是失败。
>
> 示例：
>
> ```
> sudo apt-get update ; sudo apt-get upgrade
> ```
>
> 在上述示例中，即使第一个命令失败，`sudo apt-get upgrade` 也会执行。

#### 1.3、通过 SSH 在远程机器上调用有 sudo 权限的命令

有些命令需要 `sudo` 权限才能运行。例如，以下命令将在我的远程系统上安装 `apache2`。

```
$ ssh -t sk@192.168.225.22 sudo apt install apache2
```

示例输出：

![通过 SSH 在远程机器上运行有 Sudo 权限的命令][6]

注意到了吗？我在上面的命令中使用了 `-t` 标志，我们需要使用它来强制进行伪终端分配。它用于在远程机器上执行任意基于屏幕的程序，这非常有用。例如，在实现菜单服务时。

另外，我输入了**两次**密码。第一次是远程用户的密码，以便从本地系统通过 SSH 访问远程系统，第二次是为了向远程用户赋予 sudo 权限，以便安装应用程序（在本例中为 apache2）。

让我们用以下命令检查 Apache 服务是否正在运行：

```
$ ssh -t sk@192.168.225.22 sudo systemctl status apache2
sk@192.168.225.22's password: 
[sudo] password for sk: 
● apache2.service - The Apache HTTP Server
Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
Drop-In: /lib/systemd/system/apache2.service.d
└─apache2-systemd.conf
Active: active (running) since Thu 2019-12-19 11:08:03 UTC; 52s ago
Main PID: 5251 (apache2)
Tasks: 55 (limit: 2318)
CGroup: /system.slice/apache2.service
├─5251 /usr/sbin/apache2 -k start
├─5253 /usr/sbin/apache2 -k start
└─5254 /usr/sbin/apache2 -k start

Dec 19 11:08:03 ubuntuserver systemd[1]: Starting The Apache HTTP Server...
Dec 19 11:08:03 ubuntuserver apachectl[5227]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 2409:4072:51f:a1b6:a00:27ff:f
Dec 19 11:08:03 ubuntuserver systemd[1]: Started The Apache HTTP Server.
```

同样的，我们可以通过 SSH 在本地系统上运行远程系统上的任何命令或脚本。

#### 1.4、通过 SSH 在远程系统上运行本地脚本

让我们在本地系统上创建一个简单的脚本来显示关于远程系统的发行版名称、包管理和基本细节等。

```
$ vi system_information.sh
```

添加以下行：

```
#!/bin/bash
#Name: Display System Details
#Owner: OSTechNIx
#----------------------------
echo /etc/*_ver* /etc/*-rel*; cat /etc/*_ver* /etc/*-rel*
```

按下 `ESC` 键，输入 `:wq` 保存退出。

现在，通过 SSH 命令在远程系统上运行这个脚本：

```
$ ssh sk@192.168.225.22 'bash -s' < system_information.sh
```

示例输出：

```
sk@192.168.225.22's password: 
/etc/debian_version /etc/lsb-release /etc/os-release
buster/sid
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```

如果你没有在上面的命令中指定 `bash -s`，你将获得远程系统的详细信息，但伪终端不会被分配。

#### 1.5、将远程主机的命令输出保存到本地主机

如果你希望与支持团队或同事共享远程系统上运行的命令输出，那么这非常有用。

以下命令将通过 SSH 在远程系统运行 `du -ah`，并将输出保存在本地系统的 `diskusage.txt` 文件中。

```
$ ssh sk@192.168.225.22 du -ah > diskusage.txt
```

然后，你可以通过使用 `cat` 命令或文本编辑器查看 `diskusage.txt` 文件来分析磁盘使用细节。

```
$ cat diskusage.txt 
4.0K ./.profile
4.0K ./.gnupg/private-keys-v1.d
8.0K ./.gnupg
76K ./data/image.jpg
128K ./data/file.pdf
20K ./data/text.docx
5.9M ./data/audio.mp3
6.1M ./data
0 ./.sudo_as_admin_successful
4.0K ./pacman?inline=false
4.0K ./.bash_logout
4.0K ./.wget-hsts
4.0K ./.bash_history
0 ./.cache/motd.legal-displayed
4.0K ./.cache
4.0K ./deb-pacman_1.0-0.deb
4.0K ./.bashrc
6.2M .
```

#### 1.6、配置 SSH 密钥认证，避免输入密码

如果你经常在远程系统上运行命令，你可能需要配置基于 SSH 密钥的身份验证，以便每次跳过密码输入。更多细节可以在以下链接中找到。

> **[Linux 系统下如何配置 SSH 密钥认证][7]**

配置了基于 SSH 密钥的认证后，我们可以通过 SSH 在远程机器上执行命令，从而不需要输入密码：

```
$ ssh sk@192.168.225.22 sudo apt update
```

### 2、通过 sshpass 在远程机器上运行命令

如果你不想配置基于 SSH 密钥的身份验证，你可以使用 `sshpass` 实用程序。

#### 2.1、什么是 sshpass?

`sshpass` 是为使用键盘交互密码身份验证模式运行 ssh 而设计的，但它以非交互的方式。简单来说，`sshpass` 提供了非交互式的方式来验证 SSH 会话。

SSH 使用直接 TTY 访问来确保密码确实是由交互式键盘用户发出的。`sshpass` 在一个专用 tty 中运行 SSH，让它误以为从交互用户那里获得了密码。

#### 2.2、在 Linux 中安装 sshpass

在许多 Linux 发行版的默认仓库中都有 `sshpass` 实用程序。例如，在 Debian、Ubuntu 及其衍生版本中，你可以使用下面的命令来安装 `sshpass`：

```
$ sudo apt install sshpass
```

#### 2.3、通过 SSH 和 sshpass 在远程机器上执行命令

`sshpass` 可以通过参数接受密码，或者通过环境变量读取密码，也可以从文本文件中读取密码。

**警告：** 所有这些方法都是 **高度不安全的**。所有系统用户都可以通过 `ps` 命令看到命令中的密码。**不建议**在生产中使用这些方法。最好使用基于密钥的身份验证。

让我们看看每种方法的示例。

##### 将密码作为参数提供

将密码作为参数提供，使用 `-p` 选项，如下所示：

```
$ sshpass -p <remote-password> ssh remoteuser@ip-address <command-to-execute>
```

示例输出：

```
$ sshpass -p ubuntu ssh ostechnix@192.168.1.30 uname -a
```

其中，

* `-p ubuntu` - 提供远程系统的密码。
* `ostechnix@192.168.1.30` - 远程系统用户名和地址。
* `uname -a` - 要在远程计算机上执行的命令。

示例输出：

```
Linux Ubuntu22CT 5.15.60-1-pve #1 SMP PVE 5.15.60-1 (Mon, 19 Sep 2022 17:53:17 +0200) x86_64 x86_64 x86_64 GNU/Linux
```

##### 密码作为环境变量提供

在这个方法中，我们声明一个名为 `SSHPASS` 的环境变量，用远程环境的密码作为其值。然后我们使用 `-e` 标志，如下所示：

```
$ SSHPASS=ubuntu sshpass -e ssh ostechnix@192.168.1.30 uname -a
```

##### 从文本文件中读取密码

使用 `echo` 命令在文本文件中追加密码：

```
$ echo "ubuntu" > mypassword.txt
```

现在，将密码文件传递给带有 `-f` 标志的 `sshpass`，如下所示：

```
$ sshpass -f mypassword.txt ssh ostechnix@192.168.1.30 uname -a
```

![通过 SSH 和 sshpass 在远程机器上执行命令][8]

### 总结

在本教程中，我们学习了一些通过安全的网络连接在远程计算机上调用命令或程序的方法。在所有的方法中，`sshpass` 方法是最不安全的，建议用户避免在生产系统中使用它。

--------------------------------------------------------------------------------

via: https://ostechnix.com/execute-commands-on-remote-linux-systems-via-ssh/

作者：[sk][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-keep-ownership-and-file-permissions-intact-when-copying-files-or-directories/
[2]: https://ostechnix.com/find-out-the-linux-distribution-name-version-and-kernel-details/
[3]: https://ostechnix.com/wp-content/uploads/2019/12/Execute-Commands-On-Remote-Linux-Systems-Via-SSH.gif
[4]: https://ostechnix.com/how-to-change-apache-ftp-and-ssh-default-port-to-a-custom-port-part-3/
[5]: https://ostechnix.com/wp-content/uploads/2019/12/Run-multiple-commands-on-remote-systems-via-SSH-on-Linux.png
[6]: https://ostechnix.com/wp-content/uploads/2019/12/Run-commands-with-sudo-privileges-on-remote-systems-via-SSH.png
[7]: https://ostechnix.com/configure-ssh-key-based-authentication-linux/
[8]: https://ostechnix.com/wp-content/uploads/2022/09/Execute-Commands-On-Remote-Machines-Over-SSH-With-sshpass.png
