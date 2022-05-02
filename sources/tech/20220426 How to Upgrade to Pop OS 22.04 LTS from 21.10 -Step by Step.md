[#]: subject: "How to Upgrade to Pop OS 22.04 LTS from 21.10 [Step by Step]"
[#]: via: "https://www.debugpoint.com/2022/04/upgrade-pop-os-22-04-from-21-10/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

怎样从Pop OS 21.10 更新到 Pop OS 22.02 lts [按步骤]
======
我们给了你简单的步骤从 POP OS 21.10 升级到 POP OS 22.04 LTS 。
System76 依照 [Ubuntu 22.04 LTS][2] [发布][1] 了 Pop OS 22.04 LTS ，它带来了一些令人兴奋的功能。Pop OS 22.04 LTS 是来自 System76 发布的长期支持版本，它带来了自动计划更新，自定义的 GNOME 42,潜在的性能改进和 [许多其它的功能][3]。

你一定会很兴奋来体验 Pop OS 22.04 并计划更新它。这里我给出你升级 Pop OS 22.04 LTS 的步骤。

: 你不能直接从 Pop OS 20.04 升级到 Pop OS 22.04 。首先，你需要先升级到 Pop OS 21.10 然后此处概述的步骤升级到这个版本。 

### 从 Pop OS 21.10 升级到 Pop OS 22.04

#### Before Upgrade

Pop OS 升级过程相对来说较为稳定。 因为根据我们 [关于升级问题的最近文章][4] 显示，许多用户面临升级方面的问题。但是如果你运行带有 NVIDIA 硬件的 Pop OS ，我建议你做个备份。 

  * 确保你的系统是最新的。你可以使用 Pop 商店应用检查更新。或者，你可以打开终端提示符并运行以下命令升级。


```

    sudo apt update && sudo apt upgrade

```

  * 按照以上步骤升级完成之后，重启系统。
  * 备份你的文档，照片，视频和其它文件到独立的磁盘分区或者 USB 驱动器。
  * 升级之前，禁用所有 GNOME 扩展。许多扩展会阻挡迁移到 GNOME 42 的过程，如果你升级之前禁用所有扩展，之后再启用它们是最好的。
  * 记下所有额外的软件源或你已经添加的 PPA 仓库，因为它们可能与 “jammy” 分支不兼容。升级之后你可能需要验证它们。
  * 关闭所有运行的程序
  * 最后,确保你有时间和稳定的网络连接来完成升级。 



[][5]

另见:   怎样从Pop OS 20.10 更新到 Pop OS 21.04 lts [按步骤]

### Pop OS 22.04 LTS 的升级步骤

#### 图形界面升级方法

如果你正在运行的是 Pop OS 21.10 ，你应该看到一个以下这样提示是否你的系统需要升级。


![Pop OS 22.04 升级提示][6]

或者, 你可以打开设置然后访问系统升级和恢复标签。这里你应该看到系统更新信息是可用的。

![Pop OS 22.04 在设置标签的提示][7]

点击 <ruby>Download<rt>下载</rt></ruby> 开始升级过程。

#### 升级到 Pop OS 22.04 LTS 的终端方法

  * 打开终端运行以下命令。



```

    sudo apt update

```

```

    sudo apt full-upgrade

```

  * 这能确保在升级过程开始前系统保持最新。如果你已经完成了这个作为以上描述的预升级的步骤，那么你可以忽略它。


  * 使用以下命令更新恢复分区并等待它完成。这只适用于 UEFI 安装模式。



```

    pop-upgrade recovery upgrade from-release

```

  * 现在使用以下命令开始升级过程：


```

    pop-upgrade release upgrade

```

![开始升级过程][8]

  * 首先,升级过程将会下载软件包。按照我们的测试，大约 1600 多个软件包需要下载。 the upgrade will start the download of the packages. As of our test, around 1600+ packages need downloading. Hence you should wait until it finishes.


  * Secondly, once the download is complete, the upgrader will prompt you for the reboot.



![Ready for upgrade][9]

  * Pop OS would start installing the latest packages to your system after the reboot.


  * Finally, the download process takes about an hour, so wait for it to be finished. I would not recommend stopping the upgrade mid-way as it may lead to an unstable system.



![Pop OS 22.04 LTS Desktop][10]

  * After the upgrade is complete, enjoy the brand new Pop OS 22.04 LTS.



* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][11], [Twitter][12], [YouTube][13], and [Facebook][14] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/upgrade-pop-os-22-04-from-21-10/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://blog.system76.com/post/682519660741148672/popos-2204-lts-has-landed
[2]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[3]: https://www.debugpoint.com/2022/04/pop-os-22-04-lts/
[4]: https://www.debugpoint.com/2021/12/upgrade-pop-os-21-10-from-21-04/
[5]: https://www.debugpoint.com/2021/07/upgrade-pop-os-21-04-from-20-10/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/04/Pop-OS-22.04-Upgrade-Prompt-1024x200.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Pop-OS-22.04-Upgrade-Prompt-in-Settings.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Start-the-upgrade-process.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ready-for-upgrade-1024x323.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Pop-OS-22.04-LTS-Desktop-1024x641.jpg
[11]: https://t.me/debugpoint
[12]: https://twitter.com/DebugPoint
[13]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[14]: https://facebook.com/DebugPoint
