通过扫描二维码将文件从计算机传输到移动设备
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-720x340.png)
将文件从计算机传输到智能手机并不是什么大问题。你可以使用 USB 线将手机挂载到系统上，然后从文件管理器传输文件。此外，某些第三方应用程序（例如 [**KDE Connect**][1] 和 [**AirDroid**] [2]）可帮助你轻松管理和传输系统中的文件至 Android 设备。今天，我偶然发现了一个名为 **“Qr-filetransfer”** 的超酷工具。它允许你通过扫描二维码通过 WiFi 将文件从计算机传输到移动设备而无须离开终端。是的，你没有看错！ qr-filetransfer 是一个使用 Go 语言编写的免费的开源命令行工具。在这个简短的教程中，我们将学习如何使用 qr-transfer 将文件从 Linux 传输到任何移动设备。

### 安装 Qr-filetransfer

首先，在你的系统上安装 Go 语言。

在 Arch Linux 及其衍生版上：
```
$ sudo pacman -S go

```

在基于 RPM 的系统（如 RHEL、CentOS、Fedora）上运行：
```
$ sudo yum install golang

```

或者：
```
$ sudo dnf install golang

```

在基于 DEB 的系统上，例如 Debian、Ubuntu、Linux Mint，你可以使用命令安装它：
```
$ sudo apt-get install golang

```

在 SUSE/openSUSE 上：
```
$ sudo zypper install golang

```

安装 Go 语言后，运行以下命令下载 qr-filetransfer 应用。
```
$ go get github.com/claudiodangelis/qr-filetransfer

```

上述命令将在当前工作目录下的一个名为 **“go”** 的目录中下载 qr-filetrnasfer GitHub 仓库的内容。

将 qt-filetransfer 的二进制文件复制到 PATH 中，例如 /usr/local/bin/。
```
$ sudo cp go/bin/qr-filetransfer /usr/local/bin/

```

最后，如下使其可执行：
```
$ sudo chmod +x /usr/local/bin/qr-filetransfer

```

### 通过扫描二维码将文件从计算机传输到移动设备

确保你的智能手机已连接到与计算机相同的 WiFi 网络。

然后，使用要传输的文件的完整路径启动 qt-filetransfer。

比如，我要传输一个 mp3 文件。
```
$ qr-filetransfer Chill\ Study\ Beats.mp3

```

首次启动时，qr-filetransfer 会要求你选择使用的网络接口，如下所示。
```
Choose the network interface to use (type the number):
[0] enp5s0
[1] wlp9s0

```

我打算使用 **wlp9s0** 接口传输文件，因此我输入 “1”。qr-filetransfer 会记住这个选择，除非你通过 **-force** 参数或删除程序存储在当前用户的家目录中的 **.qr-filetransfer.json** 文件，否则永远不会再提示你。

然后，你将看到二维码，如下图所示。

![][4]

打开二维码应用（如果它尚未安装，请从 Play 商店安装任何一个二维码读取程序）并扫描终端中显示的二维码。

读取二维码后，系统会询问你是要复制链接还是打开链接。你可以复制链接并手动将其粘贴到移动网络浏览器上，或者选择“打开链接”以在移动浏览器中自动打开它。

![][5]

共享链接打开后，该文件将下载到智能手机中。

![][6]

如果文件太大，请压缩文件，然后传输它
```
$ qr-filetransfer -zip /path/to/file.txt

```

要传输整个目录，请运行：
```
$ qr-filetransfer /path/to/directory

```

请注意，目录在传输之前会被压缩。

qr-filetransfer 只能将系统中的内容传输到移动设备，反之不能。这个项目非常新，所以会有 bug。如果你遇到了任何 bug，请在本指南最后给出的 GitHub 页面上报告。

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/transfer-files-from-computer-to-mobile-devices-by-scanning-qr-codes/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/kde-connect-access-files-notifications-android-devices/
[2]:https://www.ostechnix.com/airdroid-share-files-and-folders-between-linux-and-android/
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-5.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-6-4.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-4.png
