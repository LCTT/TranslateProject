[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10792-1.html)
[#]: subject: (3 Emacs modes for taking notes)
[#]: via: (https://opensource.com/article/18/7/emacs-modes-note-taking)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

用来记笔记的三个 Emacs 模式
======

> 借助这些 Emacs 模式轻松记录信息。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/notebook-writing-pen.jpg?itok=uA3dCfu_)


不管你从事哪种工作，你都无可避免地需要记笔记。而且可能还不是一点点。现在这年头，大家都开始以数字的形式来记笔记了。

开源软件爱好者有多种途径来以电子的方式记下他们的创意、想法和研究过程。你可以使用 [网页工具][1]，可以使用 [桌面应用][2]，或者你也可以 [使用命令行工具][3]。

如果你使用 [Emacs][4]（伪装成文本编辑器的强力操作系统)，有多个<ruby>模式<rt>mode</rt></ruby>可以帮你有效地记录笔记。我们这里列举三个例子。

### Deft

![](https://opensource.com/sites/default/files/uploads/deft.png)

在少数情况下，我只能使用 Mac时，有一个工具是我不能缺少的：[nvALT][5] 笔记应用。[Deft 模式][6] 为 Emacs 带来了 nvALT 式的体验。

Deft 将你的笔记以文本文件的形式存储在电脑中的某个文件夹中。当你进入 Deft 模式，你会看到一系列的笔记及其摘要。这些摘要其实就是文本文件的第一行。若第一行是 Markdown、LaTeX，甚至 Emacs Org 模式的格式的话，Deft 会忽略掉这些格式而只显示文本内容。

要打开笔记，只需要向下滚动到该笔记的位置然后按下回车即可。然而 Deft 不仅仅只是这样。根据 Deft 开发者 Jason Blevins 的说法，它的*主要操作是搜索和过滤*。Deft 的实现方式简单而有效。输入关键字然后 Deft 会只显示标题中包含关键字的笔记。这在你要从大量笔记中找到某条笔记时非常有用。

### Org 模式

![](https://opensource.com/sites/default/files/uploads/orgmode.png)

如果本文没有包含 [Org 模式][7] 的话，那么我可能会被人所诟病。为什么？它可以说是 Emacs 中最灵活、使用最广泛的记录笔记的方式了。以正确的方式使用它，Org 模式可以极大地增强记笔记的能力。

Org 模式的主要优势在于它组织笔记的方式。在 Org 模式中，一个笔记文件会被组织成一个巨大的大纲。每个章节就是大纲里的一个节点，你可以对它进行展开和折叠。这些章节又可以有子章节，这些子章节也可以展开和折叠。这不仅使你一次只关注于某个章节，而且可以让你浏览整个大纲。

你可以在多个章节之间 [进行互联][8]，无需通过剪切和复制就能快速移动章节，以及 [附加文件][9] 到笔记中。Org 模式支持带格式的字符和表格。如果你需要转换笔记到其他格式，Org 模式也有大量的[导出选项][10]。


### Howm

![](https://opensource.com/sites/default/files/uploads/howm.png)

当我使用 Emacs 已经成为一种习惯时，[howm][11] 马上就成为我严重依赖的模式之一了。虽然我特别喜欢使用 Org 模式，但 howm 依然占有一席之地。

Howm 就好像是一个小型维基。你可以创建笔记和任务列表，还能在它们之间创建链接。通过输入或点击某个链接，你可以在笔记之间跳转。如果你需要，还可以使用关键字为笔记添加标签。不仅如此，你可以对笔记进行搜索、排序和合并。

Howm 不是最漂亮的 Emacs 模式，它的用户体验也不是最佳。它需要你花一点时间来适应它，而一旦你适应了它，记录和查找笔记就是轻而易举的事情了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/emacs-modes-note-taking

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/alternatives/evernote
[2]: https://opensource.com/life/16/9/4-desktop-note-taking-applications
[3]: https://opensource.com/article/18/3/command-line-note-taking-applications
[4]: https://www.gnu.org/software/emacs/
[5]: http://brettterpstra.com/projects/nvalt/
[6]: https://jblevins.org/projects/deft/
[7]: https://orgmode.org/
[8]: https://orgmode.org/org.html#Hyperlinks
[9]: https://orgmode.org/org.html#Attachments
[10]: https://orgmode.org/org.html#Exporting
[11]: https://howm.osdn.jp/
