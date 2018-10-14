如何在 Linux 中查看系统硬件制造商、型号和序列号
======

对于 Linux 图形界面用户和 Windows 用户来说获取系统硬件信息都不算问题，但是对命令行用户来说想要获取这些细节时有点儿麻烦。

甚至我们中的大多数都不知道获取这些信息最好的命令是什么。Linux 中有许多可用的工具集来获取诸如制造商、型号和序列号等硬件信息。

在这里我尝试写下获取这些细节的可能的方式，你可以挑选一种最好用的。

你必须知道所有这些信息，因为当你向硬件制造商提交任何硬件问题时，你会需要它们。

这可以通过 6 种方法来实现，下面我来演示一下怎么做。

### 方法一：使用 dmidecode 命令

`dmidecode` 是一个读取电脑 DMI（<ruby>桌面管理接口<rt>Desktop Management Interface</rt></ruby>）表内容并且以人类可读的格式显示系统硬件信息的工具。（也有人说是读取 SMBIOS —— <ruby>系统管理 BIOS<rt>System Management BIOS</rt></ruby>）

这个表包含系统硬件组件的说明，也包含如序列号、制造商、发布日期以及 BIOS 修订版本号等其它有用的信息。

DMI 表不仅描述了当前的系统构成，还可以报告可能的升级信息（比如可以支持的最快的 CPU 或者最大的内存容量）。

这将有助于分析你的硬件兼容性，比如是否支持最新版本的程序。

```
# dmidecode -t system

# dmidecode 2.12
# SMBIOS entry point at 0x7e7bf000
SMBIOS 2.7 present.

Handle 0x0024, DMI type 1, 27 bytes
System Information
 Manufacturer: IBM
 Product Name: System x2530 M4: -[1214AC1]-
 Version: 0B
 Serial Number: MK2RL11
 UUID: 762A99BF-6916-450F-80A6-B2E9E78FC9A1
 Wake-up Type: Power Switch
 SKU Number: Not Specified
 Family: System X

Handle 0x004B, DMI type 12, 5 bytes
System Configuration Options
 Option 1: JP20 pin1-2: TPM PP Disable, pin2-3: TPM PP Enable

Handle 0x004D, DMI type 32, 20 bytes
System Boot Information
 Status: No errors detected
```

**推荐阅读：** [Dmidecode –– 获取 Linux 系统硬件信息的简单方式][1]

### 方法二：使用 inxi 命令

`inxi` 是 Linux 上查看硬件信息的一个灵巧的小工具，它提供了大量的选项来获取所有硬件信息，这是我在现有的其它 Linux 工具集里所没见到过的。它是从 locsmif 编写的古老的但至今看来都异常灵活的 `infobash` fork 出来的。

`inxi` 是一个可以快速显示系统硬件、CPU、驱动、Xorg、桌面、内核、GCC 版本、进程、内存使用以及大量其它有用信息的脚本，也可以用来做技术支持和调试工具。

```
# inxi -M
Machine: Device: server System: IBM product: N/A v: 0B serial: MK2RL11
 Mobo: IBM model: 00Y8494 serial: 37M17D UEFI: IBM v: -[VVE134MUS-1.50]- date: 08/30/2013
```

**推荐阅读：** [inxi —— 一个很棒的查看 Linux 硬件信息的工具][2]

### 方法三：使用 lshw 命令

`lshw`（指<ruby>硬件监听器<rt>Hardware Lister</rt></ruby>）是一个小巧灵活的工具，可以生成如内存配置、固件版本、主板配置、CPU 版本和速度、缓存配置、USB、网卡、显卡、多媒体、打印机以及总线速度等机器中各种硬件组件的详细报告。

它通过读取 `/proc` 目录下各种文件的内容和 DMI 表来生成硬件信息。

`lshw` 必须以超级用户的权限运行来检测完整的硬件信息，否则它只汇报部分信息。`lshw` 里有一个叫做 `class` 的特殊选项，它可以以详细的模式显示特定的硬件信息。

```
# lshw -C system
enal-dbo01t
 description: Blade
 product: System x2530 M4: -[1214AC1]-
 vendor: IBM
 version: 0B
 serial: MK2RL11
 width: 64 bits
 capabilities: smbios-2.7 dmi-2.7 vsyscall32
 configuration: boot=normal chassis=enclosure family=System X uuid=762A99BF-6916-450F-80A6-B2E9E78FC9A1
```

**推荐阅读：** [LSHW (Hardware Lister) –– 获取 Linux 硬件信息的灵巧的小工具][3]

### 方法四：使用 /sys 文件系统

内核在 `/sys` 目录下的文件中公开了一些 DMI 信息。因此，我们可以通过如下方式运行 `grep` 命令来轻易地获取机器类型。

```
# grep "" /sys/class/dmi/id/[pbs]*
```

或者，可以使用 `cat` 命令仅打印出特定的详细信息。

```
# cat /sys/class/dmi/id/board_vendor
IBM

# cat /sys/class/dmi/id/product_name
System x2530 M4: -[1214AC1]-

# cat /sys/class/dmi/id/product_serial
MK2RL11

# cat /sys/class/dmi/id/bios_version
-[VVE134MUS-1.50]-
```

### 方法五：使用 dmesg 命令

`dmesg` 命令是在 Linux 上 `syslogd` 或 `klogd` 启动前用来记录内核消息（启动阶段的消息）的。它通过读取内核的环形缓冲区来获取数据。在排查问题或只是尝试获取系统硬件信息时，`dmesg` 非常有用。

```
# dmesg | grep -i DMI
DMI: System x2530 M4: -[1214AC1]-/00Y8494, BIOS -[VVE134MUS-1.50]- 08/30/2013
```

### 方法六：使用 hwinfo 命令

`hwinfo`（<ruby>硬件信息<rt>hardware information</rt></ruby>）是另一个很棒的工具，用于检测当前系统存的硬件，并以人类可读的方式显示各种硬件模块的详细信息。

它报告关于 CPU、内存、键盘、鼠标、显卡、声卡、存储、网络接口、磁盘、分区、BIOS 以及桥接器等信息。它可以比其它像 `lshw`、`dmidecode` 或 `inxi` 等工具显示更为详细的信息。

`hwinfo` 使用 libhd 库 `libhd.so` 来收集系统上的硬件信息。该工具是为 openSuse 特别设计的，后来其它发行版也将它包含在其官方仓库中。

```
# hwinfo | egrep "system.hardware.vendor|system.hardware.product"
 system.hardware.vendor = 'IBM'
 system.hardware.product = 'System x2530 M4: -[1214AC1]-'
```

**推荐阅读：** [hwinfo (Hardware Info) –– 一款灵活的检测 Linux 系统硬件信息的工具][4]

---

via: https://www.2daygeek.com/how-to-check-system-hardware-manufacturer-model-and-serial-number-in-linux/

作者：[VINOTH KUMAR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[icecoobe](https://github.com/icecoobe)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/vinoth/
[1]:https://www.2daygeek.com/dmidecode-get-print-display-check-linux-system-hardware-information/
[2]:https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
[3]:https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[4]:https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
