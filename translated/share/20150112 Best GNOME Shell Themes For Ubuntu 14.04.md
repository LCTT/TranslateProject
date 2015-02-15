Ubuntu 14.04 上 最好的 GNOME Shell 主题
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Best_Gnome_Shell_Themes.jpeg)

最好的方式来自定义你的 Linux 桌面就是使用自定义主题。假如你在 [Ubuntu 14.04 中安装 GNOME][1] 或 在 Ubuntu 14.10 中安装了 GNOME，你或许想改变默认的主题以呈现出不同的外观。在这里，为了帮助你完成该任务，我已经编制好了一个列表—— **Ubuntu 或其他已经安装了 GNOME shell 的 Linux 操作系统中，最好的 GNOME Shell 主题** 。但在我们揭晓这份列表之前， 让我们先了解如何在 GNOME shell 中安装和应用新的主题。

### 在 GNOME Shell 中安装主题 ###

要在带有 GNOME 桌面的 Ubuntu 中安装新的主题，你可以使用 Gnome Tweak Tool，它可以在 Ubuntu 软件库中得到。打开一个终端窗口并使用如下命令：

```
sudo apt-get install gnome-tweak-tool
```

或者，你可以通过把主题放置到 `~/.themes` 目录中来使用。如果你需要，我已经写了一个关于 [如何安装和使用 GNOME shell][2]的具体教程。

### 最好的 GNOME Shell 主题 ###

下面列举的主题都已经在 GNOME Shell 3.10.4 上进行了测试，但对于任何版本的 GNOME 3 或更高的版本，它们应该同样适用。需要指出的是，这些主题并没有按照任何优先顺序排列。下面就让我们看看这些最好的 GNOME 主题：

#### Numix ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/02/mockups_numix_5.jpeg)

任何没有提到 [Numix 主题][3] 的列表都是不完整的。这个主题是如此地受欢迎以至于 [Numix 团队开发出一个新的 Linux 操作系统， Ozon][4]。考虑到他们的设计作品 Numix 主题，把不久将发行的 `Ozon` 称为 [最美丽的 Linux 操作系统][5] 也不为过。

使用下面的命令，在基于 Ubuntu 的发行版本中安装 Numix 主题：

```
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle
```

#### Elegance Colors ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Elegance_Colors_Theme_GNOME_Shell.jpeg)

另一个美丽主题来自 Numix 团队成员之一 Satyajit Sahoo。[Elegance Colors][6] 拥有自己的 PPA (译者注： 即 Personal Package Archive 的缩写) 使得你可以轻松安装它：

```
sudo add-apt-repository ppa:satyajit-happy/themes
sudo apt-get update
sudo apt-get install gnome-shell-theme-elegance-colors
```

#### Moka ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Moka_GNOME_Shell.jpeg)

[Moka][7] 是另一个迷人的主题，它总是位于美丽的主题列表之中。它是由 Unity Tweak Tool 的开发者所设计。 Moka 是你一定要尝试的主题:

```
sudo add-apt-repository ppa:moka/stable
sudo apt-get update
sudo apt-get install moka-gnome-shell-theme
```

#### Viva ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Viva_GNOME_Theme.jpg)

基于 GNOME 的默认主题 Adwaita， Viva 是一个带有黑色和橙色阴影的美丽主题。你可以从下面的链接中下载 Viva：

- [Download Viva GNOME Shell Theme][8]

#### Ciliora-Prima ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Ciliora_Prima_Gnome_Shell.jpeg)

以前它以 Zukitwo Dark 的名字为人们熟知， Ciliora-Prima 是一个拥有方块图标的主题，可使用的三种版本之间彼此略有不同。你可以从下面的链接中下载它们：

- [Download Ciliora-Prima GNOME Shell Theme][9]

#### Faience ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Faience_GNOME_Shell_Theme.jpeg)

Faience 作为一个受欢迎的主题已经有一段时间了。你可以通过下面的 PPA 为 GNOME 3.10 及更高版本安装 Faience：

```
sudo add-apt-repository ppa:tiheum/equinox
sudo apt-get update
sudo apt-get install faience-theme
```

#### Paper [不完善] ####

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Paper_GTK_Theme.jpeg)

自从 Google 提出 `Material Design`，人们一直为之疯狂。Paper GTK 主题受 Google Material design 启发，作者为 Sam Hewitt( Moka 项目开发者之一)；它正处于开发中，这意味着当前你还不能拥有 Paper 的最好体验。假如你和我一样，具有一点实验精神，你绝对可以试一试。

```
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-gtk-theme
```

以上就是我的列表。如果你正试着给你的 Ubuntu 换一个不同的模样，你也应该试试这个列表： [Ubuntu 14.04 中最好的图标主题][10]。

你是怎样找到这份 **最好的 GNOME shell 主题** 列表的呢？在上面列举的主题中，哪个是你最中意的？ 如果它没有在这里列出，请一定在评论中告诉我们哪个是你心目中最好的 GNOME shell 主题 。

--------------------------------------------------------------------------------

via: http://itsfoss.com/gnome-shell-themes-ubuntu-1404/

作者：[Abhishek][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/how-to-install-gnome-in-ubuntu-14-04/
[2]:http://itsfoss.com/install-switch-themes-gnome-shell/
[3]:https://numixproject.org/
[4]:http://itsfoss.com/numix-linux-distribution/
[5]:http://itsfoss.com/new-beautiful-linux-2015/
[6]:http://satya164.deviantart.com/art/Gnome-Shell-Elegance-Colors-305966388
[7]:http://mokaproject.com/
[8]:https://github.com/vivaeltopo/gnome-shell-theme-viva
[9]:http://zagortenay333.deviantart.com/art/Ciliora-Prima-Shell-451947568
[10]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
