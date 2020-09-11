[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Create Availability Zones in OpenStack from Command Line)
[#]: via: (https://www.linuxtechi.com/create-availability-zones-openstack-command-line/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Create Availability Zones in OpenStack from Command Line
======

In **OpenStack** terminology, **Availability Zones (AZ**) is defined as a logical partition of compute(nova), block storage (cinder) and network Service (neutron). Availability zones are required to segregate the work load of environments like production and non-production, let me elaborate this statement.

[![Availability-Zones-OpenStack-Command-Line][1]][2]

let’s suppose we have a tenant in OpenStack who wants to deploy their VMs in Production and Non-Production, so to create this type of setup in openstack , first we have to identify which computes will be considered as Production and Non-production then we have to create host-aggregate group where we will add the computes to the host-aggregate group and then we will map th host aggregate group to the Availability Zone.

In this tutorial we will demonstrate how to create and use computes availability zones in openstack via command line.

### Creating compute availability zones

Whenever OpenStack is deployed, Nova is the default Availability Zone(AZ) created automatically and all the compute nodes belongs to Nova AZ. Run the below openstack command from the controller node to list Availability zones,

```
~# source openrc
~# openstack availability zone list
+-----------+-------------+
| Zone Name | Zone Status |
+-----------+-------------+
| internal  | available   |
| nova      | available   |
| nova      | available   |
| nova      | available   |
+-----------+-------------+
~#
```

To list only compute’s availability zones, run the beneath openstack command,

```
~# openstack availability zone list --compute
+-----------+-------------+
| Zone Name | Zone Status |
+-----------+-------------+
| internal  | available   |
| nova      | available   |
+-----------+-------------+
~#
```

To list all compute hosts which are mapped to nova availability zone execute the below command,

```
~# openstack host list | grep -E "Zone|nova"
| Host Name              | Service     | Zone     |
| compute-0-1            | compute     | nova     |
| compute-0-2            | compute     | nova     |
| compute-0-4            | compute     | nova     |
| compute-0-3            | compute     | nova     |
| compute-0-8            | compute     | nova     |
| compute-0-6            | compute     | nova     |
| compute-0-9            | compute     | nova     |
| compute-0-5            | compute     | nova     |
| compute-0-7            | compute     | nova     |
~#
```

Let’s create a two host-aggregate group with name **production** and **non-production**, add compute-4,5 &amp; 6 to production host aggregate group and compute-7,8 &amp; 9 to non-production host aggregate group.

Create Production and Non-Production Host aggregate using following OpenStack commands,

```
~# openstack aggregate create production
+-------------------+----------------------------+
| Field             | Value                      |
+-------------------+----------------------------+
| availability_zone | None                       |
| created_at        | 2019-08-17T03:02:41.561259 |
| deleted           | False                      |
| deleted_at        | None                       |
| id                | 7                          |
| name              | production                 |
| updated_at        | None                       |
+-------------------+----------------------------+

~# openstack aggregate create non-production
+-------------------+----------------------------+
| Field             | Value                      |
+-------------------+----------------------------+
| availability_zone | None                       |
| created_at        | 2019-08-17T03:02:53.806713 |
| deleted           | False                      |
| deleted_at        | None                       |
| id                | 10                         |
| name              | non-production             |
| updated_at        | None                       |
+-------------------+----------------------------+
~#
```

Now create the availability zones and associate it to its respective host aggregate groups

**Syntax:**

# openstack aggregate set –zone &lt;az_name&gt;  &lt;host_aggregate_name&gt;

```
~# openstack aggregate set --zone production-az production
~# openstack aggregate set --zone non-production-az non-production
```

Finally add the compute host to its host-aggregate group

**Syntax:**

# openstack aggregate add host &lt;host_aggregate_name&gt;  &lt;compute_host&gt;

```
~# openstack aggregate add host production compute-0-4
~# openstack aggregate add host production compute-0-5
~# openstack aggregate add host production compute-0-6
```

Similarly add compute host to non-production host aggregation group,

```
~# openstack aggregate add host non-production compute-0-7
~# openstack aggregate add host non-production compute-0-8
~# openstack aggregate add host non-production compute-0-9
```

Execute the beneath openstack commands to verify Host aggregate group and its availability zone

```
~# openstack aggregate list
+----+----------------+-------------------+
| ID | Name           | Availability Zone |
+----+----------------+-------------------+
|  7 | production     | production-az     |
| 10 | non-production | non-production-az |
+----+----------------+-------------------+
~#
```

Run below commands to list computes associated to AZ and host aggregate group

```
~# openstack aggregate show production
+-------------------+--------------------------------------------+
| Field             | Value                                      |
+-------------------+--------------------------------------------+
| availability_zone | production-az                              |
| created_at        | 2019-08-17T03:02:42.000000                 |
| deleted           | False                                      |
| deleted_at        | None                                       |
| hosts             | [u'compute-0-4', u'compute-0-5', u'compute-0-6'] |
| id                | 7                                          |
| name              | production                                 |
| properties        |                                            |
| updated_at        | None                                       |
+-------------------+--------------------------------------------+

~# openstack aggregate show non-production
+-------------------+---------------------------------------------+
| Field             | Value                                       |
+-------------------+---------------------------------------------+
| availability_zone | non-production-az                           |
| created_at        | 2019-08-17T03:02:54.000000                  |
| deleted           | False                                       |
| deleted_at        | None                                        |
| hosts             | [u'compute-0-7', u'compute-0-8', u'compute-0-9'] |
| id                | 10                                          |
| name              | non-production                              |
| properties        |                                             |
| updated_at        | None                                        |
+-------------------+---------------------------------------------+
~#
```

Above command’s output confirm that we have successfully create host aggregate group and availability zones.

### Launch Virtual Machines in Availability Zones

Now let’s create couple virtual machines in these two availability zones, to create a vm in particular availability zone use below command,

**Syntax:**

# openstack server create –flavor &lt;flavor-name&gt; –image &lt;Image-Name-Or-Image-ID&gt;  –nic net-id=&lt;Network-ID&gt; –security-group &lt;Security-Group-ID&gt; –key-name &lt;Keypair-Name&gt; –availability-zone &lt;AZ-Name&gt;   &lt;VM-Name&gt;

Example is shown below:

```
~# openstack server create --flavor m1.small --image Cirros --nic net-id=37b9ab9a-f198-4db1-a5d6-5789b05bfb4c --security-group f8dda7c3-f7c3-423b-923a-2b21fe0bbf3c --key-name mykey --availability-zone production-az test-vm-prod-az
```

Run below command to verify virtual machine details:

```
~# openstack server show test-vm-prod-az
```

![Openstack-Server-AZ-command][1]

To create a virtual machine in a specific compute node under availability zone, use the below command,

**Syntax:**

# openstack server create –flavor &lt;flavor-name&gt; –image &lt;Image-Name-Or-Image-ID&gt;  –nic net-id=&lt;Network-ID&gt; –security-group &lt;Security-Group-ID&gt; –key-name {Keypair-Name} –availability-zone &lt;AZ-Name&gt;:&lt;Compute-Host&gt; &lt;VM-Name&gt;

Let suppose we want to spin a vm under production AZ on specific compute (compute-0-6), so to accomplish this, run the beneath command,

```
~# openstack server create --flavor m1.small --image Cirros --nic net-id=37b9ab9a-f198-4db1-a5d6-5789b05bfb4c --security-group f8dda7c3-f7c3-423b-923a-2b21fe0bbf3c --key-name mykey --availability-zone production-az:compute-0-6 test-vm-prod-az-host
```

Execute following command to verify the VM details:

```
~# openstack server show test-vm-prod-az-host
```

Output above command would be something like below:

![OpenStack-VM-AZ-Specific-Host][1]

Similarly, we can create virtual machines in non-production AZ, example is shown below

```
~# openstack server create --flavor m1.small --image Cirros --nic net-id=37b9ab9a-f198-4db1-a5d6-5789b05bfb4c --security-group f8dda7c3-f7c3-423b-923a-2b21fe0bbf3c --key-name mykey --availability-zone non-production-az vm-nonprod-az
```

Use below command verify the VM details,

```
~# openstack server show vm-nonprod-az
```

Output of above command would be something like below,

![OpenStack-Non-Production-AZ-VM][1]

### Removing Host aggregate group and Availability Zones

Let’s suppose we want to remove /delete above created host aggregate group and availability zones, for that first we must remove host from the host aggregate group, use the below command,

```
~# openstack aggregate show production
```

Above command will give u the list of compute host which are added to production host aggregate group.

Use below command to remove host from the host aggregate group

**Syntax:**

# openstack aggregate remove host &lt;host-aggregate-name&gt; &lt;compute-name&gt;

```
~# openstack aggregate remove host production compute-0-4
~# openstack aggregate remove host production compute-0-5
~# openstack aggregate remove host production compute-0-6
```

Once you remove all host from the group, then re-run the below command,

```
~# openstack aggregate show production
+-------------------+----------------------------+
| Field             | Value                      |
+-------------------+----------------------------+
| availability_zone | production-az              |
| created_at        | 2019-08-17T03:02:42.000000 |
| deleted           | False                      |
| deleted_at        | None                       |
| hosts             | []                         |
| id                | 7                          |
| name              | production                 |
| properties        |                            |
| updated_at        | None                       |
+-------------------+----------------------------+
~#
```

As we can see in above output there is no compute host associated to production host aggregate group, now we are good to remove the group

Use below command to delete host aggregate group and its associated availability zone

```
~# openstack aggregate delete production
```

Run the following command to check whether availability zone has been removed or not,

```
~# openstack availability zone list | grep -i production-az
~#
```

Similarly, you can refer the above steps to remove or delete non-production host aggregate and its availability zone.

That’s all from this tutorial, in case above content helps you to understand OpenStack host aggregate and availability zones then please do share your feedback and comments.

**Read Also: [Top 30 OpenStack Interview Questions and Answers][3]**

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/create-availability-zones-openstack-command-line/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/08/Availability-Zones-OpenStack-Command-Line.jpg
[3]: https://www.linuxtechi.com/openstack-interview-questions-answers/
