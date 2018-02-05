Chromebook 如何双启动：Ubuntu 17.04 GNOME 和 Chrome OS
============================================================


> 本教程使用著名的 Crouton 安装器

![Ubuntu 17.04 with GNOME 3.24 running on Acer Chromebook 11 (C740)](http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-2.jpg)

在去年我拿到我的 Acer Chromebook 11 (C740) 时，我写了一篇教程教你们如何[如何移除 Google Chrome OS 并根据你的选择安装一个 GNU/Linux 发行版][1]，但是很快我觉得没意思了。

因此几个月之后，我使用了 Google 在网站上提供的恢复镜像重新安装了 Chrome OS，我写入了 USB 并从 Chromebook 启动。最近，我又感到无聊了，因此我决定使用 Crouton 在我的 Acer Chromebook 11 (C740) 上安装 Ubuntu。

为什么？因为在一次会议中来的一位朋友带了他的笔记本，一台 Dell Chromebook 13，在上面他运行了 Ubuntu Linux 还有 Chrome OS。看他用快捷键在两个操作系统之间切换很酷，这让我也想这么做。

现在有很多教程解释如何安装不同的发行版 Ubuntu、Debian 或者 Kali Linux（这些是当前 Crouton 安装器支持的 GNU/Linux 发行版），但是我想要运行最新的 Ubuntu，当前是 Ubuntu 17.04 (Zesty Zapus)，它有 GNOME 3.24 桌面环境。

### 如何启用开发者模式并下载 Crouton

当我询问我的朋友他在他的 Chromebook 上运行的是什么 Ubuntu 时，回答是 Ubuntu 14.04 LTS (Trusty Tahr)，我不得不承认这让我有点失望。我回家后立刻拿出我的 Chromebook 并尝试看看我是否能运行带有桌面环境的 Ubuntu 17.04。

我做的第一件事情是将我的 Chromebook 变成开发者模式。为此，你需要关闭你的 Chromebook 但不关闭翻盖，接着同时按住 `ESC`、`Refresh` 和 `Power` 键几秒直到进入恢复模式，这会擦除 Chromebook 上的所有数据。

进入开发者模式会花费你几分钟，所以耐心点。当准备完成后，你需要登录你的 Google 账户，并设置各种东西，比如壁纸或者头像之类。现在你进入开发者模式了，在你的 Chromebook 中访问这篇教程并[下载 Crouton][2]，它会保存在下载文件夹中。

### 如何使用 Crouton 安装带有 GNOME 3.24 的 Ubuntu 17.04

现在打开 Google Chrome 并按下 `CTRL+ALT+T` 打开 Chrome OS 的终端模拟器，它叫做 crosh。在命令提示符中，输入 `shell` 命令，按下回车进入 Linux shell。让我们看看 Crouton 能为我们做什么。 

这有两个命令（下面列出的），你可以运行它们查看 Crouton 支持的 GNU/Linux 发行版和桌面环境，并且我可以告诉你这可以安装 Debian 7 “Wheezy”、Debian 8 “Jessie”、Debian 9 “Stretch” 和 Debian Sid、Kali Linux 滚动版还有 Ubuntu 12.04 LTS、Ubuntu 14.04 LTS 和 Ubuntu 16.04 LTS 等等。

```
sh -e /Downloads/crouton -r list -  ### 会列出支持的发行版 
sh -e /Downloads/crouton -t list -  ### 会列出支持的桌面 
```

Crouton 也会列出一系列 Debian、Kali 和 Ubuntu 的旧发行版，但它们在上游被中止支持了（这些的名字后面都被标记了感叹号），并且因为安全风险你不应该安装它们，还有两个尚未支持的 Ubuntu 版本，Ubuntu 16.10 和 Ubuntu 17.04。

Crouton 开发者说这些“不支持”的 Ubuntu 版本用一些方法可能也可以使用，但是我试了一下并使用下面的命令安装了带有 GNOME 3.24 桌面环境（没有额外的应用）的 Ubuntu 17.04 (Zesty Zapus)。我使用 `-e` 参数来加密安装。

```
sh -e /Downloads/crouton -e -r zesty -t gnome
```

将所有的都下载下来并安装在 Crouton 在你的 Chromebook 中创建的 chroot 环境中会花费一些时间，因此再说一次，请耐心。当一切完成后，你会知道，并且你能通过在 shell 中运行下面的命令启动 Ubuntu 17.04。

```
sudo startgnome
```

瞧！我在我的旧 Acer Chromebook 11 (C740) 上运行着带有 GNOME 3.24 桌面环境的 Ubuntu 17.04 (Zesty Zapus)，这笔记本 Google 还尚未支持 Android 程序。最棒的部分是我能够使用 `CTRL+ALT+Shift`+`Back`/`Forward` 键盘快捷键快速在 Chrome OS 和 Ubuntu 17.04 之间切换。

![GNOME 3.24 desktop - System menu](http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-3.jpg)

作为这篇笔记的结尾，我想提醒你注意，由于 Chromebook 现在始终处于开发人员模式，所以当电池电量耗尽、打开或关闭设备时，你会一直看到一个警告，显示 “OS verification is OFF - Press SPACE to re-enable”，当你看到它时，请按 `CTRL+D`。玩得开心！

![GNOME 3.24 desktop - Calendar applet](http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-4.jpg)

![GNOME 3.24 desktop - Overview mode](http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-5.jpg)


--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml

作者：[Marius Nestor][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
[1]:http://news.softpedia.com/news/here-s-how-to-install-any-linux-operating-system-on-your-chromebook-506212.shtml
[2]:https://goo.gl/fd3zc
[3]:http://news.softpedia.com/editors/browse/marius-nestor
[4]:http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml#
[5]:https://share.flipboard.com/bookmarklet/popout?v=2&title=Chromebook+Dual+Boot+How-to%3A+Ubuntu+17.04+GNOME+and+Chrome+OS&url=http%3A%2F%2Fnews.softpedia.com%2Fnews%2Fhow-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml&t=1498358928&utm_campaign=widgets&utm_medium=web&utm_source=flipit&utm_content=news.softpedia.com
[6]:http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml#
[7]:http://twitter.com/intent/tweet?related=softpedia&via=mariusnestor&text=Chromebook+Dual+Boot+How-to%3A+Ubuntu+17.04+GNOME+and+Chrome+OS&url=http%3A%2F%2Fnews.softpedia.com%2Fnews%2Fhow-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml
[8]:https://plus.google.com/share?url=http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml
[9]:http://news.softpedia.com/newsTag/Ubuntu%2017.04
[10]:http://news.softpedia.com/newsTag/GNOME%203.24
[11]:http://news.softpedia.com/newsTag/Chromebook
[12]:http://news.softpedia.com/newsTag/Acer%20Chrombook%2011
[13]:http://news.softpedia.com/newsTag/Linux
[14]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-3.jpg
[15]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-4.jpg
[16]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-5.jpg
[17]:https://twitter.com/intent/follow?screen_name=mariusnestor
[18]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-2.jpg
