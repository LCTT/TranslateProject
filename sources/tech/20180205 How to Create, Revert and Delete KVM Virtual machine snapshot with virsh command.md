How to Create, Revert and Delete KVM Virtual machine snapshot with virsh command
======
[![KVM-VirtualMachine-Snapshot][1]![KVM-VirtualMachine-Snapshot][2]][2]

While working on the virtualization platform system administrators usually take the snapshot of virtual machine before doing any major activity like deploying the latest patch and code.

Virtual machine **snapshot** is a copy of virtual machine’s disk at the specific point of time. In other words we can say snapshot keeps or preserve the state and data of a virtual machine at given point of time.

### Where we can use VM snapshots ..?

If you are working on **KVM** based **hypervisors** we can take virtual machines or domain snapshot using the virsh command. Snapshot becomes very helpful in a situation where you have installed or apply the latest patches on the VM but due to some reasons, application hosted in the VMs becomes unstable and application team wants to revert all the changes or patches. If you had taken the snapshot of the VM before applying patches then we can restore or revert the VM to its previous state using snapshot.

**Note:** We can only take the snapshot of the VMs whose disk format is **Qcow2** and raw disk format is not supported by kvm virsh command, Use below command to convert the raw disk format to qcow2
```
# qemu-img convert -f raw -O qcow2 image-name.img image-name.qcow2

```

### Create KVM Virtual Machine (domain) Snapshot

I am assuming KVM hypervisor is already configured on CentOS 7 / RHEL 7 box and VMs are running on it. We can list the all the VMs on hypervisor using below virsh command,
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
[root@kvm-hypervisor ~]#

```

Let’s suppose we want to create the snapshot of ‘ **webserver** ‘ VM, run the below command,

**Syntax :**

```
# virsh snapshot-create-as –domain {vm_name} –name {snapshot_name} –description “enter description here”
```
```
[root@kvm-hypervisor ~]# virsh snapshot-create-as --domain webserver --name webserver_snap --description "snap before patch on 4Feb2018"
Domain snapshot webserver_snap created
[root@kvm-hypervisor ~]#

```

Once the snapshot is created then we can list snapshots related to the VM using below command,
```
[root@kvm-hypervisor ~]# virsh snapshot-list webserver
 Name                 Creation Time             State
------------------------------------------------------------
 webserver_snap       2018-02-04 15:05:05 +0530 running
[root@kvm-hypervisor ~]#

```

To list the detailed info of VM’s snapshot, run the beneath virsh command,
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
[root@kvm-hypervisor ~]#

```

We can view the size of snapshot using below qemu-img command,
```
[root@kvm-hypervisor ~]# qemu-img info /var/lib/libvirt/images/snaptestvm.img

```

[![qemu-img-command-output-kvm][1]![qemu-img-command-output-kvm][3]][3]

### Revert / Restore KVM virtual Machine to Snapshot

Let’s assume we want to revert or restore webserver VM to the snapshot that we have created in above step. Use below virsh command to restore Webserver VM to its snapshot “ **webserver_snap** ”

**Syntax :**

```
# virsh snapshot-revert {vm_name} {snapshot_name}
```
```
[root@kvm-hypervisor ~]# virsh snapshot-revert webserver webserver_snap
[root@kvm-hypervisor ~]#

```

### Delete KVM virtual Machine Snapshots

To delete KVM virtual machine snapshots, first get the VM’s snapshot details using “ **virsh snapshot-list** ” command and then use “ **virsh snapshot-delete** ” command to delete the snapshot. Example is shown below:
```
[root@kvm-hypervisor ~]# virsh snapshot-list --domain webserver
 Name                 Creation Time             State
------------------------------------------------------------
 webserver_snap       2018-02-04 15:05:05 +0530 running
[root@kvm-hypervisor ~]#

[root@kvm-hypervisor ~]# virsh snapshot-delete --domain webserver --snapshotname webserver_snap
Domain snapshot webserver_snap deleted
[root@kvm-hypervisor ~]#

```

That’s all from this article, I hope you guys get an idea on how to manage KVM virtual machine snapshots using virsh command. Please do share your feedback and don’t hesitate to share it among your technical friends 🙂

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/create-revert-delete-kvm-virtual-machine-snapshot-virsh-command/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/02/KVM-VirtualMachine-Snapshot.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2018/02/qemu-img-command-output-kvm.jpg
