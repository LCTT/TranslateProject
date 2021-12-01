[#]: subject: "Manage Flatpak Permissions Graphically With Flatseal"
[#]: via: "https://itsfoss.com/flatseal/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14034-1.html"

用 Flatseal 图形化管理 Flatpak 应用的权限
======

![](https://img.linux.net.cn/data/attachment/album/202111/30/135209fbcvqnvnzidvg2hw.jpg)

新版本的安卓系统让你对单个应用的访问和权限有了更精细的控制。这一点至关重要，因为许多应用曾经（正在）滥用系统权限。下载一个天气应用，它将要求访问你的通话记录，好像这与天气有什么关系一样。

为什么我在说安卓应用的权限？因为这可能与此应用的功能有关。

你可能已经知道 [什么是 Flatpak][1]。这些都是沙盒应用，可以选择访问系统资源，如文件存储、网络接口等。

就像 Android 一样，你可以控制 Flatpak 应用对系统资源的访问。默认情况下，这要用 [Flatpak 命令][2]，不是每个人都能适应它。

因此，有一个叫做 Flatseal 的小工具，可以让你在应用层面上管理和控制 Flatpak 的权限。

### Flatseal

![Flatseal][3]

[Flatseal][4] 是一个图形化的工具，用于审查和修改你的 Flatpak 应用的权限。这使得事情比通过命令要容易得多。

Flatseal 会列出所有已安装的 Flatpak 应用。当你选择一个应用，你可以看到所有的权限。很容易发现已启用的权限，如果你愿意，你可以禁用它。

例如，Ksnip 是一个屏幕截图工具，但它也有联网权限，可以用 Imgur 等在线服务分享截图。如果你不需要它，你可以禁用它。

![Control permissions of individual Flatpak apps][5]

如果不出意外，看看一个应用有什么样的权限是很有趣的。例如，你可以看到 ksnip 有在后台运行的能力（这样你就可以用键盘快捷键进行截图）。

![][6]

### 安装 Flatseal

既然管理的都是 Flatpak，那么 Flatseal 作为一个 Flatpak 包来使用也是合理的。

在 Fedora 上，如果已经添加 Flathub 仓库，你可以从软件中心安装它。

![Installing Flatseal from the software center][7]

否则，命令行总是可以帮助你。

```
flatpak install flathub com.github.tchx84.Flatseal
```

### 你真的需要控制权限吗？

这是一个主观的问题，完全取决于你。值得庆幸的是，到目前为止，桌面 Linux 应用并不像 Android 应用那样滥用权限。

一个普通用户通常不会去管这些事情，这完全没问题。

然而，如果你对这些事情过于谨慎，或者你找到一个很好的理由，Flatseal 提供了一个简单的选择。

你还应该小心你所改变的权限。如果你禁用了对应用的运作至关重要的权限，在使用应用时肯定会造成麻烦。

所以，总的来说，这不是一个普通用户要使用的东西。

--------------------------------------------------------------------------------

via: https://itsfoss.com/flatseal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-flatpak/
[2]: https://itsfoss.com/flatpak-guide/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatseal.png?resize=800%2C474&ssl=1
[4]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-permission-control-flatseal.png?resize=800%2C503&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-permissions-with-flatseal.png?resize=800%2C441&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-flatseal.png?resize=800%2C467&ssl=1
