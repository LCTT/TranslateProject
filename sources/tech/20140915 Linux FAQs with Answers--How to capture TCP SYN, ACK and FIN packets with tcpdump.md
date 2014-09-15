Linux FAQs with Answers--How to capture TCP SYN, ACK and FIN packets with tcpdump
================================================================================
> **Question**: I want to monitor TCP connection dynamics (e.g., three-way handshake for connection establishment, and four-way handshake for connection tear-down). For that, I need to capture only TCP control packets such as those with SYN, ACK or FIN flag set. How can I use tcpdump to capture TCP SYN, ACK, and/or FYN packets only? 

As a de-facto packet capture tool, tcpdump provides powerful and flexible packet filtering capabilities. The libpcap packet capture engine which tcpdump is based upon supports standard packet filtering rules such as 5-tuple packet header based filtering (i.e., based on source/destination IP addresses/ports and IP protocol type).

The packet filtering rules of tcpdump/libpcap also supports more general packet expressions, where arbitrary byte ranges in a packet are checked with relation or binary operators. For byte range representation, you can use the following format:

    proto [ expr : size ]

"proto" can be one of well-known protocols (e.g., ip, arp, tcp, udp, icmp, ipv6). "expr" represents byte offset relative to the beginning of a specified protocol header. There exist well-known byte offsets such as tcpflags, or value constants such as tcp-syn, tcp-ack or tcp-fin. "size" is optional, indicating the number of bytes to check starting from the byte offset.

Using this format, you can filter TCP SYN, ACK or FIN packets as follows.

To capture only TCP SYN packets:

     # tcpdump -i <interface> "tcp[tcpflags] & (tcp-syn) != 0" 

To capture only TCP ACK packets:

    # tcpdump -i <interface> "tcp[tcpflags] & (tcp-ack) != 0"

To capture only TCP FIN packets:

    # tcpdump -i <interface> "tcp[tcpflags] & (tcp-fin) != 0"

To capture only TCP SYN or ACK packets:

     # tcpdump -r <interface> "tcp[tcpflags] & (tcp-syn|tcp-ack) != 0" 

![](https://farm4.staticflickr.com/3923/15050566798_db14aea9a9_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/capture-tcp-syn-ack-fin-packets-tcpdump.html

作者：[作者名][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出