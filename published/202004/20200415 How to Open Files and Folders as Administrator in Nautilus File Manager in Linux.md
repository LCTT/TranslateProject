[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12128-1.html)
[#]: subject: (How to Open Files and Folders as Administrator in Nautilus File Manager in Linux)
[#]: via: (https://itsfoss.com/open-nautilus-as-administrator/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 的 Nautilus 文件管理器中以管理员身份打开文件和文件夹
======

> 了解如何在 Ubuntu 和其他 Linux 发行版的 Nautilus 文件管理器的右键菜单中添加“以管理员身份打开”选项。

![](https://img.linux.net.cn/data/attachment/album/202004/19/211224hurk01u0kuvqnpvn.jpg)

如果要以根用户身份打开或编辑文件，你总是可以在终端中执行此操作。但我知道有些人对命令行不适应。

桌面 Linux 通常为那些害怕终端的人提供方法避免命令行。

如果你必须以 root 用户身份访问文件夹或以 root 用户权限编辑文件，那你可以在 [Nautilus 文件管理器][1]中以图形方式进行操作。

一个小巧优雅的 Nautilus 技巧能让你以管理员（也就是 root）打开文件和文件夹。让我向你展示如何做。 

### 在 Nautilus 文件管理器的右键菜单中添加“以管理员身份打开”选项

> 警告！请不要以 root 用户身份打开和编辑随机文件，因为这样可能会弄乱文件并导致系统损坏。仅在需要时使用它。

我展示的是 Ubuntu 的步骤。你可以根据你的发行版的软件包管理器进行更改。

你必须使用终端（即使你不喜欢它）来安装 Nautilus 插件。请[确保已启用 Universe 仓库][4]：

```
sudo apt install nautilus-admin
```

关闭并再次打开 Nautilus 文件管理器以查看更改生效。

![Right clock to see the “Open as Administrator” option][5]

你也可以用 root 用户身份编辑文件。只需选择文件，右键单击它，然后选择“以管理员身份编辑”选项。

![Edit Files As Root Ubuntu][6]

这两种情况下，系统都会提示你输入帐户密码：

![You need to enter your password, of course][7]

差不多了。你可以享受 GUI 的舒适了。

如果你不想再以 root 用户身份运行 Nautilus，那么可以删除此插件。删除已安装但不再使用的其他东西总是没错的。

在终端中（没错，再一次在终端），使用以下命令删除 Nautilus 插件。

```
sudo apt remove nautilus-admin
```

顺便说一句，如果你在使用 [Ubuntu MATE][8]，你可以使用 caja-admin 代替 nautilus-admin。其他文件管理器可能会或可能不会提供此类功能。

我希望这个快速技巧对你有所帮助。随时欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-nautilus-as-administrator/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Files
[3]: https://itsfoss.com/root-user-ubuntu/
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/open-folder-as-administrator-ubuntu.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/edit-files-as-root-ubuntu.jpg?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/authentication-pop-up-ubuntu.png?ssl=1
[8]: https://ubuntu-mate.org/
