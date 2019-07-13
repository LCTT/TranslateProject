如何在 Ubuntu 18.04 服务器上安装和配置 KVM
======

**KVM**（基于内核的虚拟机）是一款为类 Linux 系统提供的开源的全虚拟化解决方案，KVM 使用虚拟化扩展（如 **Intel VT** 或 **AMD-V**）提供虚拟化功能。无论何时我们在任何 Linux 机器上安装 KVM，都会通过加载诸如 `kvm-intel.ko`（基于 Intel 的机器）和 `kvm-amd.ko`（基于 amd 的机器）的内核模块，使其成为<ruby>管理程序<rt>hyervisor</rt></ruby>（LCTT 译注：一种监控和管理虚拟机运行的核心软件层）。

KVM 允许我们安装和运行多个虚拟机（Windows 和 Linux）。我们可以通过 `virt-manager` 的图形用户界面或使用 `virt-install` 和 `virsh` 命令在命令行界面来创建和管理基于 KVM 的虚拟机。

在本文中，我们将讨论如何在 Ubuntu 18.04 LTS 服务器上安装和配置 **KVM 管理程序**。我假设你已经在你的服务器上安装了 Ubuntu 18.04 LTS 。接下来登录到您的服务器执行以下步骤。

### 第一步：确认您的硬件是否支持虚拟化

执行 `egrep` 命令以验证您的服务器的硬件是否支持虚拟化，

```
linuxtechi@kvm-ubuntu18-04:~$ egrep -c '(vmx|svm)' /proc/cpuinfo
1
```

如果输出结果大于 0，就意味着您的硬件支持虚拟化。重启，进入 BIOS 设置中启用 VT 技术。

现在使用下面的命令安装 `kvm-ok` 实用程序，该程序用于确定您的服务器是否能够运行硬件加速的 KVM 虚拟机。

```
linuxtechi@kvm-ubuntu18-04:~$ sudo apt install cpu-checker
```

运行 kvm-ok 命令确认输出结果，

```
linuxtechi@kvm-ubuntu18-04:~$ sudo kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```

### 第二步：安装 KVM 及其依赖包

运行下面的 apt 命令安装 KVM 及其依赖项：

```
linuxtechi@kvm-ubuntu18-04:~$ sudo apt update
linuxtechi@kvm-ubuntu18-04:~$ sudo apt install qemu qemu-kvm libvirt-bin  bridge-utils  virt-manager
```

只要上图相应的软件包安装成功，那么你的本地用户（对于我来说是 `linuxtechi`）将被自动添加到 `libvirtd` 群组。

### 第三步：启动并启用 libvirtd 服务

我们在 Ubuntu 18.04 服务器上安装 qemu 和 libvirtd 软件包之后，它就会自动启动并启用 `libvirtd` 服务，如果 `libvirtd` 服务没有开启，则运行以下命令开启，

```
linuxtechi@kvm-ubuntu18-04:~$ sudo service libvirtd start
linuxtechi@kvm-ubuntu18-04:~$ sudo update-rc.d libvirtd enable
```

现在使用下面的命令确认 libvirtd 服务的状态，

```
linuxtechi@kvm-ubuntu18-04:~$ service libvirtd status
```

输出结果如下所示：

![][3]

### 第四步：为 KVM 虚拟机配置桥接网络

只有通过桥接网络，KVM 虚拟机才能访问外部的 KVM 管理程序或主机。在Ubuntu 18.04中，网络由 `netplan` 实用程序管理，每当我们新安装一个 Ubuntu 18.04 系统时，会自动创建一个名称为 `/etc/netplan/50-cloud-init.yaml` 文件，其配置了静态 IP 和桥接网络，`netplan` 实用工具将引用这个文件。

截至目前，我已经在此文件配置了静态 IP，文件的具体内容如下：

```
network:
  ethernets:
    ens33:
      addresses: [192.168.0.51/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [192.168.0.1]
      dhcp4: no
      optional: true
  version: 2
```

我们在这个文件中添加桥接网络的配置信息，

```
linuxtechi@kvm-ubuntu18-04:~$ sudo vi /etc/netplan/50-cloud-init.yaml

network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      dhcp6: no

  bridges:
    br0:
      interfaces: [ens33]
      dhcp4: no
      addresses: [192.168.0.51/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [192.168.0.1]

```

正如你所看到的，我们已经从接口（`ens33`）中删除了 IP 地址，并将该 IP 添加到 `br0` 中，并且还将接口（`ens33`）添加到 `br0`。使用下面的 `netplan` 命令使更改生效，

```
linuxtechi@kvm-ubuntu18-04:~$ sudo netplan apply
```

如果您想查看 debug 日志请使用以下命令，

```
linuxtechi@kvm-ubuntu18-04:~$ sudo netplan --debug  apply
```

现在使用以下方法确认网络桥接状态：

```
linuxtechi@kvm-ubuntu18-04:~$ sudo networkctl status -a
```

![][4]

```
linuxtechi@kvm-ubuntu18-04:~$ ifconfig
```

![][5]

### 第五步：创建虚拟机（使用 virt-manager 或 virt-install 命令）

有两种方式创建虚拟机：

  * `virt-manager`（图形化工具）
  * `virt-install`（命令行工具）


#### 使用 virt-manager 创建虚拟机

通过执行下面的命令启动 `virt-manager`：

```
linuxtechi@kvm-ubuntu18-04:~$ sudo virt-manager
```

![][6]

创建一个新的虚拟机：

![][7]

点击“下一步”然后选择 ISO 镜像文件，我使用的是 RHEL 7.3 iso 镜像。

![][8]

点击“下一步”。

在接下来的几个窗口中，系统会提示要求您为 VM 分配内存，处理器数量和磁盘空间。

并指定虚拟机名字和桥接网络名：

![][9]

点击“结束”。

![][10]

接下来只需要按照屏幕指示安装系统。

#### 使用virt-install命令从命令行界面创建虚拟机

使用下面的 `virt-install` 命令从终端创建一个虚拟机，它将在命令行界面中开始安装，并根据您对虚拟机的名字，说明，ISO 文件位置和桥接配置的设置创建虚拟机。

```
linuxtechi@kvm-ubuntu18-04:~$ sudo virt-install  -n DB-Server  --description "Test VM for Database"  --os-type=Linux  --os-variant=rhel7  --ram=1096  --vcpus=1  --disk path=/var/lib/libvirt/images/dbserver.img,bus=virtio,size=10  --network bridge:br0 --graphics none  --location /home/linuxtechi/rhel-server-7.3-x86_64-dvd.iso --extra-args console=ttyS0
```

本文到此为止，我希望这篇文章能帮助你能够在 Ubuntu 18.04 服务器上成功安装 KVM。 除此之外，KVM 也是 Openstack 默认的管理程序。


阅读更多：“[**如何使用 virsh 命令创建，还原和删除 KVM 虚拟机快照**][11]”


--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-configure-kvm-ubuntu-18-04-server/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/05/libvirtd-command-ubuntu18-04-1024x339.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2018/05/libvirtd-command-ubuntu18-04.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2018/05/networkctl-command-output-ubuntu18-04.jpg
[5]:https://www.linuxtechi.com/wp-content/uploads/2018/05/ifconfig-command-output-ubuntu18-04.jpg
[6]:https://www.linuxtechi.com/wp-content/uploads/2018/05/Start-Virt-Manager-Ubuntu18-04.jpg
[7]:https://www.linuxtechi.com/wp-content/uploads/2018/05/ISO-file-Virt-Manager.jpg
[8]:https://www.linuxtechi.com/wp-content/uploads/2018/05/Select-ISO-file-virt-manager-Ubuntu18-04-Server.jpg
[9]:https://www.linuxtechi.com/wp-content/uploads/2018/05/VM-Name-Network-Virt-Manager-Ubuntu18-04.jpg
[10]:https://www.linuxtechi.com/wp-content/uploads/2018/05/RHEL7-3-Installation-Virt-Manager.jpg
[11]:https://www.linuxtechi.com/create-revert-delete-kvm-virtual-machine-snapshot-virsh-command/
