[#]: subject: "NMState: A declarative networking config tool"
[#]: via: "https://fedoramagazine.org/nmstate-a-declarative-networking-config-tool/"
[#]: author: "Maurizio Garcia https://fedoramagazine.org/author/malgnuz/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

NMState: A declarative networking config tool
======

![][1]

Comic excerpted from photo by [Bee Felten-Leidel][2] on [Unsplash][3]

This article describes and demonstrates NMState, a network manager that uses a declarative approach to configure hosts. This means you define the desired configuration state through an API and the tool applies the configuration through a provider.

### Configuration approaches: imperative vs declarative

Networking management can be a very complex task depending on the size and diversity of the environment. In the early days of IT, networking management relied on manual procedures performed by network administrators over networking devices. Nowadays, Infrastructure as Code (IaC) allows automation of those tasks in a different way. There are, essentially two approaches: imperative or declarative.

In an imperative approach you define “how” you will arrive at a desired configuration state. The declarative paradigm defines “what” is the desired configuration state, so it does not shape which steps are required nor in which order they must be performed. This approach is currently gathering more adepts and you can find it on most of the management and orchestration tools currently used.

### NMState: a declarative tool

NMState is a network manager that allows you to configure hosts following a declarative approach. It means you define the desired configuration state through a northbound declarative API and this tool applies the configuration through a southbound provider.

Currently the only provider supported by NMState is NetworkManager, which is the main service to address networking capabilities on Fedora Linux. However, the development life cycle of NMState will add other providers gradually.

For further information regarding NMState please visit either its project [site][4] or github [repository][5].

### Installation

NMState is available on Fedora Linux 29+ and requires NetworkManager 1.26 or later installed and running on the system. The following shows the installation on Fedora Linux 34:

```
$ sudo dnf -y install nmstate
…
output omitted
…
Installed:
  NetworkManager-config-server-1:1.30.4-1.fc34.noarch      gobject-introspection-1.68.0-3.fc34.x86_64      nispor-1.0.1-2.fc34.x86_64              nmstate-1.0.3-2.fc34.noarch
  python3-gobject-base-3.40.1-1.fc34.x86_64                python3-libnmstate-1.0.3-2.fc34.noarch          python3-nispor-1.0.1-2.fc34.noarch      python3-varlink-30.3.1-2.fc34.noarch

Complete!
```

At this point you can use _nmstatectl_ as a command line tool for NMState. Please refer to either _nmstatectl –help_ or _man nmstatectl_ for further information about this tool.

### Using NMstate

Start by checking the NMState version installed in the system:

```
$ nmstatectl version
1.0.3
```

Check the current configuration of a networking interface, e.g. the _eth0_ configuration:

```
$ nmstatectl show eth0
2021-06-29 10:28:21,530 root         DEBUG    NetworkManager version 1.30.4
2021-06-29 10:28:21,531 root         DEBUG    Async action: Retrieve applied config: ethernet eth0 started
2021-06-29 10:28:21,531 root         DEBUG    Async action: Retrieve applied config: ethernet eth1 started
2021-06-29 10:28:21,532 root         DEBUG    Async action: Retrieve applied config: ethernet eth0 finished
2021-06-29 10:28:21,533 root         DEBUG    Async action: Retrieve applied config: ethernet eth1 finished
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 100
    next-hop-address: 192.168.122.1
    next-hop-interface: eth0
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
interfaces:
- name: eth0
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.238
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: true
    address:
    - ip: fe80::c3c9:c4f9:75b1:a570
      prefix-length: 64
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    autoconf: true
    dhcp: true
  lldp:
    enabled: false
  mac-address: 52:54:00:91:E4:4E
  mtu: 1500
```

 As you can see above the networking configuration shows four main sections:

  * **dns-resolver**: this section has the nameserver configuration for this interface.
  * **route-rules**: it states the routing rules. 
  * **routes**: it includes both dynamic and static routes.
  * **Interfaces**: this section describes both ipv4 and ipv6 settings.



### Modify the configuration

You can modify the desired configuration state in two modes: 

  * **Interactive**: editing the interface configuration through _nmstatectl edit_. This command invokes the text editor defined by the environment variable EDITOR so the network state can be edited in yaml format. After finishing the edition NMState will apply the new network configuration unless there are syntax errors.


  * **File-based**: applying the interface configuration using _nmstatectl apply_ which imports a desired configuration state from a yaml or json file earlier created.



The following sections show you how to change the networking configuration using NMState. These changes can be disruptive to the system so the recommendation is to perform these tasks on a test system or guest VM till you get a better understanding of NMState.

The test system in use herehas two Ethernet interfaces: _eth0_ and _eth1_:

```
$ ip -br -4 a
lo               UNKNOWN        127.0.0.1/8
eth0             UP             192.168.122.238/24
eth1             UP             192.168.122.108/24
```

#### Example of interactive configuration mode:

```
Change the MTU of eth0 interface to 9000 bytes using the nmstatectl edit command as follows (all changes are in bold):
```

```
$ sudo nmstatectl edit eth0

---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 100
    next-hop-address: 192.168.122.1
    next-hop-interface: eth0
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
interfaces:
- name: eth0
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.123
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: true
    address:
    - ip: fe80::c3c9:c4f9:75b1:a570
      prefix-length: 64
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    autoconf: true
    dhcp: true
  lldp:
    enabled: false
  mac-address: 52:54:00:91:E4:4E
  mtu: 9000
```

After saving and exiting the edito, NMState applies the new network desired state:

```
2021-06-29 11:29:05,726 root         DEBUG    Nmstate version: 1.0.3
2021-06-29 11:29:05,726 root         DEBUG    Applying desire state: {'dns-resolver': {'config': {}, 'running': {'search': [], 'server': ['192.168.122.1']}}, 'route-rules': {'config': []}, 'routes': {'config': [], 'running': [{'destination': 'fe80::/64', 'metric': 102, 'next-hop-address': '', 'next-hop-interface': 'eth0', 'table-id': 254}, {'destination': '0.0.0.0/0', 'metric': 102, 'next-hop-address': '192.168.122.1', 'next-hop-interface': 'eth0', 'table-id': 254}, {'destination': '192.168.122.0/24', 'metric': 102, 'next-hop-address': '', 'next-hop-interface': 'eth0', 'table-id': 254}]}, 'interfaces': [{'name': 'eth0', 'type': 'ethernet', 'state': 'up', 'ipv4': {'enabled': True, 'address': [{'ip': '192.168.122.238', 'prefix-length': 24}], 'auto-dns': True, 'auto-gateway': True, 'auto-route-table-id': 0, 'auto-routes': True, 'dhcp': True}, 'ipv6': {'enabled': True, 'address': [{'ip': 'fe80::5054:ff:fe91:e44e', 'prefix-length': 64}], 'auto-dns': True, 'auto-gateway': True, 'auto-route-table-id': 0, 'auto-routes': True, 'autoconf': True, 'dhcp': True}, 'lldp': {'enabled': False}, 'mac-address': '52:54:00:91:E4:4E', 'mtu': 9000}]}
--- output omitted ---
2021-06-29 11:29:05,760 root         DEBUG    Async action: Update profile uuid:2bdee700-f62b-365a-bd1d-69d9c31a9f0c iface:eth0 type:ethernet started
2021-06-29 11:29:05,792 root         DEBUG    Async action: Update profile uuid:2bdee700-f62b-365a-bd1d-69d9c31a9f0c iface:eth0 type:ethernet finished
```

Now, use both the _ip_ command and also the _eth0_ configuration file to check that the _MTU_ of _eth0_ is 9000 bytes.

```
$ ip link show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 52:54:00:91:e4:4e brd ff:ff:ff:ff:ff:ff
    altname enp1s0

$ sudo cat /etc/NetworkManager/system-connections/eth0.nmconnection
[sudo] password for admin:
[connection]
id=eth0
uuid=2bdee700-f62b-365a-bd1d-69d9c31a9f0c
type=ethernet
interface-name=eth0
lldp=0
permissions=

[ethernet]
cloned-mac-address=52:54:00:91:E4:4E
mac-address-blacklist=
mtu=9000

[ipv4]
dhcp-client-id=mac
dhcp-timeout=2147483647
dns-search=
method=auto

[ipv6]
addr-gen-mode=eui64
dhcp-duid=ll
dhcp-iaid=mac
dhcp-timeout=2147483647
dns-search=
method=auto
ra-timeout=2147483647

[proxy]
```

#### Example of file-based configuration mode:

Let’s use the file-based approach to set a new config state. In this case disable the IPv6 configuration in _eth1_ interface.

First, create a yaml file to define the desired state of the _eth1_ interface. Use _nmstatectl show_ to save the current settings then _nmstatectl edit_ to disable IPv6. Again, all changes are in bold and deletions are shown with strike-through:

```
$ nmstatectl show eth1 > eth1.yaml

$ vi eth1.yaml
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.108
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: false
    address:
    - ip: fe80::5054:ff:fe3c:9b04
      prefix-length: 64
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    autoconf: true
    dhcp: true
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
```

After saving the new configuration, use it to apply the new state:

```
$ sudo nmstatectl apply eth1.yaml

2021-06-29 12:17:21,531 root         DEBUG    Nmstate version: 1.0.3
2021-06-29 12:17:21,531 root         DEBUG    Applying desire state: {'dns-resolver': {'config': {}, 'running': {'search': [], 'server': ['192.168.122.1']}}, 'route-rules': {'config': []}, 'routes': {'config': [], 'running': [{'destination': 'fe80::/64', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '0.0.0.0/0', 'metric': 101, 'next-hop-address': '192.168.122.1', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '192.168.122.0/24', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}]}, 'interfaces': [{'name': 'eth1', 'type': 'ethernet', 'state': 'up', 'ipv4': {'enabled': True, 'address': [{'ip': '192.168.122.108', 'prefix-length': 24}], 'auto-dns': True, 'auto-gateway': True, 'auto-route-table-id': 0, 'auto-routes': True, 'dhcp': True}, 'ipv6': {'enabled': False}, 'lldp': {'enabled': False}, 'mac-address': '52:54:00:3C:9B:04', 'mtu': 1500}]}
--- output omitted ---
2021-06-29 12:17:21,582 root         DEBUG    Async action: Update profile uuid:5d7244cb-673d-3b88-a675-32e31fad4347 iface:eth1 type:ethernet started
2021-06-29 12:17:21,587 root         DEBUG    Async action: Update profile uuid:5d7244cb-673d-3b88-a675-32e31fad4347 iface:eth1 type:ethernet finished
--- output omitted ---
Desired state applied:
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.108
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: false
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
```

You can check that the _eth1_ interface does not have any IPv6 configured:

```
$ ip -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.108/24

$ sudo cat /etc/NetworkManager/system-connections/eth1.nmconnection
[connection]
id=eth1
uuid=5d7244cb-673d-3b88-a675-32e31fad4347
type=ethernet
interface-name=eth1
lldp=0
permissions=

[ethernet]
cloned-mac-address=52:54:00:3C:9B:04
mac-address-blacklist=
mtu=1500

[ipv4]
dhcp-client-id=mac
dhcp-timeout=2147483647
dns-search=
method=auto

[ipv6]
addr-gen-mode=eui64
dhcp-duid=ll
dhcp-iaid=mac
dns-search=
method=disabled

[proxy]
```

#### Applying changes temporarily

An interesting feature of NMState allows you to configure a desired networking state temporarily. In case you are satisfied with the configuration you can commit it afterwards. Otherwise it will rollback when the timeout expires (default is 60 sec).

Modify the _eth1_ configuration from the previous example so it has an IPv4 static address instead of getting it dynamically by DHCP.

```
$ vi eth1.yaml

---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.110
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: false
  ipv6:
    enabled: false
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
```

Now, apply this config temporarily using the option _no-commit_ so it will be valid only for 30 seconds. This can be done adding the option _–timeout_. Meanwhile, we will run the _ip  -br a_ command three times to see how the IPv4 address configured in _eth1_ interface changes and then the configuration rolls back.

```
$ ip -br a && sudo nmstatectl apply --no-commit --timeout 30 eth1.yaml && sleep 10 && ip -br a && sleep 25 && ip -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.108/24
2021-06-29 17:29:18,266 root         DEBUG    Nmstate version: 1.0.3
2021-06-29 17:29:18,267 root         DEBUG    Applying desire state: {'dns-resolver': {'config': {}, 'running': {'search': [], 'server': ['192.168.122.1']}}, 'route-rules': {'config': []}, 'routes': {'config': [], 'running': [{'destination': 'fe80::/64', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '0.0.0.0/0', 'metric': 101, 'next-hop-address': '192.168.122.1', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '192.168.122.0/24', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}]}, 'interfaces': [{'name': 'eth1', 'type': 'ethernet', 'state': 'up', 'ipv4': {'enabled': True, 'address': [{'ip': '192.168.122.110', 'prefix-length': 24}], 'dhcp': False}, 'ipv6': {'enabled': False}, 'lldp': {'enabled': False}, 'mac-address': '52:54:00:3C:9B:04', 'mtu': 1500}]}
--- output omitted ---
Desired state applied:
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.110
      prefix-length: 24
    dhcp: false
  ipv6:
    enabled: false
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
Checkpoint: NetworkManager|/org/freedesktop/NetworkManager/Checkpoint/7
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.110/24
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.108/24
```

As you can see from above, the _eth1_ IP address changed temporarily from 192.168.122.108 to 192.168.122.110 and then it returned to 192.168.122.108 after the timeout expired.

### Conclusion

NMState is a declarative networking configuration tool that currently applies the desired networking configuration state in a host through the NetworkManager API. This state can be defined either interactively using a text editor or with a file-based approach creating a yaml or json file.

This kind of tool provides Infrastructure as Code, it allows the automation of networking tasks and also reduces potential misconfigurations or unstable networking scenarios that could arise using legacy configuration methods.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/nmstate-a-declarative-networking-config-tool/

作者：[Maurizio Garcia][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/malgnuz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/magic-816x345.jpg
[2]: https://unsplash.com/@marigard?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/magic?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://nmstate.io/
[5]: https://github.com/nmstate/nmstate
