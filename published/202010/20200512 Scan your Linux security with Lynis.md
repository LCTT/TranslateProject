[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12696-1.html)
[#]: subject: (Scan your Linux security with Lynis)
[#]: via: (https://opensource.com/article/20/5/linux-security-lynis)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

使用 Lynis 扫描 Linux 安全性
======

> 使用这个全面的开源安全审计工具检查你的 Linux 机器的安全性。

![](https://img.linux.net.cn/data/attachment/album/202010/08/095516k6bdgeb6jhiajutm.jpg)

你有没有想过你的 Linux 机器到底安全不安全？Linux 发行版众多，每个发行版都有自己的默认设置，你在上面运行着几十个版本各异的软件包，还有众多的服务在后台运行，而我们几乎不知道或不关心这些。

要想确定安全态势（指你的 Linux 机器上运行的软件、网络和服务的整体安全状态），你可以运行几个命令，得到一些零碎的相关信息，但你需要解析的数据量是巨大的。

如果能运行一个工具，生成一份关于机器安全状况的报告，那就好得多了。而幸运的是，有一个这样的软件：[Lynis][2]。它是一个非常流行的开源安全审计工具，可以帮助强化基于 Linux 和 Unix 的系统。根据该项目的介绍：

> “它运行在系统本身，可以进行深入的安全扫描。主要目标是测试安全防御措施，并提供进一步强化系统的提示。它还将扫描一般系统信息、易受攻击的软件包和可能的配置问题。Lynis 常被系统管理员和审计人员用来评估其系统的安全防御。”

### 安装 Lynis

你的 Linux 软件仓库中可能有 Lynis。如果有的话，你可以用以下方法安装它：

```
dnf install lynis
```

或

```
apt install lynis
```

然而，如果你的仓库中的版本不是最新的，你最好从 GitHub 上安装它。（我使用的是 Red Hat Linux 系统，但你可以在任何 Linux 发行版上运行它）。就像所有的工具一样，先在虚拟机上试一试是有意义的。要从 GitHub 上安装它：

```
$ cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.8 (Maipo)
$
$ uname  -r
3.10.0-1127.el7.x86_64
$
$ git clone https://github.com/CISOfy/lynis.git
Cloning into 'lynis'...
remote: Enumerating objects: 30, done.
remote: Counting objects: 100% (30/30), done.
remote: Compressing objects: 100% (30/30), done.
remote: Total 12566 (delta 15), reused 8 (delta 0), pack-reused 12536
Receiving objects: 100% (12566/12566), 6.36 MiB | 911.00 KiB/s, done.
Resolving deltas: 100% (9264/9264), done.
$
```

一旦你克隆了这个版本库，那么进入该目录，看看里面有什么可用的。主要的工具在一个叫 `lynis` 的文件里。它实际上是一个 shell 脚本，所以你可以打开它看看它在做什么。事实上，Lynis 主要是用 shell 脚本来实现的：

```
$ cd lynis/
$ ls
CHANGELOG.md        CONTRIBUTING.md  db           developer.prf  FAQ             include  LICENSE  lynis.8  README     SECURITY.md
CODE_OF_CONDUCT.md  CONTRIBUTORS.md  default.prf  extras         HAPPY_USERS.md  INSTALL  lynis    plugins  README.md
$
$ file lynis
lynis: POSIX shell script, ASCII text executable, with very long lines
$
```

### 运行 Lynis

通过给 Lynis 一个 `-h` 选项来查看帮助部分，以便有个大概了解：

```
$ ./lynis -h
```

你会看到一个简短的信息屏幕，然后是 Lynis 支持的所有子命令。

接下来，尝试一些测试命令以大致熟悉一下。要查看你正在使用的 Lynis 版本，请运行：

```
$ ./lynis show version
3.0.0
$
```

要查看 Lynis 中所有可用的命令：

```
$ ./lynis show commands

Commands:
lynis audit
lynis configure
lynis generate
lynis show
lynis update
lynis upload-only

$
```

### 审计 Linux 系统

要审计你的系统的安全态势，运行以下命令：

```
$ ./lynis audit system
```

这个命令运行得很快，并会返回一份详细的报告，输出结果可能一开始看起来很吓人，但我将在下面引导你来阅读它。这个命令的输出也会被保存到一个日志文件中，所以你可以随时回过头来检查任何可能感兴趣的东西。

Lynis 将日志保存在这里：

```
  Files:
  - Test and debug information      : /var/log/lynis.log
  - Report data                     : /var/log/lynis-report.dat
```

你可以验证是否创建了日志文件。它确实创建了：

```
$ ls -l /var/log/lynis.log
-rw-r-----. 1 root root 341489 Apr 30 05:52 /var/log/lynis.log
$
$ ls -l /var/log/lynis-report.dat
-rw-r-----. 1 root root 638 Apr 30 05:55 /var/log/lynis-report.dat
$
```

### 探索报告

Lynis 提供了相当全面的报告，所以我将介绍一些重要的部分。作为初始化的一部分，Lynis 做的第一件事就是找出机器上运行的操作系统的完整信息。之后是检查是否安装了什么系统工具和插件：

```
[+] Initializing program
------------------------------------
  - Detecting OS...                                           [ DONE ]
  - Checking profiles...                                      [ DONE ]

  ---------------------------------------------------
  Program version:           3.0.0
  Operating system:          Linux
  Operating system name:     Red Hat Enterprise Linux Server 7.8 (Maipo)
  Operating system version:  7.8
  Kernel version:            3.10.0
  Hardware platform:         x86_64
  Hostname:                  example
  ---------------------------------------------------
<<截断>>

[+] System Tools
------------------------------------
  - Scanning available tools...
  - Checking system binaries...

[+] Plugins (phase 1)
------------------------------------
 Note: plugins have more extensive tests and may take several minutes to complete
 
  - Plugin: pam
    [..]
  - Plugin: systemd
    [................]
```

接下来，该报告被分为不同的部分，每个部分都以 `[+]` 符号开头。下面可以看到部分章节。（哇，要审核的地方有这么多，Lynis 是最合适的工具！）

```
[+] Boot and services
[+] Kernel
[+] Memory and Processes
[+] Users, Groups and Authentication
[+] Shells
[+] File systems
[+] USB Devices
[+] Storage
[+] NFS
[+] Name services
[+] Ports and packages
[+] Networking
[+] Printers and Spools
[+] Software: e-mail and messaging
[+] Software: firewalls
[+] Software: webserver
[+] SSH Support
[+] SNMP Support
[+] Databases
[+] LDAP Services
[+] PHP
[+] Squid Support
[+] Logging and files
[+] Insecure services
[+] Banners and identification
[+] Scheduled tasks
[+] Accounting
[+] Time and Synchronization
[+] Cryptography
[+] Virtualization
[+] Containers
[+] Security frameworks
[+] Software: file integrity
[+] Software: System tooling
[+] Software: Malware
[+] File Permissions
[+] Home directories
[+] Kernel Hardening
[+] Hardening
[+] Custom tests
```

Lynis 使用颜色编码使报告更容易解读。

  * 绿色。一切正常
  * 黄色。跳过、未找到，可能有个建议
  * 红色。你可能需要仔细看看这个

在我的案例中，大部分的红色标记都是在 “Kernel Hardening” 部分找到的。内核有各种可调整的设置，它们定义了内核的功能，其中一些可调整的设置可能有其安全场景。发行版可能因为各种原因没有默认设置这些，但是你应该检查每一项，看看你是否需要根据你的安全态势来改变它的值：

```
[+] Kernel Hardening
------------------------------------
  - Comparing sysctl key pairs with scan profile
    - fs.protected_hardlinks (exp: 1)                         [ OK ]
    - fs.protected_symlinks (exp: 1)                          [ OK ]
    - fs.suid_dumpable (exp: 0)                               [ OK ]
    - kernel.core_uses_pid (exp: 1)                           [ OK ]
    - kernel.ctrl-alt-del (exp: 0)                            [ OK ]
    - kernel.dmesg_restrict (exp: 1)                          [ DIFFERENT ]
    - kernel.kptr_restrict (exp: 2)                           [ DIFFERENT ]
    - kernel.randomize_va_space (exp: 2)                      [ OK ]
    - kernel.sysrq (exp: 0)                                   [ DIFFERENT ]
    - kernel.yama.ptrace_scope (exp: 1 2 3)                   [ DIFFERENT ]
    - net.ipv4.conf.all.accept_redirects (exp: 0)             [ DIFFERENT ]
    - net.ipv4.conf.all.accept_source_route (exp: 0)          [ OK ]
    - net.ipv4.conf.all.bootp_relay (exp: 0)                  [ OK ]
    - net.ipv4.conf.all.forwarding (exp: 0)                   [ OK ]
    - net.ipv4.conf.all.log_martians (exp: 1)                 [ DIFFERENT ]
    - net.ipv4.conf.all.mc_forwarding (exp: 0)                [ OK ]
    - net.ipv4.conf.all.proxy_arp (exp: 0)                    [ OK ]
    - net.ipv4.conf.all.rp_filter (exp: 1)                    [ OK ]
    - net.ipv4.conf.all.send_redirects (exp: 0)               [ DIFFERENT ]
    - net.ipv4.conf.default.accept_redirects (exp: 0)         [ DIFFERENT ]
    - net.ipv4.conf.default.accept_source_route (exp: 0)      [ OK ]
    - net.ipv4.conf.default.log_martians (exp: 1)             [ DIFFERENT ]
    - net.ipv4.icmp_echo_ignore_broadcasts (exp: 1)           [ OK ]
    - net.ipv4.icmp_ignore_bogus_error_responses (exp: 1)     [ OK ]
    - net.ipv4.tcp_syncookies (exp: 1)                        [ OK ]
    - net.ipv4.tcp_timestamps (exp: 0 1)                      [ OK ]
    - net.ipv6.conf.all.accept_redirects (exp: 0)             [ DIFFERENT ]
    - net.ipv6.conf.all.accept_source_route (exp: 0)          [ OK ]
    - net.ipv6.conf.default.accept_redirects (exp: 0)         [ DIFFERENT ]
    - net.ipv6.conf.default.accept_source_route (exp: 0)      [ OK ]
```

看看 SSH 这个例子，因为它是一个需要保证安全的关键领域。这里没有什么红色的东西，但是 Lynis 对我的环境给出了很多强化 SSH 服务的建议：

```
[+] SSH Support
------------------------------------
  - Checking running SSH daemon                               [ FOUND ]
    - Searching SSH configuration                             [ FOUND ]
    - OpenSSH option: AllowTcpForwarding                      [ SUGGESTION ]
    - OpenSSH option: ClientAliveCountMax                     [ SUGGESTION ]
    - OpenSSH option: ClientAliveInterval                     [ OK ]
    - OpenSSH option: Compression                             [ SUGGESTION ]
    - OpenSSH option: FingerprintHash                         [ OK ]
    - OpenSSH option: GatewayPorts                            [ OK ]
    - OpenSSH option: IgnoreRhosts                            [ OK ]
    - OpenSSH option: LoginGraceTime                          [ OK ]
    - OpenSSH option: LogLevel                                [ SUGGESTION ]
    - OpenSSH option: MaxAuthTries                            [ SUGGESTION ]
    - OpenSSH option: MaxSessions                             [ SUGGESTION ]
    - OpenSSH option: PermitRootLogin                         [ SUGGESTION ]
    - OpenSSH option: PermitUserEnvironment                   [ OK ]
    - OpenSSH option: PermitTunnel                            [ OK ]
    - OpenSSH option: Port                                    [ SUGGESTION ]
    - OpenSSH option: PrintLastLog                            [ OK ]
    - OpenSSH option: StrictModes                             [ OK ]
    - OpenSSH option: TCPKeepAlive                            [ SUGGESTION ]
    - OpenSSH option: UseDNS                                  [ SUGGESTION ]
    - OpenSSH option: X11Forwarding                           [ SUGGESTION ]
    - OpenSSH option: AllowAgentForwarding                    [ SUGGESTION ]
    - OpenSSH option: UsePrivilegeSeparation                  [ OK ]
    - OpenSSH option: AllowUsers                              [ NOT FOUND ]
    - OpenSSH option: AllowGroups                             [ NOT FOUND ]
```

我的系统上没有运行虚拟机或容器，所以这些显示的结果是空的：

```
[+] Virtualization
------------------------------------

[+] Containers
------------------------------------
```

Lynis 会检查一些从安全角度看很重要的文件的文件权限：

```
[+] File Permissions
------------------------------------
  - Starting file permissions check
    File: /boot/grub2/grub.cfg                                [ SUGGESTION ]
    File: /etc/cron.deny                                      [ OK ]
    File: /etc/crontab                                        [ SUGGESTION ]
    File: /etc/group                                          [ OK ]
    File: /etc/group-                                         [ OK ]
    File: /etc/hosts.allow                                    [ OK ]
    File: /etc/hosts.deny                                     [ OK ]
    File: /etc/issue                                          [ OK ]
    File: /etc/issue.net                                      [ OK ]
    File: /etc/motd                                           [ OK ]
    File: /etc/passwd                                         [ OK ]
    File: /etc/passwd-                                        [ OK ]
    File: /etc/ssh/sshd_config                                [ OK ]
    Directory: /root/.ssh                                     [ SUGGESTION ]
    Directory: /etc/cron.d                                    [ SUGGESTION ]
    Directory: /etc/cron.daily                                [ SUGGESTION ]
    Directory: /etc/cron.hourly                               [ SUGGESTION ]
    Directory: /etc/cron.weekly                               [ SUGGESTION ]
    Directory: /etc/cron.monthly                              [ SUGGESTION ]
```

在报告的底部，Lynis 根据报告的发现提出了建议。每项建议后面都有一个 “TEST-ID”（为了下一部分方便，请将其保存起来）。

```
 Suggestions (47):
  ----------------------------
  * If not required, consider explicit disabling of core dump in /etc/security/limits.conf file [KRNL-5820]
      https://cisofy.com/lynis/controls/KRNL-5820/

  * Check PAM configuration, add rounds if applicable and expire passwords to encrypt with new values [AUTH-9229]
      https://cisofy.com/lynis/controls/AUTH-9229/
```

Lynis 提供了一个选项来查找关于每个建议的更多信息，你可以使用 `show details` 命令和 TEST-ID 号来访问：

```
./lynis show details TEST-ID
```

这将显示该测试的其他信息。例如，我检查了 SSH-7408 的详细信息：

```
$ ./lynis show details SSH-7408
2020-04-30 05:52:23 Performing test ID SSH-7408 (Check SSH specific defined options)
2020-04-30 05:52:23 Test: Checking specific defined options in /tmp/lynis.k8JwazmKc6
2020-04-30 05:52:23 Result: added additional options for OpenSSH &lt; 7.5
2020-04-30 05:52:23 Test: Checking AllowTcpForwarding in /tmp/lynis.k8JwazmKc6
2020-04-30 05:52:23 Result: Option AllowTcpForwarding found
2020-04-30 05:52:23 Result: Option AllowTcpForwarding value is YES
2020-04-30 05:52:23 Result: OpenSSH option AllowTcpForwarding is in a weak configuration state and should be fixed
2020-04-30 05:52:23 Suggestion: Consider hardening SSH configuration [test:SSH-7408] [details:AllowTcpForwarding (set YES to NO)] [solution:-]
```

### 试试吧

如果你想更多地了解你的 Linux 机器的安全性，请试试 Lynis。如果你想了解 Lynis 是如何工作的，可以研究一下它的 shell 脚本，看看它是如何收集这些信息的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/linux-security-lynis

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://github.com/CISOfy/lynis
