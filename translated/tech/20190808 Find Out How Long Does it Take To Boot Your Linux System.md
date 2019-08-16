[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Find Out How Long Does it Take To Boot Your Linux System)
[#]: via: (https://itsfoss.com/check-boot-time-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

了解你的 Linux 系统的启动时间
======

当你打开系统电源时，你会等待制造商的 logo 出现，屏幕上可能会显示一些消息（以非安全模式启动），[Grub][1] 页面，操作系统加载页面以及最后的登录页面。

你检查过这花费了多长时间么？也许没有。除非你真的需要知道，否则你不会在意开机时间。

但是如果你很想知道你的 Linux 系统需要很长时间才能启动呢？使用秒表是一种方法，但在 Linux 中，你有一种更好、更轻松地了解系统启动时间的方法。

### 在 Linux 中使用 systemd-analyze 检查启动时间

![][2]

无论你是否喜欢，[systemd][3] 运行在大多数流行的 Linux 发行版中。systemd 有许多管理 Linux 系统的工具。其中一个就是 systemd-analyze。

systemd-analyze 命令为你提供上次启动时运行的服务数量以及消耗时间的详细信息。

如果在终端中运行以下命令：

```
systemd-analyze
```

你将获得总启动时间以及固件、引导加载程序、内核和用户空间所消耗的时间：

```
Startup finished in 7.275s (firmware) + 13.136s (loader) + 2.803s (kernel) + 12.488s (userspace) = 35.704s

graphical.target reached after 12.408s in userspace
```

正如你在上面的输出中所看到的，我的系统花了大约 35 秒才进入可以输入密码的页面。我正在使用戴尔 XPS Ubuntu。它使用 SSD 存储，尽管如此，它还需要很长时间才能启动。

不是那么令人印象深刻，是吗？为什么不共享你们系统的启动时间？我们来比较吧。

你可以使用以下命令将启动时间进一步细分为每个单元：

```
systemd-analyze blame
```

这将生成大量输出，所有服务按所用时间的降序列出。

```
7.347s plymouth-quit-wait.service
6.198s NetworkManager-wait-online.service
3.602s plymouth-start.service
3.271s plymouth-read-write.service
2.120s apparmor.service
1.503s [email protected]
1.213s motd-news.service
 908ms snapd.service
 861ms keyboard-setup.service
 739ms fwupd.service
 702ms bolt.service
 672ms dev-nvme0n1p3.device
 608ms [email protected]:intel_backlight.service
 539ms snap-core-7270.mount
 504ms snap-midori-451.mount
 463ms snap-screencloud-1.mount
 446ms snapd.seeded.service
 440ms snap-gtk\x2dcommon\x2dthemes-1313.mount
 420ms snap-core18-1066.mount
 416ms snap-scrcpy-133.mount
 412ms snap-gnome\x2dcharacters-296.mount
```

#### 额外提示：改善启动时间

如果查看此输出，你可以看到网络管理器和 [plymouth][4] 都消耗了大量的启动时间。

Plymouth 负责你在 Ubuntu 和其他发行版中在登录页面出现之前的引导页面。网络管理器负责互联网连接，可以关闭它来加快启动时间。不要担心，在你登录后，你可以正常使用 wifi。

```
sudo systemctl disable NetworkManager-wait-online.service
```

如果要还原更改，可以使用以下命令：

```
sudo systemctl enable NetworkManager-wait-online.service
```

现在，请不要在不知道用途的情况下自行禁用各种服务。这可能会产生危险的后果。

_ **现在你知道了如何检查 Linux 系统的启动时间，为什么不在评论栏分享你的系统的启动时间？** _

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-boot-time-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/grub/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/linux-boot-time.jpg?resize=800%2C450&ssl=1
[3]: https://en.wikipedia.org/wiki/Systemd
[4]: https://wiki.archlinux.org/index.php/Plymouth
