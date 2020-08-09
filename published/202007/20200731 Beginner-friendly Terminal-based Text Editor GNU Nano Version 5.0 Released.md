[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12471-1.html)
[#]: subject: (Beginner-friendly Terminal-based Text Editor GNU Nano Version 5.0 Released)
[#]: via: (https://itsfoss.com/nano-5-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

适于初学者的基于终端的文本编辑器 GNU Nano 5.0 版发布
======

> 开源文本编辑器 GNU nano 已经达到了 5.0 版本的里程碑。看看这个新版本带来了哪些功能。

Linux 上有很多[基于终端的文本编辑器][1]。像 Emacs 和 Vim 这样的编辑器需要经历陡峭的学习曲线和掌握一堆不寻常的键盘快捷键，但公认 GNU nano 更容易使用。

也许这就是为什么 Nano 是 Ubuntu 和许多其他发行版中默认的基于终端的文本编辑器的原因，而即将发布的 [Fedora 33 版本][2]也将把 Nano 设置为终端的默认文本编辑器。

### GNU nano 5.0 的新功能

![][3]

在 GNU nano 5.0 的[变更日志][4]中提到的一些主要亮点是： 

* `-indicator` 选项将在屏幕右侧显示一种滚动条，以指示视口在缓冲区中的位置和覆盖范围。
* 可以用 `Alt+Insert` 键标记行，你可以用 `Alt+Page` 和 `Alt+PageDown` 键跳转到这些标记的行。
* 执行命令提示符现在可以直接从主菜单中访问。
* 在支持至少 256 种颜色的终端上，有新的颜色可用。
* 新的 `-bookstyle` 模式，任何以空格开头的行都会被认为是一个段落的开始。
* 用 `^L` 刷新屏幕现在在每个菜单中都可以使用。它还会将行与光标居中。
* 可绑定函数 `curpos` 已经改名为 `location`，长选项 `-tempfile` 已经改名为 `-saveonexit`，短选项 `-S` 现在是 `-softwrap` 的同义词。
* 备份文件将保留其组的所有权（如果可能的话）。
* 数据会在显示 “……行写入” 之前同步到磁盘。
* 增加了 Markdown、Haskell 和 Ada 语法的支持。

### 获取 GNU nano 5.0

目前 Ubuntu 20.04 中的 nano 版本是 4.8，而在这个 LTS 版本中，你不太可能在短时间内获得新版本。如果 Ubuntu 有新版本的话，你应该会通过系统更新得到它。

Arch 用户应该会比其他人更早得到它，就像往常一样。其他发行版也应该迟早会提供新版本。

如果你是少数喜欢[从源代码安装软件][5]的人，你可以从它的[下载页面][6]中获得。

如果你是新手，我强烈推荐这篇 [Nano 编辑器初学者指南][1]。

你喜欢这个新版本吗？你期待使用 Nano 5 吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/nano-5-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nano-editor-guide/
[2]: https://itsfoss.com/fedora-33/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/09/Nano.png?ssl=1
[4]: https://www.nano-editor.org/news.php
[5]: https://itsfoss.com/install-software-from-source-code/
[6]: https://www.nano-editor.org/download.php
