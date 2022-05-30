[#]: subject: "How to Install KVM on Ubuntu 22.04 (Jammy Jellyfish)"
[#]: via: "https://www.linuxtechi.com/how-to-install-kvm-on-ubuntu-22-04/"
[#]: author: "James Kiarie https://www.linuxtechi.com/author/james/"
[#]: collector: "lkxed"
[#]: translator: "turbokernel"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install KVM on Ubuntu 22.04 (Jammy Jellyfish)
======
KVM, an acronym for Kernel-based Virtual Machine is an opensource virtualization technology integrated into the Linux kernel. It’s a type 1 (bare metal ) hypervisor that enables the kernel to act as a bare-metal hypervisor.

KVM allows users to create and run multiple guest machines which can be either Windows or Linux. Each guest machine runs independently of other virtual machines and the underlying OS ( host system ) and has its own computing resources such as CPU, RAM, network interfaces, and storage to mention a few.

This guide shows you how to install KVM on Ubuntu 22.04 LTS (Jammy Jellyfish). At the tail end of this guide, we will demonstrate how you can create a virtual machine once the installation of KVM is complete.

### 1) Update Ubuntu 22.04

To get off the ground, launch the terminal and update your local package index as follows.

```
$ sudo apt update
```

### 2) Check if Virtualization is enabled

Before you proceed any further, you need to check if your CPU supports KVM virtualization. For this to be possible, your system needs to either have a VT-x( vmx ) Intel processor or an AMD-V (svm) processor.

This is achieved by running the following command. if the output is greater than 0, then virtualization is enabled. Otherwise, virtualization is disabled and you need to enable it.

```
$ egrep -c '(vmx|svm)' /proc/cpuinfo
```

![SVM-VMX-Flags-Cpuinfo-linux][1]

From the above output, you can deduce that virtualization is enabled since the result printed is greater than 0. If Virtualization is not enabled, be sure to enable the virtualization feature in your system’s BIOS settings.

In addition, you can verify if KVM virtualization is enabled by running the following command:

```
$ kvm-ok
```

For this to work, you need to have installed the cpu-checker package, otherwise, you will bump into the error ‘Command ‘kvm-ok’ not found’.

Directly below, you will get instructions on how to resolve this issue, and that is to install the cpu-checker package.

![KVM-OK-Command-Not-Found-Ubuntu][2]

Therefore, install the cpu-checker package as follows.

```
$ sudo apt install -y cpu-checker
```

Then run the kvm-ok command, and if KVM virtualization is enabled, you should get the following output.

```
$ kvm-ok
```

![KVM-OK-Command-Output][3]

### 3) Install KVM on Ubuntu 22.04

Next, run the command below to install KVM and additional virtualization packages on Ubuntu 22.04.

```
$ sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils
```

Let us break down the packages that we are installing:

* qemu-kvm  – An opensource emulator and virtualization package that provides hardware emulation.
* virt-manager – A Qt-based graphical interface for managing virtual machines via the libvirt daemon.
* libvirt-daemon-system – A package that provides configuration files required to run the libvirt daemon.
* virtinst – A  set of command-line utilities for provisioning and modifying virtual machines.
* libvirt-clients – A set of client-side libraries and APIs for managing and controlling virtual machines & hypervisors from the command line.
* bridge-utils – A set of tools for creating and managing bridge devices.

###  4) Enable the virtualization daemon (libvirtd)

With all the packages installed, enable and start the Libvirt daemon.

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

### 5) Create Network Bridge (br0)

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

Verify the network bridge ‘br0’, run below ip command

```
$ ip add show
```

![Network-Bridge-br0-ubuntu-linux][5]

### 6) Launch KVM Virtual Machines Manager

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

In the next step, define the disk space for your virtual machine and click ‘Forward’.

![Storage-for-Virtual-Machine-KVM-Virt-Manager][15]

To associate virtual machine’s nic to network bridge, click on ‘Network selection’ and choose br0 bridge.

![Network-Selection-KVM-Virtual-Machine-Virt-Manager][16]

Finally, click ‘Finish’ to wind up setting the virtual machine.

![Choose-Finish-to-OS-Installation-KVM-VM][17]

Shortly afterward, the virtual machine creation will get underway.

![Creating-Domain-Virtual-Machine-Virt-Manager][18]

Once completed, the virtual machine will start with the OS installer displayed. Below is the Debian 11 installer listing the options for installation. From here, you can proceed to install your preferred system.

![Virtual-Machine-Console-Virt-Manager][19]

##### Conclusion

And that’s it. In this guide, we have demonstrated how you can install the KVM hypervisor on Ubuntu 22.04. Your feedback on this guide is much welcome.

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
