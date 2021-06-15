[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12074-1.html)
[#]: subject: (How to install Microsoft TrueType Fonts on Ubuntu-based Distributions)
[#]: via: (https://itsfoss.com/install-microsoft-fonts-ubuntu/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/itsfoss/)

如何在基于 Ubuntu 的发行版上安装微软 TrueType 字体
======

如果你在 Linux 上用 LibreOffice 打开一些微软文档，你会发现字体看起来有一点不同。你也将注意到有些常用字体找不到，如 [Times New Roman][1]、Arial 等等。

不用担心。我将向你展示如何在 Ubuntu 上和其它基于 Ubuntu 的 Linux 发行版上安装这些字体。但是在此之前，让我告诉你为什么这些字体没有被默认安装。

### 为什么微软字体不被默认安装在 Linux 中？

![][2]

Times New Roman、Arial 等字体都是微软的，并且这些字体不是开源的。很多 Linux 发行版默认不提供专有软件，以避免授权问题。

这就是为什么在默认情况下 Ubuntu 和其它 Linux 发行版使用开源字体 “Liberation” 字体来替代微软字体的原因。[Red Hat][4] 创建 [Liberation 字体][3] 来代替 Arial、Arial Narrow、 Times New Roman 和 Courier New，因为这些字体的宽度一样。当你打开一个使用 Times New Roman 字体书写的文档时，会使用对应的 Liberation 字体来保持文档不被破坏。

不过，Liberation 字体与微软的字体并不是完全相同的，在一些情况下，你可能需要使用 Arial 或 Times New Roman。一个非常常见的情况是，在学校、大学和其他公共或私人机构中，微软的字体是唯一的选择。他们要求你使用这些字体之一来提交文档。

好在，你可以在 Ubuntu 和其它发行版上很容易地安装微软字体。以这种方式，你将增强 LibreOffice 的兼容性，并可以自由选择开源办公软件。

### 在基于 Ubuntu 的 Linux 发行版上安装微软字体

你可以自行下载字体，并[在 Ubuntu 中安装新的字体][5]。但是由于微软字体非常受欢迎（并且是免费提供的），所以 Ubuntu 提供了一种简单的方法来安装它们。

要知道尽管微软已经免费发布了其核心字体，在其它操作系统中使用该字体依然是受到限制的。在 Ubuntu 中安装微软字体前，你必须阅读并接受 EULA (最终用户许可协议) 。

这些字体 [可在 multiverse 存储库中获得，首先要确保启用它][6]：

```
sudo add-apt-repository multiverse
```

在此之后，你可以更新你的 Ubuntu 存储库缓存，并像这样安装微软字体：

```
sudo apt update && sudo apt install ttf-mscorefonts-installer
```

当微软的最终用户协议出现时，按 `tab` 键来选择 “OK” ，并按回车键。

![按 tab 键来高亮选择][7]

单击 “Yes” 来接受微软的协议：

![使用 tab 键来作出选择，并按回车键][8]

当安装完成后，你应该使用下面的命令来更新字体缓存：

```
sudo fc-cache -f -v
```

![][9]

如果你现在打开 LibreOffice ，你将看到微软 [TrueType 字体][10] 。

![][11]

如果意外地拒绝了许可协议，你可以使用这个命令来重新安装安装程序：

```
sudo apt install –reinstall ttf-mscorefonts-installer
```

微软的 TrueType 字体也可以通过 [Ubuntu Restricted Extras package][12] 获得，其包含用来播放 MP3 等文件的其它专有的多媒体编解码器。

> 不要轻视专有字体。
> 
> 你可能认为字体有什么大不了的呢？毕竟，它只是一款字体，而不是软件的一个关键部分，对吧？但是你知道，这些年来 [Netflix 为其使用的专有字体支付了数百万美元][13]吗？最后，他们创建了自己的自定义字体，这为他们节省了一大笔钱。

希望这个快速教程有用。更多的生产力教程即将上线，请在下面留下你的评论，了解更多信息请订阅我们的社交媒体！

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-microsoft-fonts-ubuntu/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Times_New_Roman
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/microsoft-fonts-ubuntu.png?ssl=1
[3]: https://en.wikipedia.org/wiki/Liberation_fonts
[4]: https://en.wikipedia.org/wiki/Red_Hat
[5]: https://itsfoss.com/install-fonts-ubuntu/
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://i1.wp.com/i.imgur.com/JoEJp5w.png?ssl=1
[8]: https://i0.wp.com/i.imgur.com/M8zTc7f.png?ssl=1
[9]: https://i0.wp.com/i.imgur.com/Cshle6S.png?ssl=1
[10]: https://en.wikipedia.org/wiki/TrueType
[11]: https://i1.wp.com/i.imgur.com/9oIu3oj.png?ssl=1
[12]: https://itsfoss.com/install-media-codecs-ubuntu/
[13]: https://thehustle.co/nextflix-sans-custom-font/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Dimitrios.jpg?ssl=1
