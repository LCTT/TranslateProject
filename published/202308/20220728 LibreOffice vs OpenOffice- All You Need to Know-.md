[#]: subject: "LibreOffice vs OpenOffice: All You Need to Know?"
[#]: via: "https://itsfoss.com/libreoffice-vs-openoffice/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16079-1.html"

LibreOffice 和 OpenOffice 的相似与不同之处
======

![][0]

> 对两个最受欢迎的开源办公软件的比较。了解 LibreOffice 和 OpenOffice 之间的相似与不同之处。

LibreOffice 与 OpenOffice 是两个流行的微软办公套件的 [开源替代品][1]。

如果你正在寻找一个具备文字处理、电子表格、演示和其他几个程序的开源办公套件，那么这两个办公软件都可以推荐。

然而，要充分利用这些办公套件，你应该了解它们之间的差异，以决定哪个最适合你。

你应该使用 LibreOffice 还是 OpenOffice？它们之间有什么区别？在这里，我将更详细地探讨这些问题。

### LibreOffice vs. OpenOffice：起源

![][2]

OpenOffice 是由 <ruby>昇阳微系统<rt>Sun Microsystems</rt></ruby> 开发的项目。它是（他们最初收购的）与微软办公套件竞争的 StarOffice 的开源版本。

后来，<ruby>甲骨文<rt>Oracle</rt></ruby> 收购了昇阳微系统，并最终放弃了 OpenOffice.org（OOo），将代码库交给了 Apache。

在 Apache 开始维护它时，该办公套件的名称被更改为 “OpenOffice” 或 “Apache OpenOffice”。

在这个过渡期间，出于担心 Oracle 会停止该项目，<ruby>文档基金会<rt>The Document Foundation</rt></ruby> 复刻了 OpenOffice.org，创建了 LibreOffice。

因此，LibreOffice 是作为 OpenOffice.org 的替代品而创建的。

但是，现在 OpenOffice 仍然存在并得到积极维护（LCTT 译注：不是），为什么你应该选择 LibreOffice？OpenOffice 不够好吗？它们之间有什么相似之处？

### LibreOffice 和 Apache OpenOffice 有什么共同之处？

LibreOffice 和 Apache OpenOffice 有一些共同之处：

如果你只需要创建基本文档、电子表格或演示文稿，并不需要进行任何复杂操作或快捷方式来提高生产力，那么你可以使用它们中的任何一个。

简单来说，如果你在 Linux、Windows 和 macOS 上需要一个开源办公套件，这两个软件都可以胜任。

LibreOffice 和 Apache OpenOffice 都能够打开包括微软的 DOCX、PPT 等在内的各种文件格式。

但是，当你需要**不同的功能、用户界面、文件格式兼容性、导出能力**和其他特性时，它们之间的相似之处就会逐渐消失。

当然，如果你开始广泛使用它们，你将会注意到它们之间的差异。

为了节省你的麻烦，让我在这里重点指出这些差异：

### 安装和平台可用性

用户体验的第一步是安装过程和平台可用性。

如果安装复杂且不支持多个平台，那么这个程序就令人失望。

在这种情况下，LibreOffice 和 Apache OpenOffice 官方支持 **Linux、Windows 和 macOS**。

至于移动平台，你可以在谷歌 Play 商店（安卓）和苹果应用商店（iOS）上找到基于 LibreOffice 的 [Collabora Office][3]。考虑到 Collabora 是 LibreOffice 的商业合作伙伴，它几乎可以视为 LibreOffice 的官方移植版。

而对于移动设备上的 OpenOffice，虽然你也可以使用其他社区/第三方移植版替代，**但它没有官方移植版可用**。

现在你已经了解了支持的平台，它们的安装是否容易？

**对于 Linux**，LibreOffice 在官方软件库中可用，并在软件中心和软件包管理器中列出。因此，你只需点击几下即可在 Linux 系统上安装它。

![libreoffice software center][4]

不幸的是，OpenOffice 的安装过程比较麻烦。它不在软件库中，软件中心中也找不到它。而且，如果你已经预先安装了 LibreOffice，则在尝试安装 OpenOffice 之前必须先删除任何痕迹（以避免安装冲突）。

你需要从其网站下载官方软件包（根据你的 Linux 发行版），然后解压缩，并使用一些命令来[在 Linux 上安装 OpenOffice][5]。

![openoffice debs linux][6]

**对于 Windows 和 macOS**，安装非常简单，你只需 [下载安装包][7]，然后按照屏幕上的指示进行操作即可。

[LibreOffice 还提供了另一种方式][8] 可供获取（通过合作伙伴），即通过微软商店和 Mac 应用商店。不过，你需要支付费用。其中的一部分将捐赠给文档基金会，一部分用于 LibreOffice 的开发。

还要注意，由于 [Collabora Office][9]，你也可以在 Chromebook 上使用 LibreOffice。

**总而言之，LibreOffice 提供了更好的平台可用性和更轻松的安装过程，这使得 OpenOffice 成为一个不太推荐的选择。**

### 用户体验

LibreOffice 提供了一个令人愉悦的用户界面，与现代标准相融合。LibreOffice 在大多数现代硬件上看起来都很好，不论你使用的是 2K 显示器还是 4K 显示器。

![libreoffice home 1][10]

你可以从主启动器快速访问所有工具，这是一种良好的体验。Writer、Calc 和其他程序提供了一个易于使用且看起来井然有序的界面。

![libreoffice writer][11]

Apache OpenOffice 提供的是一个过时的用户界面。因此，如果你正在寻找一个现代化的开源办公套件，LibreOffice 是首选。

![openoffice home][12]

当然，一些用户喜欢经典的用户界面，因为他们对此很熟悉，并且在旧硬件上的使用受到限制。

![openoffice writer][13]

换句话说，OpenOffice 仍然可用，但对于大多数现代用户来说可能不是一种直观的体验。

如果你仔细比较用户界面元素，这将取决于你阅读本文时可用的最新版本。因此，我们避免进行具体的视觉比较。

### 特点

强大的功能集的需求取决于你处理的文件类型。

默认情况下，OpenOffice 和 LibreOffice 均提供以下程序：

* Math（科学公式）
* Writer（文档）
* Impress（演示文稿）
* Draw（绘图、流程图等）
* Calc（电子表格）
* Base（数据库）

无论你使用文字处理器（Writer）、电子表格（Calc）还是演示文稿（Impress），你都可以获得相同的标准功能。

然而，如果你处理需要访问**更多模板、函数、导入/导出选项和高级格式设置**的复杂文档，LibreOffice 会更优秀一些。

### 文件格式兼容性

![][14]

OpenOffice 支持几乎与 LibreOffice 相同的文件扩展名。

但是，LibreOffice 还支持一些 OpenOffice 不支持的文件格式导出。

例如，你可以在 OpenOffice 中打开 **.DOCX** 文件，但无法保留文件扩展名保存/导出该文件。

你只能将其保存为 .odt/.doc./.ott 等几种类似的文件格式。

同样，你无法得到对 .xslx 和 .pptx 的支持，这些是通常用于电子表格和演示文稿的现代文件格式。

当然，如果你不依赖于这些文件格式，可以尝试使用 OpenOffice。然而，与使用较新文件格式的用户进行协作时，你将遇到可能影响你工作的兼容性/格式设置问题。

考虑到 OpenOffice 缺乏许多功能，依赖它来访问较新的文件格式可能不明智；由于不良的兼容性，你可能会丢失重要的细节。

### 更新

![][15]

为了提高你使用该程序的效率并获得增强的性能、新功能和安全修复，建议选择定期获得更新的软件工具。

从技术上讲，两者都会定期获得更新。但是，OpenOffice 仅限于修复错误和进行小型更新。

LibreOffice 的开发活动更加活跃，频繁修复错误/进行小型更新，定期进行较大的升级，增加新功能和改善用户体验。

难怪 [LibreOffice 给 Apache 写了一封公开信][16]，请求停止开发 OpenOffice 并将这些资源转用于帮助 LibreOffice 的开发。

### 企业支持和在线协作选项

![][17]

有了 [Collabora Office][18]，你可以获得企业支持，并能够在工作场所使用 LibreOffice。通过 [Collabora Online][19]，你还可以在服务器上部署 LibreOffice 以实现协作工作空间。

遗憾的是，Apache OpenOffice 没有任何企业支持选项。因此，如果有的话，它最适合家庭用户使用。

### 许可

对于使用这些程序并无任何许可问题，也不会阻止或使你不愿使用它们。然而，这些信息对于项目的贡献者可能会有所帮助。

LibreOffice 使用 Mozilla Public License v2.0 许可证，而 Apache OpenOffice 则使用 Apache License 2.0 许可证。

### LibreOffice vs. OpenOffice：应该选择哪个？

基于现代设计、更多功能和对较新文件格式的支持，LibreOffice 是一个易于推荐的选择。

OpenOffice 可以是适用于熟悉旧版办公套件界面，且希望在 32 位系统中无障碍运行的用户的解决方案。在 LibreOffice 由于某些原因无法正常工作的情况下，OpenOffice 应该作为备选方案。

我们可以告诉你选择取决于个人喜好，但如果你经常处理文档，如果我不说 LibreOffice 是更好的选择，那么我显然不够诚恳。

*（题图：MJ/52f9aa1b-3529-492a-a5fb-7b24b62e2e8a）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/libreoffice-vs-openoffice/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-free-open-source-alternatives-microsoft-office/
[2]: https://itsfoss.com/content/images/wordpress/2022/07/libreoffice-vs-openoffice.jpg
[3]: https://www.collaboraoffice.com/
[4]: https://itsfoss.com/content/images/wordpress/2022/07/libreoffice-software-center.png
[5]: https://itsfoss.com/install-openoffice-ubuntu-linux/
[6]: https://itsfoss.com/content/images/wordpress/2022/07/openoffice-debs-linux.png
[7]: https://www.libreoffice.org/download/download/
[8]: https://www.libreoffice.org/download/libreoffice-from-microsoft-and-mac-app-stores/
[9]: https://www.collaboraoffice.com/press-releases/collabora-office-ships-for-chromebooks/
[10]: https://itsfoss.com/content/images/wordpress/2022/07/libreoffice-home-1.png
[11]: https://itsfoss.com/content/images/wordpress/2022/07/libreoffice-writer.png
[12]: https://itsfoss.com/content/images/wordpress/2022/07/openoffice-home.png
[13]: https://itsfoss.com/content/images/wordpress/2022/07/openoffice-writer.png
[14]: https://itsfoss.com/content/images/wordpress/2022/07/file-format-illustration.jpg
[15]: https://itsfoss.com/content/images/wordpress/2022/07/software-update-illustration.jpg
[16]: https://itsfoss.com/libreoffice-letter-openoffice/
[17]: https://itsfoss.com/content/images/wordpress/2022/07/enterprise-illustration.jpg
[18]: https://www.collaboraoffice.com/
[19]: https://www.collaboraoffice.com/collabora-online/
[0]: https://img.linux.net.cn/data/attachment/album/202308/10/143846kry5mmrmlll3bgql.jpg