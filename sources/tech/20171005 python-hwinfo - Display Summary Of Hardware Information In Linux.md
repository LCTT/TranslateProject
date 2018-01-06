python-hwinfo : Display Summary Of Hardware Information In Linux
======
Till the date, we have covered most of the utilities which discover Linux system hardware information & configuration but still there are plenty of commands available for the same purpose.

In that, some of the utilities are display detailed information about all the hardware components and reset will shows only specific device information.

In this series, today we are going to discuss about [python-hwinfo][1], it is one of the tool that display summary of hardware information and it's configuration in the neat way.

### What's python-hwinfo

This is a python library for inspecting hardware and devices by parsing the outputs of system utilities such as lspci and dmidecode.

It's offering a simple CLI toll which can be used for inspect local, remote and captured hosts. Run the command with sudo to get maximum information.

Additionally you can execute this on remote server by providing a Server IP or Host name, username, and password. Also you can use this tool to view other utilities captured outputs like demidecode as 'dmidecode.out', /proc/cpuinfo as 'cpuinfo', lspci -nnm as 'lspci-nnm.out', etc,.

**Suggested Read :**
**(#)** [inxi - A Great Tool to Check Hardware Information on Linux][2]
**(#)** [Dmidecode - Easy Way To Get Linux System Hardware Information][3]
**(#)** [LSHW (Hardware Lister) - A Nifty Tool To Get A Hardware Information On Linux][4]
**(#)** [hwinfo (Hardware Info) - A Nifty Tool To Detect System Hardware Information On Linux][5]
**(#)** [How To Use lspci, lsscsi, lsusb, And lsblk To Get Linux System Devices Information][6]

### How to Install python-hwinfo in Linux

It can be installed through pip package to all major Linux distributions. In order to install python-hwinfo, Make sure your system have python and python-pip packages as a prerequisites.

pip is a python module bundled with setuptools, it's one of the recommended tool for installing Python packages in Linux.

For **`Debian/Ubuntu`** , use [APT-GET Command][7] or [APT Command][8] to install pip.
```
$ sudo apt install python-pip

```

For **`RHEL/CentOS`** , use [YUM Command][9] to install pip.
```
$ sudo yum install python-pip python-devel

```

For **`Fedora`** , use [DNF Command][10] to install pip.
```
$ sudo dnf install python-pip

```

For **`Arch Linux`** , use [Pacman Command][11] to install pip.
```
$ sudo pacman -S python-pip

```

For **`openSUSE`** , use [Zypper Command][12] to install pip.
```
$ sudo zypper python-pip

```

Finally, Run the following pip command to install python-hwinfo.
```
$ sudo pip install python-hwinfo

```

### How to Use python-hwinfo in local machine

Execute the following command to inspect the hardware present on a local machine. The output is much clear and neat which i didn't see in any other commands.

It's categorized the output in five classes.

  * **`Bios Info:`** It 's contains bios_vendor_name, system_product_name, system_serial_number, system_uuid, system_manufacturer, bios_release_date, and bios_version
  * **`CPU Info:`** It 's display no of processor, vendor_id, cpu_family, model, stepping, model_name, and cpu_mhz
  * **`Ethernet Controller Info:`** It 's shows device_bus_id, vendor_name, vendor_id, device_name, device_id, subvendor_name, subvendor_id, subdevice_name, and subdevice_id
  * **`Storage Controller Info:`** It 's shows vendor_name, vendor_id, device_name, device_id, subvendor_name, subvendor_id, subdevice_name, and subdevice_id
  * **`GPU Info:`** It 's shows vendor_name, vendor_id, device_name, device_id, subvendor_name, subvendor_id, subdevice_name, and subdevice_id


```
$ sudo hwinfo

Bios Info:

+----------------------|--------------------------------------+
| Key | Value |
+----------------------|--------------------------------------+
| bios_vendor_name | IBM |
| system_product_name | System x3550 M3: -[6102AF1]- |
| system_serial_number | RS2IY21 |
| chassis_type | Rack Mount Chassis |
| system_uuid | 4C4C4544-0051-3210-8052-B2C04F323132 |
| system_manufacturer | IBM |
| socket_count | 2 |
| bios_release_date | 10/21/2014 |
| bios_version | -[VLS211TSU-2.51]- |
| socket_designation | Socket 1, Socket 2 |
+----------------------|--------------------------------------+

CPU Info:

+-----------|--------------|------------|-------|----------|------------------------------------------|----------+
| processor | vendor_id | cpu_family | model | stepping | model_name | cpu_mhz |
+-----------|--------------|------------|-------|----------|------------------------------------------|----------+
| 0 | GenuineIntel | 6 | 45 | 7 | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
| 1 | GenuineIntel | 6 | 45 | 7 | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
| 2 | GenuineIntel | 6 | 45 | 7 | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
| 3 | GenuineIntel | 6 | 45 | 7 | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
| 4 | GenuineIntel | 6 | 45 | 7 | Intel(R) Xeon(R) CPU E5-2650 0 @ 2.00GHz | 1200.000 |
+-----------|--------------|------------|-------|----------|------------------------------------------|----------+

Ethernet Controller Info:

+-------------------|-----------|---------------------------------|-----------|-------------------|--------------|---------------------------------|--------------+
| vendor_name | vendor_id | device_name | device_id | subvendor_name | subvendor_id | subdevice_name | subdevice_id |
+-------------------|-----------|---------------------------------|-----------|-------------------|--------------|---------------------------------|--------------+
| Intel Corporation | 8086 | I350 Gigabit Network Connection | 1521 | Intel Corporation | 8086 | I350 Gigabit Network Connection | 1521 |
+-------------------|-----------|---------------------------------|-----------|-------------------|--------------|---------------------------------|--------------+

Storage Controller Info:

+-------------------|-----------|----------------------------------------------|-----------|----------------|--------------|----------------|--------------+
| vendor_name | vendor_id | device_name | device_id | subvendor_name | subvendor_id | subdevice_name | subdevice_id |
+-------------------|-----------|----------------------------------------------|-----------|----------------|--------------|----------------|--------------+
| Intel Corporation | 8086 | C600/X79 series chipset IDE-r Controller | 1d3c | Dell | 1028 | [Device 05d2] | 05d2 |
| Intel Corporation | 8086 | C600/X79 series chipset SATA RAID Controller | 2826 | Dell | 1028 | [Device 05d2] | 05d2 |
+-------------------|-----------|----------------------------------------------|-----------|----------------|--------------|----------------|--------------+

GPU Info:

+--------------------|-----------|-----------------------|-----------|--------------------|--------------|----------------|--------------+
| vendor_name | vendor_id | device_name | device_id | subvendor_name | subvendor_id | subdevice_name | subdevice_id |
+--------------------|-----------|-----------------------|-----------|--------------------|--------------|----------------|--------------+
| NVIDIA Corporation | 10de | GK107GL [Quadro K600] | 0ffa | NVIDIA Corporation | 10de | [Device 094b] | 094b |
+--------------------|-----------|-----------------------|-----------|--------------------|--------------|----------------|--------------+

```

### How to Use python-hwinfo in remote machine

Execute the following command to inspect the hardware present on a remote machine which required remote server IP, username, and password.
```
$ hwinfo -m x.x.x.x -u root -p password

```

### How to Use python-hwinfo to read captured outputs

Execute the following command to inspect the hardware present on a local machine. The output is much clear and neat which i didn't see in any other commands.
```
$ hwinfo -f [Path to file]

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/python-hwinfo-check-display-system-hardware-configuration-information-linux/

作者：[2DAYGEEK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://github.com/rdobson/python-hwinfo
[2]:https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
[3]:https://www.2daygeek.com/dmidecode-get-print-display-check-linux-system-hardware-information/
[4]:https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[5]:https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
[6]:https://www.2daygeek.com/check-system-hardware-devices-bus-information-lspci-lsscsi-lsusb-lsblk-linux/
[7]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[8]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[9]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[10]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[11]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[12]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
