[#]: subject: "Use this Linux command-line tool to learn more about your NVMe drives"
[#]: via: "https://opensource.com/article/21/9/nvme-cli"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use this Linux command-line tool to learn more about your NVMe drives
======
The nvme-cli command has lots of useful options, and it's a great way to
take control of how you manage your data.
![Command line prompt][1]

NVMe stands for _Non-Volatile Memory Express_, and it refers to how software and storage communicate across PCIe and other protocols, including TCP. It's an [open specification][2] led by a non-profit organization and defines several forms of solid-state storage.

My laptop has an NVMe drive, as does my desktop. And they're fast. I love how quickly my computers boot and how quickly they're able to read and write data. There's no perceptible delay.

It also didn't take long for me to get curious about the technology driving this ultra-fast storage, so I did a little investigation. I learned that NVMe drives consume less power while delivering much faster access to data compared to even SSD drives over SATA. That was interesting, but I wanted to know more about my particular NVMe drives, and I wanted to know how they compared with other drives. Could I securely erase the drive? How could I check its integrity?

Those questions led me to an Internet search that yielded an open source project with a collection of tools to manage NVMe drives. It's called [nvme-cli][3].

### Install nvme-cli

You can install `nvme-cli` from your distribution's package manager. For instance, on Fedora, CentOS, or similar:


```
`$ sudo dnf install nvme-cli`
```

On Debian, Mint, Elementary, and similar:


```
`$ sudo apt install nvme-cli`
```

### Exploring an NVMe drive

After installing `nvme-cli` for my distribution, I wanted to explore my drive. There's no man page for `nvme-cli`, but you can get lots of help by entering `nvme help`:


```
$ nvme help
nvme-1.14
usage: nvme &lt;command&gt; [&lt;device&gt;] [&lt;args&gt;]

The '&lt;device&gt;' may be either an NVMe character device (ex: /dev/nvme0) or an
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

### List all NVMe drives

The `sudo nvme list` command lists all NVMe devices and namespaces on your machine. I used it and found an NVMe drive at `/dev/nvme0n1`. Here is the output:


```
$ sudo nvme list

Node SN Model Namespace Usage Format FW Rev

\--------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------

/dev/nvme0n1    S42GMY9M141281 SAMSUNG MZVLB256HAHQ-000L7 1

214.68 GB / 256.06 GB 512  B + 0 B 0L2QEXD7
```

I have a drive called `nvme0n1`. It lists the serial number, brand, size, firmware revision, and so on.

You can get even more information about the drive and the features it supports by using the `id-ctrl` subcommand:


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

### Drive health

You can read about the overall health of a drive with the `smart-log` subcommand:


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

This provides you with the drive's current temperature, the hours of use it's had so far, how many times it was unsafely shut down, and so on.

### Formatting an NVMe drive

You can format an NVMe drive with `nvme-cli`, but beware: This erases all of the data on the drive! If there's important data on your drive, you _must_ back it up before doing this, or else you **will** lose data. The subcommand is `format`:


```
`$ sudo nvme format /dev/nvme0nX`
```

(For safety, I've replaced the actual location of the drive with **X** to prevent copy-paste mishaps. Change the **X** to **1** or the appropriate location as listed in the results of `nvme list`.)

### Securely erasing an NVMe drive

When you get ready to sell or dispose of your NVMe computer, you probably want to erase the drive securely. The same warnings apply here as with the format process: Back up important data first because this command erases it!


```
`$ sudo nvme sanitize /dev/nvme0nX`
```

### Try nvme-cli

The `nvme-cli` command is released under a [GPLv2][4] license. It's a robust command with lots of useful options, and it's a great way to take control of how you manage your data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/nvme-cli

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://nvmexpress.org/
[3]: https://github.com/linux-nvme/nvme-cli
[4]: https://github.com/linux-nvme/nvme-cli/blob/master/LICENSE
