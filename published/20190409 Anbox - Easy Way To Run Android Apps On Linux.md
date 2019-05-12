[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10843-1.html)
[#]: subject: (Anbox – Easy Way To Run Android Apps On Linux)
[#]: via: (https://www.2daygeek.com/anbox-best-android-emulator-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Anbox：在 Linux 上运行 Android 应用程序的简单方式
======

Android 模拟器允许我们直接从 Linux 系统上运行我们最喜欢的 Android 应用程序或游戏。对于 Linux 来说，有很多的这样的 Android 模拟器，在过去我们介绍过几个此类应用程序。

你可以通过导航到下面的网址回顾它们。

  * [如何在 Linux 上安装官方 Android 模拟器 (SDK)][1]
  * [如何在 Linux 上安装 GenyMotion (Android 模拟器)][2]

今天我们将讨论 Anbox Android 模拟器。

### Anbox 是什么？

Anbox 是 “Android in a box” 的缩写。Anbox 是一个基于容器的方法，可以在普通的 GNU/Linux 系统上启动完整的 Android 系统。

它是现代化的新模拟器之一。

Anbox 可以让你在 Linux 系统上运行 Android，而没有虚拟化的迟钝，因为核心的 Android 操作系统已经使用 Linux 命名空间（LXE）放置到容器中了。

Android 容器不能直接访问到任何硬件，所有硬件的访问都是通过在主机上的守护进程进行的。

每个应用程序将在一个单独窗口打开，就像其它本地系统应用程序一样，并且它可以显示在启动器中。

### 如何在 Linux 中安装 Anbox ？

Anbox 也可作为 snap 软件包安装，请确保你已经在你的系统上启用了 snap 支持。

Anbox 软件包最近被添加到 Ubuntu 18.10 (Cosmic) 和 Debian 10 (Buster) 软件仓库。如果你正在运行这些版本，那么你可以轻松地在官方发行版的软件包管理器的帮助下安装。否则可以用 snap 软件包安装。

为使 Anbox 工作，确保需要的内核模块已经安装在你的系统中。对于基于 Ubuntu 的用户，使用下面的 PPA 来安装它。

```
$ sudo add-apt-repository ppa:morphis/anbox-support
$ sudo apt update
$ sudo apt install linux-headers-generic anbox-modules-dkms
```

在你安装 `anbox-modules-dkms` 软件包后，你必须手动重新加载内核模块，或需要系统重新启动。

```
$ sudo modprobe ashmem_linux
$ sudo modprobe binder_linux
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4] 来安装 anbox。

```
$ sudo apt install anbox
```

对于基于 Arch Linux 的系统，我们总是习惯从 AUR 储存库中获取软件包。所以，使用任一个的 [AUR 助手][5] 来安装它。我喜欢使用 [Yay 工具][6]。

```
$ yuk -S anbox-git
```

否则，你可以通过导航到下面的文章来 [在 Linux 中安装和配置 snap][7]。如果你已经在你的系统上安装 snap，其它的步骤可以忽略。

```
$ sudo snap install --devmode --beta anbox
```

### Anbox 的必要条件

默认情况下，Anbox 并没有带有 Google Play Store。因此，我们需要手动下载每个应用程序（APK），并使用 Android 调试桥（ADB）安装它。

ADB 工具在大多数的发行版的软件仓库是轻易可获得的，我们可以容易地安装它。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4] 来安装 ADB。

```
$ sudo apt install android-tools-adb
```

对于 Fedora 系统，使用 [DNF 命令][8] 来安装 ADB。

```
$ sudo dnf install android-tools
```

对于基于 Arch Linux 的系统，使用 [Pacman 命令][9] 来安装 ADB。

```
$ sudo pacman -S android-tools
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][10] 来安装 ADB。

```
$ sudo zypper install android-tools
```

### 在哪里下载 Android 应用程序？

既然我们不能使用 Play Store ，你就得从信得过的网站来下载 APK 软件包，像 [APKMirror][11] ，然后手动安装它。

### 如何启动 Anbox?

Anbox 可以从 Dash 启动。这是默认的 Anbox 外貌。

![][13]

### 如何把应用程序推到 Anbox ？

像我先前所说，我们需要手动安装它。为测试目的，我们将安装 YouTube 和 Firefox 应用程序。

首先，你需要启动 ADB 服务。为做到这样，运行下面的命令。

```
$ adb devices
```

我们已经下载 YouTube 和 Firefox 应用程序，现在我们将安装。

语法格式：

```
$ adb install Name-Of-Your-Application.apk
```

安装 YouTube 和 Firefox 应用程序：

```
$ adb install 'com.google.android.youtube_14.13.54-1413542800_minAPI19(x86_64)(nodpi)_apkmirror.com.apk'
Success

$ adb install 'org.mozilla.focus_9.0-330191219_minAPI21(x86)(nodpi)_apkmirror.com.apk'
Success
```

我已经在我的 Anbox 中安装 YouTube 和 Firefox。查看下面的截图。

![][14]

像我们在文章的开始所说，它将以新的标签页打开任何的应用程序。在这里，我们将打开 Firefox ，并访问 [2daygeek.com][15] 网站。

![][16]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/anbox-best-android-emulator-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-sdk-android-emulator-on-linux/
[2]: https://www.2daygeek.com/install-genymotion-android-emulator-on-ubuntu-debian-fedora-arch-linux/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/category/aur-helper/
[6]: https://www.2daygeek.com/install-yay-yet-another-yogurt-aur-helper-on-arch-linux/
[7]: https://www.2daygeek.com/linux-snap-package-manager-ubuntu/
[8]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: https://www.apkmirror.com/
[12]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[13]: https://www.2daygeek.com/wp-content/uploads/2019/04/anbox-best-android-emulator-for-linux-1.jpg
[14]: https://www.2daygeek.com/wp-content/uploads/2019/04/anbox-best-android-emulator-for-linux-2.jpg
[15]: https://www.2daygeek.com/
[16]: https://www.2daygeek.com/wp-content/uploads/2019/04/anbox-best-android-emulator-for-linux-3.jpg
