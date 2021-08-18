[#]: subject: (Move files in the Linux terminal)
[#]: via: (https://opensource.com/article/21/8/move-files-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13677-1.html)

基础：在 Linux 终端中移动文件
======

> 使用 mv 命令将一个文件从一个位置移动到另一个位置。

![](https://img.linux.net.cn/data/attachment/album/202108/13/112248lnal8a0qz50zqzld.jpg)

要在有图形界面的计算机上移动一个文件，你要打开该文件当前所在的文件夹，然后打开另一个窗口导航到你想把文件移到的文件夹。最后，你把文件从一个窗口拖到另一个窗口。

要在终端中移动文件，你可以使用 `mv` 命令将文件从一个位置移动到另一个位置。

```
$ mv example.txt ~/Documents

$ ls ~/Documents
example.txt
```

在这个例子中，你已经把 `example.txt` 从当前文件夹移到了主目录下的 `Documents` 文件夹中。

只要你知道一个文件在 _哪里_，又想把它移到 _哪里_ 去，你就可以把文件从任何地方移动到任何地方，而不管你在哪里。与在一系列窗口中浏览你电脑上的所有文件夹以找到一个文件，然后打开一个新窗口到你想让该文件去的地方，再拖动该文件相比，这可以大大节省时间。

默认情况下，`mv` 命令完全按照它被告知的那样做：它将一个文件从一个位置移动到另一个位置。如果在目标位置已经存在一个同名的文件，它将被覆盖。为了防止文件在没有警告的情况下被覆盖，请使用 `--interactive`（或简写 `-i`）选项。

```
$ mv -i example.txt ~/Documents
mv: overwrite '/home/tux/Documents/example.txt'?
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/move-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s05.svg_.png?itok=PgKQEDZ7 (Moving files)
