如何在 Ubuntu 15.10，14.04 中安装 NVIDIA 358.16 驱动程序
================================================================================
![nvidia-logo-1](http://ubuntuhandbook.org/wp-content/uploads/2015/06/nvidia-logo-1.png)

[NVIDIA 358.16][1] —— NVIDIA 358 系列的第一个稳定版本已经发布，并对 358.09 中（测试版）做了一些修正，以及一些小的改进。

NVIDIA 358 增加了一个新的 **nvidia-modeset.ko** 内核模块，可以配合 nvidia.ko 内核模块工作来调用 GPU 显示引擎。在以后发布版本中，**nvidia-modeset.ko** 内核驱动程序将被用于模式设置接口的基础，该接口由内核的直接渲染管理器（DRM）所提供。

新的驱动程序也有新的 GLX 协议扩展，以及在 OpenGL 驱动中分配大量内存的系统内存分配新机制。新的 GPU **GeForce 805A** 和  **GeForce GTX 960A** 都支持。NVIDIA 358.16 也支持 X.Org 1.18 服务器和 OpenGL 4.3。

### 如何在 Ubuntu 中安装 NVIDIA 358.16 : ###

> **请不要在生产设备上安装，除非你知道自己在做什么以及如何才能恢复。**

对于官方的二进制文件，请到 [nvidia.com/object/unix.html][1] 查看。

对于那些喜欢 Ubuntu PPA 的，我建议你使用 [显卡驱动 PPA][2]。到目前为止，支持 Ubuntu 16.04, Ubuntu 15.10, Ubuntu 15.04, Ubuntu 14.04。

**1. 添加 PPA.**

通过按 `Ctrl+Alt+T` 快捷键来从 Unity 桌面打开终端。当打启动应用后，粘贴下面的命令并按回车键：

    sudo add-apt-repository ppa:graphics-drivers/ppa

![nvidia-ppa](http://ubuntuhandbook.org/wp-content/uploads/2015/08/nvidia-ppa.jpg)

它会要求你输入密码。输入密码后，密码不会显示在屏幕上，按 Enter 继续。

**2. 刷新并安装新的驱动程序**

添加 PPA 后，逐一运行下面的命令刷新软件库并安装新的驱动程序：

    sudo apt-get update
    
    sudo apt-get install nvidia-358 nvidia-settings

### (如果需要的话，) 卸载: ###

开机从 GRUB 菜单进入恢复模式，进入根控制台。然后逐一运行下面的命令：

重新挂载文件系统为可写：

    mount -o remount,rw /

删除所有的 nvidia 包：

    apt-get purge nvidia*

最后返回菜单并重新启动：

    reboot

要禁用/删除显卡驱动 PPA，点击系统设置下的**软件和更新**，然后导航到**其他软件**标签。

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-nvidia-358-16-driver-ubuntu-15-10/

作者：[Ji m][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://www.nvidia.com/Download/driverResults.aspx/95921/en-us
[2]:http://www.nvidia.com/object/unix.html
[3]:https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
