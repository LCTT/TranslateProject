在Linux上安装使用‘Go for it！’备忘软件
===============================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_For_It_TODO_Linux.jpeg)

你在 Linux 桌面是如何管理任务和备忘的？我喜欢[用 Ubuntu 的粘帖便签][1]很久了。但是我要面对与其他设备同步的麻烦，特别是我的智能手机。这就是我为什么选择使用 [Google Keep][2] 的原因了。

Google Keep 是一款功能丰富的软件，我十分喜爱，而且喜欢到把它叫做 [Linux 的 Evernote ][3]地步。但是并不是每个人都喜欢一款功能丰富的备忘录软件。极简主义是目前的主流，很多人喜欢。如果你是极简主义的追求者之一，而且正在寻找一款开源的备忘录软件，那么你应该试一试 [Go For It！][4]。

### Go For It！高效的Linux桌面软件 ###

Go For It！是一款简洁的备忘软件，借助定时提醒帮助你专注于工作。所以，当你添加一个任务到列表后，可以附上一个定时器。到设定时间后，它就会提醒你去做任务。你可以看看其帅哥开发者 [Manuel Kehl][5] 制作的视频（youtube 视频） ： https://www.youtube.com/watch?v=mnw556C9FZQ

### 安装 Go For It！###

要在 Ubuntu 15.04,14.04 和其他基于 Ubuntu 的Linux 发行版，如Linux Mint， elementary OS Freya 等上面安装 Go For It！请使用这款软件官方的 PPA：

    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install go-for-it

你也可以下载 .deb 包，Windows 安装包和源代码，链接如下：

- [Download source code][6]
- [Download .deb binaries][7]
- [Download for Windows][8]

### 在Linux桌面使用 Go For It！###

Go For It！使用真心方便。你只需添加任务到列表中，任务会自动存入 todo.txt 文件中。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go-for-it_todo_app_linux.png)

每个任务默认定时25分钟。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go-for-it_todo_app_linux_1.png)

任务一旦完成，就会被自动存档到 done.txt 文件中。根据设置，它会在规定的时间间隔或者任务过期前不久，发送桌面提醒：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_for_it_Linux_notification.png)

你可以从配置里面修改所有的偏好。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go-for-it_todo_app_linux_2.png)

目前一切都看着挺好。但是在智能手机上使用体验怎样呢？如果你不能使它在不同设备间同步，那这款高效软件就是不完整的。好消息是 Go For It！是基于 [todo.txt][9] 的，这意味着你可以用第三方软件和像 Dropbox 一样的云服务来使用它。

### 在安卓手机和平板上使用Go For It！ ###

在这里你需要做一些工作。首先的首先，在 Linux 和你的安卓手机上安装 Dropbox，如果之前没有安装的话。下一步你要做的就是要配置 Go For It！和 **修改 todo.txt 的目录到 Dropbox 的路径下**。

然后，你得去下载 [Simpletask Andriod app][10]。这是免费的应用。安装它。当你第一次运行 Simletask 的时候，你会被要求关联你的账号到 Dropbox：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_for_it_Android_1.jpeg)

一旦你完成了 Simpletask 与 Dropbox 的关联，就可以打开应用了。如果你已经修改了 Go For It 的配置，将文件保存到Dropbox 上，你就应该可以在 Simpletask 里看到。而如果你没有看到，点击应用底部的设置，选择 Open Todo file 的选项：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Go_for_it_Android.jpeg)

现在，你应该可以看到 Simpletask 同步的任务了。

### 总结 ###

对于 Simpletask，你就可以以类似[标记语言工具][11]的风格使用它。对于小巧和专注而言，Go For It！是一款不错的备忘软件。一个干净的界面是额外的加分点。如果拥有它自己的手机应用就更好了，但是我们也有临时替代方案了。

底层来讲，Go For It! 不会运行在后台。这就是说，你不得不让它一直保持运行。它甚至没有一个最小化的按钮，这有一点小小的烦扰。我想要看到的是有一个小的指示程序，运行在后台，并且快速进入主面板，这肯定会提升其可用性。

试试 Go For It！吧，分享一下你的使用体验。在 Linux 桌面上,你还使用了哪些其他的备忘软件？比起其他你最喜欢的同类应用，Go For It！怎么样？

-------------------------------------------------------------------------------


via: http://itsfoss.com/go-for-it-to-do-app-in-linux/

作者：[Abhishek][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/indicator-stickynotes-windows-like-sticky-note-app-for-ubuntu/
[2]:http://itsfoss.com/install-google-keep-ubuntu-1310/
[3]:http://itsfoss.com/5-evernote-alternatives-linux/
[4]:http://manuel-kehl.de/projects/go-for-it/
[5]:http://manuel-kehl.de/about-me/
[6]:https://github.com/mank319/Go-For-It
[7]:https://launchpad.net/~mank319/+archive/ubuntu/go-for-it
[8]:http://manuel-kehl.de/projects/go-for-it/download-windows-version/
[9]:http://todotxt.com/
[10]:https://play.google.com/store/apps/details?id=nl.mpcjanssen.todotxtholo&hl=en
[11]:http://itsfoss.com/install-latex-ubuntu-1404/
