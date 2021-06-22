[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12361-1.html)
[#]: subject: (How to Make Ubuntu Look Like macOS in 5 Easy Steps)
[#]: via: (https://itsfoss.com/make-ubuntu-look-like-macos/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

5 个简单步骤使你的 Ubuntu 看起来像 macOS
======

定制是 [我为什么使用 Linux][1] 的一个主要原因。定制桌面 Linux 的道路是永无止境的。你可以更改图标、主题、字体、终端、添加屏幕小工具、[指示器小程序][2]、扩展等诸如此类的东西。

我们已经介绍了很多桌面环境定制的建议和技巧。在这篇文章中，我将向你展示如何使 Ubuntu 看起来像 macOS。

很多人使用 macOS，是因为它的简单和优雅的外观。你可能不同意这一点，但这仍然是一个流行的观点。甚至有的 Linux 发行版也有类似 macOS 外观和感觉。

一位读者要求我们展示如何使 Ubuntu 看起来像 macOS，因此我们写了这篇教程。事实上，这是一个用来展示桌面 Linux 定制能力的很好的示例。

不过，你没有必要为定制外观而安装一个新的发行版。你可以在你自己的系统上做一些调整来给予你一个类似 macOS 的外观。

### 如何给你的 Ubuntu Linux 进行 macOS 改造

![][3]

尽管这篇文章是对 Ubuntu 的建议，但是你也可以在其它使用 GNOME 桌面环境的发行版中使用这些建议，几乎可以不做任何改动。请确保[检查一下你的桌面环境][4]。

说实话，即使你使用的是其它的桌面环境，你仍然可以得到一些关于要做哪些更改的提示。但是你必须确保使用你的桌面环境的工具按照步骤进行。

#### 必要条件: GNOME Tweaks 和 GNOME 扩展

请确保 [安装 GNOME Tweaks 工具][5]。你需要它来更改主题和图标。

你也需要 [启用 GNOME 扩展][6] 来更改 GNOME Shell 和添加重要的要点。

在你启用 GNOME 扩展后，你需要从 [GNOME 扩展][7] 网站安装“用户主题” 扩展，或者只需要转到 [这个超链接][8] ，并单击开关来将其打开。

我也希望你对 [在 Ubuntu 上安装主题][9] 有一定的了解。不过，我还是简单的谈了一下这个主题。

让我们依次看看每个步骤。

#### 步骤 1: 安装一个 macOS 风格的 GTK 主题

因为重点是使 GNOME 看起来像 macOS，所以你应该选择一个像 macOS 一样的主题。有很多主题都是像 macOS 一样的。

##### 下载一个你选择的主题

你可以转到 [Gnome-look][10] 站点，并搜索关于 GTK3 的主题。如果你在 Gnome-look 网站上看到 “Pling” 字样，不用担心，它们都是来自同一个供应商。

你可以选择任何你想要的主题。下面是一些我认为你应该看看的macOS主题：

- [mcOS 11][11]
- [McHigh Sierra][12]
- [Catalina][13]
- [McMojave][14]

在这篇文章中，我将使用 “[McMojave][14]”。你可以选择任何你想要的主题。你将在网站的右侧找到下拉式的下载按钮，单击它。

![McMojave 暗黑主题][15]

在这里你可以找到各种 “.tar.xz” 文件。这些不同的文件包含了相同的主题，但有一些小的差异。像在 “McMojave” 中，我们有像暗黑主题和明亮主题的变体。你可以尝试所有的主题，或者从之间随意选择一个你喜欢的。

##### 设置下载的主题

提取下载的主题，并复制这些提取的主题文件夹到 `.local/share/themes` 文件夹下。

打开 GNOME Tweak 工具，并更改应用程序和 Shell 的主题。在你更改主题的同时，你可以看到黄色、绿色和红色三个按钮，以及左上角的苹果标志。你也可以看到在面板项上的一些更改。

![McMojave GTK 和 Shell 主题][16]

#### 步骤 2: 安装像 macOS 一样的图标

macOS 外观改造的下一步骤是使用像 macOS 一样的图标。

##### 下载图标集合

这里有一些我建议使用的图标集合，你可以从 Gnome-look 网站下载：

- [McMojave-circle][17]
- [Mojave CT-icons][18]
- [Cupertino icons][19]

在这篇文章中，我将使用 “[McMojave-circle][17]” ，你可以随意使用任何你喜欢的图标。

就像主题一样，你可以从右侧的下拉式的 “下载” 按钮下载图标集合。在这里你也可以找到同一种图标的不同版本。

![Mcmojave Circle][20]

##### 设置图标

现在设置下载的图标。为此，提取下载文件中的文件夹并复制它到你的家目录下的 `.icons` 文件夹。 查看这篇关于 [在 Ubuntu 中安装图标主题][9] 的文章。

这是这种图标看起来的样子：

![McMojave Circle 图标外观][21]

#### 步骤 3: 添加类似 macOS 样子的坞站

没有类似 macOS 样子的<ruby>坞站<rt>dock</rt></ruby>，你的 Ubuntu 就看起来不像 macOS。在 Linux 上有很多可用的坞站。我喜欢 “[Dash to Dock][22]”，我会在这里使用它。

“Dash to Dock” 是一个 GNOME 扩展。到现在为止，你已经熟悉 GNOME 扩展。只需要转到 [这个超链接][23] ，并单击切换按钮来安装它。你的原本的坞站将自动被 “Dash to Dock” 所替换。

你可以通过右键单击 “show applications” 按钮（最右边的菜单按钮）并选择 “Dash to dock settings” 来更改设置。

![Dash To Dock][24]

#### 步骤 4: 使用 macOS 壁纸

大多数复杂的东西已经完成。现在是时候设置 macOS 壁纸了。你可以从下面的超链接下载 macOS 默认壁纸：

- [下载 macOS 壁纸][25]

##### 更改桌面背景

我将使用 “Mojave Day” 壁纸。右键单击已下载的的图像，并选择 “设置为壁纸” 选项来更改壁纸。

在设置这个壁纸后，这是我系统外观的样子：

![][26]

##### 更改锁屏壁纸

锁屏壁纸选项已经从 [Ubuntu 20.04][27] 的设置中移除。现在它使用一个模糊的桌面壁纸作为锁屏壁纸。

要设置一个自定义锁屏壁纸，你可以使用 “[Lock screen background][28]” 扩展。

打开 “Lock screen background” 扩展设置，并设置锁屏壁纸。

![锁屏背景设置][29]

这是锁屏现在的样子。如果你感到好奇话，这里是 [如何在 Ubuntu 中截图锁屏][30]。

![锁屏][31]

![登录屏幕][32]

#### 步骤 5: 更改系统字体

这几年，macOS 的主要系统字体是 “San Francisco” 。但是，这个字体并不是公共领域的，而是像苹果生态系统中的许多其他东西一样，是专有字体。基于这个原因，你不能使用这种字体。

你能做的就是使用一种看起来像 San Francisc 字体一样的开源字体。我建议使用 Google 的 [Roboto][33] 字体，或 Adobe 的 [Source Sans Pro][34] 。

[在 Ubuntu 中安装字体是很简单的][35] 。下载 字体的 zip 文件，只需要在提取出来的文件夹中双击 ttf 文件。它会给你一个选项来逐一安装字体。

如果你想节省时间并一次安装所有的字体，提取其中所有的字体到你的家目录（`~/.fonts`）下的 `.fonts` 目录中。

![安装字体][36]

在你安装字体后，你可以使用 GNOME Tweaks 工具来更改系统字体。

![设置字体][37]

#### 额外提示：Spotlight 式的应用程序启动器（如果你像更进一步的话）

如果你是 macOS Spotlight 启动器的粉丝，那么你在 Linux 上也能找到类似的东西。我最喜欢的这类启动器的软件包是 “[Albert][38]”。

你可以 [在 Albert 网站上找到它的安装说明][39] 。

安装完成后，打开 Albert 并设置快捷键（你想打开该启动器的组合键）就可以了。我想，在 macOS 中 `Command + Space` 键是来启动 Spotlight；在 Ubuntu 中，你可以设置 `Super+Space` [快捷键][40]。

你会会得到很多内置的主题，在下面的图片中，我使用 “Spotlight dark” 主题。

Albert 不能直接启动应用程序，你必须授予它在哪里可以进行搜索的权限。

![Albert 设置][41]

在设置后，这是它看起来的样子：

![Albert 暗黑主题][42]

这是我的 Ubuntu 20.04 在完成所有定制后的样子。它看起来像 macOS 吗? 仁者见仁，智者见智。

![macOS 主题][43]

![Ubuntu 使用 macOS 外观改造][44]

如此，这就是你如何使你的 GNOME 桌面看起来像 macOS 一样的步骤。正如我在开始时所说的，这是一个很好的 Linux 桌面定制功能的示例。

如果你有新的注意或有任何疑问；评论区全是你的地盘。

本文由 Sumeet 编写，并由 Abhishek Prakash 提供补充输入信息。

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-ubuntu-look-like-macos/

作者：[Sumeet][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-linux/
[2]: https://itsfoss.com/best-indicator-applets-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Make-Ubuntu-Look-like-MacOS.png?ssl=1
[4]: https://linux.cn/article-12124-1.html
[5]: https://itsfoss.com/gnome-tweak-tool/
[6]: https://linux.cn/article-9447-1.html
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
