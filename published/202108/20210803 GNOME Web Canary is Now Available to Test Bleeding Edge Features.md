[#]: subject: (GNOME Web Canary is Now Available to Test Bleeding Edge Features)
[#]: via: (https://news.itsfoss.com/gnome-web-canary/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (zd200572)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13683-1.html)

使用 GNOME Web 的 Canary 版本测试前沿功能
======

> 如果你想测试高度不稳定的 GNOME Web 浏览器的前沿功能，Canary 版本就是为了这个。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/gnome-web-canary.png?w=1200&ssl=1)

Epiphany（或称 [GNOME Web][1]）是一个 Linux 发行版上精简而功能强大的浏览器，你会发现它也是 elementary OS 的默认浏览器。

随同 GNOME 40 发布的 Epiphany 浏览器有一些 [改进和新增功能][2]。

而在幕后，经常有许多令人兴奋的提升和新增特性。因此，你可以选择为早期测试人员量身定制的 GNOME Web 技术预览版。

现在，它发布了一个新的 Canary 版本，你可以使用它来测试甚至在技术预览版中都没有的特性。

### GNOME Web Canary 版本

![][3]

GNOME Web 的 Canary 版本允许你测试甚至没有出现在最新 [WebKitGTK][4] 版本中的特性。

注意 Canary 版本应该是极其不稳定的，甚至稳定性比开发者技术预览版更差。

可是，使用 Canary 版本，终端用户可以在开发过程中的早期进行测试，帮助开发者发现灾难性 bug。

不只是终端用户的早期测试，Canary 版本还让 GNOME Web 的开发者的工作更轻松。

他们不再需要为了实现和测试一个新特性，来单独构建 WebKitGTK。

尽管开发者有一个 Flatpak SDK 可以简化开发人员的流程，但是这仍然是一项耗时的任务。

现在，没有了这个阻碍，开发速度也有可能提升。

### 怎样获得 Canary 版本?

首先，你需要使用以下命令添加 WebKit SDK Flatpak 远端仓库:

```
flatpak --user remote-add --if-not-exists webkit https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
flatpak --user install https://nightly.gnome.org/repo/appstream/org.gnome.Epiphany.Canary.flatpakref
```

完成后，你就可以使用提供的 [Flatpakref 文件][5] 安装啦！

测试 Canary 版本可以让更多的用户能够在此过程中帮助 GNOME Web 的开发人员。所以，这绝对是改进 GNOME Web 浏览器开发的急需补充。

更多技术细节，你可能需要看这位开发者发布的 [公告][6]。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-web-canary/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[zd200572](https://github.com/zd200572)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Web/
[2]: https://news.itsfoss.com/gnome-web-new-tab/
[3]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/Epiphany-Canary.png?w=940&ssl=1
[4]: https://webkitgtk.org
[5]: https://nightly.gnome.org/repo/appstream/org.gnome.Epiphany.Canary.flatpakref
[6]: https://base-art.net/Articles/introducing-the-gnome-web-canary-flavor/
