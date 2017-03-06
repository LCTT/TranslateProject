Arrive On Time With NTP -- Part 1: Usage Overview
============================================================

 ![NTP](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ntp-time.jpg?itok=zu8dqpki "NTP") 
In this first of a three-part series, Chris Binnie looks at why NTP services are essential to a happy infrastructure.[Used with permission][1]

Few services on the Internet can claim to be so critical in nature as time. Subtle issues which affect the timekeeping of your systems can sometimes take a day or two to be realized, and they are almost always unwelcome because of the knock-on effects they cause.

Consider as an example that your backup server loses connectivity to your Network Time Protocol (NTP) server and, over a period of a few days, introduces several hours of clock skew. Your colleagues arrive at work at 9am as usual only to find the bandwidth-intensive backups consuming all the network resources meaning that they can barely even log into their workstations to start their day’s work until the backup has finished.

In this first of a three-part series, I’ll provide brief overview of NTP to help prevent such disasters. From the timestamps on your emails to remembering when you started your shift at work, NTP services are essential to a happy infrastructure.

You might consider that the really important NTP servers (from which other servers pick up their clock data) are at the bottom of an inverted pyramid and referred to as Stratum 1 servers (also known as “primary” servers). These servers speak directly to national time services (known as Stratum 0, which might be devices such as atomic clocks or GPS clocks, for example). There are a number of ways of communicating with them securely, via satellite or radio, for example.

Somewhat surprisingly, it’s reasonably common for even large enterprises to connect to Stratum 2 servers (or “secondary” servers) as opposed to primary servers. Stratum 2 servers, as you’d expect, synchronize directly with Stratum 1 servers. If you consider that a corporation might have their own onsite NTP servers (at least two, usually three, for resilience) then these would be Stratum 3 servers. As a result, such a corporation’s Stratum 3 servers would then connect upstream to predefined secondary servers and dutifully pass the time onto its many client and server machines as an accurate reflection of the current time.

A simple design component of NTP is that it works on the premise -- thanks to the large geographical distances travelled by Internet traffic -- that round-trip times (of when a packet was sent and how many seconds later it was received) are sensibly taken into account before trusting to a time as being entirely accurate. There’s a lot more to setting a computer’s clock than you might at first think, if you don’t believe me, then [this fascinating web page][3] is well worth looking at.

At the risk of revisiting the point, NTP is so key to making sure your infrastructure functions as expected that the Stratum servers to which your NTP servers connect to fuel your internal timekeeping must be absolutely trusted and additionally offer redundancy. There’s an informative list of the Stratum 1 servers available at the [main NTP site][4].

As you can see from that list, some NTP Stratum 1 servers run in a “ClosedAccount” state; these servers can’t be used without prior consent. However, as long as you adhere to their usage guidelines, “OpenAccess” servers are indeed open for polling. Any “RestrictedAccess” servers can sometimes be limited due to a maximum number of clients or a minimum poll interval. Additionally, these are sometimes only available to certain types of organizations, such as academia.

### Respect My Authority

On a public NTP server, you are likely to find that the usage guidelines follow several rules. Let’s have a look at some of them now.

The “iburst” option involves a client sending a number of packets (eight packets rather than the usual single packet) to an NTP server should it not respond during at a standard polling interval. If, after shouting loudly at the NTP server a few times within a short period of time, a recognized response isn’t forthcoming, then the local time is not  changed.

Unlike “iburst” the “burst” option is not commonly allowed (so don’t use it!) as per the general rules for NTP servers. That option instead sends numerous packets (eight again apparently) at each polling interval and also when the server is available. If you are continually throwing packets at higher-up Stratum servers even when they are responding normally, you may get blacklisted for using the “burst” option.

Clearly, how often you connect to a server makes a difference to its load (and the negligible amount of bandwidth used). These settings can be configured locally using the “minpoll” and “maxpoll” options. However, to follow the connecting rules on to an NTP server, you shouldn’t generally alter the the defaults of 64 seconds and 1024 seconds, respectively.

Another, far from tacit, rule is that clients should always respect Kiss-Of-Death (KOD) messages generated by those servers from which they request time. If an NTP server doesn’t want to respond to a particular request, similar to certain routing and firewalling techniques, then it’s perfectly possible for it to simply discard or blackhole any associated packets.

In other words, the recipient server of these unwanted packets takes on no extra load to speak of and simply drops the traffic that it doesn’t think it should serve a response to. As you can imagine, however, this isn’t always entirely helpful, and sometimes it’s better to politely ask the client to cease and desist, rather than ignoring the requests. For this reason, there’s a specific packet type called the KOD packet. Should a client be sent an unwelcome KOD packet then it should then remember that particular server as having responded with an access-denied style marker.

If it’s not the first KOD packet received from back the server, then the client assumes that there is a rate-limiting condition (or something similar) present on the server. It’s common at this stage for the client to write to its local logs, noting the less-than-satisfactory outcome of the transaction with that particular server, if you ever need to troubleshoot such a scenario.

Bear in mind that, for obvious reasons, it’s key that your NTP’s infrastructure be dynamic. Thus, it’s important not to hard-code IP addresses into your NTP config. By using DNS names, individual servers can fall off the network and the service can still be maintained, IP address space can be reallocated and simple load balancing (with a degree of resilience) can be introduced.

Let’s not forget that we also need to consider that the exponential growth of the Internet of Things (IoT), eventually involving billions of new devices, will mean a whole host of equipment will need to keep its wristwatches set to the correct time. Should a hardware vendor inadvertently (or purposely) configure their devices to only communicate with one provider’s NTP servers (or even a single server) then there can be -- and have been in the past -- very unwelcome issues.

As you might imagine, as more units of hardware are purchased and brought online, the owner of the NTP infrastructure is likely to be less than grateful for the associated fees that they are incurring without any clear gain. This scenario is far from being unique to the realms of fantasy. Ongoing headaches -- thanks to NTP traffic forcing a provider’s infrastructure to creak -- have been seen several times over the last few years.

In the next two articles, I’ll look at some important NTP configuration options and examine server setup.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/arrive-time-ntp-part-1-usage-overview

作者：[CHRIS BINNIE][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/chrisbinnie
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/files/images/ntp-timejpg
[3]:http://www.ntp.org/ntpfaq/NTP-s-sw-clocks-quality.htm
[4]:http://support.ntp.org/bin/view/Servers/StratumOneTimeServers
