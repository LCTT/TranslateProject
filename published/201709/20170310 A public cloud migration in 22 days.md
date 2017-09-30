22 天迁移到公共云
============================================================

![A public cloud migration in 22 days](https://i.nextmedia.com.au/Utils/ImageResizer.ashx?n=http%3a%2f%2fi.nextmedia.com.au%2fNews%2fLush.jpg&w=480&c=0&s=1) 

> Lush 说这是可能的。


在不到一个月内将你的核心业务从一个公共云迁移到另一个公共云看起来像是一个遥不可及的目标，但是英国化妆品巨头 Lush 认为可以做到这一点。

去年九月 Lush —— 你也许知道它是那些糖果色的、好闻的沐浴和护肤产品背后的公司 —— 与已有的基础设施供应商 Acquia 的合同快要到期了。

Acquia 已经在 AWS 中托管了 Lush 的基于 Drupal 的电子商务环境好几年了，但该零售商想要退出合作。

根据 Lush 的首席数字官及公司的继承人 Jack Constantine（他的父母在 1995 年成立该公司）的说法，该安排是“尴尬”和僵硬的。

他今天在旧金山举行的 Google Cloud Next 会议上说：“我们不太满意那份合同，我们想看看我们还能做些什么。”

“那是一个非常封闭的环境，这使我们难于看清下一步做什么。”

“(我们) 可以再签署一年，在此期间想出一个有更多的控制权的长期计划，但是（我们）最终结束了这种挣扎。”

在淘遍市场后，Lush 目标放在 Google 的云平台上。该公司已经很熟悉 Google 了，已于 [2013 年底][6]从 Scalix 迁移到 Google Apps（现称为 G Suite）上。

然而，只有几个月不到的时间进行迁移，要赶在 12 月 22 日现有合同截止前和圣诞节购物的关键时期前。

Constantine 说：“所以这不仅仅是有点关键的业务，我们要考虑高峰交易期，那时会有巨大的交易。”

Lush 摆脱了官僚主义意味着 Constantine 能够在选择供应商上快速决定。他说：“接着团队只要全力进行就行。”

他们还为这次迁移专门优先优化了用于迁移的 “一体化” Drupal 程序，而把 bug 修复推到以后。

Lush 12 月 1 日开始物理迁移，12 月 22 日完成。

团队“像其他迁移一样”遇到了挑战，Constantine 说：“你肯定会担心将数据从一个地方传输到另一个地方，你必须确保一致性，客户、产品数据等需要稳定。”

但是，这位 CDO 表示，让公司采用这个难以置信的紧张时间表是因为团队缺乏备选方案: 没有后备计划。

Constantine 说：“在截止日期前的一个星期，我的同事和我们的 Google 合作伙伴打了电话，他们对这是否会发生有点紧张，他们问我们 Plan B 是什么，我的同事说：Plan B 就是让 Plan A，就是这样”。

“当你抛出这样一个听起来有点难以置信的艰难的截止日期时，而（你需要保持）关注那些认为这是我们可在这个时间范围内可以实现的目标的人，而不是那些放置阻碍说‘我们必须要延期’的人。”

“是的，每个人都很紧张，但你实现了很多。你实际上完成并盯牢了它。你所要做的就是完成、完成。”

现在的重点是将该电子商务应用转移到微服务架构，同时研究各种 Google 工具，如 Kubernetes 容器管理系统和 Spanner 关系数据库。

Constantine 说，该零售商最近也建立了使用 GCP 和 Android 的原型 POS 系统。


（题图：Lush's Oxford St, UK store. Credit: Lush）

--------------------------------------------------------------------------------

via: https://www.itnews.com.au/news/a-public-cloud-migration-in-22-days-454186

作者：[Allie Coyne][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.itnews.com.au/author/allie-coyne-461593
[1]:http://www.memset.com/about-us/case-studies/lush-cosmetics/
[2]:https://cloud.googleblog.com/2013/12/google-apps-helps-eco-cosmetics-company.html
[3]:http://www.memset.com/about-us/case-studies/lush-cosmetics/
[4]:https://cloud.googleblog.com/2013/12/google-apps-helps-eco-cosmetics-company.html
[5]:http://www.memset.com/about-us/case-studies/lush-cosmetics/
[6]:https://cloud.googleblog.com/2013/12/google-apps-helps-eco-cosmetics-company.html
