[#]: subject: (Top Android Emulators to Run and Test Android Apps on Linux)
[#]: via: (https://itsfoss.com/android-emulators-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13629-1.html)

Linux 上的顶级安卓模拟器
======

![](https://img.linux.net.cn/data/attachment/album/202107/29/111502vg5knofnpjc2jp5c.jpg)

安卓系统是建立在高度定制的 Linux 内核之上的。因此，使用安卓模拟器在 Linux 上运行移动应用是有意义的。

虽然这不是在 Linux 机器上你可以做的新鲜事，但在 Windows 于 2021 年推出运行安卓应用的能力后，它是一个更需要的功能。

不仅仅限于使用应用，一些安卓模拟器也可以在开发和测试中派上用场。

因此，我总结了一份最好的模拟器清单，你可以用它来测试或在 Linux 上运行安卓应用/游戏。

### 1、Anbox

![视频](https://youtu.be/MbmiHnasGWg)

Anbox 是一个相当流行的模拟器，可以让 Linux 用户运行 Android 应用。可能深度 Linux 正是利用它使得开箱即可运行安卓应用。

它使用一个容器将安卓操作系统与主机隔离，这也让它们可以使用最新的安卓版本。

运行的安卓应用不能直接访问你的硬件，这是一个很好的安全决定。

与这里的其他一些选择不同，Anbox 在技术上不需要仿真层来使安卓系统工作。换句话说，它在你的 Linux 系统上最接近于原生的安卓体验。

由于这个原因，它可能不是最简单的选择。你不能只使用谷歌应用商店来安装应用，你需要使用安卓调试桥（ADB）。你只需要一个应用的 APK 文件就可以安装和使用它。

- [Anbox][1]

### 2、Genymotion

![][2]

Genymotion 是一个为测试和开发量身定做的令人印象深刻的解决方案。

它不是一个自由开源的选择。它们通过云端或独立于 Android Studio 的桌面客户端，提供虚拟的安卓体验作为服务。

你可以模拟各种硬件配置和安卓版本，创建一个虚拟设备进行测试。它还让你有能力扩大规模，并有多个安卓虚拟设备运行，进行广泛的测试。

它可以帮助你测试文件上传在你的应用中如何工作，电池影响、性能、内存等等。

虽然它是一个主要针对专业人士的高级解决方案，但它确实支持最新的 Linux 发行版，包括 Ubuntu 20.04 LTS。

- [Genymotion][3]

### 3、Android-x86

![][4]

Android x86 是一个开源项目，使得安卓可以在 PC 上运行，并支持 32 位。

你可以选择在你的 Linux 系统上使用虚拟机管理器来安装它，或者直接在你的 PC 上试用它。

如果你需要安装，可以查看官方的 [安装说明][5]。

与其他一些选择不同，它是一个简单的试图在 PC 上工作的模拟器，没有花哨的功能。

- [Android x86][6]

### 4、Android Studio （虚拟设备）

![][7]

Android Studio 是一个用于开发和测试的完整工具。幸运的是，由于对 Linux 的支持，如果你需要的话，你可以用它来模拟安卓的体验进行实验。

你只需要创建一个安卓虚拟设备（AVD），你可以对其进行配置，然后作为模拟器进行模拟。

也有很大的机会能找到对一些最新的智能手机、电视和智能手表的支持。

它需要一定的学习曲线才能上手，但它是免费的，而且是完全开源的。

- [Android Studio][8]

### 5、ARChon

![][9]

一个有趣的解决方案，这是一个你可以在 Linux 和任何其他平台上使用的安卓模拟器。

它有助于在 Chrome OS 上运行安卓应用，或者在任何操作系统上使用 Chrome 浏览器。与其他一些不同的是，你可能不会得到完整的安卓体验，而只是能够运行安卓应用。

你只需解压运行时，并将其加载到 Chrome 扩展中。接下来，下载 APK 文件到上面来添加你想使用的应用。

- [ARChon][10]

### 6、Bliss OS

![][11]

Bliss OS 是另一个开源项目，与 Android x86 类似，旨在使安卓在 PC 上运行。

与 Android x86 不同的是，它通过支持 32 位和 64 位架构提供了更多的兼容性选择。此外，你可以根据你的处理器下载兼容文件。

它有积极的维护，支持市场上最新的安卓版本。

- [Bliss OS][12]

### 总结

虽然你会能找到几个可用于 Linux 的安卓模拟器，但它们可能无法取代全面的智能手机体验。

每个模拟器都有一系列的功能和特定目的。请选择你需要的那个！

你试过安卓模拟器么？你在 Linux 中使用的最喜欢的模拟器是什么？欢迎在下面的评论中让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/android-emulators-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://anbox.io
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/genymotion-android-emulator.png?resize=800%2C508&ssl=1
[3]: https://www.genymotion.com
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/android-x86-emulator.jpg?resize=1920%2C1080&ssl=1
[5]: https://www.android-x86.org/installhowto.html
[6]: https://www.android-x86.org
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/android-virtual-devices-studio.png?resize=800%2C296&ssl=1
[8]: https://developer.android.com/studio
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/arcrhon.jpg?resize=800%2C426&ssl=1
[10]: https://archon-runtime.github.io
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/bliss-os-android.png?resize=800%2C576&ssl=1
[12]: https://blissos.org
