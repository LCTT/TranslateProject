如何在Arch Linux中安装DNSCrypt和Unbound
================================================================================
**DNSCrypt**是一个用于加密和验证的DNS客户端和一个DNS解析器之间通信的协议。阻止DNS欺骗或中间人攻击。 DNSCrypt可用于大多数的操作系统，包括Linux，Windows，MacOSX的Android和iOS。而在本教程中我使用的是内核为4.1的archlinux。

Unbound是用来解析收到的任意DNS查询的DNS缓存服务器。如果用户请求一个新的查询，然后unbound将其存储到缓存中，并且当用户再次请求相同的请求时，unbound将采用已经保存的缓存。这将是第一次请求查询更快。

现在我将尝试安装“DNSCrypt”，以确保DNS的通信的安全，并用“Unbound”加速。

### 第一步 - 安装yaourt ###

Yaourt是AUR（ARCH用户仓库）的辅助，使用户能够很容易地从AUR安装程序。 Yaourt和pacman一样使用相同的语法，这样你就可以使用yaourt安装该程序。下面是安装yaourt的简单方法：

1. 用nano或者vi编辑arch仓库配置文件，保存在“/etc/pacman.conf”中。

    $ nano /etc/pacman.conf

2. 在底部填上你的yaourt仓库，粘贴下面的脚本：

    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch

3. 用“"Ctrl + x”，接着用“Y”保存。

4. 接着升级仓库数据库并用pacman安装yaourt： 

    $ sudo pacman -Sy yaourt

### 第二步 - 安装 DNSCrypt和Unbound ###

DNSCrypt和unbound就在archlinux仓库中，你可以用下面的pacman命令安装：

    $ sudo pacman -S dnscrypt-proxy unbound

接着在安装的过程中按下“Y”。

###  第三步 - 安装 dnscrypt-autoinstall ###

Dnscrypt-autoinstall是一个自动在基于Linux的系统上安装和配置DNSCrypt的脚本。DNSCrypt在AUR中，因此你必须使用“yaourt”命令来安装它。

    $ yaourt -S dnscrypt-autoinstall

注意 :

-S = 这和pacman -S安装程序一样。

### 第四步 - 运行dnscrypt-autoinstall ###

用root权限运行“dnscrypt-autoinstall”开自动配置DNSCrypt。

    $ sudo dnscrypt-autoinstall

下一步中输入“回车”，接着输入"Y"来选择你想使用的DNS提供者，我这里使用不带日志和DNSSEC的DNSCrypt.eu。

![DNSCrypt autoinstall](http://blog.linoxide.com/wp-content/uploads/2015/08/DNSCrypt-autoinstall.png)

### 第五步 - 配置DNSCrypt和Unbound ###

1. 打开dnscrypt的“/etc/conf.d/dnscrypt-config” 配置文件中“DNSCRYPT_LOCALIP”指向**本地ip**，“DNSCRYPT_LOCALPORT”根据你本人的意愿配置，我是用的是**40**端口。

    $ nano /etc/conf.d/dnscrypt-config

    DNSCRYPT_LOCALIP=127.0.0.1
    DNSCRYPT_LOCALIP2=127.0.0.2
    DNSCRYPT_LOCALPORT=40

![DNSCrypt Configuration](http://blog.linoxide.com/wp-content/uploads/2015/08/DNSCryptConfiguration.png)

保存并退出。

2. 现在你用nanao编辑器编辑“/etc/unbound/”下unbound的配置文件：

    $ nano /etc/unbound/unbound.conf

3. 在脚本最后添加下面的行：

    do-not-query-localhost: no
    forward-zone:
    name: "."
    forward-addr: 127.0.0.1@40

确保**forward-addr**和DNSCrypt中的“**DNSCRYPT_LOCALPORT**”一致。你看见我是用的是**40**端口。

![Unbound Configuration](http://blog.linoxide.com/wp-content/uploads/2015/08/UnboundConfiguration.png)

接着保存并退出。

### 第六步 - 运行DNSCrypt和Unbound，接着添加到开机启动中 ###

请用root权限运行DNSCrypt和unbound，你可以用systemctl命令来运行：

    $ sudo systemctl start dnscrypt-proxy unbound

将服务添加到启动中。你可以运行“systemctl enable”：

    $ sudo systemctl enable dnscrypt-proxy unbound

命令将会创建软链接到“/usr/lib/systemd/system/”目录的服务。

### 第七步 - 配置resolv.conf并重启所有服务 ###

resolv.conf是一个在linux中用于配置DNS解析器的文件。它是一个由管理员创建的纯文本，因此你必须用root权限编辑并让它不能被其他人修改。

用nano编辑器编辑：

    $ nano /etc/resolv.conf

并添加本地IP “**127.0.0.1**”，现在用“chattr”命令使他只读：

    $ chattr +i /etc/resolv.conf

注意：

如果你想要重新编辑，用“chattr -i /etc/resolv.conf”加入写权限。

现在你需要重启DNSCrypt和unbound和网络；

    $ sudo systemctl restart dnscrypt-proxy unbound netctl

如果你看到错误，检查配置文件。

### 测试 ###

1. 测试DNSCrypt

你可以通过https://dnsleaktest.com/来确认DNSCrypt，点击“开始测试”或者“扩展测试”，并在程序运行期间等待。

现在你可以看到NSCrypt.eu就已经与作为DNS提供商的DNSCrypt协同工作了。

![Testing DNSCrypt](http://blog.linoxide.com/wp-content/uploads/2015/08/TestingDNSCrypt.png)


2. 测试 Unbound

现在你应该确保unbound可以正确地与“dig”和“drill”命令一起工作。

这是dig命令的结果：

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

DNSCrypt加密通信在DNS客户端和解析端工作的很好，并且Unbound通过缓存让相同的请求在另一次请求同速度更快。

### 总结 ###

DNSCrypt是一个可以加密DNS客户端和DNS解析器之间的数据流的协议。 DNSCrypt可以在不同的操作系统上运行，无论是移动端或桌面端。选择DNS提供商还包括一些重要的事情，选择那些提供DNSSEC同时没有日志的。Unbound可被用作DNS缓存，从而加快解析过程，因为Unbound将请求缓存，那么接下来客户端请求相同的查询时，unbound将从缓存中取出保存的值。 DNSCrypt和Unbound是针对安全性和速度的一个强大的组合。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-dnscrypt-unbound-archlinux/

作者：[Arul][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
