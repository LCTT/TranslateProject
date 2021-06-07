[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10554-1.html)
[#]: subject: (4 cool new projects to try in COPR for February 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-february-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org)

COPR 仓库中 4 个很酷的新软件（2019.2）
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR 是个人软件仓库[集合][1]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不被 Fedora 基础设施不支持或没有被该项目所签名。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

这是 COPR 中一组新的有趣项目。

### CryFS

[CryFS][2] 是一个加密文件系统。它设计与云存储一同使用，主要是 Dropbox，尽管它也可以与其他存储提供商一起使用。CryFS 不仅加密文件系统中的文件，还会加密元数据、文件大小和目录结构。

#### 安装说明

仓库目前为 Fedora 28 和 29 以及 EPEL 7 提供 CryFS。要安装 CryFS，请使用以下命令：

```
sudo dnf copr enable fcsm/cryfs
sudo dnf install cryfs
```

### Cheat

[Cheat][3] 是一个用于在命令行中查看各种备忘录的工具，用来提醒仅偶尔使用的程序的使用方法。对于许多 Linux 程序，`cheat` 提供了来自手册页的精简后的信息，主要关注最常用的示例。除了内置的备忘录，`cheat` 允许你编辑现有的备忘录或从头开始创建新的备忘录。

![][4]

#### 安装说明

仓库目前为 Fedora 28、29 和 Rawhide 以及 EPEL 7 提供 `cheat`。要安装 `cheat`，请使用以下命令：

```
sudo dnf copr enable tkorbar/cheat
sudo dnf install cheat
```

### Setconf

[setconf][5] 是一个简单的程序，作为 `sed` 的替代方案，用于对配置文件进行更改。`setconf` 唯一能做的就是找到指定文件中的密钥并更改其值。`setconf` 仅提供很少的选项来更改其行为 - 例如，取消更改行的注释。

#### 安装说明

仓库目前为 Fedora 27、28 和 29 提供 `setconf`。要安装 `setconf`，请使用以下命令：

```
sudo dnf copr enable jamacku/setconf
sudo dnf install setconf
```

### Reddit 终端查看器

[Reddit 终端查看器][6]，或称为 `rtv`，提供了从终端浏览 Reddit 的界面。它提供了 Reddit 的基本功能，因此你可以登录到你的帐户，查看 subreddits、评论、点赞和发现新主题。但是，rtv 目前不支持 Reddit 标签。

![][7]

#### 安装说明

该仓库目前为 Fedora 29 和 Rawhide 提供 Reddit Terminal Viewer。要安装 Reddit Terminal Viewer，请使用以下命令：

```
sudo dnf copr enable tc01/rtv
sudo dnf install rtv
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-february-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[b]: https://github.com/lujun9972
[1]: https://copr.fedorainfracloud.org/
[2]: https://www.cryfs.org/
[3]: https://github.com/chrisallenlane/cheat
[4]: https://fedoramagazine.org/wp-content/uploads/2019/01/cheat.png
[5]: https://setconf.roboticoverlords.org/
[6]: https://github.com/michael-lazar/rtv
[7]: https://fedoramagazine.org/wp-content/uploads/2019/01/rtv.png
