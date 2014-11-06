[felixonmars translating...]

“ntpq -p” output
================================================================================
The [Gentoo][1] (and others?) [incomplete man pages for “ntpq -p”][2] merely give the description: “*Print a list of the peers known to the server as well as a summary of their state.*”

I had not seen this documented, hence here is a summary that can be used in addition to the brief version of the man page “[man ntpq][3]“. More complete details are given on: “[ntpq – standard NTP query program][4]” (source author), and [other examples of the man ntpq pages][5].

[NTP][6] is a protocol designed to synchronize the clocks of computers over a ([WAN][7] or [LAN][8]) [udp][9] network. From [Wikipedia – NTP][10]:

> The Network Time Protocol (NTP) is a protocol and software implementation for synchronizing the clocks of computer systems over packet-switched, variable-latency data networks. Originally designed by David L. Mills of the University of Delaware and still maintained by him and a team of volunteers, it was first used before 1985 and is one of the oldest Internet protocols.

For an awful lot more than you might ever want to know about time and NTP, see “[The NTP FAQ, Time, what Time?][11]” and the current [RFCs for NTP][12]. The earlier “Network Time Protocol (Version 3) RFC” ([txt][13], or [pdf][14], Appendix E, The NTP Timescale and its Chronometry, p70) includes an interesting explanation of the changes in, and relations between, our timekeeping systems over the past 5000 years or so. Wikipedia gives a broader view in the articles [Time][15] and [Calendar][16].

The command “ntpq -p” outputs a table such as for example:

         remote           refid      st t when poll reach   delay   offset  jitter
    ==============================================================================
     LOCAL(0)        .LOCL.          10 l  96h   64    0    0.000    0.000   0.000
    *ns2.example.com 10.193.2.20      2 u  936 1024  377   31.234    3.353   3.096

### Further detail: ###

#### Table headings: ####


- **remote** – The remote peer or server being synced to. “LOCAL” is this local host (included in case there are no remote peers or servers available);
- **refid** – Where or what the remote peer or server is itself synchronised to;
- **st** – The remote peer or server [Stratum][17]
- **t** – Type (u: [unicast][18] or [manycast][19] client, b: [broadcast][20] or [multicast][21] client, l: local reference clock, s: symmetric peer, A: manycast server, B: broadcast server, M: multicast server, see “[Automatic Server Discovery][22]“);
- **when** – When last polled (seconds ago, “h” hours ago, or “d” days ago);
- **poll** – Polling frequency: [rfc5905][23] suggests this ranges in NTPv4 from 4 (16s) to 17 (36h) (log2 seconds), however observation suggests the actual displayed value is seconds for a much smaller range of 64 (26) to 1024 (210) seconds;
- **reach** – An 8-bit left-shift shift register value recording polls (bit set = successful, bit reset = fail) displayed in [octal][24];
- **delay** – Round trip communication delay to the remote peer or server (milliseconds);
- **offset** – Mean offset (phase) in the times reported between this local host and the remote peer or server ([RMS][25], milliseconds);
- **jitter** – Mean deviation (jitter) in the time reported for that remote peer or server (RMS of difference of multiple time samples, milliseconds);

#### Select Field tally code: ####

The first character displayed in the table (Select Field tally code) is a state flag (see [Peer Status Word][26]) that follows the sequence ” “, “x”, “-“, “#”, “+”, “*”, “o”:


- ”** **” – No state indicated for:
	- non-communicating remote machines,
	- “LOCAL” for this local host,
	- (unutilised) high stratum servers,
	- remote machines that are themselves using this host as their synchronisation reference;
- “**x**” – Out of tolerance, do not use (discarded by intersection algorithm);
- “**-**” – Out of tolerance, do not use (discarded by the cluster algorithm);
- “**#**” – Good remote peer or server but not utilised (not among the first six peers sorted by synchronization distance, ready as a backup source);
- “**+**” – Good and a preferred remote peer or server (included by the combine algorithm);
- “*****” – The remote peer or server presently used as the primary reference;
- “**o**” – PPS peer (when the prefer peer is valid). The actual system synchronization is derived from a pulse-per-second (PPS) signal, either indirectly via the PPS reference clock driver or directly via kernel interface.

See the [Clock Select Algorithm][27].

#### “refid”: ####

The **refid** can have the status values:


- An IP address – The [IP address][28] of a remote peer or server;
- **.LOCL.** – This local host (a place marker at the lowest stratum included in case there are no remote peers or servers available);
- **.PPS.** – “[Pulse Per Second][29]” from a time standard;
- **.IRIG.** – [Inter-Range Instrumentation Group][30] time code;
- **.ACTS.** – American [NIST time standard][31] telephone modem;
- **.NIST.** – American NIST time standard telephone modem;
- **.PTB.** – German [PTB][32] time standard telephone modem;
- **.USNO.** – American [USNO time standard][33] telephone modem;
- **.CHU.** – [CHU][34] ([HF][35], Ottawa, ON, Canada) time standard radio receiver;
- **.DCFa.** – [DCF77][36] ([LF][37], Mainflingen, Germany) time standard radio receiver;
- **.HBG.** – [HBG][38] (LF Prangins, Switzerland) time standard radio receiver;
- **.JJY.** – [JJY][39] (LF Fukushima, Japan) time standard radio receiver;
- **.LORC.** – [LORAN][40]-C station ([MF][41]) time standard radio receiver. Note, [no longer operational][42] (superseded by [eLORAN][43]);
- **.MSF.** – [MSF][44] (LF, Anthorn, Great Britain) time standard radio receiver;
- **.TDF.** – [TDF][45] (MF, Allouis, France) time standard radio receiver;
- **.WWV.** – [WWV][46] (HF, Ft. Collins, CO, America) time standard radio receiver;
- **.WWVB.** – [WWVB][47] (LF, Ft. Collins, CO, America) time standard radio receiver;
- **.WWVH.** – [WWVH][48] (HF, Kauai, HI, America) time standard radio receiver;
- **.GOES.** – American [Geosynchronous Orbit Environment Satellite][49];
- **.GPS.** – American [GPS][50];
- **.GAL.** – [Galileo][51] European [GNSS][52];
- **.ACST.** – manycast server;
- **.AUTH.** – authentication error;
- **.AUTO.** – Autokey sequence error;
- **.BCST.** – broadcast server;
- **.CRYPT.** – Autokey protocol error;
- **.DENY.** – access denied by server;
- **.INIT.** – association initialized;
- **.MCST.** – multicast server;
- **.RATE.** – (polling) rate exceeded;
- **.TIME.** – association timeout;
- **.STEP.** – step time change, the offset is less than the panic threshold (1000ms) but greater than the step threshold (125ms).

#### Operation notes ####

A time server will report time information with no time updates from clients (unidirectional updates), whereas a peer can update fellow participating peers to converge upon a mutually agreed time (bidirectional updates).

During [initial startup][53]:

> Unless using the iburst option, the client normally takes a few minutes to synchronize to a server. If the client time at startup happens to be more than 1000s distant from NTP time, the daemon exits with a message to the system log directing the operator to manually set the time within 1000s and restart. If the time is less than 1000s but more than 128s distant, a step correction occurs and the daemon restarts automatically.

> When started for the first time and a frequency file is not present, the daemon enters a special mode in order to calibrate the frequency. This takes 900s during which the time is not [disciplined][54]. When calibration is complete, the daemon creates the frequency file and enters normal mode to amortize whatever residual offset remains.

Stratum 0 devices are such as atomic (caesium, rubidium) clocks, GPS clocks, or other time standard radio clocks providing a time signal to the Stratum 1 time servers. NTP reports [UTC][55] (Coordinated Universal Time) only. Client programs/utilities then use [time zone][56] data to report local time from the synchronised UTC.

The protocol is highly accurate, using a resolution of less than a nanosecond (about 2-32 seconds). The time resolution achieved and other parameters for a host (host hardware and operating system limited) is reported by the command “ntpq -c rl” (see [rfc1305][57] Common Variables and [rfc5905][58]).

#### “ntpq -c rl” output parameters: ####

- **precision** is rounded to give the next larger integer power of two. The achieved resolution is thus 2precision (seconds)
- **rootdelay** – total roundtrip delay to the primary reference source at the root of the synchronization subnet. Note that this variable can take on both positive and negative values, depending on clock precision and skew (seconds)
- **rootdisp** – maximum error relative to the primary reference source at the root of the synchronization subnet (seconds)
- **tc** – NTP algorithm [PLL][59] (phase locked loop) or [FLL][60] (frequency locked loop) time constant (log2)
- **mintc** – NTP algorithm PLL/FLL minimum time constant or ‘fastest response’ (log2)
- **offset** – best and final offset determined by the combine algorithm used to discipline the system clock (ms)
- **frequency** – system clock period (log2 seconds)
- **sys_jitter** – best and final jitter determined by the combine algorithm used to discipline the system clock (ms)
- **clk_jitter** – host hardware(?) system clock jitter (ms)
- **clk_wander** – host hardware(?) system clock wander ([PPM][61] – parts per million)

Jitter (also called timing jitter) refers to short-term variations in frequency with components greater than 10Hz, while wander refers to long-term variations in frequency with components less than 10Hz. (Stability refers to the systematic variation of frequency with time and is synonymous with aging, drift, trends, etc.)

#### Operation notes (continued) ####

The NTP software maintains a continuously updated drift correction. For a correctly configured and stable system, a reasonable expectation for modern hardware synchronising over an uncongested internet connection is for network client devices to be synchronised to within a few milliseconds of UTC at the time of synchronising to the NTP service. (What accuracy can be expected between peers on an uncongested Gigabit LAN?)

Note that for UTC, a [leap second][62] can be inserted into the reported time up to twice a year to allow for variations in the Earth’s rotation. Also beware of the one hour time shifts for when local times are reported for “[daylight savings][63]” times. Also, the clock for a client device will run independently of UTC until resynchronised oncemore, unless that device is calibrated or a drift correction is applied.

#### [What happens during a Leap Second?][64] ####

> During a leap second, either one second is removed from the current day, or a second is added. In both cases this happens at the end of the UTC day. If a leap second is inserted, the time in UTC is specified as 23:59:60. In other words, it takes two seconds from 23:59:59 to 0:00:00 instead of one. If a leap second is deleted, time will jump from 23:59:58 to 0:00:00 in one second instead of two. See also [The Kernel Discipline][65].

So… What actually is the value for the step threshold: 125ms or 128ms? And what are the PLL/FLL tc units (log2 s? ms?)? And what accuracy can be expected between peers on an uncongested Gigabit LAN?

 

Thanks for comments from Camilo M and Chris B. Corrections and further details welcomed.

Cheers,
Martin

### Apocrypha: ###

- The [epoch for NTP][66] starts in year 1900 while the epoch in UNIX starts in 1970.
- [Time corrections][67] are applied gradually, so it may take up to three hours until the frequency error is compensated.
- [Peerstats and loopstats][68] can be logged to [summarise/plot time offsets and errors][69]
- [RMS][70] – Root Mean Square
- [PLL][71] – Phase locked loop
- [FLL][72] – Frequency locked loop
- [PPM][73] – Parts per million, used here to describe rate of time drift
- [man ntpq (Gentoo brief version)][74]
- [man ntpq (long version)][75]
- [man ntpq (Gentoo long version)][76]

### See: ###

- [ntpq – standard NTP query program][77]
- [The Network Time Protocol (NTP) Distribution][78]
- A very brief [history][79] of NTP
- A more detailed brief history: “Mills, D.L., A brief history of NTP time: confessions of an Internet timekeeper. Submitted for publication; please do not cite or redistribute” ([pdf][80])
- [NTP RFC][81] standards documents
- Network Time Protocol (Version 3) RFC – [txt][82], or [pdf][83]. Appendix E, The NTP Timescale and its Chronometry, p70, includes an interesting explanation of the changes in, and relations between, our timekeeping systems over the past 5000 years or so
- Wikipedia: [Time][84] and [Calendar][85]
- [John Harrison and the Longitude problem][86]
- [Clock of the Long Now][87] – The 10,000 Year Clock
- John C Taylor – [Chronophage][88]
- [Orders of magnitude of time][89]
- The [Greenwich Time Signal][90]

### Others: ###

SNTP (Simple Network Time Protocol, [RFC 4330][91]) is basically also NTP, but lacks some internal algorithms for servers where the ultimate performance of a full NTP implementation based on [RFC 1305][92] is neither needed nor justified.

The W32Time [Windows Time Service][93] is a non-standard implementation of SNTP, with no accuracy guarantees, and an assumed accuracy of no better than about a 1 to 2 second range. (Is that due to there being no system clock drift correction and a time update applied only once every 24 hours assumed for a [PC][94] with typical clock drift?)

There is also the [PTP (IEEE 1588)][95] Precision Time Protocol. See Wikipedia: [Precision Time Protocol][96]. A software demon is [PTPd][97]. The significant features are that it is intended as a [LAN][98] high precision master-slave synchronisation system synchronising at the microsecond scale to a master clock for [International Atomic Time][99] (TAI, [monotonic][100], no leap seconds). Data packet timestamping can be appended by hardware at the physical layer by a network interface card or switch for example. Network kit supporting PTP can timestamp data packets in and out in a way that removes the delay effect of processing within the switch/router. You can run PTP without hardware timestamping but it might not synchronise if the time errors introduced are too great. Also it will struggle to work through a router (large delays) for the same reason.

### Older time synchronization protocols: ###

- DTSS – Digital Time Synchronisation Service by Digital Equipment Corporation, superseded by NTP. See an example of [DTSS VMS C code c2000][101]. (Any DTSS articles/documentation anywhere?)
- [DAYTIME protocol][102], synchronization protocol using [TCP][103] or [UDP][104] port 13
- [ICMP Timestamp][105] and [ICMP Timestamp Reply][106], synchronization protocol using [ICMP][107]
- [Time Protocol][108], synchronization protocol using TCP or UDP port 37

--------------------------------------------------------------------------------

via: http://nlug.ml1.co.uk/2012/01/ntpq-p-output/831

作者：Martin L
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.gentoo.org/
[2]:http://nlug.ml1.co.uk/2012/01/man-ntpq-gentoo-brief-version/853
[3]:http://www.thelinuxblog.com/linux-man-pages/1/ntpq
[4]:http://www.eecis.udel.edu/~mills/ntp/html/ntpq.html
[5]:http://linux.die.net/man/8/ntpq
[6]:http://www.ntp.org/
[7]:http://en.wikipedia.org/wiki/Wide_area_network
[8]:http://en.wikipedia.org/wiki/Local_area_network
[9]:http://en.wikipedia.org/wiki/User_Datagram_Protocol
[10]:http://en.wikipedia.org/wiki/Network_Time_Protocol
[11]:http://www.ntp.org/ntpfaq/NTP-s-time.htm
[12]:http://www.ntp.org/rfc.html
[13]:http://www.ietf.org/rfc/rfc1305.txt
[14]:http://www.rfc-editor.org/rfc/rfc1305.pdf
[15]:http://en.wikipedia.org/wiki/Time
[16]:http://en.wikipedia.org/wiki/Calendar
[17]:http://en.wikipedia.org/wiki/Network_Time_Protocol#Clock_strata
[18]:http://en.wikipedia.org/wiki/Unicast
[19]:http://www.eecis.udel.edu/~mills/ntp/html/manyopt.html#mcst
[20]:http://en.wikipedia.org/wiki/Broadcasting_%28computing%29
[21]:http://en.wikipedia.org/wiki/Multicast
[22]:http://www.eecis.udel.edu/~mills/ntp/html/manyopt.html
[23]:http://www.ietf.org/rfc/rfc5905.txt
[24]:http://en.wikipedia.org/wiki/Octal#In_computers
[25]:http://en.wikipedia.org/wiki/Root_mean_square
[26]:http://www.eecis.udel.edu/~mills/ntp/html/decode.html#peer
[27]:http://www.eecis.udel.edu/~mills/ntp/html/select.html
[28]:http://en.wikipedia.org/wiki/Ip_address
[29]:http://en.wikipedia.org/wiki/Pulse_per_second
[30]:http://en.wikipedia.org/wiki/Inter-Range_Instrumentation_Group
[31]:http://en.wikipedia.org/wiki/Standard_time_and_frequency_signal_service
[32]:http://www.ptb.de/index_en.html
[33]:http://en.wikipedia.org/wiki/United_States_Naval_Observatory#Time_service
[34]:http://en.wikipedia.org/wiki/CHU_%28radio_station%29
[35]:http://en.wikipedia.org/wiki/High_frequency
[36]:http://en.wikipedia.org/wiki/DCF77
[37]:http://en.wikipedia.org/wiki/Low_frequency
[38]:http://en.wikipedia.org/wiki/HBG_%28time_signal%29
[39]:http://en.wikipedia.org/wiki/JJY#Time_standards
[40]:http://en.wikipedia.org/wiki/LORAN#Timing_and_synchronization
[41]:http://en.wikipedia.org/wiki/Medium_frequency
[42]:http://en.wikipedia.org/wiki/LORAN#The_future_of_LORAN
[43]:http://en.wikipedia.org/wiki/LORAN#eLORAN
[44]:http://en.wikipedia.org/wiki/Time_from_NPL#The_.27MSF_signal.27_and_the_.27Rugby_clock.27
[45]:http://en.wikipedia.org/wiki/T%C3%A9l%C3%A9_Distribution_Fran%C3%A7aise
[46]:http://en.wikipedia.org/wiki/WWV_%28radio_station%29#Time_signals
[47]:http://en.wikipedia.org/wiki/WWVB
[48]:http://en.wikipedia.org/wiki/WWVH
[49]:http://en.wikipedia.org/wiki/GOES#Further_reading
[50]:http://en.wikipedia.org/wiki/Gps#Timekeeping
[51]:http://en.wikipedia.org/wiki/Galileo_%28satellite_navigation%29#The_concept
[52]:http://en.wikipedia.org/wiki/Gnss
[53]:http://www.eecis.udel.edu/~mills/ntp/html/debug.html
[54]:http://www.ntp.org/ntpfaq/NTP-s-algo-kernel.htm
[55]:http://en.wikipedia.org/wiki/Coordinated_Universal_Time
[56]:http://en.wikipedia.org/wiki/Time_zone
[57]:http://www.ietf.org/rfc/rfc1305.txt
[58]:http://www.ietf.org/rfc/rfc5905.txt
[59]:http://en.wikipedia.org/wiki/PLL
[60]:http://en.wikipedia.org/wiki/Frequency-locked_loop
[61]:http://en.wikipedia.org/wiki/Parts_per_million
[62]:http://en.wikipedia.org/wiki/Leap_second
[63]:http://en.wikipedia.org/wiki/Daylight_saving_time
[64]:http://www.ntp.org/ntpfaq/NTP-s-time.htm#Q-TIME-LEAP-SECOND
[65]:http://www.ntp.org/ntpfaq/NTP-s-algo-kernel.htm
[66]:http://www.ntp.org/ntpfaq/NTP-s-algo.htm#AEN1895
[67]:http://www.ntp.org/ntpfaq/NTP-s-algo.htm#Q-ACCURATE-CLOCK
[68]:http://www.ntp.org/ntpfaq/NTP-s-trouble.htm#Q-TRB-MON-STATFIL
[69]:http://www.ntp.org/ntpfaq/NTP-s-trouble.htm#AEN5086
[70]:http://en.wikipedia.org/wiki/Root_mean_square
[71]:http://en.wikipedia.org/wiki/PLL
[72]:http://en.wikipedia.org/wiki/Frequency-locked_loop
[73]:http://en.wikipedia.org/wiki/Parts_per_million
[74]:http://nlug.ml1.co.uk/2012/01/man-ntpq-gentoo-brief-version/853
[75]:http://nlug.ml1.co.uk/2012/01/man-ntpq-long-version/855
[76]:http://nlug.ml1.co.uk/2012/01/man-ntpq-gentoo-long-version/856
[77]:http://www.eecis.udel.edu/~mills/ntp/html/ntpq.html
[78]:http://www.eecis.udel.edu/~mills/ntp/html/index.html
[79]:http://www.ntp.org/ntpfaq/NTP-s-def-hist.htm
[80]:http://www.eecis.udel.edu/~mills/database/papers/history.pdf
[81]:http://www.ntp.org/rfc.html
[82]:http://www.ietf.org/rfc/rfc1305.txt
[83]:http://www.rfc-editor.org/rfc/rfc1305.pdf
[84]:http://en.wikipedia.org/wiki/Time
[85]:http://en.wikipedia.org/wiki/Calendar
[86]:http://www.rmg.co.uk/harrison
[87]:http://longnow.org/clock/
[88]:http://johnctaylor.com/
[89]:http://en.wikipedia.org/wiki/Orders_of_magnitude_%28time%29
[90]:http://en.wikipedia.org/wiki/Greenwich_Time_Signal
[91]:http://tools.ietf.org/html/rfc4330
[92]:http://tools.ietf.org/html/rfc1305
[93]:http://en.wikipedia.org/wiki/Network_Time_Protocol#Microsoft_Windows
[94]:http://en.wikipedia.org/wiki/Personal_computer
[95]:http://www.nist.gov/el/isd/ieee/ieee1588.cfm
[96]:http://en.wikipedia.org/wiki/IEEE_1588
[97]:http://ptpd.sourceforge.net/
[98]:http://en.wikipedia.org/wiki/Local_area_network
[99]:http://en.wikipedia.org/wiki/International_Atomic_Time
[100]:http://en.wikipedia.org/wiki/Monotonic_function
[101]:http://antinode.info/ftp/dtss_ntp/
[102]:http://en.wikipedia.org/wiki/DAYTIME
[103]:http://en.wikipedia.org/wiki/Transmission_Control_Protocol
[104]:http://en.wikipedia.org/wiki/User_Datagram_Protocol
[105]:http://en.wikipedia.org/wiki/ICMP_Timestamp
[106]:http://en.wikipedia.org/wiki/ICMP_Timestamp_Reply
[107]:http://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
[108]:http://en.wikipedia.org/wiki/Time_Protocol
