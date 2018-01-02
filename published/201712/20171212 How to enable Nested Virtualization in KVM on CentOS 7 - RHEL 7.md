如何在 CentOS 7 / RHEL 7 的 KVM 上启用嵌套虚拟化
======

**嵌套虚拟化**意味着在虚拟机内配置虚拟化环境。换句话说，我们可以说嵌套虚拟化是<ruby>虚拟机管理程序<rt>hypervisor</rt></ruby>的一个特性，它允许我们通过**虚拟化管理程序**（宿主机）的硬件加速在虚拟服务器内安装和运行虚拟机。

在这篇文章中，我们将讨论如何在 CentOS 7 / RHEL 7 的 KVM 上启用嵌套虚拟化。我假定您已经配置过 KVM 管理程序。如果您不熟悉如何安装和配置 KVM 管理程序，请参考以下文章。

### 在 CentOS 7.x 和 RHEL 7.x 安装 KVM 管理程序

让我们进入虚拟化管理程序，验证您的 KVM 宿主机是否启用了嵌套虚拟化。

基于 Intel 的处理器运行以下命令：

```
[root@kvm-hypervisor ~]# cat /sys/module/kvm_intel/parameters/nested
N
```

基于 AMD 的处理器运行以下命令：

```
[root@kvm-hypervisor ~]# cat /sys/module/kvm_amd/parameters/nested
N
```

上述命令输出 `N` 表示嵌套虚拟化是禁用的。如果我们得到的输出是 `Y` 则表示在您的宿主机已启用嵌套虚拟化。

现在启用嵌套虚拟化，使用以下内容创建一个文件名为 `/etc/modprobe.d/kvm-nested.conf` 的文件：

```
[root@kvm-hypervisor ~]# vi /etc/modprobe.d/kvm-nested.conf
```
```
options kvm-intel nested=1
options kvm-intel enable_shadow_vmcs=1
options kvm-intel enable_apicv=1
options kvm-intel ept=1
```

保存并退出文件。

现在移除 `kvm_intel` 模块然后通过 `modprobe` 命令添加同样的模块。在移除模块之前，确保虚拟机已关机，否则我们会得到像 “modprobe: FATAL: Module kvm_intel is in use” 这样的错误信息。

```
[root@kvm-hypervisor ~]# modprobe -r kvm_intel
[root@kvm-hypervisor ~]# modprobe -a kvm_intel
```

现在验证嵌套虚拟化功能是否启用。

```
[root@kvm-hypervisor ~]# cat /sys/module/kvm_intel/parameters/nested
Y
```

### 测试嵌套虚拟化

假设我们在 KVM 管理程序上有一台已经启用了嵌套虚拟化的名为 “director” 的虚拟机。在测试之前，确保 CPU 模式为 “host-modle” 或 “host-passthrough” ，使用 Virt-Manager 或 `virtsh` 编辑命令检查虚拟机的 CPU 模式。

![cpu_mode_vm_kvm][2]

现在登录 director 这台虚拟机并运行 `lscpu` 和 `lsmod` 命令。

```
[root@kvm-hypervisor ~]# ssh 192.168.126.1 -l root
root@192.168.126.1's password:
Last login: Sun Dec 10 07:05:59 2017 from 192.168.126.254
[root@director ~]# lsmod | grep kvm
kvm_intel             170200  0
kvm                   566604  1 kvm_intel
irqbypass              13503  1 kvm
```

```
[root@director ~]# lscpu
```

![lscpu_command_rhel7_centos7][3]

让我们试着在 director 这台虚拟机的虚拟管理器 GUI 或 `virt-install` 命令创建一台虚拟机，在我的情况下我使用 `virt-install` 命令。

```
[root@director ~]# virt-install  -n Nested-VM  --description "Test Nested VM"  --os-type=Linux  --os-variant=rhel7  --ram=2048  --vcpus=2  --disk path=/var/lib/libvirt/images/nestedvm.img,bus=virtio,size=10  --graphics none  --location /var/lib/libvirt/images/CentOS-7-x86_64-DVD-1511.iso --extra-args console=ttyS0
Starting install...
Retrieving file .treeinfo...                                                   | 1.1 kB  00:00:00
Retrieving file vmlinuz...                                                     | 4.9 MB  00:00:00
Retrieving file initrd.img...                                                  |  37 MB  00:00:00
Allocating 'nestedvm.img'                                                      |  10 GB  00:00:00
Connected to domain Nested-VM
Escape character is ^]
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.10.0-327.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.3 20140911 (Red Hat 4.8.3-9) (GCC) ) #1 SMP Thu Nov 19 22:10:57 UTC 2015
………………………………………………
```


![cli-installer-virt-install-command-kvm][4]

这证实了嵌套虚拟化已成功启用，因为我们能在虚拟机内创建虚拟机。

这篇文章到此结束，请分享您的反馈和意见。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/enable-nested-virtualization-kvm-centos-7-rhel-7/

作者：[Pradeep Kumar][a]
译者：[zjon](https://github.com/zjon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2017/12/cpu_mode_vm_kvm.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2017/12/lscpu_command_rhel7_centos7-1024x408.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2017/12/cli-installer-virt-install-command-kvm.jpg


