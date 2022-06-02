[#]: subject: "Hands on With GNOME’s New Text Editor for Linux Users"
[#]: via: "https://itsfoss.com/gnome-text-editor/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14588-1.html"

GNOME 新文本编辑器尝鲜
======

![](https://img.linux.net.cn/data/attachment/album/202205/13/144247g8w8v9clwdcaagw1.png)

如果你是我们的忠实读者，你可能读过 [GNOME 计划用自家的文本编辑器取代 Gedit][1] 的消息了。

没错，GNOME 推出了一款全新的文本编辑器，名字就叫做，嗯，“<ruby>文本编辑器<rt>Text Editor</rt></ruby>”。

尽管 GNOME 桌面的默认文本编辑器还是 Gedit，但是这个新的编辑器已经和 GNOME 42 一起发布了。

也就是说，这款新编辑器可以在 Ubuntu 最新的长期发行版或者其他使用 GNOME 42 的发行版上获取（笔者现在使用的正是 Ubuntu 22.04）。

感兴趣吗？在本文，笔者将分享这款编辑器的使用体验以及安装步骤。

### GNOME 文本编辑器使用体验

GNOME 文本编辑器基于 [有争议的 libadwaita 库][3]，遵循着其开发委员会的设计新理念，采用圆角边框，外观优美典雅，颇具现代化特点。

但就功能而言，这款软件并没有什么特别的“过人之处”。毕竟，它并不能取代 [Atom 或者 VS Code][4] 这类专业的代码编辑器。但同时，它也绝不像 Windows 的记事本那样“平平无奇”。

那么，让我们来一睹它的“风采”吧！

#### 会话保存功能

默认情况下，GNOME 文本编辑器会自动打开上次编辑的文件，这一功能可以让你快速继续之前的工作。

你可以通过首选项下的还原会话选项，开启或关闭该功能。

![][5]

你还可以搜索文件记录，打开最近处理的文件。请注意：清除文件记录（见上图 “<ruby>清除历史<rt>Clear History</rt></ruby>”）会清除最近打开的文件列表。

#### 主题与内置主题

GNOME 文本编辑器与其他新的 GNOME 软件一样，自带三种主题风格：跟随系统、浅色模式和深色模式。如果你选择了跟随系统，编辑器会根据系统主题（浅色或深色）自动变换自身的深浅主题色。

![System theme option gnome text editor][6]

此外，在首选项下还设有八个主题（深浅色模式下主题有所不同），为用户提供了更多的选择。

![Theme options under preference][7]

只需点击选中，主题即可生效。

#### 文件修改以及未保存文件的处理

在你工作时，已修改和未保存的文件会突出地反映出来。

![Unsaved files are more prominently marked][8]

在你修改文件后点击关闭窗口时，编辑器会提醒你选择保存修改还是放弃修改。

![][9]

相比之下，[Gedit 有自动保存选项][10]，无需插件即可使用。

#### 暂无插件功能

提到插件，不得不承认这款新的编辑器还没有推出插件功能。而另一方面，Gedit 有着良好的插件生态，所以它的功能更加强大。

我不确定 GNOME 文本编辑器未来是否会引入支持插件的功能。

#### 代码语法高亮

近年来，代码语法高亮可以说是文本编辑器的一个必备功能了。GNOME 文本编辑器也提供了这一功能，支持各种程序语言语法高亮。

通常来说，语法高亮的前提是代码文件要有对应的后缀名。不过，我发现 GNOME 文本编辑器甚至可以在文件保存之前就识别出 bash 脚本和 C/C++ 程序，并对其语法标出高亮。

![Bash scripts. C/C++ code are detected even without file extension][11]

#### 快捷键

笔者喜欢在常用软件里使用快捷键，因为这样效率会更高。

GNOME 文本编辑器的各种操作都支持快捷键。你可以点击软件右上角的汉堡菜单（`☰` 符号）看到快捷键列表；或者直接敲快捷键 `Ctrl+?` 调出。

![Keyboard shortcuts in Text Editor][12]

#### 查找和替换

GNOME 文本编辑器有着完善的查找替换功能。它有三种模式可供选择：正则表达式、区分大小写以及匹配精准字符。

![search replace gnome text editor][13]

#### 更多功能

GNOME 文本编辑器与 Gedit 一样，还具备一些其他功能：

  * 拼写检查
  * 显示行号
  * 自动缩进
  * 空格和制表位缩进
  * 大小写转换
  * 自动换行

#### GNOME 文本编辑器的局限

归根结底，GNOME 文本编辑器依旧是一个文本编辑器，无法也无意用来打开 doc 文件。如果你执意用它要打开 doc 文件，你看到的就只有一堆乱码。当然，pdf 文件也是如此。

![][14]

此外，GNOME 文本编辑器并不是专门用来写复杂代码的，它无法取代 VS Code 等代码编辑器。如果说偶尔用来读读代码或者写写 shell 脚本，倒也无伤大雅，但是它并不具备管理项目文件夹和运行代码等功能。

### 安装 GNOME 文本编辑器

就像笔者在开头所说，GNOME 文本编辑器已经和 GNOME 42 一起发布了，不过它并不属于默认安装的软件。在 Ubuntu 22.04，Universe 仓库里就有 GNOME 文本编辑器，你可以通过输入下面的命令进行安装：

```
sudo apt install gnome-text-editor
```

其他采用 GNOME 42 的发行版也可以获取 GNOME 文本编辑器，请在安装前查看所用系统的 [桌面环境版本][15]。

安装完成后，可以点击屏幕左上角的“<ruby>活动<rt>Activities</rt></ruby>”按钮，查找并打开 GNOME 文本编辑器。它的图标与 Gedit 的图标相似，但设计更为新颖。

![][16]

### 总结

[Gedit][17] 是一款非常完善的文本编辑器，也是 GNOME 桌面环境长期以来的预装软件。几年前，Gedit 疏于开发，但现在已经恢复了开发。然而，如今 GNOME 团队正在努力为 GTK 4 和 libadwaita 改进核心应用程序。

GNOME 文本编辑器很像 Gedit 的翻版，两者有着相似的界面和功能。不过，GNOME 文本编辑器与新版 GNOME 的设计风格更加统一，使用体验也更加流畅。

这款新的编辑器日后很有可能会成为 GNOME 的默认文本编辑器。不过让人感兴趣的是，GNOME 文本编辑器将来是否会拥有自己的插件生态呢？

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-text-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-14060-1.html
[2]: https://itsfoss.com/ubuntu-22-04-release-features/
[3]: https://news.itsfoss.com/gnome-libadwaita-library/
[4]: https://itsfoss.com/visual-studio-code-vs-atom/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/restore-session-option-gnome-text-editor-1.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/system-theme-option-gnome-text-editor-800x560.png
[7]: https://itsfoss.com/wp-content/uploads/2022/04/theme-options-gnome-text-editor.png
[8]: https://itsfoss.com/wp-content/uploads/2022/04/unsaved-file-gnome-text-editor-800x481.png
[9]: https://itsfoss.com/wp-content/uploads/2022/04/save-prompt-gnome-text-editor.png
[10]: https://itsfoss.com/how-to-enable-auto-save-feature-in-gedit/
[11]: https://itsfoss.com/wp-content/uploads/2022/04/syntax-highlight-gnome-text-editor.png
[12]: https://itsfoss.com/wp-content/uploads/2022/04/keyboard-shortcuts-gnome-text-editor-800x637.png
[13]: https://itsfoss.com/wp-content/uploads/2022/04/search-replace-gnome-text-editor-800x477.png
[14]: https://itsfoss.com/wp-content/uploads/2022/04/doc-in-gnome-text-editor-800x485.png
[15]: https://itsfoss.com/find-desktop-environment/
[16]: https://itsfoss.com/wp-content/uploads/2022/04/new-gnome-text-editor.png
[17]: https://wiki.gnome.org/Apps/Gedit
