[#]: subject: (Use the Linux terminal to navigate throughout your computer)
[#]: via: (https://opensource.com/article/21/8/navigate-linux-directories)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13674-1.html)

使用 Linux 终端浏览你的计算机
======

> 学习在 Linux 终端中从一个目录切换到另一个目录。

![](https://img.linux.net.cn/data/attachment/album/202108/12/113605d3hp448xm8m18wzw.jpg)

要在图形界面中浏览你的计算机上的文件夹，你可能习惯于打开一个窗口来“进入”你的计算机，然后双击一个文件夹，再双击一个子文件夹，如此反复。你也可以使用箭头按钮或按键来回溯。

而要在终端中浏览你的计算机，你可以利用 `cd` 命令。你可以使用 `cd ..` 回到 _上一级_ 目录，或者使用 `cd ./另一个/文件夹的/路径` 来跳过许多文件夹进入一个特定的位置。

你在互联网上已经使用的 URL 的概念，实际上直接来自 [POSIX][2]。当你浏览某个网站的一个特定页面时，比如 `http://www.example.com/tutorials/lesson2.html`，你实际上做的是进入 `/var/www/imaginarysite/tutorials/` 目录，并打开一个叫 `classic2.html` 的文件。当然，你是在 Web 浏览器中打开它的，浏览器会将所有那些看起来奇怪的 HTML 代码解释成漂亮的文本和图片。但这两者的思路是完全一样的。

如果你把你的计算机看成是互联网（或者把互联网看成是计算机会更合适），那么你就能理解如何在你的文件夹和文件中遨游了。如果从你的用户文件夹（你的家目录，或简记为 `~`）开始，那么你想切换到的文件夹都是相对于这个文件夹而言的：

```
$ cd ~/Documents
$ pwd
/home/tux/Documents

$ cd ..
$ pwd
/home/tux
```

这需要一些练习，但一段时间后，它会变得比你打开和关闭窗口、点击返回按钮和文件夹图标快得多。

### 用 Tab 键自动补全

键盘上的 `Tab` 键可以自动补全你开始输入的文件夹和文件的名字。如果你要 `cd` 到 `~/Documents` 文件夹，那么你只需要输入 `cd ~/Doc`，然后按 `Tab` 键即可。你的 Shell 会自动补全 `uments`。这不仅仅是一个令人愉快的便利工具，它也是一种防止错误的方法。如果你按下 `Tab` 键而没有任何东西自动补全，那么可能你 _认为_ 存在于某个位置的文件或文件件实际上并不存在。即使有经验的 Linux 用户也会试图切换到一个当前目录下不存在的文件夹，所以你可以经常使用 `pwd` 和 `ls` 命令来确认你确实在你认为你在的目录、以及你的当前目录确实包含了你认为它包含的文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/navigate-linux-directories

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[piaoshi](https://github.com/piaoshi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s04.svg_.png?itok=bC8Bcapk (Move around your computer)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
