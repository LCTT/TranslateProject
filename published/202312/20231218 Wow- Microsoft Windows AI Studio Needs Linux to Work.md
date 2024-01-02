[#]: subject: "Wow! Microsoft Windows AI Studio Needs Linux to Work"
[#]: via: "https://news.itsfoss.com/microsoft-windows-ai-studio-linux/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16489-1.html"

哇！微软的 Windows AI Studio 需要依赖 Linux 才能运行
======

![][0]

> 没有办法，微软热爱 Linux。
 
上个周末，我意外发现了微软推出的这款全新 AI 开发工具，这得归功于 [Windows Central][1] 的报道。这条新闻源自 Venn Stone 在 [Mastodon post][2] 中的一条信息：“_第一步？安装 Linux_”。

这个消息激发了我深挖此事的兴趣，结果发现，就在一个月前，微软已经在其 [开发者博客][3] 中婉转提到了这款名为 “**Windows AI Studio**” 的工具了。

接下来，让我们深入探索一下这件新鲜事。

> 📋 注意，Windows AI Studio 还在开发中，目前还不能提供全面的技术支持。

### Windows AI Studio：仅能在 Linux 上运行？

![][4]

严格来说，是的。你应该注意到，**微软悄然推出了其崭新的开发工具**，这款工具的主要目标是**方便开发者在本地开发生成型 AI 应用**。但是，这款工具**需要依赖 Windows 的 Linux 子系统（WSL），并必须安装 Ubuntu 18.4 或更高版本才能运行**。

由于目前这还是一个预览版本，并且已经被封装为一个 VS Code 扩展，所以它还需要**安装 VS Code**，而且当前**仅能在英伟达的 GPU 上运行**。🥲

据微软的未来规划，他们打算在 Windows AI Studio 中引入 [ORT][5]/[DML][6]，以达到**更好的硬件兼容性**。

Windows AI Studio 还可以借助 [Azure AI Studio][7] 库中的开发工具以及其他例如 [Hugging Face][8] 的模型。

看到 Windows 需要依赖 Linux 总是一件振奋的事。😁

有很多开发者严重依赖 Windows，WSL 使他们能在 Linux 上开展工作变得容易，而 Windows AI Studio 这样的工具则进一步提升了他们的工作体验。

**想试一试吗？**

你可以从 [VS 市场][9] 获得 Windows Studio AI。请保证你已经**为 WSL 配置了 Ubuntu 18.4 或更高版本作为默认系统**。此外，还需要记得**使用一款性能良好的 NVIDIA GPU**。

> **[Windows AI Studio][9]**

**在市场列表中列出了所有重要的安装信息**，确保你已经仔细阅读过。另外，如想了解更多信息，你也可以访问其 [GitHub 仓库][10] 进行深入研究。

💬 你对此怎么看？

*（题图：DA/0310bdbe-0e97-48df-a0cf-4f55b0361b37）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-windows-ai-studio-linux/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://www.windowscentral.com/software-apps/windows-11/hidden-windows-11-setting-suggests-youll-soon-be-able-to-uninstall-ai-components-from-the-os
[2]: https://mast.linuxgamecast.com/@Venn/111577589308411637
[3]: https://blogs.windows.com/windowsdeveloper/2023/11/15/elevating-the-developer-experience-on-windows-with-new-ai-tools-and-productivity-tools/
[4]: https://news.itsfoss.com/content/images/2023/12/Windows_AI_Studio.png
[5]: https://onnxruntime.ai/
[6]: https://learn.microsoft.com/en-us/windows/ai/directml/dml-intro
[7]: https://azure.microsoft.com/en-us/products/ai-studio
[8]: https://huggingface.co/
[9]: https://marketplace.visualstudio.com/items?itemName=ms-windows-ai-studio.windows-ai-studio
[10]: https://github.com/microsoft/windows-ai-studio
[0]: https://img.linux.net.cn/data/attachment/album/202312/19/230333a99wh9anm5fm5iw5.jpg