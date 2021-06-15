[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12773-1.html)
[#]: subject: (Linux Jargon Buster: What is Display Manager in Linux?)
[#]: via: (https://itsfoss.com/display-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 黑话解释：什么是显示管理器？
======

> 在这篇 Linux 黑话解释中，你将了解 Linux 中的显示管理器。它是桌面环境的一部分吗？它的作用是什么？

### 什么是 Linux 中的显示管理器？

简单来说，<ruby>显示管理器<rt>display manager</rt></ruby>（DM）是一个为你的 Linux 发行版提供图形登录功能的程序。它控制用户会话并管理用户认证。显示管理器会在你输入用户名和密码后，立即启动[显示服务器][1]并加载[桌面环境][2]。

显示管理器通常是登录界面的代名词。毕竟它是可见的部分。然而，可见的登录屏幕，也叫<ruby>欢迎页<rt>greeter</rt></ruby>，只是显示管理器的一部分。

![登录屏幕是显示管理器的可见部分][3]

像[各种桌面环境][4]和显示服务器一样，也有各种显示管理器。我们来看看它们。

### 不同的显示管理器

有些人认为显示管理器是桌面环境的一部分，但事实并非如此。它是一个独立的程序。

桌面环境可能会推荐某个显示管理器，但这并不意味着它不能与其它一些显示管理器一起工作。如果你曾经在同一个系统中安装过不止一个桌面环境，你会记得，登录界面（即显示管理器）允许你切换桌面环境。

![显示管理器可以与各种桌面环境配合使用][5]

虽然显示管理器不是桌面环境本身的一部分，但它往往与桌面环境由同一个开发团队开发。它也成为桌面环境的代表。

例如，GNOME 桌面环境开发了 GDM（GNOME Display Manager），光看登录界面就会想到 GNOME 桌面环境。

![GNOME登录屏幕与GDM][6]

一些流行的显示管理器有：

  * [GDM][7]（<ruby>GNOME 显示管理器<rt>GNOME Display Manager</rt></ruby>）：GNOME 的首选。
  * [SDDM][8]（<ruby>简单桌面显示管理器<rt>Simple Desktop Display Manager</rt></ruby>)：KDE 首选。
  * LightDM：由 Ubuntu 为 Unity 桌面开发。

### 显示管理器可以定制

有这么多的桌面环境可供选择，它们都有自己的显示管理器吗？不，不是这样的。

正如我之前提到的，可见的登录屏幕被称为欢迎页。这个欢迎页可以进行自定义来改变登录屏幕的外观。

事实上，许多发行版和/或桌面环境都制作了自己的欢迎页，以给用户提供一个类似于他们品牌的登录屏幕。

例如，Mint 的 Cinnamon 桌面使用了 LightDM，但有自己的欢迎页来给它更多的 Mint 式（或者我应该说是 Cinnamon）的外观。

![基于 LightDM 的 Linux Mint 登录屏幕][9]

来看看 Kali Linux 的登录界面：

![Kali Linux 登录界面][10]

如果你喜欢编码和调整，你可以根据自己的喜好修改或编码自己的欢迎页。

### 改变显示管理器

如果你愿意，可以[更改显示管理器][11]。你需要先安装显示管理器。安装时你会看到切换显示管理器的选项。

![][12]

如果当时没有做切换，那么以后可以通过手动配置来改变显示管理器。不同的发行版重新配置显示管理器的方法略有不同，这不在本文讨论范围内。

### 结语

希望大家对 Linux 中的显示管理器这个术语有一点了解。本黑话解释系列的目的是用非技术性的语言解释常见的 Linux 俗语和技术术语，而不涉及太多的细节。

欢迎大家提出意见和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/display-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/display-server/
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/05/login-screen-opensuse.jpg?resize=800%2C474&ssl=1
[4]: https://itsfoss.com/best-linux-desktop-environments/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-session-ubuntu.jpg?resize=800%2C414&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Login-screen-1.png?resize=800%2C450&ssl=1
[7]: https://wiki.gnome.org/Projects/GDM
[8]: https://github.com/sddm
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/linux-mint-login-screen.jpg?resize=800%2C418&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/kali-linux-login-screen.jpg?resize=799%2C450&ssl=1
[11]: https://itsfoss.com/switch-gdm-and-lightdm-in-ubuntu-14-04/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2014/06/Switch_between_gdm_and_lightgdm_Ubuntu.jpeg?resize=700%2C448&ssl=1
