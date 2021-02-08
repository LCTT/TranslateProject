[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12297-1.html)
[#]: subject: (Linux Mint 20: Release Date, Features and Everything Important Associated With it)
[#]: via: (https://itsfoss.com/linux-mint-20/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Mint 20 发布前一窥
======

[Ubuntu 20.04 LTS 版本发布了][1]。这对 Linux Mint 用户来说也是一个好消息。一个新的 Ubuntu LTS 版本意味着新的 Linux Mint 主要版本也将很快随之出现。

为什么这么说呢？因为 Linux Mint 是基于 Ubuntu 的长期支持（LTS）版本的。Mint 18 系列是基于 Ubuntu 16.04 LTS，Mint 19 是基于 Ubuntu 18.04 LTS 等等。

与 Ubuntu 不同，Linux Mint 没有固定的发布时间表。根据以往的趋势，我可以做出一个明智的猜测，[Linux Mint][2] 20 应该会在今年 6 月发布。

### Linux Mint 20 “Ulyana” 即将推出的新功能

![][3]

让我们来看看代号为 Ulyana 的 Linux Mint 20 中提出的一些主要新功能和变化。

#### 1. 提高 Nemo 文件管理器的性能

Nemo 文件管理器计划中的性能改进之一是它处理缩略图的方式。你可能还没有意识到，但缩略图的生成需要相当多的系统资源（以及磁盘空间）。试着打开一个有几千张图片的文件夹，你会发现 CPU 的消耗会上升。

在 Linux Mint 20 中，其目标是优先考虑内容和导航，并尽可能地延迟缩略图的渲染。这意味着在缩略图渲染之前，文件夹的内容会以通用图标显示出来。这不会让人觉得赏心悦目，但你会注意到性能的改善。

#### 2. 两种焕然一新的颜色变体

默认情况下，Linux Mint 是绿色/薄荷色的风格。还有一些其它的颜色点缀。Linux Mint 20 新添加了两种可爱的的粉红色和青蓝色。

以及新的青蓝色风格：

![Linux Mint Aqua][4]

这里是新的粉红色风格：

![Linux Mint Pink][5]

#### 3. 没有过度偏重于 Snap 包

Ubuntu 20.04 将 snap 包的优先级放在了通常的 apt 包之前。事实上，如果你在 Ubuntu 20.04 中使用 `apt` 命令安装 Chromium 浏览器时，它会自动安装 snap 版本。

Linux Mint 团队显然对此不满意，他们确认 Mint 20 将不会安装 snaps 或 snapd。它还将禁止 `apt` 使用 snapd。

你仍然可以自己手动安装 snap 包。只是不会由 `apt` 来安装它们。

#### 4. 有了这个新工具，跨网络共享文件变得很简单。

Linux Mint 20 将提供一个[新的 GUI 工具][6]，可以轻松地在本地网络上共享文件，而无需任何额外的配置。

![New tool for sharing files across the network][7]

#### 5. 更好地整合了 Electron 应用程序的桌面

[Electron][8] 是一个开源框架，它允许使用 Web 技术构建跨平台的桌面应用程序。有些人称它为懒惰的方法，因为应用程序运行在 Chromium 浏览器之上。然而，这可以让开发人员轻松地将他们的应用程序提供给 Linux（和 macOS）。[Linux 上的 Slack][9] 就是众多这样的例子之一。

Linux Mint 20 将对 Electron 应用提供更好的支持，并改进系统托盘和桌面通知的集成。

#### 6. 改进的支持多显示器的比例缩放功能

![improved multi-monitor support][10]

一个提议的改变是在 Linux Mint 20 中加入支持多显示器的比例缩放功能。如果你有一个 HiDPI 和非 HiDPI 显示器的组合，你可以为它们每一个选择不同的分辨率、刷新率和不同的分数缩放。

在 Mint 20 的登录屏幕，可以让你跨多个显示器拉伸显示背景。

#### 7. 改进对 Nvidia Optimus 的支持

在 Mint 20 中，Nvidia prime 小程序会显示 GPU 渲染器。你也可以直接从系统托盘中的菜单中选择切换到哪块卡。

![Switch between GPUs][12]

你也可以使用 Nvidia “On-Demand” 模式。在这种模式下，将使用英特尔卡来渲染会话。而如视频播放器或视频编辑器这样的兼容应用程序可以在应用程序菜单中打开时使用 Nvidia GPU。

![Run an application with NVIDIA GPU][13]

#### 8. 不再支持 32 位

虽然 Ubuntu 18.04 在两年前就放弃了 32 位 ISO，但 Linux Mint 19 系列一直提供 32 位 ISO 的下载和安装。

这种情况在 Linux Mint 20 中有所改变。Linux Mint 20 已经没有 32 位版本了。这是因为 32 位支持从 Ubuntu 20.04 中完全消失了。

#### 还有什么？

Cinnamon 4.6 桌面版的发布带来了很多视觉上的变化。

在 Ubuntu 20.04 中，应该会有一些“引擎盖下”的变化，比如 Linux Kernel 5.4，取消了 Python 2 的支持，加入 [Wireguard VPN][11] 等。

随着开发的进展，我会在本文中更新更多的功能。敬请期待。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-mint-20/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://www.linuxmint.com/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/Linux-Mint-20.png?ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/mint-20-aqua.jpg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/mint-20-pink-1.jpg?ssl=1
[6]: https://blog.linuxmint.com/?p=3863
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/mint-20-warpinator-1.png?ssl=1
[8]: https://www.electronjs.org/
[9]: https://itsfoss.com/slack-use-linux/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/monitor_display_Linux_mint_20.png?ssl=1
[11]: https://itsfoss.com/wireguard/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/nvidia-prime-applet-linux-mint-20.png?w=386&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/nvidia-on-deman-feature-linux-mint-20.png?w=526&ssl=1
