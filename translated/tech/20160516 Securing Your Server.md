Linux 服务器安全简明指南
============================================================

现在让我们强化你的服务器以防止未授权访问。

### 经常升级系统

保持最新的软件是你可以在任何操作系统上采取的最大的安全预防措施。软件更新的范围从关键漏洞补丁到小 bug 的修复，许多软件漏洞实际上是在它们被公开的时候得到修补的。

### 自动安全更新

有一些用于服务器上自动更新的参数。[Fedora 的 Wiki][15] 上有一篇很棒的剖析自动更新的利弊的文章，但是如果你把它限制到安全更新上，自动更新的风险将是最小的。

自动更新的可行性必须你自己判断，因为它归结为**你**在你的服务器上做什么。请记住，自动更新仅适用于来自仓库的包，而不是自行编译的程序。你可能会发现一个复制了生产服务器的测试环境是很有必要的。可以在部署到生产环境之前，在测试环境里面更新来检查问题。

* CentOS 使用 [yum-cron][2] 进行自动更新。
* Debian 和 Ubuntu 使用 [无人值守升级][3]。
* Fedora 使用 [dnf-automatic][4]。

### 添加一个受限用户账户

到目前为止，你已经作为 `root` 用户访问了你的服务器，它有无限制的权限，可以执行**任何**命令 - 甚至可能意外中断你的服务器。 我们建议创建一个受限用户帐户，并始终使用它。 管理任务应该使用 `sudo` 来完成，它可以临时提升受限用户的权限，以便管理你的服务器。

> 不是所有的 Linux 发行版都在系统上默认包含 `sudo`，但大多数都在其软件包仓库中有 `sudo`。 如果得到这样的输出 `sudo：command not found`，请在继续之前安装 `sudo`。

要添加新用户，首先通过 SSH [登录到你的服务器][16]。

#### CentOS / Fedora

1、 创建用户，用你想要的名字替换 `example_user`，并分配一个密码：

```
useradd example_user && passwd example_user
```

2、 将用户添加到具有 sudo 权限的 `wheel` 组：

```
usermod -aG wheel example_user
```

#### Ubuntu

1、 创建用户，用你想要的名字替换 `example_user`。你将被要求输入用户密码：

```
adduser example_user
```

2、 添加用户到 `sudo` 组，这样你就有管理员权限了：

```
adduser example_user sudo
```

#### Debian

1、 Debian 默认的包中没有 `sudo`， 使用 `apt-get` 来安装：

```
apt-get install sudo
```

2、 创建用户，用你想要的名字替换 `example_user`。你将被要求输入用户密码：

```
adduser example_user
```

3、 添加用户到 `sudo` 组，这样你就有管理员权限了：

```
adduser example_user sudo
```

创建完有限权限的用户后，断开你的服务器连接：

```
exit
```

重新用你的新用户登录。用你的用户名代替 `example_user`，用你的服务器 IP 地址代替例子中的 IP 地址：

```
ssh example_user@203.0.113.10
```

现在你可以用你的新用户帐户管理你的服务器，而不是 `root`。 几乎所有超级用户命令都可以用 `sudo`（例如：`sudo iptables -L -nv`）来执行，这些命令将被记录到 `/var/log/auth.log` 中。

### 加固 SSH 访问

默认情况下，密码认证用于通过 SSH 连接到您的服务器。加密密钥对更加安全，因为它用私钥代替了密码，这通常更难以暴力破解。在本节中，我们将创建一个密钥对，并将服务器配置为不接受 SSH 密码登录。

#### 创建验证密钥对

1、这是在你本机上完成的，**不是**在你的服务器上，这里将创建一个 4096 位的 RSA 密钥对。在创建过程中，您可以选择使用密码加密私钥。这意味着它不能在没有输入密码的情况下使用，除非将密码保存到本机桌面的密钥管理器中。我们建议您使用带有密码的密钥对，但如果你不想使用密码，则可以将此字段留空。

**Linux / OS X**

> 如果你已经创建了 RSA 密钥对，则这个命令将会覆盖它，这可能会导致你不能访问其它的操作系统。如果你已创建过密钥对，请跳过此步骤。要检查现有的密钥，请运行 `ls〜/ .ssh / id_rsa *`。

```
ssh-keygen -b 4096
```

在输入密码之前，按下 **回车**使用 `/home/your_username/.ssh` 中的默认名称 `id_rsa` 和 `id_rsa.pub`。

**Windows**

这可以使用 PuTTY 完成，在我们指南中已有描述：[使用 SSH 公钥验证][6]。

2、将公钥上传到您的服务器上。 将 `example_user` 替换为你用来管理服务器的用户名称，将 `203.0.113.10` 替换为你的服务器的 IP 地址。

**Linux**

在本机上：

```
ssh-copy-id example_user@203.0.113.10
```
 
**OS X**

在你的服务器上（用你的权限受限用户登录）：

```
mkdir -p ~/.ssh && sudo chmod -R 700 ~/.ssh/
```
 
在本机上：

```
scp ~/.ssh/id_rsa.pub example_user@203.0.113.10:~/.ssh/authorized_keys
```

> 如果相对于 `scp` 你更喜欢 `ssh-copy-id` 的话，那么它也可以在 [Homebrew][5] 中找到。使用 `brew install ssh-copy-id` 安装。

**Windows**

* **选择 1**：使用 [WinSCP][1] 来完成。 在登录窗口中，输入你的服务器的 IP 地址作为主机名，以及非 root 的用户名和密码。单击“登录”连接。

	一旦 WinSCP 连接后，你会看到两个主要部分。 左边显示本机上的文件，右边显示服务区上的文件。 使用左侧的文件浏览器，导航到你已保存公钥的文件，选择公钥文件，然后点击上面工具栏中的“上传”。

	系统会提示你输入要将文件放在服务器上的路径。 将文件上传到 `/home/example_user/.ssh /authorized_keys`，用你的用户名替换 `example_user`。

* **选择 2**：将公钥直接从 PuTTY 键生成器复制到连接到你的服务器中（作为非 root 用户）：

    ```
    mkdir ~/.ssh; nano ~/.ssh/authorized_keys
    ```

    上面命令将在文本编辑器中打开一个名为 `authorized_keys` 的空文件。 将公钥复制到文本文件中，确保复制为一行，与 PuTTY 所生成的完全一样。 按下 `CTRL + X`，然后按下 `Y`，然后回车保存文件。

最后，你需要为公钥目录和密钥文件本身设置权限：

```
sudo chmod 700 -R ~/.ssh && chmod 600 ~/.ssh/authorized_keys
```

这些命令通过阻止其他用户访问公钥目录以及文件本身来提供额外的安全性。有关它如何工作的更多信息，请参阅我们的指南[如何修改文件权限][7]。

3、 现在退出并重新登录你的服务器。如果你为私钥指定了密码，则需要输入密码。

#### SSH 守护进程选项

1、 **不允许 root 用户通过 SSH 登录。** 这要求所有的 SSH 连接都是通过非 root 用户进行。当以受限用户帐户连接后，可以通过使用 `sudo` 或使用 `su -` 切换为 root shell 来使用管理员权限。

```
# Authentication:
...
PermitRootLogin no
```

2、 **禁用 SSH 密码认证。** 这要求所有通过 SSH 连接的用户使用密钥认证。根据 Linux 发行版的不同，它可能需要添加 `PasswordAuthentication` 这行，或者删除前面的 `#` 来取消注释。

```
# Change to no to disable tunnelled clear text passwords
PasswordAuthentication no
```

> 如果你从许多不同的计算机连接到服务器，你可能想要继续启用密码验证。这将允许你使用密码进行身份验证，而不是为每个设备生成和上传密钥对。

3、 **只监听一个互联网协议。** 在默认情况下，SSH 守护进程同时监听 IPv4 和 IPv6 上的传入连接。除非你需要使用这两种协议进入你的服务器，否则就禁用你不需要的。 _这不会禁用系统范围的协议，它只用于 SSH 守护进程。_

使用选项：

*   `AddressFamily inet` 只监听 IPv4。
*   `AddressFamily inet6` 只监听 IPv6。

默认情况下，`AddressFamily` 选项通常不在 `sshd_config` 文件中。将它添加到文件的末尾：

```
echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config
```

4、  重新启动 SSH 服务以加载新配置。

如果你使用的 Linux 发行版使用 systemd（CentOS 7、Debian 8、Fedora、Ubuntu 15.10+）

```
sudo systemctl restart sshd
```

如果您的 init 系统是 SystemV 或 Upstart（CentOS 6、Debian 7、Ubuntu 14.04）：

```
sudo service ssh restart
```

#### 使用 Fail2Ban 保护 SSH 登录

[Fail2Ban][17] 是一个应用程序，它会在太多的失败登录尝试后禁止 IP 地址登录到你的服务器。由于合法登录通常不会超过三次尝试（如果使用 SSH 密钥，那不会超过一个），因此如果服务器充满了登录失败的请求那就表示有恶意访问。

Fail2Ban 可以监视各种协议，包括 SSH、HTTP 和 SMTP。默认情况下，Fail2Ban 仅监视 SSH，并且因为 SSH 守护程序通常配置为持续运行并监听来自任何远程 IP 地址的连接，所以对于任何服务器都是一种安全威慑。

有关安装和配置 Fail2Ban 的完整说明，请参阅我们的指南：[使用 Fail2ban 保护服务器][18]。

### 删除未使用的面向网络的服务

大多数 Linux 发行版都安装并运行了网络服务，监听来自互联网、回环接口或两者兼有的传入连接。 将不需要的面向网络的服务从系统中删除，以减少对运行进程和对已安装软件包攻击的概率。

#### 查明运行的服务

要查看服务器中运行的服务：

```
sudo netstat -tulpn
```

> 如果默认情况下 `netstat` 没有包含在你的 Linux 发行版中，请安装软件包 `net-tools` 或使用 `ss -tulpn` 命令。

以下是 `netstat` 的输出示例。 请注意，因为默认情况下不同发行版会运行不同的服务，你的输出将有所不同：


```
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      7315/rpcbind
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      3277/sshd
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN      3179/exim4
tcp        0      0 0.0.0.0:42526           0.0.0.0:*               LISTEN      2845/rpc.statd
tcp6       0      0 :::48745                :::*                    LISTEN      2845/rpc.statd
tcp6       0      0 :::111                  :::*                    LISTEN      7315/rpcbind
tcp6       0      0 :::22                   :::*                    LISTEN      3277/sshd
tcp6       0      0 ::1:25                  :::*                    LISTEN      3179/exim4
udp        0      0 127.0.0.1:901           0.0.0.0:*                           2845/rpc.statd
udp        0      0 0.0.0.0:47663           0.0.0.0:*                           2845/rpc.statd
udp        0      0 0.0.0.0:111             0.0.0.0:*                           7315/rpcbind
udp        0      0 192.0.2.1:123           0.0.0.0:*                           3327/ntpd
udp        0      0 127.0.0.1:123           0.0.0.0:*                           3327/ntpd
udp        0      0 0.0.0.0:123             0.0.0.0:*                           3327/ntpd
udp        0      0 0.0.0.0:705             0.0.0.0:*                           7315/rpcbind
udp6       0      0 :::111                  :::*                                7315/rpcbind
udp6       0      0 fe80::f03c:91ff:fec:123 :::*                                3327/ntpd
udp6       0      0 2001:DB8::123           :::*                                3327/ntpd
udp6       0      0 ::1:123                 :::*                                3327/ntpd
udp6       0      0 :::123                  :::*                                3327/ntpd
udp6       0      0 :::705                  :::*                                7315/rpcbind
udp6       0      0 :::60671                :::*                                2845/rpc.statd
```
 
`netstat` 告诉我们服务正在运行 [RPC][19]（`rpc.statd` 和 `rpcbind`）、SSH（`sshd`）、[NTPdate][20]（`ntpd`）和[Exim][21]（`exim4`）。

##### TCP

请参阅 `netstat` 输出的 `Local Address` 那一列。进程 `rpcbind` 正在侦听 `0.0.0.0:111` 和 `:::111`，外部地址是  `0.0.0.0:*` 或者 `:::*` 。这意味着它从任何端口和任何网络接口接受来自任何外部地址（IPv4 和 IPv6）上的其它 RPC 客户端的传入 TCP 连接。 我们看到类似的 SSH，Exim 正在侦听来自回环接口的流量，如所示的 `127.0.0.1` 地址。

##### UDP

UDP 套接字是[无状态][14]的，这意味着它们只有打开或关闭，并且每个进程的连接是独立于前后发生的连接。这与 TCP 的连接状态（例如 `LISTEN`、`ESTABLISHED`和 `CLOSE_WAIT`）形成对比。

我们的 `netstat`输出说明 NTPdate ：1）接受服务器的公网 IP 地址的传入连接；2）通过本地主机进行通信；3）接受来自外部的连接。这些连接是通过端口 123 进行的，同时支持 IPv4 和 IPv6。我们还看到了 RPC 打开的更多的套接字。

#### 查明该移除哪个服务

如果你在没有启用防火墙的情况下对服务器进行基本的 TCP 和 UDP 的 [nmap][22] 扫描，那么在打开端口的结果中将出现 SSH、RPC 和 NTPdate 。通过[配置防火墙][23]，你可以过滤掉这些端口，但 SSH 除外，因为它必须允许你的传入连接。但是，理想情况下，应该禁用未使用的服务。

* 你可能主要通过 SSH 连接管理你的服务器，所以让这个服务需要保留。如上所述，[RSA 密钥][8]和 [Fail2Ban][9] 可以帮助你保护 SSH。
* NTP 是服务器计时所必需的，但有个替代 NTPdate 的方法。如果你喜欢不开放网络端口的时间同步方法，并且你不需要纳秒精度，那么你可能有兴趣用 [OpenNTPD][10] 来代替 NTPdate。
* 然而，Exim 和 RPC 是不必要的，除非你有特定的用途，否则应该删除它们。

> 本节针对 Debian 8。默认情况下，不同的 Linux 发行版具有不同的服务。如果你不确定某项服务的功能，请尝试搜索互联网以了解该功能是什么，然后再尝试删除或禁用它。

#### 卸载监听的服务

如何移除包取决于发行版的包管理器：

**Arch**

```
sudo pacman -Rs package_name
```

**CentOS**

```
sudo yum remove package_name
```

**Debian / Ubuntu**

```
sudo apt-get purge package_name
```

**Fedora**

```
sudo dnf remove package_name
```

再次运行 `sudo netstat -tulpn`，你看到监听的服务就只会有 SSH（`sshd`）和 NTP（`ntpdate`，网络时间协议）。

### 配置防火墙

使用防火墙阻止不需要的入站流量能为你的服务器提供一个高效的安全层。 通过指定入站流量，你可以阻止入侵和网络测绘。 最佳做法是只允许你需要的流量，并拒绝一切其他流量。请参阅我们的一些关于最常见的防火墙程序的文档：

* [iptables][11] 是 netfilter 的控制器，它是 Linux 内核的包过滤框架。 默认情况下，iptables 包含在大多数 Linux 发行版中。
* [firewallD][12] 是可用于 CentOS/Fedora 系列发行版的 iptables 控制器。
* [UFW][13] 为 Debian 和 Ubuntu 提供了一个 iptables 前端。

### 接下来

这些是加固 Linux 服务器的最基本步骤，但是进一步的安全层将取决于其预期用途。 其他技术可以包括应用程序配置，使用[入侵检测][24]或者安装某个形式的[访问控制][25]。

现在你可以按你的需求开始设置你的服务器了。 我们有一个文档库来以帮助你从[从共享主机迁移][26]到[启用两步验证][27]到[托管网站] [28]等各种主题。

--------------------------------------------------------------------------------

via: https://www.linode.com/docs/security/securing-your-server/

作者：[Phil Zona][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linode.com/docs/security/securing-your-server/
[1]:http://winscp.net/
[2]:https://fedoraproject.org/wiki/AutoUpdates#Fedora_21_or_earlier_versions
[3]:https://help.ubuntu.com/lts/serverguide/automatic-updates.html
[4]:https://dnf.readthedocs.org/en/latest/automatic.html
[5]:http://brew.sh/
[6]:https://www.linode.com/docs/security/use-public-key-authentication-with-ssh#windows-operating-system
[7]:https://www.linode.com/docs/tools-reference/modify-file-permissions-with-chmod
[8]:https://www.linode.com/docs/security/securing-your-server/#create-an-authentication-key-pair
[9]:https://www.linode.com/docs/security/securing-your-server/#use-fail2ban-for-ssh-login-protection
[10]:https://en.wikipedia.org/wiki/OpenNTPD
[11]:https://www.linode.com/docs/security/firewalls/control-network-traffic-with-iptables
[12]:https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos
[13]:https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw
[14]:https://en.wikipedia.org/wiki/Stateless_protocol
[15]:https://fedoraproject.org/wiki/AutoUpdates#Why_use_Automatic_updates.3F
[16]:https://www.linode.com/docs/getting-started#logging-in-for-the-first-time
[17]:http://www.fail2ban.org/wiki/index.php/Main_Page
[18]:https://www.linode.com/docs/security/using-fail2ban-for-security
[19]:https://en.wikipedia.org/wiki/Open_Network_Computing_Remote_Procedure_Call
[20]:http://support.ntp.org/bin/view/Main/SoftwareDownloads
[21]:http://www.exim.org/
[22]:https://nmap.org/
[23]:https://www.linode.com/docs/security/securing-your-server/#configure-a-firewall
[24]:https://linode.com/docs/security/ossec-ids-debian-7
[25]:https://en.wikipedia.org/wiki/Access_control#Access_Control
[26]:https://www.linode.com/docs/migrate-to-linode/migrate-from-shared-hosting
[27]:https://www.linode.com/docs/security/linode-manager-security-controls
[28]:https://www.linode.com/docs/websites/hosting-a-website
