[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11711-1.html)
[#]: subject: (Install Android 8.1 Oreo on Linux To Run Apps & Games)
[#]: via: (https://fosspost.org/tutorials/install-android-8-1-oreo-on-linux)
[#]: author: (Python Programmer;Open Source Software Enthusiast. Worked On Developing A Lot Of Free Software. The Founder Of Foss Post;Foss Project. Computer Science Major. )

在 Linux 上安装安卓 8.1 Oreo 来运行应用程序和游戏
======

![](https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/android-8.1-oreo-x86-on-linux.png?resize=1237%2C527&ssl=1)

[android x86][1] 是一个自由而开源的项目，将谷歌制作的安卓系统从 ARM 架构移植到了 x86 架构，可以让用户在他们的桌面电脑上运行安卓系统来享受所有的安卓功能和应用程序及游戏。

在前一段时间，android x86 项目完成了安卓 8.1 Oreo 系统的 x86 架构移植。在这篇文章中，我们将解释如何在你的 Linux 系统上安装它，以便你能够随时使用你的安卓 用程序和游戏。

### 在 Linux 上安装安卓 x86 8.1 Oreo

#### 准备环境

首先，让我们下载 android x86 8.1 Oreo 系统镜像。你可以从[这个页面][2]下载它，只需单击 “android-x86_64-8.1-r1.iso” 文件下的 “View” 按钮。

我们将在我们的 Linux 系统上使用 QEMU 来运行 android x86。QEMU 是一个非常好的模拟器软件，它也是自由而开源的，并且在所有主要的 Linux 发行版存储库中都是可用的。

在 Ubuntu/Linux Mint/Debian 上安装 QEMU：

```
sudo apt-get install qemu qemu-kvm libvirt-bin
```

在 Fedora 上安装 QEMU：

```
sudo dnf install qemu qemu-kvm
```

对于其它发行版，只需要搜索 “qemu” 和 “qemu-kvm” 软件包，并安装它们。

在你安装 QEMU 后，我们将需要运行下面的命令来创建 `android.img` 文件，它就像某种分配给安卓系统的磁盘空间。所有安卓文件和系统都将位于该镜像文件中：

```
qemu-img create -f qcow2 android.img 15G
```

我们在这里的意思是，我们想为该安卓系统分配一个最大 15GB 的磁盘空间，但是，你可以更改它到你想要的任意大小（确保它至少大于 5GB）。

现在，首次启动运行该安卓系统，运行：

```
sudo qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda android.img -cdrom /home/mhsabbagh/android-x86_64-8.1-r1.iso
```

将 `/home/mhsabbagh/android-x86_64-8.1-r1.iso` 替换为你从 android x86 网站下载的文件的路径。关于我们在这里正在使用的其它选项的解释，你可以参考[这篇文章][3]。

在你运行上面的命令后，该安卓系统将启动：

![][4]

#### 安装系统

从这个窗口中，选择 “Advanced options”, 它将引导到下面的菜单，你应如下在其中选择 “Auto_installation” ：

![][5]

在这以后，安装器将告知你是否想要继续，选择 “Yes”：

![][6]

接下来，安装器将无需你的指示而继续进行：

![][7]

最后，你将收到这个信息，它表示你已经成功安装安卓 8.1 ：

![][8]

现在，关闭 QEMU 窗口即可。

#### 启动和使用 安卓 8.1 Oreo

现在，安卓系统已经完全安装在你的 `android.img` 文件中，你应该使用下面的 QEMU 命令来启动它，而不是前面的命令：

```
sudo qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda android.img
```

注意，我们所做的只是移除 `-cdrom` 选项及其参数。这是告诉 QEMU，我们不再想从我们下载的 ISO 文件启动，相反，从这个安装的安卓系统启动。

你现在能够看到安卓的启动菜单：

![][9]

然后，你将进入第一个准备向导，选择你的语言并继续：

![][10]

从这里，选择 “Set up as new” 选项：

![][11]

然后，安卓将询问你是否想登录到你当前的谷歌账号。这步骤是可选的，但是这很重要，以便你随后可以使用谷歌 Play 商店：

![][12]

然后，你将需要接受条款：

![][13]

现在，你可以选择你当前的时区：

![][14]

系统将询问你是否想启动一些数据收集功能。如果我是你的话，我将简单地全部关闭它们，像这样：

![][15]

最后，你将有两种启动类型可供选择，我建议你选择 Launcher3 选项，并使其成为默认项：

![][16]

然后，你将看到完整工作的安卓系统主屏幕：

![][17]

从现在起，你可以做你想做的任何事情；你可以使用内置的安卓应用程序，或者你可以浏览你的系统设置来根据你的喜好进行调整。你可以更改你的系统的外观和体验，或者你可以像示例一样运行 Chrome ：

![][18]

你可以开始从谷歌 Play 商店安装一些应用程序程序，像 WhatsApp 和其它的应用程序，以供你自己使用：

![][19]

你现在可以用你的系统做任何你想做的事。恭喜！

### 以后如何轻松地运行安卓 8.1 Oreo

我们不想总是不得不打开终端窗口，并写那些长长的 QEMU 命令来运行安卓系统，相反，我们想在我们需要时一次单击就运行它。

为此，我们将使用下面的命令在 `/usr/share/applications` 下创建一个名为 `android.desktop` 的新文件：

```
sudo nano /usr/share/applications/android.desktop
```

并在其中粘贴下面的内容（右键单击然后粘贴）：

```
[Desktop Entry]
Name=Android 8.1
Comment=Run Android 8.1 Oreo on Linux using QEMU
Icon=phone
Exec=bash -c 'pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda /home/mhsabbagh/android.img'
Terminal=false
Type=Application
StartupNotify=true
Categories=GTK;
```

再强调一次，你必需使用你系统上的本地镜像路径来替换 `/home/mhsabbagh/android.img` 。然后保存文件（`Ctrl+X`，然后按 `Y`，然后按回车）。

注意，我们需要使用 `pkexec` 来使用 root 权限运行 QEMU ，因为从较新的版本开始，普通用户不允许通过 libvirt 访问 KVM 技术；这就是为什么它将每次要求你输入 root 密码的原因。

现在，你将在应用程序菜单中看到安卓图标，你可以在你想使用安卓的任何时间来简单地单击该图标，QEMU 程序将启动：

![][20]

### 总结

我们向你展示如何在你的 Linux 系统上安装和运行安卓 8.1 Oreo 。从现在起，在没有其它一些软件的（像 Blutsticks 和类似的方法）的情况下，你可以更容易地完成基于安卓的任务。在这里，你有一个完整工作和功能的安卓系统，你可以随心所欲地操作它，如果一些东西出错，你可以简单地干掉该镜像文件，然后随时再一次重新运行安装程序。

你之前尝试过 android x86 吗？你的体验如何？

--------------------------------------------------------------------------------

via: https://fosspost.org/tutorials/install-android-8-1-oreo-on-linux

作者：[M.Hanny Sabbagh][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/mhsabbagh
[b]: https://github.com/lujun9972
[1]: http://www.android-x86.org/
[2]: http://www.android-x86.org/download
[3]: https://fosspost.org/tutorials/use-qemu-test-operating-systems-distributions
[4]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-16.png?resize=694%2C548&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 40 android 8.1 oreo on linux)
[5]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-15.png?resize=673%2C537&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 42 android 8.1 oreo on linux)
[6]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-14.png?resize=769%2C469&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 44 android 8.1 oreo on linux)
[7]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-13.png?resize=767%2C466&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 46 android 8.1 oreo on linux)
[8]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-12.png?resize=750%2C460&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 48 android 8.1 oreo on linux)
[9]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-11.png?resize=754%2C456&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 50 android 8.1 oreo on linux)
[10]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-10.png?resize=850%2C559&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 52 android 8.1 oreo on linux)
[11]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-09.png?resize=850%2C569&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 54 android 8.1 oreo on linux)
[12]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-08.png?resize=850%2C562&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 56 android 8.1 oreo on linux)
[13]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-07-1.png?resize=850%2C561&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 58 android 8.1 oreo on linux)
[14]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-06.png?resize=850%2C569&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 60 android 8.1 oreo on linux)
[15]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-05.png?resize=850%2C559&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 62 android 8.1 oreo on linux)
[16]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-04.png?resize=850%2C553&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 64 android 8.1 oreo on linux)
[17]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-03.png?resize=850%2C571&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 66 android 8.1 oreo on linux)
[18]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-02.png?resize=850%2C555&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 68 android 8.1 oreo on linux)
[19]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-01.png?resize=850%2C557&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 70 android 8.1 oreo on linux)
[20]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Screenshot-at-2019-02-17-1539.png?resize=850%2C557&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 72 android 8.1 oreo on linux)
