[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12835-1.html)
[#]: subject: (Got Kids? Limit Computer Usage Per Account in Linux With Timekpr-nExt)
[#]: via: (https://itsfoss.com/timekpr-next/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

有孩子吗？使用 Timekpr-nExt 限制 Linux 中每个账户的电脑使用
======

![](https://img.linux.net.cn/data/attachment/album/202011/18/004039svxva9wrvva2xias.jpg)

> 本周的开源软件亮点是 Timekpr-nExt。它是一个 GUI 应用，用于限制 Linux 系统中某些账户的电脑使用。对于不想让孩子花太多时间在电脑上的父母来说，这是一个方便的工具。

### 使用 Timekpr-nExt 在 Linux 上限制电脑使用

如果你家里有小孩，他们花太多时间在电脑上，你可能想对他们的使用进行一些限制。

可以让你根据一天的时间、一天、一周或者一月的小时数来限制某些账户的电脑使用。你也可以设置时间间隔来强制账户用户休息。

![][1]

给定的时间超过后，用户会自动登出，直到满足限制条件才可以重新登录。

![][2]

当然，这意味着你需要为孩子们单独设置非管理员（无 `sudo` 权限）账户。如果孩子们的账户也有管理员权限，他们可以很容易地改变设置。孩子们很聪明，你知道的。

### Timekpr-nExt 的功能

除了一个令人讨厌的风格化的名字，Timekpr-nExt 有以下功能：

* 将系统使用限制设置为按日智能限制、每日、每周或每月限制
* 你还可以根据时间和小时设置访问限制
* 用户可以看到关于他们还剩多少时间的通知
* 设置锁定动作（终止会话、关闭、暂停或锁定屏幕）
* 追踪账户的时间使用情况

请注意以下事项：

* 仔细检查你正在配置的账户。**不要把自己锁定**
* 每次更改配置时，请点击应用或设置按钮，否则更改将不会被设置
* 儿童帐户不应该有管理员操作，否则他们会覆盖设置

这里阅读[关于使用 Timekpr-nExt 的更多信息的文档][3]。

### 在 Linux 中安装 Timekpr-nExt

对于基于 Ubuntu 的 Linux 发行版（如 Mint、Linux Lite 等），有一个[官方 PPA 可用][4]。你可以通过以下命令逐步安装它：

```
sudo add-apt-repository ppa:mjasnik/ppa
sudo apt update
sudo apt install timekpr-next
```

Arch Linux 用户可以[在 AUR 中找到它][5]。对于其他用户，请检查你的发行版仓库。如果没有这样的包，你可以尝试使用源码。

- [Timekpr-nExt 源码][6]

**再说一次，不要在主账户中使用 Timekpr-nExt。你可能会把自己锁在外面。**

你会看到两个应用的实例。使用开头有 （SU） 的那个。

![][7]

#### 删除 Timekpr-nExt

我不能确定删除 Timekpr-nExt 是否也会删除你为用户设置的限制。手动恢复他们（间隔一天 24 小时）会是一个好主意。这里没有重置按钮。

要删除这个应用（如果你使用 PPA 安装它），使用以下命令：

```
sudo apt-get remove --purge timekpr-next
```

同时删除 PPA 仓库：

```
sudo add-apt-repository -r ppa:mjasnik/ppa
```

和[在 Linux 上屏蔽成人内容][8]一样，这个应用也是专门针对儿童的。并不是每个人都会觉得它有用，但家里有小孩的人如果觉得有必要的话，可以使用它。

你是否使用其他应用来监控/限制儿童访问计算机？

--------------------------------------------------------------------------------

via: https://itsfoss.com/timekpr-next/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/timekpr-next-ubuntu.png?resize=800%2C612&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/timekpr-next-icon-system-notification-area.png?resize=640%2C94&ssl=1
[3]: https://mjasnik.gitlab.io/timekpr-next/
[4]: https://launchpad.net/~mjasnik/+archive/ubuntu/ppa
[5]: https://aur.archlinux.org/packages/timekpr-next/
[6]: https://launchpad.net/timekpr-next
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/timekeeper-next.jpg?resize=799%2C250&ssl=1
[8]: https://itsfoss.com/how-to-block-porn-by-content-filtering-on-ubuntu/