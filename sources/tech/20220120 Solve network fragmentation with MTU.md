[#]: subject: "Solve network fragmentation with MTU"
[#]: via: "https://opensource.com/article/22/1/solve-network-fragmentation-mtu"
[#]: author: "Jair Patete https://opensource.com/users/jpatete"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Solve network fragmentation with MTU
======
This tutorial provides a workaround to help network administrators
address MTU issues without needing a stack update to move MTUs back and
forth.
![Coding on a computer][1]

During the implementation of OpenStack workloads, a common issue is fragmentation throughout the network, causing unforeseen performance issues. Fragmentation is normally difficult to address because networks can get complex, so the path of packets can be hard to trace or predict.

OpenStack initiates the network interface card (NIC) configuration during the initial setup of the cluster or when new nodes are added. The Message Transfer Unit (MTU) configuration is also generated at this stage. Changing the configuration after the cluster is deployed is not recommended. Normally, the System Integrator expects that the end-to-end path is properly configured before deploying and configuring the network for the stack to avoid constant MTU changes just for testing.

Neutron networks are created after OSP is deployed. This allows administrators to create 1500 MTU networks for the instances. However, the compute node itself is still set to the MTU, so fragmentation may still occur. In telco workloads, for example, the most common MTU value for all instances is 9000, so it's easy to inadvertently cause fragmentation after networks and instances have been created.

### Jumbo frames

Here's an example of an instance (deployed in OSP 16.1.5) configured with jumbo frames (8996), but you can see that the network path does not also have jumbo frames configured. This causes fragmentation because system packets use 8996 as the MTU.


```


$ ping 10.169.252.1 -M do -s 8968
PING 10.169.252.1 (10.169.252.1) 8968(8996) bytes of data.

\--- 10.169.252.1 ping statistics ---
7 packets transmitted, 0 received, 100% packet loss, time 5999ms

```

This shows 100% packet loss when no fragmentation is allowed. The output effectively identifies the issue and reveals a problem with the MTU in the network path. If you allow fragmentation, you can see there is a successful ping.


```


$ ping 10.169.252.1 -M dont -s 8968
PING 10.169.252.1 (10.169.252.1) 8968(8996) bytes of data.
8976 bytes from 10.169.252.1: icmp_seq=1 ttl=255 time=3.66 ms
8976 bytes from 10.169.252.1: icmp_seq=2 ttl=255 time=2.94 ms
8976 bytes from 10.169.252.1: icmp_seq=3 ttl=255 time=2.88 ms
8976 bytes from 10.169.252.1: icmp_seq=4 ttl=255 time=2.56 ms
8976 bytes from 10.169.252.1: icmp_seq=5 ttl=255 time=2.91 ms

\--- 10.169.252.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4005ms
rtt min/avg/max/mdev = 2.561/2.992/3.663/0.368 m

```

Having confirmed the issue, you might have to wait until the network team resolves the problem. In the meantime, fragmentation exists and impacts your system. You shouldn't update the stack to check whether the issue has been fixed, so in this article, I share one safe way to lower the end-to-end MTU inside the compute node.

### Adjusting the MTU

#### Step 1: Identify the hypervisor your instance is running on

First, you must obtain information about your instance. Do this from the Overcloud using the `openstack` command:


```


(overcloud)[director]$ openstack server \
show 2795221e-f0f7-4518-a5c5-85977357eeec \
-f json
{
  "OS-DCF:diskConfig": "MANUAL",
  "OS-EXT-AZ:availability_zone": "srvrhpb510-compute-2",
  "OS-EXT-SRV-ATTR:host": "srvrhpb510-compute-2.localdomain",
  "OS-EXT-SRV-ATTR:hostname": "server-2",
  "OS-EXT-SRV-ATTR:hypervisor_hostname": "srvrhpb510-compute-2.localdomain",
  "OS-EXT-SRV-ATTR:instance_name": "instance-00000248",
  "OS-EXT-SRV-ATTR:kernel_id": "",
  "OS-EXT-SRV-ATTR:launch_index": 0,
  "OS-EXT-SRV-ATTR:ramdisk_id": "",
  "OS-EXT-SRV-ATTR:reservation_id": "r-ms2ep00g",
  "OS-EXT-SRV-ATTR:root_device_name": "/dev/vda",
  "OS-EXT-SRV-ATTR:user_data": null,
  "OS-EXT-STS:power_state": "Running",
  "OS-EXT-STS:task_state": null,
  "OS-EXT-STS:vm_state": "active",
  "OS-SRV-USG:launched_at": "2021-12-16T18:57:24.000000",
  &lt;...&gt;
  "volumes_attached": ""
}

```

#### Step 2: Connect to the hypervisor and dump the XML of the instance

Next, you need a dump of the XML (using the `virsh dumpxml` command) that defines your instance. So you can filter it in the next step, redirect the output into a file:


```


[compute2]$ sudo podman \
exec -it nova_libvirt bash

(pod)[compute2]# virsh \
list --all
 Id   Name                State
\-----------------------------------
 6    instance-00000245   running
 7    instance-00000248   running

(pod)[compute2]# virsh dumpxml instance-00000245 | tee inst245.xml
&lt;domain type='kvm' id='6'&gt;
  &lt;name&gt;instance-00000245&lt;/name&gt;
  &lt;uuid&gt;1718c7d4-520a-4366-973d-d421555295b0&lt;/uuid&gt;
  &lt;metadata&gt;
    &lt;nova:instance xmlns:nova="[http://openstack.org/xmlns/libvirt/nova/1.0"\&gt;][2]
      &lt;nova:package version="20.4.1-1.20201114041747.el8ost"/&gt;
      &lt;nova:name&gt;server-1&lt;/nova:name&gt;
      &lt;nova:creationTime&gt;2021-12-16 18:57:03&lt;/nova:creationTime&gt;
[...]
&lt;/domain&gt;

```

#### Step 3: Examine the XML output

After you have the XML output, use your favourite pager or text editor to get the network interface information for the instance.


```


&lt;interface type='bridge'&gt;
      &lt;mac address='fa:16:3e:f7:15:db'/&gt;
      &lt;source bridge='br-int'/&gt;
      &lt;virtualport type='openvswitch'&gt;
        &lt;parameters interfaceid='da128923-84c7-435e-9ec1-5a000ecdc163'/&gt;
      &lt;/virtualport&gt;
      &lt;target dev='tap123'/&gt;
      &lt;model type='virtio'/&gt;
      &lt;driver name='vhost' rx_queue_size='1024'/&gt;
      &lt;mtu size='8996'/&gt;
      &lt;alias name='net0'/&gt;
      &lt;address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/&gt;
    &lt;/interface&gt;

```

From this output, filter the source bridge (on the compute node) and the target device (the physical interface in the compute node).

This output can change depending on the firewall type you are using, or if you are using security groups where the flow is a bit different, but all the host interfaces are displayed, and the next steps apply to all of them.

#### Step 4: Look at the target device

In this case, `tap123` on the compute node is the target device, so examine it with the [ip command][3]:


```


[compute2]$ ip addr show tap123

tap123: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 8996
        inet6 fe80::fc16:3eff:fef7:15db  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether fe:16:3e:f7:15:db  txqueuelen 10000  (Ethernet)
       [...]

```

You can see that the MTU is 8996, as expected. You can also find the MAC address (fe:16:3e:f7:15:db), so you can optionally confirm the port using the OpenStack port commands.

You can also check this interface is in the br-int bridge:


```


Bridge br-int
       [...]
        Port tap123
            tag: 1
            Interface tap123

```

That's also as expected because this allows South and North traffic for this instance using the external network.

#### Step 5: Change the MTU

Apply a common MTU change on the host specifically for your target interface (`tap123` in this example).


```


[compute2]$ sudo ifconfig tap123 mtu 1500
[compute2]$ ip addr show tap123 | grep mtu
tap123: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500

```

#### Step 6: Repeat

Now repeat the procedure inside the instance to move the mtu from 8996 to 1500. This covers the hypervisor part, as neutron is still configured with jumbo frames.


```


[localhost]$ sudo ip link set dev eth0 mtu 1500
[localhost]$ ip addr show eth0
eth0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 10.169.252.186  netmask 255.255.255.255  broadcast 0.0.0.0
        inet6 fe80::f816:3eff:fef7:15db  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether fa:16:3e:f7:15:db  txqueuelen 1000  (Ethernet)
        RX packets 1226  bytes 242462 (236.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 401  bytes 292332 (285.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```

### Validation

Now the path inside the local network has an MTU of 1500. If you try to send a packet bigger than this, an error should be displayed:


```


[localhost]$ ping 10.169.252.1 -M do -s 1500
PING 10.169.252.1 (10.169.252.1) 1500(1528) bytes of data.
ping: local error: Message too long, mtu=1500
ping: local error: Message too long, mtu=1500
ping: local error: Message too long, mtu=1500
ping: local error: Message too long, mtu=1500

\--- 10.169.252.1 ping statistics ---
4 packets transmitted, 0 received, +4 errors, 100% packet loss, time 3000ms

```

This ping adds 28 bytes to the header, attempting to send a payload of 1500 bytes + 28 bytes. The system cannot send it because it exceeds the MTU. Once you decrease the payload to 1472, you can successfully send the ping in a single frame.


```


[localhost]$ ping 10.169.252.1 -M do -s 1472
PING 10.169.252.1 (10.169.252.1) 1472(1500) bytes of data.
1480 bytes from 10.169.252.1: icmp_seq=1 ttl=255 time=1.37 ms
1480 bytes from 10.169.252.1: icmp_seq=2 ttl=255 time=1.11 ms
1480 bytes from 10.169.252.1: icmp_seq=3 ttl=255 time=1.02 ms
1480 bytes from 10.169.252.1: icmp_seq=4 ttl=255 time=1.12 ms

\--- 10.169.252.1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 1.024/1.160/1.378/0.131 ms

```

This is how to end fragmentation problems when the platform sends 9000-byte packets to the network, but fragmentation still occurs in some network components. You have now solved retransmission issues, packet loss, jitter, latency, and other related problems.

When the network team resolves the network issues, you can revert the MTU commands back to the previous value. This is how you fix network issues without needing to redeploy the stack.

### End-to-end simulation

Here's how to simulate the issue in an end-to-end scenario to see how it works. Instead of pinging the gateway, you can ping a second instance. You should observe how an MTU mismatch causes issues, specifically when an application is marking packets as Not-Fragment.

Assume your servers have the following specifications:

**Server 1:**
Hostname: server1
IP: 10.169.252.186/24
MTU: 1500

**Server 2:**
Hostname: server2
IP: 10.169.252.184/24
MTU: 8996

Connect to **server1** and ping to **server2**:


```


[server1]$ ping 10.169.252.184
PING 10.169.252.184 (10.169.252.184) 56(84) bytes of data.
64 bytes from 10.169.252.184: icmp_seq=1 ttl=64 time=0.503 ms
64 bytes from 10.169.252.184: icmp_seq=2 ttl=64 time=0.193 ms
64 bytes from 10.169.252.184: icmp_seq=3 ttl=64 time=0.213 ms

\--- 10.169.252.184 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2000ms
rtt min/avg/max/mdev = 0.193/0.303/0.503/0.141 ms

```

Connect to **server1** and ping to **server2** without fragmentation with an MTU of 1500:


```


[server1]$ ping 10.169.252.184 -M do -s 1472
PING 10.169.252.184 (10.169.252.184) 1472(1500) bytes of data.
1480 bytes from 10.169.252.184: icmp_seq=1 ttl=64 time=0.512 ms
1480 bytes from 10.169.252.184: icmp_seq=2 ttl=64 time=0.293 ms
1480 bytes from 10.169.252.184: icmp_seq=3 ttl=64 time=0.230 ms
1480 bytes from 10.169.252.184: icmp_seq=4 ttl=64 time=0.268 ms
1480 bytes from 10.169.252.184: icmp_seq=5 ttl=64 time=0.230 ms
1480 bytes from 10.169.252.184: icmp_seq=6 ttl=64 time=0.208 ms
1480 bytes from 10.169.252.184: icmp_seq=7 ttl=64 time=0.219 ms
1480 bytes from 10.169.252.184: icmp_seq=8 ttl=64 time=0.229 ms
1480 bytes from 10.169.252.184: icmp_seq=9 ttl=64 time=0.228 ms

\--- 10.169.252.184 ping statistics ---
9 packets transmitted, 9 received, 0% packet loss, time 8010ms
rtt min/avg/max/mdev = 0.208/0.268/0.512/0.091 ms

```

The MTU of **server1** is 1500, and **server2** has an MTU size larger than that, so an application running on **server1** sending packets to **server2** has no fragmentation issues. What happens if **server2**'s application is also set to Not-Fragment, but uses an MTU of 9000?


```


[localhost]$ ping 10.169.252.186 -M do -s 8968
PING 10.169.252.186 (10.169.252.186) 8968(8996) bytes of data.

\--- 10.169.252.186 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 8999ms

```

Fragmentation occurs, and the packets sent were lost.

To correct this, repeat the MTU fix so that both servers have the same MTU. As a test, revert **server1**:


```


[compute2]$ sudo ip link set dev tap123 mtu 8996
[compute2]$ ip addr show tap123 | grep mtu
tap123: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 8996

[server1]$ sudo ip link set dev eth0 mtu 8996
[server1]$ ip addr show eth0 | grep mtu
eth0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 8996
[...]

```

Now repeat the 9000 byte payload ping without fragmentation allowed:


```


[server2]$ ping 10.169.252.186 -M do -s 8968
PING 10.169.252.186 (10.169.252.186) 8968(8996) bytes of data.
8976 bytes from 10.169.252.186: icmp_seq=1 ttl=64 time=1.60 ms
8976 bytes from 10.169.252.186: icmp_seq=2 ttl=64 time=0.260 ms
8976 bytes from 10.169.252.186: icmp_seq=3 ttl=64 time=0.257 ms
8976 bytes from 10.169.252.186: icmp_seq=4 ttl=64 time=0.210 ms
8976 bytes from 10.169.252.186: icmp_seq=5 ttl=64 time=0.249 ms
8976 bytes from 10.169.252.186: icmp_seq=6 ttl=64 time=0.250 ms

\--- 10.169.252.186 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5001ms
rtt min/avg/max/mdev = 0.210/0.472/1.607/0.507 ms

```

### Troubleshooting MTU

This is an easy workaround to help network administrators address MTU issues without needing a stack update to move MTUs back and forth. All these MTU configurations are also temporary. An instance or system reboot causes all interfaces to revert to the original (and configured value).

It also takes only a few minutes to perform, so I hope you find this useful.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/solve-network-fragmentation-mtu

作者：[Jair Patete][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jpatete
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://openstack.org/xmlns/libvirt/nova/1.0"\>
[3]: https://opensource.com/article/18/5/useful-things-you-can-do-with-ip-tool-linux
