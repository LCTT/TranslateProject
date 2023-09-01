[#]: subject: "PyCharm and Android Studio to Feature Wayland Support for Linux"
[#]: via: "https://news.itsfoss.com/intellij-wayland-support/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16148-1.html"

PyCharm 和 Android Studio 为 Linux 版本增加 Wayland 支持
======

![][0]

> 如果你是在 Linux 或 WSL 环境下进行开发的开发者，以下这个好消息会让你兴奋起来。

JetBrains 平台近日宣布，基于 IntelliJ 的 IDE 最终将实现对 Wayland [显示服务器][1] 协议的支持。可能你并不知道，PyCharm 和 IntelliJ IDEA 就是搭建在 IntelliJ 平台之上的出色 IDE，而由谷歌打造的 Android Studio 也是同样的应用。

Wayland 协议逐步成为 Linux 发行版的默认选择，与 X11 相比，它可以提供更快、更安全和更稳定的体验。如果你使用的编程环境能够支持 Wayland，那么用户体验会得到显著提升。

但是，具体表现在哪些方面有所增强，他们怎么实现这个目标的呢？下文有详细解说。

### 分数缩放和 WSL 集成

使用 [Linux 版本的 IntelliJ IDEA][3] 等 IDE 的用户，终将借助分数缩放，可以在高分辨率显示屏上自定义字体、图标的大小。

无论是多屏幕环境，还是高清显示屏，都可以通过 Wayland 的支持享受到提升的 IDE 体验。

你不再需要担心 IDE 的文本显示模糊的问题。

不仅仅局限于原生的 Linux 环境，同样适用于使用 Windows 的 Linux 子系统（WSL），即那些 “[Bash on Windows][4]” 用户。

Wayland 的支持将确保你可以无缝集成 WSL。

此外，作为用户，你还将享受到 Wayland 带来的以下新特性：

  * 弹出式窗口
  * HiDPI 支持
  * 窗口的交互式缩放

总的说来，通过实现 Wayland 的支持，基于 IntelliJ 的 IDE 将会更具响应速度，实现更高的稳定性和安全性。

### 构建 Wayland 工具集

让 Java 支持 Wayland 是件颇具挑战性的任务，但 IntelliJ 已经找到了应对之策。

JetBrains 和 Oracle 的桌面团队共同开发出一个基于 OpenJDK 21 的 **Wayland 工具集**。

由于拥有该工具集，你将获得一系列能力，包括：

  * 基于软件的渲染。
  * 极简的窗口装饰。
  * 弹出窗口，包括应用于顶层菜单的窗口。
  * 提供包括不同每台监视器比例的 HiDPI 和多监视器支持。

此外，他们还计划添加剪贴板**拖放支持**、**基于 Vulkan 的加速渲染**，以及**使用快捷键在窗口间切换**的功能。

你可以通过访问 [OpenJDK 维基][5] 来关注 Wayland 工具集的开发进程。

至于 Wayland 支持的具体实现时间并未明确，但可以肯定的是，这项工作正在进行中，而且这也表明 IntelliJ 平台也正在关注以 Linux 为主的用户群。

如需获取更多信息，你可以访问 [官方公告][6] 进行查阅。

💬对于 IntelliJ 决定在其 IDE 加入 Wayland 原生支持你有什么看法呢？欢迎在评论区分享你的意见。

*（题图：MJ/dbd4f013-3c11-4c2d-83c1-c11df7c8c17b）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/intellij-wayland-support/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/display-server/
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://itsfoss.com/install-intellij-ubuntu-linux/
[4]: https://itsfoss.com/install-bash-on-windows/
[5]: https://wiki.openjdk.org/display/wakefield/Work+breakdown
[6]: https://blog.jetbrains.com/platform/2023/08/wayland-support/
[0]: https://img.linux.net.cn/data/attachment/album/202309/01/155506s4y763kpkilia3z9.jpg