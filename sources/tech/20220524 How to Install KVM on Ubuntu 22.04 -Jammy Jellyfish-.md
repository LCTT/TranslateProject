[#]: subject: "How to Install KVM on Ubuntu 22.04 (Jammy Jellyfish)"
[#]: via: "https://www.linuxtechi.com/how-to-install-kvm-on-ubuntu-22-04/"
[#]: author: "James Kiarie https://www.linuxtechi.com/author/james/"
[#]: collector: "lkxed"
[#]: translator: "turbokernel"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu 22.04 (Jammy Jellyfish) 之 KVM 安装手札
======
**KVM** 是 **Kernel-based Virtual Machine** 首字母缩写，一项嵌入内核的开源虚拟化技术。其属于标准的基于内核的裸设备虚拟化引擎。

在 **KVM** 之上可以运行 Windows 和 Liunx 虚拟机。每个虚拟机之间相互独立并独享 CPU、内存、网络设备、存储设备等相关资源。

本文将介绍在 Ubuntu 22.04 LTS (Jammy Jellyfish) 中如何安装 **KVM** 。在文末，我们也将演示在安装 **KVM** 完成之后如何创建虚拟机。

### 1) 更新 Ubuntu 22.04

在一切开始前，打开终端并通过如下命令更新更新apt软件包索引：

```
$ sudo apt update
```

### 2) 检查虚拟化是否开启

首先需要检查您的CPU是否支持 KVM 虚拟化。确保您系统中安装了 Intel 处理器 VT-x( vmx ) 或 AMD AMD-V (svm) 处理器。

您可以通过运行如下命令，根据返回的结果是否大于0判断虚拟化是否启用。如果返回值等于0，则表示虚拟化已禁用，您需要先启用虚拟化。

```
$ egrep -c '(vmx|svm)' /proc/cpuinfo
```

![SVM-VMX-Flags-Cpuinfo-linux][1]

From the above output, you can deduce that virtualization is enabled since the result printed is greater than 0. If Virtualization is not enabled, be sure to enable the virtualization feature in your system’s BIOS settings.

另外，您可以通过如下命令判断 KVM 虚拟化是否已经在运行：

```
$ kvm-ok
```

For this to work, you need to have installed the cpu-checker package, otherwise, you will bump into the error ‘Command ‘kvm-ok’ not found’.

Directly below, you will get instructions on how to resolve this issue, and that is to install the cpu-checker package.

![KVM-OK-Command-Not-Found-Ubuntu][2]

随后，通过如下命令安装 cpu-checker 软件包：

```
$ sudo apt install -y cpu-checker
```

接着运行 kvm-ok 命令，如果 KVM 已经启动，您将看到如下输出：

```
$ kvm-ok
```

![KVM-OK-Command-Output][3]

### 3) 在 Ubuntu 22.04 上安装 KVM

随后，通过如下命令在 Ubuntu 22.04 中安装 KVM 以及其他相关虚拟化软件包：

```
$ sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils
```

为您解释下刚刚安装了哪些软件包：

* qemu-kvm  – 一款开源模拟器，为虚拟化安装包提供硬件模拟的支持
* virt-manager – 一款基于 **QT** 和 **libvirt** 的图形的 libvirt 虚拟机管理工具
* libvirt-daemon-system – 一款为运行 libvirt 进程提供必要配置文件的工具
* virtinst – 一套为置备和修改虚拟机提供的命令行工具
* libvirt-clients – A set of client-side libraries and APIs for managing and controlling virtual machines & hypervisors from the command line.
* bridge-utils – A set of tools for creating and managing bridge devices.

###  4) 启用虚拟化守护进程 (libvirtd)

在所有软件包安装完毕之后，通过如下命令 启用并启动 Libvirt 守护进程：

```
$ sudo systemctl enable --now libvirtd
$ sudo systemctl start libvirtd
```

Confirm that the virtualization daemon is running as shown.

```
$ sudo systemctl status libvirtd
```

![Libvirtd-Status-Ubuntu-Linux][4]

In addition, you need to add the currently logged-in user to the kvm and libvirt groups so that they can create and manage virtual machines.

```
$ sudo usermod -aG kvm $USER
$ sudo usermod -aG libvirt $USER
```

The $USER environment variable points to the name of the currently logged-in user.  To apply this change, you need to log out and log back again.

### 5) 创建网桥(br0)

If you are planning to access KVM virtual machines outside from your Ubuntu 22.04 system, then you must map VM’s interface to a network bridge. Though a virtual bridge named virbr0, created automatically when KVM is installed but it is used for testing purposes.

To create a network bridge, create the file ‘01-netcfg.yaml’ with following content under the folder /etc/netplan.

```
$ sudo vi /etc/netplan/01-netcfg.yaml
network:
  ethernets:
    enp0s3:
      dhcp4: false
      dhcp6: false
  # add configuration for bridge interface
  bridges:
    br0:
      interfaces: [enp0s3]
      dhcp4: false
      addresses: [192.168.1.162/24]
      macaddress: 08:00:27:4b:1d:45
      routes:
        - to: default
          via: 192.168.1.1
          metric: 100
      nameservers:
        addresses: [4.2.2.2]
      parameters:
        stp: false
      dhcp6: false
  version: 2
```

save and exit the file.

Note: These details as per my setup, so replace the IP address entries, interface name and mac address as per your setup.

To apply above change, run ‘netplan apply’

```
$ sudo netplan apply
```

您可以通过如下命令，验证网桥 ‘br0’：

```
$ ip add show
```

![Network-Bridge-br0-ubuntu-linux][5]

### 6) 启动 KVM 虚拟机管理器

With KVM installed, you can begin creating your virtual machines using the virt-manager GUI tool. To get started, use the GNOME search utility and search for ‘Virtual machine Manager’.

Click on the icon that pops up.

![Access-Virtual-Machine-Manager-Ubuntu-Linux][6]

This launches the Virtual Machine Manager Interface.

![Virtual-Machine-Manager-Interface-Ubuntu-Linux][7]

Click on “File” then select “New Virtual Machine”. Alternatively, you can click on the button shown.

![New-Virtual-Machine-Icon-Virt-Manager][8]

This pops open the virtual machine installation wizard which presents you with the following four options:

* Local install Media ( ISO image or CDROM )
* Network Install ( HTTP, HTTPS, and FTP )
* Import existing disk image
* Manual Install

In this guide, we have downloaded a Debian 11 ISO image, and therefore, if you have an ISO image, select the first option and click ‘Forward’.

![Local-Install-Media-ISO-Virt-Manager][9]

In the next step, click ‘Browse’ to navigate to the location of the ISO image,

![Browse-ISO-File-Virt-Manager-Ubuntu-Linux][10]

In the next window, click ‘Browse local’ in order to select the ISO image from the local directories on your Linux PC.

![Browse-Local-ISO-Virt-Manager][11]

As demonstrated below, we have selected the Debian 11 ISO image. Then click ‘Open’

![Choose-ISO-File-Virt-Manager][12]

Once the ISO image is selected, click ‘Forward’ to proceed to the next step.

![Forward-after-browsing-iso-file-virt-manager][13]

Next, define the RAM and the number of CPU cores for your virtual machine and click ‘Forward’.

![Virtual-Machine-RAM-CPU-Virt-Manager][14]

下一页中，输入虚拟机磁盘空间，并点击 ‘Forward’ 继续。

![Storage-for-Virtual-Machine-KVM-Virt-Manager][15]

To associate virtual machine’s nic to network bridge, click on ‘Network selection’ and choose br0 bridge.

![Network-Selection-KVM-Virtual-Machine-Virt-Manager][16]

最后，点击 ‘Finish’ 按钮结束设置虚拟机。

![Choose-Finish-to-OS-Installation-KVM-VM][17]

稍等片刻，虚拟机的创建过程将开始。

![Creating-Domain-Virtual-Machine-Virt-Manager][18]

当创建结束时，虚拟机将开机并进入系统安装界面。如下是 Debian 11 的安装选项。在这里您可以根据需要进行系统安装。

![Virtual-Machine-Console-Virt-Manager][19]

##### 小结

至此，本文向您演示了如何在 Ubuntu 22.04 上 安装 KVM 虚拟化引擎。您的反馈对我们至关重要。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-kvm-on-ubuntu-22-04/

作者：[James Kiarie][a]
选题：[lkxed][b]
译者：[turbokernel](https://github.com/turbokernel)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/05/SVM-VMX-Flags-Cpuinfo-linux.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/05/KVM-OK-Command-Not-Found-Ubuntu.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/05/KVM-OK-Command-Output.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Libvirtd-Status-Ubuntu-Linux.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Network-Bridge-br0-ubuntu-linux.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Access-Virtual-Machine-Manager-Ubuntu-Linux.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Virtual-Machine-Manager-Interface-Ubuntu-Linux.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/05/New-Virtual-Machine-Icon-Virt-Manager.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Local-Install-Media-ISO-Virt-Manager.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Browse-ISO-File-Virt-Manager-Ubuntu-Linux.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Browse-Local-ISO-Virt-Manager.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-ISO-File-Virt-Manager.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Forward-after-browsing-iso-file-virt-manager.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Virtual-Machine-RAM-CPU-Virt-Manager.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Storage-for-Virtual-Machine-KVM-Virt-Manager.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Network-Selection-KVM-Virtual-Machine-Virt-Manager.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Finish-to-OS-Installation-KVM-VM.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Creating-Domain-Virtual-Machine-Virt-Manager.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Virtual-Machine-Console-Virt-Manager.png
