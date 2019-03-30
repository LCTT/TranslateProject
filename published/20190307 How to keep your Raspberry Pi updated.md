[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10665-1.html)
[#]: subject: (How to keep your Raspberry Pi updated)
[#]: via: (https://opensource.com/article/19/3/how-raspberry-pi-update)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

树莓派使用入门：如何更新树莓派
======
> 在我们的树莓派入门指南的第七篇学习如何给树莓派打补丁。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_happy_sad_developer_programming.png?itok=72nkfSQ_)

像平板电脑、手机和笔记本电脑一样，你需要更新树莓派。最新的增强功能不仅可以使你的派运行顺畅，还可以让它更安全，特别是在如果你连接到网络的情况下。我们的树莓派入门指南中的第七篇会分享两条关于让派良好运行的建议。

### 更新 Raspbian

更新 Raspbian 有[两步][1]：

1. 在终端中输入：`sudo apt-get update`。

    该命令的 `sudo` 让你以管理员（也就是 root）运行 `apt-get update`。请注意，`apt-get update` 不会在系统上安装任何新东西，而是将更新需要更新的包和依赖项列表。
2. 接着输入：`sudo apt-get dist-upgrade`。

    摘自文档：“一般来说，定期执行此操作将使你的安装保持最新，因为它将等同于 [raspberrypi.org/downloads][2] 中发布的最新镜像。”

![](https://opensource.com/sites/default/files/uploads/update_sudo_rpi.png)

### 小心 rpi-update

Raspbian 带有另一个名为 [rpi-update][3] 的更新工具。此程序可用于将派升级到最新固件，不管该固件是不是有损坏或问题。你可能会发现一些如何使用它的信息，但是建议你永远不要使用这个程序，除非你有充分的理由这样做。

一句话：保持系统更新！

--------------------------------------------------------------------------------
via: https://opensource.com/article/19/3/how-raspberry-pi-update

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/documentation/raspbian/updating.md
[2]: https://www.raspberrypi.org/downloads/
[3]: https://github.com/Hexxeh/rpi-update
