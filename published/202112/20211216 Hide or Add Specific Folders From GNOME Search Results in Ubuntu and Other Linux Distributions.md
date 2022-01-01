[#]: subject: "Hide or Add Specific Folders From GNOME Search Results in Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/control-gnome-file-search/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14115-1.html"

GNOME 搜索功能的一些小技巧
======

你可能已经注意到，当你在 GNOME 菜单/活动区搜索某样东西时，它也会显示名称与搜索词相匹配的文件，以及已安装的应用。

![](https://img.linux.net.cn/data/attachment/album/202112/25/115842tf8jjgn4ttz7nf4m.jpg)

这是个很方便的功能。如果你记得文件名，甚至是它的一部分，你可以很容易地搜索到它，只需按下 `Super` 键（`Windows` 键）并输入文件名就可以打开它。

但是，围绕这个搜索功能，有一些你可能不知道或从未关心过的小问题。

在这篇文章中，我将分享你如何控制 GNOME 搜索功能，从搜索选项中添加或隐藏文件夹，以及完全禁用它。

注意：这专门针对使用 GNOME 的发行版。请 [确认你使用的是哪种桌面环境][2]，确保是 GNOME。

### 文件搜索的默认位置

GNOME 的搜索功能使用了一个叫做 [Tracker Miner FS][3] 的工具。请不要被 “tracker” 和 “miner” 这样的术语吓到。它不是在监视你，也不是在你的系统上挖掘加密货币。它的基本功能是作为一个搜索引擎和数据库，为你提供即时搜索结果。

默认情况下，文件索引发生在元文件夹，如文档、音乐、图片和视频目录及其子目录。主页和下载文件夹中的文件也会被索引，但不包括其子目录中的文件。

![Default locations for file search][4]

如果你在你的主文件夹中创建了一些新的目录，这些文件将不会被索引。

然而，最近访问的文件也会被自动编入索引。如果你最近打开了一个文件，它将被添加到 “最近的文件” 中，并将出现在搜索结果中，而不管它在什么地方。

如果你还不知道的话，你可以在文件管理器中看到你最近访问的文件：

![Accessing recent files in GNOME file manager][5]

### 在搜索结果中添加一个文件夹的内容

假设你在你的主目录中为编码项目创建了一个文件夹。这些文件不会被索引，也不会出现在搜索结果中（除非你通过双击打开了一个文件，并且它被添加到最近的文件中）。

要在搜索结果中添加自定义文件夹中的文件，你可以将该文件夹添加到搜索位置。

通过在菜单/活动区搜索打开 “设置” 应用。

![Search for settings application][6]

从左侧边栏进入 “搜索” 选项，点击顶部的“搜索位置”选项。在弹出的窗口中，进入 “其他” 标签，点击 “+” 符号。它将打开文件浏览器，你可以添加你想要的文件夹。

![Adding a custom folder content to search][7]

如果你在刚刚添加的文件夹中搜索一个文件名进行测试，你现在应该在搜索结果中看到它。它应该是即时的，但如果不是，请尝试注销或重启系统。

### 从搜索结果中隐藏一个文件夹

如果你不希望某个特定文件夹的文件出现在搜索结果中，你可以隐藏它。

如果你不希望在搜索中出现图片、文档、视频等元文件夹的内容，你可以从搜索位置设置中禁用它。

![Disable meta folders from the search][8]

如果你只想让文档下的某个文件夹的内容不出现在搜索结果中，你只需要在该文件夹中创建一个名为 `.nomedia` 的新文件。你也可以将该文件命名为 `.git`、`.trackerignore` 或 `.hg`。

![Hide specific folder from search results by creating file named .nomedia or .hg or .git][9]

如果你在鼠标右键中没有看到创建新文件的选项，你必须做一些调整来增加 [在右键上下文菜单中创建新文件选项][10]。还要注意的是，任何名称中以 `.` 开头的文件都会被隐藏起来，不能被正常查看。要 [切换显示隐藏文件][11]，按 `Ctrl+H` 键。

这种隐藏可能不会立即生效，因为该文件可能已经被索引了。你可能必须注销或重启才能看到效果。

如果你手动访问一个文件，它将被添加到最近的文件中，并且会出现在搜索结果中，尽管文件夹中的文件被忽略了。

你可以从 “设置 -> 隐私 -> 文件历史 & 垃圾箱” 删除最近的文件历史或完全禁用它（如果你想的话）。不过我认为没有必要，所以在这里你自己决定吧。

![Clear or disable file access history in GNOME][12]

### 禁用所有文件的搜索结果

如果你不希望任何文件出现在搜索结果中，你可以在搜索设置中完全禁用对文件的搜索。

![Disable search results for all files][13]

你应该通过点击顶部的搜索切换按钮完全禁用搜索功能，它可能会干扰 GNOME 桌面环境的正常功能。

关于它的更多细节可以在 [项目主页] 中找到。

### 总结

这里的 _讨论的是文件搜索_。GNOME 桌面也可以在日历、字符映射和其他一些程序中进行搜索。你可以禁用或启用可用的搜索选项，但我们这篇不针对这些。

我希望你觉得这个快速提示对 [定制你的 GNOME 体验][15] 有帮助。如果你知道其他一些你想让别人知道的技巧，请在评论中与我们分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/control-gnome-file-search/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-file-search-result.png?resize=800%2C355&ssl=1
[2]: https://itsfoss.com/find-desktop-environment/
[3]: https://wiki.gnome.org/Projects/Tracker/Documentation/GettingStarted
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-default-search-location.png?resize=800%2C533&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/access-recent-files-gnome-linux.png?resize=735%2C414&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/settings-search-ubuntu-20-04.jpg?resize=800%2C230&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-add-search-location.png?resize=800%2C525&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/disable-folders-from-search.png?resize=800%2C533&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/hide-specific-folder-from-search-results.png?resize=751%2C382&ssl=1
[10]: https://itsfoss.com/add-new-document-option/
[11]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/clear-or-disable-file-history-gnome-linux.png?resize=800%2C389&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/disable-search-for-files-gnome.png?resize=800%2C475&ssl=1
[14]: https://gnome.pages.gitlab.gnome.org/tracker/
[15]: https://itsfoss.com/gnome-tricks-ubuntu/
