[#]: collector: (lujun9972)
[#]: translator: (An-DJ)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10580-1.html)
[#]: subject: (How to Change User Password in Ubuntu [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/change-password-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

新手教程：Ubuntu 下如何修改用户密码
======

> 想要在 Ubuntu 下修改 root 用户的密码？那我们来学习下如何在 Ubuntu Linux 下修改任意用户的密码。我们会讨论在终端下修改和在图形界面（GUI）修改两种做法。

那么，在 Ubuntu 下什么时候会需要修改密码呢？这里我给出如下两种场景。

- 当你刚安装 [Ubuntu][1] 系统时，你会创建一个用户并且为之设置一个密码。这个初始密码可能安全性较弱或者太过于复杂，你会想要对它做出修改。
- 如果你是系统管理员，你可能需要去修改在你管理的系统内其他用户的密码。

当然，你可能会有其他的一些原因做这样的一件事。不过现在问题来了，我们到底如何在 Ubuntu 或其它 Linux 系统下修改单个用户的密码呢？

在这个快速教程中，我将会展示给你在 Ubuntu 中如何使用命令行和图形界面（GUI）两种方式修改密码。

### 在 Ubuntu 中修改用户密码 —— 通过命令行

![如何在 Ubuntu Linux 下修改用户密码][2]

在 Ubuntu 下修改用户密码其实非常简单。事实上，在任何 Linux 发行版上修改的方式都是一样的，因为你要使用的是叫做 `passwd` 的普通 Linux 命令来达到此目的。

如果你想要修改你的当前密码，只需要简单地在终端执行此命令：

```
passwd
```

系统会要求你输入当前密码和两次新的密码。

在键入密码时，你不会从屏幕上看到任何东西。这在 UNIX 和 Linux 系统中是非常正常的表现。

```
passwd
Changing password for abhishek.
(current) UNIX password:
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
```

由于这是你的管理员账户，你刚刚修改了 Ubuntu 下 sudo 密码，但你甚至没有意识到这个操作。（LCTT 译注：执行 sudo 操作时，输入的是的用户自身的密码，此处修改的就是自身的密码。而所说的“管理员账户”指的是该用户处于可以执行 `sudo` 命令的用户组中。本文此处描述易引起误会，特注明。）

![在 Linux 命令行中修改用户密码][3]

如果你想要修改其他用户的密码，你也可以使用 `passwd` 命令来做。但是在这种情况下，你将不得不使用`sudo`。（LCTT 译注：此处执行 `sudo`，要先输入你的 sudo 密码 —— 如上提示已经修改，再输入给其它用户设置的新密码 —— 两次。）

```
sudo passwd <user_name>
```

如果你对密码已经做出了修改，不过之后忘记了，不要担心。你可以[很容易地在Ubuntu下重置密码][4].

### 修改 Ubuntu 下 root 用户密码

默认情况下，Ubuntu 中 root 用户是没有密码的。不必惊讶，你并不是在 Ubuntu 下一直使用 root 用户。不太懂？让我快速地给你解释下。

当[安装 Ubuntu][5] 时，你会被强制创建一个用户。这个用户拥有管理员访问权限。这个管理员用户可以通过 `sudo` 命令获得 root 访问权限。但是，该用户使用的是自身的密码，而不是 root 账户的密码（因为就没有）。

你可以使用 `passwd` 命令来设置或修改 root 用户的密码。然而，在大多数情况下，你并不需要它，而且你不应该去做这样的事。

你将必须使用 `sudo` 命令（对于拥有管理员权限的账户）。~~如果 root 用户的密码之前没有被设置，它会要求你设置。另外，你可以使用已有的 root 密码对它进行修改。~~（LCTT 译注：此处描述有误，使用 `sudo` 或直接以 root 用户执行 `passwd` 命令时，不需要输入该被改变密码的用户的当前密码。）

```
sudo password root
```

### 在 Ubuntu 下使用图形界面（GUI）修改密码

我这里使用的是 GNOME 桌面环境，Ubuntu 版本为 18.04。这些步骤对于其他的桌面环境和 Ubuntu 版本应该差别不大。

打开菜单（按下 `Windows`/`Super` 键）并搜索 “Settings”（设置）。

在 “Settings” 中，向下滚动一段距离打开进入 “Details”。

![在 Ubuntu GNOME Settings 中进入 Details][6]

在这里，点击 “Users” 获取系统下可见的所有用户。

![Ubuntu 下用户设置][7]

你可以选择任一你想要的用户，包括你的主要管理员账户。你需要先解锁用户并点击 “Password” 区域。

![Ubuntu 下修改用户密码][8]

你会被要求设置密码。如果你正在修改的是你自己的密码，你将必须也输入当前使用的密码。

![Ubuntu 下修改用户密码][9]

做好这些后，点击上面的 “Change” 按钮，这样就完成了。你已经成功地在 Ubuntu 下修改了用户密码。

我希望这篇快速精简的小教程能够帮助你在 Ubuntu 下修改用户密码。如果你对此还有一些问题或建议，请在下方留下评论。


--------------------------------------------------------------------------------

via: https://itsfoss.com/change-password-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[An-DJ](https://github.com/An-DJ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-password-ubuntu-linux.png?resize=800%2C450&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-linux-1.jpg?resize=800%2C253&ssl=1
[4]: https://itsfoss.com/how-to-hack-ubuntu-password/
[5]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-2.jpg?resize=800%2C484&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-3.jpg?resize=800%2C488&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-4.jpg?resize=800%2C555&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-1.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-password-ubuntu-linux.png?fit=800%2C450&ssl=1
