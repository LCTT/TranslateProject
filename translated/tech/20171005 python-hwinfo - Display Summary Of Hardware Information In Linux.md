# python-hwinfo：使用Linux系统工具展示硬件信息概况

---
到目前为止，获取Linux系统硬件信息和配置已经被大部分工具所涵盖，不过也有许多命令可用于相同目的。

而且，一些工具会显示所有硬件组成的详细信息，重置后，只显示特定设备的信息。

在这个系列中, 今天我们讨论一下关于[python-hwinfo][1]， 它是一个展示硬件信息概况和整洁配置的工具之一。

### 什么是python-hwinfo

这是一个通过解析系统工具（例如lspci和dmidecode）的输出，来检查硬件和设备的Python库。

它提供了一个简单的命令行工具，可以用来检查本地，远程和捕获到的主机。用sudo运行命令以获得最大的信息。

另外，你可以提供服务器IP或者主机名，用户名和密码，在远程的服务器上执行它。当然你也可以使用这个工具查看其它工具捕获的输出（例如demidecode输出的'dmidecode.out'，/proc/cpuinfo输出的'cpuinfo'，lspci -nnm输出的'lspci-nnm.out'）。

**建议阅读 :**
**(#)** [inxi - A Great Tool to Check Hardware Information on Linux][2]
**(#)** [Dmidecode - Easy Way To Get Linux System Hardware Information][3]
**(#)** [LSHW (Hardware Lister) - A Nifty Tool To Get A Hardware Information On Linux][4]
**(#)** [hwinfo (Hardware Info) - A Nifty Tool To Detect System Hardware Information On Linux][5]
**(#)** [How To Use lspci, lsscsi, lsusb, And lsblk To Get Linux System Devices Information][6]

### Linux上如何安装python-hwinfo

在绝大多数Linux发行版，都可以通过pip包安装。为了安装python-hwinfo， 确保你的系统已经有python和python-pip包作为先决条件。

pip是Python附带的一个包管理工具，在Linux上安装Python包的推荐工具之一。

在**`Debian/Ubuntu`**平台，使用[APT-GET 命令][7] 或者 [APT 命令][8] 安装pip。
```
$ sudo apt install python-pip

```

在**`RHEL/CentOS`**平台，使用[YUM 命令][9]安装pip。
```
$ sudo yum install python-pip python-devel

```

在**`Fedora`**平台，使用[DNF 命令][10]安装pip。
```
$ sudo dnf install python-pip

```

在**`Arch Linux`**平台，使用[Pacman 命令][11]安装pip。
```
$ sudo pacman -S python-pip

```

在**`openSUSE`**平台，使用[Zypper 命令][12]安装pip。
```
$ sudo zypper python-pip

```

最后，执行下面的pip命令安装python-hwinfo。
```
$ sudo pip install python-hwinfo

```

### 怎么使用python-hwinfo在本地机器

执行下面的命令，检查本地机器现有的硬件。输出很清楚和整洁，这是我在其他命令中没有看到的。

它的输出分为了五类。

  * **`Bios Info:`** bios供应商名称，系统产品名称， 系统序列号，系统唯一标识符，系统制造商，bios发布日期和bios版本。
  * **`CPU Info:`** 处理器编号，供应商ID，cpu系列代号，型号，制作更新版本，型号名称，cpu主频。
  * **`Ethernet Controller Info:`** 供应商名称，供应商ID，设备名称，设备ID，子供应商名称，子供应商ID，子设备名称，子设备ID。
  * **`Storage Controller Info:`** 供应商名称，供应商ID，设备名称，设备ID，子供应商名称，子供应商ID，子设备名称，子设备ID。
  * **`GPU Info:`** 供应商名称，供应商ID，设备名称，设备ID，子供应商名称，子供应商ID，子设备名称，子设备ID。
  

```
$ sudo hwinfo

Bios Info:

+----------------------+--------------------------------------+
| Key                  | Value                                |
+----------------------+--------------------------------------+
| bios_vendor_name     | IBM                                  |
| system_product_name  | System x3550 M3: -[6102AF1]-         |
| system_serial_number | RS2IY21                              |
| chassis_type         | Rack Mount Chassis                   |
| system_uuid          | 4C4C4544-0051-3210-8052-B2C04F323132 |
| system_manufacturer  | IBM                                  |
| socket_count         | 2                                    |
| bios_release_date    | 10/21/2014                           |
| bios_version         | -[VLS211TSU-2.51]-                   |
| socket_designation   | Socket 1, Socket 2                   |
+----------------------+--------------------------------------+

CPU Info:

+-----------+--------------+------------+-------+----------+------------------------------------------+----------+
| processor |  vendor_id   | cpu_family | model | stepping |                model_name                | cpu_mhz  |
+-----------+--------------+------------+-------+----------+------------------------------------------+----------+
|     0     | GenuineIntel |     6      |   45  |    7     | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
|     1     | GenuineIntel |     6      |   45  |    7     | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
|     2     | GenuineIntel |     6      |   45  |    7     | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
|     3     | GenuineIntel |     6      |   45  |    7     | Intel(R) Xeon(R) CPU E5-1607 0 @ 3.00GHz | 1200.000 |
|     4     | GenuineIntel |     6      |   45  |    7     | Intel(R) Xeon(R) CPU E5-2650 0 @ 2.00GHz | 1200.000 |
+-----------+--------------+------------+-------+----------+------------------------------------------+----------+

Ethernet Controller Info:

+-------------------+-----------+---------------------------------+-----------+-------------------+--------------+---------------------------------+--------------+
|    vendor_name    | vendor_id |           device_name           | device_id |   subvendor_name  | subvendor_id |          subdevice_name         | subdevice_id |
+-------------------+-----------+---------------------------------+-----------+-------------------+--------------+---------------------------------+--------------+
| Intel Corporation |    8086   | I350 Gigabit Network Connection |    1521   | Intel Corporation |     8086     | I350 Gigabit Network Connection |     1521     |
+-------------------+-----------+---------------------------------+-----------+-------------------+--------------+---------------------------------+--------------+

Storage Controller Info:

+-------------------+-----------+----------------------------------------------+-----------+----------------+--------------+----------------+--------------+
|    vendor_name    | vendor_id |                 device_name                  | device_id | subvendor_name | subvendor_id | subdevice_name | subdevice_id |
+-------------------+-----------+----------------------------------------------+-----------+----------------+--------------+----------------+--------------+
| Intel Corporation |    8086   |   C600/X79 series chipset IDE-r Controller   |    1d3c   |      Dell      |     1028     | [Device 05d2]  |     05d2     |
| Intel Corporation |    8086   | C600/X79 series chipset SATA RAID Controller |    2826   |      Dell      |     1028     | [Device 05d2]  |     05d2     |
+-------------------+-----------+----------------------------------------------+-----------+----------------+--------------+----------------+--------------+

GPU Info:

+--------------------+-----------+-----------------------+-----------+--------------------+--------------+----------------+--------------+
|    vendor_name     | vendor_id |      device_name      | device_id |   subvendor_name   | subvendor_id | subdevice_name | subdevice_id |
+--------------------+-----------+-----------------------+-----------+--------------------+--------------+----------------+--------------+
| NVIDIA Corporation |    10de   | GK107GL [Quadro K600] |    0ffa   | NVIDIA Corporation |     10de     | [Device 094b]  |     094b     |
+--------------------+-----------+-----------------------+-----------+--------------------+--------------+----------------+--------------+

```

### 怎么使用python-hwinfo在远处机器上

执行下面的命令检查远程机器现有的硬件，需要远程机器IP，用户名和密码
```
$ hwinfo -m x.x.x.x -u root -p password

```

### 如何使用python-hwinfo读取捕获的输出

执行下面的命令，检查本地机器现有的硬件。输出很清楚和整洁，这是我在其他命令中没有看到的。
```
$ hwinfo -f [Path to file]

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/python-hwinfo-check-display-system-hardware-configuration-information-linux/

作者：[2DAYGEEK][a]
译者：[Torival](https://github.com/Torival)
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


