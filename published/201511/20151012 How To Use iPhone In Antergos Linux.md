如何在 Antergos Linux 中使用 iPhone
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-Antergos-Arch-Linux.jpg)

在Arch Linux中使用iPhone遇到麻烦了么？iPhone和Linux从来都没有很好地集成。本教程中，我会向你展示如何在Antergos Linux中使用iPhone，对于同样基于Arch的的Linux发行版如Manjaro也应该同样管用。

我最近购买了一台全新的iPhone 6S，当我连接到Antergos Linux中要拷贝一些照片时，它完全没有检测到它。我看见iPhone正在被充电并且我已经允许了iPhone“信任这台电脑”，但是还是完全没有检测到。我尝试运行`dmseg`但是没有关于iPhone或者Apple的信息。有趣的是我当我安装好了[libimobiledevice][1]，这个就可以解决[iPhone在Ubuntu中的挂载问题][2]。

我会向你展示如何在Antergos中使用运行iOS 9的iPhone 6S。这会有更多的命令行，但是我假设你用的是ArchLinux，并不惧怕使用终端（也不应该惧怕）。

### 在Arch Linux中挂载iPhone ###

**第一步**：如果已经插入，请拔下你的iPhone。

**第二步**：现在，打开终端输入下面的命令来安装必要的包。如果它们已经安装过了也没有关系。

    sudo pacman -Sy ifuse usbmuxd libplist libimobiledevice

**第三步**： 这些库和程序安装完成后，重启系统。

    sudo reboot

**第四步**：创建一个iPhone的挂载目录，我建议在家目录中创建一个iPhone目录。

    mkdir ~/iPhone

**第五步**：解锁你的手机并插入，如果询问是否信任该计算机，请允许信任。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-mount-Antergos-Linux-2.jpeg)

**第六步**： 看看这时iPhone是否已经被机器识别了。

    dmesg | grep -i iphone

这时就该显示iPhone和Apple的结果了。就像这样：

    [ 31.003392] ipheth 2-1:4.2: Apple iPhone USB Ethernet device attached
    [ 40.950883] ipheth 2-1:4.2: Apple iPhone USB Ethernet now disconnected
    [ 47.471897] ipheth 2-1:4.2: Apple iPhone USB Ethernet device attached
    [ 82.967116] ipheth 2-1:4.2: Apple iPhone USB Ethernet now disconnected
    [ 106.735932] ipheth 2-1:4.2: Apple iPhone USB Ethernet device attached

这意味着这时iPhone已经被Antergos/Arch成功地识别了。

**第七步**: 设置完成后是时候挂载iPhone了，使用下面的命令：

    ifuse ~/iPhone

由于我们在家目录中创建了挂载目录，你不需要root权限就可以在家目录中看见。如果命令成功了，你就不会看见任何输出。

回到Files看下iPhone是否已经识别。对于我而言，在Antergos中看上去这样：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-mount-Antergos-Linux.jpeg)

你可以在这个目录中访问文件。从这里复制文件或者复制到里面。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-mount-Antergos-Linux-1.jpeg)

**第八步**： 当你想要卸载的时候，使用这个命令：

    sudo umount ~/iPhone

### 对你有用么？ ###

我知道这并不是非常方便和理想，iPhone应该像其他USB设备那样工作，但是事情并不总是像人们想的那样。好的是一点小的DIY就能解决这个问题带来了一点成就感（至少对我而言）。我必须要说的是Antergos应该修复这个问题让iPhone可以默认挂载。

这个技巧对你有用么?如果你有任何问题或者建议，欢迎留下评论。

--------------------------------------------------------------------------------

via: http://itsfoss.com/iphone-antergos-linux/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://www.libimobiledevice.org/
[2]:http://itsfoss.com/mount-iphone-ipad-ios-7-ubuntu-13-10/
