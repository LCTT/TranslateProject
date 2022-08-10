[#]: subject: "What Made Fedora Choose To Use CC0 Licensed Code As The Boot"
[#]: via: "https://www.opensourceforu.com/2022/08/what-made-fedora-choose-to-use-cc0-licensed-code-as-the-boot/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "yjacks"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
为什么 Fedora 一开始允许使用 CC0 许可证
======

![fedora-1024x614][1]

开源是一个具有挑战性的概念。许多人认为，开源意味着可以任意的使用软件，亦或者是免费下载。这实际上取决于你如何被许可——开发者分享代码时使用的许可证决定了它。开源软件可以是收费的，也可以限制你如何去使用它，甚至让你陷入法律麻烦。

Fedora 项目最近决定拒绝所有使用 <ruby>知识共享<rt>Creative Commons</rt></ruby> "公共领域贡献"  CC0 许可证开放的代码，以避免 CC0 许可的代码的出现。CC0 将从新提交代码中准许使用的许可证列表中剔除，但是，像艺术品一类的贡献仍被允许，甚至可能对目前的包进行逐一的处理。

CC0 是因为什么让 Fedora 决定停止支持它，这又是不是意味着你不能在你自己的项目中使用它呢？

这一段描述让最熟悉 CC 及其许可系列的人惊讶的是，Fedora 最初允许了 CC0 的软件。毕竟， 知识共享从一开始的目标是为艺术作品提供一系列明确的许可证。该组织的使命和许可证的要求在其名称——知识共享中就有体现。

为了"克服分享信息和创造力的法律障碍"，他们提供了一个自由框架来为人们组织分享如音乐、医学或教育材料的资源，知识共享组织的前身——<ruby>开放内容项目<rt>Open Content Project</rt></ruby>，创建于2001年。然而，软件从来不是组成它的要素。为什么呢？因为那时，如 MIT 、 GPL 一类的重要的软件许可证已经出现了十几年。

很明显，在一些特定的领域，你也许需要相信一个公司的创造是无害的。CC FAQ 列出了说些反对使用他们的软件许可证的令人信服的论据，但对于像 Fedora 项目这样的用户来说，有一个问题特别突出：专利权。

也许是很明显的，使用 CC0 许可证意味着在公共领域使用它，它很明确的表示“在全球范围内放弃他或她根据版权法对该作品的所有权利。”但是，问题在于，版权法并不适用于专利。事实上，仔细审视许可证的完整措辞后可以发现，它在一个令人担忧的部分解决了这个问题，该部分内容如下：“宣告者拥有的任何商标或专利权都没有被放弃、抛弃、放弃、租赁或以其他方式被本文件修改。”

在别的措辞中，甚至当授权在 CC0 许可证下时——这意味着可能将放弃放弃对它的一切权力，开发者仍然可以自由的为它申请专利。更糟糕的是，他们仍然保留着以他们认为合适的方式使用该专利的能力。

理论上来说，这意味着最初在 CC0 下提供的源代码的人在发布了代码之后，他们可以断言任何使用该代码的人侵犯了他们的专利，并要求支付专利费。

这显然会让像 Fedora 这样的项目担忧。考虑到 CC0 授权的场景是组成系统的核心包，然后将被用于数以百万计的用户。不知道从哪里冒出来的原创作者，声称侵犯了专利权，并要求付款。红帽或 Fedora 的律师可以驳倒这种说法么？也许吧。那么，有使用 CC0 代码的价值么？没有。

要着重提到的是，这完全不是一个新问题。实际上，回到 2012 年，专利法阻止了开源倡议（OSI）许可证的审查委员会。因此，他们无法最终确定 CC0 是否真正符合他们对开放源代码许可的定义。委员会未能达成一致意见，因为其成员认为将此类条款纳入软件许可将创造一个危险的先例。考虑到 Fedora 动荡的历史，它最初接受 CC0 的决定着实让人费解。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/what-made-fedora-choose-to-use-cc0-licensed-code-as-the-boot/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[yjacks](https://github.com/yjacks)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/08/fedora-1024x614-1-e1659346500461.jpg
