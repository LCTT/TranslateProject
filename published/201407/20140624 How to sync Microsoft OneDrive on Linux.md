逝去的纪念：如何在Linux中同步微软 OneDrive
================================================================================
【编者注】：本文译文完成之后不久，OneDrive 就成了中国人的昨日黄花了。编者想了想，还是发出来罢，仅以此文纪念我们逝去的这个、那个、以及这些和那些。也许若干年后我们回忆起来，我们曾经有过那么多那些，而当时却挑三拣四，没有珍惜，如果再给我一次机会……

---

[OneDrive][1]（以前称为SkyDrive）是微软的一个广受欢迎的云存储产品。目前OneDrive为每一个新注册用户提供7GB免费存储空间。正如你所想，OneDrive与微软其他软件产品很好地集成。微软还提供了一个独立的OneDrive客户端，它会自动备份照相机拍摄的图片和视频到OneDrive。但你猜怎么着。该客户端可用于除Linux的各大PC/移动平台。 

“OneDrive在任何设备，任何时间”？哦，不，这还不行。

不过不要失望。开源社区已经已经拿出了解决方案。 Boilermaker写的[onedrive-d][2]可以完成这项工作。作为监测守护进程运行，onedrive-D可自动将本地文件夹同步到OneDrive云存储。

I在本教程中，我将介绍**如何在Linux上使用onedrive-d同步微软OneDrive**。

### 在linux上安装onedrive-d ###

虽然onedrive-d最初是为Ubuntu/ Debian开发的，但它仍然支持CentOS/ Fedora/ RHEL。 

安装就像输入下面的命令一样容易。

    $ git clone https://github.com/xybu92/onedrive-d.git
    $ cd onedrive-d
    $ ./inst install

### 第一次配置 ###

安装之后，你需要进行一次性配置来授予onedrive-d对您OneDrive账户的读/写权限。 

首先，创建将用于对远程OneDrive账户同步的本地文件夹。

    $ mkdir ~/onedrive

接着运行下面的命令开启一次性配置。

    $ onedrive-d

它接着会弹出如下onedrive-d的设置窗口。在“Location”选项中，选择你之前创建的本地文件夹。在“Authentication”选项中，你会看见“You have not authenticated OneDrive-d yet”（“你还没有授权OneDrive-d”）的信息。现在点击"Connect to OneDrive.com"按钮。

![](https://farm4.staticflickr.com/3885/14470579955_1fb92e7cfe.jpg)

它会弹出一个新窗口来要求你登录OneDrivecom。

![](https://farm4.staticflickr.com/3903/14467221981_3d74140f61_z.jpg)

登录OneDrive.com之后，你会被要求授权onedrive-d访问。选择“Yes”。

![](https://farm3.staticflickr.com/2925/14283963819_86cf52e1fd_z.jpg)

回到先前的设置窗口，你会看到之前的状态已经变成了You have connected to OneDrive.com"（“你已经连接到了OneDrive.com”）。点击“OK”完成。

![](https://farm4.staticflickr.com/3896/14284004048_3e718d1e30.jpg)

### 与OneDrive同步一个本地文件夹 ###

这里有两种方法来使用onedrice-d将本地文件夹与OneDrive存储同步。

一种是“手动使用命令行来同步OneDrive”。就是当你需要与你的OneDrive账户同步时运行如下命令：

    $ onedrive-d

`onedrive-d`接着将扫描本地文件夹与OneDrive帐户的内容并使两者同步。这意味着要么上传一个在本地文件夹新添加的文件，或者从远程OneDrive帐户下载最新发现的文件。如果你从本地文件夹删除任何文件，相应的文件将自动在与OneDrive帐户同步后被删除。反之亦然。

一旦同步完成，你可以使用Ctrl-C中断onedirve-d的前台进程。

![](https://farm6.staticflickr.com/5509/14283967750_b9ebf1b05d_z.jpg)

另一种方法是将onedrive-d作为一个始终运行的守护进程在开机时自动启动。在这种情况下，后台守护进程会同时监视本地文件夹和OneDrive账户，以使它们保持同步。要做到这一点，只需将onedrive-D加入到你桌面的[自动启动程序列表][3]中就行了。

当onedrive-D作为守护进程在后台运行时，你会在桌面状态栏中看到OneDrive图标，如下图所示。每当同步更新被触发，你就会看到一个桌面通知。

![](https://farm4.staticflickr.com/3924/14290119448_3b1144db77.jpg)

要注意的是：根据作者所言，onedrive-d仍在积极开发中。这并不能用于任何形式的生产环境。如果您遇到任何bug，请随时提交一份[bug报告][4]。你的贡献，笔者将不胜感激。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/sync-microsoft-onedrive-linux.html

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/go/onedrive
[2]:http://xybu.me/projects/onedrive-d/
[3]:http://xmodulo.com/2013/12/start-program-automatically-linux-desktop.html
[4]:https://github.com/xybu92/onedrive-d/issues?state=open
