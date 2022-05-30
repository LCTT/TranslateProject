[#]: subject: "Customize GNOME 42 with A Polished Look"
[#]: via: "https://www.debugpoint.com/2022/05/customize-gnome-42-look-1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: " "
[#]: url: " "

精美 GNOME 42 外观定制
======
一篇如何在 5 分钟内为你最喜欢的 GNOME 桌面提供精美外观的教程。

你可以使用图标、主题、光标和壁纸多种方式定制你最喜爱的 GNOME 桌面。本文向你展示了如何使 GNOME 42 桌面看起来更加精致。最近发布的 Ubuntu 22.04 LTS 和 Fedora 36 使用了GNOME 42 桌面环境。

在你进一步阅读之前，先并排对比定制前后的外观。

![GNOME before customisation][1]

![GNOME after customisation][2]

我将本教程分为两个部分。

第一部分涉及安装和设置所需的软件包。其次，如何变更各种设置来获得你想要的外观。

本教程主要在 Ubuntu 22.04 LTS 上测试。但它同样适用于 Ubuntu 和 Fedora 的其他发行版。

### 使用精致外观定制 GNOME 42

#### 设置

* 首先，启用系统中的 Flatpak，因为我们需要安装扩展管理器用于下载本教程所需的 GNOME Shell 扩展。

* 因此，要做到这一点，请打开一个终端并运行如下命令：

```
sudo apt install flatpak gnome-software-plugin-flatpakflatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

* 完成后重启计算机。

* 然后从终端运行以下命令来安装扩展管理器以下载 GNOME Shell 扩展。

```
flatpak install flathub com.mattjakeman.ExtensionManager
```

* 打开扩展管理器并安装两个扩展。第一个是浮动 dock，它具有超酷的 dock ，你可以在桌面上移动至任何位置。其次，安装用户主题扩展来帮助你在 Ubuntu Linux 中加载外部 GTK 主题。

![User Themes Extension][3]

![Floating Dock Extension][4]

* 其次，使用以下命令安装 [Materia 主题][5]。因为它没有任何可执行文件，所以你必须构建它。在 Ubuntu 中依次运行以下命令进行安装：

```
git clone https://github.com/ckissane/materia-theme-transparent.gitcd materia-theme-transparentmeson _buildmeson install -C _build
```

* 此外，请从以下链接下载 [Kora 图标主题][6]。下载后解压文件，将以下四个文件夹复制到 `/home/<用户名>/.icons` 目录下。如果 .icons 目录不存在，请创建它。

[下载 Kora 图标主题][7]

![Kora Icon Theme][8]

* 此外，从下面的链接下载 Bibata 光标主题。下载后，解压文件夹并将其复制到相同的 `/home/<用户名>/.icons` 目录中。

[下载 Bibata 光标主题][9]

* 此外，如果你想要一个与上述主题相匹配的漂亮字体，请从 Google Fonts [下载 Robot font][10] 并将它们复制到 `/home/<user name>/.fonts` 目录。

* 最后，再次重启系统。

#### 配置

* 打开扩展管理器，启用浮动 dock 和用户主题，并禁用 Ubuntu Dock。

![Changes to Extensions][11]

* 接着，打开浮动 dock 设置并进行以下更改。

![Floating Dock Settings][12]

* 随后，打开 [GNOME Tweak Tool][13]，然后转到外观选项卡。设置以下内容。

* 光标：Bibata-Original-Ice
* Shell 主题：Materia
* 图标：Kora

* 如果你还想更改字体，请转到字体选项卡并将文档和界面更改为 Robot 10pt。

* 或者，你也可以从 Ubuntu 22.04 的默认设置中更改强调色和样式。

* 最后，根据你的喜好下载漂亮的壁纸。对于本教程，我从[这里][14]下载了一个示例壁纸。

* 如果一切顺利，你将有一个漂亮的桌面，如下图所示：

![Customize GNOME 42 – Final Look][15]

为享受精致的 GNOME 42 干杯。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/customize-gnome-42-look-1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://i2.wp.com/www.debugpoint.com/wp-content/uploads/2022/05/GNOME-before-customisation.jpg?ssl=1
[2]: https://i0.wp.com/www.debugpoint.com/wp-content/uploads/2022/05/GNOME-after-customisation.jpg?ssl=1
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/User-Themes-Extension2.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/05/Floating-Doc-Extension.jpg
[5]: https://github.com/ckissane/materia-theme-transparent
[6]: https://github.com/bikass/kora/
[7]: https://github.com/bikass/kora/archive/refs/heads/master.zip
[8]: https://www.debugpoint.com/wp-content/uploads/2022/05/Kora-Icon-Theme.jpg
[9]: https://www.pling.com/p/1197198/
[10]: https://fonts.google.com/specimen/Roboto
[11]: https://www.debugpoint.com/wp-content/uploads/2022/05/Changes-to-Extensions.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/05/Floating-Dock-Settings.jpg
[13]: https://www.debugpoint.com/2018/05/customize-your-ubuntu-desktop-using-gnome-tweak/
[14]: https://www.pexels.com/photo/colorful-blurred-image-6985048/
[15]: https://www.debugpoint.com/wp-content/uploads/2022/05/Customize-GNOME-42-Final-Look.jpg
