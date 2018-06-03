强制关闭你的系统的内核模块
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/kgotobed-720x340.png)

我知道熬夜对健康不利。但谁在乎？多年来我一直是一只夜猫子。我通常在 12 点以后睡觉，有时在凌晨 1 点以后睡觉。第二天早上，我至少推迟三次闹钟，醒来后又累又有脾气。每天，我向自己保证早点睡觉，但最终会像平常一样晚睡。而且，这个循环还在继续！如果你和我一样，这有一个好消息。一个同学通宵开发了一个名为 **“Kgotobed”** 的内核模块，它迫使你在特定的时间上床睡觉。也就是说它会强制关闭你的系统。

你可能会问！我为什么要用这个？我有很多其他的选择。我可以设置一个 cron 作业来安排在特定时间关闭系统。我可以设置提醒或闹钟。我可以使用浏览器插件或软件。但是，它们都可以轻易忽略或绕过。Kgotobed 是你不能忽视的东西。**即使您是 root 用户也无法禁用**。是的，它会在指定的时间强制关闭你的系统。没有推迟选项。你不能推迟关机过程，也不能取消它。无论如何，系统都会在指定的时间停止运行。你被警告了！！

### 安装 Kgotobed

确保你已经安装了 `dkms`。它在大多数 Linux 发行版的默认仓库中都有。

例如在 Fedora 上，你可以使用以下命令安装它：

```
$ sudo dnf install kernel-devel-$(uname -r) dkms
```

在 Debian、Ubuntu、linux Mint 上：

```
$ sudo apt install dkms
```

安装完成后，`git clone` Kgotobed 项目。

```
$ git clone https://github.com/nikital/kgotobed.git
```

该命令会在当前工作目录中将所有 Kgotobed 仓库的内容克隆到名为 `kgotobed` 的文件夹中。进入到该目录：

```
$ cd kgotobed/
```

接着，使用命令安装 Kgotobed 驱动：

```
$ sudo make install
```

上面的命令将 `kgotobed.ko` 模块注册到 **DKMS**（这样它会为每个你运行的内核重建）并在 `/usr/local/bin/` 目录下安装 `gotobed`，然后注册、启用并启动 kgotobed 服务。

### 如何运行

默认情况下，Kgotobed 将睡前时间设置为 **1:00 AM**。也就是说，无论你在做什么，你的电脑都会在凌晨 1 点关机。

要查看当前的睡前时间，请运行：

```
$ gotobed
Current bedtime is 2018-04-10 01:00:00
```

要提前睡眠时间，例如 22:00（晚上 10 点），请运行：

```
$ sudo gotobed 22:00
[sudo] password for sk:
Current bedtime is 2018-04-10 00:58:00
Setting bedtime to 2018-04-09 22:00:00
Bedtime will be in 2 hours 16 minutes
```

当你想早点睡觉时，这会很有帮助！

但是，你不能设置更晚的时间也就是凌晨 1 点以后。你无法卸载模块，并且调整系统时钟也无济于事。唯一的出路是重启！

要设置不同的默认时间，您需要自定义 `kgotobed.service`（通过编辑或使用 systemd 工具）。

### 卸载 Kgotobed

对 Kgotobed 不满意？别担心！进入我们先前克隆的 `kgotobed` 文件夹，然后运行以下命令将其卸载。

```
$ sudo make uninstall
```

再一次，我警告你，即使你是 root 用户，也没有办法推迟或取消关机过程。你的系统将在指定的时间强制关闭。这并不适合每个人！当你在做一项重要任务时，它可能会让你疯狂。在这种情况下，请确保你已经不时地保存工作，或使用下面链接中的一些高级工具来帮助你在特定时间自动关闭、重启、暂停和休眠系统。

- [在特定时间自动关闭、重启、暂停和休眠系统](https://www.ostechnix.com/auto-shutdown-reboot-suspend-hibernate-linux-system-specific-time/)

就是这些了。希望你觉得这个指南有帮助。还有更好的东西。敬请关注！

干杯!

### 资源

- [Kgotobed GitHub 仓库](https://github.com/nikital/kgotobed)

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/kgotobed-a-kernel-module-that-forcibly-shutdown-your-system/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
