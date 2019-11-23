[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Create Affinity and Anti-Affinity Policy in OpenStack)
[#]: via: (https://www.linuxtechi.com/create-affinity-anti-affinity-policy-openstack/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Create Affinity and Anti-Affinity Policy in OpenStack
======

In the organizations where the **OpenStack** is used aggressively, so in such organizations application and database teams can come up with requirement that their application and database instances are required to launch either on same **compute nodes** (hypervisor) or different compute nodes.

[![OpenStack-VMs-Affinity-AntiAffinity-Policy][1]][2]

So, this requirement in OpenStack is fulfilled via **server groups** with **affinity** and **anti-affinity** policies. Server Group is used control affinity and anti-affinity rules for scheduling openstack instances.

When we try to provision virtual machines with affinity server group then all virtual machines will be launched on same compute node. When VMs are provisioned with ant-affinity server group then all VMs will be launched in different compute nodes. In this article we will demonstrate how to create OpenStack server groups with Affinity and Anti-Affinity rules.

Let’s first verify whether your OpenStack setup support Affinity and Anti-Affinity Policies or not, execute the following grep command from your controller nodes,

```
# grep -i "scheduler_default_filters" /etc/nova/nova.conf
```

Output should be something like below,

![Affinity-AntiAffinity-Filter-Nova-Conf-OpenStack][1]

As we can see Affinity and Ant-Affinity filters are enabled but in case if these are not enabled then add these filters in **/etc/nova/nova.conf**  file of controller nodes under “**scheduler_default_filters**” parameters.

```
# vi /etc/nova/nova.conf
………………
scheduler_default_filters=xx,xxx,xxx,xxxxx,xxxx,xxx,xxx,ServerGroupAntiAffinityFilter,ServerGroupAffinityFilter,xx,xxx,xxxx,xx
………………
```

Save and exit the file

To make above changes into the effect, restart the following services

```
# systemctl restart openstack-nova-scheduler
# systemctl restart openstack-nova-conductor
```

Now let’s create OpenStack Server Groups with Affinity and Anti-Affinity Policies

### Server Group with Affinity Policy

To create a server group with name “app” for affinity policy, execute the following openstack command from controller node,

**Syntax:**

# openstack server group create –policy affinity &lt;Server-Group-Name&gt;

Or

# nova server-group-create &lt;Server-Group-Name&gt; affinity

**Note:** Before start executing openstack command, please make sure you source project credential file, in my case project credential file is “**openrc**”

Example:

```
# source openrc
# openstack server group create --policy affinity app
```

### Server Group with Anti-Affinity Policy

To create a server group with anti-affinity policy, execute the following openstack command from controller node, I am assuming server group name is “database”

**Syntax:**

# openstack server group create –policy anti-affinity &lt;Server-Group-Name&gt;

Or

# nova server-group-create &lt;Server-Group-Name&gt; anti-affinity

Example:

```
# source openrc
# openstack server group create --policy anti-affinity database
```

### List Server Group’s ID and Policies

Execute either nova command or Openstack command to get server group’s id and their policies

```
# nova server-group-list | grep -Ei "Policies|database"
Or
# openstack server group list --long | grep -Ei "Policies|app|database"
```

Output would be something like below,

![Server-Group-Policies-OpenStack][1]

### [Launch Virtual Machines (VMs)][3] with Affinity Policy

Let’s assume we want to launch 4 vms with affinity policy, run the following “**openstack server create**” command

**Syntax:**

# openstack server create –image &lt;img-name&gt; –flavor &lt;id-or-flavor-name&gt; –security-group &lt;security-group-name&gt; –nic net-id=&lt;network-id&gt; –hint group=&lt;Server-Group-ID&gt; –max &lt;number-of-vms&gt;  &lt;VM-Name&gt;

**Example:**

```
# openstack server create --image Cirros --flavor m1.small --security-group default --nic net-id=37b9ab9a-f198-4db1-a5d6-5789b05bfb4c --hint group="a9847c7f-b7c2-4751-9c9a-03b117e704ff" --max 4 affinity-test
```

Output of above command,

![OpenStack-Server-create-with-hint-option][1]

Let’s verify whether VMs are launched on same compute node or not, run following command

```
# openstack server list --long -c Name -c Status -c Host -c "Power State" | grep -i affinity-test
```

![Affinity-VMs-Status-OpenStack][1]

This confirms that our affinity policy is working fine as all the VMs are launched on same compute node.

Now let’s test anti-affinity policy

### Launch Virtual Machines (VMs) with Anti-Affinity Policy

For anti-affinity policy we will launch 4 VMs, in above ‘openstack server create’ command, we need to replace Anti-Affinity Server Group’s ID. In our case we will be using database server group id.

Run the following openstack command to launch 4 VMs on different computes with anti-affinity policy,

```
# openstack server create --image Cirros --flavor m1.small --security-group default --nic net-id=37b9ab9a-f198-4db1-a5d6-5789b05bfb4c --hint group="498fd41b-8a8a-497a-afd8-bc361da2d74e" --max 4 anti-affinity-test
```

Output

![Openstack-server-create-anti-affinity-hint-option][1]

Use below openstack command to verify whether VMs are launched on different compute nodes or not

```
# openstack server list --long -c Name -c Status -c Host -c "Power State" | grep -i anti-affinity-test
```

![Anti-Affinity-VMs-Status-OpenStack][1]

Above output confirms that our anti-affinity policy is also working fine.

**Note:** Default Quota for Server group is 10 for every tenant , it means we can max launch 10 VMs inside a server group.

Use below command to view Server Group quota for a specific tenant, replace the tenant id that suits to your setup

```
# openstack quota show f6852d73eaee497a8a640757fe02b785 | grep -i server_group
| server_group_members | 10      |
| server_groups        | 10      |
#
```

To update Server Group Quota, execute the following commands

```
# nova quota-update --server-group-members 15 f6852d73eaee497a8a640757fe02b785
# nova quota-update --server-groups 15  f6852d73eaee497a8a640757fe02b785
```

Now re-run the openstack quota command to verify server group quota

```
# openstack quota show f6852d73eaee497a8a640757fe02b785 | grep -i server_group
| server_group_members | 15     |
| server_groups        | 15     |
#
```

That’s all, we have successfully updated Server Group quota for the tenant. This conclude the article as well, please do hesitate to share it among your technical friends.

  * [Facebook][4]
  * [Twitter][5]
  * [LinkedIn][6]
  * [Reddit][7]



--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/create-affinity-anti-affinity-policy-openstack/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/11/OpenStack-VMs-Affinity-AntiAffinity-Policy.jpg
[3]: https://www.linuxtechi.com/create-delete-virtual-machine-command-line-openstack/
[4]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Fcreate-affinity-anti-affinity-policy-openstack%2F&t=How%20to%20Create%20Affinity%20and%20Anti-Affinity%20Policy%20in%20OpenStack
[5]: http://twitter.com/share?text=How%20to%20Create%20Affinity%20and%20Anti-Affinity%20Policy%20in%20OpenStack&url=https%3A%2F%2Fwww.linuxtechi.com%2Fcreate-affinity-anti-affinity-policy-openstack%2F&via=Linuxtechi
[6]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Fcreate-affinity-anti-affinity-policy-openstack%2F&title=How%20to%20Create%20Affinity%20and%20Anti-Affinity%20Policy%20in%20OpenStack
[7]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Fcreate-affinity-anti-affinity-policy-openstack%2F&title=How%20to%20Create%20Affinity%20and%20Anti-Affinity%20Policy%20in%20OpenStack
