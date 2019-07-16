如何禁用 Ubuntu 服务器中终端欢迎消息中的广告
======

如果你正在使用最新的 Ubuntu 服务器版本，你可能已经注意到欢迎消息中有一些与 Ubuntu 服务器平台无关的促销链接。你可能已经知道 **MOTD**，即 **M**essage **O**f **T**he **D**ay 的开头首字母，在 Linux 系统每次登录时都会显示欢迎信息。通常，欢迎消息包含操作系统版本，基本系统信息，官方文档链接以及有关最新安全更新等的链接。这些是我们每次通过 SSH 或本地登录时通常会看到的内容。但是，最近在终端欢迎消息中出现了一些其他链接。我已经几次注意到这些链接，但我并在意，也从未点击过。以下是我的 Ubuntu 18.04 LTS 服务器上显示的终端欢迎消息。

![](http://www.ostechnix.com/wp-content/uploads/2018/08/Ubuntu-Terminal-welcome-message.png)

正如你在上面截图中所看到的，欢迎消息中有一个 bit.ly 链接和 Ubuntu wiki 链接。有些人可能会惊讶并想知道这是什么。其实欢迎信息中的链接无需担心。它可能看起来像广告，但并不是商业广告。链接实际上指向到了 [Ubuntu 官方博客][1] 和 [Ubuntu wiki][2]。正如我之前所说，其中的一个链接是不相关的，没有任何与 Ubuntu 服务器相关的细节，这就是为什么我开头称它们为广告。

虽然我们大多数人都不会访问 bit.ly 链接，但是有些人可能出于好奇去访问这些链接，结果失望地发现它只是指向一个外部链接。你可以使用任何 URL 去短网址服务，例如 unshorten.it，在访问真正链接之前，查看它会指向哪里。或者，你只需在 bit.ly 链接的末尾输入加号（`+`）即可查看它们的实际位置以及有关链接的一些统计信息。

![](http://www.ostechnix.com/wp-content/uploads/2018/08/shortlink.png)

### 什么是 MOTD 以及它是如何工作的？

2009 年，来自 Canonical 的 Dustin Kirkland 在 Ubuntu 中引入了 MOTD 的概念。它是一个灵活的框架，使管理员或发行包能够在 `/etc/update-motd.d/` 位置添加可执行脚本，目的是生成在登录时显示有益的、有趣的消息。它最初是为 Landscape（Canonical 的商业服务）实现的，但是其它发行版维护者发现它很有用，并且在他们自己的发行版中也采用了这个特性。

如果你在 Ubuntu 系统中查看 `/etc/update-motd.d/`，你会看到一组脚本。一个是打印通用的 “欢迎” 横幅。下一个打印 3 个链接，显示在哪里可以找到操作系统的帮助。另一个计算并显示本地系统包可以更新的数量。另一个脚本告诉你是否需要重新启动等等。

从 Ubuntu 17.04 起，开发人员添加了 `/etc/update-motd.d/50-motd-news`，这是一个脚本用来在欢迎消息中包含一些附加信息。这些附加信息是：

 1. 重要的关键信息，例如 ShellShock、Heartbleed 等
 2. 生命周期（EOL）消息，新功能可用性等
 3. 在 Ubuntu 官方博客和其他有关 Ubuntu 的新闻中发布的一些有趣且有益的帖子

另一个特点是异步，启动后约 60 秒，systemd 计时器运行 `/etc/update-motd.d/50-motd-news –force` 脚本。它提供了 `/etc/default/motd-news` 脚本中定义的 3 个配置变量。默认值为：`ENABLED=1, URLS="https://motd.ubuntu.com", WAIT="5"`。

以下是 `/etc/default/motd-news` 文件的内容：

```
$ cat /etc/default/motd-news
# Enable/disable the dynamic MOTD news service
# This is a useful way to provide dynamic, informative
# information pertinent to the users and administrators
# of the local system
ENABLED=1

# Configure the source of dynamic MOTD news
# White space separated list of 0 to many news services
# For security reasons, these must be https
# and have a valid certificate
# Canonical runs a service at motd.ubuntu.com, and you
# can easily run one too
URLS="https://motd.ubuntu.com"

# Specify the time in seconds, you're willing to wait for
# dynamic MOTD news
# Note that news messages are fetched in the background by
# a systemd timer, so this should never block boot or login
WAIT=5
```

好事情是 MOTD 是完全可定制的，所以你可以彻底禁用它（`ENABLED=0`）、根据你的意愿更改或添加脚本、以秒为单位更改等待时间等等。

如果启用了 MOTD，那么 systemd 计时器作业将循环遍历每个 URL，将它们的内容缩减到每行 80 个字符、最多 10 行，并将它们连接到 `/var/cache/motd-news` 中的缓存文件。此 systemd 计时器作业将每隔 12 小时运行并更新 `/var/cache/motd-news`。用户登录后，`/var/cache/motd-news` 的内容会打印到屏幕上。这就是 MOTD 的工作原理。

此外，`/etc/update-motd.d/50-motd-news` 文件中包含自定义的用户代理字符串，以报告有关计算机的信息。如果你查看 `/etc/update-motd.d/50-motd-news` 文件，你会看到：

```
# Piece together the user agent
USER_AGENT="curl/$curl_ver $lsb $platform $cpu $uptime"
```

这意味着，MOTD 检索器将向 Canonical 报告你的操作系统版本、硬件平台、CPU 类型和正常运行时间。

到这里，希望你对 MOTD 有了一个基本的了解。

现在让我们回到主题，我不想要这个功能。我该如何禁用它？如果欢迎消息中的促销链接仍然困扰你，并且你想永久禁用它们，则可以通过以下方法快速禁用它。

### 在 Ubuntu 服务器中禁用终端欢迎消息中的广告

要禁用这些广告，编辑文件：

```
$ sudo vi /etc/default/motd-news
```

找到以下行并将其值设置为 `0`（零）。

```
[...]
ENABLED=0
[...]
```

保存并关闭文件。现在，重新启动系统，看看欢迎消息是否仍然显示来自 Ubuntu 博客的链接。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Ubuntu-Terminal-welcome-message-1.png)

看到没？现在没有来自 Ubuntu 博客和 Ubuntu wiki 的链接。

这就是全部内容了。希望这对你有所帮助。更多好东西要来了，敬请关注！

顺祝时祺！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-disable-ads-in-terminal-welcome-message-in-ubuntu-server/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://blog.ubuntu.com/
[2]:https://wiki.ubuntu.com/
