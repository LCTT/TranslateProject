[#]: subject: "An Interesting CMS With Version Control is Now Open-Source!"
[#]: via: "https://news.itsfoss.com/tinacms-open-source/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16431-1.html"

一个有趣的带有版本控制的 CMS 现已开源！
======

![][0]

> 欢迎这个项目的加入，使我们的开源世界更加丰富。

最近，TinaCMS 通过**宣布已经彻底实现开源**，使**自我托管变得更加便捷**，从而成为了 [开源 CMS][1] 俱乐部的新成员。

如果你对此还不太了解，那么简单介绍一下，CMS（内容管理系统）是一种便捷的管理网站内容的工具，其中著名的系统有 WordPress、Ghost 和 Joomla 等。

就 [TinaCMS][2] 而言，它是一款集成了 Git 版本控制的 [无头 CMS][3]，重点是代码优先和完全类型化。像 Unity 这样的知名公司就使用它来维持其文档的更新。🤯

那我们现在就来深入了解一下 TinaCMS。

### TinaCMS：可以期待什么？

![][5]

在第一次发布自托管 TinaCMS 后端的工作基础上，开发者们现已经使 TinaCMS 全面开源并在 [Apache 2.0 许可][6] 下全面可用。

早些时候，**自托管后端是在“源码可用”许可下提供的**。但是，正如我们过去所看到的，它在某些情况下可能会受到限制。更新后的许可证现在应该更准确地反映 TinaCMS 的开源性质。

TinaCMS 的 James O'Halloran 还补充道：

> 尽管这是一个非常宽松的许可证，我们依然希望开发者在基于 TinaCMS 构建应用的过程中能感到舒心，无需担心他们会遇到极限。

如果你问我，给开发者更多的权力就是最好的！😄

你是否对**布署你自己的 TinaCMS 实例**产生了兴趣？

如果你准备尝试，那么有两个主要的方式可以进行 TinaCMS 的自托管。

首先是一种更为直接的方法，开发者们也为这种方法展示了一个样例。这种方式是通过 [GitHub][8] 和 [Vercel][9] 实现的，可以在短短几分钟内完成部署。

你自己可以试试看。👇

> 📋 你可以在 [GitHub][10] 上访问这个自托管演示。

另一种方式是**在其它平台上部署**，**自托管的 TinaCMS 版本并不依赖于 Vercel**，而是能够与 [TinaCMS 支持的任何框架][11] 配合使用。

你只需**确保你的平台支持 express 请求处理程序**，以便后端 API 能够正常运行。

有关部署的更多信息，我建议你访问 [官方文档][12]。

你还可以通过官方 [公告博客][13] 进行更深入的了解。

💬 今年有很多项目都进行了开源。那么你认为接下来哪些项目应该开源呢？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tinacms-open-source/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-cms/
[2]: https://tina.io/
[3]: https://en.wikipedia.org/wiki/Headless_content_management_system
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://news.itsfoss.com/content/images/2023/11/TinaCMS.png
[6]: https://www.apache.org/licenses/LICENSE-2.0
[7]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[8]: https://github.com/
[9]: https://vercel.com/
[10]: https://github.com/tinacms/tina-self-hosted-demo
[11]: https://tina.io/docs/integration/frameworks/
[12]: https://tina.io/docs/self-hosted/overview/
[13]: https://tina.io/blog/Tinacms-is-now-fully-open-source/
[0]: https://img.linux.net.cn/data/attachment/album/202312/01/081252h5yi8hhtkfffy7w8.jpg