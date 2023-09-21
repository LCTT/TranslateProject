[#]: subject: "Coding in Rust? Here's a New IDE by JetBrains"
[#]: via: "https://news.itsfoss.com/rust-ide-jetbreains/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16212-1.html"

用 Rust 编码？这是 JetBrains 的新 IDE
======

![][0]

> Rust 开发者，你们有新的东西可以尝试了！

在最近宣布基于 IntelliJ 的 IDE [将支持][1] Wayland [显示服务器][2] 协议之后，JetBrains 推出了**面向 Rust 开发人员的新 IDE**。

它被称为 “**RustRover**”，目的成为**一个功能丰富的独立 Rust IDE**，并将接收定期更新、快速支持和“开箱即用的体验”。

请允许我向你展示它所提供的内容。

> 📋 这是一个早期使用工具，目前不适合生产使用。

### RustRover：可以期待什么？

![][3]

> 🚧 RustRover 不是自由开源软件。

RustRover 从头开始开发，**取代了现已弃用的 [IntelliJ Rust][4] 插件**，该插件用于提供 JetBrains 平台上的 Rust 支持。

它是根据 JetBrains 的其他 IDE 构建的，用于提供**专用的 Rust 开发环境**，而这是以前所缺少的。

> 💡 RustRover 还使用 IntelliJ Rust 插件作为组成部分。

在当前状态下，RustRover 支持诸如 **Rust** 、 **Cargo** 、 **TOML** 、 **web** 和**数据库**等语言和技术。具有来自 **[IntelliJ IDEA][5]** 的附加功能，包括 **[VCS 集成][6]**。

而且，说到它的功能，还不少呢！ 🗒️

**对于编码**，它支持**代码补全**、**代码生成**、**智能重构**、**实时模板**等。RustRover 旨在帮助用户更快、更准确地编写代码。

它还具有一些基本功能，例如**语法高亮显示**、**宏扩展**、**跨语言操作**等，以帮助更好地理解代码库。

**对于测试**，RustRover 具有测试运行器、调试器、对运行配置、运行目标、分析和性能分析的支持。

**对于项目管理**，它支持 Cargo 和 `Cargo.toml`、构建脚本、依赖项声明中的代码补全，并且可以轻松访问 Crate 文档。

RustRover 还**具有一些简洁的实时协作功能**，例如**支持 [VCS][7]**（[Git][8] 和 [GitHub][9]）、**配置共享** 和 **[code with me][10]**。

你可能想知道**它的许可和定价模式怎么样？**

鉴于 **RustRover 不是开源的**，JetBrains **计划将其作为商业产品以订阅方式出售**，与其他 IDE 产品类似。

定价结构尚未最终确定，但预计会与他们的 IDE 产品定价类似。

你可以通过他们的[公告博客][11]来了解更多关于 RustRover 的信息。

> 📋 既然我们正在讨论 Rust 的话题，为什么不尝试一下我们的 [Rust 基础系列][12]呢？它应该作为 Rust 世界的一个很好的介绍。

**想要试一试么？**

RustRover 已提供 **tar.gz 包**、**JetBrains Toolbox App** 和 **Ubuntu Snap 包** 提供。你可以从 [官方网站][14] 获取你选择的包。

> **[RustRover][14]**

对于 Ubuntu，你还可以运行以下命令：

```
sudo snap install jetbrains rustrover --classic
```

请注意，在撰写本文时，**Snap 包未按预期运行**，在使用上述命令时在安装过程中引发错误。

JetBrains **计划在 2024 年 9 月之前对 RustRover 保持公共预览版**，并在此之前发布稳定版本。

💬 你有兴趣使用这样的 IDE 进行 Rust 编码吗？在下面的评论中分享你的想法！


--------------------------------------------------------------------------------

via: https://news.itsfoss.com/rust-ide-jetbreains/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/intellij-wayland-support/
[2]: https://itsfoss.com/display-server/
[3]: https://news.itsfoss.com/content/images/2023/09/RustRover_IDE.png
[4]: https://intellij-rust.github.io/
[5]: https://www.jetbrains.com/idea/
[6]: https://www.jetbrains.com/help/youtrack/cloud/Integration-with-Version-Control-Systems.html
[7]: https://en.wikipedia.org/wiki/Version_control
[8]: https://git-scm.com/
[9]: https://github.com/
[10]: https://www.jetbrains.com/code-with-me/
[11]: https://blog.jetbrains.com/rust/2023/09/13/introducing-rustrover-a-standalone-rust-ide-by-jetbrains/
[12]: https://itsfoss.com/tag/rust-basics/
[14]: https://www.jetbrains.com/rust/download/
[0]: https://img.linux.net.cn/data/attachment/album/202309/21/105704plqhnljnw255huaw.jpg