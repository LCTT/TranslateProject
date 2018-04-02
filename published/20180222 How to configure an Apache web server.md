如何配置 Apache Web 服务器
==========

> 学习如何在 Apache 上托管你自己的网站，这是一个可靠、流行且易于配置的 Web 服务器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG)

我托管自己的网站已经有很多年了。自从 20 多年前从 OS/2 切换到 Linux 以来，我一直将 [Apache][1] 作为我的服务器软件。Apache 是可靠、流行的，且基本的安装配置也很容易。对于更复杂的设置（比如多个网站）也并不是那么困难。

Apache Web 服务器的安装和配置必须以 root 身份执行。 防火墙的配置也需要以 root 身份执行。 使用浏览器查看安装配置的结果应该以非 root 用户的身份完成。 (我在我的虚拟主机上使用 `student` 这个用户。)

### 安装

注意：我使用的实验环境是安装有 Fedora 27 的虚拟机，Apache 版本为 2.4.29。 如果您使用的是不同的发行版或不同版本的 Fedora，您的命令以及配置文件的位置和内容可能会有所不同。 但是，您需要修改的配置行是相同的。

Apache Web 服务器非常容易安装。 在我的 CentOS 6.x 服务器上，它只需要一个简单的 `yum` 命令。 它会安装所有必要的依赖（如果需要的话）。 我在我的 Fedora 虚拟机上使用了下面的 `dnf` 命令。 除了命令本身的名称之外， `dnf` 和 `yum` 的语法是相同的。

```
dnf -y install httpd
```

这个虚拟机是个非常基础的桌面环境，我正在使用它作为编写书籍的测试平台。 即使在这个系统上，也只安装了六个依赖项，用了一分钟。

Apache 的所有配置文件都位于 `/etc/httpd/conf` 和 `/etc/httpd/conf.d` 。网站的数据默认位于 `/var/www`，但如果你愿意，你可以改变它。

### 配置

Apache 主要的配置文件是 `/etc/httpd/conf/httpd.conf` 。 它包含许多在基本安装中不需要更改的配置。 实际上，只需对此文件进行一些更改即可启动并运行一个简单的网站。 该文件非常大，因此，我不会将这篇文章与大量不必要的东西混淆起来，而只会显示那些需要更改的指令。

首先，花点时间熟悉一下 `httpd.conf` 文件。我喜欢 Red Hat 的一个原因是它的配置文件注释非常的详细。 `httpd.conf` 文件也不例外，因为它有很好的注释。可以使用这些注释来了解文件的配置。

第一个要修改的是 `Listen` 配置项，它定义了 Apache 要监听页面请求的 IP 地址和端口。 现在，你只需要使这个网站可以从本地访问，所以使用 `localhost` 地址。 完成后，该行应该看起来像这样：( LCTT 译注：`localhost` 的 IP 地址是 `127.0.0.1`，`80` 是端口)

```
Listen 127.0.0.1:80
```

通过将此配置项设置为 `localhost`的 IP 地址，Apache 将只侦听来自本地主机的连接。 如果您希望 Web 服务器侦听来自远程主机的连接，则可以使用主机的外部 IP 地址。

`DocumentRoot` 配置项指定组成网站页面的 HTML 文件的位置。 该配置项不需要更改，因为它已经指向标准位置。 该行应该看起来像这样：

```
DocumentRoot "/var/www/html"
```

Apache 安装包会创建 `/var/www` 目录。 如果您想更改存储网站文件的位置，则使用此配置项来完成此操作。 例如，您可能想要为 `www` 目录使用不同的名称，以更明确地识别网站。 这可以是这样的：

```
DocumentRoot "/var/mywebsite/html"
```

这些是创建一个简单网站需要唯一修改的 Apache 配置项。 对于这个小练习，只对 `httpd.conf` 文件（`Listen` 配置项）进行了一些修改。 其它的配置项对于一个简单的 Web 服务器暂时无需配置。

另一个需要改变的地方是：在我们的防火墙中打开端口 80。 我使用 [iptables][2] 作为我的防火墙，因此我更改 `/etc/sysconfig/iptables` 文件以添加允许使用 HTTP 协议。 整个文件看起来像这样：

```
# sample configuration for iptables service
# you can edit this manually or use system-config-firewall
# please do not ask us to add additional ports/services to this default configuration
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
```

我在文件的倒数第三行上添加了一个新行，它允许在端口 `80` 上输入流量。现在我重新加载 iptables 配置文件。

```
[root@testvm1 ~]# cd /etc/sysconfig/ ; iptables-restore iptables
```

### 创建 index.html 文件

`index.html` 文件是你使用域名访问网站而不是访问特定网页时的默认文件。在 `/var/www/html`中，创建一个名字为 `index.html` 的文件，在其中添加字符串 `Hello World` 。你不需要添加任何的 HTML 标志去完成这项工作。web 服务器的唯一任务是提供文本数据流，服务器不知道数据是什么，也不知道如何呈现它。它只是将数据流传输给请求主机。

保存文件后，将所有权设置为 `apache.apache` 。

```
[root@testvm1 html]# chown apache.apache index.html
```

### 启动 Apache

Apache 很容易启动。 当前版本的 Fedora 使用 systemd 。 运行以下命令启动它，然后检查服务器的状态：（LCTT 译注：`systemctl` 是一个 systemd 工具）

```
[root@testvm1 ~]# systemctl start httpd
[root@testvm1 ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: active (running) since Thu 2018-02-08 13:18:54 EST; 5s ago
     Docs: man:httpd.service(8)
 Main PID: 27107 (httpd)
   Status: "Processing requests..."
    Tasks: 213 (limit: 4915)
   CGroup: /system.slice/httpd.service
           ├─27107 /usr/sbin/httpd -DFOREGROUND
           ├─27108 /usr/sbin/httpd -DFOREGROUND
           ├─27109 /usr/sbin/httpd -DFOREGROUND
           ├─27110 /usr/sbin/httpd -DFOREGROUND
           └─27111 /usr/sbin/httpd -DFOREGROUND

Feb 08 13:18:54 testvm1 systemd[1]: Starting The Apache HTTP Server...
Feb 08 13:18:54 testvm1 systemd[1]: Started The Apache HTTP Server.
```

您的服务器上的命令可能不同。在使用 SystemV 启动脚本的 Linux 系统上，命令如下：

```
[root@testvm1 ~]# service httpd start
Starting httpd: [Fri Feb 09 08:18:07 2018]          [  OK  ]
[root@testvm1 ~]# service httpd status
httpd (pid  14649) is running...
```

如果您的主机上有像 Firefox 或 Chrome 这样的浏览器，您可以在浏览器的 URL 行上使用 URL `localhost` 来显示您的 web 页面，尽管看起来很简单。您还可以使用像 [Lynx][3] 这样的文本模式 web 浏览器来查看 web 页面。首先，安装 Lynx (如果它还没有被安装)。

```
[root@testvm1 ~]# dnf -y install lynx
```

然后使用下面的命令来显示网页。

```
[root@testvm1 ~]# lynx localhost
```

结果在我的终端中是这样的。我已经删除了页面上的很多空白。

```
  Hello World

<snip>


Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.
  Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.
 H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list```

接下来，编辑您的 `index.html` 文件并添加一些 HTML 标记，使其看起来像这样：

```
<h1>Hello World</h1>
```

现在刷新浏览器。对于 Lynx，使用组合键 `Ctrl + R` 。 结果看起来有点不同。如果你的终端支持彩色的话文本是彩色显示的，Lynx 会显示标题，现在它处于居中状态。 在 GUI 浏览器中，文本将以大字体显示。

```
                                   Hello World

<snip>


Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.
  Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.
 H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list
```

### 后记

从这个小练习中可以看到，建立一个 Apache Web 服务器很容易。 具体情况取决于您的发行版和该发行版提供的 Apache 版本。 在我的环境中，这是一个非常简单的练习。

但不仅仅如此，因为 Apache 非常灵活强大。下个月，我将讨论使用单个 Apache 托管多个网站。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/how-configure-apache-web-server

作者：[David Both][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://httpd.apache.org/
[2]:https://en.wikipedia.org/wiki/Iptables
[3]:http://lynx.browser.org/
