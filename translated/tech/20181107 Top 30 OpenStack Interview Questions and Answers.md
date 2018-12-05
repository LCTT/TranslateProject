
Openstack  30个经典面试问题和解答
======

现在，大多数公司都试图将它们的 IT 基础设施和 Telco Infra 迁移到私有云，即OpenStack。如果你打算面试 OpenStack 管理员这个岗位，那么下面列出的这些面试问题可能会帮助你通过面试。

![](https://www.linuxtechi.com/wp-content/uploads/2018/11/OpenStack-Interview-Questions.jpg)

### Q:1 说一下 OpenStack 及其主要组件？

Ans: OpenStack 是一系列开源软件，这些软件组成了一个云提供软件，也就是 OpenStack，被称为开源软件或项目栈。

下面是 OpenStack 的主要关键组件：
  
  * **Nova** – 用于计算级别管理虚拟机，并在计算或管理程序级别执行其他计算任务。
  * **Neutron** – 为虚拟机、计算和控制节点提供网络功能。
  * **Keystone** – 为所有云用户和 OpenStack 云服务提供身份认证服务。换句话说，我们可以说 Keystone 是一个提供给云用户和云服务访问权限的方法。
  * **Horizon** – 用于提供图形用户界面。使用图形化管理界面可以很轻松地完成各种日常操作任务。
  * **Cinder** – 用于提供块存储功能。通常来说 OpenStack 的 Cinder 中集成了 Chef 和 ScaleIO 来共同为计算和控制节点提供块存储服务。
  * **Swift** – 用于提供对象存储功能。通常来说，Glance 管理的镜像是存储在对象存储空间的。扩展存储就像 ScaleIO 也可以提供对象存储，可以很容易的集成 Glance 服务。
  * **Glance** – 用于提供镜像服务。使用 Glance 的管理平台来上传和下载云镜像。
  * **Heat** – 用于提供编排服务或功能。使用 Heat 管理平台可以轻松地将虚拟机作为堆栈，并且根据需要可以将虚拟机扩展或收缩。
  * **Ceilometer** – 用于提供计量与监控功能。



### Q:2 什么服务通常在控制节点上运行？

Ans: 以下服务通常在控制节点上运行：

  * 认证服务 ( KeyStone)
  * 镜像服务 ( Glance)
  * Nova 服务比如 Nova API, Nova Scheduler 和 Nova DB
  * 块存储和对象存储服务
  * Ceilometer 服务
  * MariaDB / MySQL 和 RabbitMQ 服务
  * 网络(Neutron)和网络代理的管理服务
  * 编排服务 (Heat)



### Q:3 什么服务通常在计算节点上运行？

Ans: 以下服务通常在计算节点运行：

  * Nova 计算
  * 网络服务，比如 OVS



### Q:4 计算节点上虚拟机的默认地址是什么?

Ans: 虚拟机存储在计算节点的 “ **/var/lib/nova/instances** ”

### Q:5 Glance 镜像的默认地址是什么？

Ans: 因为Glance 服务运行在控制节点上，所以 Glance 镜像都被存储在控制节点的“ **/var/lib/glance/images** ”文件夹下。

想了解更多请访问 : [**在 OpenStack 中如何使用命令行创建和删除虚拟机**][1]

### Q:6 说一下如何使用命令行启动一个虚拟机？

Ans: 我们可以使用如下 OpenStack 命令来启动一个新的虚拟机:

```
# openstack server create --flavor {flavor-name} --image {Image-Name-Or-Image-ID}  --nic net-id={Network-ID} --security-group {Security_Group_ID} –key-name {Keypair-Name} <VM_Name>
```

### Q:7 如何在 OpenStack 中显示用户的网络命名空间列表？

Ans: 可以使用 “ip net ns” 命令来列出用户的网络命名空间。

```
~# ip netns list
qdhcp-a51635b1-d023-419a-93b5-39de47755d2d
haproxy
vrouter
```

### Q:8 如何在 OpenStack 中执行网络命名空间内的命令？

Ans: 假设我们想在 “qdhcp-a51635b1-d023-419a-93b5-39de47755d2d” 网络命名空间中执行 “ifconfig” 命令，我们可以执行如下命令。

格式 : ip netns exec {network-space} <command>

```
~# ip netns exec qdhcp-a51635b1-d023-419a-93b5-39de47755d2d "ifconfig"
```

### Q:9 在 Glance 服务中如何使用命令行上传和下载镜像？

Ans: Glance 服务中云镜像上传可以使用如下 OpenStack 命令：

```
~# openstack image create --disk-format qcow2 --container-format bare   --public --file {Name-Cloud-Image}.qcow2     <Cloud-Image-Name>
```

下载云镜像则使用如下命令：

```
~# glance image-download --file <Cloud-Image-Name> --progress  <Image-ID>
```

### Q:10 OpenStack 如何将虚拟机从错误状态转换为活动状态？

Ans: 在某些情况下虚拟机可能会进入错误状态，可以使用如下命令将错误状态转换为活动状态：

```
~# nova reset-state --active {Instance_id}
```

### Q:11 如何使用命令行来获取可使用的浮动 IP 列表？

Ans: 可使用如下命令来显示可用浮动 IP 列表：

```
~]# openstack ip floating list | grep None | head -10
```

### Q:12 How to provision a virtual machine in specific availability zone and compute Host?

Ans: Let’s assume we want to provision a VM on the availability zone NonProduction in compute-02, use the beneath command to accomplish this,

```
~]# openstack server create --flavor m1.tiny --image cirros --nic net-id=e0be93b8-728b-4d4d-a272-7d672b2560a6 --security-group NonProd_SG  --key-name linuxtec --availability-zone NonProduction:compute-02  nonprod_testvm
```

### Q:13 How to get list of VMs which are provisioned on a specific Compute node?

Ans: Let’s assume we want to list the vms which are provisioned on compute-0-19, use below

Syntax: openstack server list –all-projects –long -c Name -c Host | grep -i {Compute-Node-Name}

```
~# openstack server list --all-projects --long -c Name -c Host | grep -i  compute-0-19
```

### Q:14 How to view the console log of an openstack instance from command line?

Ans: Console logs of an instance can be viewed from the command line using the following commands,

First get the ID of an instance and then use the below command,

```
~# openstack console log show {Instance-id}
```

### Q:15 How to get console URL of an openstack instance?

Ans: Console URL of an instance can be retrieved from command line using the below openstack command,

```
~# openstack console url show {Instance-id}
```

### Q:16 How to create a bootable cinder / block storage volume from command line?

Ans: To Create a bootable cinder or block storage volume (assume 8 GB) , refer the below steps:

  * Get Image list using below



```
~# openstack image list | grep -i cirros
| 89254d46-a54b-4bc8-8e4d-658287c7ee92 | cirros  | active |
```

  * Create bootable volume of size 8 GB using cirros image



```
~# cinder create --image-id 89254d46-a54b-4bc8-8e4d-658287c7ee92 --display-name cirros-bootable-vol  8
```

### Q:17 How to list all projects or tenants that has been created in your opentstack?

Ans: Projects or tenants list can be retrieved from the command using the below openstack command,

```
~# openstack project list --long
```

### Q:18 How to list the endpoints of openstack services?

Ans: Openstack service endpoints are classified into three categories,

  * Public Endpoint
  * Internal Endpoint
  * Admin Endpoint



Use below openstack command to view endpoints of each openstack service,

```
~# openstack catalog list
```

To list the endpoint of a specific service like keystone use below,

```
~# openstack catalog show keystone
```

Read More : [**Step by Step Instance Creation Flow in OpenStack**][2]

### Q:19 In which order we should restart nova services on a controller node?

Ans: Following order should be followed to restart the nova services on openstack controller node,

  * service nova-api restart
  * service nova-cert restart
  * service nova-conductor restart
  * service nova-consoleauth restart
  * service nova-scheduler restart



### Q:20 Let’s assume DPDK ports are configured on compute node for data traffic, now how you will check the status of dpdk ports?

Ans: As DPDK ports are configured via openvSwitch (OVS), use below commands to check the status,

### Q:21 How to add new rules to the existing SG(Security Group) from command line in openstack?

Ans: New rules to the existing SG in openstack can be added using the neutron command,

```
~# neutron security-group-rule-create --protocol <tcp or udp>  --port-range-min <port-number> --port-range-max <port-number> --direction <ingress or egress>  --remote-ip-prefix <IP-address-or-range> Security-Group-Name
```

### Q:22 How to view the OVS bridges configured on Controller and Compute Nodes?

Ans: OVS bridges on Controller and Compute nodes can be viewed using below command,

```
~]# ovs-vsctl show
```

### Q:23 What is the role of Integration Bridge(br-int) on the Compute Node ?

Ans: The integration bridge (br-int) performs VLAN tagging and untagging for the traffic coming from and to the instance running on the compute node.

Packets leaving the n/w interface of an instance goes through the linux bridge (qbr) using the virtual interface qvo. The interface qvb is connected to the Linux Bridge & interface qvo is connected to integration bridge (br-int). The qvo port on integration bridge has an internal VLAN tag that gets appended to packet header when a packet reaches to the integration bridge.

### Q:24 What is the role of Tunnel Bridge (br-tun) on the compute node?

Ans: The tunnel bridge (br-tun) translates the VLAN tagged traffic from integration bridge to the tunnel ids using OpenFlow rules.

br-tun (tunnel bridge) allows the communication between the instances on different networks. Tunneling helps to encapsulate the traffic travelling over insecure networks, br-tun supports two overlay networks i.e GRE and VXLAN

### Q:25 What is the role of external OVS bridge (br-ex)?

Ans: As the name suggests, this bridge forwards the traffic coming to and from the network to allow external access to instances. br-ex connects to the physical interface like eth2, so that floating IP traffic for tenants networks is received from the physical network and routed to the tenant network ports.

### Q:26 What is function of OpenFlow rules in OpenStack Networking?

Ans: OpenFlow rules is a mechanism that define how a packet will reach to destination starting from its source. OpenFlow rules resides in flow tables. The flow tables are part of OpenFlow switch.

When a packet arrives to a switch, it is processed by the first flow table, if it doesn’t match any flow entries in the table then packet is dropped or forwarded to another table.

### Q:27 How to display the information about a OpenFlow switch (like ports, no. of tables, no of buffer)?

Ans: Let’s assume we want to display the information about OpenFlow switch (br-int), run the following command,

```
root@compute-0-15# ovs-ofctl show br-int
OFPT_FEATURES_REPLY (xid=0x2): dpid:0000fe981785c443
n_tables:254, n_buffers:256
capabilities: FLOW_STATS TABLE_STATS PORT_STATS QUEUE_STATS ARP_MATCH_IP
actions: output enqueue set_vlan_vid set_vlan_pcp strip_vlan mod_dl_src mod_dl_dst mod_nw_src mod_nw_dst mod_nw_tos mod_tp_src mod_tp_dst
 1(patch-tun): addr:3a:c6:4f:bd:3e:3b
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 2(qvob35d2d65-f3): addr:b2:83:c4:0b:42:3a
     config:     0
     state:      0
     current:    10GB-FD COPPER
     speed: 10000 Mbps now, 0 Mbps max
 ………………………………………
```

### Q:28 How to display the entries for all the flows in a switch?

Ans: Flows entries of a switch can be displayed using the command ‘ **ovs-ofctl dump-flows** ‘

Let’s assume we want to display flow entries of OVS integration bridge (br-int),

### Q:29 What are Neutron Agents and how to list all neutron agents?

Ans: OpenStack neutron server acts as the centralized controller, the actual network configurations are executed either on compute and network nodes. Neutron agents are software entities that carry out configuration changes on compute or network nodes. Neutron agents communicate with the main neutron service via Neuron API and message queue.

Neutron agents can be listed using the following command,

```
~# openstack network agent list -c ‘Agent type’ -c Host -c Alive -c State
```

### Q:30 What is CPU pinning?

Ans: CPU pinning refers to reserving the physical cores for specific virtual machine. It is also known as CPU isolation or processor affinity. The configuration is in two parts:

  * it ensures that virtual machine can only run on dedicated cores
  * it also ensures that common host processes don’t run on those cores



In other words we can say pinning is one to one mapping of a physical core to a guest vCPU.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/openstack-interview-questions-answers/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[ScarboroughCoral](https://github.com/ScarboroughCoral)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/create-delete-virtual-machine-command-line-openstack/
[2]: https://www.linuxtechi.com/step-by-step-instance-creation-flow-in-openstack/
