Top 30 OpenStack Interview Questions and Answers
======
Now a days most of the firms are trying to migrate their IT infrastructure and Telco Infra into private cloud i.e OpenStack. If you planning to give interviews on Openstack admin profile, then below list of interview questions might help you to crack the interview.

![](https://www.linuxtechi.com/wp-content/uploads/2018/11/OpenStack-Interview-Questions.jpg)

### Q:1 Define OpenStack and its key components?

Ans: It is a bundle of opensource software, which all in combine forms a provide cloud software known as OpenStack.OpenStack is known as Stack of Open source Software or Projects.

Following are the key components of OpenStack

  * **Nova** – It handles the Virtual machines at compute level and performs other computing task at compute or hypervisor level.
  * **Neutron** – It provides the networking functionality to VMs, Compute and Controller Nodes.
  * **Keystone** – It provides the identity service for all cloud users and openstack services. In other words, we can say Keystone a method to provide access to cloud users and services.
  * **Horizon** – It provides a GUI (Graphical User Interface), using the GUI Admin can all day to day operations task at ease.
  * **Cinder** – It provides the block storage functionality, generally in OpenStack Cinder is integrated with Chef and ScaleIO to service block storage to Compute  & Controller nodes.
  * **Swift** – It provides the object storage functionality. Generally, Glance images are on object storage. External storage like ScaleIO can work as Object storage too and can easily be integrated with Glance Service.
  * **Glance** – It provides Cloud image services, using glance admin used to upload and download cloud images.
  * **Heat** – It provides an orchestration service or functionality. Using Heat admin can easily VMs as stack and based on requirements VMs in the stack can be scale-in and Scale-out
  * **Ceilometer** – It provides the telemetry and billing services.



### Q:2 What are services generally run on a controller node?

Ans: Following services run on a controller node:

  * Identity Service ( KeyStone)
  * Image Service ( Glance)
  * Nova Services like Nova API, Nova Scheduler & Nova DB
  * Block & Object Service
  * Ceilometer Service
  * MariaDB / MySQL and RabbitMQ Service
  * Management services of Networking (Neutron) and Networking agents
  * Orchestration Service (Heat)



### Q:3 What are the services generally run on a Compute Node?

Ans: Following services run on a compute node,

  * Nova-Compute
  * Networking Services like OVS



### Q:4 What is the default location of VMs on the Compute Nodes?

Ans: VMs in the Compute node are stored at “ **/var/lib/nova/instances** ”

### Q:5 What is default location of glance images?

Ans: As the Glance service runs on a controller node, all the glance images are store under the folder “ **/var/lib/glance/images** ” on a controller node.

Read More : [**How to Create and Delete Virtual Machine(VM) from Command line in OpenStack**][1]

### Q:6 Tell me the command how to spin a VM from Command Line?

Ans: We can easily spin a new VM using the following openstack command,

```
# openstack server create --flavor {flavor-name} --image {Image-Name-Or-Image-ID}  --nic net-id={Network-ID} --security-group {Security_Group_ID} –key-name {Keypair-Name} <VM_Name>
```

### Q:7 How to list the network namespace of a tenant in OpenStack?

Ans: Network namespace of a tenant can be listed using “ip net ns” command

```
~# ip netns list
qdhcp-a51635b1-d023-419a-93b5-39de47755d2d
haproxy
vrouter
```

### Q:8 How to execute command inside network namespace in openstack?

Ans: Let’s assume we want to execute “ifconfig” command inside the network namespace “qdhcp-a51635b1-d023-419a-93b5-39de47755d2d”, then run the beneath command,

Syntax : ip netns exec {network-space} <command>

```
~# ip netns exec qdhcp-a51635b1-d023-419a-93b5-39de47755d2d "ifconfig"
```

### Q:9 How to upload and download a cloud image in Glance from command line?

Ans: A Cloud image can be uploaded in glance from command using beneath openstack command,

```
~# openstack image create --disk-format qcow2 --container-format bare   --public --file {Name-Cloud-Image}.qcow2     <Cloud-Image-Name>
```

Use below openstack command to download a cloud image from command line,

```
~# glance image-download --file <Cloud-Image-Name> --progress  <Image-ID>
```

### Q:10 How to reset error state of a VM into active in OpenStack env?

Ans: There are some scenarios where some VMs went to error state and this error state can be changed into active state using below commands,

```
~# nova reset-state --active {Instance_id}
```

### Q:11 How to get list of available Floating IPs from command line?

Ans: Available floating ips can be listed using the below command,

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/create-delete-virtual-machine-command-line-openstack/
[2]: https://www.linuxtechi.com/step-by-step-instance-creation-flow-in-openstack/
