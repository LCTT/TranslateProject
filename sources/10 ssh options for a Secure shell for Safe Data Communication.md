用作安全数据通信的 Secure shell 的10个 ssh 命令选项
================================================================================
一个系统管理员可能会同时管理着多台服务器，这些服务器也许会放在不同的地方。要亲自一台一台的去访问来管理她们显然不是最好的方法，通过远程控制的方法应该是最有效的。远程访问最通用的一款应用程序是 **SSH**。

### SSH 是什么 ###

**SSH（全称 Secure Shell)**是一种加密的网络协议。使用该协议的数据将被加密，如果在传输中间数据泄漏，也可以确保没有人能读取出有用信息。要使用 SSH，目标机器应该安装 SSH 服务端应用程序，因为 **SSH 是基于客户-服务模式的。** 当你想安全的远程到主机，可中间的网络（比如因特网）并不安全，通常这种情况下就会使用 SSH。

### 安装 SSH ###

的 Linux 系统默认已经安装了 SSH。如果碰巧你的机器没装，我们可以手工来安装一下。最简单的方式就是使用 Linux 包管理器。

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

第一次连接目标主机时，ssh 会让你确认目标主机的真实性。如果你回答的是 **NO**，SSH 将不会继续连接，只有回答 **Yes** 才会继续。

![Connecting to SSH](http://linoxide.com/wp-content/uploads/2014/02/ssh_connect.png)

下一次再登陆此主机时，SSH 就不会提示确认消息了。对此主机的真实验证信息已经默认保存在每个用户的 /home/user/.ssh 文件里。

#### 2. 指定登陆用户 ####

默认的，ssh 会尝试用当前用户作为用户名来连接。在上面的示例命令中，ssh 会尝试用用户名叫 pungki 的用户身份来登入服务器，这是因为用户 pungki 正在客户机上使用 ssh 客服端软件。 

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

This option will be useful if your connection is slow, such as using a modem. But when you are using a fast connection such as LAN or higher, than compression will be slow down your transfer rate.
The level of compression can be controlled using **-o** option followed by **CompressionLevel** option. But this option will only applied for SSH-1.

#### 5. Define a cipher algorithm ####

SSH provides some cipher algorithms to be used. These algorithms can be seen inside **/etc/ssh/ssh_config or ~/.ssh/config file** (if exist).

![SSH cipher configuration example](http://linoxide.com/wp-content/uploads/2014/02/ssh_cipher.png)

Let say you want to use **blowfish** algorithm for encrypting your SSH session. Then you can put this line into your **/etc/ssh/ssh_config or ~/.ssh/config** file :

    Cipher blowfish

By default, SSH will use 3des algorithm

#### 6. Turn on debug mode ####

For some reason, we may want to debug the SSH connection that we want to create. SSH provides **-v** option to do this.

    $ ssh -v 192.168.0.103

![debug ssh connection](http://linoxide.com/wp-content/uploads/2014/02/ssh_v.png)

#### 7. Bind source address ####

If your client has more than 2 IP Address, you might not know which IP Address is used to create a connection to the SSH server.

![More than 1 IP Address](http://linoxide.com/wp-content/uploads/2014/02/ifconfig.png)

To solve this situation, we can use -b option which will bind an IP Address to SSH connection. This IP Address will be used as the source address of the connection.

    $ ssh -b 192.168.0.200 -l leni 192.168.0.103

On the server side, we can check the established connection to the server using netstat. We see that 192.168.0.200 connection is established.

![Bind address using SSH](http://linoxide.com/wp-content/uploads/2014/02/ssh_bind.png)

#### 8. Use other configuration file ####

By default, ssh will use a ssh configuration file which located in **/etc/ssh/ssh_config**. This file is applied to system wide. If you want to apply particular setting to specific user, you should put it in **~/.ssh/config** file. If you don’t see it, you can create it.

Here’s a sample of a custom **ssh_config**. This config is located in **/home/pungki directory**.

    Host 192.168.0.*
    ForwardX11 yes
    PasswordAuthentication yes
    ConnectTimeout 10
    Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
    Protocol 2
    HashKnownHosts yes

To use a specific config file, we can use **-F** option.

    $ ssh -F /home/pungki/my_ssh_config 192.168.0.101

![Specify your ssh_config](http://linoxide.com/wp-content/uploads/2014/02/ssh_F.png)

### 9. Use SSH X11 Forwarding ###

For some reason, you may want to display a X11 application on the server into your client computer. SSH provides **-X** option to do this. But in order to enable this feature, we need some preparation. Here’s the settings

On the server side, you need to enable line **ForwardX11 yes or X11Forward yes** in **/etc/ssh/ssh_config**. Then restart your SSH server.

Then on the client side, type **ssh -X user@host** :

    $ ssh -X leni@192.168.0.101

Once you have logged on, you can check it by typing :

    $ echo $DISPLAY

You should see something like

    localhost:10:0

Then to run an application, just type the command of the application. Let say you want to run xclock application. Then type :

    $ xclock

![Use X11 Formading](http://linoxide.com/wp-content/uploads/2014/02/ssh_Y.png)

When it run, actually you are running the xclock application on the remote system, but display it on your local system.

![xclock](http://linoxide.com/wp-content/uploads/2014/02/xclock.png)

#### 10. Trusted X11 Forwading ####

If you pretty sure that your network is secure, then you may want to use **Trusted X11 Forwarding**. This mean that the remote X11 clients will have full access to the original X11 display. To use this option, we can use **-Y** option.

    $ ssh -Y leni@192.168.0.101

![SSH _Y for trusted connection](http://linoxide.com/wp-content/uploads/2014/02/ssh_Y1.png)

### Conclusion ###

We believe that SSH is used in wide-range area. Security and flexibility is one of the SSH offer to the user. As usual we can always type **man ssh** and **man ssh_config** to display its manual pages and explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/learn-ssh-connection-options/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出