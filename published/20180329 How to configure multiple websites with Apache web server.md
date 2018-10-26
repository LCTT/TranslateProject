如何使用 Apache Web 服务器配置多个站点
=====

> 如何在流行而强大的 Apache Web 服务器上托管两个或多个站点。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/apache-feathers.jpg?itok=fnrpsu3G)

在我的[上一篇文章][1]中，我解释了如何为单个站点配置 Apache Web 服务器，事实证明这很容易。在这篇文章中，我将向你展示如何使用单个 Apache 实例来服务多个站点。

注意：我写这篇文章的环境是 Fedora 27 虚拟机，配置了 Apache 2.4.29。如果你用另一个发行版或不同的 Fedora 版本，那么你使用的命令以及配置文件的位置和内容可能会有所不同。

正如我之前的文章中提到的，Apache 的所有配置文件都位于 `/etc/httpd/conf` 和 `/etc/httpd/conf.d`。默认情况下，站点的数据位于 `/var/www` 中。对于多个站点，你需要提供多个位置，每个位置对应托管的站点。

### 基于名称的虚拟主机

使用基于名称的虚拟主机，你可以为多个站点使用一个 IP 地址。现代 Web 服务器，包括 Apache，使用指定 URL 的 `hostname` 部分来确定哪个虚拟 Web 主机响应页面请求。这仅仅需要比一个站点更多的配置。

即使你只从单个站点开始，我也建议你将其设置为虚拟主机，这样可以在以后更轻松地添加更多站点。在本文中，我将从上一篇文章中我们停止的地方开始，因此你需要设置原来的站点，即基于名称的虚拟站点。

### 准备原来的站点

在设置第二个站点之前，你需要为现有网站提供基于名称的虚拟主机。如果你现在没有站点，[请返回并立即创建一个][1]。

一旦你有了站点，将以下内容添加到 `/etc/httpd/conf/httpd.conf` 配置文件的底部（添加此内容是你需要对 `httpd.conf` 文件进行的唯一更改）：

```
<VirtualHost 127.0.0.1:80>
    DocumentRoot /var/www/html
    ServerName www.site1.org
</VirtualHost>
```

这将是第一个虚拟主机配置节，它应该保持为第一个，以使其成为默认定义。这意味着通过 IP 地址或解析为此 IP 地址但没有特定命名主机配置节的其它名称对服务器的 HTTP 访问将定向到此虚拟主机。所有其它虚拟主机配置节都应跟在此节之后。

你还需要使用 `/etc/hosts` 中的条目设置你的网站以提供名称解析。上次，我们只使用了 `localhost` 的 IP 地址。通常，这可以使用你使用的任何名称服务来完成，例如 Google 或 Godaddy。对于你的测试网站，通过在 `/etc/hosts` 中的 `localhost` 行添加一个新名称来完成此操作。添加两个网站的条目，方便你以后不需再次编辑此文件。结果如下：

```
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 www.site1.org www.site2.org
```

让我们将 `/var/www/html/index.html` 文件改变得更加明显一点。它应该看起来像这样（带有一些额外的文本来识别这是站点 1）：

```
<h1>Hello World</h1>

Web site 1.
```

重新启动 HTTPD 服务器，已启用对 `httpd` 配置的更改。然后，你可以从命令行使用 Lynx 文本模式查看网站。

```
[root@testvm1 ~]# systemctl restart httpd
[root@testvm1 ~]# lynx www.site1.org

                                              Hello World 
  Web site 1.
<snip>
Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.
Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.
H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list
```

你可以看到原始网站的修改内容，没有明显的错误，先按下 `Q` 键，然后按 `Y` 退出 Lynx Web 浏览器。

### 配置第二个站点

现在你已经准备好建立第二个网站。使用以下命令创建新的网站目录结构：

```
[root@testvm1 html]# mkdir -p /var/www/html2
```

注意，第二个站点只是第二个 `html` 目录，与第一个站点位于同一 `/var/www` 目录下。

现在创建一个新的索引文件 `/var/www/html2/index.html`，其中包含以下内容（此索引文件稍有不同，以区别于原来的网站）：

```
<h1>Hello World -- Again</h1>

Web site 2.
```

在 `httpd.conf` 中为第二个站点创建一个新的配置节，并将其放在上一个虚拟主机配置节下面（这两个应该看起来非常相似）。此节告诉 Web 服务器在哪里可以找到第二个站点的 HTML 文件。

```
<VirtualHost 127.0.0.1:80>
    DocumentRoot /var/www/html2
    ServerName www.site2.org
</VirtualHost>
```

重启 HTTPD，并使用 Lynx 来查看结果。

```
[root@testvm1 httpd]# systemctl restart httpd
[root@testvm1 httpd]# lynx www.site2.org

                                    Hello World -- Again

   Web site 2.

<snip>
Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.
Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.
H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list

```

在这里，我压缩了输出结果以适应这个空间。页面的差异表明这是第二个站点。要同时显示两个站点，请打开另一个终端会话并使用 Lynx Web 浏览器查看另一个站点。

### 其他考虑

这个简单的例子展示了如何使用 Apache HTTPD 服务器的单个实例来服务于两个站点。当考虑其他因素时，配置虚拟主机会变得有点复杂。

例如，你可能希望为这些网站中的一个或全部使用一些 CGI 脚本。为此，你可能为 CGI 程序在 `/var/www` 目录下创建一些目录：`/var/www/cgi-bin` 和 `/var/www/cgi-bin2`，以与 HTML 目录命名一致。然后，你需要将配置指令添加到虚拟主机节，以指定 CGI 脚本的目录位置。每个站点可以有下载文件的目录。这还需要相应虚拟主机节中的条目。

[Apache 网站][2]描述了管理多个站点的其他方法，以及从性能调优到安全性的配置选项。

Apache 是一个强大的 Web 服务器，可以用来管理从简单到高度复杂的网站。尽管其总体市场份额在缩小，但它仍然是互联网上最常用的 HTTPD 服务器。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/configuring-multiple-web-sites-apache

作者：[David Both][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://linux.cn/article-9506-1.html
[2]:https://httpd.apache.org/docs/2.4/
