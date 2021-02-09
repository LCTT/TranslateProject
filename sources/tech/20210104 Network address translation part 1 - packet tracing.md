[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Network address translation part 1 – packet tracing)
[#]: via: (https://fedoramagazine.org/network-address-translation-part-1-packet-tracing/)
[#]: author: (Florian Westphal https://fedoramagazine.org/author/strlen/)

Network address translation part 1 – packet tracing
======

![][1]

The first post in a series about network address translation (NAT). Part 1 shows how to use the iptables/nftables packet tracing feature to find the source of NAT related connectivity problems.

### Introduction

Network address translation is one way to expose containers or virtual machines to the wider internet. Incoming connection requests have their destination address rewritten to a different one. Packets are then routed to a container or virtual machine instead. The same technique can be used for load-balancing where incoming connections get distributed among a pool of machines.

Connection requests fail when network address translation is not working as expected. The wrong service is exposed, connections end up in the wrong container, request time out, and so on. One way to debug such problems is to check that the incoming request matches the expected or configured translation.

### Connection tracking

NAT involves more than just changing the ip addresses or port numbers. For instance, when mapping address X to Y, there is no need to add a rule to do the reverse translation. A netfilter system called “conntrack” recognizes packets that are replies to an existing connection. Each connection has its own NAT state attached to it. Reverse translation is done automatically.

### Ruleset evaluation tracing

The utility nftables (and, to a lesser extent, iptables) allow for examining how a packet is evaluated and which rules in the ruleset were matched by it. To use this special feature “trace rules” are inserted at a suitable location. These rules select the packet(s) that should be traced. Lets assume that a host coming from IP address C is trying to reach the service on address S and port P. We want to know which NAT transformation is picked up, which rules get checked and if the packet gets dropped somewhere.

Because we are dealing with incoming connections, add a rule to the prerouting hook point. Prerouting means that the kernel has not yet made a decision on where the packet will be sent to. A change to the destination address often results in packets to get forwarded rather than being handled by the host itself.

### Initial setup
```

```

# nft 'add table inet trace_debug'
# nft 'add chain inet trace_debug trace_pre { type filter hook prerouting priority -200000; }'
# nft "insert rule inet trace_debug trace_pre ip saddr $C ip daddr $S tcp dport $P tcp flags syn limit rate 1/second meta nftrace set 1"
```

```

The first rule adds a new table This allows easier removal of the trace and debug rules later. A single “nft delete table inet trace_debug” will be enough to undo all rules and chains added to the temporary table during debugging.

The second rule creates a base hook before routing decisions have been made (prerouting) and with a negative priority value to make sure it will be evaluated before connection tracking and the NAT rules.

The only important part, however, is the last fragment of the third rule: “_meta nftrace set 1″_. This enables tracing events for all packets that match the rule. Be as specific as possible to get a good signal-to-noise ratio. Consider adding a rate limit to keep the number of trace events at a manageable level. A limit of one packet per second or per minute is a good choice. The provided example traces all syn and syn/ack packets coming from host $C and going to destination port $P on the destination host $S. The limit clause prevents event flooding. In most cases a trace of a single packet is enough.

The procedure is similar for iptables users. An equivalent trace rule looks like this:
```

```

# iptables -t raw -I PREROUTING -s $C -d $S -p tcp --tcp-flags SYN SYN  --dport $P  -m limit --limit 1/s -j TRACE
```

```

### Obtaining trace events

Users of the native nft tool can just run the nft trace mode:
```

```

# nft monitor trace
```

```

This prints out the received packet and all rules that match the packet (use CTRL-C to stop it):
```

```

trace id f0f627 ip raw prerouting  packet: iif "veth0" ether saddr ..
```

```

We will examine this in more detail in the next section. If you use iptables, first check the installed version via the “_iptables –version”_ command. Example:
```

```

# iptables --version
iptables v1.8.5 (legacy)
```

```

_(legacy)_ means that trace events are logged to the kernel ring buffer. You will need to check _dmesg or_ _journalctl_. The debug output lacks some information but is conceptually similar to the one provided by the new tools. You will need to check the rule line numbers that are logged and correlate those to the active iptables ruleset yourself. If the output shows _(nf_tables)_, you can use the xtables-monitor tool:
```

```

# xtables-monitor --trace
```

```

If the command only shows the version, you will also need to look at dmesg/journalctl instead. xtables-monitor uses the same kernel interface as the nft monitor trace tool. Their only difference is that it will print events in iptables syntax and that, if you use a mix of both iptables-nft and nft, it will be unable to print rules that use maps/sets and other nftables-only features.

### Example

Lets assume you’d like to debug a non-working port forward to a virtual machine or container. The command “ssh -p 1222 10.1.2.3” should provide remote access to a container running on the machine with that address, but the connection attempt times out.

You have access to the host running the container image. Log in and add a trace rule. See the earlier example on how to add a temporary debug table. The trace rule looks like this:
```

```

nft "insert rule inet trace_debug trace_pre ip daddr 10.1.2.3 tcp dport 1222 tcp flags syn limit rate 6/minute meta nftrace set 1"
```

```

After the rule has been added, start nft in trace mode: _nft monitor trace_, then retry the failed ssh command. This will generate a lot of output if the ruleset is large. Do not worry about the large example output below – the next section will do a line-by-line walkthrough.
```

```

trace id 9c01f8 inet trace_debug trace_pre packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp tcp dport 1222 tcp flags == syn
trace id 9c01f8 inet trace_debug trace_pre rule ip daddr 10.2.1.2 tcp dport 1222 tcp flags syn limit rate 6/minute meta nftrace set 1 (verdict continue)
trace id 9c01f8 inet trace_debug trace_pre verdict continue
trace id 9c01f8 inet trace_debug trace_pre policy accept
trace id 9c01f8 inet nat prerouting packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp  tcp dport 1222 tcp flags == syn
trace id 9c01f8 inet nat prerouting rule ip daddr 10.1.2.3  tcp dport 1222 dnat ip to 192.168.70.10:22 (verdict accept)
trace id 9c01f8 inet filter forward packet: iif "enp0" oif "veth21" ether saddr .. ip daddr 192.168.70.10 .. tcp dport 22 tcp flags == syn tcp window 29200
trace id 9c01f8 inet filter forward rule ct status dnat jump allowed_dnats (verdict jump allowed_dnats)
trace id 9c01f8 inet filter allowed_dnats rule drop (verdict drop)
trace id 20a4ef inet trace_debug trace_pre packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp tcp dport 1222 tcp flags == syn
```

```

### Line-by-line trace walkthrough

The first line generated is the packet id that triggered the subsequent trace output. Even though this is in the same grammar as the nft rule syntax, it contains header fields of the packet that was just received. You will find the name of the receiving network interface (here named “enp0”) the source and destination mac addresses of the packet, the source ip address (can be important – maybe the reporter is connecting from a wrong/unexpected host) and the tcp source and destination ports. You will also see a “trace id” at the very beginning. This identification tells which incoming packet matched a rule. The second line contains the first rule matched by the packet:
```

```

trace id 9c01f8 inet trace_debug trace_pre rule ip daddr 10.2.1.2 tcp dport 1222 tcp flags syn limit rate 6/minute meta nftrace set 1 (verdict continue)
```

```

This is the just-added trace rule. The first rule is always one that activates packet tracing. If there would be other rules before this, we would not see them. If there is no trace output at all, the trace rule itself is never reached or does not match. The next two lines tell that there are no further rules and that the “trace_pre” hook allows the packet to continue (_verdict accept)_.

The next matching rule is
```

```

trace id 9c01f8 inet nat prerouting rule ip daddr 10.1.2.3  tcp dport 1222 dnat ip to 192.168.70.10:22 (verdict accept)
```

```

This rule sets up a mapping to a different address and port. Provided 192.168.70.10 really is the address of the desired VM, there is no problem so far. If its not the correct VM address, the address was either mistyped or the wrong NAT rule was matched.

### IP forwarding

Next we can see that the IP routing engine told the IP stack that the packet needs to be forwarded to another host:

```
trace id 9c01f8 inet filter forward packet: iif "enp0" oif "veth21" ether saddr .. ip daddr 192.168.70.10 .. tcp dport 22 tcp flags == syn tcp window 29200
```

This is another dump of the packet that was received, but there are a couple of interesting changes. There is now an output interface set. This did not exist previously because the previous rules are located before the routing decision (the prerouting hook). The id is the same as before, so this is still the same packet, but the address and port has already been altered. In case there are rules that match “tcp dport 1222” they will have no effect anymore on this packet.

If the line contains no output interface (oif), the routing decision steered the packet to the local host. Route debugging is a different topic and not covered here.

trace id 9c01f8 inet filter forward rule ct status dnat jump allowed_dnats (verdict jump allowed_dnats)

This tells that the packet matched a rule that jumps to a chain named “allowed_dnats”. The next line shows the source of the connection failure:
```

```

trace id 9c01f8 inet filter allowed_dnats rule drop (verdict drop)
```

```

The rule unconditionally drops the packet, so no further log output for the packet exists. The next output line is the result of a different packet:

trace id 20a4ef inet trace_debug trace_pre packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp tcp dport 1222 tcp flags == syn

The trace id is different, the packet however has the same content. This is a retransmit attempt: The first packet was dropped, so TCP re-tries. Ignore the remaining output, it does not contain new information. Time to inspect that chain.

### Ruleset investigation

The previous section found that the packet is dropped in a chain named “allowed_dnats” in the inet filter table. Time to look at it:
```

```

# nft list chain inet filter allowed_dnats
table inet filter {
 chain allowed_dnats {
  meta nfproto ipv4 ip daddr . tcp dport @allow_in accept
  drop
   }
}
```

```

The rule that accepts packets in the @allow_in set did not show up in the trace log. Double-check that the address is in the @allow_set by listing the element:
```

```

# nft "get element inet filter allow_in { 192.168.70.10 . 22 }"
Error: Could not process rule: No such file or directory
```

```

As expected, the address-service pair is not in the set. We add it now.
```

```

# nft "add element inet filter allow_in { 192.168.70.10 . 22 }"
```

```

Run the query command now, it will return the newly added element.

```
# nft "get element inet filter allow_in { 192.168.70.10 . 22 }"
table inet filter {
   set allow_in {
      type ipv4_addr . inet_service
      elements = { 192.168.70.10 . 22 }
   }
}
```

The ssh command should now work and the trace output reflects the change:

trace id 497abf58 inet filter forward rule ct status dnat jump allowed_dnats (verdict jump allowed_dnats)

trace id 497abf58 inet filter allowed_dnats rule meta nfproto ipv4 ip daddr . tcp dport @allow_in accept (verdict accept)

trace id 497abf58 ip postrouting packet: iif "enp0" oif "veth21" ether .. trace id 497abf58 ip postrouting policy accept

This shows the packet passes the last hook in the forwarding path – postrouting.

In case the connect is still not working, the problem is somewhere later in the packet pipeline and outside of the nftables ruleset.

### Summary

This Article gave an introduction on how to check for packet drops and other sources of connectivity problems with the nftables trace mechanism. A later post in the series shows how to inspect the connection tracking subsystem and the NAT information that may be attached to tracked flows.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/network-address-translation-part-1-packet-tracing/

作者：[Florian Westphal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/strlen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/12/network-address-translation-part-1-816x346.png
