[#]: subject: "Fedora Linux Flatpak cool apps to try for November"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-november/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux Flatpak 11 月值得尝试的酷炫应用
======

![][1]

Daimar Stein 拍摄

本文介绍了 Flathub 中可用的项目以及安装说明。

[Flathub][2] 是获取和分发适用于所有 Linux 应用的地方。它由 Flatpak 提供支持，允许 Flathub 应用在几乎任何 Linux 发行版上运行。

请阅读“[Flatpak 入门][3]”。为了启用 flathub 作为你的 flatpak 提供商，请使用 [flatpak 站点][4]上的说明。

### TurboWarp

[TurboWarp][5] 是 Scratch 的修改版本。Scratch 是一种具有简单视觉界面的编码语言，允许年轻人创建数字故事、游戏和动画。

我喜欢 Scratch，但自从我发现 TurboWarp 以来，我儿子就再也没有回头。界面更清晰，具有夜间模式，比原始 Scratch 运行速度更快，并且内存经过优化。

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 “TurboWarp”：

````

    flatpak install flathub org.turbowarp.TurboWarp

````

### Szyszka

[Szyska][6] 是文件重命名器，具有许多有趣的功能，例如：

  * 很好的性能
  * 适用于 Linux、Mac 和 Windows
  * 使用 GTK 4 创建的 GUI
  * 多种规则可自由组合：
    * 替换文字
    * 修剪文本
    * 添加文字
    * 添加号码
    * 清除文本
    * 将字母更改为大写/小写
    * 自定义规则
  * 保存规则供以后使用
  * 能够编辑、重新排序规则和结果
  * 处理数十万条记录



你可以通过单击网站上的安装按钮或手动使用以下命令来安装 “Szyszka”：

````

    flatpak install flathub com.github.qarmin.szyszka

````

### Marker

[Marker][7] 是一个用 GTK3 编写的 MarkDown 编辑器。这是我在 GTK 上快速写作的最爱之一。它的一些特点是：

  * 使用 [scidown][8] 对 Markdown 文档进行 HTML 和 LaTeX 转换
    * 支持 YAML 标头
    * 文档类
    * 投影仪/演示模式
    * 摘要部分
    * 目录
    * 外部文档包含
    * 带有参考 ID 和标题的方程、图形、表格和清单
    * 内部参考文献
  * 使用 [KaTeX][9] 或 [MathJax][10] 进行 TeX 数学渲染
  * 使用 [highlight.js][11] 对代码块进行语法高亮显示
  * 使用 [pandoc][12] 灵活的导出选项
    * PDF
    * RTF
    * ODT
    * DOCX



你可以通过单击网站上的安装按钮或使用以下命令手动安装 “Marker”：

````

    flatpak install flathub com.github.fabiocolacio.marker

````

_**Marker 也可以在 fedora 的仓库中以 rpm 的形式提供**_

### Librum

[Librum][13] 是一个用于管理图书馆和阅读电子书的应用。这是管理书籍和文档集合的好方法，包括对一长串格式的支持。它的一些特点是：

  * 现代电子阅读器
  * 个性化和可定制的库
  * 图书元数据编辑
  * 一个免费的应用内书店，拥有超过 70,000 本书
  * 书籍在所有设备上同步
  * 高亮显示书签文本搜索



你可以通过单击网站上的安装按钮或使用以下命令手动安装 “Librum”：

````

    flatpak install flathub com.librumreader.librum

````

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-november/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/10/flatpak-apps-for-november-banner-816x345.jpg
[2]: https://flathub.org
[3]: https://fedoramagazine.org/getting-started-flatpak/
[4]: https://flatpak.org/setup/Fedora
[5]: https://flathub.org/apps/org.turbowarp.TurboWarp
[6]: https://flathub.org/apps/com.github.qarmin.szyszka
[7]: https://flathub.org/apps/com.github.fabiocolacio.marker
[8]: https://github.com/wallberg13/scidown
[9]: https://katex.org/
[10]: https://www.mathjax.org/
[11]: https://highlightjs.org/
[12]: https://pandoc.org/
[13]: https://flathub.org/apps/com.librumreader.librum