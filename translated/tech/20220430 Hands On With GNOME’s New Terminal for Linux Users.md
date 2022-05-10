[#]: subject: "Hands On With GNOME’s New Terminal for Linux Users"
[#]: via: "https://itsfoss.com/gnome-console/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

上手体验 GNOME 为 Linux 用户带来的新终端
======

几天前，我分享了我 [对新 GNOME 文本编辑器的体验][1]，它是原编辑器 Gedit 的替代品。

但它并不是唯一的应用程序替代品。GNOME 42 还有一个新的终端，叫做 [<ruby>控制台<rt>Console</rt></ruby>][2]。

让我来分享一下 GNOME 提供的这个新终端的新功能，以及它的使用体验吧！

### Console：GNOME 的新终端模拟器

这个新应用程序的目标是提供一个“简单的用户友好的终端模拟器”。它确实“简单”，因为它没有提供以往 GNOME 终端下用户习惯的许多功能。

后面我会继续谈这个话题。让我们先看看 GNOME 控制台的新功能。

#### 桌面通知

Ubuntu 的 GNOME 终端从来没有这个功能，不过我在 elementary 和 Fedora 等发行版中看到过。

这是一个很方便的功能，当一个长期运行的命令执行完毕时，终端会发送一个桌面通知。

![GNOME 控制台的通知][3]

如果你在命令运行的同时，需要做其他事情，那么得到命令完成的通知有助于你保持工作效率。

#### 进行 root 操作时改变窗口颜色

这很可能是我在其他终端程序中没有见过的独特功能。

当你使用带有 sudo 或 [切换到根用户][4] 的命令时，应用程序窗口会变成红色。

![GNOME 控制台在使用 sudo 或 root 用户时变成红色][5]

我想它的目的是警告用户他们正在使用高级权限，因此在运行命令时要小心。

#### 主题

遵循新的设计准则，控制台提供了三种主题：浅色、深色和跟随系统。

![GNOME 控制台主题][6]

控制台默认使用系统主题，它根据你的操作系统主题而改变中终端配色。如果你不想改变系统主题，你可以使用控制台的浅色/深色选项。

关于主题的内容差不多就这些。你可以进行的 [终端定制][7] 并不多。

#### 透明界面

GNOME 控制台默认有一个透明界面。在正常模式下，你可以透过它看到一点背景。

例如，你可以从背景程序中看到一些模糊的文字。

![GNOME 控制台的透明界面][8]

我注意到，当控制台进入全屏模式时，界面不再透明。而且，你无法配置透明度。

#### 其他功能

谢天谢地，你可以在控制台中使用标签。

![标签式界面][9]

你可以执行与以往 GNOME 终端一样的搜索操作。

![GNOME 控制台中的搜索操作][10]

它没有太多的选项。<ruby>汉堡菜单<rt>hamburger menu</rt></ruby>让你一眼就能看到所有可用的键盘快捷键。

![GNOME 控制台中的键盘快捷键][11]

以上就是关于 GNOME 控制台的一切。

### 在 Ubuntu 22.04 上安装 GNOME 控制台

如果你的发行版使用了未经修改的 GNOME 42，那么它应该默认提供了新终端。

尽管 Ubuntu 22.04 使用的是 GNOME 42，但它仍然使用旧的 GNOME 终端。不过，你可以使用下面的命令来安装新的控制台。

```shell
sudo apt install gnome-console
```

### 总结

你可能会想，既然我们已经有了一个更好的、功能更强的 GNOME 终端，为什么还要开发一个新的控制台呢？这是因为 GNOME 有了新的设计指南。改造这些应用程序的旧代码库太复杂了，可能也不不大划算，从头开始写反而会更容易，因此你会看到更多的“新的” GNOME 应用程序，如控制台和文本编辑器。

由于这个新的应用程序的目标是让事情更简单，因此它没有提供很多功能。你不能定制它，改变颜色、字体等。由于不支持定制，所以也不需要配

对于很少使用终端的人来说，控制台已经够用了。不过，我认为应该增加在输入密码时显示星号的功能。其他 [面向初学者的发行版][12]，如 Mint，就使用了这个功能，从而避免对 Linux 新手用户造成困扰。

你如何看待这个新的 GNOME 控制台，以及这种创建“新的 GNOME 应用程序”的方式呢？欢迎在下方评论区发表你的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-console/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/gnome-text-editor/
[2]: https://gitlab.gnome.org/GNOME/console
[3]: https://itsfoss.com/wp-content/uploads/2022/04/notification-from-gnome-console.png
[4]: https://itsfoss.com/root-user-ubuntu/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/GNOME-Console-turns-red-when-using-sudo-or-root-800x442.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/04/themes-gnome-console.png
[7]: https://itsfoss.com/customize-linux-terminal/
[8]: https://itsfoss.com/wp-content/uploads/2022/04/transparent-gnome-console.png
[9]: https://itsfoss.com/wp-content/uploads/2022/04/tabs-GNOME-Console.png
[10]: https://itsfoss.com/wp-content/uploads/2022/04/search-GNOME-Console.png
[11]: https://itsfoss.com/wp-content/uploads/2022/04/keyboard-shortcuts-gnome-console.png
[12]: https://itsfoss.com/best-linux-beginners/
