技巧：在CentOS 7上安装Vmware 10
================================================================================
在CentOS 7上安装Vmware 10.0.3，我来介绍下我的经验。通常，这个版本是不能在CentOS 7工作的，因为它只能运行在比较低的内核版本3.10上。

首先，以正常方式下载并安装（没有问题）。唯一的问题是在后来运行vmware程序的时候。

### 如何修复？ ###

**1 – 进入 /usr/lib/vmware/modules/source。**

    cd /usr/lib/vmware/modules/source

**2 – 解压 vmnet.tar.**

    tar -xvf vmnet.tar

**3 – 进入 vmnet-only 目录。**

    cd vmnet-only

**4 – 编辑filter.c文件。**

    vi filter.c

在206和259行，替换以下字符串：

    #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)

为：

    #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 0, 0)

保存并退出。

**5 – 回到先前文件夹。**

    cd ../

**6 – 再次压缩文件夹。**

    tar -uvf vmnet.tar vmnet-only

**7 – 移除旧目录。**

    rm -fr vmnet-only

**8 – 启动vmware并体验。**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_008.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-vmware-10-centos-7/

作者： M.el Khamlichi
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
