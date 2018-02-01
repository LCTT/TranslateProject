在 Linux 的终端上伪造一个好莱坞黑客的屏幕
=============

摘要：这是一个简单的小工具，可以把你的 Linux 终端变为好莱坞风格的黑客入侵的实时画面。

我攻进去了！

你可能会几乎在所有的好莱坞电影里面会听说过这句话，此时的荧幕正在显示着一个入侵的画面。那可能是一个黑色的终端伴随着 ASCII 码、图标和连续不断变化的十六进制编码以及一个黑客正在击打着键盘，仿佛他/她正在打一段愤怒的论坛回复。

但是那是好莱坞大片！黑客们想要在几分钟之内破解进入一个网络系统除非他花费了几个月的时间来研究它。不过现在我先把对好莱坞黑客的评论放在一边。

因为我们将会做相同的事情，我们将会伪装成为一个好莱坞风格的黑客。

这个小工具运行一个脚本在你的 Linux 终端上，就可以把它变为好莱坞风格的实时入侵终端：

![在 Linux 上的Hollywood 入侵终端][1]

看到了吗？就像这样，它甚至在后台播放了一个 Mission Impossible 主题的音乐。此外每次运行这个工具，你都可以获得一个全新且随机的入侵的终端。

让我们看看如何在 30 秒之内成为一个好莱坞黑客。


### 如何安装 Hollywood 入侵终端在 Linux 之上

这个工具非常适合叫做 Hollywood 。从根本上说，它运行在 Byobu ——一个基于文本的窗口管理器，而且它会创建随机数量、随机尺寸的分屏，并在每个里面运行一个混乱的文字应用。

[Byobu][2] 是一个在 Ubuntu 上由 Dustin Kirkland 开发的有趣工具。在其他文章之中还有更多关于它的有趣之处，让我们先专注于安装这个工具。

Ubuntu 用户可以使用简单的命令安装 Hollywood：

```
sudo apt install hollywood
```

如果上面的命令不能在你的 Ubuntu 或其他例如 Linux Mint、elementary OS、Zorin OS、Linux Lite 等等基于 Ubuntu 的 Linux 发行版上运行，你可以使用下面的 PPA 来安装：

```
sudo apt-add-repository ppa:hollywood/ppa
sudo apt-get update
sudo apt-get install byobu hollywood
```

你也可以在它的 GitHub 仓库之中获得其源代码： [Hollywood 在 GitHub][3] 。

一旦安装好，你可以使用下面的命令运行它，不需要使用 sudo ：

```
hollywood
```

因为它会先运行 Byosu ，你将不得不使用 `Ctrl+C` 两次并再使用 `exit` 命令来停止显示入侵终端的脚本。

这里面有一个伪装好莱坞入侵的视频。 https://youtu.be/15-hMt8VZ50

这是一个让你朋友、家人和同事感到吃惊的有趣小工具，甚至你可以在酒吧里给女孩们留下深刻的印象，尽管我不认为这对你在那方面有任何的帮助，

并且如果你喜欢 Hollywood 入侵终端，或许你也会喜欢另一个可以[让 Linux 终端产生 Sneaker 电影效果的工具][5]。

如果你知道更多有趣的工具，可以在下面的评论栏里分享给我们。


------

via: https://itsfoss.com/hollywood-hacker-screen/

作者：[Abhishek Prakash][a]
译者：[Drshu](https://github.com/Drshu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/hollywood-hacking-linux-terminal.jpg
[2]: http://byobu.co/
[3]: https://github.com/dustinkirkland/hollywood
[4]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]: https://itsfoss.com/sneakers-movie-effect-linux/