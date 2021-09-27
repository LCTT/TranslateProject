[#]: subject: "Use this Linux command-line tool to learn more about your NVMe drives"
[#]: via: "https://opensource.com/article/21/9/nvme-cli"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13822-1.html"

使用 Linux 命令行工具来了解你的 NVMe 驱动器
======

> nvme-cli 命令拥有诸多实用的选项，且它是控制和管理数据一种很好的方式。

![](https://img.linux.net.cn/data/attachment/album/202109/26/102441ux8cy36gy1vggykz.jpg)

NVMe 是指<ruby>非易失性内存规范<rt>Non-Volatile Memory Express</rt></ruby>，它规范了软件和存储通过 PCIe 和其他协议（包括 TCP）进行通信的方式。它是由非营利组织领导的 [开放规范][2]，并定义了几种形式的固态存储。

我的笔记本电脑有一个 NVMe 驱动器，我的台式机也有。而且它们的速度很快。我喜欢我的电脑启动的速度，以及它们读写数据的速度。几乎没有延迟。

没过多久，我就对驱动这种超高速存储的技术产生了好奇，所以我做了一些调查。我了解到，NVMe 驱动器消耗的电力更少，而提供的数据访问速度甚至比 SATA 的 SSD 驱动器快得多。这很有趣，但我想知道更多关于我的特定 NVMe 驱动器的信息，我想知道它们与其他驱动器有何区别。我可以安全地擦除驱动器吗？我怎样才能检查它的完整性？

带着这些问题我在互联网上搜索，发现了一个开源项目，其中有一系列管理 NVMe 驱动器的工具。它被称为 [nvme-cli][3]。

### 安装 nvme-cli

你可以从你的发行版的包管理器中安装 `nvme-cli`。例如，在 Fedora、CentOS 或类似系统上：

```
$ sudo dnf install nvme-cli
```

在 Debian、Mint、Elementary 和类似系统上:

```
$ sudo apt install nvme-cli
```

### 探索 NVMe 驱动器

在安装 `nvme-cli` 后，我想探索我的驱动器。`nvme-cli` 没有手册页，但你可以通过输入 `nvme help` 获得很多帮助：

```
$ nvme help
nvme-1.14
usage: nvme <command> [<device>] [<args>]

The '<device>' may be either an NVMe character device (ex: /dev/nvme0) or an
nvme block device (ex: /dev/nvme0n1).

The following are all implemented sub-commands:
 list List all NVMe devices and namespaces on machine
 list-subsys List nvme subsystems
 id-ctrl Send NVMe Identify Controller
 id-ns Send NVMe Identify Namespace, display structure
 id-ns-granularity Send NVMe Identify Namespace Granularity List, display structure
 list-ns Send NVMe Identify List, display structure
 list-ctrl Send NVMe Identify Controller List, display structure
 nvm-id-ctrl Send NVMe Identify Controller NVM Command Set, display structure
 primary-ctrl-caps Send NVMe Identify Primary Controller Capabilities
[...]
```

### 列出所有的 NVMe 驱动器

`sudo nvme list` 命令列出你机器上所有的 NVMe 设备和命名空间。我用它在 `/dev/nvme0n1` 找到了一个 NVMe 驱动器。下面是命令输出结果：


```
$ sudo nvme list

Node SN Model Namespace Usage Format FW Rev

--------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------

/dev/nvme0n1    S42GMY9M141281 SAMSUNG MZVLB256HAHQ-000L7 1

214.68 GB / 256.06 GB 512  B + 0 B 0L2QEXD7
```

我有一个名为 `nvme0n1` 的驱动器。它列出了序列号、品牌、容量、固件版本等等。

通过使用 `id-ctrl` 子命令，你可以得到更多关于该硬盘和它所支持的特性的信息：

```
$ sudo nvme id-ctrl /dev/nvme0n1
NVME Identify Controller:
vid : 0x144d
ssvid : 0x144d
sn : S42GMY9M141281
mn : SAMSUNG MZVLB256HAHQ-000L7
fr : 0L2QEXD7
rab : 2
ieee : 002538
cmic : 0
mdts : 9
cntlid : 0x4
ver : 0x10200
rtd3r : 0x186a0
rtd3e : 0x7a1200
[...]
```

### 驱动器健康

你可以通过 `smart-log` 子命令来了解硬盘的整体健康状况：

```
$ sudo nvme smart-log /dev/nvme0n1
Smart Log for NVME device:nvme0n1 namespace-id:ffffffff
critical_warning : 0
temperature : 21 C
available_spare : 100%
available_spare_threshold : 10%
percentage_used : 2%
endurance group critical warning summary: 0
data_units_read : 5,749,452
data_units_written : 10,602,948
host_read_commands : 77,809,121
host_write_commands : 153,405,213
controller_busy_time : 756
power_cycles : 1,719
power_on_hours : 1,311
unsafe_shutdowns : 129
media_errors : 0
num_err_log_entries : 1,243
Warning Temperature Time : 0
Critical Composite Temperature Time : 0
Temperature Sensor 1 : 21 C
Temperature Sensor 2 : 22 C
Thermal Management T1 Trans Count : 0
Thermal Management T2 Trans Count : 0
Thermal Management T1 Total Time : 0
Thermal Management T2 Total Time : 0
```

这为你提供了硬盘的当前温度、到目前为止的使用时间、不安全的关机次数等等。

### 格式化一个 NVMe 驱动器

你可以用 `nvme-cli` 格式化一个 NVMe 驱动器，但要注意。这将删除驱动器上的所有数据！如果你的硬盘上有重要的数据，你必须在这样做之前将其备份，否则你**将会**丢失数据。子命令是 `format`：

```
$ sudo nvme format /dev/nvme0nX
```

（为了安全起见，我用 `X` 替换了驱动器的实际位置，以防止复制粘贴的错误。将 `X` 改为 `1` 或 `nvme list` 结果中列出的实际位置。）

### 安全地擦除 NVMe 驱动器

当你准备出售或处理你的 NVMe 电脑时，你可能想安全地擦除驱动器。这里的警告与格式化过程中的警告相同。首先要备份重要的数据，因为这个命令会删除这些数据！

```
$ sudo nvme sanitize /dev/nvme0nX
```

### 尝试 nvme-cli

`nvme-cli` 命令是在 [GPLv2][4] 许可下发布的。它是一个强大的命令，有很多有用的选项，用来有效地控制和管理数据。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/nvme-cli

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://nvmexpress.org/
[3]: https://github.com/linux-nvme/nvme-cli
[4]: https://github.com/linux-nvme/nvme-cli/blob/master/LICENSE
