如何使用 virsh 命令创建、还原和删除 KVM 虚拟机快照
======

![KVM-VirtualMachine-Snapshot][2]

在虚拟化平台上进行系统管理工作时，经常需要在开始重大操作比如部署补丁和代码前先设置一个虚拟机<ruby>快照<rt>snapshot</rt></ruby>。

虚拟机**快照**是特定时间点的虚拟机磁盘的副本。换句话说，快照保存了给定的时间点虚拟机的状态和数据。

### 我们可以在哪里使用虚拟机快照？

如果你在使用基于 **KVM** 的**虚拟机管理程序**，那么可以使用 `virsh` 命令获取虚拟机或域快照。快照在一种情况下变得非常有用，当你已经在虚拟机上安装或应用了最新的补丁，但是由于某些原因，虚拟机上的程序变得不稳定，开发团队想要还原所有的更改和补丁。如果你在应用补丁之前设置了虚拟机的快照，那么可以使用快照将虚拟机恢复到之前的状态。

**注意：**我们只能对磁盘格式为 **Qcow2** 的虚拟机的进行快照，并且 kvm 的 `virsh` 命令不支持 raw 磁盘格式，请使用以下命令将原始磁盘格式转换为 qcow2。

```
# qemu-img convert -f raw -O qcow2 image-name.img image-name.qcow2
```

### 创建 KVM 虚拟机（域）快照

我假设 KVM 管理程序已经在 CentOS 7 / RHEL 7 机器上配置好了，并且有虚拟机正在运行。我们可以使用下面的 `virsh` 命令列出虚拟机管理程序中的所有虚拟机，

```
[root@kvm-hypervisor ~]# virsh list --all
 Id    Name                           State
----------------------------------------------------
 94    centos7.0                      running
 101   overcloud-controller           running
 102   overcloud-compute2             running
 103   overcloud-compute1             running
 114   webserver                      running
 115   Test-MTN                       running
```

假设我们想创建 webserver 虚拟机的快照，运行下面的命令，

**语法：**

```
# virsh snapshot-create-as –domain {vm_name} –name {snapshot_name} –description “enter description here”
```

```
[root@kvm-hypervisor ~]# virsh snapshot-create-as --domain webserver --name webserver_snap --description "snap before patch on 4Feb2018"
Domain snapshot webserver_snap created
```

创建快照后，我们可以使用下面的命令列出与虚拟机相关的快照：

```
[root@kvm-hypervisor ~]# virsh snapshot-list webserver
 Name                 Creation Time             State
------------------------------------------------------------
 webserver_snap       2018-02-04 15:05:05 +0530 running
[root@kvm-hypervisor ~]#
```

要列出虚拟机快照的详细信息，请运行下面的 `virsh` 命令：

```
[root@kvm-hypervisor ~]# virsh snapshot-info --domain webserver --snapshotname webserver_snap
Name:           webserver_snap
Domain:         webserver
Current:        yes
State:          running
Location:       internal
Parent:         -
Children:       0
Descendants:    0
Metadata:       yes
```

我们可以使用下面的 `qemu-img` 命令查看快照的大小：

```
[root@kvm-hypervisor ~]# qemu-img info /var/lib/libvirt/images/snaptestvm.img
```

![qemu-img-command-output-kvm][3]

### 还原 KVM 虚拟机快照

假设我们想要将 webserver 虚拟机还原到我们在上述步骤中创建的快照。使用下面的 `virsh` 命令将 Webserver 虚拟机恢复到其快照 webserver_snap 时。

**语法：**

```
# virsh snapshot-revert {vm_name} {snapshot_name}
```

```
[root@kvm-hypervisor ~]# virsh snapshot-revert webserver webserver_snap
```

### 删除 KVM 虚拟机快照

要删除 KVM 虚拟机快照，首先使用 `virsh snapshot-list` 命令获取虚拟机的快照详细信息，然后使用 `virsh snapshot-delete` 命令删除快照。如下示例所示：

```
[root@kvm-hypervisor ~]# virsh snapshot-list --domain webserver
 Name                 Creation Time             State
------------------------------------------------------------
 webserver_snap       2018-02-04 15:05:05 +0530 running
[root@kvm-hypervisor ~]# virsh snapshot-delete --domain webserver --snapshotname webserver_snap
Domain snapshot webserver_snap deleted
```

这就是本文的全部内容，我希望你们能够了解如何使用 `virsh` 命令来管理 KVM 虚拟机快照。请分享你的反馈，并不要犹豫地分享给你的技术朋友🙂

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/create-revert-delete-kvm-virtual-machine-snapshot-virsh-command/

作者：[Pradeep Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/02/KVM-VirtualMachine-Snapshot.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2018/02/qemu-img-command-output-kvm.jpg
