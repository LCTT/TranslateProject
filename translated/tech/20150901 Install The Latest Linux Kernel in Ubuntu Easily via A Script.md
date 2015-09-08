使用脚本便捷地在Ubuntu系统中安装最新的Linux内核
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2014/12/linux-kernel-icon-tux.png)

想要安装最新的Linux内核吗？一个简单的脚本就可以在Ubuntu系统中方便的完成这项工作。

Michael Murphy 写了一个脚本用来将最新的候选版、标准版、或者低延时版内核安装到 Ubuntu 系统中。这个脚本会在询问一些问题后从 [Ubuntu kernel mainline page][1] 下载安装最新的 Linux 内核包。

### 通过脚本来安装、升级Linux内核: ###

1. 点击 [github page][2] 右上角的 “Download Zip” 来下载脚本。

2. 鼠标右键单击用户下载目录下的 Zip 文件，选择 “Extract Here” 将其解压到此处。

3. 右键点击解压后的文件夹，选择 “Open in Terminal” 在终端中导航到此文件夹下。

![](http://ubuntuhandbook.org/wp-content/uploads/2015/08/open-terminal.jpg)

此时将会打开一个终端，并且自动导航到结果文件夹下。如果你找不到  “Open in Terminal” 选项的话，在 Ubuntu 软件中心搜索安装 `nautilus-open-terminal` ，然后重新登录系统即可（也可以再终端中运行 `nautilus -q` 来取代重新登录系统的操作）。  
4. 当进入终端后，运行以下命令来赋予脚本执行本次操作的权限。

    chmod +x *

最后，每当你想要安装或升级 Ubuntu 的 linux 内核时都可以运行此脚本。

    ./*

![](http://ubuntuhandbook.org/wp-content/uploads/2015/08/run-script.jpg)

这里之所以使用 * 替代脚本名称是因为文件夹中只有它一个文件。

如果脚本运行成功，重启电脑即可。

### 恢复并且卸载新版内核 ###

如果因为某些原因要恢复并且移除新版内核的话，请重启电脑，在 Grub 启动器的 **高级选项** 菜单下选择旧版内核来启动系统。

当系统启动后，参照下边章节继续执行。

### 如何移除旧的（或新的）内核: ###

1. 从Ubuntu软件中心安装 Synaptic Package Manager。

2. 打开 Synaptic Package Manager 然后如下操作:

- 点击 **Reload** 按钮，让想要被删除的新内核显示出来.
- 在左侧面板中选择 **Status -> Installed** ，让查找列表更清晰一些。
- 在 Quick filter 输入框中输入 **linux-image-** 用于查询。
- 选择一个内核镜像 “linux-image-x.xx.xx-generic” 然后将其标记为removal（或者Complete Removal）
- 最后，应用变更

![](http://ubuntuhandbook.org/wp-content/uploads/2015/08/remove-old-kernel1.jpg)

重复以上操作直到移除所有你不需要的内核。注意，不要随意移除此刻正在运行的内核，你可以通过 `uname -r` 命令来查看运行的内核。

对于 Ubuntu 服务器来说，你可以一步步运行下面的命令：

    uname -r
    
    dpkg -l | grep linux-image-
    
    sudo apt-get autoremove KERNEL_IMAGE_NAME

![](http://ubuntuhandbook.org/wp-content/uploads/2015/08/remove-kernel-terminal.jpg)

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/08/install-latest-kernel-script/

作者：[Ji m][a]
译者：[译者ID](https://github.com/mr-ping)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://kernel.ubuntu.com/~kernel-ppa/mainline/
[2]:https://gist.github.com/mmstick/8493727

