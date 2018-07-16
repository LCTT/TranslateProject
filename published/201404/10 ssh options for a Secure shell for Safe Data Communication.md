10个 ssh 简单命令选项
================================================================================
一个系统管理员可能会同时管理着多台服务器，这些服务器也许会放在不同的地方。要亲自一台一台的去访问来管理它们显然不是最好的方法，通过远程控制的方法应该是最有效的。远程访问最通用的一款应用程序就是 **SSH**（什么？你还用telnet？....$%@%&W@$##）。

### SSH 是什么 ###

**SSH（全称 Secure Shell)**是一种加密的网络协议。使用该协议的数据将被加密，如果在传输中间数据泄漏，也可以确保没有人能读取出有用信息。要使用 SSH，目标机器应该安装 SSH 服务端应用程序，因为 **SSH 是基于客户-服务模式的。** 当你想安全的远程连接到主机，可中间的网络（比如因特网）并不安全，通常这种情况下就会使用 SSH。

### 安装 SSH ###

的 Linux 系统默认已经安装了 SSH。如果碰巧你的机器没装（译注：我能吐槽么？没有不装ssh的Linux服务器吧，不过，大家要记得升级你的ssh服务器），我们可以手工来安装一下。最简单的方式就是使用 Linux 包管理器。

### 基于 Debian / Ubuntu 的系统 : ###

#### 安装 ssh-client ####

    $ sudo apt-get install openssh-client

#### 安装 ssh-server ####

    $ sudo apt-get install openssh-server

### 基于 RedHat / CentOS 的系统 : ###

    # yum install openssh-server openssh-clients

SSH 一旦安装上，我们就可以在终端下输入 **ssh** 来检查下安装的是否正常。

![An ssh client](http://linoxide.com/wp-content/uploads/2014/02/ssh_client.png)

### 使用 SSH ###

提供了许多可使用的选项。这篇文章会介绍一些我们在日常操作中经常使用的选项。

#### 1. 无选项参数运行 SSH ####

通常使用 SSH 的方式就是不加任何选项参数,仅仅输入 "**ssh**"。下面是示例：

    $ ssh 192.168.0.103

![SSH connecti confirmation](http://linoxide.com/wp-content/uploads/2014/02/ssh_ask_connect.png)

第一次连接目标主机时，ssh 会让你确认目标主机的真实性。如果你回答的是 **NO**，SSH 将不会继续连接，只有回答 **Yes** 才会继续（译注：会加入RSA key的指纹作为记录，如果下次连接发现指纹变化，会提示你）。

![Connecting to SSH](http://linoxide.com/wp-content/uploads/2014/02/ssh_connect.png)

下一次再登陆此主机时，SSH 就不会提示确认消息了。对此主机的真实验证信息已经默认保存在每个用户的 /home/user/.ssh 文件里。

#### 2. 指定登陆用户 ####

默认的，ssh 会尝试用当前用户作为用户名来连接。在上面的示例命令中，ssh 会尝试用用户名叫 pungki 的用户身份来登入服务器，这是因为用户 pungki 正在客户机上使用 ssh 客户端软件。 

假如目标主机上没有叫 pungki 的用户呢？这时你就必须提供一个目标主机上存在的用户名。从一开始就要指定用户名的，可以使用 -l 选项参数。

    $ ssh -l leni 192.168.0.103

![Ssh using -l option](http://linoxide.com/wp-content/uploads/2014/02/ssh_l.png)

我们也可以这样输入：

    $ ssh leni@192.168.0.0103

![Another way to supply username](http://linoxide.com/wp-content/uploads/2014/02/ssh_l_2.png)

#### 3. 指定端口 ####

**SSH 默认使用的端口号是 22。**大多现代的 Linux 系统 22 端口都是开放的。如果你运行 ssh 程序而没有指定端口号，它直接就是通过 22 端口发送请求的。

一些系统管理员会改变 SSH 的默认端口号。让我们试试，现在端口号是 1234.要连上那主机，就要使用 ***-p** 选项，后面在加上 SSH 端口号。

    $ ssh 192.168.0.103 -p 1234

要改变端口号，我们需要修改 **/etc/ssh/ssh_config** 文件，找到此行：

    Port 22

把它换成其他的端口号，比如上面示例的 1234 端口，然后重启 SSH 服务。

#### 4.对所有数据请求压缩 ####

有了这个选项，所有通过 SSH 发送或接收的数据将会被压缩，并且任然是加密的。要使用 SSH 的压缩功能，使用 **-C** 选项。

    $ ssh -C 192.168.0.103

如果你的连网速度很慢的话，比如用 modem 上网，这个选项非常有用。但如果你使用的是像 LAN 或其它更高级网络的话，压缩反而会降低你的传输速度。可以使用 **-o** 选项加上**压缩级别参数**来控制压缩的级别，但这个选项仅仅只在 SSH-1 下起作用。

#### 5. 指定一个加密算法 ####

SSH 提供了一些可用的加密算法。可以在 **/etc/ssh/ssh_config or ~/.ssh/config ** 文件中看到（如果存在的话）。

![SSH cipher configuration example](http://linoxide.com/wp-content/uploads/2014/02/ssh_cipher.png)

让我们试试比如你想使用 **blowfish** 算法来加密你的 SSH 会话，那么你只要把这一行加入你的 **/etc/ssh/ssh_config or ~/.ssh/config** 文件就可以：

    Cipher blowfish

默认的，SSH 会使用 3des 算法。

#### 6. 打开调试模式 ####

因为某些原因，我们想要追踪调试我们建立的 SSH 连接情况。SSH 提供的 **-v** 选项参数正是为此而设的。

    $ ssh -v 192.168.0.103

![debug ssh connection](http://linoxide.com/wp-content/uploads/2014/02/ssh_v.png)

#### 7. 绑定源地址 ####

如果你的客户端有多于两个以上的 IP 地址，你就不可能分得清楚在使用哪一个 IP 连接到 SSH 服务器。

![More than 1 IP Address](http://linoxide.com/wp-content/uploads/2014/02/ifconfig.png)

为了解决这种情况，我们可以使用 **-b** 选项来指定一个IP 地址。这个 IP 将会被使用做建立连接的源地址。

    $ ssh -b 192.168.0.200 -l leni 192.168.0.103

服务端，我们可以使用 netstat 命令来检查到服务的连接是否建立。可以看到 IP 为 192.168.0.200 的连接已经建立。

![Bind address using SSH](http://linoxide.com/wp-content/uploads/2014/02/ssh_bind.png)

#### 8. 使用其他配置文件 ####

默认情况下，ssh 会使用位于 **/etc/ssh/ssh_config** 的配置文件。这个配置文件作用于系统的所有用户。但你想要为特定的用户指定特殊的设置的话，可以把配置放入 **~/.ssh/config** 文件中。如果此文件不存在，可以手工创建一个。

下面是一个通用 **ssh_config** 文件配置的例子。这配置文件位于 **/home/pungki** 目录下。

    Host 192.168.0.*
    ForwardX11 yes
    PasswordAuthentication yes
    ConnectTimeout 10
    Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
    Protocol 2
    HashKnownHosts yes

要使用指定的配置文件，可以使用 **-F** 选项。

    $ ssh -F /home/pungki/my_ssh_config 192.168.0.101

![Specify your ssh_config](http://linoxide.com/wp-content/uploads/2014/02/ssh_F.png)

### 9. 使用 SSH X11 Forwarding ###

某些时候，你可能想把服务端的 X11 应用程序显示到客户端计算机上，SSH 提供了 **-X** 选项。但要启用这功能，我们需要做些准备，下面是它的设置：

在服务器端，你需要使 **/etc/ssh/ssh_config** 文件中的行设置成 **ForwardX11 yes 或者 X11Forwad yes**，以启用 X11 Forwarding，重启 SSH 服务程序。

然后在客户端，输入 **ssh -X user@host**:

    $ ssh -X leni@192.168.0.101

一旦登陆，可以输入：

    $ echo $DISPLAY

来检查，你应该可以看到向如下所示的

    localhost:10:0

随后就可以运行应用了，仅仅只能输入应用程序的命令。让我们试试，比如想运行 xclock 程序，输入：

    $ xclock

![Use X11 Formading](http://linoxide.com/wp-content/uploads/2014/02/ssh_Y.png)

它就运行起来了，xclock 确实是运行在远端系统的，但它在你的本地系统里显示了。

![xclock](http://linoxide.com/wp-content/uploads/2014/02/xclock.png)

#### 10. 可信任的 X11 转发 ####

如果你敢肯定你的网络是安全的，那么你可以使用**可信任的 X11 转发机制**。这意味着远程的 X11 客户端可以完全的访问源 X11 显示内容。要使用此功能，可以使用 **-Y** 选项。

    $ ssh -Y leni@192.168.0.101

![SSH _Y for trusted connection](http://linoxide.com/wp-content/uploads/2014/02/ssh_Y1.png)

### 结论 ###

我们相信 SSH 的使用范围非常之广。SSH 给用户提供了网络连接的极大安全性和灵活性。通常我们都会输入 **man ssh** 和 **man ssh_config** 来显示它的用户手册及查看更多的细节。

（译注补充：建议使用ssh的协议版本2，因此请修改 ssh_config 文件的 Protocol 字段为：2，而将对协议1的支持取消。）

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/learn-ssh-connection-options/

译者：[runningwater](https://github.com/runningwater) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出