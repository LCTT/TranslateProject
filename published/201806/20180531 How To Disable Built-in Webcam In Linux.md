如何在 Linux 中禁用内置摄像头
======

![](https://www.ostechnix.com/wp-content/uploads/2015/08/webcam-2-720x340.jpg)

今天，我们将看到如何禁用未使用的内置网络摄像头或外置摄像头，以及如何在 Linux 中需要时启用它。禁用网络摄像头可以在很多方面为你提供帮助。你可以防止恶意软件控制你的集成摄像头，并监视你和你的家庭。我们已经阅读过无数的故事，一些黑客可以在你不知情的情况下使用你的摄像头监视你。通过黑客攻击你的网络摄像头，用户可以在线共享你的私人照片和视频。可能有很多原因。如果你想知道如何禁用笔记本电脑或台式机中的网络摄像头，那么你很幸运。这个简短的教程将告诉你如何做。请继续阅读。

我在 Arch Linux 和 Ubuntu 上测试了这个指南。它的工作原理如下所述。我希望这也可以用在其他 Linux 发行版上。

### 在 Linux 中禁用内置摄像头

首先，使用如下命令找到网络摄像头驱动：

```
$ sudo lsmod | grep uvcvideo
```

示例输出：

```
uvcvideo 114688 1
videobuf2_vmalloc 16384 1 uvcvideo
videobuf2_v4l2 28672 1 uvcvideo
videobuf2_common 53248 2 uvcvideo,videobuf2_v4l2
videodev 208896 4 uvcvideo,videobuf2_common,videobuf2_v4l2
media 45056 2 uvcvideo,videodev
usbcore 286720 9 uvcvideo,usbhid,usb_storage,ehci_hcd,ath3k,btusb,uas,ums_realtek,ehci_pci
```

这里，**uvcvideo** 是我的网络摄像头驱动。

现在，让我们禁用网络摄像头。

为此，请编辑以下文件（如果文件不存在，只需创建它）：

```
$ sudo nano /etc/modprobe.d/blacklist.conf
```

添加以下行：

```
##Disable webcam.
blacklist uvcvideo
```

`##Disable webcam` 这行不是必需的。为了便于理解，我添加了它。

保存并退出文件。重启系统以使更改生效。

要验证网络摄像头是否真的被禁用，请打开任何即时通讯程序或网络摄像头软件，如 Cheese 或 Guvcview。你会看到如下的空白屏幕。

Cheese 输出：

![][2]

Guvcview 输出：

![][3]

看见了么？网络摄像头被禁用而无法使用。

要启用它，请编辑：

```
$ sudo nano /etc/modprobe.d/blacklist.conf
```

注释掉你之前添加的行。

```
##Disable webcam.
#blacklist uvcvideo
```

保存并关闭文件。然后，重启计算机以启用网络摄像头。

这样够了吗？不。为什么？如果有人可以远程访问你的系统，他们可以轻松启用网络摄像头。所以，在不使用时用胶带覆盖它或者拔掉相机或者在 BIOS 中禁用它是一个不错的主意。此方法不仅用于禁用内置摄像头，还用于外部网络摄像头。

就是这些了。希望对你有用。还有更好的东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-disable-built-in-webcam-in-ubuntu/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2015/08/cheese.jpg
[3]:http://www.ostechnix.com/wp-content/uploads/2015/08/guvcview.jpg
