如何定制 SSH 来简化远程访问
===================

SSH （指 SSH 客户端）是一个用于访问远程主机的程序，它使得用户能够 [在远程主机上执行命令][2]。这是在登录远程主机中的最受推崇的方法之一，因为其设计目的就是在非安全网络环境上为两台非受信主机的通信提供安全加密。

SSH 使用系统全局以及用户指定（用户自定义）的配置文件。在本文中，我们将介绍如何创建一个自定义的 ssh 配置文件，并且通过特定的选项来连接到远程主机。

### 先决条件：

1. 你必须 [在你的桌面 Linux 上安装好 OpenSSH 客户端][1]。
2. 了解通过 ssh 进行远程连接的常用选项。

### SSH 客户端配置文件

以下为 ssh 客户端配置文件：

1. `/etc/ssh/ssh_config` 为默认的配置文件，属于系统全局配置文件，包含应用到所有用户的 ssh 客户端的设置。
2. `~/.ssh/config` 或者 `$HOME/.ssh/config` 为用户指定/自定义配置文件，这个文件中的配置只对指定的用户有效，因此，它会覆盖掉默认的系统全局配置文件中的设置。这也是我们要创建和使用的文件。

默认情况下，用户是通过在 ssh 中输入密码来获取验证的，你可以以一个简单的步骤来 [使用 Keygen 来设置 ssh 无密码登录][3]。

注：如果你的系统上不存在 `~/.ssh` 目录，那就手动创建它，并设置如下权限：

```
$ mkdir -p ~/.ssh
$ chmod 0700 ~/.ssh   
```

以上的 `chmod` 命令表明，只有目录属主对该目录有读取、写入和执行权限，这也是 ssh 所要求的设置。

### 如何创建用户指定的 SSH 配置文件

该文件并不会被默认创建的，所以你需要使用具有读取/写入权限的用户来创建它。

```
$ touch ~/.ssh/config
$ chmod 0700 ~/.ssh/config
```

上述文件包含由特定主机定义的各个部分，并且每个部分只应用到主机定义中相匹配的部分。

`~/.ssh/config` 文件的常见格式如下，其中所有的空行和以 `‘#’` 开头的行为注释：

```
Host  host1
ssh_option1=value1
ssh_option2=value1 value2
ssh_option3=value1
Host  host2
ssh_option1=value1
ssh_option2=value1 value2
Host  *
ssh_option1=value1
ssh_option2=value1 value2
```

如上格式详解：

1. `Host host1` 为关于 host1 的头部定义，主机相关的设置就从此处开始，直到下一个头部定义 `Host host2` 出现，这样形成一个完整的定义。
2. host1 和 host2 是在命令行中使用的主机别名，并非实际的远程主机名。
3. 其中，如 ssh_option1=value1、ssh_option2=value1 value2 等配置选项将应用到相匹配的主机，可以缩进以看起来更整齐些。
4. 对于 ssh_option2=value1 value2 这样的选项，ssh 执行时会按照顺序优先使用 value1 的值。
5. 头部定义 `Host *` (其中 `*` 为匹配模式/通配符，匹配零个或多个字符) 会匹配零个或者多个主机。

仍旧以上述的格式为例，ssh 也是也这样的形式类读取配置文件的。如果你执行 ssh 命令来访问远程主机 host1，如下：

```
$ ssh host1
```

以上 ssh 命令会进行一下动作：

1. 匹配配置文件中主机别名 host1，并使用头部定义中的各个设置项。
2. 继续匹配下一个主机定义，然后发现命令行中提供的主机名没有匹配的了，所以接下来的各个设置项会被略过。
3. 最后执行到最后一个主机定义 `Host *`， 这会匹配所有的主机。这里，会将接下来的所有设置选项应用到所有的主机连接中。但是它不会覆写之前已经有主机定义的那些选项。
4. ssh host2 与此类似。

### 如何使用用户指定的 shh 配置文件

在你理解了 ssh 客户端配置文件的工作方式之后，你可以通过如下方式来创建它。记得使用你的服务器环境中对应的选项、值 (主机别名、端口号、用户名等)。

通过你最喜欢的编辑器来打开配置文件：

```
$ vi ~/.ssh/config
```

并定义必要的部分：

```
Host fedora25
HostName 192.168.56.15
Port 22
ForwardX11 no
Host centos7
HostName 192.168.56.10
Port 22
ForwardX11 no
Host ubuntu
HostName 192.168.56.5
Port 2222
ForwardX11 yes
Host *
User tecmint
IdentityFile ~/.ssh/id_rsa
Protocol 2
Compression yes
ServerAliveInterval 60
ServerAliveCountMax 20
LogLevel INFO
```

以上 ssh 配置文件的详细解释：

1. `HostName` - 定义真正要登录的主机名，此外，你也可以使用数字 IP 地址，不管是在命令行或是 HostName 定义中都允许使用其中任一种。
2. `User` – 指定以哪一个用户来登录。
3. `Port` – 设置连接远程主机的端口，默认是 22 端口。但必须是远程主机的 sshd 配置文件中定义的端口号。
4. `Protocol` – 这个选项定义了优先使用 ssh 支持的协议版本。常用的值为 ‘1’ 和 ‘2’，同时使用两个协议版本则必须使用英文逗号隔开。
5. `IdentityFile` – 指定一个用于读取用户 DSA、Ed25519、ECDSA 等授权验证信息的文件。
6. `ForwardX11` – 定义 X11 连接是否自动重定向到安全通道和 DISPLAY 设置。有两个可以设置的值，即 `yes` 或 `no`。
7. `Compression` – 默认值为 `no`，如果设置为 `yes`，则在连接远程主机过程中使用压缩进行传输。
8. `ServerAliveInterval` – 设置当没有收到服务器响应 （或者数据)）时的超时时间，单位为秒，ssh 会通过加密信道发送信息，请求服务器响应。默认值为 `0`，这意味着 ssh 不会向服务器发送响应请求；如果定义了 BatchMode 选项，则默认是 300 秒。
9. `ServerAliveCountMax` – 设置服务器在没有接收到服务器的任何响应时，由服务器发送的活动信息数量。
10. `LogLevel` – 定义 ssh 登录信息的的日志冗余级别。允许的值为：`QUIET`、`FATAL`、`ERROR`、`INFO`、`VERBOSE`、`DEBUG`、`DEBUG1`、`DEBUG2` 和 `DEBUG3`，默认为 `INFO`。

连接任意远程主机的标准方法是在上述两个文件中定义第二个部分（我连接的是 CentOS 7）。一般情况下，我们这样输入命令：

```
$ ssh -i ~/.ssh/id_rsa -p 22 tecmint@192.168.56.10
```

然而，使用了 ssh 客户端配置文件之后，我们还可以这样：

```
$ ssh centos7
```

你也可以在 man 帮助页面寻找更多的设置选项和使用实例：

```
$man ssh_config
```

至此，文毕。我们在文中向你介绍了在 Linux 中如何使用用户指定 (自定义) 的 ssh 客户端配置文件。通过下方的反馈表单来写一些与本文的相关的想法吧。

------------------------------------------------

作者简介：

Aaron Kili 是一名 Linux 和 F.O.S.S 忠实拥护者、高级 Linux 系统管理员、Web 开发者，目前在 TecMint 是一名活跃的博主，热衷于计算机并有着强烈的只是分享意愿。

-------------------------------------------------

译者简介：

[GHLandy](http://GHLandy.com) —— 生活中所有欢乐与苦闷都应藏在心中，有些事儿注定无人知晓，自己也无从说起。

-------------------------------------------------

via: http://www.tecmint.com/configure-custom-ssh-connection-in-linux/

作者：[Aaron Kili][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-openssh-server-in-linux/
[2]:http://www.tecmint.com/execute-commands-on-multiple-linux-servers-using-pssh/
[3]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
