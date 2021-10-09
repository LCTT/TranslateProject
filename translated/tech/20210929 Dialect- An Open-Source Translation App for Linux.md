[#]: subject: "Dialect: An Open-Source Translation App for Linux"
[#]: via: "https://itsfoss.com/dialect/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Dialect：Linux 下的开源翻译应用
======

_**简介：**Dialect 是一个简单明了的应用，可以让你使用网络服务进行语言间的翻译。为了探索更多，让我们仔细看看。_

虽然你可以启动网络浏览器并直接使用任何翻译服务来完成工作，但桌面应用有时会派上用场。

Dialect 是一个简单的翻译应用，利用网络服务进行翻译，同时给你一些额外的能力。

### 使用谷歌翻译和 LibreTranslate 的开源翻译应用

![][1]

Dialect 主要是一个为 GNOME 桌面定制的应用，但它在其他桌面环境下也应该能正常工作。

它可以让你快速翻译语言，同时还有一些额外的选项。

在其核心部分，它让你在谷歌翻译或 LibreTranslate 之间选择翻译服务。

尽管 LibreTranslate 不能接近谷歌翻译的准确性，但把它作为一个选项来切换是一个很好的补充。至少，对于一些基本的用法，如果用户不想利用谷歌的服务，你的桌面上就有一个备选方案。

### Dialect 的特点

![][2]

除了切换翻译服务外，你还能得到：

  * 发音
  * 文本到语音功能（谷歌）
  * 黑暗模式
  * 翻译快捷方式
  * 实时翻译
  * 剪贴板按钮可快速复制/粘贴
  * 翻译历史（撤销/重做）。



正如你在截图中所注意到的，实时翻译功能可能会因为滥用 API 而使你的 IP 地址被禁止使用该服务。

![][3]

我试着使用 LibreTranslate（如上图所示）和谷歌翻译，并启用实时翻译功能，它工作得很好。

也许，如果你经常依赖翻译，你可能想避免这个功能。但是，对于我的临时使用，在相当多的测试中，这些服务并没有按 IP 地址禁止。

重要的是要注意，如果你想，你可以指定一个自定义的 LibreTranslate 实例。默认情况下，它使用 “translate.astian.org” 作为实例。

你可能找不到一个单独的翻译历史部分，但窗口左上角的箭头按钮会让你看到你以前的翻译和翻译设置。

所以，它也可以作为一个重做/撤销的功能。

### 在 Linux 中安装 Dialect

Dialect 是以 [Flatpak][4] 的形式提供的。所以，你应该能够在你选择的任何 Linux 发行版上安装它。如果你是新手，你可能想看看我们的 [Flatpak 指南][5]以获得帮助。

首先，添加Flathub 仓库：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

然后安装应用：

```
flatpak install flathub com.github.gi_lom.dialect
```

安装后，在系统菜单中寻找它，并从那里启动它。

你也可以浏览它的 [GitHub 页面][6]了解更多信息。

[Dialect][7]

--------------------------------------------------------------------------------

via: https://itsfoss.com/dialect/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/dialect-screenshot.png?resize=800%2C331&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/dialect-app-options.png?resize=800%2C470&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/dialect-libretranslate.png?resize=800%2C326&ssl=1
[4]: https://itsfoss.com/what-is-flatpak/
[5]: https://itsfoss.com/flatpak-guide/
[6]: https://github.com/dialect-app/dialect/
[7]: https://flathub.org/apps/details/com.github.gi_lom.dialect
