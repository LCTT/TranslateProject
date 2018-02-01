在 Linux 上恢复一个损坏的 USB 设备至初始状态
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/restore-corrupted-usb-drive-to-original-state-in-linux_orig.jpg)

很多时候我们诸如 SD 卡和 U 盘这样的储存器可能会被损坏，并且因此或其他原因不能继续使用。

这可能是因为使用这个设备创建了一个引导媒体或者是通过错误的平台格式化亦或是创建了一个新的分区在这个设备上。

### 恢复损坏的 USB 设备至初始状态

 [![Linux 系统磁盘管理器](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/usb.png?1510665746)][1] 

**警告：接下来的操作会将你设备上的所有数据格式化。**

无论是上面提及的什么原因，最终的结果是我们无法继续使用这个设备。

所以这里有一个恢复 USB 设备或者是 SD 卡到出厂状态的方法。

大多数时候通过文件浏览器进行一次简单格式化可以解决问题，但是在一些极端情况下，比如文件管理器没有作用，而你又需要你的设备可以继续工作时，你可以使用下面的指导：

我们将会使用一个叫做 `mkusb` 的小工具来实现目标，这个工具的安装非常简单。

添加 mkusb 的仓库：

```
sudo apt add repository ppa:mkusb/ppa
```

现在更新你的包列表：

```
sudo apt-get update
```

安装 `mkusb：

```
sudo apt-get install mkusb
```

现在运行 `mkusb` 你将会看到这个提示，点击 ‘Yes’。

 [![运行 mkusb dus](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/run-mkusb.png?1510498592)][2] 

现在 `mkusb` 将会最后一次询问你是否希望继续格式化你的数据，‘Stop’是被默认选择的，你现在选择 ‘Go’ 并点击 ‘OK’。

 [![Linux mkusb](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/final-checkpoint_1.png?1510499627)][3] 

窗口将会关闭，此时你的终端看起来是这样的。

 [![mkusb usb 控制台](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/mkusb.png?1510499982)][4] 

在几秒钟之后，整个过程将会完成，并且你将看到一个这样的弹出窗口。

 [![恢复损坏的 USB 设备](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/usb_1.png?1510500412)][5] 

你现在需要把你的设备从系统推出，然后再重新插进去。你的设备将被恢复成为一个普通设备而且还能像原来一样的工作。

 [![Linux 磁盘管理器](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/usb_2.png?1510500457)][6] 

我们现在所做的操作本可以通过终端命令或是 gparted 或者其他的软件来完成，但是那将会需要一些关于分区管理的知识。

所以有一个像这样可以自动解决专一问题的小工具总是一个好事。

### 结论

`mkusb` 是一个很容易使用的程序，它可以修复你的 USB 储存设备和 SD 卡。`mkusb` 通过 mkusb 的 PPA 来下载。所有在 `mkusb` 上的操作都需要超级管理员的权限，并且你在这个设备上的所有数据将会被格式化。

一旦操作完成，你将会重置这个设备并让它继续工作。

如果你感到任何疑惑，你可以在下面的评论栏里免费发表。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/restore-corrupted-usb-drive-to-original-state-in-linux

作者：[LINUXANDUBUNTU][a]
译者：[Drshu](https://github.com/Drshu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/usb.png
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/run-mkusb.png
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/final-checkpoint_1.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/mkusb.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/usb_1.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/usb_2.png
