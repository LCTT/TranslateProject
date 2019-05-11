[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Anbox – Easy Way To Run Android Apps On Linux)
[#]: via: (https://www.2daygeek.com/anbox-best-android-emulator-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Anbox – 简单的方法来在 Linux 上运行 Android 应用程序
======

Android 模拟器应用程序允许我们直接从 Linux 系统上运行我们最喜欢的 Android 应用程序或游戏。

对于 Linux 来说，有很多的 android 模拟器是可用的，在过去我们很少涉及应用程序。

你可以通过导航到下面的网址回顾它们。

  * [如何在 Linux 上安装官方 Android 模拟器 (SDK)][1]
  * [如何在 Linux 上安装 GenyMotion (Android 模拟器)][2]



今天我们将讨论 Anbox Android 模拟器。

### Anbox 是什么？

Anbox 支持 Android 在一个盒子中。Anbox 是一个基于容器的在一个普通的 GNU/Linux 系统上启动一个完整的 Android 系统的方法。

它是新的和现代模拟器的其中一个。

由于 Anbox 使用同样的 Linux 命名空间 (LXE) 来放置核心 Android 操作系统到一个容器中，当访问安装的应用程序时，没有迟钝。

Anbox 将让你在你的 Linux 系统上运行 Android ，而没有虚拟化的迟钝，因为 Android 核心操作系统已经放置到一个使用 Linux 命名空间(LXE)的容器中。

没有直接访问到来自 Android 容器的任何硬件。所有硬件的访问通过在主机上的守护进程。

每个应用程序将在一个单独窗口打开，正像其它本地系统应用程序，并且它可以显示在启动器中。

### 如何在 Linux 中安装 Anbox ？

Anbox 应用程序也可以作为 snap 软件包，确保你已经在你的系统上启用 snap 支持。

Anbox 软件包最近被添加到 Ubuntu 18.10 (Cosmic) 和 Debian 10 (Buster) 存储库。如果你正在运行这些版本，那么你可以轻松地在官方分发软件包管理器的帮助下安装。其它明智的方法与 snap 软件包一起安装。

为使 Anbox 工作，确保需要的内核模块已经安装在你的系统中。对于基于 Ubuntu 的用户，使用下面的 PPA 来安装它。

```
$ sudo add-apt-repository ppa:morphis/anbox-support
$ sudo apt update
$ sudo apt install linux-headers-generic anbox-modules-dkms
```

在你安装 `anbox-modules-dkms` 软件包后，你必须重新加载内核模块，或需要系统重新启动。

```
$ sudo modprobe ashmem_linux
$ sudo modprobe binder_linux
```

对于 **`Debian/Ubuntu`** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 来安装 anbox。

```
$ sudo apt install anbox
```

对于基于 Arch Linux 的系统，我们总是习惯从 AUR 储存库中获取软件包。所以，使用任一个的 **[AUR helper][5]** 来安装它。我较喜欢去使用 **[Yay utility][6]**.

```
$ yuk -S anbox-git
```

如果不是，你可以通过导航到下面的文章来 **[在 Linux 中安装和配置 snaps ][7]** 。如果你已经在你的系统上安装 snaps ，其它的可以忽略。

```
$ sudo snap install --devmode --beta anbox
```

### Anbox 的必要条件

默认情况下，Anbox 不与 Google Play Store 一起提供。

因此，我们需要手动下载每个应用程序 (APK) ，并使用 Android 调试桥 (ADB) 安装它。

ADB 工具在大多数的发行版存储库是轻易可获得的，我们可以容易地安装它。

对于 **`Debian/Ubuntu`** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 来安装 ADB 。

```
$ sudo apt install android-tools-adb
```

对于 **`Fedora`** 系统，使用 **[DNF 命令][8]** 来安装 ADB 。

```
$ sudo dnf install android-tools
```

对于基于 **`Arch Linux`** 的系统，使用 **[Pacman 命令][9]** 来安装 ADB 。

```
$ sudo pacman -S android-tools
```

对于 **`openSUSE Leap`** 系统，使用 **[Zypper 命令][10]** 来安装 ADB.

```
$ sudo zypper install android-tools
```

### 在哪里下载 Android 应用程序？

既然我们不能使用 Play Store ，你不得不从信得过的网站来下载 APK 软件包，像 [APKMirror][11] ，然后手动安装它。

### 如何启动 Anbox?

Anbox 可以从 Dash 启动。这多少是默认的 Anbox 外貌。
![][13]

### 如何推移应用程序到 Anbox ？

像我先前所说，我们需要手动安装它。为测试目的，我们将安装 `YouTube` 和 `Firefox` 应用程序。

首先，你需要启动 ADB 服务。为做到这样，运行下面的命令。

```
$ adb devices
```

我们已经下载 `YouTube` 和 `Firefox` 应用程序，现在我们将安装。

**共同的语法：**

```
$ adb install Name-Of-Your-Application.apk
```

安装 YouTube 和 Firefox 应用程序。

```
$ adb install 'com.google.android.youtube_14.13.54-1413542800_minAPI19(x86_64)(nodpi)_apkmirror.com.apk'
Success

$ adb install 'org.mozilla.focus_9.0-330191219_minAPI21(x86)(nodpi)_apkmirror.com.apk'
Success
```

我已经在我的 Anbox 中安装 `YouTube` 和 `Firefox`。查看下面的截图。
![][14]

像我们在文章的开始所说，它将以新的标签页打开任何的应用程序。在这里，我们将打开 Firefox ，并访问 **[2daygeek.com][15]** 网站。
![][16]

--------------------------------------------------------------------------------

通过: https://www.2daygeek.com/anbox-best-android-emulator-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

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
