[#]: collector: (lujun9972)
[#]: translator: (guevaraya)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10562-1.html)
[#]: subject: (How to List Installed Packages on Ubuntu and Debian [Quick Tip])
[#]: via: (https://itsfoss.com/list-installed-packages-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何列出 Ubuntu 和 Debian 上已安装的软件包
======

当你安装了 [Ubuntu 并想好好用一用][1]。但在将来某个时候，你肯定会遇到忘记曾经安装了那些软件包。

这个是完全正常。没有人要求你把系统里所有已安装的软件包都记住。但是问题是，如何才能知道已经安装了哪些软件包？如何查看安装过的软件包呢？

### 列出 Ubuntu 和 Debian 上已安装的软件包

![列出已安装的软件包][2]

如果你经常用 [apt 命令][3]，你可能觉得会有个命令像 `apt` 一样可以列出已安装的软件包。不算全错。

[apt-get 命令][4] 没有类似列出已安装软件包的简单的选项，但是 `apt` 有一个这样的命令：

```
apt list --installed
```

这个会显示使用 `apt` 命令安装的所有的软件包。同时也会包含由于依赖而被安装的软件包。也就是说不仅会包含你曾经安装的程序，而且会包含大量库文件和间接安装的软件包。

![用 atp 命令列出显示已安装的软件包][5] 

*用 atp 命令列出显示已安装的软件包*

由于列出出来的已安装的软件包太多，用 `grep` 过滤特定的软件包是一个比较好的办法。

```
apt list --installed | grep program_name
```

如上命令也可以检索出使用 .deb 软件包文件安装的软件。是不是很酷？

如果你阅读过 [apt 与 apt-get 对比][7]的文章，你可能已经知道 `apt` 和 `apt-get` 命令都是基于 [dpkg][8]。也就是说用 `dpkg` 命令可以列出 Debian 系统的所有已经安装的软件包。

```
dpkg-query -l
```

你可以用 `grep` 命令检索指定的软件包。

![用 dpkg 命令列出显示已经安装的软件包][9]!

*用 dpkg 命令列出显示已经安装的软件包*

现在你可以搞定列出 Debian 的软件包管理器安装的应用了。那 Snap 和 Flatpak 这个两种应用呢？如何列出它们？因为它们不能被 `apt` 和 `dpkg` 访问。 

显示系统里所有已经安装的 [Snap 软件包][10]，可以这个命令：

```
snap list
```

Snap 可以用绿色勾号标出哪个应用来自经过认证的发布者。

![列出已经安装的 Snap 软件包][11]

*列出已经安装的 Snap 软件包*

显示系统里所有已安装的 [Flatpak 软件包][12]，可以用这个命令：

```
flatpak list
```

让我来个汇总：


用 `apt` 命令显示已安装软件包：

```
apt list –installed
```

用 `dpkg` 命令显示已安装软件包:

```
dpkg-query -l
```

列出系统里 Snap 已安装软件包:

```
snap list
```

列出系统里 Flatpak 已安装软件包:

```
flatpak list
```

### 显示最近安装的软件包

现在你已经看过以字母顺序列出的已经安装软件包了。如何显示最近已经安装的软件包?

幸运的是，Linux 系统保存了所有发生事件的日志。你可以参考最近安装软件包的日志。

有两个方法可以来做。用 `dpkg` 命令的日志或者 `apt` 命令的日志。

你仅仅需要用 `grep` 命令过滤已经安装的软件包日志。

```
grep " install " /var/log/dpkg.log
```

这会显示所有的软件安装包，其中包括最近安装的过程中所依赖的软件包。

```
2019-02-12 12:41:42 install ubuntu-make:all 16.11.1ubuntu1
2019-02-13 21:03:02 install xdg-desktop-portal:amd64 0.11-1
2019-02-13 21:03:02 install libostree-1-1:amd64 2018.8-0ubuntu0.1
2019-02-13 21:03:02 install flatpak:amd64 1.0.6-0ubuntu0.1
2019-02-13 21:03:02 install xdg-desktop-portal-gtk:amd64 0.11-1
2019-02-14 11:49:10 install qml-module-qtquick-window2:amd64 5.9.5-0ubuntu1.1
2019-02-14 11:49:10 install qml-module-qtquick2:amd64 5.9.5-0ubuntu1.1
2019-02-14 11:49:10 install qml-module-qtgraphicaleffects:amd64 5.9.5-0ubuntu1
```

你也可以查看 `apt` 历史命令日志。这个仅会显示用 `apt` 命令安装的的程序。但不会显示被依赖安装的软件包，详细的日志在日志里可以看到。有时你只是想看看对吧？

```
grep " install " /var/log/apt/history.log
```

具体的显示如下：

```
Commandline: apt install pinta
Commandline: apt install pinta
Commandline: apt install tmux
Commandline: apt install terminator
Commandline: apt install moreutils
Commandline: apt install ubuntu-make
Commandline: apt install flatpak
Commandline: apt install cool-retro-term
Commandline: apt install ubuntu-software
```

![显示最近已安装的软件包][13]

*显示最近已安装的软件包*

`apt` 的历史日志非常有用。因为他显示了什么时候执行了 `apt` 命令，哪个用户执行的命令以及安装的软件包名。

### 小技巧：在软件中心显示已安装的程序包名

如果你觉得终端和命令行交互不友好，还有一个方法可以查看系统的程序名。

可以打开软件中心，然后点击已安装标签。你可以看到系统上已经安装的程序包名

![Ubuntu 软件中心显示已安装的软件包][14]

*在软件中心显示已安装的软件包*

这个不会显示库和其他命令行的东西，有可能你也不想看到它们，因为你的大量交互都是在 GUI。此外，你也可以用 Synaptic 软件包管理器。

### 结束语

我希望这个简易的教程可以帮你查看 Ubuntu 和基于 Debian 的发行版的已安装软件包。

如果你对本文有什么问题或建议，请在下面留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/list-installed-packages-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/getting-started-with-ubuntu/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/apt-command-guide/
[4]: https://itsfoss.com/apt-get-linux-guide/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages-in-ubuntu-with-apt.png?resize=800%2C407&ssl=1
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://itsfoss.com/apt-vs-apt-get-difference/
[8]: https://wiki.debian.org/dpkg
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages-with-dpkg.png?ssl=1
[10]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-snap-packages.png?ssl=1
[12]: https://itsfoss.com/flatpak-guide/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/apt-list-recently-installed-packages.png?resize=800%2C187&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/installed-software-ubuntu.png?ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages.png?fit=800%2C450&ssl=1
