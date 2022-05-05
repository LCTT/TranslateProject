[#]: subject: "Microsoft’s 3D Movie Maker, First Released In 1995, Is Now Open Source"
[#]: via: "https://www.opensourceforu.com/2022/05/microsofts-3d-movie-maker-first-released-in-1995-is-now-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14549-1.html"

微软 1995 年首次发布的 3D Movie Maker 现已开源
======

![Windows Movie Maker 标志][1]

这些年来，微软发布了许多开源工具。今天，它正在翻箱底，让 3D Movie Maker 也对所有人开放。3D Movie Maker 于 1995 年首次推出，它允许你用 3D 人物、道具、背景、文字、声音和特殊效果来创建动画场景。这个版本还包括一个 Argonaut 软件公司构建的 BRender。虽然这是一个积极的举措，但请先别太激动，事情可没那么容易。

> “这个项目不太可能在现代硬件/软件下构建成功，但你可以先开始编译，并获得部分完整的二进制文件。”

以下是它的部分构建说明：

- 确保本仓库检出到一个名字简短的目录中，最好是靠近驱动器的根路径（即 `C:\3d` 这样）。
- 在构建过程中，你需要 Visual C++ 2.0 的开发工具（可以在安装盘的 `MSVC20BIN` 目录下找到）。有一些源码遵循的是 C++98 之前的规范，因此现代编译器可能不会喜欢它们。
- 从本仓库的根目录下运行 `setvars.bat`。你可以改变这个脚本中的值来改变你的构建目标。
- 查找并安装字体文件（详见 `FONTS.md`）。
- 运行 `nmake` 以开始使用 3D Movie Maker。

这些代码是从微软公司的档案中恢复的，涉及到的第三方软件（如 BRender）已获得授权。同时，它删除了开发者的身份和别名，以便使该软件开源（从事原始发布工作的微软现任员工除外，他们同意保留自己的名字）。你可以在 [这里][2] 下载它。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/microsofts-3d-movie-maker-first-released-in-1995-is-now-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/windows-movie-maker-logo-696x392.png
[2]: https://github.com/microsoft/Microsoft-3D-Movie-Maker
