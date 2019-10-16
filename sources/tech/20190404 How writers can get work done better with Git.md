[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How writers can get work done better with Git)
[#]: via: (https://opensource.com/article/19/4/write-git)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/noreplyhttps://opensource.com/users/seth)

用 Git 帮助写作者更好地完成工作
======

> 如果你是一名写作者，你也能从使用 Git 中受益。在我们的系列文章中了解有关 Git 鲜为人知的用法。

![Writing Hand][1]

[Git][2] 是一个少有的能将如此多的现代计算封装到一个程序之中的应用程序，它可以用作许多其他应用程序的计算引擎。虽然它以跟踪软件开发中的源代码更改而闻名，但它还有许多其他用途，可以让你的生活更轻松、更有条理。在这个 Git 系列中，我们将分享七种鲜为人知的使用 Git 的方法。

今天我们来看看写作者如何使用 Git 更好的地完成工作。

### 写作者的 Git

有些人写小说，也有人撰写学术论文、诗歌、剧本、技术手册或有关开源的文章。许多人都在做一点各种写作。相同的是，如果你是一名写作者，则或许能从使用 Git 中受益。尽管 Git 是著名的计算机程序员所使用的高度技术性工具，但它也是现代写作者的理想之选，本文将向你演示如何改变你的书写方式以及为什么要这么做的原因。

但是，在谈论 Git 之前，重要的是先谈谈“副本”（或者叫“内容”，对于数字时代而言）到底是什么，以及为什么它与你的交付*媒介*不同。这是 21 世纪，大多数写作者选择的工具是计算机。尽管计算机看似擅长将副本的编辑和布局等过程结合在一起，但写作者还是（重新）发现将内容与样式分开是一个好主意。这意味着你应该在计算机上像在打字机上而不是在文字处理器中进行书写。以计算机术语而言，这意味着以*纯文本*形式写作。

### 以纯文本写作

这个假设曾经是毫无疑问的：你知道自己的写作所要针对的市场，你可以为书籍、网站或软件手册等不同市场编写内容。但是，近来各种市场趋于扁平化：你可能决定在纸质书中使用为网站编写的内容，并且纸质书可能会在以后发布 EPUB 版本。对于你的内容的数字版本，读者才是最终控制者：他们可以在你发布内容的网站上阅读你的文字，也可以点击 Firefox 出色的[阅读视图][3]，还可能会打印到纸张上，或者可能会使用 Lynx 将网页转储到文本文件中，甚至可能因为使用屏幕阅读器而根本看不到你的内容。

你只需要逐字写下你的内容，而将交付工作留给发布者。即使你是自己发布，将字词作为写作作品的一种源代码也是一种更聪明、更有效的工作方式，因为在发布时，你可以使用相同的源（你的纯文本）生成适合你的目标输出（用于打印的 PDF、用于电子书的 EPUB、用于网站的 HTML 等）。

用纯文本编写不仅意味着你不必担心布局或文本样式，而且也不再需要专门的工具。无论是手机或平板电脑上的基本记事本应用程序、计算机附带的文本编辑器，还是从互联网上下载的免费编辑器，任何能够产生文本内容的工具对你而言都是有效的“文字处理器”。无论你身在何处或在做什么，几乎可以在任何设备上书写，并且所生成的文本可以与你的项目完美集成，而无需进行任何修改。

而且，Git 专门用来管理纯文本。

### Atom 编辑器

当你以纯文本形式书写时，文字处理程序会显得过于庞大。使用文本编辑器更容易，因为文本编辑器不会尝试“有效地”重组输入内容。它使你可以将脑海中的单词输入到屏幕中，而不会受到干扰。更好的是，文本编辑器通常是围绕插件体系结构设计的，这样应用程序本身就很基础（它用来编辑文本），但是你可以围绕它构建一个环境来满足你的各种需求。

[Atom][4] 编辑器就是这种设计理念的一个很好的例子。这是一个具有内置 Git 集成的跨平台文本编辑器。如果你不熟悉纯文本格式，也不熟悉 Git，那么 Atom 是最简单的入门方法。

#### 安装 Git 和 Atom

首先，请确保你的系统上已安装 Git。如果运行 Linux 或 BSD，则 Git 在软件存储库或 ports 树中可用。你使用的命令将根据你的发行版而有所不同。例如在 Fedora 上：

```
$ sudo dnf install git
```

你也可以下载并安装适用于 [Mac][5] 和 [Windows][6] 的 Git。

你不需要直接使用 Git，因为 Atom 会充当你的 Git 界面。下一步是安装 Atom。

如果你使用的是 Linux，请通过软件安装程序或适当的命令从软件存储库中安装 Atom，例如：

```
$ sudo dnf install atom
```

Atom 当前没有在 BSD 上构建。但是，有很好的替代方法，例如 [GNU Emacs][7]。对于 Mac 和 Windows 用户，可以在 [Atom 网站][4]上找到安装程序。

安装完成后，启动 Atom 编辑器。

#### 快速指导

如果要使用纯文本和 Git，则需要适应你的编辑器。Atom 的用户界面可能比你习惯的更加动态。实际上，你可以将它视为 Firefox 或 Chrome，而不是文字处理程序，因为它具有可以根据需要打开和关闭的选项卡和面板，甚至还可以安装和配置附件。尝试全部掌握 Atom 如许之多的功能是不切实际的，但是你至少可以知道有什么功能。

当 Atom 打开时，它将显示一个欢迎屏幕。如果不出意外，此屏幕很好地介绍了 Atom 的选项卡式界面。你可以通过单击 Atom 窗口顶部选项卡上的“关闭”图标来关闭欢迎屏幕，并使用“文件 > 新建文件”创建一个新文件。

使用纯文本格式与使用文字处理程序有点不同，因此这里有一些技巧，以人可以连接的方式编写内容，并且 Git 和计算机可以解析，跟踪和转换。

#### 用 Markdown 书写

如今，当人们谈论纯文本时，大多是指 Markdown。Markdown 与其说是格式，不如说是样式，这意味着它旨在为文本提供可预测的结构，以便计算机可以检测自然的模式并智能地转换文本。Markdown 有很多定义，但是最好的技术定义和备忘单在 [CommonMark 的网站][8]上。

```
# Chapter 1

This is a paragraph with an *italic* word and a **bold** word in it.
And it can even reference an image.

![An image will render here.](drawing.jpg)
```

从示例中可以看出，Markdown 读起来感觉不像代码，但可以将其视为代码。如果你遵循 CommonMark 定义的 Markdown 规范，那么一键就可以可靠地将 Markdown 的文字转换为 .docx、.epub、.html、MediaWiki、.odt、.pdf、.rtf 和各种其他的格式，而*不会*失去格式。

你可以认为 Markdown 有点像文字处理程序的样式。如果你曾经为出版社撰写过一套样式来控制章节标题和章节标题的样式，那基本上就是一回事，除了不是从下拉菜单中选择样式以外，你要给你的文字添加一些小记号。对于任何习惯“以文字交谈”的现代阅读者来说，这些表示法都是很自然的，但是在呈现文本时，它们会被精美的文本样式替换掉。实际上，这是文字处理程序在后台秘密进行的操作。文字处理器显示粗体文本，但是如果你可以看到使文本变为粗体的生成代码，则它与 Markdown 很像（实际上，它是更复杂的 XML）。使用 Markdown 可以消除这种代码和样式之间的阻隔，一方面看起来更可怕，但另一方面，你可以在几乎所有可以生成文本的东西上书写 Markdown 而不会丢失任何格式信息。

Markdown 文件流行d 文件扩展名是 .md。如果你使用的平台不知道 .md 文件是什么，则可以手动将扩展名与 Atom 关联，或者仅使用通用的 .txt 扩展名。文件扩展名不会更改文件的性质。它只会改变你的计算机决定如何处理它的方式。Atom 和某些平台足够聪明，可以知道该文件是纯文本格式，无论你给它以什么扩展名。

#### 实时预览

Atom 具有 “Markdown 预览” 插件，该插件可以向你显示正在编写的纯文本 Markdown 及其（通常）呈现的方式。

![Atom's preview screen][9]

要激活此预览窗格，请选择“包 > Markdown 预览 > 切换预览” 或按 `Ctrl + Shift + M`。

此视图为你提供了两全其美的方法。无需承担为你的文本添加样式的负担，就可以写作，而你也可以看到一个通用的示例外观，至少是以典型的数字化格式显示了文本的外观。当然，关键是你无法控制文本的最终呈现方式，因此不要试图调整 Markdown 来强制以某种方式显示呈现的预览。

#### 每行一句话

你的高中写作老师不会看你的 Markdown。

一开始它并那么自然，但是在数字世界中，保持每行一个句子更有意义。Markdown 忽略单个换行符（当你按下 Return 或 Enter 键时），并且只在单个空行之后才会创建一个新段落。

![Writing in Atom][10]

每行写一个句子的好处是你的工作更容易跟踪。也就是说，如果你在段落的开头更改了一个单词，那么如果更改仅限于一行而不是一个长的段落中的一个单词，那么 Atom、Git 或任何应用程序很容易以有意义的方式突出显示该更改。换句话说，对一个句子的更改只会影响该句子，而不会影响整个段落。

你可能会想：“许多文字处理器也可以跟踪更改，它们可以突出显示已更改的单个单词。”但是这些修订跟踪器绑定到该字处理器的界面上，这意味着你必须先打开该字处理器才能浏览修订。在纯文本工作流程中，你可以以纯文本形式查看修订，这意味着无论手头有什么，只要该设备可以处理纯文本（大多数都可以），就可以进行编辑或批准编辑。

诚然，写作者通常不会考虑行号，但它对于计算机有用，并且通常是一个很好的参考点。默认情况下，Atom 为文本文档的行进行编号。按下 Enter 键或 Return 键后，一*行*就是一行。

![Writing in Atom][11]

如果一行中有一个点而不是一个数字，则表示它是上一行折叠的一部分，因为它不超出了你的屏幕。

#### 主题

如果你是一个在意视觉形象的人，那么你可能会非常注重自己的写作环境。即使你使用普通的 Markdown 进行编写，也并不意味着你必须使用程序员的字体或在使你看起来像码农的黑窗口中进行书写。修改 Atom 外观的最简单方法是使用[主题包][12]。主题设计人员通常将深色主题与浅色主题区分开，因此你可以根据需要使用关键字“Dark”或“Light”进行搜索。

要安装主题，请选择“编辑 > 首选项”。这将在 Atom 界面中打开一个新标签页。是的，标签页可以用于处理文档*和*用于配置及控制面板。在“设置”标签页中，单击“安装”类别。

在“安装”面板中，搜索要安装的主题的名称。单击搜索字段右侧的“主题”按钮，以仅搜索主题。找到主题后，单击其“安装”按钮。

![Atom's themes][13]

要使用已安装的主题或根据喜好自定义主题，请导航至“设置”标签页中的“主题”类别中。从下拉菜单中选择要使用的主题。更改会立即进行，因此你可以准确了解主题如何影响您的环境。

你也可以在“设置”标签的“编辑器”类别中更改工作字体。Atom 默认采用等宽字体，程序员通常首选这种字体。但是你可以使用系统上的任何字体，无论是衬线字体、无衬线字体、哥特式字体还是草书字体。无论你想整天盯着什么字体都行。

作为相关说明，默认情况下，Atom 会在其屏幕上绘制一条垂直线，以提示编写代码的人员。程序员通常不想编写太长的代码行，因此这条垂直线会提醒他们不要写太长的代码行。不过，这条竖线对写作者而言毫无意义，你可以通过禁用 “wrap-guide” 包将其删除。

要禁用 “wrap-guide” 软件包，请在“设置”标签中选择“折行”类别，然后搜索 “wrap-guide”。找到该程序包后，单击其“禁用”按钮。

#### 动态结构

创建长文档时，我发现每个文件写一个章节比在一个文件中写整本书更有意义。此外，我不会以明显的语法 ` chapter-1.md` 或 `1.example.md` 来命名我的章节，而是以章节标题或关键词（例如 `example.md`）命名。为了将来为自己提供有关如何编写本书的指导，我维护了一个名为 `toc.md` （用于“目录”）的文件，其中列出了各章的（当前）顺序。

我这样做是因为，无论我多么相信第 6 章都不可能出现在第 1 章之前，但在我完成整本书之前，几乎不大可能出现我不会交换一两个章节的顺序。我发现从一开始就保持动态变化可以帮助我避免重命名混乱，也可以帮助我避免僵化的结构。

### 在 Atom 中使用 Git

每位写作者的共同点是两件事：他们为流传而写作，而他们的写作是一段旅程。你无需坐下来写作就完成最终稿件。顾名思义，你有一个初稿。该草稿会经过修订，你会仔细地将每个修订保存一式两份或三份，以防万一你的文件损坏了。最终，你得到了所谓的最终草案，但很有可能你有一天还会回到这份最终草案，要么恢复好的部分要么修改坏的部分。

Atom 最令人兴奋的功能是其强大的 Git 集成。无需离开 Atom，你就可以与 Git 的所有主要功能进行交互，跟踪和更新项目、回滚你不喜欢的更改、集成来自协作者的更改等等。最好的学习方法就是逐步学习，因此这是从写作项目开始到结束在 Atom 界面中使用 Git 的方法。

第一件事：通过选择 “视图 > 切换 Git 标签页” 来显示 Git 面板。这将在 Atom 界面的右侧打开一个新标签页。现在没什么可看的，所以暂时保持打开状态就行。

#### 建立一个 Git 项目

你可以将 Git 视为它被绑定到文件夹。Git 目录之外的任何文件夹都不知道 Git，而 Git 也不知道外面。Git 目录中的文件夹和文件将被忽略，直到你授予 Git 权限来跟踪它们为止。

你可以通过在 Atom 中创建新的项目文件夹来创建 Git 项目。选择 “文件 > 添加项目文件夹”，然后在系统上创建一个新文件夹。你创建的文件夹将出现在 Atom 窗口的左侧“项目面板”中。

#### Git 添加文件

右键单击你的新项目文件夹，然后选择“新建文件”以在项目文件夹中创建一个新文件。如果你要导入文件到新项目中，请右键单击该文件夹，然后选择“在文件管理器中显示”，以在系统的文件查看器中打开该文件夹（Linux 上为 Dolphin 或 Nautilus，Mac 上为 Finder，在 Windows 上是 Explorer），然后拖放文件到你的项目文件夹。

在Atom中打开一个项目文件（您创建的空文件或导入的文件）后，单击** Git **标签中的** Create Repository **按钮。在弹出的对话框中，单击** Init **以将您的项目目录初始化为本地Git存储库。 Git将**。git **目录（在系统的文件管理器中不可见，但在Atom中对您可见）添加到项目文件夹中。不要被这个愚弄了：**。git **目录是Git管理的，而不是您管理的，因此您通常会远离它。但是在Atom中看到它可以很好地提醒您您正在Git积极管理的项目中工作。换句话说，当您看到**。git **目录时，修订历史记录可用。

Right-click on your new project folder and select **New File** to create a new file in your project folder. If you have files you want to import into your new project, right-click on the folder and select **Show in File Manager** to open the folder in your system's file viewer (Dolphin or Nautilus on Linux, Finder on Mac, Explorer on Windows), and then drag-and-drop your files.

With a project file (either the empty one you created or one you've imported) open in Atom, click the **Create Repository** button in the **Git** tab. In the pop-up dialog box, click **Init** to initialize your project directory as a local Git repository. Git adds a **.git** directory (invisible in your system's file manager, but visible to you in Atom) to your project folder. Don't be fooled by this: The **.git** directory is for Git to manage, not you, so you'll generally stay out of it. But seeing it in Atom is a good reminder that you're working in a project actively managed by Git; in other words, revision history is available when you see a **.git** directory.

In your empty file, write some stuff. You're a writer, so type some words. It can be any set of words you please, but remember the writing tips above.

Press **Ctrl+S** to save your file and it will appear in the **Unstaged Changes** section of the **Git** tab. That means the file exists in your project folder but has not yet been committed over to Git's purview. Allow Git to keep track of your file by clicking on the **Stage All** button in the top-right of the **Git** tab. If you've used a word processor with revision history, you can think of this step as permitting Git to record changes.

#### Git commit

Your file is now staged. All that means is Git is aware that the file exists and is aware that it has been changed since the last time Git was made aware of it.

A Git commit sends your file into Git's internal and eternal archives. If you're used to word processors, this is similar to naming a revision. To create a commit, enter some descriptive text in the **Commit** message box at the bottom of the **Git** tab. You can be vague or cheeky, but it's more useful if you enter useful information for your future self so that you know why the revision was made.

The first time you make a commit, you must create a branch. Git branches are a little like alternate realities, allowing you to switch from one timeline to another to make changes that you may or may not want to keep forever. If you end up liking the changes, you can merge one experimental branch into another, thereby unifying different versions of your project. It's an advanced process that's not worth learning upfront, but you still need an active branch, so you have to create one for your first commit.

Click on the **Branch** icon at the very bottom of the **Git** tab to create a new branch.

![Creating a branch][14]

It's customary to name your first branch **master**. You don't have to; you can name it **firstdraft** or whatever you like, but adhering to the local customs can sometimes make talking about Git (and looking up answers to questions) a little easier because you'll know that when someone mentions **master** , they really mean **master** and not **firstdraft** or whatever you called your branch.

On some versions of Atom, the UI may not update to reflect that you've created a new branch. Don't worry; the branch will be created (and the UI updated) once you make your commit. Press the **Commit** button, whether it reads **Create detached commit** or **Commit to master**.

Once you've made a commit, the state of your file is preserved forever in Git's memory.

#### History and Git diff

A natural question is how often you should make a commit. There's no one right answer to that. Saving a file with **Ctrl+S** and committing to Git are two separate processes, so you will continue to do both. You'll probably want to make commits whenever you feel like you've done something significant or are about to try out a crazy new idea that you may want to back out of.

To get a feel for what impact a commit has on your workflow, remove some text from your test document and add some text to the top and bottom. Make another commit. Do this a few times until you have a small history at the bottom of your **Git** tab, then click on a commit to view it in Atom.

![Viewing differences][15]

When viewing a past commit, you see three elements:

  1. Text in green was added to a document when the commit was made.
  2. Text in red was removed from the document when the commit was made.
  3. All other text was untouched.



#### Remote backup

One of the advantages of using Git is that, by design, it is distributed, meaning you can commit your work to your local repository and push your changes out to any number of servers for backup. You can also pull changes in from those servers so that whatever device you happen to be working on always has the latest changes.

For this to work, you must have an account on a Git server. There are several free hosting services out there, including GitHub, the company that produces Atom but oddly is not open source, and GitLab, which is open source. Preferring open source to proprietary, I'll use GitLab in this example.

If you don't already have a GitLab account, sign up for one and start a new project. The project name doesn't have to match your project folder in Atom, but it probably makes sense if it does. You can leave your project private, in which case only you and anyone you give explicit permissions to can access it, or you can make it public if you want it to be available to anyone on the internet who stumbles upon it.

Do not add a README to the project.

Once the project is created, it provides you with instructions on how to set up the repository. This is great information if you decide to use Git in a terminal or with a separate GUI, but Atom's workflow is different.

Click the **Clone** button in the top-right of the GitLab interface. This reveals the address you must use to access the Git repository. Copy the **SSH** address (not the **https** address).

In Atom, click on your project's **.git** directory and open the **config**. Add these configuration lines to the file, adjusting the **seth/example.git** part of the **url** value to match your unique address.

* * *


```
[remote "origin"]
url = [git@gitlab.com][16]:seth/example.git
fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
remote = origin
merge = refs/heads/master
```

At the bottom of the **Git** tab, a new button has appeared, labeled **Fetch**. Since your server is brand new and therefore has no data for you to fetch, right-click on the button and select **Push**. This pushes your changes to your Gitlab account, and now your project is backed up on a Git server.

Pushing changes to a server is something you can do after each commit. It provides immediate offsite backup and, since the amount of data is usually minimal, it's practically as fast as a local save.

### Writing and Git

Git is a complex system, useful for more than just revision tracking and backups. It enables asynchronous collaboration and encourages experimentation. This article has covered the basics, but there are many more articles—and entire books—on Git and how to use it to make your work more efficient, more resilient, and more dynamic. It all starts with using Git for small tasks. The more you use it, the more questions you'll find yourself asking, and eventually the more tricks you'll learn.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/write-git

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/noreplyhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/write-hand_0.jpg?itok=Uw5RJD03 (Writing Hand)
[2]: https://git-scm.com/
[3]: https://support.mozilla.org/en-US/kb/firefox-reader-view-clutter-free-web-pages
[4]: http://atom.io
[5]: https://git-scm.com/download/mac
[6]: https://git-scm.com/download/win
[7]: http://gnu.org/software/emacs
[8]: https://commonmark.org/help/
[9]: https://opensource.com/sites/default/files/uploads/atom-preview.jpg (Atom's preview screen)
[10]: https://opensource.com/sites/default/files/uploads/atom-para.jpg (Writing in Atom)
[11]: https://opensource.com/sites/default/files/uploads/atom-linebreak.jpg (Writing in Atom)
[12]: https://atom.io/themes
[13]: https://opensource.com/sites/default/files/uploads/atom-theme.jpg (Atom's themes)
[14]: https://opensource.com/sites/default/files/uploads/atom-branch.jpg (Creating a branch)
[15]: https://opensource.com/sites/default/files/uploads/git-diff.jpg (Viewing differences)
[16]: mailto:git@gitlab.com
