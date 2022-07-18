[#]: subject: "Manage your files in your Linux terminal with ranger"
[#]: via: "https://opensource.com/article/22/7/manage-files-linux-terminal-ranger"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14835-1.html"

用 ranger 在 Linux 终端管理你的文件
======

> 试试这个轻量级的开源工具，不用离开终端就可以预览文件。

![Filing cabinet for organization][1]

查看你的文件和文件夹的最基本方法是使用命令 `ls` 和 `ll`。但是有时候，我不仅想看到文件的元数据，还想一目了然地看到文件的内容。为此，我使用 ranger。

如果你喜欢在控制台中工作，并使用 [Vim][2] 或 Vi，而且你不想因为任何原因离开你的终端，那么 ranger 就是你最好的新朋友。ranger 是一个精简的文件管理器，它不仅可以让你浏览文件，还可以预览它们。ranger 与 rifle 捆绑在一起，rifle 是一个文件执行器，可以有效地选择与特定文件类型相关的程序。

### 在 Linux 上安装 ranger

ranger 可以在 Fedora 或任何基于 RPM 的发行版中安装，方法是运行：

```
$ sudo dnf install ranger
```

ranger 也可以用于 [其他发行版和 macOS][3]。

### 第一次使用 ranger

作为一个用户，你可以在你喜欢的终端上简单地输入 `ranger` 来启动 ranger。可以用方向键浏览。这张截图是一个很好的例子，我可以预览存储在 `Kernel-tests` 中的 `config.example` 文件的代码。

![Screenshot of terminal showing config.example highlighted and a preview of the file in the terminal to the right][4]

选中任何文件并按下 `F4` 键，就可以打开你的默认编辑器，让你立即编辑这些文件！

### 图像和视频怎么办？

使用 [rifle][5] 和 ranger 可以让你快速找到与某一文件相关的程序。将鼠标悬停在图片上，然后试图打开它是非常简单的，只要点击回车即可。下面是它的样子：

![Screenshot of a PNG file preview over a terminal window][6]

在一个图像文件上点击 `i` 会给用户提供所有的 EXIF 数据。点击 `Shift+Enter` 将打开这个 PDF 文件。

![A screenshot showing a preview of a PDF file (tickets to a museum) floating over the terminal window][7]

同样的组合键将在系统默认的支持该编解码器的视频播放器中打开并开始播放视频。下面的例子是一个 mp4 视频，它在 [VLC][8] 上播放得很好。

![Screenshot of a Bugcrowd University Cross Site Scripting video in VLC media player, previewed over the terminal][9]

### 文件操作

除非 Vim 用户另有配置，否则下面的键绑定工作良好。

- `j`：下移
- `k`：上移
- `h`: 移动到父目录
- `gg`：移到列表的顶部
- `i`：预览文件
- `r`：打开文件
- `zh`：查看隐藏文件
- `cw`：重命名当前文件
- `yy`：复制文件
- `dd`：剪切文件
- `pp`：粘贴文件
- `u`：撤销
- `z`：改变设置
- `dD`：删除文件

### 控制台命令

有时我在起草文章时，有一个文件夹包含某个软件的截图。通过点击空格选择或标记文件，然后输入 `:bulkrename`，可以帮助我把所有奇怪的时间戳变成如：lorax1、lorax2 等等。下面是一个例子。

![Screenshot of terminal showing timestamped files that can be renamed with the bulkrename command][10]

其他有用的控制台命令包括：

- `:openwith`：用你选择的程序打开一个选择的文件
- `:touch FILENAME`：创建一个文件
- `:mkdir FILENAME`：创建一个目录
- `:shell <command>`：在 shell 中运行一个命令
- `:delete`：删除文件

### 在 tty2/3/4 中能工作吗？

作为一个从事质量保证（QA）工作的人，我发现搜索日志和阅读日志从未如此简单。即使我的 Gnome 显示管理器崩溃了，我也可以切换到我的 tty2，用我的用户名和密码登录，并以超级用户权限启动 ranger，然后我就可以尽情地探索了！

ranger 是一个很好的工具，可以在不离开终端的情况下处理文件。ranger 是精简的，也是可定制的，所以不妨一试吧！

*图片来源：（Sumantro Mukherjee，CC BY-SA 4.0）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/manage-files-linux-terminal-ranger

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/files_documents_organize_letter.png
[2]: https://opensource.com/tags/vim
[3]: https://opensource.com/article/20/3/ranger-file-navigator
[4]: https://opensource.com/sites/default/files/2022-06/ranger%201.png
[5]: https://www.systutorials.com/docs/linux/man/1-rifle/
[6]: https://opensource.com/sites/default/files/2022-06/ranger%202.png
[7]: https://opensource.com/sites/default/files/2022-06/ranger%203.png
[8]: https://opensource.com/article/21/2/linux-media-players
[9]: https://opensource.com/sites/default/files/2022-06/ranger%204.png
[10]: https://opensource.com/sites/default/files/2022-06/ranger%205.png
