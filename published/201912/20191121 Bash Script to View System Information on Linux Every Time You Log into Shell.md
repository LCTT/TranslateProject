[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11645-1.html"
[#]: subject: "Bash Script to View System Information on Linux Every Time You Log into Shell"
[#]: via: "https://www.2daygeek.com/bash-shell-script-view-linux-system-information/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

Bash 脚本实现每次登录到 Shell 时可以查看 Linux 系统信息
======

Linux 中有很多可以查看系统信息如处理器信息、生产商名字、序列号等的命令。你可能需要执行多个命令来收集这些信息。同时，记住所有的命令和他们的选项也是有难度。 

你可以写一个 [shell 脚本](https://www.2daygeek.com/category/shell-script/) 基于你的需求来自定义显示的信息。

以前我们出于不同的目的需要写很多个 [bash 脚本](https://www.2daygeek.com/category/bash-script/)。

现在我们写一个新的 shell 脚本，在每次登录到 shell 时显示需要的系统信息。

这个j脚本有 6 部分，细节如下：

1. 通用系统信息
2. CPU/内存当前使用情况
3. 硬盘使用率超过 80%
4. 列出系统 WWN 详情
5. Oracle DB 实例
6. 可更新的包

我们已经基于我们的需求把可能需要到的信息加到了每个部分。之后你可以基于自己的意愿修改这个脚本。

这个j脚本需要用到很多工具，其中大部分我们之前已经涉及到了。

你可以参照以前文章，了解工具详情。

* [inxi – 在 Linux 上检查硬件信息的绝佳工具][3]
* [Dmidecode – 获取 Linux 系统硬件信息的简便方法][4]
* [LSHW（硬件列表程序）– 在 Linux 上获取硬件信息的漂亮工具][5]
* [hwinfo（硬件信息）– 在 Linux 上检测系统硬件信息的漂亮工具][6]
* [python-hwinfo：使用标准 Linux 实用工具显示硬件信息摘要][7]
* [如何使用 lspci、lsscsi、lsusb 和 lsblk 获取 Linux 系统设备信息][8]
* [如何在 Linux 中检查系统硬件制造商、型号和序列号][9]
* [如何在 Linux 中查找 HBA 卡的 WWN、WWNN 和 WWPN 号][10]
* [如何从 Linux 命令行检查 HP iLO 固件版本][11]
* [如何从 Linux 命令行检查无线网卡和 WiFi 信息][12]
* [如何在 Linux 上检查 CPU 和硬盘温度][13]
* [Hegemon – Linux 的模块化系统和硬件监视工具][14]
* [如何在 Linux 上检查系统配置和硬件信息][15]

如果你想为这个脚本增加其他的信息，请在评论去留下你的需求，以便我们帮助你。

### Bash 脚本实现每次登录到 Shell 时可以查看 Linux 系统信息

这个脚本会在你每次登录 shell 时把系统信息打印到 terminal。

```
# vi /opt/scripts/system-info.sh
```

```
#!/bin/bash
echo -e "-------------------------------System Information----------------------------"
echo -e "Hostname:\t\t"`hostname`
echo -e "uptime:\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//'`
echo -e "Manufacturer:\t\t"`cat /sys/class/dmi/id/chassis_vendor`
echo -e "Product Name:\t\t"`cat /sys/class/dmi/id/product_name`
echo -e "Version:\t\t"`cat /sys/class/dmi/id/product_version`
echo -e "Serial Number:\t\t"`cat /sys/class/dmi/id/product_serial`
echo -e "Machine Type:\t\t"`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi`
echo -e "Operating System:\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "Kernel:\t\t\t"`uname -r`
echo -e "Architecture:\t\t"`arch`
echo -e "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
echo -e "Active User:\t\t"`w | cut -d ' ' -f1 | grep -v USER | xargs -n1`
echo -e "System Main IP:\t\t"`hostname -I`
echo ""
echo -e "-------------------------------CPU/Memory Usage------------------------------"
echo -e "Memory Usage:\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
echo -e "Swap Usage:\t"`free | awk '/Swap/{printf("%.2f%"), $3/$2*100}'`
echo -e "CPU Usage:\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo ""
echo -e "-------------------------------Disk Usage >80%-------------------------------"
df -Ph | sed s/%//g | awk '{ if($5 > 80) print $0;}'
echo ""

echo -e "-------------------------------For WWN Details-------------------------------"
vserver=$(lscpu | grep Hypervisor | wc -l)
if [ $vserver -gt 0 ]
then
echo "$(hostname) is a VM"
else
cat /sys/class/fc_host/host?/port_name
fi
echo ""

echo -e "-------------------------------Oracle DB Instances---------------------------"
if id oracle >/dev/null 2>&1; then
/bin/ps -ef|grep pmon
then
else
echo "oracle user does not exist on $(hostname)"
fi
echo ""

if (( $(cat /etc/*-release | grep -w "Oracle|Red Hat|CentOS|Fedora" | wc -l) > 0 ))
then
echo -e "-------------------------------Package Updates-------------------------------"
yum updateinfo summary | grep 'Security|Bugfix|Enhancement'
echo -e "-----------------------------------------------------------------------------"
else
echo -e "-------------------------------Package Updates-------------------------------"
cat /var/lib/update-notifier/updates-available
echo -e "-----------------------------------------------------------------------------"
fi
```

把上面脚本内容保存到一个文件 `system-info.sh`，之后添加可执行权限：

```
# chmod +x ~root/system-info.sh
```

当脚本准备好后，把脚本文件的路径加到 `.bash_profile` 文件末尾（红帽系列的系统：CentOS、Oracle Linux 和 Fedora）：

```
# echo "/root/system-info.sh" >> ~root/.bash_profile
```

执行以下命令，来让修改的内容生效：

```
# source ~root/.bash_profile
```

对于 Debian 系统的系统，你可能需要把文件路径加到 `.profile` 文件中：

```
# echo "/root/system-info.sh" >> ~root/.profile
```

运行以下命令使修改生效：

```
# source ~root/.profile
```

你以前运行上面 `source` 命令时可能见过类似下面的输出。从下次开始，你在每次登录 shell 时会看到这些信息。当然，如果有必要你也可以随时手动执行这个脚本。

```
-------------------------------System Information---------------------------
Hostname:            daygeek-Y700
uptime:              1:20 1
Manufacturer:        LENOVO
Product Name:        80NV
Version:             Lenovo ideapad Y700-15ISK
Serial Number:       AA0CMRN1
Machine Type:        Physical
Operating System:    Manjaro Linux
Kernel:              4.19.80-1-MANJARO
Architecture:        x86_64
Processor Name:      Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz
Active User:         daygeek renu thanu
System Main IP:      192.168.1.6 192.168.122.1

-------------------------------CPU/Memory Usage------------------------------
Memory Usage:     37.28%
Swap Usage:       0.00%
CPU Usage:        15.43%

-------------------------------Disk Usage >80%-------------------------------
Filesystem      Size  Used Avail Use Mounted on
/dev/nvme0n1p1  217G  202G  4.6G  98 /
/dev/loop0      109M  109M     0 100 /var/lib/snapd/snap/odrive-unofficial/2
/dev/loop1       91M   91M     0 100 /var/lib/snapd/snap/core/6405
/dev/loop2       90M   90M     0 100 /var/lib/snapd/snap/core/7713

-------------------------------For WWN Details-------------------------------
CentOS8.2daygeek.com is a VM

-------------------------------Oracle DB Instances---------------------------
oracle user does not exist on CentOS8.2daygeek.com

-------------------------------Package Updates-------------------------------
    13 Security notice(s)
         9 Important Security notice(s)
         3 Moderate Security notice(s)
         1 Low Security notice(s)
    35 Bugfix notice(s)
     1 Enhancement notice(s)
-----------------------------------------------------------------------------
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-shell-script-view-linux-system-information/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/category/bash-script/
[3]: https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
[4]: https://www.2daygeek.com/dmidecode-get-print-display-check-linux-system-hardware-information/
[5]: https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[6]: https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
[7]: https://www.2daygeek.com/python-hwinfo-check-display-system-hardware-configuration-information-linux/
[8]: https://www.2daygeek.com/check-system-hardware-devices-bus-information-lspci-lsscsi-lsusb-lsblk-linux/
[9]: https://www.2daygeek.com/how-to-check-system-hardware-manufacturer-model-and-serial-number-in-linux/
[10]: https://www.2daygeek.com/how-to-find-wwn-wwnn-and-wwpn-number-of-hba-card-in-linux/
[11]: https://www.2daygeek.com/how-to-check-hp-ilo-firmware-version-from-linux-command-line/
[12]: https://www.2daygeek.com/linux-find-out-wireless-network-wifi-speed-signal-strength-quality/
[13]: https://www.2daygeek.com/view-check-cpu-hard-disk-temperature-linux/
[14]: https://www.2daygeek.com/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux/
[15]: https://www.2daygeek.com/check-linux-hardware-information-system-configuration/
