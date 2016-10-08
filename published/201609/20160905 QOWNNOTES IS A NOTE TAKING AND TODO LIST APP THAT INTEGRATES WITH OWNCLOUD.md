QOwnNotes：一款记录笔记和待办事项的应用，集成 ownCloud 云服务
===============

[QOwnNotes][1] 是一款自由而开源的笔记记录和待办事项的应用，可以运行在 Linux、Windows 和 mac 上。 

这款程序将你的笔记保存为纯文本文件，它支持 Markdown 支持，并与 ownCloud 云服务紧密集成。

![](https://2.bp.blogspot.com/-a2vsrOG0zFk/V81gyHWlaaI/AAAAAAAAYZs/uzY16JtNcT8bnje1rTKJx1135WueY6V9gCLcB/s400/qownnotes.png)

QOwnNotes 的亮点就是它集成了 ownCloud 云服务（当然是可选的）。在 ownCloud 上用这款 APP，你就可以在网路上记录和搜索你的笔记，也可以在移动设备上使用（比如一款像 CloudNotes 的软件[2]）。 

不久以后，用你的 ownCloud 账户连接上 QOwnNotes，你就可以从你 ownCloud 服务器上分享笔记和查看或恢复之前版本记录的笔记（或者丢到垃圾箱的笔记）。

同样，QOwnNotes 也可以与 ownCloud 任务或者 Tasks Plus 应用程序相集成。

	如果你不熟悉 [ownCloud][3] 的话，这是一款替代 Dropbox、Google Drive 和其他类似商业性的网络服务的自由软件，它可以安装在你自己的服务器上。它有一个网络界面，提供了文件管理、日历、照片、音乐、文档浏览等等功能。开发者同样提供桌面同步客户端以及移动 APP。

因为笔记被保存为纯文本，它们可以在不同的设备之间通过云存储服务进行同步，比如 Dropbox，Google Drive 等等，但是在这些应用中不能完全替代 ownCloud 的作用。 

我提到的上述特点，比如恢复之前的笔记，只能在 ownCloud 下可用（尽管 Dropbox 和其他类似的也提供恢复以前的文件的服务，但是你不能在 QOwnnotes 中直接访问到）。

鉴于 QOwnNotes 有这么多优点，它支持 Markdown 语言（内置了 Markdown 预览模式），可以标记笔记，对标记和笔记进行搜索，在笔记中加入超链接，也可以插入图片：

![](https://4.bp.blogspot.com/-SuBhC43gzkY/V81oV7-zLBI/AAAAAAAAYZ8/l6nLQQSUv34Y7op_Xrma8XYm6EdWrhbIACLcB/s400/qownnotes_2.png)

标记嵌套和笔记文件夹同样支持。

代办事项管理功能比较基本还可以做一些改进，它现在打开在一个单独的窗口里，它也不用和笔记一样的编辑器，也不允许添加图片或者使用 Markdown 语言。 

![](https://3.bp.blogspot.com/-AUeyZS3s_ck/V81opialKtI/AAAAAAAAYaA/xukIiZZUdNYBVZ92xgKEsEFew7q961CDwCLcB/s400/qownnotes-tasks.png)

它可以让你搜索你代办事项，设置事项优先级，添加提醒和显示完成的事项。此外，待办事项可以加入笔记中。

这款软件的界面是可定制的，允许你放大或缩小字体，切换窗格等等，也支持无干扰模式。

![](https://4.bp.blogspot.com/-Pnzw1wZde50/V81rrE6mTWI/AAAAAAAAYaM/0UZnH9ktbAgClkuAk1g6fgXK87kB_Bh0wCLcB/s400/qownnotes-distraction-free.png)

从程序的设置里，你可以开启黑夜模式（这里有个 bug，在 Ubuntu 16.04 里有些工具条图标消失了），改变状态条大小，字体和颜色方案（白天和黑夜）：

![](https://1.bp.blogspot.com/-K1MGlXA8sxs/V81rv3fwL6I/AAAAAAAAYaQ/YDhhhnbJ9gY38B6Vz1Na_pHLCjLHhPWiwCLcB/s400/qownnotes-settings.png)

其他的特点有支持加密（笔记只能在 QOwnNotes 中加密），自定义键盘快捷键，输出笔记为 pdf 或者 Markdown，自定义笔记自动保存间隔等等。

访问 [QOwnNotes][11] 主页查看完整的特性。

### 下载 QOwnNotes

如何安装，请查看安装页（支持 Debian、Ubuntu、Linux Mint、openSUSE、Fedora、Arch Linux、KaOS、Gentoo、Slackware、CentOS 以及 Mac OSX 和 Windows）。

QOwnNotes 的 [snap][5] 包也是可用的，在 Ubuntu 16.04 或更新版本中，你可以通过 Ubuntu 的软件管理器直接安装它。

为了集成 QOwnNotes 到 ownCloud，你需要有 [ownCloud 服务器][6]，同样也需要 [Notes][7]、[QOwnNotesAPI][8]、[Tasks][9]、[Tasks Plus][10] 等 ownColud 应用。这些可以从 ownCloud 的 Web 界面上安装，不需要手动下载。

请注意 QOenNotesAPI 和 Notes ownCloud 应用是实验性的，你需要“启用实验程序”来发现并安装他们，可以从 ownCloud 的 Web 界面上进行设置，在 Apps 菜单下，在左下角点击设置按钮。

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/09/qownnotes-is-note-taking-and-todo-list.html

作者：[Andrew][a]
译者：[jiajia9linuxer](https://github.com/jiajia9linuxer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: http://www.qownnotes.org/
[2]: http://peterandlinda.com/cloudnotes/
[3]: https://owncloud.org/
[4]: http://www.qownnotes.org/installation
[5]: https://uappexplorer.com/app/qownnotes.pbek
[6]: https://download.owncloud.org/download/repositories/stable/owncloud/
[7]: https://github.com/owncloud/notes
[8]: https://github.com/pbek/qownnotesapi
[9]: https://apps.owncloud.com/content/show.php/Tasks?content=164356
[10]: https://apps.owncloud.com/content/show.php/Tasks+Plus?content=170561
[11]: http://www.qownnotes.org/
