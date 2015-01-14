网络时间的那些事情及 ntpq 详解
================================================================================
[Gentoo][1]（也许其他发行版也是？）中 ["ntpq -p" 的 man page][2] 只有简短的描述：“*打印出该服务器已知的节点列表和它们的状态概要信息。*”

我还没见到关于这个命令的说明文档，因此这里对此作一个总结，可以补充进 "[man ntpq][3]" man page 中。更多的细节见这里 “[ntpq – 标准 NTP 请求程序][4]”（原作者），和 [其他关于 man ntpq 的例子][5].

[NTP][6] 是一个设计用于通过 [udp][9] 网络 ([WAN][7] 或者 [LAN][8]) 来同步计算机时钟的协议。引用 [Wikipedia – NTP][10]：

> 网络时间协议（英语：Network Time Protocol，NTP）一种协议和软件实现，用于通过使用有网络延迟的报文交换网络同步计算机系统间的时钟。最初由美国特拉华大学的 David L. Mills 设计，现在仍然由他和志愿者小组维护，它于 1985 年之前开始使用，是因特网中最老的协议之一。

想了解更多有关时间和 NTP 协议的知识，可以参考 “[The NTP FAQ, Time, what Time?][11]”和 [RFCs for NTP][12]。早期的“Network Time Protocol (Version 3) RFC” ([txt][13], or [pdf][14], Appendix E, The NTP Timescale and its Chronometry, p70) 包含了对过去 5000 年我们的计时系统的变化和关系的有趣解释。维基百科的文章 [Time][15] 和 [Calendar][16] 提供了更宏观的视角。

命令 "ntpq -q" 输出下面这样的一个表：

         remote           refid      st t when poll reach   delay   offset  jitter
    ==============================================================================
     LOCAL(0)        .LOCL.          10 l  96h   64    0    0.000    0.000   0.000
    *ns2.example.com 10.193.2.20      2 u  936 1024  377   31.234    3.353   3.096

### 更多细节 ###

#### 表头 ####


- **remote** – 用于同步的远程节点或服务器。“LOCAL”表示本机 （当没有远程服务器可用时会出现） 
- **refid** – 远程的服务器进行同步的更高一级服务器
- **st** – 远程节点或服务器的 [Stratum][17]（级别，NTP 时间同步是分层的）
- **t** – 类型 (u: [unicast（单播）][18] 或 [manycast（选播）][19] 客户端, b: [broadcast（广播）][20] 或 [multicast（多播）][21] 客户端, l: 本地时钟, s: 对称节点（用于备份）, A: 选播服务器, B: 广播服务器, M: 多播服务器, 参见“[Automatic Server Discovery][22]“)
- **when** – 最后一次同步到现在的时间 (默认单位为秒, “h”表示小时，“d”表示天)
- **poll** – 同步的频率：[rfc5905][23]建议在 NTPv4 中这个值的范围在 4 (16秒) 至 17 (36小时) 之间（即2的指数次秒），然而观察发现这个值的实际大小在一个小的多的范围内 ：64 (2^6 )秒 至 1024 (2^10 )秒
- **reach** – 一个8位的左移移位寄存器值，用来测试能否和服务器连接，每成功连接一次它的值就会增加，以 [8 进制][24]显示
- **delay** – 从本地到远程节点或服务器通信的往返时间（毫秒）
- **offset** – 主机与远程节点或服务器时间源的时间偏移量，offset 越接近于0，主机和 NTP 服务器的时间越接近(以[方均根][25]表示，单位为毫秒)
- **jitter** – 与远程节点同步的时间源的平均偏差（多个时间样本中的 offset 的偏差，单位是毫秒），这个数值的绝对值越小，主机的时间就越精确

#### 字段的统计代码 ####

表中第一个字符（统计代码）是状态标识（参见 [Peer Status Word][26]），包含 " "，"x"，"-"，"#"，"+"，"*"，"o"：

- " " – 无状态，表示:
	- 没有远程通信的主机
	- "LOCAL" 即本机
	- （未被使用的）高层级服务器
	- 远程主机使用的这台机器作为同步服务器
- “**x**” – 已不再使用
- “**-**” – 已不再使用
- “**#**” – 良好的远程节点或服务器但是未被使用 （不在按同步距离排序的前六个节点中，作为备用节点使用）
- “**+**” – 良好的且优先使用的远程节点或服务器（包含在组合算法中）
- “*” – 当前作为优先主同步对象的远程节点或服务器
- “**o**” – PPS 节点 (当优先节点是有效时)。实际的系统同步是源于秒脉冲信号（pulse-per-second，PPS），可能通过PPS 时钟驱动或者通过内核接口。

参考 [Clock Select Algorithm][27].

#### refid ####

**refid** 有下面这些状态值

- 一个IP地址 – 远程节点或服务器的 [IP 地址][28] 
- **.LOCL.** – 本机 (当没有远程节点或服务器可用时）
- **.PPS.** –  时间标准中的“[Pulse Per Second][29]”（秒脉冲）
- **.IRIG.** – [Inter-Range Instrumentation Group][30] 时间码
- **.ACTS.** – 美国 [NIST 标准时间][31] 电话调制器
- **.NIST.** –美国 NIST 标准时间电话调制器
- **.PTB.** – 德国 [PTB][32] 时间标准电话调制器
- **.USNO.** – 美国 [USNO 标准时间][33] 电话调制器
- **.CHU.** – [CHU][34] ([HF][35], Ottawa, ON, Canada) 标准时间无线电接收器
- **.DCFa.** – [DCF77][36] ([LF][37], Mainflingen, Germany) 标准时间无线电接收器
- **.HBG.** – [HBG][38] (LF Prangins, Switzerland) 标准时间无线电接收器
- **.JJY.** – [JJY][39] (LF Fukushima, Japan) 标准时间无线电接收器
- **.LORC.** – [LORAN][40]-C station ([MF][41]) 标准时间无线电接收器，注： [不再可用][42] (被 [eLORAN][43] 废弃)
- **.MSF.** – [MSF][44] (LF, Anthorn, Great Britain) 标准时间无线电接收器
- **.TDF.** – [TDF][45] (MF, Allouis, France)标准时间无线电接收器
- **.WWV.** – [WWV][46] (HF, Ft. Collins, CO, America) 标准时间无线电接收器
- **.WWVB.** – [WWVB][47] (LF, Ft. Collins, CO, America) 标准时间无线电接收器
- **.WWVH.** – [WWVH][48] (HF, Kauai, HI, America) 标准时间无线电接收器
- **.GOES.** – 美国[静止环境观测卫星][49];
- **.GPS.** – 美国 [GPS][50];
- **.GAL.** – [伽利略定位系统][51]欧洲 [GNSS][52];
- **.ACST.** – 选播服务器
- **.AUTH.** – 认证错误
- **.AUTO.** – Autokey （NTP 的一种认证机制）顺序错误
- **.BCST.** – 广播服务器
- **.CRYPT.** – Autokey 协议错误
- **.DENY.** – 服务器拒绝访问;
- **.INIT.** – 关联初始化
- **.MCST.** – 多播服务器
- **.RATE.** – (轮询) 速率超出限定
- **.TIME.** – 关联超时
- **.STEP.** – 间隔时长改变，偏移量比危险阈值小(1000ms) 比间隔时间 (125ms)大

#### 操作要点 ####

一个时间服务器只会报告时间信息而不会从客户端更新时间（单向更新），而一个节点可以更新其他同级节点的时间，结合出一个彼此同意的时间（双向更新）。

[初次启动][53]时：

> 除非使用 iburst 选项，客户端通常需要花几分钟来和服务器同步。如果客户端在启动时时间与 NTP 服务器的时间差大于 1000 秒，守护进程会退出并在系统日志中记录，让操作者手动设置时间差小于 1000 秒后再重新启动。如果时间差小于 1000 秒，但是大于 128 秒，会自动矫正间隔，并自动重启守护进程。

> 当第一次启动时，时间频率文件（通常是 ntp.drift 文件，记录时间偏移）不存在，守护进程进入一个特殊模式来矫正频率。当时钟不符合[规范][54]时这会需要 900 秒。当校正完成后，守护进程创建时间频率文件进入普通模式，并分步校正剩余的偏差。

NTP 0 层（Stratum 0 ）的设备如原子钟（铯，铷），GPS 时钟或者其他标准时间的无线电时钟为 1 层（Stratum 1）的时间服务器提供时间信号。NTP 只报告[UTC][55] 时间（统一协调时，Coordinated Universal Time）。客户端程序使用[时区][56]从 UTC 导出本地时间。

NTP 协议是高精度的，使用的精度小于纳秒（2的 -32 次方）。主机的时间精度和其他参数（受硬件和操作系统限制）使用命令 “ntpq -c rl” 查看（参见 [rfc1305][57] 通用变量和  [rfc5905][58]）。

#### “ntpq -c rl”输出参数 ####

- **precision** 为四舍五入值，且为 2 的幂数。因此精度为 2^precision （秒）
- **rootdelay** – 与同步网络中主同步服务器的总往返延时。注意这个值可以是正数或者负数，取决于时钟的精度。
- **rootdisp** – 相对于同步网络中主同步服务器的偏差(秒)
- **tc** – NTP 算法 [PLL][59] （phase locked loop，锁相环路） 或 [FLL][60] (frequency locked loop，锁频回路) 时间常量
- **mintc** – NTP 算法 PLL/FLL 最小时间常亮或“最快响应
- **offset** – 由结合算法得出的系统时钟偏移量（毫秒）
- **frequency** – 系统时钟频率
- **sys_jitter** – 由结合算法得出的系统时钟平均偏差（毫秒）
- **clk_jitter** – 硬件时钟平均偏差（毫秒）
- **clk_wander** – 硬件时钟偏移([PPM][61] – 百分之一)

Jitter (也叫 timing jitter) 表示短期变化大于10HZ 的频率， wander 表示长期变化大于10HZ 的频率 （Stability 表示系统的频率随时间的变化，和 aging, drift, trends 等是同义词）

#### 操作要点（续） ####

NTP 软件维护一系列连续更新的频率变化的校正值。对于设置正确的稳定系统，在非拥塞的网络中，现代硬件的 NTP 时钟同步通常与 UTC 标准时间相差在毫秒内。（在千兆 LAN 网络中可以达到何种精度？）

对于 UTC 时间，[闰秒 leap second ][62] 可以每两年插入一次用于同步地球自传的变化。注意本地时间为[夏令时][63]时时间会有一小时的变化。在重同步之前客户端设备会使用独立的 UTC 时间，除非客户端使用了偏移校准。

#### [闰秒发生时会怎样][64] ####

> 闰秒发生时，会对当天时间增加或减少一秒。闰秒的调整在 UTC 时间当天的最后一秒。如果增加一秒，UTC 时间会出现 23:59:60。即 23:59:59 到 0:00:00  之间实际上需要 2 秒钟。如果减少一秒，时间会从 23:59:58 跳至 0:00:00 。另见 [The Kernel Discipline][65].

那么… 间隔阈值（step threshold）的真实值是多少: 125ms 还是 128ms？ PLL/FLL tc 的单位是什么 (log2 s? ms?)？在非拥塞的千兆 LAN 中时间节点间的精度能达到多少？

感谢 Camilo M 和 Chris B的评论。 欢迎校正错误和更多细节的探讨。

谢谢
Martin

### 附录 ###

- [NTP 的纪元][66] 从 1900 开始而 UNIX 的从 1970开始.
- [时间校正][67] 是逐渐进行的，因此时间的完全同步可能会画上几个小时。 
- [节点状态][68] 可以被记录到 [summarise/plot time offsets and errors][69]
- [RMS][70] – 均方根
- [PLL][71] – 锁相环路
- [FLL][72] – 锁频回路 
- [PPM][73] – 百万分之一，用于描述频率的变化
- [man ntpq (Gentoo 简明版本)][74]
- [man ntpq (长期维护版本)][75]
- [man ntpq (Gentoo 长期维护版本)][76]

### 另见 ###

- [ntpq – 标准 NTP 查询程序][77]
- [The Network Time Protocol (NTP) 分布][78]
- NTP 的简明[历史][79] 
- 一个更多细节的简明历史 “Mills, D.L., A brief history of NTP time: confessions of an Internet timekeeper. Submitted for publication; please do not cite or redistribute” ([pdf][80])
- [NTP RFC][81] 标准文档
- Network Time Protocol (Version 3) RFC – [txt][82], or [pdf][83]. Appendix E, The NTP Timescale and its Chronometry, p70, 包含了对过去 5000 年我们的计时系统的变化和关系的有趣解释。
- 维基百科: [Time][84] 和 [Calendar][85]
- [John Harrison and the Longitude problem][86]
- [Clock of the Long Now][87] – The 10,000 Year Clock
- John C Taylor – [Chronophage][88]
- [Orders of magnitude of time][89]
- [Greenwich Time Signal][90]

### 其他 ###

SNTP （Simple Network Time Protocol, [RFC 4330][91]，简单网络协议）基本上也是NTP，但是少了一些基于 [RFC 1305][92] 实现的 NTP 的一些不再需要的内部算法。

Win32 时间 [Windows Time Service][93]  是 SNTP 的非标准实现，没有精度的保证，并假设精度几乎有 1-2 秒的范围。（因为没有系统时间变化校正）

还有一个[PTP (IEEE 1588)][95] Precision Time Protocol（精准时间协议）。见维基百科：[Precision Time Protocol][96]。软件程序为 [PTPd][97]。虫咬的功能是这是一个 [LAN][98] 高精度主从同步系统，精度在毫秒级，使用 [International Atomic Time][99] (TAI， [monotonic][100]，无闰秒)。数据报时间戳需要在网卡中启用。支持 PTP 的网络会对数据报记录时间戳以减少交换机路由器的影响。也可以在不记录时间戳的网络中使用 PTP 但可能应为时间偏差太大而无法同步。因此使用这个需要对网络进行设置。

### 更老的时间同步协议 ###

- DTSS – DEC公司的数字时间同步服务， 被 NTP 所取代。例子： [DTSS VMS C code c2000][101]。 （哪里有关于 DTSS 的文章或文档吗？）
- [DAYTIME protocol][102]，使用 [TCP][103] 或 [UDP][104]  13 端口同步
- [ICMP Timestamp][105] 和 [ICMP Timestamp Reply][106]，使用 [ICMP][107] 协议同步
- [Time Protocol][108]，使用 TCP 或 UDP 37 号端口同步

--------------------------------------------------------------------------------

via: http://nlug.ml1.co.uk/2012/01/ntpq-p-output/831

作者：Martin L
译者：[Liao](https://github.com/liaosishere)
校对：[wxy](https://github.com/wxy)

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
