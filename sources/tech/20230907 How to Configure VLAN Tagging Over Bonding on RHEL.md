[#]: subject: "How to Configure VLAN Tagging Over Bonding on RHEL"
[#]: via: "https://www.2daygeek.com/configure-vlan-tagging-over-network-bonding-rhel/"
[#]: author: "Jayabal Thiyagarajan https://www.2daygeek.com/author/jayabal/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Configure VLAN Tagging Over Bonding on RHEL
======

In Linux, you can create advanced network setups such as Network Bonding or NIC teaming, VLAN tagging, and bridging based on your needs. These advanced features allow for increased network connectivity efficiency and reliability.

You can create VLAN interfaces on top of another interface, such as Ethernet, bond, team, or bridge devices.

In this article, we will learn how to configure VLAN tagging over Network Bonding in RHEL system, which allows traffics from different networks to share common physical links.

### Prerequisites for tagging VLAN over Bonding:

  * The Network team need to enable LACP (802.3ad) on the Network switch ports to aggregate the links.
  * The Network team need to configure network port as a trunk port, which enables more than one VLAN to be added to the same port. Also, get the VLAN ID from them in order to configure at OS level.
  * A Linux system should have two interfaces.
  * If it’s a physical server, we recommend configuring bonding between the On-Board and PCI interfaces to avoid a single point of failure on the network card on the host side.



#### Bonding Kernel Module

Check if the bonding module is already loaded on your Linux system using the **lsmod command**.

```

    lsmod | grep -i bonding

    bonding               12451  0

```

It would have loaded by default. Otherwise, load it using the **modprobe command**.

```

    modprobe bonding

```

#### VLAN tagging Kernel Module

VLAN tagging (802.1q) is a kernel module that allows us to assign multiple IPs from different VLAN on the same Ethernet card (NIC) on Linux servers. Check if the VLAN module is already loaded on your Linux system using the lsmod command.

```

    lsmod | grep 8021q

    8021q                  33080  0
    garp                   14384  1 8021q
    mrp                    18542  1 8021q

```

It would have loaded by default. Otherwise, load it using the modprobe command.

```

    modprobe 8021q

```

### 1) LACP Bonding Configuration

We will be configuring LACP (Mode 4 – 802.3ad) based bonding for link aggregation, which provides increased bandwidth for bonding interface by combining two interfaces named **em1** and **p7p1**.

#### 1a) Creating Bond Interface

Create a bond interface file **`'ifcfg-bond0'`** under the directory **`'/etc/sysconfig/network-scripts/'`**.

```

    vi /etc/sysconfig/network-scripts/ifcfg-bond0

    TYPE=Bond
    DEVICE=bond0
    NAME=bond0
    BONDING_MASTER=yes
    BOOTPROTO=none
    ONBOOT=yes
    BONDING_OPTS="mode=4 miimon=100 lacp_rate=1"
    NM_CONTROLLED=no

```

#### 1b) Configuring First Slave Interface

Configure the first slave interface **`'em1'`** that you want to bring into bonding. Please use the correct interface name as per your environment.

```

    vi /etc/sysconfig/network-scripts/ifcfg-em1

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=em1
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes

```

#### 1c) Configuring Second Slave Interface

Configure the second slave interface **`'p7p1'`** that you want to bring into bonding. Please use the correct interface name as per your environment.

```

    vi /etc/sysconfig/network-scripts/ifcfg-p7p1

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=p7p1
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes

```

#### Restarting network services

Restart the network services to enable the bonding interface or bring them up using ifup command.

```

    systemctl restart network

```

### 2) VLAN tagging over Bonding Interface

LACP Bonding configuration has been completed and all interfaces are up and running now. Let’s configure the VLAN tagging over bonding interface by following the below procedures.

As discussed in the prerequisites, following are the VLANs which is mapped to the respective Ethernet Card port (em1 & p7p1) and Network switch port.

  * VLAN ID (221), VLAN N/W = 192.168.10.0/24
  * VLAN ID (331), VLAN N/W = 192.168.20.0/24



#### 2a) Configuring VLAN 221 to Bond0

Create tagged interface file for VLAN id 221 as **`"/etc/sysconfig/network-scripts/ifcfg-bond0.221"`** and add the following contents.

```

    vi /etc/sysconfig/network-scripts/ifcfg-bond0.221

    DEVICE=bond0.221
    BOOTPROTO=none
    ONBOOT=yes
    IPADDR=192.168.10.100
    NETMASK=255.255.255.0
    GATEWAY=192.168.10.1
    VLAN=yes
    NM_CONTROLLED=no

```

#### 2b) Configuring VLAN 331 to Bond0

Create tagged interface file for VLAN id 331 as **`"/etc/sysconfig/network-scripts/ifcfg-bond0.331"`** and add the following contents.

```

    vi /etc/sysconfig/network-scripts/ifcfg-bond0.331

    DEVICE=bond0.331
    BOOTPROTO=none
    ONBOOT=yes
    IPADDR=192.168.20.100
    NETMASK=255.255.255.0
    GATEWAY=192.168.20.1
    VLAN=yes
    NM_CONTROLLED=no

```

#### Restarting network services

Restart the network services to enable the bonding interface or bring them up using ifup command.

```

    systemctl restart network

```

### Verify VLAN Tagging Configuration

Finally verify whether the VLAN tagged interface are configured and up & running using the **[ip command][1]**.

Yes, I could see **`'bondo.221@bond0'`** and **`'bon0.331@bond0'`** with two different IPs and was able to access the system via ssh without any problems. So, VLAN tagging works as expected.

![][2]

##### Conclusion

Congratulations, you have learned how to configure VLAN tagging over LACP bonding on a RHEL system, which listens for two VLANs. VLAN tagging is not limited to two VLANs, multiple VLANs are supported, which you can add according to the network configuration of that VLAN.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/configure-vlan-tagging-over-network-bonding-rhel/

作者：[Jayabal Thiyagarajan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/jayabal/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-ip-command-configure-network-interface/
[2]: https://www.2daygeek.com/wp-content/uploads/2023/09/configure-vlan-tagging-over-bonding-rhel-1024x395.jpg
