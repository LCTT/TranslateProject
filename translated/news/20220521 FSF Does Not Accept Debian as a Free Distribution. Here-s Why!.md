[#]: subject: "FSF Does Not Accept Debian as a Free Distribution. Here’s Why!"
[#]: via: "https://news.itsfoss.com/fsf-does-not-consider-debian-a-free-distribution/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lkxed"
[#]: translator: "Chao-zhi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

自由软件基金会为什么不认为 Debian 是一种自由发行版？
======
![Why FSF doesn't consider Debian a free distribution][1]

Debian 项目开发了一个尊重用户自由的 G​​NU/Linux 发行版。它的 non-free 软件源中拥有许多根据各式各样的自由许可证分发的软件。这些软件真正被发布到 Debian 之前会进行清理。而自由软件基金会 (Free Software Foundation, FSF) 维护着一份[自由的 GNU/Linux 发行版列表](2)，但奇怪的是，Debian 并不在这个列表中。事实是 Debian 不符合进入此列表的某些标准，我们很想知道到底不满足哪些标准。但首先，我们需要了解所有这些劳心劳力的工作是如何得到证明的。换句话说，为什么要费心尝试进入一些名单，尤其是这个名单？

曾于 2010 年至 2013 年担任 Debian 项目负责人的 Stefano Zacchiroli 曾表示 Debian 应该获得 FSF 的承认以维护它自由发行版的地位的几个原因。其中一个原因，Stefano 称之为“外部审查”，我特别赞同。事实是 Debian 的软件应当满足一些标准和质量水平才能成为发行版的一部分，但除了 Debian 开发人员自己之外没有人控制这个过程。如果该发行版被包含在这份珍贵的清单中，那么 FSF 将密切关注 Debian 的命运，并给予适度的批评。我相信这是很好的动力。如果你也这么认为，那么现在让我们看看 FSF 认为 Debian 不够自由的原因。

### Debian 社会契约

除了自由的 GNU/Linux 发行版列表之外，FSF 还维护着一份 GNU/Linux 发行版的列表，这些发行版由于某种原因被拒绝为自由状态。对于此列表中的每个发行版，都有一个带有拒绝的简短论据的评论。从对 Debian 的评论中可以清楚地看出，FSF 和 Debian 项目在对“自由分发”一词的解释上产生分歧的主要根源是一份被称为 Debian 社会契约的文件。

Debian 社会契约有五点。要回答主要问题，我们只需要关注其中两个点——即第一个和第五个，其他的省略。在[此处](3)查看合同的完整版本。

第一点说：« **Debian 将保持 100% 自由**。我们在标题为“Debian 自由软件指南”的文档中提供了用于确定作品是否“自由”的指南。我们承诺根据这些指南，Debian 系统及其所有组件将是自由的。我们将支持在 Debian 上创建或使用自由和非自由作品的人。我们永远不会让系统需要使用非自由组件。»

同时，第五点写道：« **不符合我们自由软件标准的作品**。我们承认我们的一些用户需要使用不符合 Debian 自由软件指南的作品。我们在我们的档案中为这些作品创建了“free”和“non-free”区域。这些区域中的软件包不是 Debian 系统的一部分，尽管它们已被配置为与 Debian 一起使用。我们鼓励 CD 制造商阅读这些区域的软件包许可证，并确定他们是否可以在其 CD 上分发这些软件包。因此，尽管非自由作品不是 Debian 的一部分，但我们支持它们的使用并为非自由软件包提供基础设施（例如我们的错误跟踪系统和邮件列表）。»

尽管合同规定分发将保持 100% 自由，但它允许官方存档的部分可能包含非自由软件或依赖于某些非自由组件的自由软件。形式上，根据同一份合同，这些部分中的软件不是 Debian 的一部分，但 FSF 对此感到困扰，因为这些部分使在系统上安装非自由软件变得更加容易。

2011 年时，FSF 有合理的理由不考虑 Debian 自由版——该发行版附带了一个未清除二进制 blob 的 Linux 内核。但自 2011 年 2 月发布的 Squeeze 至今，Debian 已经包含了完全自由的 Linux 内核。因此，简化非自由软件的安装是 FSF 无法将 Debian 识别为自由发行版的主要原因，直到 2016 年这是我知道的唯一原因，但在 2016 年初出现了问题……

### 等等…… 关 Firefox 什么事？

很长一段时间，Debian 都包含一个名为 Iceweasel 的浏览器，它只不过是 Firefox 浏览器的更名。进行品牌重塑有两个原因。首先，浏览器标志和名称是 Mozilla 基金会的商标，提供非自由软件与 DFSG 相抵触。其次，通过在发行版中包含浏览器，Debian 开发人员必须遵守 Mozilla 基金会的要求，该基金会禁止以 Firefox 的名义交付浏览器的修改版本。因此，开发人员不得不更改名称，因为他们不断更改浏览器代码以修复错误并消除漏洞。但在 2016 年初，Debian 有幸拥有一款经过修改的浏览器，不受上述限制，可以保留原来的名称和徽标。一方面，这是对 Debian 修改的认可，也是对 Debian 信任的体现。另一方面，该软件显然没有从非自由组件中清除，现在已成为发行版的一部分。如果此时 Debian 已被列入免费 GNU/Linux 发行版列表，那么自由软件基金会会毫不犹豫地指出这一点。

### 结论

数字世界中的自由与现实世界中的自由同样重要。在这篇文章中，我试图揭示 Debian 最重要的特性之一——开发与用户自由相关的发行版。开发人员花费额外的时间从软件中清理非自由组件，并且以 Debian 为技术基础的数十个发行版继承了它的工作，并由此获得了一部分自由。

另外，我想分享一个简单的观察，即自由并不像乍看起来那么简单，人们自然会去追问什么是真正的自由和什么不是。由于 Firefox 的存在，Debian 现在不能被称为自由的 GNU/Linux 发行版。但从 2011 年，当 Debian 终于开始清理内核以及发行版的其他组件时，直到 2016 年 Firefox 成为发行版的一部分，自由软件基金会出于纯粹的意识形态原因并不认为该发行版是自由的：原因是 Debian 大大简化了非自由软件的安装……现在轮到你权衡所有的争论并决定是否将 GNU/Linux 发行版视为自由的了。

祝你好运！并尽可能保持自由。

由 Evgeny Golyshev 为 [Cusdeb.com](4) 撰写

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fsf-does-not-consider-debian-a-free-distribution/

作者：[Abhishek][a]
选题：[lkxed][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/why-fsf-doesnt-consider-debian-a-free-software-1200-%C3%97-675px.png
[2]: https://gnu.org/distros/free-distros.en.html
[3]: https://debian.org/social_contract
[4]: https://wiki.cusdeb.com/Essays:Why_the_FSF_does_not_consider_Debian_as_a_free_distribution/en
