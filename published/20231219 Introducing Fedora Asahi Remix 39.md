[#]: subject: "Introducing Fedora Asahi Remix 39"
[#]: via: "https://fedoramagazine.org/introducing-fedora-asahi-remix-39/"
[#]: author: "Neal Gompa https://fedoramagazine.org/author/ngompa/"
[#]: author: "Davide Cavalca https://fedoramagazine.org/author/dcavalca/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16496-1.html"

支持苹果芯片的 Fedora Asahi Remix 39 发布
======

![][0]

早在 8 月份，我们 [宣布][2] Fedora Linux 很快就会在<ruby>苹果芯片<rt>Apple Silicon</rt></ruby> Mac 上可用。我们在 Flock 上推出了 [Fedora Asahi Remix][3]。这个发行版与 [Fedora Asahi SIG][4] 和 [Asahi Linux][5] 项目密切合作开发的。

今天，我们很高兴地宣布 Fedora Asahi Remix 39 现已 [正式发布][6]！这个 Remix 版基于 Fedora Linux 39，通过广泛的平台和设备支持，在苹果芯片 Mac 上提供了出色的体验。它全面支持所有配备 M1 和 M2 芯片的 MacBook Air、MacBook Pro、Mac Mini、Mac Studio 和 iMac 系统。有关各个系统的详细信息，请参阅 Asahi Linux 网站上的 [特性矩阵][6]。

Fedora Asahi Remix 选定 KDE Plasma 作为我们的旗舰桌面版本，同时配备了一个基于 Calamares 的自定义初始设置向导。GNOME 变体同样可用，两种桌面变体都与 Fedora Linux 提供的功能相兼容。KDE 和 GNOME 都支持开箱即用的 Wayland，并利用 XWayland 来支持旧版 X11 应用程序。

Fedora Asahi 还附带非一致性 OpenGL 3.3 支持，包括 GPU 加速的几何着色器和变换反馈，以及世界上第一个也是唯一一个针对苹果芯片的 [经过认证的一致性 OpenGL ES 3.1][7] 实现。我们创新性地整合了 DSP 解决方案，得以即插即用支持高质量音频，不仅能呈现全方位的音效和动态范围，还不会对电池寿命产生影响。

Fedora Asahi Remix 还为服务器工作负载和其他类型的无头部署提供了 Fedora Server 变体。最后，我们为希望从头开始构建自己的体验的用户提供了一个最小的镜像。

你今天就可以按照我们的 [安装指南][8] 安装 Fedora Asahi Remix。我们还设有一个用于跟踪已知问题的 [问题跟踪器][9]、一个用于用户支持的 [Discourse 论坛][10] 和一个 [Matrix 聊天室][11]。

Fedora Asahi Remix 是我们多年合作的成果，我们希望你会喜欢在自己的系统上运行它。我们期待未来将支持扩展到更多设备和功能，并继续为苹果芯片 Mac 提供最佳的 Linux 体验。

*（题图：DA/9f052f85-4f66-445c-8a75-81a5c0221911）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introducing-fedora-asahi-remix-39/

作者：[Neal Gompa][a1]，[Davide Cavalca][a2]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a1]: https://fedoramagazine.org/author/ngompa/
[a2]: https://fedoramagazine.org/author/dcavalca/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/12/Fedora_Asahi_remix_39_intro-816x345.jpg
[2]: https://fedoramagazine.org/coming-soon-fedora-for-apple-silicon-macs/
[3]: https://fedora-asahi-remix.org/
[4]: https://fedoraproject.org/wiki/SIGs/Asahi
[5]: https://asahilinux.org/
[6]: https://asahilinux.org/fedora/
[7]: https://www.khronos.org/conformance/adopters/conformant-products/opengles#submission_1007
[8]: https://docs.fedoraproject.org/en-US/fedora-asahi-remix/installation/
[9]: https://pagure.io/fedora-asahi/remix-bugs/issues
[10]: https://discussion.fedoraproject.org/c/neighbors/asahi/92
[11]: https://matrix.to/#/#asahi:fedoraproject.org
[0]: https://img.linux.net.cn/data/attachment/album/202312/22/144616gowqbsetb4jbqatw.jpg