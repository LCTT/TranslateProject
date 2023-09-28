[#]: subject: "Linux Mint Debian Edition 6 'Faye' is Here!"
[#]: via: "https://news.itsfoss.com/lmde-6/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint Debian 版本 6 "Faye" 来了！
======
无需再等待！Linux Mint 的 Debian 版本升级已经发布了。
我们期待已久！

去年，Linux Mint Debian Editon( **LMDE** ) 以[LMDE 5][1]发布了一个重要的版本, 并带来了一些比较不错的改进。

今年，我们发布了**LMDE 6 release**，代号为“ **Faye** ”。
它采用了与以往版本相似的命名方式。

让我们看看这一新版本有什么引人注目的地方！

### Linux Mint Debian Edition 6 “Faye”: 有什么新功能？

![][2]

LMDE 6 由 Debian 的最新稳定发行版 [**Debian 12 release**][3] 支持，具有所有改进、错误修复和新功能，还有更多。

你可以期待在 Linux Mint 21.2 中添加的所有功能。

新版本的一些主要亮点:

  * **基于Linux Kernel 6.1**
  * **Cinnamon桌面升级**
  * **改进后的软件包管理器**



💡

LMDE 只是基于 Debian 而非基于 Ubuntu 的 Linux Mint。它是基于 Ubuntu 的发行版的替代品。一切都与 Linux Mint 旗舰系列相同。

#### Linux Kernel 6.1

![][4]

LMDE 6 使用了长期支持的 [Linux Kernel 6.1][5] 版本, 该内核允许系统利用 Rust 的**实验支持**、英特尔 Meteor Lake 芯片的**初始支持**、AMD 的 RDNA 3 **图形架构**等。

#### Cinnamon Upgrades

![][6]

此外，我们使用了 **Cinnamon 5.8** 作为 LMDE 6 的默认桌面，它作为Linux Mint 的旗舰桌面环境，提供了很多实用功能。

比如，对窗口管理的**手势支持**、**更好的窗口倾斜化与媒体控制**、**更强的工作区管理**等等。

还有一个名为“**风格**”的新设置项，它用于挑中系统的整体外观，允许你为系统的不同元素设置不同的颜色。

我们建议你阅读我们关于 **[Linux Mint 21.2][7]** 发行版本的文章，以更好地了解 Cinnamon 的改进。

**建议阅读** 📖

![][8]

#### 改进后的软件包管理器

![][9]

同样，我们现在也有了**全面改版的软件包管理器**，我们在 Linux Mint 21.2 版本中首次看到了它，现在它又出现在了 LMDE 6 中。

它采用了**改良的布局**，以方便使用，主页上的主要应用类别移到了更下方，搜索栏也移到了左侧。

此外，在系统应用程序的软件包与 Flatpak 之间进行选择也变得**更加简单**

#### 🛠️ 其他变化和改进

除上述更新外，还有一些变化值得一提：

  * 新的登陆屏幕；
  * 为 Warpinator 提供更好的安全保障；
  * 支持 HEIF 和 AVIF 图像；
  * “Mint-Y-Legacy” 主题更名为 “Mint-L”；
  * 可以在文件管理器中为文件夹设置重点颜色。



有关此版本的更多详情，请参阅官方[发行说明][10].

### 📥 下载 LMDE 6 "Faye"

别忘了，LMDE 是为数不多的[支持 32 位系统的 Linux 发行版][11]，当然也包括最新的 LMDE 6！

它有 **32位** 与 **64位** 两种版本，你可以前往[官方网站][12]获取你所需要的版本。

**对于 LMDE 5 用户** ，可通过以下命令安装升级工具进行升级：

```

    apt update
    apt install mintupgrade

```

安装完成后，用以下命令启动图形用户界面升级工具：

```

    sudo mintupgrade

```

![][13]

按照屏幕上的说明进行操作，升级成功后，使用以下命令移除升级工具并重新启动：

```

    apt remove mintupgrade
    sudo reboot

```

[LMDE 6 "Faye"][12]

_💬 您会体验 LMDE 6 吗？请告诉我们！_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/lmde-6/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[GenshinMinecraft](https://github.com/GenshinMinecraft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/lmde-5-release/
[2]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_1.png
[3]: https://news.itsfoss.com/debian-12-release/
[4]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_2.png
[5]: https://news.itsfoss.com/linux-kernel-6-1-release/
[6]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_3.png
[7]: https://news.itsfoss.com/linux-mint-21-2/
[8]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[9]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_4.png
[10]: https://linuxmint.com/rel_faye.php
[11]: https://itsfoss.com/32-bit-linux-distributions/
[12]: https://linuxmint.com/download_lmde.php
[13]: https://news.itsfoss.com/content/images/2023/09/shadow_mintupgrade.png
[14]: https://news.itsfoss.com/assets/images/Certs-and-Bundles-1536x864.webp
[15]: https://itsfoss.click/latest-lf-offer
