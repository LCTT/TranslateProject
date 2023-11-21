[#]: subject: "Enabling Bluetooth on Arch Linux"
[#]: via: "https://itsfoss.com/bluetooth-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Arch Linux 上启用蓝牙
======

[我很轻松地安装了 Arch Linux][1]，这要归功于 archinstall 脚本。

在我开始使用它并探索之后，我尝试使用我的蓝牙耳机，却发现蓝牙无法工作。

我可以看到蓝牙选项，但无法启用它。单击开关会继续切换回禁用状态。

蓝牙开启按钮不起作用

下面是我所做的以及有作用的事情。

### 确保蓝牙服务正在运行

如果该服务未运行，蓝牙将不会打开，你将无法连接到它。

检查蓝牙服务的状态并查看其是否正在运行。

````

     systemctl status bluetooth

````

它给了我以下输出：

```

    [abhishek@itsfoss ~]$ systemctl status bluetooth
    ○ bluetooth.service - Bluetooth service
         Loaded: loaded (/usr/lib/systemd/system/bluetooth.service; disabled; preset: disabled)
         Active: inactive (dead)
           Docs: man:bluetoothd(8)

```

如你所见，`蓝牙`服务处于非活动状态。它没有运行。并且状态被禁用。

这意味着蓝牙守护程序当前未运行，也未设置为每次启动时自动启动。

这让我的事情变得更容易了。我在第一次尝试中就找出了根本原因。在 Arch Linux 中这种情况并不常见。

使用以下命令启动蓝牙守护进程：

````

     sudo systemctl start bluetooth

````

让蓝牙服务在系统启动时自动运行：

````

     systemctl enable bluetooth

````

它应该显示以下输出：

```

    [abhishek@itsfoss ~]$ systemctl enable bluetooth
    Created symlink /etc/systemd/system/dbus-org.bluez.service → /usr/lib/systemd/system/bluetooth.service.
    Created symlink /etc/systemd/system/bluetooth.target.wants/bluetooth.service → /usr/lib/systemd/system/bluetooth.service.

```

现在，蓝牙已启用，并且在系统设置中很明显：

![][2]

### 连接蓝牙设备的提示

你可能已经认为应该首先将蓝牙设备置于配对模式。这很关键。

之后，你可以尝试关闭然后再次打开蓝牙按钮，以便它搜索可用的设备。

如果它没有立即显示，你可以单击其他一些系统设置并再次返回蓝牙。过去它对我有用过几次，不要问为什么。

### 其他故障排除提示

以下是修复 Arch Linux 中蓝牙连接问题的更多提示：

#### 确保不堵塞

确保蓝牙未被阻止：

````

     rfkill list

````

检查输出：

```

    [abhishek@itsfoss ~]$ rfkill list
    0: hci0: Bluetooth
        Soft blocked: no
        Hard blocked: no
    1: phy0: Wireless LAN
        Soft blocked: no
        Hard blocked: no

```

如果你发现蓝牙被阻止，请使用以下命令取消阻止：

```

    rfkill unblock bluetooth

```

#### Pipewire 与 Pulseaudio

在某些情况下，如果你过去尝试过 Pipewire 和 Pulseaudio，它们可能会破坏游戏。

如果你使用 Pipewire，请确保安装了 pipeline-pulse：

````

      sudo pacman -Syu pipeline-pulse

````

如果你使用 Pulseaudio，`bluez` 和 `pulseaudio-bluetooth` 可以帮助你。

查看 Arch Wiki 页面以获取更多信息。

![][3]

### 这对你有用吗？

硬件兼容性问题是任何操作系统都会遇到的问题，Linux 也不例外。

事情没有单一的解决方案。你的系统可能存在与我的系统不同的问题，此处提到的建议可能适合你，也可能不适用于你。

完善的 Arch Wiki 提供的建议比我所能提供的要多得多。如果你仍然无法解决蓝牙问题，请执行此操作。

![][3]

现在交给你了。对你有用吗？ 如果有，是哪种方法？ 如果没有，你遇到了什么样的问题以及到目前为止你尝试过哪些故障排除方法？

--------------------------------------------------------------------------------

via: https://itsfoss.com/bluetooth-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=WksxVLrALhg
[2]: https://itsfoss.com/content/images/2023/11/bluetooth-working-arch-linux.png
[3]: https://wiki.archlinux.org/favicon.ico
