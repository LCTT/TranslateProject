translating---geekpi

How To Find If A CPU Supports Virtualization Technology (VT)
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Virtualization-Technology-720x340.png)
We already knew how to [**check if your Linux OS is 32 bit or 64 bit**][1] and how to [**find if your Linux system is physical or virtual machine**][2]. Today, we are going to learn yet another useful topic – how to find if a CPU supports virtualization technology (VT) or not? This should be first thing you might want to verify before installing virtualization applications such as VirtualBox or VMWare workstation to run virtual machines on your Linux system. Now let us go and find out if your computer supports VT or not. Trust me, it is really easy!

### Find If A CPU Supports Virtualization Technology (VT)

We can check if the CPU supports VT in several methods. Here I present you four methods.

#### Method 1: Using “egrep” command

**Egrep** is one of the variant of [**Grep**][3] command which is used to search text files with regular expressions. For the purpose of this guide, we are going to grep **/cpu/procinfo/** file to find out if the CPU supports VT or not.

To find out if your CPU supports VT using egrep command, run:
```
$ egrep "(svm|vmx)" /proc/cpuinfo

```

**Sample output:**

You will get either **“vmx”** (Intel-VT technology) or **“svm”** (AMD-V support) in the output.
```
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer xsave avx lahf_lm epb pti tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm arat pln pts
[...]

```

Since the output is very long, you may find it hard to find the words “vmx” or “svm” in the output. No worries! You can distinguish those terms with colors like below.
```
$ egrep --color -i "svm|vmx" /proc/cpuinfo

```

![][5]

If you don’t get any output, it means that your system doesn’t support virtualization.

Please note that these CPU flags (vmx or svm) in the cpuinfo means that your system will support VT. In some CPU models, the VT support might be disabled in the BIOS, by default. In such cases, you should check your BIOS settings to enable VT support.

For more details about grep/egrep command, refer the man pages.
```
$ man grep

```

#### Method 2 – Using “lscpu” command

The “lscpu” command is used to display the information about your CPU architecture. It gathers information from sysfs, /proc/cpuinfo file and displays the number of CPUs, threads, cores, sockets, and Non-Uniform Memory Access (NUMA) nodes of your host system.

To find out if the VT support is enabled or not, simply run:
```
$ lscpu

```

![][6]

For more details, check the man pages.
```
$ man lscpu

```

#### Method 3 – Using “Cpu-checker” utility

**Cpu-checker** is yet another useful utility to test your CPU for virtualization support. As far as I searched on the web, this utility is available for only Ubuntu-based systems. To install it, run:
```
$ sudo apt-get install cpu-checker

```

Once cpu-checker package is installed, run the following command to check whether VT support is enable or not:
```
$ sudo kvm-ok

```

If your CPU supports VT, you will get the following output:
```
INFO: /dev/kvm exists
KVM acceleration can be used

```

If your CPU doesn’t support VT, you will see an output something like below.
```
INFO: Your CPU does not support KVM extensions
KVM acceleration can NOT be used

```

#### Method 4 – Using “virt-host-validate ” tool

This tool is specifically for RHEL based distros like CentOS and Scientific Linux. The **libvirt-client** package provides **virt-host-validate** binary. So you need to install “libvert-client” package to use this tool.
```
$ sudo yum install libvirt-client

```

Now, run “virt-host-validate” command to find if VT is enabled or not in your RHEL-based systems.
```
$ sudo virt-host-validate

```

If you get **pass** for all results, your system supports VT.
```
 QEMU: Checking for hardware virtualization : PASS
 QEMU: Checking if device /dev/vhost-net exists : PASS
 QEMU: Checking if device /dev/net/tun exists : PASS
 QEMU: Checking for cgroup 'memory' controller support : PASS
 QEMU: Checking for cgroup 'memory' controller mount-point : PASS
 QEMU: Checking for cgroup 'cpu' controller support : PASS
 QEMU: Checking for cgroup 'cpu' controller mount-point : PASS
 QEMU: Checking for cgroup 'cpuacct' controller support : PASS
 QEMU: Checking for cgroup 'cpuacct' controller mount-point : PASS
 QEMU: Checking for cgroup 'cpuset' controller support : PASS
 QEMU: Checking for cgroup 'cpuset' controller mount-point : PASS
 QEMU: Checking for cgroup 'devices' controller support : PASS
 QEMU: Checking for cgroup 'devices' controller mount-point : PASS
 QEMU: Checking for cgroup 'blkio' controller support : PASS
 QEMU: Checking for cgroup 'blkio' controller mount-point : PASS
 QEMU: Checking for device assignment IOMMU support : PASS
 LXC: Checking for Linux >= 2.6.26 : PASS
 LXC: Checking for namespace ipc : PASS
 LXC: Checking for namespace mnt : PASS
 LXC: Checking for namespace pid : PASS
 LXC: Checking for namespace uts : PASS
 LXC: Checking for namespace net : PASS
 LXC: Checking for namespace user : PASS
 LXC: Checking for cgroup 'memory' controller support : PASS
 LXC: Checking for cgroup 'memory' controller mount-point : PASS
 LXC: Checking for cgroup 'cpu' controller support : PASS
 LXC: Checking for cgroup 'cpu' controller mount-point : PASS
 LXC: Checking for cgroup 'cpuacct' controller support : PASS
 LXC: Checking for cgroup 'cpuacct' controller mount-point : PASS
 LXC: Checking for cgroup 'cpuset' controller support : PASS
 LXC: Checking for cgroup 'cpuset' controller mount-point : PASS
 LXC: Checking for cgroup 'devices' controller support : PASS
 LXC: Checking for cgroup 'devices' controller mount-point : PASS
 LXC: Checking for cgroup 'blkio' controller support : PASS
 LXC: Checking for cgroup 'blkio' controller mount-point : PASS

```

If your system doesn’t support VT, you will see an output like below.
```
QEMU: Checking for hardware virtualization : FAIL (Only emulated CPUs are available, performance will be significantly limited)
[...]

```

And, that’s all for now folks. In this guide, we have discussed various methods to find if a CPU supports VT or not. As you can see, it was very easy. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-if-a-cpu-supports-virtualization-technology-vt/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/check-linux-system-32-bit-64-bit/
[2]:https://www.ostechnix.com/check-linux-system-physical-virtual-machine/
[3]:https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/cpuinfo.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/cpuinfo-1-2.png
