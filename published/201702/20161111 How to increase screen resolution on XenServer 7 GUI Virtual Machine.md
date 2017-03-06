如何在 XenServer 7 GUI 虚拟机（VM）上提高屏幕分辨率
============

### 介绍

**目的**

如果你想要将 XenServer 虚拟机作为远程桌面，默认的分辨率可能不能满足你的要求。

![Default xenserver screen VM resolution](https://linuxconfig.org/images/xenserver-7-default-screen-resolution.png) 

本篇的目标是提高 XenServer 7 GUI 虚拟机（VM）的屏幕分辨率

**要求**

访问 XenServer 7 系统的权限

**难易性**

简单

**惯例**

* `#` - 给定命令需要作为 root 用户权限运行或者使用 `sudo` 命令
* `$` - 给定命令作为常规权限用户运行

### 指导

**获得 VM UUID**

首先，我们需要获得想要提升分辨率的虚拟机的 UUID。

```
# xe vm-list 
uuid ( RO)           : 09a3d0d3-f16c-b215-9460-50dde9123891
     name-label ( RW): CentOS 7
    power-state ( RO): running
```

提示：如果你将此 UUID 保存为 shell 变量会节省一些时间：

```
# UUID=09a3d0d3-f16c-b215-9460-50dde9123891
```

**关闭 VM**

优雅地关闭 VM 或使用 `xe vm-vm-shutdown` 命令：

```
# xe vm-shutdown uuid=$UUID
```

**更新 VGA 的 VIDEORAM 设置**

检查你目前的 VGA 的 VIDEORAM 参数设置：

```
# xe vm-param-get uuid=$UUID param-name="platform" param-key=vga
std
# xe vm-param-get uuid=$UUID param-name="platform" param-key=videoram
8
```

要提升屏幕的分辨率，将 VGA 更新到 `std` （如果已经设置过，就不需要做什么），并将 `videoram` 调大几兆，如设置成 16：

```
# xe vm-param-set uuid=$UUID platform:vga=std
# xe vm-param-set uuid=$UUID platform:videoram=16
```

**启动 VM**

```
# xe vm-start uuid=$UUID
```

![increased xenserver screen VM resolution](https://linuxconfig.org/images/xenserver-7-increased-screen-resolution.png) 

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm

作者：[Lubos Rendek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm
[1]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-1-obtain-vm-uuid
[2]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-2-shutdown-vm
[3]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-3-update-vga-a-videoram-settings
[4]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-4-start-vm
[5]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h1-objective
[6]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h2-requirements
[7]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h3-difficulty
[8]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h4-conventions
[9]:https://linuxconfig.org/how-to-increase-screen-resolution-on-xenserver-7-gui-virtual-machine-vm#h5-instructions
