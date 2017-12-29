Translating by zjon
How to enable Nested Virtualization in KVM on CentOS 7 / RHEL 7
======
**Nested virtualization** means to configure virtualization environment inside a virtual machine. In other words we can say nested virtualization is a feature in the hypervisor which allows us to install  & run a virtual machine inside a virtual server via hardware acceleration from the **hypervisor** (host).

In this article, we will discuss how to enable nested virtualization in KVM on CentOS 7 / RHEL 7. I am assuming you have already configured KVM hypervisor. In case you have not familiar on how to install and configure **KVM hypervisor** , then refer the following article

Let's jump into the hypervisor and verify whether nested virtualization is enabled or not on your KVM host

For Intel based Processors run the command,
```
[root@kvm-hypervisor ~]# cat /sys/module/kvm_intel/parameters/nested
N
[root@kvm-hypervisor ~]#
```

For AMD based Processors run the command,
```
[root@kvm-hypervisor ~]# cat /sys/module/kvm_amd/parameters/nested
N
[root@kvm-hypervisor ~]#
```

In the above command output 'N' indicates that Nested virtualization is disabled. If we get the output as 'Y' then it indicates that nested virtualization is enabled on your host.

Now to enable nested virtualization, create a file with the name " **/etc/modprobe.d/kvm-nested.conf** " with the following content.
```
[root@kvm-hypervisor ~]# vi /etc/modprobe.d/kvm-nested.conf
options kvm-intel nested=1
options kvm-intel enable_shadow_vmcs=1
options kvm-intel enable_apicv=1
options kvm-intel ept=1
```

Save & exit the file

Now remove ' **kvm_intel** ' module and then add the same module with modprobe command. Before removing the module, make sure VMs are shutdown otherwise we will get error message like " **modprobe: FATAL: Module kvm_intel is in use** "
```
[root@kvm-hypervisor ~]# modprobe -r kvm_intel
[root@kvm-hypervisor ~]# modprobe -a kvm_intel
[root@kvm-hypervisor ~]#
```

Now verify whether nested virtualization feature enabled or not.
```
[root@kvm-hypervisor ~]# cat /sys/module/kvm_intel/parameters/nested
Y
[root@kvm-hypervisor ~]#
```

####

Test Nested Virtualization

Let's suppose we have a VM with name "director" on KVM hypervisor on which I have enabled nested virtualization. Before testing, make sure CPU mode for the VM is either as " **host-model** " or " **host-passthrough** " , to check cpu mode of a virtual machine use either Virt-Manager GUI or virsh edit command

![cpu_mode_vm_kvm][1]

![cpu_mode_vm_kvm][2]

Now login to the director VM and run lscpu and lsmod command
```
[root@kvm-hypervisor ~]# ssh 192.168.126.1 -l root
root@192.168.126.1's password:
Last login: Sun Dec 10 07:05:59 2017 from 192.168.126.254
[root@director ~]# lsmod | grep kvm
kvm_intel             170200  0
kvm                   566604  1 kvm_intel
irqbypass              13503  1 kvm
[root@director ~]#
[root@director ~]# lscpu
```

![lscpu_command_rhel7_centos7][1]

![lscpu_command_rhel7_centos7][3]

Let's try creating a virtual machine either from virtual manager GUI or virt-install inside the director vm, in my case i am using virt-install command
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

![cli-installer-virt-install-command-kvm][1]

![cli-installer-virt-install-command-kvm][4]

This confirms that nested virtualization has been enabled successfully as we are able to create virtual machine inside a virtual machine.

This Concludes the article, please do share your feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/enable-nested-virtualization-kvm-centos-7-rhel-7/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2017/12/cpu_mode_vm_kvm.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2017/12/lscpu_command_rhel7_centos7-1024x408.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2017/12/cli-installer-virt-install-command-kvm.jpg
