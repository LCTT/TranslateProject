[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12085-1.html)
[#]: subject: (How to Upgrade to Ubuntu 20.04 Beta from 18.04 & 19.10)
[#]: via: (https://itsfoss.com/upgrade-ubuntu-beta/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何将 Ubuntu 18.04 LTS/19.10 升级到 Ubuntu 20.04 beta
======

![](https://img.linux.net.cn/data/attachment/album/202004/08/125043m1qyy7gzvkjazx41.jpg)

[Ubuntu 20.04 LTS 版本][1]还有不到一个月就发布了，Ubuntu 在这一个版本中对视觉效果作出了大变动，同时在性能方面也有所提高。

如果你还在使用 Ubuntu 18.04 LTS 版本，你会发现 Ubuntu 20.04 配合深色 Yaru 主题非常惊艳，看过 [Ubuntu 20.04 的展示视频][2]你就知道了。

- [video](https://img.linux.net.cn/static/video/Ubuntu%2020.04%20Desktop%20Tour%20-%20Check%20Out%20New%20Features-9u5B0njRgOw.mp4)

感觉确实不错。如果你想在 4 月 23 日最终稳定版正式发布前率先使用 Ubuntu 20.04，也可以在官方网站上下载 beta 版本。尽管是测试版本，但它的稳定性并不差，同时你也可以在使用这个版本的过程中帮助 Ubuntu 团队进行测试。

你可以下载<ruby>每日构建<rt>daily build</rt></ruby>版并进行重新安装，如果你正在使用的是 Ubuntu 18.04 或 Ubuntu 19.10，也可以在现有系统的基础上直接升级到 Ubuntu 20.04 beta 版本。

从现有系统中升级是很方便的，因为你不会丢失系统设置和其他文件。与重新安装不同的是，你不需要从头开始重新安装所有的软件。当你切换到新版本时，你的主目录、应用程序（大部分）、文件都会保持原样。

> 如果你需要确认正在使用的 Ubuntu 版本，可以参考[这篇文章][4]。

在本文中，我将会介绍如何升级到 Ubuntu 20.04 beta 版本。

### 如何将 Ubuntu 18.04/19.10 升级到 Ubuntu 20.04 beta

![Upgrade Ubuntu 20 04 Beta][5]

在你阅读后面的内容之前，我首先说明一些关于升级到 Ubuntu beta 版本的常见问题。

  * 版本升级的过程并不复杂，但在整个过程中需要有良好的网络连接，以便下载高达好几 GB 的数据。
  * 版本升级的过程中，第三方存储库（比如你自行添加的 [PPA][6]）会被禁用，有些 PPA 可能也和新版本不兼容，在版本升级完毕后，你可以手动启用这些 PPA。
  * 强烈建议将重要数据备份到外部的 USB 硬盘上。你只需要将各个目录下的重要文件直接复制到外部 USB 硬盘上保存即可。
  * 升级到新版本之后，就无法再回滚到之前的旧版本了，如果需要旧版本的系统，只能重新安装。
  * 如果你选择升级到 Ubuntu 20.04 beta 版本，那么在 Ubuntu 20.04 最终稳定版发布之后，你也不需要重新安装。只需要保持定期更新 Ubuntu 系统，届时你就可以直接用上最终稳定版了。
  * Ubuntu 16.04/17/18/19.04 都无法直接升级到 Ubuntu 20.04。

了解完上面的内容之后，下面开始从 Ubuntu 18.04/19.10 升级到 Ubuntu 20.04。

#### 步骤 1：检查设置是否正确

进入“<ruby>软件和升级<rt>Software & Updates</rt></ruby>”应用：

![Software & Updates application in Ubuntu][7]

在“<ruby>升级<rt>Updates</rt></ruby>”选项卡中，设置“有任何新版本 Ubuntu 都提醒我”或“有 LTS 版本 Ubuntu 就提醒我”:

![Ubuntu Upgrade Version Settings][8]

设置完成后，系统会刷新软件库缓存。

#### 步骤 2：安装系统更新

在上面的步骤完成之后，打开终端（在 Ubuntu 中可以使用 `Ctrl+Alt+T` [快捷键][9]），然后使用以下命令[更新 Ubuntu 系统][10]：

```
sudo apt update && sudo apt full-upgrade
```

`apt full-upgrade` 或 `apt dist-upgrade` 的功能和 `apt upgrade` 大致相同，但对于系统版本的升级，`apt full-upgrade` 会在需要的情况下将当前已安装的软件移除掉。

更新安装完成后，系统可能会需要重新启动。在重新启动之后，就可以进入步骤 3 了。

#### 步骤 3：使用更新管理器查找开发版本

在步骤 2 中已经安装了所有必要的更新，现在通过下面的命令打开更新管理器，其中 `-d` 参数表示需要查找开发版本：

```
update-manager -d
```

整个过程可能需要好几分钟，随后会提示有新版本的 Ubuntu 可用：

![Availability of Ubuntu 20.04 in Ubuntu 19.10][11]

在 Ubuntu 18.04 上的提示是这样的：

![Availability of Ubuntu 20.04 in Ubuntu 18.04][12]

然后点击对话框中的“<ruby>升级<rt>upgrade</rt></ruby>”按钮。

#### 步骤 4：开始升级到 Ubuntu 20.04 beta

接下来只要等待下载更新就可以了，遇到对话框直接点击 “OK” 即可。

![][13]

点击“<ruby>升级<rt>upgrade</rt></ruby>”按钮，然后按照提示进行操作。

![][14]

在升级过程中，可能会有提示信息告知所有第三方源都已经禁用。有时候还会提示有哪些软件包需要升级或删除，以及是否需要保留一些已经过时了的软件包。一般情况下，我会选择直接删除。

整个升级过程通常会需要几个小时，但主要还是取决于实际的网速。升级完成后，系统会提示需要重新启动。

![][15]

下面的视频展示了所有相关步骤。

- [video](https://img.linux.net.cn/static/video/How%20to%20Upgrade%20to%20Ubuntu%2020.04%20Beta%20from%2018.04%20&%2019.10%20Right%20Now-RkxxEtaTVkA.mp4)

由此可见，这个升级流程并不复杂。欢迎体验 Ubuntu 20.04 带来的新特性。

如果你有疑问或建议，欢迎在评论区留言。


--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-ubuntu-beta/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://www.youtube.com/watch?v=9u5B0njRgOw
[3]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]: https://linux.cn/article-9872-1.html
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-beta.jpg?ssl=1
[6]: https://itsfoss.com/ppa-guide/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/software-updates-app-ubuntu.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/ubuntu-upgrade-version-settings.jpg?ssl=1
[9]: https://itsfoss.com/ubuntu-shortcuts/
[10]: https://itsfoss.com/update-ubuntu/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04.jpg?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-from-18-04.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-steps-1.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-steps-2.jpg?ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/restart-to-finish-beta-upgarde-ubuntu-20-04.jpg?ssl=1
