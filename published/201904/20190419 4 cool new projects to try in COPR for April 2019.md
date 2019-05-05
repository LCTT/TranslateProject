[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10787-1.html)
[#]: subject: (4 cool new projects to try in COPR for April 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

COPR 仓库中 4 个很酷的新软件（2019.4）
======

![][1]

COPR 是个人软件仓库[集合][1]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

这是 COPR 中一组新的有趣项目。

### Joplin

[Joplin][3] 是一个笔记和待办事项应用。笔记以 Markdown 格式编写，并通过使用标签和将它们分类到各种笔记本中进行组织。Joplin 可以从任何 Markdown 源导入笔记或从 Evernote 导出笔记。除了桌面应用之外，还有一个 Android 版本，通过使用 Nextcloud、Dropbox 或其他云服务同步笔记。最后，它还有 Chrome 和 Firefox 的浏览器扩展程序，用于保存网页和屏幕截图。

![][4]

#### 安装说明

[COPR 仓库][5]目前为 Fedora 29 和 30 以及 EPEL 7 提供 Joplin。要安装 Joplin，请[带上 sudo][6] 使用这些命令：

```
sudo dnf copr enable taw/joplin
sudo dnf install joplin
```

### Fzy

[Fzy][7] 是用于模糊字符串搜索的命令行程序。它从标准输入读取并根据最有可能的搜索结果进行排序，然后打印所选行。除了命令行，`fzy` 也可以在 vim 中使用。你可以在这个在线 [demo][8] 中尝试 `fzy`。

#### 安装说明

[COPR 仓库][9]目前为 Fedora 29、30 和 Rawhide 以及其他发行版提供了 `fzy`。要安装 `fzy`，请使用以下命令：

```
sudo dnf copr enable lehrenfried/fzy
sudo dnf install fzy
```

### Fondo

Fondo 是一个浏览 [unsplash.com][10] 网站照片的程序。它有一个简单的界面，允许你一次查找某个主题或所有主题的图片。然后，你可以通过单击将找到的图片设置为壁纸，或者共享它。

![][11]

#### 安装说明

[COPR 仓库][12]目前为 Fedora 29、30 和 Rawhide 提供 Fondo。要安装 Fondo，请使用以下命令：

```
sudo dnf copr enable atim/fondo
sudo dnf install fondo
```

### YACReader

[YACReader][13] 是一款数字漫画阅读器，它支持许多漫画和图像格式，例如 cbz、cbr、pdf 等。YACReader 会跟踪阅读进度，并可以从 [Comic Vine][14] 下载漫画信息。它还有一个 YACReader 库，用于组织和浏览你的漫画集。

![][15]

#### 安装说明

[COPR 仓库][16]目前为 Fedora 29、30 和 Rawhide 提供 YACReader。要安装 YACReader，请使用以下命令：

```
sudo dnf copr enable atim/yacreader
sudo dnf install yacreader
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://joplin.cozic.net/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/04/joplin.png
[5]: https://copr.fedorainfracloud.org/coprs/taw/joplin/
[6]: https://fedoramagazine.org/howto-use-sudo/
[7]: https://github.com/jhawthorn/fzy
[8]: https://jhawthorn.github.io/fzy-demo/
[9]: https://copr.fedorainfracloud.org/coprs/lehrenfried/fzy/
[10]: https://unsplash.com/
[11]: https://fedoramagazine.org/wp-content/uploads/2019/04/fondo.png
[12]: https://copr.fedorainfracloud.org/coprs/atim/fondo/
[13]: https://www.yacreader.com/
[14]: https://comicvine.gamespot.com/
[15]: https://fedoramagazine.org/wp-content/uploads/2019/04/yacreader.png
[16]: https://copr.fedorainfracloud.org/coprs/atim/yacreader/
