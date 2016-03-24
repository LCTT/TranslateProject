如何在 Arch Linux 中安装 DNSCrypt 和 Unbound
================================================================================

**DNSCrypt** 是一个用于对 DNS 客户端和 DNS 解析器之间通信进行加密和验证的协议。它可以阻止 DNS 欺骗或中间人攻击。 DNSCrypt 可用于大多数的操作系统，包括 Linux，Windows，MacOSX ，Android 和 iOS。而在本教程中我使用的是内核为4.1的 archlinux。

**Unbound** 是用来解析收到的任意 DNS 查询的 DNS 缓存服务器。如果用户请求一个新的查询，unbound 会将其存储到缓存中，并且当用户再次请求相同的请求时，unbound 将采用已经保存的缓存。这将比第一次请求查询更快。

现在我将尝试安装“DNSCrypt”，以确保 DNS 的通信的安全，并用“Unbound”加速。

### 第一步 - 安装 yaourt ###

Yaourt 是AUR（ARCH 用户仓库）的辅助工具之一，它可以使用户能够很容易地从 AUR 安装程序。 Yaourt 和 pacman 使用相同的语法，你可以使用 yaourt 安装该程序。下面是安装 yaourt 的简单方法：

1、 用 nano 或者 vi 编辑 arch 仓库配置文件，存放在“/etc/pacman.conf”中。

    $ nano /etc/pacman.conf

2、 在 yaourt 仓库底部添加，粘贴下面的脚本：

    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch

3、 用“Ctrl + x”，接着用“Y”保存。

4、 接着升级仓库数据库并用pacman安装yaourt： 

    $ sudo pacman -Sy yaourt

### 第二步 - 安装 DNSCrypt 和 Unbound ###

DNSCrypt 和 unbound 就在 archlinux 仓库中，你可以用下面的 pacman 命令安装：

    $ sudo pacman -S dnscrypt-proxy unbound

接着在安装的过程中按下“Y”。

###  第三步 - 安装 dnscrypt-autoinstall ###

Dnscrypt-autoinstall 是一个在基于 Linux 的系统上自动安装和配置 DNSCrypt 的脚本。DNSCrypt 在 AUR 中，因此你必须使用“yaourt”命令来安装它。

    $ yaourt -S dnscrypt-autoinstall

注意 :

-S = 这和 pacman -S 安装程序一样。

### 第四步 - 运行 dnscrypt-autoinstall ###

用 root 权限运行“dnscrypt-autoinstall”来自动配置 DNSCrypt。

    $ sudo dnscrypt-autoinstall

下一步中按下“回车”，接着输入"Y"来选择你想使用的 DNS 提供者，我这里使用不带日志和 DNSSEC 的 DNSCrypt.eu。

![DNSCrypt autoinstall](http://blog.linoxide.com/wp-content/uploads/2015/08/DNSCrypt-autoinstall.png)

### 第五步 - 配置 DNSCrypt 和 Unbound ###

1、 打开 dnscrypt 的“/etc/conf.d/dnscrypt-config” ，确认配置文件中“DNSCRYPT_LOCALIP”指向**本地ip**，“DNSCRYPT_LOCALPORT”根据你本人的意愿配置，我是用的是**40**端口。

    $ nano /etc/conf.d/dnscrypt-config

    DNSCRYPT_LOCALIP=127.0.0.1
    DNSCRYPT_LOCALIP2=127.0.0.2
    DNSCRYPT_LOCALPORT=40

![DNSCrypt Configuration](http://blog.linoxide.com/wp-content/uploads/2015/08/DNSCryptConfiguration.png)

保存并退出。

2、 现在你用 nano 编辑器编辑“/etc/unbound/”下 unbound 的配置文件：

    $ nano /etc/unbound/unbound.conf

3、 在脚本最后添加下面的行：

    do-not-query-localhost: no
    forward-zone:
    name: "."
    forward-addr: 127.0.0.1@40

确保**forward-addr**和DNSCrypt中的“**DNSCRYPT_LOCALPORT**”一致。如你所见，用的是**40**端口。

![Unbound Configuration](http://blog.linoxide.com/wp-content/uploads/2015/08/UnboundConfiguration.png)

接着保存并退出。

### 第六步 - 运行 DNSCrypt 和 Unbound，接着添加到开机启动中 ###

请用 root 权限运行 DNSCrypt 和 unbound，你可以用 systemctl 命令来运行：

    $ sudo systemctl start dnscrypt-proxy unbound

将服务添加到启动中。你可以运行“systemctl enable”：

    $ sudo systemctl enable dnscrypt-proxy unbound

命令将会创建软链接到“/usr/lib/systemd/system/”目录的服务。

### 第七步 - 配置 resolv.conf 并重启所有服务 ###

resolv.conf 是一个在 linux 中用于配置 DNS 解析器的文件。它是一个由管理员创建的纯文本，因此你必须用 root 权限编辑并让它不能被其他人修改。

用 nano 编辑器编辑：

    $ nano /etc/resolv.conf

并添加本地IP “**127.0.0.1**”。现在用“chattr”命令使他只读：

    $ chattr +i /etc/resolv.conf

注意：

如果你想要重新编辑，用“chattr -i /etc/resolv.conf”加入写权限。

现在你需要重启 DNSCrypt 和 unbound 和网络；

    $ sudo systemctl restart dnscrypt-proxy unbound netctl

如果你看到错误，检查配置文件。

### 测试 ###

1、 测试 DNSCrypt

你可以通过 https://dnsleaktest.com/ 来确认 DNSCrypt，点击“标准测试”或者“扩展测试”，然后等待程序运行结束。

现在你可以看到 DNSCrypt.eu 就已经与作为 DNS 提供商的 DNSCrypt 协同工作了。

![Testing DNSCrypt](http://blog.linoxide.com/wp-content/uploads/2015/08/TestingDNSCrypt.png)


2、 测试 Unbound

现在你应该确保 unbound 可以正确地与“dig”和“drill”命令一起工作。

这是 dig 命令的结果：

    $ dig linoxide.com

我们现在看下结果，“Query time”是“533 msec”：

    ;; Query time: 533 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Sun Aug 30 14:48:19 WIB 2015
    ;; MSG SIZE rcvd: 188

再次输入命令，我们看到“Query time”是“0 msec”。

    ;; Query time: 0 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Sun Aug 30 14:51:05 WIB 2015
    ;; MSG SIZE rcvd: 188

![Unbound Test](http://blog.linoxide.com/wp-content/uploads/2015/08/UnboundTest.png)

DNSCrypt 对 DNS 客户端和解析端之间的通讯加密做的很好，并且 Unbound 通过缓存让相同的请求在另一次请求同速度更快。

### 总结 ###

DNSCrypt 是一个可以加密 DNS 客户端和 DNS 解析器之间的数据流的协议。 DNSCrypt 可以在不同的操作系统上运行，无论是移动端或桌面端。选择 DNS 提供商还包括一些重要的事情，应选择那些提供 DNSSEC 同时没有日志的。Unbound 可被用作 DNS 缓存，从而加快解析过程，因为 Unbound 将请求缓存，那么接下来客户端请求相同的查询时，unbound 将从缓存中取出保存的值。 DNSCrypt 和 Unbound 是针对安全性和速度的一个强大的组合。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-dnscrypt-unbound-archlinux/

作者：[Arul][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
