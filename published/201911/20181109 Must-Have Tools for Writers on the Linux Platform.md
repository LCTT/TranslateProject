Linux 平台上的写作者必备工具
======

![](https://img.linux.net.cn/data/attachment/album/201911/25/000129eee2zydelz22vj9h.jpg)

我从事作家已有 20 多年了。我撰写了数千篇有关各种技术主题的文章和指南，并撰写了 40 多本小说。因此，书面文字不仅对我很重要，还很熟悉，成为了我的第二种自然交流的方式。在过去的二十年中（而且还在继续），我几乎都是在 Linux 平台上完成的所有工作。我必须承认，在早期，这并不总是那么容易。格式并不总是与编辑器所需要的相吻合，在某些情况下，开源平台根本没有完成工作所需的必要工具。

那时已经过去，现在已经不同了。

Linux 演进和基于 Web 的工具的相得益彰使得它可以让任何写作者都能在 Linux 上完成工作（并且做得很好）。但是你需要什么工具？你可能会惊讶地发现，在某些情况下，使用 100％ 开源的工具无法有效完成这项工作。不过即使如此，工作总是可以完成的。让我们来看看我作为技术作家和小说作者一直使用的工具。我将通过小说和非小说类的写作过程来概述这一点（因为过程不同，需要特定的工具）。

对认真的 Linux 硬核用户预先做个预警。很久以前，我就放弃了使用 LaTeX 和 DocBook 之类的工具进行写作。为什么？因为对我而言，重点必须放在内容上，而不是过程上。当你面临最后期限时，必须以效率为先。

### 非小说类

我们将从非虚构写作入手，因为这是两者中较简单的过程。为了编写技术指南，我与不同的编辑人员合作，并且在某些情况下，必须将内容复制/粘贴到 CMS 中。但是就像我的小说一样，整个过程总是从 Google 云端硬盘开始。在这一点上，许多开源纯粹主义者会转身走开。不用担心，你始终可以选择将所有文件保存在本地，也可以使用更开放友好的云服务（例如 [Zoho][1] 或 [nextCloud][2]）。

为什么要从云端开始？多年来，我发现我需要能够随时随地访问那些内容。最简单的解决方案是迁移到云上。我对丢失工作成果这件事也很偏执。为此，我使用了 [Insync][3] 之类的工具来使我的 Google 云端硬盘与桌面保持同步。有了桌面同步功能，我知道我的工作成果总是有备份，以防万一 Google 云端硬盘出了问题。

对于那些我必须与之一起将内容输入到内容管理系统（CMS）的客户，该过程到此结束。我可以直接从 Google 文档复制/粘贴到 CMS 中，并完成此操作。当然，对于技术内容，总是涉及到屏幕截图。为此，我使用 [Gimp][4]，它使得截取屏幕截图变得简单：

![screenshot with Gimp][6]

*图 1：使用 Gimp 截屏。*

1. 打开 Gimp。
2. 单击“文件>创建>屏幕快照”。
3. 选择单个窗口、整个屏幕或要抓取的区域（图 1）。
4. 单击“抓取”。

我的大多数客户倾向于使用 Google 文档，因为我可以共享文件夹，以便他们可以可靠地访问该内容。我有一些无法使用 Google 文档的客户，因此我必须将文件下载为可以使用的格式。为此，我要做的是下载 .odt 格式，以 [LibreOffice][8] 打开文档（图 2），根据需要设置格式，保存为客户所需的格式，然后发送文档。

![Google Doc][10]

*图 2：在 LibreOffice 中打开我下载的 Google 文档。*

非小说类作品这样就行了。

### 小说类

这里会稍微变得有点复杂。开始的步骤是相同的​​，因为我总是在 Google 文档中写小说的每个初稿。完成后，我将文件下载到 Linux 桌面，在 LibreOffice 中打开文件，根据需要设置格式，然后另存为编辑器支持的文件类型（不幸的是，这意味着是 .docx）。

该过程的下一步变得有些琐碎。我的编辑更喜欢使用注释来跟踪更改（因为这使我们俩阅读文档和做出更改一样容易）。因此，一个 60k 的 word 文档可以包含成百上千的注释，这会使 LibreOffice 慢的像爬一样。从前，你可以增加用于文档的内存，但是从 LibreOffice 6 开始，这不再可行。这意味着任何较大的、像小说一样长的、带有大量注释的文档都将无法使用。因此，我不得不采取一些极端的措施，使用 [WPS Office][11]（图 3）。尽管这不是开源解决方案，但 WPS Office 在文档中包含大量注释的情况下做得很好，因此无需处理 LibreOffice 所带来的麻烦（当处理带有数百个注释的大型文件时）。

![comments][13]

*图 3：WPS 可以轻松处理大量注释。*

一旦我和我的编辑完成了对书的编辑（所有评论都已删除），我就可以在 LibreOffice 中打开文件进行最终格式化。格式化完成后，我将文件保存为 .html 格式，然后以 [Calibre][14] 打开文件以将文件导出为 .mobi 和 .epub 格式。

对于希望在 Amazon、Barnes＆Noble、Smashwords 或其他平台上出版的任何人，Calibre 都是必备工具。Caliber 比其他类似解决方案更好地方是，它使你可以直接编辑 .epub 文件（图 4）。对于 Smashword 来说，这是绝对必要的（因为导出过程将添加 Smashwords 转换工具上不接受的元素）。

![Calibre][16]

*图 4：直接在 Calibre 中编辑 epub 文件。*

写作过程结束后（或有时在等待编辑完成一校时），我将开始为书制作封面。该任务完全在 Gimp 中处理（图 5）。

![Using Gimp][19]

*图 5：在 Gimp 中创建 POTUS 的封面。*

这样就完成了在 Linux 平台上创建小说的过程。由于文档的篇幅以及某些编辑人员的工作方式，与创建非小说类的过程相比，它可能会变得有些复杂，但这远没有挑战性。实际上，在 Linux 上创建小说与其他平台一样简单（并且更可靠）。

### 希望这可以帮助你

我希望这可以帮助有抱负的作家有信心在 Linux 平台上进行写作。还有许多其他工具可供使用，但是多年来我在这里列出的工具很好地服务了我。而且，尽管我确实使用了几个专有的工具，但只要它们在 Linux 上都能正常运行，我觉得是可以的。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/2018/11/must-have-tools-writers-linux-platform

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://www.zoho.com/
[2]: https://nextcloud.com/
[3]: https://www.insynchq.com
[4]: https://www.gimp.org/
[5]: /files/images/writingtools1jpg
[6]: https://lcom.static.linuxfound.org/sites/lcom/files/writingtools_1.jpg (screenshot with Gimp)
[7]: /licenses/category/used-permission
[8]: https://www.libreoffice.org/
[9]: /files/images/writingtools2jpg
[10]: https://lcom.static.linuxfound.org/sites/lcom/files/writingtools_2.jpg (Google Doc)
[11]: https://www.wps.com/en-US/
[12]: /files/images/writingtools3jpg
[13]: https://lcom.static.linuxfound.org/sites/lcom/files/writingtools_3.jpg (comments)
[14]: https://calibre-ebook.com/
[15]: /files/images/writingtools4jpg
[16]: https://lcom.static.linuxfound.org/sites/lcom/files/writingtools_4.jpg (Calibre)
[17]: /licenses/category/creative-commons-zero
[18]: /files/images/writingtools5jpg
[19]: https://lcom.static.linuxfound.org/sites/lcom/files/writingtools_5.jpg (Using Gimp)
[20]: https://training.linuxfoundation.org/training/introduction-to-open-source-development-git-and-linux/?utm_source=linux.com&utm_medium=article&utm_campaign=lfd201
