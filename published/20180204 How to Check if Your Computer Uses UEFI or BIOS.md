如何检查你的计算机使用的是 UEFI 还是 BIOS
======

**简介：这是一个快速的教程，来告诉你的系统使用的是现代 UEFI 或者传统 BIOS。同时提供 Windows 和 Linux 的说明。**

当你尝试[双启动 Linux 和 Windows][1] 时，你需要知道系统上是否有 UEFI 或 BIOS 启动模式。它可以帮助你决定安装 Linux 的分区。

我不打算在这里讨论[什么是 BIOS][2]。不过，我想通过 BIOS 告诉你一些 [UEFI][3] 的优点。

UEFI 即（<ruby>统一可扩展固件接口<rt>Unified Extensible Firmware Interface</rt></ruby>）旨在克服 BIOS 的某些限制。它增加了使用大于 2TB 磁盘的能力，并具有独立于 CPU 的体系结构和驱动程序。采用模块化设计，即使没有安装操作系统，也可以支持远程诊断和修复，以及灵活的无操作系统环境（包括网络功能）。

### UEFI 优于 BIOS 的地方

  * UEFI 在初始化硬件时速度更快。
  * 提供安全启动，这意味着你在加载操作系统之前加载的所有内容都必须签名。这为你的系统提供了额外的保护层。
  * BIOS 不支持超过 2TB 的分区。
  * 最重要的是，如果你是双引导，那么建议始终在相同的引导模式下安装两个操作系统。

![How to check if system has UEFI or BIOS][4]

如果试图查看你的系统运行的是 UEFI 还是 BIOS，这并不难。首先让我从 Windows 开始，然后看看如何在 Linux 系统上查看用的是 UEFI 还是 BIOS。

### 在 Windows 中检查使用的是 UEFI 还是 BIOS

在 Windows 中，在“开始”面板中的“系统信息”中，在 BIOS 模式下，可以找到启动模式。如果它显示的是 Legacy，那么你的系统是 BIOS。如果显示 UEFI，那么它是 UEFI。

![][5]

**另一个方法**：如果你使用 Windows 10，可以打开文件资源管理器并进入到  `C:\Windows\Panther` 来查看你使用的是 UEFI 还是 BIOS。打开文件 setupact.log 并搜索下面的字符串。

```
Detected boot environment
```

我建议在 notepad++ 中打开这个文件，因为这是一个很大的文件，记事本很可能挂起（至少它对我来说是 6GB ！）。

你会看到几行有用的信息。

```
2017-11-27 09:11:31, Info IBS Callback_BootEnvironmentDetect:FirmwareType 1.
2017-11-27 09:11:31, Info IBS Callback_BootEnvironmentDetect: Detected boot environment: BIOS
```

### 在 Linux 中检查使用的是 UEFI 还是 BIOS

最简单地找出使用的是 UEFI 还是 BIOS 的方法是查找 `/sys/firmware/efi` 文件夹。如果使用的 BIOS 那么该文件夹不存在。

![Find if system uses UEFI or BIOS on Ubuntu Linux][6]

**另一种方法**：安装名为 efibootmgr 的软件包。

在基于 Debian 和 Ubuntu 的发行版中，你可以使用以下命令安装 efibootmgr 包：

```
sudo apt install efibootmgr
```

完成后，输入以下命令：

```
sudo efibootmgr
```

如果你的系统支持 UEFI，它会输出不同的变量。如果没有，你将看到一条消息指出 EFI 变量不支持。

![][7]

### 最后的话

查看你的系统使用的是 UEFI 还是 BIOS 很容易。一方面，像快速和安全的引导为 UEFI 提供了优势，如果你使用的是 BIOS 也不必担心太多，除非你打算使用 2TB 硬盘。

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-uefi-or-bios/

作者：[Ambarish Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[2]:https://www.lifewire.com/bios-basic-input-output-system-2625820
[3]:https://www.howtogeek.com/56958/htg-explains-how-uefi-will-replace-the-bios/
[4]:https://itsfoss.com/wp-content/uploads/2018/02/uefi-or-bios-800x450.png
[5]:https://itsfoss.com/wp-content/uploads/2018/01/BIOS-800x491.png
[6]:https://itsfoss.com/wp-content/uploads/2018/02/uefi-bios.png
[7]:https://itsfoss.com/wp-content/uploads/2018/01/bootmanager.jpg
