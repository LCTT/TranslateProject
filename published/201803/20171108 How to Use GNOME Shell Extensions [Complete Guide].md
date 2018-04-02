如何使用 GNOME Shell 扩展
=====

> 简介：这是一份详细指南，我将会向你展示如何手动或通过浏览器轻松安装 GNOME Shell <ruby>扩展<rt>Extension</rt></ruby>。

在讨论 [如何在 Ubuntu 17.10 上安装主题][1] 一文时，我简要地提到了 GNOME Shell 扩展，它用来安装用户主题。今天，我们将详细介绍 Ubuntu 17.10 中的 GNOME Shell 扩展。

我可能会使用术语 GNOME 扩展而不是 GNOME Shell 扩展，但是这两者在这里具有相同的含义。

什么是 GNOME Shell 扩展？如何安装 GNOME Shell 扩展，以及如何管理和删除 GNOME Shell 扩展？我会一一解释所有的问题。

在此之前，如果你喜欢视频，我已经在 [FOSS 的 YouTube 频道][2] 上展示了所有的这些操作。我强烈建议你订阅它来获得更多有关 Linux 的视频。

### 什么是 GNOME Shell 扩展？

[GNOME Shell 扩展][3] 根本上来说是增强 GNOME 桌面功能的一小段代码。

把它看作是你的浏览器的一个附加组件。例如，你可以在浏览器中安装附加组件来禁用广告。这个附加组件是由第三方开发者开发的。虽然你的 Web 浏览器默认不提供此项功能，但安装此附加组件可增强你 Web 浏览器的功能。

同样， GNOME Shell 扩展就像那些可以安装在 GNOME 之上的第三方附加组件和插件。这些扩展程序是为执行特定任务而创建的，例如显示天气状况、网速等。大多数情况下，你可以在顶部面板中访问它们。

![GNOME Shell 扩展显示天气信息][5]

也有一些 GNOME 扩展在顶部面板上不可见，但它们仍然可以调整 GNOME 的行为。例如，有一个这样的扩展可以让鼠标中键来关闭应用程序。

### 安装 GNOME Shell 扩展

现在你知道了什么是 GNOME Shell 扩展，那么让我们来看看如何安装它吧。有三种方式可以使用 GNOME 扩展：

* 使用来自 Ubuntu （或你的 Linux 发行版）的最小扩展集
* 在 Web 浏览器中查找并安装扩展程序
* 下载并手动安装扩展

在你学习如何使用 GNOME Shell 扩展之前，你应该安装 GNOME Tweak Tool。你可以在软件中心找到它，或者你可以使用以下命令：

```
sudo apt install gnome-tweak-tool
```

有时候，你需要知道你正在使用的 GNOME Shell 的版本，这有助于你确定扩展是否与系统兼容。你可以使用下面的命令来找到它：

```
gnome-shell --version
```

#### 1. 使用 gnome-shell-extensions 包 [最简单最安全的方式]

Ubuntu（以及其他几个 Linux 发行版，如 Fedora ）提供了一个包，这个包有最小集合的 GNOME 扩展。由于 Linux 发行版经过测试，所以你不必担心兼容性问题。

如果你不想费神，你只需获得这个包，你就可以安装 8-10 个 GNOME 扩展。

```
sudo apt install gnome-shell-extensions
```

你将需要重新启动系统（或者重新启动 GNOME Shell，我具体忘了是哪个）。之后，启动 GNOME Tweaks，你会发现一些扩展自动安装了，你只需切换按钮即可开始使用已安装的扩展程序。

![Change GNOME Shell theme in Ubuntu 17.1][6]

#### 2. 从 Web 浏览器安装 GNOME Shell 扩展

GNOME 项目有一个专门用于扩展的网站，不干别的，你可以在这里找到并安装扩展，并管理它们，甚至不需要 GNOME Tweaks Tool。

- [GNOME Shell Extensions Website][3]

但是为了安装 Web 浏览器扩展，你需要两件东西：浏览器附加组件和本地主机连接器。

**步骤 1： 安装 浏览器附加组件**

当你访问 GNOME Shell 扩展网站时，你会看到如下消息：

> “要使用此站点控制 GNOME Shell 扩展，你必须安装由两部分组成的 GNOME Shell 集成：浏览器扩展和本地主机消息应用。”

![Installing GNOME Shell Extensions][7]

你只需在你的 Web 浏览器上点击建议的附加组件链接即可。你也可以从下面的链接安装它们：

- 对于 Google Chrome、Chromium 和 Vivaldi： [Chrome Web 商店][21]
- 对于 Firefox： [Mozilla Addons][22]
- 对于 Opera： [Opera Addons][23]

**步骤 2： 安装本地连接器**

仅仅安装浏览器附加组件并没有帮助。你仍然会看到如下错误：

> “尽管 GNOME Shell 集成扩展正在运行，但未检测到本地主机连接器。请参阅文档以获取有关安装连接器的信息。”

![How to install GNOME Shell Extensions][8]

这是因为你尚未安装主机连接器。要做到这一点，请使用以下命令：

```
sudo apt install chrome-gnome-shell
```

不要担心包名中的 “chrome” 前缀，它与 Chrome 无关，你无需再次安装 Firefox 或 Opera 的单独软件包。

**步骤 3： 在 Web 浏览器中安装 GNOME Shell 扩展**

一旦你完成了这两个要求，你就可以开始了。现在，你将看不到任何错误消息。

![GNOME Shell Extension][9]

一件好的做法是按照 GNOME Shell 版本对扩展进行排序，但这不是强制性的。这是因为开发人员是为其当前的 GNOME 版本创建的扩展。而在一年之内，会发布两个或更多 GNOME 发行版本，但开发人员没有时间（在新的 GNOME 版本上）测试或更新他/她的扩展。

因此，你不知道该扩展是否与你的系统兼容。尽管扩展已经存在很长一段时间了，但是有可能在最新的 GNOME Shell 版本中，它也能正常工作。同样它也有可能不工作。

你也可以去搜索扩展程序。假设你想要安装有关天气的扩展，只要搜索它并选择一个搜索结果即可。

当你访问扩展页面时，你会看到一个切换按钮。

![Installing GNOME Shell Extension ][10]

点击它，你会被提示是否要安装这个扩展：

![Install GNOME Shell Extensions via web browser][11]

显然，直接安装就好。安装完成后，你会看到切换按钮已打开，旁边有一个设置选项。你也可以使用设置选项配置扩展，也可以禁用扩展。

![Configuring installed GNOME Shell Extensions][12]

你也可以在 GNOME Tweaks Tool 中配置通过 Web 浏览器安装的扩展：

![GNOME Tweaks to handle GNOME Shell Extensions][13]

你可以在 GNOME 网站中 [已安装的扩展部分][14] 下查看所有已安装的扩展。

![Manage your installed GNOME Shell Extensions][15]

使用 GNOME 扩展网站的一个主要优点是你可以查看扩展是否有可用的更新，你不会在 GNOME Tweaks 或系统更新中得到更新（和提示）。

#### 3. 手动安装 GNOME Shell 扩展

你不需要始终在线才能安装 GNOME Shell 扩展，你可以下载文件并稍后安装，这样就不必使用互联网了。

去 GNOME 扩展网站下载最新版本的扩展。

![Download GNOME Shell Extension][16]

解压下载的文件，将该文件夹复制到 `~/.local/share/gnome-shell/extensions` 目录。到主目录下并按 `Ctrl+H` 显示隐藏的文件夹，在这里找到 `.local` 文件夹，你可以找到你的路径，直至 `extensions` 目录。

一旦你将文件复制到正确的目录后，进入它并打开 `metadata.json` 文件，寻找 `uuid` 的值。

确保该扩展的文件夹名称与 `metadata.json` 中的 `uuid` 值相同。如果不相同，请将目录重命名为 `uuid` 的值。

![Manually install GNOME Shell extension][17]

差不多了！现在重新启动 GNOME Shell。 按 `Alt+F2` 并输入 `r` 重新启动  GNOME Shell。

![Restart GNOME Shell][18]

同样重新启动 GNOME Tweaks Tool。你现在应该可以在 Tweaks Tool 中看到手动安装的 GNOME 扩展，你可以在此处配置或启用新安装的扩展。

这就是安装 GNOME Shell 扩展你需要知道的所有内容。

### 移除 GNOME Shell 扩展

你可能想要删除一个已安装的 GNOME Shell 扩展，这是完全可以理解的。

如果你是通过 Web 浏览器安装的，你可以到 [GNOME 网站的以安装的扩展部分][14] 那移除它（如前面的图片所示）。

如果你是手动安装的，可以从 `~/.local/share/gnome-shell/extensions` 目录中删除扩展文件来删除它。

### 特别提示：获得 GNOME Shell 扩展更新的通知

到目前为止，你已经意识到除了访问 GNOME 扩展网站之外，无法知道更新是否可用于 GNOME Shell 扩展。

幸运的是，有一个 GNOME Shell 扩展可以通知你是否有可用于已安装扩展的更新。你可以从下面的链接中获得它：

- [Extension Update Notifier][19]
 
### 你如何管理 GNOME Shell 扩展？

我觉得很奇怪不能通过系统更新来更新扩展，就好像 GNOME Shell 扩展不是系统的一部分。

如果你正在寻找一些建议，请阅读这篇文章： [关于最佳 GNOME 扩展][20]。同时，你可以分享有关 GNOME Shell 扩展的经验。你经常使用它们吗？如果是，哪些是你最喜欢的？

--------------------------------------------------------------------------------

via: [https://itsfoss.com/gnome-shell-extensions/](https://itsfoss.com/gnome-shell-extensions/)

作者：[Abhishek Prakash][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/install-themes-ubuntu/
[2]:https://www.youtube.com/c/itsfoss?sub_confirmation=1
[3]:https://extensions.gnome.org/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-weather.jpeg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/enableuser-themes-extension-gnome.jpeg
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-1.jpeg
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-2.jpeg
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-3.jpeg
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-4.jpeg
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-5.jpeg
[12]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-6.jpeg
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-7-800x572.jpeg
[14]:https://extensions.gnome.org/local/
[15]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-8.jpeg
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-9-800x456.jpeg
[17]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-10-800x450.jpg
[18]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/restart-gnome-shell-800x299.jpeg
[19]:https://extensions.gnome.org/extension/1166/extension-update-notifier/
[20]:https://itsfoss.com/best-gnome-extensions/
[21]:https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
[22]:https://addons.mozilla.org/en/firefox/addon/gnome-shell-integration/
[23]:https://addons.opera.com/en/extensions/details/gnome-shell-integration/