[#]: subject: "How to Access Android Devices Internal Storage and SD Card in Ubuntu, Linux Mint using Media Transfer Protocol (MTP)"
[#]: via: "https://www.debugpoint.com/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何使用媒体传输协议 (MTP) 在 Ubuntu、Linux Mint 中访问 Android 设备的内部存储和 SD 卡
======
**本教程将展示如何在 Ubuntu 中使用 MTP 访问 android 设备以及如何访问 SD 卡内容。**

MTP，即[媒体传输协议][1]，是图片传输协议的扩展，它在 Android marshmallow 版本中实现。 marshmallow 更新后，你无法将 android 设备用作典型的大容量存储设备，这可以让你直接插入并在文件管理器（例如 Thunar 或 GNOME Files）中查看内部存储内容和 SD 卡内容。这是由于操作系统无法确定 MTP 设备，而且还没有实现支持的设备列表。

### 在 Ubuntu、Linux Mint 中访问 Android 设备的步骤

* 使用以下命令为启用 MTP 的设备 [mtpfs][3] 安装 [libmtp][2]、FUSE 文件系统。

```
sudo apt install go-mtpfs
sudo apt install libmtp
sudo apt install mtpfs mtp-tools
```

* 使用以下命令在 `/media` 中创建一个目录并更改写入权限。

```
sudo mkdir /media/MTPdevice
sudo chmod 775 /media/MTPdevice
sudo mtpfs -o allow_other /media/MTPdevice
```

* 在 Ubuntu 中使用 USB 线缆插入你的 Android 设备。
* 在你的 Android 设备上，在主屏幕下拉，然后单击 “Touch for more options”。
* 在下面的菜单中，选择“Transfer File (MTP)”选项。

![MTP Option1][4]

![MTP Option2][5]

* 在终端中运行以下命令查找设备 ID 等。你可以在设备的命令输出中看到 VID 和 PID。记下这两个数字（在下图中高亮显示）。

```
mtp-detect
```

![mtp-detect Command Output][6]

* 使用以下命令使用文本编辑器打开 android 规则文件。

```
sudo gedit /etc/udev/rules.d/51-android.rules
```

* 如果你使用的是未安装 gedit 的最新 Ubuntu，请使用以下命令。

```
sudo gnome-text-editor /etc/udev/rules.d/51-android.rules
```

* 在 `51-android.rules` 文件中使用你设备的 VID 和 PID 输入以下行（你在上面的步骤中记下）。
* 保存并关闭文件。

```
SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", ATTR{idProduct}=="2e82", MODE="0666"
```

* 运行以下命令通过 [systemd][7] 重启设备管理器。

```
sudo service udev restart
```

### 访问内容的后续步骤

* 接下来的步骤主要需要访问你的 Android 设备的外部 SD 卡的内容。
* 我必须这样做，因为文件管理器没有显示 SD 卡的内容。不过，这不是一个解决方案，但它是一种临时方案，根据这个 [Google 论坛帖子][8]，它适用于大多数用户，并且适用于我的带有闪迪 SD 卡的摩托罗拉 G 2nd Gen。 
    * 在 Ubuntu 中安全删除你连接的设备。
    * 关闭设备。从设备中取出 SD 卡。
    * 在没有 SD 卡的情况下打开设备。
    * 再次关闭设备。
    * 将 SD 卡重新插入并再次打开设备。
* 重启你的 Ubuntu 机器并插入你的安卓设备。
* 现在你可以看到你的安卓设备的内部存储和 SD 卡的内容。

![MTP Device Contents in Ubuntu][9]

### 总结

上述在 Ubuntu 中访问安卓设备内容的教程在旧版和新版 Ubuntu 中的安卓设备（三星、一加和摩托罗拉）上都可以使用。如果你在访问内容时遇到困难，可以试试这些步骤，它可能会起作用。在我看来，MTP 与老式的即插即用方案相比非常慢。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://en.wikipedia.org/wiki/Media_Transfer_Protocol
[2]: https://sourceforge.net/projects/libmtp/
[3]: https://launchpad.net/ubuntu/+source/mtpfs
[4]: https://www.debugpoint.com/wp-content/uploads/2016/03/MTP-Option1.png
[5]: https://www.debugpoint.com/wp-content/uploads/2016/03/MTP-Option2.png
[6]: https://www.debugpoint.com/wp-content/uploads/2016/03/mtp-detect.png
[7]: https://www.debugpoint.com/systemd-systemctl-service/
[8]: https://productforums.google.com/forum/#!topic/nexus/11d21gbWyQo;context-place=topicsearchin/nexus/category$3Aconnecting-to-networks-and-devices%7Csort:relevance%7Cspell:false
[9]: https://www.debugpoint.com/wp-content/uploads/2016/03/MTP-Device-Contents-in-Ubuntu.png
