[#]: subject: (Network address translation part 3 – the conntrack event framework)
[#]: via: (https://fedoramagazine.org/conntrack-event-framework/)
[#]: author: (Florian Westphal https://fedoramagazine.org/author/strlen/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Network address translation part 3 – the conntrack event framework
======

![][1]

This is the third post in a series about network address translation (NAT). The first article introduced [how to use the iptables/nftables packet tracing feature][2] to find the source of NAT-related connectivity problems. Part 2 [introduced the “conntrack” command][3]. This part gives an introduction to the “conntrack” event framework.

### Introduction

NAT configured via iptables or nftables builds on top of netfilter’s connection tracking framework. conntrack’s event facility allows real-time monitoring of incoming and outgoing flows. This event framework is useful for debugging or logging flow information, for instance with [ulog][4] and its IPFIX output plugin.

### Conntrack events

Run the following command to see a real-time conntrack event log:

```
# conntrack -E
NEW tcp     120 SYN_SENT src=10.1.0.114 dst=10.7.43.52 sport=4123 dport=22 [UNREPLIED] src=10.7.43.52 dst=10.1.0.114 sport=22 dport=4123
UPDATE tcp      60 SYN_RECV src=10.1.0.114 dst=10.7.43.52 sport=4123 dport=22 src=10.7.43.52 dst=10.1.0.114 sport=22 dport=4123
UPDATE tcp  432000 ESTABLISHED src=10.1.0.114 dst=10.7.43.52 sport=4123 dport=22 src=10.7.43.52 dst=10.1.0.114 sport=22 dport=4123 [ASSURED]
UPDATE tcp     120 FIN_WAIT src=10.1.0.114 dst=10.7.43.52 sport=4123 dport=22 src=10.7.43.52 dst=10.1.0.114 sport=22 dport=4123 [ASSURED]
UPDATE tcp      30 LAST_ACK src=10.1.0.114 dst=10.7.43.52 sport=4123 dport=22 src=10.7.43.52 dst=10.1.0.114 sport=22 dport=4123 [ASSURED]
UPDATE tcp     120 TIME_WAIT src=10.1.0.114 dst=10.7.43.52 sport=4123 dport=22 src=10.7.43.52 dst=10.1.0.114 sport=22 dport=4123 [ASSURED]
```

This prints a continuous stream of events:

  * new connections
  * removal of connections
  * changes in a connections state.



Hit _ctrl+c_ to quit.

The conntrack tool offers a number of options to limit the output. For example its possible to only show DESTROY events. The NEW event is generated after the iptables/nftables rule set accepts the corresponding packet.

### **Conntrack expectations**

Some legacy protocols require multiple connections to work, such as [FTP][5], [SIP][6] or [H.323][7]. To make these work in NAT environments, conntrack uses “connection tracking helpers”: kernel modules that can parse the specific higher-level protocol such as ftp.

The _nf_conntrack_ftp_ module parses the ftp command connection and extracts the TCP port number that will be used for the file transfer. The helper module then inserts a “expectation” that consists of the extracted port number and address of the ftp client. When a new data connection arrives, conntrack searches the expectation table for a match. An incoming connection that matches such an entry is flagged RELATED rather than NEW. This allows you to craft iptables and nftables rulesets that reject incoming connection requests unless they were requested by an existing connection. If the original connection is subject to NAT, the related data connection will inherit this as well. This means that helpers can expose ports on internal hosts that are otherwise unreachable from the wider internet. The next section will explain this expectation mechanism in more detail.

### The expectation table

Use _conntrack -L expect_ to list all active expectations. In most cases this table appears to be empty, even if a helper module is active. This is because expectation table entries are short-lived. Use _conntrack -E expect_ to monitor the system for changes in the expectation table instead.

Use this to determine if a helper is working as intended or to log conntrack actions taken by the helper. Here is an example output of a file download via ftp:
```

```

# conntrack -E expect
NEW 300 proto=6 src=10.2.1.1 dst=10.8.4.12 sport=0 dport=46767 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.2.1.1 master-dst=10.8.4.12 sport=34526 dport=21 class=0 helper=ftp
DESTROY 299 proto=6 src=10.2.1.1 dst=10.8.4.12 sport=0 dport=46767 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.2.1.1 master-dst=10.8.4.12 sport=34526 dport=21 class=0 helper=ftp
```

```

The expectation entry describes the criteria that an incoming connection request must meet in order to recognized as a RELATED connection. In this example, the connection may come from any port, must go to port 46767 (the port the ftp server expects to receive the DATA connection request on). Futhermore the source and destination addresses must match the address of the ftp client and server.

Events also include the connection that created the expectation and the name of the protocol helper (ftp). The helper has full control over the expectation: it can request full matching (IP addresses of the incoming connection must match), it can restrict to a subnet or even allow the request to come from any address. Check the “mask-dst” and “mask-src” parameters to see what parts of the addresses need to match.

### Caveats

You can configure some helpers to allow wildcard expectations. Such wildcard expectations result in requests coming from an unrelated 3rd party host to get flagged as RELATED. This can open internal servers to the wider internet (“NAT slipstreaming”).

This is the reason helper modules require explicit configuration from the nftables/iptables ruleset. See [this article][8] for more information about helpers and how to configure them. It includes a table that describes the various helpers and the types of expectations (such as wildcard forwarding) they can create. The nftables wiki has a [nft ftp example][9].

A nftables rule like ‘ct state related ct helper “ftp”‘ matches connections that were detected as a result of an expectation created by the ftp helper.

In iptables, use “_-m conntrack –ctstate RELATED -m helper –helper ftp_“. Always restrict helpers to only allow communication to and from the expected server addresses. This prevents accidental exposure of other, unrelated hosts.

### Summary

This article introduced the conntrack event facilty and gave examples on how to inspect the expectation table. The next part of the series will describe low-level debug knobs of conntrack.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/conntrack-event-framework/

作者：[Florian Westphal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/strlen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/network-address-translation-part-3-816x345.jpg
[2]: https://fedoramagazine.org/network-address-translation-part-1-packet-tracing/
[3]: https://fedoramagazine.org/network-address-translation-part-2-the-conntrack-tool/
[4]: https://netfilter.org/projects/ulogd/index.html
[5]: https://en.wikipedia.org/wiki/File_Transfer_Protocol
[6]: https://en.wikipedia.org/wiki/Session_Initiation_Protocol
[7]: https://en.wikipedia.org/wiki/H.323
[8]: https://github.com/regit/secure-conntrack-helpers/blob/master/secure-conntrack-helpers.rst
[9]: https://wiki.nftables.org/wiki-nftables/index.php/Conntrack_helpers
