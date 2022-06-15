[#]: subject: "Adobe Launches Open Source Toolkit To Contain Visual Misinformation"
[#]: via: "https://www.opensourceforu.com/2022/06/adobe-launches-open-source-toolkit-to-contain-visual-misinformation/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Adobe 推出了开源工具包以减少视觉错误信息
======
![Adobe][1]

Adobe 设想了一个充满照片和视频的网络，照片和视频上标注关于它们来自哪里的信息。该公司的主要目标是减少视觉错误信息的传播，不过，该系统也可以使那些“希望将自己的名字与工作关联起来”的内容创作者受益。

Adobe 的 <ruby>内容真实性计划<rt>Content Authenticity Initiative</rt></ruby> (CAI) 项目于 2019 年首次宣布，此后，它发布了一份关于实现该目标的技术白皮书，将该系统集成了到自己的软件中，并与新闻编辑室和硬件制造商展开了合作，以帮助普及其愿景。

现在，该公司发布了一个由三部分组成的开源工具包，从而把该技术交到开发人员手中并投入使用。Adobe 的新开源工具包括用于开发“在浏览器中显示内容凭据”的 JavaScript SDK、命令行实用程序和用于开发桌面应用程序、移动应用程序和其他用于创建、查看和验证嵌入式内容凭据的 Rust SDK。

众所周知，照片的 EXIF 数据中记录了有关光圈和快门速度的信息，这个新标准也采用了这种方式，它还记录有关文件创建的信息，例如文件的创建和编辑方式。如果该公司的共同愿景成真，这些 Adobe 称之为“内容凭证”的元数据，将在社交媒体平台、图像搜索平台、图像编辑器、搜索引擎中广泛可见。

C2PA 是 Adob​​e 的 CAI 与 微软、索尼、英特尔、推特以及 BBC 等合作伙伴的合作成果。华尔街日报、尼康和美联社最近也加入了 Adob​​e 的这个计划，即将 <ruby>内容认证技术<rt>content authentication</rt></ruby> 更加广泛地应用。

有了这些新工具，社交媒体平台就可以使用 Adob​​e 的 JavaScript SDK，快速让平台上的所有图像和视频显示内容凭据，这些凭据将会在鼠标悬停时，显示为右上角的一个图标。因此，无需专门的团队和更大的软件构建，该实施可以由几个开发人员在几周内完成。

CAI 的主要目标是打击互联网上的视觉错误信息，比如那些扭曲乌克兰战争的旧图片的重新传播，或是臭名昭著的南希·佩洛西的“廉价假货”。不过，数字监管链也可能使“作品被盗或出售”的内容创作者受益，这个问题多年来一直困扰着视觉艺术家，现在也正在 NFT 市场引发问题。

根据 Parsons 的说法，CAI 还引起了那些“制作合成图像和视频”的公司的巨大兴趣。公司可以将原始元数据嵌入到我们从 DALL-E 等模型中看到的那种 AI 创作中，从而确保它提供的合成图像不会轻易被误认为是真实的东西。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/adobe-launches-open-source-toolkit-to-contain-visual-misinformation/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/adobe.jpeg
