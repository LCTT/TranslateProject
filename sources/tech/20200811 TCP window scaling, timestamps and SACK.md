[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (TCP window scaling, timestamps and SACK)
[#]: via: (https://fedoramagazine.org/tcp-window-scaling-timestamps-and-sack/)
[#]: author: (Florian Westphal https://fedoramagazine.org/author/strlen/)

TCP window scaling, timestamps and SACK
======

![][1]

The Linux TCP stack has a myriad of _sysctl_ knobs that allow to change its behavior.  This includes the amount of memory that can be used for receive or transmit operations, the maximum number of sockets and optional features and protocol extensions.

There are  multiple articles that recommend to disable TCP extensions, such as timestamps or selective acknowledgments (SACK) for various “performance tuning” or “security” reasons.

This article provides background on what these extensions do, why they
are enabled by default, how they relate to one another and why it is normally a bad idea to turn them off.

### TCP Window scaling

The data transmission rate that TCP can sustain is limited by several factors. Some of these are:

  * Round trip time (RTT).  This is the time it takes for a packet to get to the destination and a reply to come back. Lower is better.
  * lowest link speed of the network paths involved
  * frequency of packet loss
  * the speed at which new data can be made available for transmission
For example, the CPU needs to be able to pass data to the network adapter fast enough. If the CPU needs to encrypt the data first, the adapter might have to wait for new data. In similar fashion disk storage can be a bottleneck if it can’t read the data fast enough.
  * The maximum possible size of the TCP receive window. The receive window determines how much data (in bytes) TCP can transmit before it has to wait for the receiver to report reception of that data. This is announced by the receiver. The receiver will constantly update this value as it reads and acknowledges reception of the incoming data. The receive windows current value is contained in the [TCP header][2] that is part of every segment sent by TCP. The sender is thus aware of the current receive window whenever it receives an acknowledgment from the peer. This means that the higher the round-trip time, the longer it takes for sender to get receive window updates.



TCP is limited to at most 64 kilobytes of unacknowledged (in-flight) data. This is not even close to what is needed to sustain a decent data rate in most networking scenarios. Let us look at some examples.

##### Theoretical data rate

With a round-trip-time of 100 milliseconds, TCP can transfer at most 640 kilobytes per second. With a 1 second delay, the maximum theoretical data rate drops down to only 64 kilobytes per second.

This is because of the receive window. Once 64kbyte of data have been sent the receive window is already full.  The sender must wait until the peer informs it that at least some of the data has been read by the application. 

The first segment sent reduces the TCP window by the size of that segment. It takes one round-trip before an update of the receive window value will become available. When updates arrive with a 1 second delay, this results in a 64 kilobyte limit even if the link has plenty of bandwidth available.

In order to fully utilize a fast network with several milliseconds of delay, a window size larger than what classic TCP supports is a must. The ’64 kilobyte limit’ is an artifact of the protocols specification: The TCP header reserves only 16bits for the receive window size. This allows receive windows of up to 64KByte. When the TCP protocol was originally designed, this size was not seen as a limit.

Unfortunately, its not possible to just change the TCP header to support a larger maximum window value. Doing so would mean all implementations of TCP would have to be updated simultaneously or they wouldn’t understand one another anymore. To solve this, the interpretation of the receive window value is changed instead.

The ‘window scaling option’ allows to do this while keeping compatibility to existing implementations.

#### TCP Options: Backwards-compatible protocol extensions

TCP supports optional extensions. This allows to enhance the protocol with new features without the need to update all implementations at once. When a TCP initiator connects to the peer, it also send a list of supported extensions. All extensions follow the same format: an unique option number followed by the length of the option and the option data itself.

The TCP responder checks all the option numbers contained in the connection request. If it does not understand an option number it skips
‘length’ bytes of data and checks the next option number. The responder omits those it did not understand from the reply. This allows both the sender and receiver to learn the common set of supported options.

With window scaling, the option data always consist of a single number.

### The window scaling option
```

```

Window Scale option (WSopt): Kind: 3, Length: 3
    +---------+---------+---------+
    | Kind=3  |Length=3 |shift.cnt|
    +---------+---------+---------+
         1         1         1
```

```

The [window scaling][3] option tells the peer that the receive window value found in the TCP header should be scaled by the given number to get the real size.

For example, a TCP initiator that announces a window scaling factor of 7 tries to instruct the responder that any future packets that carry a receive window value of 512 really announce a window of 65536 byte. This is an increase by a factor of 128. This would allow a maximum TCP Window of 8 Megabytes.

A TCP responder that does not understand this option ignores it. The TCP packet sent in reply to the connection request (the syn-ack) then does not contain the window scale option. In this case both sides can only use a 64k window size. Fortunately, almost every TCP stack supports and enables this option by default, including Linux.

The responder includes its own desired scaling factor. Both peers can use a different number. Its also legitimate to announce a scaling factor of 0. This means the peer should treat the receive window value it receives verbatim, but it allows scaled values in the reply direction — the recipient can then use a larger receive window.

Unlike SACK or TCP timestamps, the window scaling option only appears in the first two packets of a TCP connection, it cannot be changed afterwards. It is also not possible to determine the scaling factor by looking at a packet capture of a connection that does not contain the initial connection three-way handshake.

The largest supported scaling factor is 14. This allows TCP window sizes
of up to one Gigabyte.

##### Window scaling downsides

It can cause data corruption in very special cases. Before you disable the option – it is impossible under normal circumstances. There is also a solution in place that prevents this. Unfortunately, some people disable this solution without realizing the relationship with window scaling. First, let’s have a look at the actual problem that needs to be addressed. Imagine the following sequence of events:

  1. The sender transmits segments: s_1, s_2, s_3, … s_n
  2.  The receiver sees: s_1, s_3, .. s_n and sends an acknowledgment for s_1.
  3.  The sender considers s_2 lost and sends it a second time. It also sends new data contained in segment s_n+1.
  4.  The receiver then sees: s_2, s_n+1, s_2: the packet s_2 is received twice.



This can happen for example when a sender triggers re-transmission too early. Such erroneous re-transmits are never a problem in normal cases, even with window scaling. The receiver will just discard the duplicate.

#### Old data to new data

The TCP sequence number can be at most 4 Gigabyte. If it becomes larger than this, the sequence wraps back to 0 and then increases again. This is not a problem in itself, but if this occur fast enough then the above scenario can create an ambiguity.

If a wrap-around occurs at the right moment, the sequence number s_2 (the re-transmitted packet) can already be larger than s_n+1. Thus, in the last step (4), the receiver may interpret this as: s_2, s_n+1, s_n+m, i.e. it could view the ‘old’ packet s_2 as containing new data.

Normally, this won’t happen because a ‘wrap around’ occurs only every couple of seconds or minutes even on high bandwidth links. The interval between the original and a unneeded re-transmit will be a lot smaller.

For example,with a transmit speed of 50 Megabytes per second, a
duplicate needs to arrive more than one minute late for this to become a problem. The sequence numbers do not wrap fast enough for small delays to induce this problem.

Once TCP approaches ‘Gigabyte per second’ throughput rates, the sequence numbers can wrap so fast that even a delay by only a few milliseconds can create duplicates that TCP cannot detect anymore. By solving the problem of the too small receive window, TCP can now be used for network speeds that were impossible before – and that creates a new, albeit rare problem. To safely use Gigabytes/s speed in environments with very low RTT receivers must be able to detect such old duplicates without relying on the sequence number alone.

### TCP time stamps

#### A best-before date

In the most simple terms, [TCP timestamps][3] just add a time stamp to the packets to resolve the ambiguity caused by very fast sequence number wrap around. If a segment appears to contain new data, but its timestamp is older than the last in-window packet, then the sequence number has wrapped and the ”new” packet is actually an older duplicate. This resolves the ambiguity of re-transmits even for extreme corner cases.

But this extension allows for more than just detection of old packets. The other major feature made possible by TCP timestamps are more precise round-trip time measurements (RTTm).

#### A need for precise round-trip-time estimation

When both peers support timestamps,  every TCP segment carries two additional numbers: a timestamp value and a timestamp echo.
```

```

TCP Timestamp option (TSopt): Kind: 8, Length: 10
+-------+----+----------------+-----------------+
|Kind=8 | 10 |TS Value (TSval)|EchoReply (TSecr)|
+-------+----+----------------+-----------------+
    1      1         4                4
```

```

An accurate RTT estimate is crucial for TCP performance. TCP automatically re-sends data that was not acknowledged. Re-transmission is triggered by a timer: If it expires, TCP considers one or more packets that it has not yet received an acknowledgment for to be lost. They are then sent again.

But “has not been acknowledged” does not mean the segment was lost. It is also possible that the receiver did not send an acknowledgment so far or that the acknowledgment is still in flight. This creates a dilemma: TCP must wait long enough for such slight delays to not matter, but it can’t wait for too long either.

##### Low versus high network delay

In networks with a high delay, if the timer fires too fast, TCP frequently wastes time and bandwidth with unneeded re-sends.

In networks with a low delay however,  waiting for too long causes reduced throughput when a real packet loss occurs. Therefore, the timer should expire sooner in low-delay networks than in those with a high delay. The tcp retransmit timeout therefore cannot use a fixed constant value as a timeout. It needs to adapt the value based on the delay that it experiences in the network.

##### Round-trip time measurement

TCP picks a retransmit timeout that is based on the expected round-trip time (RTT). The RTT is not known in advance. RTT is estimated by measuring the delta between the time a segment is sent and the time TCP receives an acknowledgment for the data carried by that segment.

This is complicated by several factors.

  * For performance reasons, TCP does not generate a new acknowledgment for every packet it receives. It waits  for a very small amount of time: If more segments arrive, their reception can be acknowledged with a single ACK packet. This is called “cumulative ACK”.
  *  The round-trip-time is not constant. This is because of a myriad of factors. For example, a client might be a mobile phone switching to different base stations as its moved around. Its also possible that packet switching takes longer when link or CPU utilization increases.
  * a packet that had to be re-sent must be ignored during computation. This is because the sender cannot tell if the ACK for the re-transmitted segment is acknowledging the original transmission (that arrived after all) or the re-transmission.



This last point is significant: When TCP is busy recovering from a loss, it may only receives ACKs for re-transmitted segments. It then can’t measure (update) the RTT during this recovery phase. As a consequence it can’t adjust the re-transmission timeout, which then keeps growing exponentially. That’s a pretty specific case (it assumes that other mechanisms such as fast retransmit or SACK did not help). Nevertheless, with TCP timestamps, RTT evaluation is done even in this case.

If the extension is used, the peer reads the timestamp value from the TCP segments extension space and stores it locally. It then places this value in all the segments it sends back as the “timestamp echo”.

Therefore the option carries two timestamps: Its senders own timestamp and the most recent timestamp it received from the peer. The “echo timestamp” is used by the original sender to compute the RTT. Its the delta between its current timestamp clock and what was reflected in the “timestamp echo”.

##### Other timestamp uses

TCP timestamps even have other uses beyond PAWS and RTT measurements. For example it becomes possible to detect if a retransmission was unnecessary. If the acknowledgment carries an older timestamp echo, the acknowledgment was for the initial packet, not the re-transmitted one.

Another, more obscure use case for TCP timestamps is related to the TCP [syn cookie][4] feature.

##### TCP connection establishment on server side

When connection requests arrive faster than a server application can accept the new incoming connection, the connection backlog will eventually reach its limit. This can occur because of a mis-configuration of the system or a bug in the application. It also happens when one or more clients send connection requests without reacting to the ‘syn ack’ response. This fills the connection queue with incomplete connections. It takes several seconds for these entries to time out. This is called a “syn flood attack”.

##### TCP timestamps and TCP syn cookies

Some TCP stacks allow to accept new connections even if the queue is full. When this happens, the Linux kernel will print a prominent message to the system log:

> Possible SYN flooding on port P. Sending Cookies. Check SNMP counters.

This mechanism bypasses the connection queue entirely. The information that is normally stored in the connection queue is encoded into the SYN/ACK responses TCP sequence number. When the ACK comes back, the queue entry can be rebuilt from the sequence number.

The sequence number only has limited space to store information. Connections established using the ‘TCP syn cookie’ mechanism can not support TCP options for this reason.

The TCP options that are common to both peers can be stored in the timestamp, however. The ACK packet reflects the value back in the timestamp echo field which allows to recover the agreed-upon TCP options as well. Else, cookie-connections are restricted by the standard 64 kbyte receive window.

##### Common myths – timestamps are bad for performance

Unfortunately some guides recommend disabling TCP timestamps to reduce the number of times the kernel needs to access the timestamp clock to get the current time. This is not correct. As explained before, RTT estimation is a necessary part of TCP. For this reason, the kernel always takes a microsecond-resolution time stamp when a packet is received/sent.

Linux re-uses the clock timestamp taken for the RTT estimation for the remainder of the packet processing step. This also avoids the extra clock access to add a timestamp to an outgoing TCP packet.

The entire timestamp option only requires 10 bytes of TCP option space in each packet, this is not a significant decrease in space available for packet payload.

##### common myths – timestamps are a security problem

Some security audit tools and (older) blog posts recommend to disable TCP
timestamps because they allegedly leak system uptime: This would then allow to estimate the patch level of the system/kernel. This was true in the past: The timestamp clock is based on a constantly increasing value that starts at a fixed value on each system boot. A timestamp value would give a estimate as to how long the machine has been running (uptime).

As of Linux 4.12 TCP timestamps do not reveal the uptime anymore. All timestamp values sent use a peer-specific offset. Timestamp values also wrap every 49 days.

In other words, connections from or to address “A” see a different timestamp than connections to the remote address “B”.

Run _sysctl net.ipv4.tcp_timestamps=2_ to disable the randomization offset. This makes analyzing packet traces recorded by tools like _wireshark_ or _tcpdump_ easier – packets sent from the host then all have the same clock base in their TCP option timestamp.  For normal operation the default setting should be left as-is.

### Selective Acknowledgments

TCP has problems if several packets in the same window of data are lost. This is because TCP Acknowledgments are cumulative, but only for packets
that arrived in-sequence. Example:

  * Sender transmits segments s_1, s_2, s_3, … s_n
  * Sender receives ACK for s_2
  * This means that both s_1 and s_2 were received and the
sender no longer needs to keep these segments around.
  * Should s_3 be re-transmitted? What about s_4? s_n?



The sender waits for a “retransmission timeout” or ‘duplicate ACKs’ for s_2 to arrive. If a retransmit timeout occurs or several duplicate ACKs for s_2 arrive, the sender transmits s_3 again.

If the sender receives an acknowledgment for s_n, s_3 was the only missing packet. This is the ideal case. Only the single lost packet was re-sent.

If the sender receives an acknowledged segment that is smaller than s_n, for example s_4, that means that more than one packet was lost. The
sender needs to re-transmit the next segment as well.

##### Re-transmit strategies

Its possible to just repeat the same sequence: re-send the next packet until the receiver indicates it has processed all packet up to s_n. The problem with this approach is that it requires one RTT until the sender knows which packet it has to re-send next. While such strategy avoids unnecessary re-transmissions, it can take several seconds and more until TCP has re-sent the entire window of data.

The alternative is to re-send several packets at once. This approach allows TCP to recover more quickly when several packets have been lost. In the above example TCP re-send s_3, s_4, s_5, .. while it can only be sure that s_3 has been lost.

From a latency point of view, neither strategy is optimal. The first strategy is fast if only a single packet has to be re-sent, but takes too long when multiple packets were lost.

The second one is fast even if multiple packet have to be re-sent, but at the cost of wasting bandwidth. In addition, such a TCP sender could have transmitted new data already while it was doing the unneeded re-transmissions.

With the available information TCP cannot know which packets were lost. This is where TCP [Selective Acknowledgments][5] (SACK) come in. Just like window scaling and timestamps, it is another optional, yet very useful TCP feature.

##### The SACK option
```

```

   TCP Sack-Permitted Option: Kind: 4, Length 2
   +---------+---------+
   | Kind=4  | Length=2|
   +---------+---------+
```

```

A sender that supports this extension includes the “Sack Permitted” option in the connection request. If both endpoints support the extension, then a peer that detects a packet is missing in the data stream can inform the sender about this.
```

```

   TCP SACK Option: Kind: 5, Length: Variable
                     +--------+--------+
                     | Kind=5 | Length |
   +--------+--------+--------+--------+
   |      Left Edge of 1st Block       |
   +--------+--------+--------+--------+
   |      Right Edge of 1st Block      |
   +--------+--------+--------+--------+
   |                                   |
   /            . . .                  /
   |                                   |
   +--------+--------+--------+--------+
   |      Left Edge of nth Block       |
   +--------+--------+--------+--------+
   |      Right Edge of nth Block      |
   +--------+--------+--------+--------+
```

```

A receiver that encounters segment_s2 followed by s_5…s_n, it will include a SACK block when it sends the acknowledgment for s_2:
```

```

                +--------+-------+
                | Kind=5 |   10  |
+--------+------+--------+-------+
| Left edge: s_5                 |
+--------+--------+-------+------+
| Right edge: s_n                |
+--------+-------+-------+-------+
```

```

This tells the sender that segments up to s_2 arrived in-sequence, but it also lets the sender know that the segments s_5 to s_n were also received. The sender can then re-transmit these two packets and proceed to send new data.

##### The mythical lossless network

In theory SACK provides no advantage if the connection cannot experience packet loss. Or the connection has such a low latency that even waiting one full RTT does not matter.

In practice lossless behavior is virtually impossible to ensure.
Even if the network and all its switches and routers have ample bandwidth and buffer space packets can still be lost:

  * The host operating system might be under memory pressure and drop
packets. Remember that a host might be handling tens of thousands of packet streams simultaneously.
  * The CPU might not be able to drain incoming packets from the network interface fast enough. This causes packet drops in the network adapter itself.
  * If TCP timestamps are not available even a connection with a very small RTT can stall momentarily during loss recovery.



Use of SACK does not increase the size of TCP packets unless a connection experiences packet loss. Because of this, there is hardly a reason to disable this feature. Almost all TCP stacks support SACK – it is typically only absent on low-power IOT-alike devices that are not doing TCP bulk data transfers.

When a Linux system accepts a connection from such a device, TCP automatically disables SACK for the affected connection.

### Summary

The three TCP extensions examined in this post are all related to TCP performance and should best be left to the default setting: enabled.

The TCP handshake ensures that only extensions that are understood by both parties are used, so there is never a need to disable an extension globally just because a peer might not support it.

Turning these extensions off results in severe performance penalties, especially in case of TCP Window Scaling and SACK. TCP timestamps can be disabled without an immediate disadvantage, however there is no compelling reason to do so anymore. Keeping them enabled also makes it possible to support TCP options even when SYN cookies come into effect.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/tcp-window-scaling-timestamps-and-sack/

作者：[Florian Westphal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/strlen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/08/tcp-window-scaling-816x346.png
[2]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_segment_structure
[3]: https://www.rfc-editor.org/info/rfc7323
[4]: https://en.wikipedia.org/wiki/SYN_cookies
[5]: https://www.rfc-editor.org/info/rfc2018
