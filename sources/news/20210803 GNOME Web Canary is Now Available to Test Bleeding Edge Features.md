[#]: subject: (GNOME Web Canary is Now Available to Test Bleeding Edge Features)
[#]: via: (https://news.itsfoss.com/gnome-web-canary/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (zd200572)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

GNOME Web Canary现在可用于测试前沿功能
======

Epiphany或[GNOME Web][1]是一个Linux发行版上最小且能干的浏览器，你会发现它是elementary OS的默认浏览器。

使用GNOME40，Epiphany浏览器有一些[改进和新增功能][2]。

在幕后，经常有许多令人兴奋的提升和新增特性。因此，你可以选择面向早期测试者的技术预览版。

现在，一个新的Canary版本发布了，你可以使用来测试甚至在技术预览版中没有的特性。

### GNOME Web Canary版本

![][3]

GNOME Web的“Canary”版本让你测试甚至没有出现地最新[WebKitGTK][4]版本的特性。

注意Canary版本可能相当不稳定，甚至稳定性比开发者技术预览版更差。

可是，使用Canary版本， 一个终端用户可以在早期开发过程中测试，帮助开发者发现灾难性bugs。

不只是终端用户早期测试，Canary版本还让GNOME Web开发者的工作更轻松。

他们不再需要为了实现和测试一个新特性，单独构建WebKitGTK。

尽管开发者有一个Flatpak SDK可以方便进行测试，但是这是一个费时的任务。

现在，没有了这个阻碍，开发节奏也可以提升。

### 怎样获得Canary版本?

首先，你需要使用下面命令远程添加WebKit SDK Flatpak:

```
flatpak --user remote-add --if-not-exists webkit https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
flatpak --user install https://nightly.gnome.org/repo/appstream/org.gnome.Epiphany.Canary.flatpakref
```

一旦完成，你就可以使用提供的[Flatpakref file][5]安装啦！

测试一个Canary版本让更多的用户有能力来帮助GNOME Web开发者的开发过程。所以，这绝对是一个很需要的新增功能，来促进GNOME Web浏览器的开发。

更多技术细节，你或许想看开发者中的一个写的[公告栏][6]。



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-web-canary/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[zd200572](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Web/
[2]: https://news.itsfoss.com/gnome-web-new-tab/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY0MiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://webkitgtk.org
[5]: https://nightly.gnome.org/repo/appstream/org.gnome.Epiphany.Canary.flatpakref
[6]: https://base-art.net/Articles/introducing-the-gnome-web-canary-flavor/
