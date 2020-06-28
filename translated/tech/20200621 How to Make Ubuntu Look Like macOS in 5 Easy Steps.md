[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Make Ubuntu Look Like macOS in 5 Easy Steps)
[#]: via: (https://itsfoss.com/make-ubuntu-look-like-macos/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

如何使用 5 个简单的步骤来使 Ubuntu 看起来像 macOS
======

定制系统是 [我为什么使用 Linux][1] 的一个主要原因。定制桌面 Linux 的道路是永无止境的.你可以更改图标，主题，字体，终端，添加屏幕小工具，[指示器小程序][2], 扩展小程序等诸如此类的东西。

我们已经在 FOSS 上介绍了很多桌面环境定制的建议和技巧。在这篇文章中，我将向你展示如何使 Ubuntu 看起来像 macOS 。

很多人使用 macOS ，是因为它的简单和唯美的外观。你可能不同意这一点，但是这仍然是一个流行的观点。甚至可以说这里有些类似 macOS 外观和感觉的 Linux 发行版。

**一位读者要求我们展示如何使 Ubuntu 看起来像 macOS** ，因此我们创建了这篇教程。事实上，这是一个 **很好的用来展示桌面 Linux 定制能力的示例** 。

不，你没有必要为定制外观而安装一个新的发行版。你可以在你自己的系统上做一些调整来给予你一个类似 macOS 的外观。

### 如何给予你的 Ubuntu Linux 一个 macOS 外观改造

![][3]

尽管这篇文章是对 Ubuntu 的建议，但是你也可以在  **其它使用 GNOME desktop** 的发行版中使用这些建议，只需要做很少或不做任何更改。请确保 [检查你的桌面环境][4] 。

平心而论，即使你使用一些其它的桌面环境，你仍然可以获得一些关于要做哪些更改的提示。但是你必需确保使用你所用桌面环境的工具来遵循这些步骤。

#### 必要条件: GNOME Tweaks 和 GNOME 扩展

请确保 [安装 GNOME Tweaks 工具][5] 。你将需要它来更改主题和图标。

你也将需要 [启用 GNOME 扩展][6] 来更改 GNOME Shell 和添加重要的要点。

在你启用 GNOME 扩展后，你需要从 [Gnome 扩展][7] 来安装“用户主题”扩展，或者只需要转到 [这个超链接][8] ，并单击开关来将其打开。

我也要求你有一些 [在 Ubuntu 上安装主题][9] 的知识。不过，我将简单得涉及这个主题。

让我们依次看看每个步骤。

#### 步骤 1: 安装一个受 macOS 影响的 GTK 主题

因为重点是使 GNOME 看起来像 macOS ，所以你应该选择一个像 macOS 一样的主题。在这里有很多像 macOS 一样的主题。

**下载一个你选择的主题**

你可以转到 [Gnome-look][10] 站点，并搜索关于 GTK3 的主题。如果你看到 “Pling” 写在 Gnome-look 网站上，不用担心。因为它们都来自同一个提供商。

你可以选择任何你像要的主题。这里有一些 macOS 主题，我认为你应该看一看：

[**mcOS 11**][11]

[McHigh Sierra][12]

[Catalina][13]

[McMojave][14]

在这篇文章中，我将使用 “[McMojave][14]”。你可以选择任何你想要的主题。你将在网站的右侧找到下拉式的下载按钮，单击它。

![McMojave 暗黑主题][15]

在这里你可以找到各种各样的 “.tar.xz” 文件。这些不同是文件包含略有区别的相同主题。像在 “McMojave” 中，我们有像暗黑主题和明亮主题的变体。你可以全试，或者从转盘中间选择你喜欢的任意一个。

**设置下载的主题**

提取下载的主题，并复制这些提取的主题文件夹到 .local/share/themes 文件夹下。

打开 GNOME Tweak 工具，并更改应用程序和 Shell 主题。在你更改主题的同时，你可以看到黄色，绿色和红色三个按钮, and that Apple logo on upper left corner. 你也可以注意到在面板项目上的一些更改。

![McMojave GTK 和 Shell 主题][16]

#### 步骤 2: 安装像 macOS 一样的图标

macOS 外观改造的下一步骤是使用像 macOS 一样的图标。

**下载图标集合**

这里有一些我建议使用的图标集合，你可以从 Gnome-look 网站下载：

[McMojave-circle][17]

[Mojave CT-icons][18]

[Cupertino icons][19]

在这篇文章中，我将使用“[McMojave-circle][17]” ，你可以随意使用任何你喜欢的图标。

就像主题一样，你可以从右侧的下拉式的“下载”按钮下载图标集合。在这里你也可以找到同一种图标的不同版本。

![Mcmojave Circle][20]

**设置图标**

现在设置下载的图标。为此，提取下载文件中的文件夹并复制它到你的 home 目录下的 .icons 文件夹。 查看这篇关于 [在 Ubuntu 中安装图标][9] [][9][主题][9] 的文章。

这是这种图标看起来的样子：

![McMojave Circle 图标外观][21]

#### 步骤 3: 添加类似 macOS 样子的 dock

没有类似 macOS 样子的 dock ，你的 Ubuntu 将不会看起来像 macOS 。在 Linus 上有很多可用的 dock 。我喜欢 [Dash to Dock][22] ，并且将在这里使用它。

Dash to Dock 是一个 GNOME 扩展。到现在为止，你已经熟悉 GNOME 扩展。只需要转到 [这个超链接][23] ，并单击切换按钮来安装它。你的原本的 dock 将自动被 dash-to-dock 所替换。

你可以通过右键单击 “显示应用程序” 按钮(最右边的菜单按钮)来更改设置，并选择 “Dash to dock 设置”。

![Dash To Dock][24]

#### 步骤 4: 使用 macOS 壁纸

大多数复杂的东西已经完成。现在是时候设置 macOS 壁纸了。你可以从下面的超链接下载 macOS 默认壁纸：

[下载 macOS 壁纸][25]

**更改桌面背景**

我将使用 “Mojave Day” 壁纸。右键单击已下载的的图像，并选择 ‘设置为壁纸’ 选项来更改壁纸。

在设置这个壁纸后，这是我系统外观的样子：

![][26]

**更改锁屏壁纸**

锁屏壁纸选项已经从 [Ubuntu 20.04][27] 的设置中移除。现在它使用模棱两可的桌面壁纸作为锁屏壁纸。

为设置一个自定义锁屏壁纸，你可以使用 “[锁屏壁纸][28]” 扩展。

打开 “锁屏壁纸” 扩展设置，并设置锁屏壁纸。

![锁屏背景设置][29]

这是锁屏现在的样子。如果你想弄明白的话，这里是 [如何在 Ubuntu 中锁屏截图][30]。

![锁屏][31]

![登录屏幕][32]

#### 步骤 5: 更改系统字体

这几年以来，macOS 的主要字体是 ‘San Francisco’ 。但是，这个 San Francisco 字体不在公共领域中，而是专有的，就像在苹果生态系统中的很多其它东西一样。因此，你不能使用这种字体。

你能做的就是使用一种看起来像 San Francisc 字体一样的开源字体。我建议使用来自 Google 的 [Roboto][33] 字体，或来自 Adobe 的 [Source Sans Pro][34] 。

[在 Ubuntu 中安装字体是很简单的][35] 。下载 字体的 zip 文件，只需要在提取出来的文件夹中双击 ttf 文件。它将给予你逐个安装字体的选项。

如果你想节省时间并一次安装所有的字体，提取其中所有的字体到你的 home 文件夹 (~/.fonts) 下的 “.fonts” 目录中。

![安装字体][36]

在你安装字体后，你可以使用 GNOME Tweaks 工具来更改系统字体。

![设置字体][37]

#### 额外提示: Spotlight 就像应用程序启动器一样(如果你像多跑1英里的话)

如果你是 macOS Spotlight 启动器的一名粉丝，那么你在 Linux 上也能够有一些类似的东西。我最喜欢获取的这类启动器的软件包是 “[Albert][38]“ 。

你可以找到 [Albert 在其网站上的安装说明][39] 。

在安装后，打开 “Albert” 并设置快捷键 (你想打开启动器的组合键)，接下来你就可以去尝试一下。我认为在 macOS 中，Command 按键 + 空格按键是来启动 Spotlight 的。你可以设置 Super 按键 + 空格按键 [为 Ubuntu 中的键盘快捷键][40] 。

你将会获得很多内置的主题，在下面的图片中，我使用 “Spotlight 暗黑” 主题。

Albert 不能直接启动应用程序，你必需给予它能够查看搜索结果是权限。

![Albert 设置][41]

在设置后，这是它看起来的样子：

![Albert 暗黑主题][42]

这是我的 Ubuntu 20.04 在完成所有定制后的样子。它看起来像 macOS 吗? 仁者见仁，智者见智。

![macOS 主题][43]

![Ubuntu 使用 macOS 外观改造][44]

如此，这就是你如何使你的 GNOME desktop 看起来像 macOS 一样的步骤。正如我在开始时所说的，这是一个很好的 Linux 桌面定制功能的示例。

如果你有新的注意或有任何疑问；评论区全是你的地盘。

_由 Sumeet 编写，并由 Abhishek Prakash 提供补充输入信息。_

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-ubuntu-look-like-macos/

作者：[Community][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-linux/
[2]: https://itsfoss.com/best-indicator-applets-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Make-Ubuntu-Look-like-MacOS.png?ssl=1
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://itsfoss.com/gnome-tweak-tool/
[6]: https://itsfoss.com/gnome-shell-extensions/
[7]: https://extensions.gnome.org/
[8]: https://extensions.gnome.org/extension/19/user-themes/
[9]: https://itsfoss.com/install-themes-ubuntu/
[10]: https://www.gnome-look.org/
[11]: https://www.pling.com/p/1220826
[12]: https://www.pling.com/p/1013714
[13]: https://www.pling.com/p/1226871
[14]: https://www.pling.com/p/1275087
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-dark-theme.png?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-Desktop.png?ssl=1
[17]: https://www.gnome-look.org/p/1305429/
[18]: https://www.gnome-look.org/p/1210856/
[19]: https://www.gnome-look.org/p/1102582/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-circle-.png?ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-circle-icons-look.png?fit=800%2C494&ssl=1
[22]: https://github.com/micheleg/dash-to-dock
[23]: https://extensions.gnome.org/extension/307/dash-to-dock/
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Dash-to-dock-1.png?ssl=1
[25]: https://oswallpapers.com/category/mac-os/
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Wallpaper.png?fit=800%2C450&ssl=1
[27]: https://itsfoss.com/ubuntu-20-04-release-features/
[28]: https://extensions.gnome.org/extension/1476/unlock-dialog-background/
[29]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Lock-screen-background-setting.png?ssl=1
[30]: https://itsfoss.com/screenshot-login-screen-ubuntu-linux/
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Lock-screen-1.png?ssl=1
[32]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Login-screen-1.png?ssl=1
[33]: https://fonts.google.com/specimen/Roboto?query=robot
[34]: https://adobe-fonts.github.io/source-sans-pro/
[35]: https://itsfoss.com/install-fonts-ubuntu/
[36]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Fonts.png?ssl=1
[37]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Set-fonts.png?ssl=1
[38]: https://albertlauncher.github.io/
[39]: https://albertlauncher.github.io/docs/installing/
[40]: https://itsfoss.com/ubuntu-shortcuts/
[41]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Albert-settings.png?ssl=1
[42]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Albert-look.png?ssl=1
[43]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/macOS-theme.png?fit=800%2C450&ssl=1
[44]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/macOS-theme-2.png?fit=800%2C450&ssl=1
