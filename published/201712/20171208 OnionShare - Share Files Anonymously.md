OnionShare：匿名共享文件
======

![](http://www.theitstuff.com/wp-content/uploads/2017/12/OnionShare-Share-Files-Anonymously.jpg)

在这个数字世界中，我们通过互联网使用 Dropbox、Mega、Google Drive 等不同云存储分享我们的媒体、文档和重要文件。但是每个云存储都有两个主要问题，一个是大小和另一个安全。习惯 Bit Torrent 之后，大小已经不是问题了，但安全性仍旧是。

你即使通过安全的云服务发送文件，该公司也会注意到这些文件，如果这些文件是保密的，政府甚至可以拿到它们。因此，为了克服这些问题，我们使用 OnionShare，如它的名字那样它使用洋葱网络也就是 Tor 来匿名分享文件给任何人。

### 如何使用 **OnionShare**？

首先下载 [OnionShare][1] 和 [Tor浏览器][2]。下载后安装它们。

[![install onionshare and tor browser][3]][3]

现在从开始菜单打开 OnionShare

[![onionshare share files anonymously][4]][4]

点击添加并添加一个文件/文件夹共享。

点击开始分享。它会产生一个 .onion 网址，你可以与你的收件人分享这个网址。

[![share file with onionshare anonymously][5]][5]

从 URL 下载文件，复制 URL 并打开 Tor 浏览器并粘贴。打开 URL 并下载文件/文件夹。

[![receive file with onionshare anonymously][6]][6]

### OnionShare 的起源

几年前，Glenn Greenwald 发现他从 Edward Snowden 收到的一些 NSA 的文件已经被损坏。但他需要该文件，并决定通过使用 USB 获取那些文件。这并不成功。

在阅读了 Greenwald 写的书后，The Intercept 的安全专家 Micah Lee 发布了 OnionShare —— 一个简单的免费软件，可以匿名和安全地共享文件。他创建了一个程序，通过一个被匿名软件 Tor 加密和保护的直接通道来分享大型数据转储，使窃取者难以获取文件。

### OnionShare 如何工作？

OnionShare 在 127.0.0.1 上启动了一个 Web 服务器，用于在随机端口上共享文件。它从有 6880 个单词的单词列表中选择任意两个单词，称为 slug。它使服务器可以作为 Tor 洋葱服务发送文件。最终的 URL 看起来像这样：

```
http://qx2d7lctsnqwfdxh.onion/subside-durable
```

OnionShare 在下载后关闭。有一个选项允许多次下载文件。这使得该文件在互联网上不能再次得到。

### 使用 OnionShare 好处

其他网站或程序可以访问你的文件：发件人使用 OnionShare 共享的文件不存储在任何服务器上。它直接托管在发件人的系统上。

没有人可以窥探共享文件：由于用户之间的连接是由洋葱服务和 Tor 浏览器加密的。这使得连接安全，很难窃取文件。

用户双方都是匿名的：OnionShare 和 Tor 浏览器使发件人和收件人匿名。

### 结论

在这篇文章中，我已经解释了如何**匿名分享你的文档、文件**。我也解释了它是如何工作的。希望你了解 OnionShare 是如何工作的，如果你对任何事情仍有疑问，只需留言。


--------------------------------------------------------------------------------

via: https://www.theitstuff.com/onionshare-share-files-anonymously-2

作者：[Anirudh Rayapeddi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.theitstuff.com
[1]:https://onionshare.org/
[2]:https://www.torproject.org/projects/torbrowser.html.en
[3]:http://www.theitstuff.com/wp-content/uploads/2017/12/Icons.png
[4]:http://www.theitstuff.com/wp-content/uploads/2017/12/Onion-Share.png
[5]:http://www.theitstuff.com/wp-content/uploads/2017/12/With-Link.png
[6]:http://www.theitstuff.com/wp-content/uploads/2017/12/Tor.png
