[#]: collector: (lujun9972)
[#]: translator: (rakino)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12721-1.html)
[#]: subject: (6 Essential Things To Do After Installing Manjaro Linux)
[#]: via: (https://itsfoss.com/things-to-do-after-installing-manjaro/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

安装 Manjaro Linux 后必做的 6 件事
======

你刚刚[全新安装了 Manjaro Linux][1]，那么现在该做什么呢？

下面是我推荐你在安装后进行的一些必不可少的步骤。

不过说实话，这些都是我在安装 Manjaro 后喜欢做的事，根据你的需求，步骤可能会有所不同。

### 推荐在安装完 Manjaro Linux 后去做的事

![][2]

我使用的是 Xfce 版的 Manjaro，但这些步骤也适用于 [Manjaro][3] 的其它桌面环境版本。

#### 1、设置最快的镜像

在更新系统之前，我建议先整理一下镜像列表。在刷新 Manjaro 系统和从软件仓库下载软件包的时候，优化后的镜像列表会对系统的性能产生明显的影响。

打开终端模拟器并输入以下命令：

```
sudo pacman-mirrors --fasttrack
```

![][4]

#### 2、更新系统

保持系统更新可以降低安全漏洞的发生机率，在安装新的软件之前也建议刷新一下系统的软件仓库。

你可以用下面的命令来[更新 Manjaro 系统][5]：

```
sudo pacman -Syu
```

![][6]

#### 3、启用 AUR、Snap 以及 Flatpak 支持

[<ruby>Arch 用户仓库<rt>Arch User Repository</rt></ruby>（AUR）][7]是用户选择[基于 Arch Linux 的系统][8]的一个主要理由。你可以在 AUR 中访问到大量的附加软件。

（LCTT 译注：AUR 中的 PKGBUILD 均为用户上传且未经审核，使用者需要自负责任，在构建软件包前请注意检查其中内容是否合理。）

作为可选项，你可以直接在 Pacman 图形化软件包管理器中启用对 [Snap][9] 以及 [Flatpak][10] 的支持。

![][11]

#### 启用 TRIM（仅 SSD）

如果你的根分区已经安装在了 SSD 上，启用 [TRIM][12] 会是你在安装 Manjaro 后需要做的一件事。TRIM 会帮助清理 SSD 中的块，从而延长 SSD 的使用寿命。

要在 Manjaro 中启用 TRIM，请在终端中输入以下命令：

```
sudo systemctl enable fstrim.timer
```

![][13]

#### 5、安装内核（高级用户）

我在 [Manjaro 评测][14]中提到的一个话题就是，你可以在图形界面中轻易地更换内核。

喜欢使用命令行？你也可以在终端中列出系统中已安装的内核以及安装新的内核。

列出已安装的内核：

```
mhwd-kernel -li
```

安装新内核（以最新的 5.8 版本内核为例）：

```
sudo mhwd-kernel -i linux58
```

![][15]

#### 6、安装微软 TrueType 字体（如果需要）

我经常在个人电脑上编辑工作文件，因此我需要 Times New Roman 或 Arial 等微软字体。

如果你也需要使用微软字体，可以从 [AUR][7] 中取得这个[软件包][16]。如果你想要在命令行中管理 AUR 软件包，可以选择安装一个 [AUR 助手][17]。

![][18]

### 结论

如果你想在一个预配置、为桌面优化的发行版上享受 Arch Linux 的优点，[Manjaro 是一个很好的发行版][19]。虽然它预置了很多东西，但由于每个人设置和需求的不同，有几个步骤是不能提前完成的。

除开已经提到的步骤，还有哪一步对你来说是必不可少的？请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-manjaro/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-manjaro-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/things-to-do-after-installing-manjaro.jpg?resize=800%2C450&ssl=1
[3]: https://manjaro.org
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/manjaro-fasttrack.png?resize=800%2C600&ssl=1
[5]: https://itsfoss.com/update-arch-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/sudo-pacman-Syu.png?resize=800%2C504&ssl=1
[7]: https://itsfoss.com/aur-arch-linux/
[8]: https://itsfoss.com/arch-based-linux-distros/
[9]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/pamac-2.png?resize=800%2C600&ssl=1
[12]: https://en.wikipedia.org/wiki/Trim_(computing)
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/fstrim.timer_.png?resize=800%2C600&ssl=1
[14]: https://itsfoss.com/manjaro-linux-review/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/manjaro-cli-kernels.png?resize=800%2C600&ssl=1
[16]: https://aur.archlinux.org/packages/ttf-ms-fonts
[17]: https://itsfoss.com/best-aur-helpers/
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/ttf-ms-fonts.png?resize=800%2C600&ssl=1
[19]: https://itsfoss.com/why-use-manjaro-linux/
