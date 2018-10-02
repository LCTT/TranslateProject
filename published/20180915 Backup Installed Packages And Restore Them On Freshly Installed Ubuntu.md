备份安装的包并在全新安装的 Ubuntu 上恢复它们
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/apt-clone-720x340.png)

在多个 Ubuntu 系统上安装同一组软件包是一项耗时且无聊的任务。你不会想花时间在多个系统上反复安装相同的软件包。在类似架构的 Ubuntu 系统上安装软件包时，有许多方法可以使这项任务更容易。你可以方便地通过 [Aptik][1] 并点击几次鼠标将以前的 Ubuntu 系统的应用程序、设置和数据迁移到新安装的系统中。或者，你可以使用软件包管理器（例如 APT）获取[备份的已安装软件包的完整列表][2]，然后在新安装的系统上安装它们。今天，我了解到还有另一个专用工具可以完成这项工作。来看一下 `apt-clone`，这是一个简单的工具，可以让你为 Debian/Ubuntu 系统创建一个已安装的软件包列表，这些软件包可以在新安装的系统或容器上或目录中恢复。

`apt-clone` 会帮助你处理你想要的情况，

* 在运行类似 Ubuntu（及衍生版）的多个系统上安装一致的应用程序。
* 经常在多个系统上安装相同的软件包。
* 备份已安装的应用程序的完整列表，并在需要时随时随地恢复它们。

在本简要指南中，我们将讨论如何在基于 Debian 的系统上安装和使用 `apt-clone`。我在 Ubuntu 18.04 LTS 上测试了这个程序，但它应该适用于所有基于 Debian 和 Ubuntu 的系统。

### 备份已安装的软件包并在新安装的 Ubuntu 上恢复它们

`apt-clone` 在默认仓库中有。要安装它，只需在终端输入以下命令：

```
$ sudo apt install apt-clone
```

安装后，只需创建已安装软件包的列表，并将其保存在你选择的任何位置。

```
$ mkdir ~/mypackages
$ sudo apt-clone clone ~/mypackages
```

上面的命令将我的 Ubuntu 中所有已安装的软件包保存在 `~/mypackages` 目录下名为 `apt-clone-state-ubuntuserver.tar.gz` 的文件中。

要查看备份文件的详细信息，请运行：

```
$ apt-clone info mypackages/apt-clone-state-ubuntuserver.tar.gz
Hostname: ubuntuserver
Arch: amd64
Distro: bionic
Meta:
Installed: 516 pkgs (33 automatic)
Date: Sat Sep 15 10:23:05 2018
```

如你所见，我的 Ubuntu 服务器总共有 516 个包。

现在，将此文件复制到 USB 或外部驱动器上，并转至要安装同一套软件包的任何其他系统。或者，你也可以将备份文件传输到网络上的系统，并使用以下命令安装软件包：

```
$ sudo apt-clone restore apt-clone-state-ubuntuserver.tar.gz
```

请注意，此命令将覆盖你现有的 `/etc/apt/sources.list` 并将安装/删除软件包。警告过你了！此外，只需确保目标系统是相同的 CPU 架构和操作系统。例如，如果源系统是 18.04 LTS 64 位，那么目标系统必须也是相同的。

如果你不想在系统上恢复软件包，可以使用 `--destination /some/location` 选项将克隆复制到这个文件夹中。

```
$ sudo apt-clone restore apt-clone-state-ubuntuserver.tar.gz --destination ~/oldubuntu
```

在此例中，上面的命令将软件包恢复到 `~/oldubuntu` 中。

有关详细信息，请参阅帮助部分：

```
$ apt-clone -h
```

或者手册页：

```
$ man apt-clone
```

建议阅读：

+ [Systemback - 将 Ubuntu 桌面版和服务器版恢复到以前的状态][3]
+ [Cronopete - Linux 下的苹果时间机器][4]

就是这些了。希望这个有用。还有更多好东西。敬请期待!

干杯!




--------------------------------------------------------------------------------

via: https://www.ostechnix.com/backup-installed-packages-and-restore-them-on-freshly-installed-ubuntu-system/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/how-to-migrate-system-settings-and-data-from-an-old-system-to-a-newly-installed-ubuntu-system/
[2]: https://www.ostechnix.com/create-list-installed-packages-install-later-list-centos-ubuntu/#comment-12598

[3]: https://www.ostechnix.com/systemback-restore-ubuntu-desktop-and-server-to-previous-state/

[4]: https://www.ostechnix.com/cronopete-apples-time-machine-clone-linux/
