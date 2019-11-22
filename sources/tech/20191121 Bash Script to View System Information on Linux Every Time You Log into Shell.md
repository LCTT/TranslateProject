[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to View System Information on Linux Every Time You Log into Shell)
[#]: via: (https://www.2daygeek.com/bash-shell-script-view-linux-system-information/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to View System Information on Linux Every Time You Log into Shell
======

There are several commands in Linux to obtain system information such as processor information, manufacturer name, and serial number, etc,.

You may need to run several commands to collect this information.

Also, it is very difficult to remember all the commands and their options.

Instead you can write a **[shell script][1]** to customize the output based on your needs.

In the past we have written many **[bash scripts][2]** for a variety of purposes.

Today, we came up with a new shell script, which shows you the required system information every time you log into the shell.

There are six parts to this script, and more details below.

  * **Part-1:** General System Information
  * **Part-2:** CPU/Memory Current Usage
  * **Part-3:** Disk Usage &gt;80%
  * **Part-4:** List System WWN Details
  * **Part-5:** Oracle DB Instances
  * **Part-6:** Available Package Updates



We’ve added potential information to each area based on our needs. You can further customize this script to your needs if you wish.

There are many tools for this, most of which we have already covered.

To read them, go to the following articles.

  * **[inxi – A Great Tool to Check Hardware Information on Linux][3]**
  * **[Dmidecode – Easy Way To Get Linux System Hardware Information][3]**
  * **[LSHW (Hardware Lister) – A Nifty Tool To Get A Hardware Information On Linux][3]**
  * **[hwinfo (Hardware Info) – A Nifty Tool To Detect System Hardware Information On Linux][3]**
  * **[python-hwinfo : Display Summary Of Hardware Information Using Standard Linux Utilities][3]**
  * **[How To Use lspci, lsscsi, lsusb, And lsblk To Get Linux System Devices Information][3]**
  * **[How To Check System Hardware Manufacturer, Model And Serial Number In Linux][3]**
  * **[How To Find WWN, WWNN and WWPN Number Of HBA Card In Linux][3]**
  * **[How to check HP iLO Firmware version from Linux command line][3]**
  * **[How to check Wireless network card and WiFi information from Linux Command Line][3]**
  * **[How to check CPU &amp; Hard Disk temperature on Linux][3]**
  * **[Hegemon – A modular System &amp; Hardware monitoring tool for Linux][3]**
  * **[How to Check System Configuration and Hardware Information on Linux][3]**



If anyone wants to add any other information in the script, please let us know your requirements in the comment section so that we can help you.

### Bash Script to View System Information on Linux Every Time You Log into the Shell

This basic script will bring the system information to your terminal whenever you log into the shell.

```
#vi /opt/scripts/system-info.sh

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
vserver=$(lscpu | grep vendor | wc -l)
if [ $vserver -gt 0 ]
then
echo "$(hostname) is a VM"
else
systool -c fc_host -v | egrep "(Class Device path | port_name |port_state)" > systool.out
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

Once the above script is added to a file. Set the executable permission for the “system-info.sh” file.

```
# chmod +x ~root/system-info.sh
```

When the script is ready, add the file path at the end of the “.bash_profile” file in RHEL-based systems CentOS, Oracle Linux and Fedora.

```
# echo "/root/system-info.sh" >> ~root/.bash_profile
```

To take this change effect, run the following command.

```
# source ~root/.bash_profile
```

For Debian-based systems, you may need to add a file path to the “.profile” file.

```
# echo "/root/system-info.sh" >> ~root/.profile
```

Run the following command to take this change effect.

```
# source ~root/.profile
```

You may have seen an output like the one below when running the above “source” command.

From next time on-wards, you will get this information every time you log into the shell.

Alternatively, you can manually run this script at any time if you need to.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/category/bash-script/
[3]: https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
