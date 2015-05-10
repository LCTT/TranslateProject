如何修复 apt-get update 无法添加新的 CD-ROM 的错误
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/12/elementary_OS_Freya.jpg)

这些天我正在体验Elementary OS Freya，在这期间，我遇到了一个非常常见的更新错误：**Failed to fetch cdrom Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs**。完整的错误在运行apt-get update后看上去像这样：

> W: Failed to fetch cdrom://elementary OS 0.3 _Freya_ – Daily amd64 (20150208)/dists/trusty/main/binary-amd64/Packages Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs
> 
> W: Failed to fetch cdrom://elementary OS 0.3 _Freya_ – Daily amd64 (20150208)/dists/trusty/restricted/binary-amd64/Packages Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs
> 
> E: Some index files failed to download. They have been ignored, or old ones used instead.

本篇中，我们会了解如何修复这个错误。

### 修复apt-get update无法添加新的CD-ROM的错误 ###

这个错误的原因是cdrom已经被包含在源之中。要修复这个问题，我们需要将它从软件源中移除。

在Ubuntu中，找到“软件与更新”：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Software_Update_Ubuntu.jpeg)

在Ubuntu Software的第一个标签中，找到cdrom，如果它是勾选的，那么取消勾选。 

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/CDROM_Error_Update_Software_Sources.jpeg)

关闭软件源并再次运行更新。现在应该可以用了。

### 进一步故障排除： ###

上面描述的方法已经修复了这个**apt-get update cannot be used to add new CD-ROMs**错误。但是这个方法对我无效，因为cdrom的选项这时是灰色的，因为我使用的live版本。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/CDROM_Update_Error.png)

现在要修复我们的问题了，我们是要采用命令行路线。打开终端并查看软件源中包含了哪些源：

    cat /etc/apt/sources.list

我的输出是下面这样：

    deb cdrom:[elementary OS 0.3 _Freya_ – Daily amd64 (20150208)]/ trusty main restricted
    deb http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
    deb http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
    deb-src http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
    deb http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse

在上面的第一行中。它包含了cdrom。我们需要用‘#’来注释掉这行：

    #deb cdrom:[elementary OS 0.3 _Freya_ – Daily amd64 (20150208)]/ trusty main restricted

要用下面的命令来：

    sudo gedit /etc/apt/sources.list

在你编辑完软件源后，再次运行apt-get update。“apt-get update cannot be used to add new CD-ROMs”这个错误应该已经修复了。如果你还遇到其他的问题，看一下这篇收集了大部分[Ubuntu常见更新错误修复][1]的文章。

我希望这篇教程对你有用。如果你还有其他的问题和建议，请在下面留言。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-failed-fetch-cdrom-aptget-update-add-cdroms/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/fix-update-errors-ubuntu-1404/
