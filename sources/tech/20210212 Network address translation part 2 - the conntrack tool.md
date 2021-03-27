[#]: collector: (lujun9972)
[#]: translator: (cooljelly)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Network address translation part 2 – the conntrack tool)
[#]: via: (https://fedoramagazine.org/network-address-translation-part-2-the-conntrack-tool/)
[#]: author: (Florian Westphal https://fedoramagazine.org/author/strlen/)

Network address translation part 2 – the conntrack tool
======

![][1]

This is the second article in a series about network address translation (NAT). The first article introduced [how to use the iptables/nftables packet tracing feature][2] to find the source of NAT-related connectivity problems. Part 2 introduces the “conntrack” command. conntrack allows you to inspect and modify tracked connections.

### Introduction

NAT configured via iptables or nftables builds on top of netfilters connection tracking facility. The _conntrack_ command is used to inspect and alter the state table. It is part of the “conntrack-tools” package.

### Conntrack state table

The connection tracking subsystem keeps track of all packet flows that it has seen. Run “_sudo conntrack -L_” to see its content:

```
tcp 6 43184 ESTABLISHED src=192.168.2.5 dst=10.25.39.80 sport=5646 dport=443 src=10.25.39.80 dst=192.168.2.5 sport=443 dport=5646 [ASSURED] mark=0 use=1
tcp 6 26 SYN_SENT src=192.168.2.5 dst=192.168.2.10 sport=35684 dport=443 [UNREPLIED] src=192.168.2.10 dst=192.168.2.5 sport=443 dport=35684 mark=0 use=1
udp 17 29 src=192.168.8.1 dst=239.255.255.250 sport=48169 dport=1900 [UNREPLIED] src=239.255.255.250 dst=192.168.8.1 sport=1900 dport=48169 mark=0 use=1
```

Each line shows one connection tracking entry. You might notice that each line shows the addresses and port numbers twice and even with inverted address and port pairs! This is because each entry is inserted into the state table twice. The first address quadruple (source and destination address and ports) are those recorded in the original direction, i.e. what the initiator sent. The second quadruple is what conntrack expects to see when a reply from the peer is received. This solves two problems:

  1. If a NAT rule matches, such as IP address masquerading, this is recorded in the reply part of the connection tracking entry and can then be automatically applied to all future packets that are part of the same flow.
  2. A lookup in the state table will be successful even if its a reply packet to a flow that has any form of network or port address translation applied.



The original (first shown) quadruple stored never changes: Its what the initiator sent. NAT manipulation only alters the reply (second) quadruple because that is what the receiver will see. Changes to the first quadruple would be pointless: netfilter has no control over the initiators state, it can only influence the packet as it is received/forwarded. When a packet does not map to an existing entry, conntrack may add a new state entry for it. In the case of UDP this happens automatically. In the case of TCP conntrack can be configured to only add the new entry if the TCP packet has the [SYN bit][3] set. By default conntrack allows mid-stream pickups to not cause problems for flows that existed prior to conntrack becoming active.

### Conntrack state table and NAT

As explained in the previous section, the reply tuple listed contains the NAT information. Its possible to filter the output to only show entries with source or destination nat applied. This allows to see which kind of NAT transformation is active on a given flow. _“sudo conntrack -L -p tcp –src-nat_” might show something like this:

```
tcp 6 114 TIME_WAIT src=10.0.0.10 dst=10.8.2.12 sport=5536 dport=80 src=10.8.2.12 dst=192.168.1.2 sport=80 dport=5536 [ASSURED]
```

This entry shows a connection from 10.0.0.10:5536 to 10.8.2.12:80. But unlike the previous example, the reply direction is not just the inverted original direction: the source address is changed. The destination host (10.8.2.12) sends reply packets to 192.168.1.2 instead of 10.0.0.10. Whenever 10.0.0.10 sends another packet, the router with this entry replaces the source address with 192.168.1.2. When 10.8.2.12 sends a reply, it changes the destination back to 10.0.0.10. This source NAT is due to a [nft masquerade][4] rule:

```
inet nat postrouting meta oifname "veth0" masquerade
```

Other types of NAT rules, such as “dnat to” or “redirect to” would be shown in a similar fashion, with the reply tuples destination different from the original one.

### Conntrack extensions

Two useful extensions are conntrack accounting and timestamping. _“sudo sysctl net.netfilter.nf_conntrack_acct=1”_ makes _“sudo conntrack -L_” track byte and packet counters for each flow.

_“sudo sysctl net.netfilter.nf_conntrack_timestamp=1”_ records a “start timestamp” for each connection. _“sudo conntrack -L”_ then displays the seconds elapsed since the flow was first seen. Add “_–output ktimestamp_” to see the absolute start date as well.

### Insert and change entries

You can add entries to the state table. For example:

```
sudo conntrack -I -s 192.168.7.10 -d 10.1.1.1 --protonum 17 --timeout 120 --sport 12345 --dport 80
```

This is used by conntrackd for state replication. Entries of an active firewall are replicated to a standby system. The standby system can then take over without breaking connectivity even on established flows. Conntrack can also store metadata not related to the packet data sent on the wire, for example the conntrack mark and connection tracking labels. Change them with the “update” (-U) option:

```
sudo conntrack -U -m 42 -p tcp
```

This changes the connmark of all tcp flows to 42.

### **Delete entries**

In some cases, you want to delete enries from the state table. For example, changes to NAT rules have no effect on packets belonging to flows that are already in the table. For long-lived UDP sessions, such as tunneling protocols like VXLAN, it might make sense to delete the entry so the new NAT transformation can take effect. Delete entries via _“sudo conntrack -D_” followed by an optional list of address and port information. The following example removes the given entry from the table:

```
sudo conntrack -D -p udp  --src 10.0.12.4 --dst 10.0.0.1 --sport 1234 --dport 53
```

### Conntrack error counters

Conntrack also exports statistics:

```
# sudo conntrack -S
cpu=0 found=0 invalid=130 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=10
cpu=1 found=0 invalid=0 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=0
cpu=2 found=0 invalid=0 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=1
cpu=3 found=0 invalid=0 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=0
```

Most counters will be 0. “Found” and “insert” will always be 0, they only exist for backwards compatibility. Other errors accounted for are:

  * invalid: packet does not match an existing connection and doesn’t create a new connection.
  * insert_failed: packet starts a new connection, but insertion into the state table failed. This can happen for example when NAT engine happened to pick identical source address and port when Masquerading.
  * drop: packet starts a new connection, but no memory is available to allocate a new state entry for it.
  * early_drop: conntrack table is full. In order to accept the new connection existing connections that did not see two-way communication were dropped.
  * error: icmp(v6) received icmp error packet that did not match a known connection
  * search_restart: lookup interrupted by an insertion or deletion on another CPU.
  * clash_resolve: Several CPUs tried to insert identical conntrack entry.



These error conditions are harmless unless they occur frequently. Some can be mitigated by tuning the conntrack sysctls for the expected workload. _net.netfilter.nf_conntrack_buckets_ and _net.netfilter.nf_conntrack_max_ are typical candidates. See the [nf_conntrack-sysctl documentation][5] for a full list.

Use “_sudo sysctl_ _net.netfilter.nf_conntrack_log_invalid=255″_ to get more information when a packet is invalid. For example, when conntrack logs the following when it encounters a packet with all tcp flags cleared:

```
nf_ct_proto_6: invalid tcp flag combination SRC=10.0.2.1 DST=10.0.96.7 LEN=1040 TOS=0x00 PREC=0x00 TTL=255 ID=0 PROTO=TCP SPT=5723 DPT=443 SEQ=1 ACK=0
```

### Summary

This article gave an introduction on how to inspect the connection tracking table and the NAT information stored in tracked flows. The next part in the series will expand on the conntrack tool and the connection tracking event framework.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/network-address-translation-part-2-the-conntrack-tool/

作者：[Florian Westphal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/strlen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/02/network-address-translation-part-2-816x345.jpg
[2]: https://fedoramagazine.org/network-address-translation-part-1-packet-tracing/
[3]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_segment_structure
[4]: https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)#Masquerading
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/nf_conntrack-sysctl.rst
