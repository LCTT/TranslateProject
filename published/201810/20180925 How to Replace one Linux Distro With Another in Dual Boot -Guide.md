如何在双系统引导下替换 Linux 发行版
======

> 在双系统引导的状态下，你可以将已安装的 Linux 发行版替换为另一个发行版，同时还可以保留原本的个人数据。

![How to Replace One Linux Distribution With Another From Dual Boot][1]

假设你的电脑上已经[以双系统的形式安装了 Ubuntu 和 Windows][2]，但经过[将 Linux Mint 与 Ubuntu 比较][3]之后，你又觉得 [Linux Mint][4] 会更适合自己的时候，你会怎样做？又该如何在[删除 Ubuntu][5] 的同时[在双系统中安装 Mint][6] 呢？

你或许觉得应该首先从在双系统中卸载 [Ubuntu][7]，然后使用 Linux Mint 重新安装成双系统。但实际上并不需要这么麻烦。

如果你已经在双系统引导中安装了一种 Linux 发行版，就可以轻松替换成另一个发行版了，而且也不必卸载已有的 Linux 发行版，只需要删除其所在的分区，然后在腾出的磁盘空间上安装另一个 Linux 发行版就可以了。

与此同时，更换 Linux 发行版后，仍然会保留原本 home 目录中包含所有文件。

下面就来详细介绍一下。

### 在双系统引导中替换 Linux 发行版

<https://youtu.be/ptF2RUehbKs>

这是我的演示范例。我使用双系统引导同时安装了 Windows 10 和 Linux Mint 19，然后我会把 Linux Mint 19 替换成 Elementary OS 5，同时在替换后保留我的个人文件（包括音乐、图片、视频和 home 目录中的文件）。

你需要做好以下这些准备：

  * 使用 Linux 和 Windows 双系统引导
  * 需要安装的 Linux 发行版的 USB live 版
  * 在外部磁盘备份 Windows 和 Linux 中的重要文件（并非必要，但建议备份一下）

#### 在替换 Linux 发行版时要记住保留你的 home 目录

如果想让个人文件在安装新 Linux 系统的过程中不受影响，原有的 Linux 系统必须具有单独的 root 目录和 home 目录。你可能会发现我的[双系统引导教程][8]在安装过程中不选择“与 Windows 共存”选项，而选择“其它”选项，然后手动创建 root 和 home 分区。所以，手动创建单独的 home 分区也算是一个磨刀不误砍柴工的操作。因为如果要在不丢失文件的情况下，将现有的 Linux 发行版替换为另一个发行版，需要将 home 目录存放在一个单独的分区上。

不过，你必须记住现有 Linux 系统的用户名和密码才能使用与新系统中相同的 home 目录。

如果你没有单独的 home 分区，也可以后续再进行创建。但这并不是推荐做法，因为这个过程会比较复杂，有可能会把你的系统搞乱。

下面来看看如何替换到另一个 Linux 发行版。

#### 步骤 1：为新的 Linux 发行版创建一个 USB live 版

尽管上文中已经提到了它，但我还是要重复一次以免忽略。

你可以使用 Windows 或 Linux 中的启动盘创建器（例如 [Etcher][9]）来创建 USB live 版，这个过程比较简单，这里不再详细叙述。

#### 步骤 2：启动 USB live 版并安装 Linux

你应该已经使用过双系统启动，对这个过程不会陌生。使用 USB live 版重新启动系统，在启动时反复按 F10 或 F12 进入 BIOS 设置。选择从 USB 启动，就可以看到进入 live 环境或立即安装的选项。

在安装过程中，进入“安装类型”界面时，选择“其它”选项。

![Replacing one Linux with another from dual boot][10]

*在这里选择“其它”选项*

#### 步骤 3：准备分区操作

下图是分区界面。你会看到使用 Ext4 文件系统类型来安装 Linux。

![Identifying Linux partition in dual boot][11]

*确定 Linux 的安装位置*

在上图中，标记为 Linux Mint 19 的 Ext4 分区是 root 分区，大小为 82691 MB 的第二个 Ext4 分区是 home 分区。在这里我这里没有使用[交换空间][12]。

如果你只有一个 Ext4 分区，就意味着你的 home 目录与 root 目录位于同一分区。在这种情况下，你就无法保留 home 目录中的文件了，这个时候我建议将重要文件复制到外部磁盘，否则这些文件将不会保留。

然后是删除 root 分区。选择 root 分区，然后点击 `-` 号，这个操作释放了一些磁盘空间。

![Delete root partition of your existing Linux install][13]

*删除 root 分区*

磁盘空间释放出来后，点击 `+` 号。

![Create root partition for the new Linux][14]

*创建新的 root 分区*

现在已经在可用空间中创建一个新分区。如果你之前的 Linux 系统中只有一个 root 分区，就应该在这里创建 root 分区和 home 分区。如果需要，还可以创建交换分区。

如果你之前已经有 root 分区和 home 分区，那么只需要从已删除的 root 分区创建 root 分区就可以了。

![Create root partition for the new Linux][15]

*创建 root 分区*

你可能有疑问，为什么要经过“删除”和“添加”两个过程，而不使用“更改”选项。这是因为以前使用“更改”选项好像没有效果，所以我更喜欢用 `-` 和 `+`。这是迷信吗？也许是吧。

这里有一个重要的步骤，对新创建的 root 分区进行格式化。在没有更改分区大小的情况下，默认是不会对分区进行格式化的。如果分区没有被格式化，之后可能会出现问题。

![][16]

*格式化 root 分区很重要*

如果你在新的 Linux 系统上已经划分了单独的 home 分区，选中它并点击更改。

![Recreate home partition][17]

*修改已有的 home 分区*

然后指定将其作为 home 分区挂载即可。

![Specify the home mount point][18]

*指定 home 分区的挂载点*

如果你还有交换分区，可以重复与 home 分区相同的步骤，唯一不同的是要指定将空间用作交换空间。

现在的状态应该是有一个 root 分区（将被格式化）和一个 home 分区（如果需要，还可以使用交换分区）。点击“立即安装”可以开始安装。

![Verify partitions while replacing one Linux with another][19]

*检查分区情况*

接下来的几个界面就很熟悉了，要重点注意的是创建用户和密码的步骤。如果你之前有一个单独的 home 分区，并且还想使用相同的 home 目录，那你必须使用和之前相同的用户名和密码，至于设备名称则可以任意指定。

![To keep the home partition intact, use the previous user and password][20]

*要保持 home 分区不变，请使用之前的用户名和密码*

接下来只要静待安装完成，不需执行任何操作。

![Wait for installation to finish][21]

*等待安装完成*

安装完成后重新启动系统，你就能使用新的 Linux 发行版。

在以上的例子中，我可以在新的 Linux Mint 19 中使用原有的 Elementary OS 中的整个 home 目录，并且其中所有视频和图片都原封不动。岂不美哉？

--------------------------------------------------------------------------------

via: https://itsfoss.com/replace-linux-from-dual-boot/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/Replace-Linux-Distro-from-dual-boot.png
[2]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[3]: https://itsfoss.com/linux-mint-vs-ubuntu/
[4]: https://www.linuxmint.com/
[5]: https://itsfoss.com/uninstall-ubuntu-linux-windows-dual-boot/
[6]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[7]: https://www.ubuntu.com/
[8]: https://itsfoss.com/guide-install-elementary-os-luna/
[9]: https://etcher.io/
[10]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-1.jpg
[11]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-2.jpg
[12]: https://itsfoss.com/swap-size/
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-3.jpg
[14]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-4.jpg
[15]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-5.jpg
[16]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-6.jpg
[17]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-7.jpg
[18]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-8.jpg
[19]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-9.jpg
[20]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-10.jpg
[21]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-11.jpg

