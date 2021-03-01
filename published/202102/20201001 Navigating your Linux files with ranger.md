[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13137-1.html)
[#]: subject: (Navigating your Linux files with ranger)
[#]: via: (https://www.networkworld.com/article/3583890/navigating-your-linux-files-with-ranger.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

用 ranger 在 Linux 文件的海洋中导航
=====

> ranger 是一个很好的工具，它为你的 Linux 文件提供了一个多级视图，并允许你使用方向键和一些方便的命令进行浏览和更改。

![](https://img.linux.net.cn/data/attachment/album/202102/20/121918g5hqhjfcjyffh3lt.jpg)

`ranger` 是一款独特且非常方便的文件系统导航器，它允许你在 Linux 文件系统中移动，进出子目录，查看文本文件内容，甚至可以在不离开该工具的情况下对文件进行修改。

它运行在终端窗口中，并允许你按下方向键进行导航。它提供了一个多级的文件显示，让你很容易看到你在哪里、在文件系统中移动、并选择特定的文件。

要安装 `ranger`，请使用标准的安装命令（例如，`sudo apt install ranger`）。要启动它，只需键入 `ranger`。它有一个很长的、非常详细的手册页面，但开始使用 `ranger` 非常简单。

### ranger 的显示方式

你需要马上习惯的最重要的一件事就是 `ranger` 的文件显示方式。一旦你启动了 `ranger`，你会看到四列数据。第一列是你启动 `ranger` 的位置的上一级。例如，如果你从主目录开始，`ranger` 将在第一列中列出所有的主目录。第二列将显示你的主目录（或者你开始的目录）中的目录和文件的第一屏内容。

这里的关键是超越你可能有的任何习惯，将每一行显示的细节看作是相关的。第二列中的所有条目与第一列中的单个条目相关，第四列中的内容与第二列中选定的文件或目录相关。

与一般的命令行视图不同的是，目录将被列在第一位（按字母数字顺序），文件将被列在第二位（也是按字母数字顺序）。从你的主目录开始，显示的内容可能是这样的：

```
shs@dragonfly /home/shs/backups     <== current selection
 bugfarm   backups            0  empty
 dory      bin               59
 eel       Buttons           15
 nemo      Desktop            0
 shark     Documents          0
 shs       Downloads          1
   ^         ^                ^      ^
   |         |                |      |
 homes     directories    # files    listing
           in selected    in each    of files in
           home           directory  selected directory
```

`ranger` 显示的最上面一行告诉你在哪里。在这个例子中，当前目录是 `/home/shs/backups`。我们看到高亮显示的是 `empty`，因为这个目录中没有文件。如果我们按下方向键选择 `bin`，我们会看到一个文件列表：

```
shs@dragonfly /home/shs/bin      <== current selection
 bugfarm   backups            0    append
 dory      bin               59    calcPower
 eel       Buttons           15    cap
 nemo      Desktop            0    extract
 shark     Documents          0    finddups
 shs       Downloads          1    fix
   ^         ^                ^      ^
   |         |                |      |
 homes     directories    # files    listing
           in selected    in each    of files in
           home           directory  selected directory
```

每一列中高亮显示的条目显示了当前的选择。使用右方向键可移动到更深的目录或查看文件内容。

如果你继续按下方向键移动到列表的文件部分，你会注意到第三列将显示文件大小（而不是文件的数量）。“当前选择”行也会显示当前选择的文件名，而最右边的一列则会尽可能地显示文件内容。

```
shs@dragonfly /home/shs/busy_wait.c   <== current selection
 bugfarm   BushyRidge.zip    170 K  /*
 dory      busy_wait.c       338 B   * program that does a busy wait
 eel       camper.jpg       5.55 M   * it's used to show ASLR, and that's it
 nemo      check_lockscreen   80 B   */
 shark     chkrootkit-output 438 B  #include <stdio.h>
   ^         ^                ^       ^
   |         |                |       |
 homes     files            sizes    file content
```

在该显示的底行会显示一些文件和目录的详细信息：

```
-rw-rw-r—- shs shs 338B 2019-01-05 14:44    1.52G, 365G free  67/488  11%
```

如果你选择了一个目录并按下回车键，你将进入该目录。然后，在你的显示屏中最左边的一列将是你的主目录的内容列表，第二列将是该目录内容的文件列表。然后你可以检查子目录的内容和文件的内容。

按左方向键可以向上移动一级。

按 `q` 键退出 `ranger`。

### 做出改变

你可以按 `?` 键，在屏幕底部弹出一条帮助行。它看起来应该是这样的：

```
View [m]an page, [k]ey bindings, [c]commands or [s]ettings?  (press q to abort)
```

按 `c` 键，`ranger` 将提供你可以在该工具内使用的命令信息。例如，你可以通过输入 `:chmod` 来改变当前文件的权限，后面跟着预期的权限。例如，一旦选择了一个文件，你可以输入 `:chmod 700` 将权限设置为 `rwx------`。

输入 `:edit` 可以在 `nano` 中打开该文件，允许你进行修改，然后使用 `nano` 的命令保存文件。

### 总结

使用 `ranger` 的方法比本篇文章所描述的更多。该工具提供了一种非常不同的方式来列出 Linux 系统上的文件并与之交互，一旦你习惯了它的多级的目录和文件列表方式，并使用方向键代替 `cd` 命令来移动，就可以很轻松地在 Linux 的文件中导航。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3583890/navigating-your-linux-files-with-ranger.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/mHC0qJ7l-ls
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
