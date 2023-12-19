[#]: subject: "Wow! Microsoft Windows AI Studio Needs Linux to Work"
[#]: via: "https://news.itsfoss.com/microsoft-windows-ai-studio-linux/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Wow! Microsoft Windows AI Studio Needs Linux to Work
======
Microsoft loves Linux because there's no way out.
Over the weekend, I stumbled upon **a new AI-focused development tool by Microsoft** thanks to [Windows Central][1]. This came to light thanks to [a Mastodon post][2] made by Venn Stone that said, “ _Step 1? Install Linux._ ”

That prompted me to dig deeper into this matter, and, as it turns out, Microsoft had teased the tool called “ **Windows AI Studio** ” just a month prior in a [developer blog][3].

So, let's dive in and see what this is all about.

📋

Windows AI Studio is undergoing development, expect limited support for now.

### Windows AI Studio: A Linux-Only Affair?

![][4]

Well, kind of. You see, **Microsoft has silently debuted their new development tool** that is **meant to make it easy to develop gnerative AI apps locally**. However, it **needs Windows Subsystem for Linux (WSL) with Ubuntu 18.4 or later to run**.

As this is a preview version packaged as a VS Code Extension, it also **requires Visual Studio Code to be installed** , and **will only run on NVIDIA GPUs** for now. 🥲

Future plans indicate that they intend to implement [ORT][5]/[DML][6] into Windows AI Studio for **better hardware compatibility**.

Windows AI Studio also takes advantage of development tools and models from the [Azure AI Studio][7] Catalog, and even others such as [Hugging Face][8].

It is always a great sight to see Windows depending on Linux. 😁

Plenty of developers out there depend heavily on Windows, WSL just makes it easier for them to do their work on Linux, and tools like Windows AI Studio just add more to the experience.

**Want to give it a try?**

You can get started with Windows Studio AI by getting it from the [VS Marketplace][9]. Just **ensure that you have configured WSL with Ubuntu 18.4 or later** as the default. Moreover, please remember to **use a capable NVIDIA GPU**.

[Windows AI Studio][9]

The **marketplace listing has all the important installation information** , so make sure to go through that carefully. Additionally, you can also visit its [GitHub repo][10] for further research.

💬 _What are your thoughts on this?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-windows-ai-studio-linux/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
