[#]: subject: "How I gave my old laptop new life with the Linux Xfce desktop"
[#]: via: "https://opensource.com/article/22/6/linux-xfce-old-laptop"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "lightchaserhy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

我如何利用Linux Xface桌面赋予旧电脑新生命
======
当我为了一场会议的样例演示，用笔记本电脑安装Linux系统后，发现旧电脑运行Linux系统和Xfce桌面非常流畅。

几周前，我要在一个会议上简要演示自己在Linux下编写的一款小软件。我需要带一台Linux笔记本电脑参会，因此我翻出一台旧笔记本电脑并且安装上Linux系统。我使用的是 Fedora 36 Xfce spin，使用还不错。

The laptop I used was purchased in 2012. The 1.70 GHz CPU, 4 GB memory, and 128 GB drive may seem small compared to my current desktop machine, but Linux and the Xfce desktop gave this old machine new life.

### Linux的Xfce桌面

Xfce桌面是一个轻量级桌面，它提供一个精美、现代的外观。熟悉的界面，有任务栏或者顶部“面板”可以启动应用程序，在系统托盘可以改变虚拟桌面，或者查看通知信息。

![Image of Xfce desktop][6]

要开始一个新应用程序，点击左上角的应用程序按钮。这将打开一个应用程序启动菜单，顶部有常用的应用程序比如终端和文件管理。另外的应用程序会分组排列，这样你可以找到所需要的应用。

![Image of desktop applications][7]

### 管理文件

Xfce的文件管理器时叫Thunar，它能非常好地管理我的文件。我喜欢Thunar可以连接远程系统，在家里，我用一个开启SSH的树莓派作为个人文件服务器。Thunar可以打开一个SSH文件传输窗口，这样我可以在笔记本电脑和树莓派之间拷贝文件。

![Image of Thunar remote][9]

另一个访问文件和文件夹的方式是通过屏幕底部的快速访问停靠栏。点击文件夹图标可以打开一个常规操作菜单，如在终端窗口打开一个文件夹、新建一个文件夹或进入指定文件夹等。

![Image of desktop with open folders][10]

### 其它应用程序

我热爱探索Xfce提供的其他应用程序。Mousepad看起来像一个简单的文本编辑器，但是比起纯文本编辑，它包含更多有用的功能。Mousepad支持许多文件类型，程序员和其他高级用户也许会非常喜欢。在文档菜单检验一下可用的部分编程语言列表。

![Image of Mousepad file types][11]

如果你更喜欢一个不同的外观和感觉，可以用视图菜单调整界面选项，如字体、配色方案以及行号。

![Image of Mousepad in color scheme solarized][12]

磁盘工具可以让你管理储存设备。虽然我不需要修改我的系统磁盘，磁盘工具是一个初始化或重新格式化USB闪存设备的好方式。我认为这个界面非常简单好用。
![Image of disk utility][13]

我非常钦佩带有Geany集成开发的环境，我有一点惊讶一个旧系统可以如此流畅地运行一个完整的IDE开发软件。

我用一个简单的“hello world”程序测试Geany，当我输入每一个函数名称时，很高兴地看到IDE弹出语法帮助，弹出的信息并不唐突且刚好提供了我需要的信息。同时printf函数非常容易记住，我总是忘记其它函数的选项顺序，比如fputs和realloc，这就是我需要弹出语法帮助的地方。

![Image of Geany workspace][14]

在Xfce里探索菜单寻找其它应用程序让你的工作更简单，你将找到可以播放音乐、访问终端或浏览网页的应用程序。

当我安装Linux到笔记本电脑，在会议上演示一些样例后，发现Linux和Xfce桌面让这台旧电脑变得更时尚。这个系统运行得如此流畅，当会议结束后，我决定把这台笔记本电脑作为备用机。

我喜爱在Xfce上使用应用程序工作，尽管它有非常低的系统开销和极简单的方法，但我并没有感觉到不够用，我可以用Xfce和上面的应用程序做任何事情。如果你有一台需要翻新的旧电脑，试试安装Linux，给旧硬件带来新的生命。

图片来源: (Jim Hall, CC BY-SA 40)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-xfce-old-laptop

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[lightchaserhy](https://github.com/lightchaserhy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://spins.fedoraproject.org/xfce/download/index.html
[5]: https://opensource.com/article/19/12/xfce-linux-desktop
[6]: https://opensource.com/sites/default/files/2022-06/Linuxlaptop1.png
[7]: https://opensource.com/sites/default/files/2022-06/linuxlaptopDesktopApps.png
[8]: https://opensource.com/article/20/3/personal-file-server-ssh
[9]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopThunarremote.png
[10]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopDesk.png
[11]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopMousepadfiletype.png
[12]: https://opensource.com/sites/default/files/2022-06/Linuxlaptopmousepadsolarized.png
[13]: https://opensource.com/sites/default/files/2022-06/linuxlaptopdisks.png
[14]: https://opensource.com/sites/default/files/2022-06/Linuxlaptopgeany.png
