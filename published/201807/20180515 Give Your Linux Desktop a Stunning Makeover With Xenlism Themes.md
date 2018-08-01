使用 Xenlism 主题对你的 Linux 桌面进行令人惊叹的改造
============================================================

> 简介：Xenlism 主题包提供了一个美观的 GTK 主题、彩色图标和简约的壁纸，将你的 Linux 桌面转变为引人注目的操作系统。

除非我找到一些非常棒的东西，否则我不会每天都把整篇文章献给一个主题。我曾经经常发布主题和图标。但最近，我更喜欢列出[最佳 GTK 主题][6]和图标主题。这对我和你来说都更方便，你可以在一个地方看到许多美丽的主题。

在 [Pop OS 主题][7]套件之后，Xenlism 是另一个让我对它的外观感到震惊的主题。

![Xenlism GTK theme for Ubuntu and Other Linux](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/xenlishm-minimalism-gtk-theme-800x450.jpeg)

Xenlism GTK 主题基于 Arc 主题，其得益于许多主题的灵感。GTK 主题提供类似于 macOS 的 Windows 按钮，我既不特别喜欢，也没有特别不喜欢。GTK 主题采用扁平、简约的布局，我喜欢这样。

Xenlism 套件中有两个图标主题。Xenlism Wildfire 是以前的，已经进入我们的[最佳图标主题][8]列表。

![Beautiful Xenlism Wildfire theme for Ubuntu and Other Linux](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/xenlism-wildfire-theme-800x450.jpeg)

*Xenlism Wildfire 图标*

Xenlsim Storm 是一个相对较新的图标主题，但同样美观。

![Beautiful Xenlism Storm theme for Ubuntu and Other Linux](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/xenlism-storm-theme-1-800x450.jpeg)

*Xenlism Storm 图标*

Xenlism 主题在 GPL 许可下开源。

### 如何在 Ubuntu 18.04 上安装 Xenlism 主题包

Xenlism 开发提供了一种通过 PPA 安装主题包的更简单方法。尽管 PPA 可用于 Ubuntu 16.04，但我发现 GTK 主题不适用于 Unity。它适用于 Ubuntu 18.04 中的 GNOME 桌面。

打开终端（`Ctrl+Alt+T`）并逐个使用以下命令：

```
sudo add-apt-repository ppa:xenatt/xenlism
sudo apt update
```

该 PPA 提供四个包：

*   xenlism-finewalls：一组壁纸，可直接在 Ubuntu 的壁纸中使用。截图中使用了其中一个壁纸。
*   xenlism-minimalism-theme：GTK 主题
*   xenlism-storm：一个图标主题（见前面的截图）
*   xenlism-wildfire-icon-theme：具有多种颜色变化的另一个图标主题（文件夹颜色在变体中更改）

你可以自己决定要安装的主题组件。就个人而言，我认为安装所有组件没有任何损害。

```
sudo apt install xenlism-minimalism-theme xenlism-storm-icon-theme xenlism-wildfire-icon-theme xenlism-finewalls
```

你可以使用 GNOME Tweaks 来更改主题和图标。如果你不熟悉该过程，我建议你阅读本教程以学习[如何在 Ubuntu 18.04 GNOME 中安装主题][9]。

### 在其他 Linux 发行版中获取 Xenlism 主题

你也可以在其他 Linux 发行版上安装 Xenlism 主题。各种 Linux 发行版的安装说明可在其网站上找到：

[安装 Xenlism 主题][10]

### 你怎么看？

我知道不是每个人都会同意我，但我喜欢这个主题。我想你将来会在 It's FOSS 的教程中会看到 Xenlism 主题的截图。

你喜欢 Xenlism 主题吗？如果不喜欢，你最喜欢什么主题？在下面的评论部分分享你的意见。

### 关于作者

我是一名专业软件开发人员，也是 It's FOSS 的创始人。我是一名狂热的 Linux 爱好者和开源爱好者。我使用 Ubuntu 并相信分享知识。除了Linux，我喜欢经典侦探之谜。我是 Agatha Christie 作品的忠实粉丝。

--------------------------------------------------------------------------------

via: https://itsfoss.com/xenlism-theme/

作者：[Abhishek Prakash][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/author/abhishek/
[2]:https://itsfoss.com/xenlism-theme/#comments
[3]:https://itsfoss.com/category/desktop/
[4]:https://itsfoss.com/tag/themes/
[5]:https://itsfoss.com/tag/xenlism/
[6]:https://itsfoss.com/best-gtk-themes/
[7]:https://itsfoss.com/pop-icon-gtk-theme-ubuntu/
[8]:https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[9]:https://itsfoss.com/install-themes-ubuntu/
[10]:http://xenlism.github.io/minimalism/#install
