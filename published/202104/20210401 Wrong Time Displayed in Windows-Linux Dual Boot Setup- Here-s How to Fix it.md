[#]: subject: (Wrong Time Displayed in Windows-Linux Dual Boot Setup? Here’s How to Fix it)
[#]: via: (https://itsfoss.com/wrong-time-dual-boot/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13276-1.html)

如何解决 Windows-Linux 双启动设置中显示时间错误的问题
======

![](https://img.linux.net.cn/data/attachment/album/202104/08/102102xaup3iofozn2uvbf.jpg)

如果你 [双启动 Windows 和 Ubuntu][1] 或任何其他 Linux 发行版，你可能会注意到两个操作系统之间的时间差异。

当你 [使用 Linux][2] 时，它会显示正确的时间。但当你进入 Windows 时，它显示的时间是错误的。有时，情况正好相反，Linux 显示的是错误的时间，而 Windows 的时间是正确的。

特别奇怪的是，因为你已连接到互联网，并且已将日期和时间设置为自动使用。

别担心！你并不是唯一一个遇到这种问题的人。你可以在 Linux 终端上使用以下命令来解决这个问题：

```
timedatectl set-local-rtc 1
```

同样，不要担心。我会解释为什么你在双启动设置中会遇到时间差。我会向你展示上面的命令是如何修复 Windows 双启动后的时间错误问题的。

### 为什么 Windows 和 Linux 在双启动时显示不同的时间？

一台电脑有两个主要时钟：系统时钟和硬件时钟。

硬件时钟也叫 RTC（[实时时钟][3]）或 CMOS/BIOS 时钟。这个时钟在操作系统之外，在电脑的主板上。即使在你的系统关机后，它也会继续运行。

系统时钟是你在操作系统内看到的。

当计算机开机时，硬件时钟被读取并用于设置系统时钟。之后，系统时钟被用于跟踪时间。如果你的操作系统对系统时钟做了任何改变，比如改变时区等，它就会尝试将这些信息同步到硬件时钟上。

默认情况下，Linux 认为硬件时钟中存储的时间是 UTC，而不是本地时间。另一方面，Windows 认为硬件时钟上存储的时间是本地时间。这就是问题的开始。

让我用例子来解释一下。

你看我在加尔各答 UTC+5:30 时区。安装后，当我把 [Ubuntu 中的时区][4] 设置为加尔各答时区时，Ubuntu 会把这个时间信息同步到硬件时钟上，但会有 5:30 的偏移，因为对于 Linux 来说它必须是 UTC。

假设加尔各答时区的当前时间是 15:00，这意味着 UTC 时间是 09:30。

现在当我关闭系统并启动到 Windows 时，硬件时钟有 UTC 时间（本例中为 09:30）。但是 Windows 认为硬件时钟已经存储了本地时间。因此，它改变了系统时钟（应该显示为 15:00），而使用 UTC 时间（09:30）作为本地时间。因此，Windows 显示时间为 09:30，这比实际时间（我们的例子中为 15:00）早了 5:30。

![][5]

同样，如果我在 Windows 中通过自动时区和时间按钮来设置正确的时间，你知道会发生什么吗？现在它将在系统上显示正确的时间（15:00），并将此信息（注意图片中的“同步你的时钟”选项）同步到硬件时钟。

如果你启动到 Linux，它会从硬件时钟读取时间，而硬件时钟是当地时间（15:00），但由于 Linux 认为它是 UTC 时间，所以它在系统时钟上增加了 5:30 的偏移。现在 Linux 显示的时间是 20:30，比实际时间超出晚了 5:30。

现在你了解了双启动中时差问题的根本原因，是时候看看如何解决这个问题了。

### 修复 Windows 在 Linux 双启动设置中显示错误时间的问题

有两种方法可以处理这个问题：

  * 让 Windows 将硬件时钟作为 UTC 时间
  * 让 Linux 将硬件时钟作为本地时间

在 Linux 中进行修改是比较容易的，因此我推荐使用第二种方法。

现在 Ubuntu 和大多数其他 Linux 发行版都使用 systemd，因此你可以使用 `timedatectl` 命令来更改设置。

你要做的是告诉你的 Linux 系统将硬件时钟（RTC）作为本地时间。你可以通过 `set-local-rtc` （为 RTC 设置本地时间）选项来实现：

```
timedatectl set-local-rtc 1
```

如下图所示，RTC 现在使用本地时间。

![][6]

现在如果你启动 Windows，它把硬件时钟当作本地时间，而这个时间实际上是正确的。当你在 Linux 中启动时，你的 Linux 系统知道硬件时钟使用的是本地时间，而不是 UTC。因此，它不会尝试添加这个时间的偏移。

这就解决了 Linux 和 Windows 双启动时的时差问题。

你会看到一个关于 RTC 不使用本地时间的警告。对于桌面设置，它不应该引起任何问题。至少，我想不出有什么问题。

希望我把事情给你讲清楚了。如果你还有问题，请在下面留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/wrong-time-dual-boot/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]: https://itsfoss.com/why-use-linux/
[3]: https://www.computerhope.com/jargon/r/rtc.htm
[4]: https://itsfoss.com/change-timezone-ubuntu/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/set-time-windows.jpg?resize=800%2C491&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/set-local-time-for-rtc-ubuntu.png?resize=800%2C490&ssl=1
