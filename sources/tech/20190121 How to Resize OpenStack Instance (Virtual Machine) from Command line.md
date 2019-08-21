[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Resize OpenStack Instance (Virtual Machine) from Command line)
[#]: via: (https://www.linuxtechi.com/resize-openstack-instance-command-line/)
[#]: author: (Pradeep Kumar http://www.linuxtechi.com/author/pradeep/)

How to Resize OpenStack Instance (Virtual Machine) from Command line
======

Being a Cloud administrator, resizing or changing resources of an instance or virtual machine is one of the most common tasks.

![](https://www.linuxtechi.com/wp-content/uploads/2019/01/Resize-openstack-instance.jpg)

In Openstack environment, there are some scenarios where cloud user has spin a vm using some flavor( like m1.smalll) where root partition disk size is 20 GB, but at some point of time user wants to extends the root partition size to 40 GB. So resizing of vm’s root partition can be accomplished by using the resize option in nova command. During the resize, we need to specify the new flavor that will include disk size as 40 GB.

**Note:** Once you extend the instance resources like RAM, CPU and disk using resize option in openstack then you can’t reduce it.

**Read More on** : [**How to Create and Delete Virtual Machine(VM) from Command line in OpenStack**][1]

In this tutorial I will demonstrate how to resize an openstack instance from command line. Let’s assume I have an existing instance named “ **test_resize_vm** ” and it’s associated flavor is “m1.small” and root partition disk size is 20 GB.

Execute the below command from controller node to check on which compute host our vm “test_resize_vm” is provisioned and its flavor details

```
:~# openstack server show test_resize_vm | grep -E "flavor|hypervisor"
| OS-EXT-SRV-ATTR:hypervisor_hostname  | compute-57    |
| flavor                               | m1.small (2)  |
:~#
```

Login to VM as well and check the root partition size,

```
[[email protected] ~]# df -Th
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda1      xfs        20G  885M   20G   5% /
devtmpfs       devtmpfs  900M     0  900M   0% /dev
tmpfs          tmpfs     920M     0  920M   0% /dev/shm
tmpfs          tmpfs     920M  8.4M  912M   1% /run
tmpfs          tmpfs     920M     0  920M   0% /sys/fs/cgroup
tmpfs          tmpfs     184M     0  184M   0% /run/user/1000
[[email protected] ~]# echo "test file for resize operation" > demofile
[[email protected] ~]# cat demofile
test file for resize operation
[[email protected] ~]#
```

Get the available flavor list using below command,

```
:~# openstack flavor list
+--------------------------------------|-----------------|-------|------|-----------|-------|-----------+
| ID                                   | Name            |   RAM | Disk | Ephemeral | VCPUs | Is Public |
+--------------------------------------|-----------------|-------|------|-----------|-------|-----------+
| 2                                    | m1.small        |  2048 |   20 |         0 |     1 | True      |
| 3                                    | m1.medium       |  4096 |   40 |         0 |     2 | True      |
| 4                                    | m1.large        |  8192 |   80 |         0 |     4 | True      |
| 5                                    | m1.xlarge       | 16384 |  160 |         0 |     8 | True      |
+--------------------------------------|-----------------|-------|------|-----------|-------|-----------+
```

So we will be using the flavor “m1.medium” for resize operation, Run the beneath nova command to resize “test_resize_vm”,

Syntax: # nova resize {VM_Name} {flavor_id} —poll

```
:~# nova resize test_resize_vm 3 --poll
Server resizing... 100% complete
Finished
:~#
```

Now confirm the resize operation using “ **openstack server –confirm”** command,

```
~# openstack server list | grep -i test_resize_vm
| 1d56f37f-94bd-4eef-9ff7-3dccb4682ce0 | test_resize_vm | VERIFY_RESIZE |private-net=10.20.10.51                                  |
:~#
```

As we can see in the above command output the current status of the vm is “ **verify_resize** “, execute below command to confirm resize,

```
~# openstack server resize --confirm 1d56f37f-94bd-4eef-9ff7-3dccb4682ce0
~#
```

After the resize confirmation, status of VM will become active, now re-verify hypervisor and flavor details for the vm

```
:~# openstack server show test_resize_vm | grep -E "flavor|hypervisor"
| OS-EXT-SRV-ATTR:hypervisor_hostname  | compute-58   |
| flavor                               | m1.medium (3)|
```

Login to your VM now and verify the root partition size

```
[[email protected] ~]# df -Th
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda1      xfs        40G  887M   40G   3% /
devtmpfs       devtmpfs  1.9G     0  1.9G   0% /dev
tmpfs          tmpfs     1.9G     0  1.9G   0% /dev/shm
tmpfs          tmpfs     1.9G  8.4M  1.9G   1% /run
tmpfs          tmpfs     1.9G     0  1.9G   0% /sys/fs/cgroup
tmpfs          tmpfs     380M     0  380M   0% /run/user/1000
[[email protected] ~]# cat demofile
test file for resize operation
[[email protected] ~]#
```

This confirm that VM root partition has been resized successfully.

**Note:** Due to some reason if resize operation was not successful and you want to revert the vm back to previous state, then run the following command,

```
# openstack server resize --revert {instance_uuid}
```

If have noticed “ **openstack server show** ” commands output, VM is migrated from compute-57 to compute-58 after resize. This is the default behavior of “nova resize” command ( i.e nova resize command will migrate the instance to another compute & then resize it based on the flavor details)

In case if you have only one compute node then nova resize will not work, but we can make it work by changing the below parameter in nova.conf file on compute node,

Login to compute node, verify the parameter value

If “ **allow_resize_to_same_host** ” is set as False then change it to True and restart the nova compute service.

**Read More on** [**OpenStack Deployment using Devstack on CentOS 7 / RHEL 7 System**][2]

That’s all from this tutorial, in case it helps you technically then please do share your feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/resize-openstack-instance-command-line/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/create-delete-virtual-machine-command-line-openstack/
[2]: https://www.linuxtechi.com/openstack-deployment-devstack-centos-7-rhel-7/
