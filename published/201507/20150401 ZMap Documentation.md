互联网扫描器 ZMap 完全手册
================================================================================
1. 初识 ZMap
1. 最佳扫描习惯
1. 命令行参数
1. 附加信息
    1. TCP SYN 探测模块
    1. ICMP Echo 探测模块
    1. UDP 探测模块
    1. 配置文件
    1. 详细
    1. 结果输出
    1. 黑名单
    1. 速度限制与抽样
    1. 发送多个探测
1. ZMap 扩展
    1. 示例应用程序
    1. 编写探测和输出模块

----------

### 初识 ZMap ###

ZMap被设计用来针对整个IPv4地址空间或其中的大部分实施综合扫描的工具。ZMap是研究者手中的利器，但在运行ZMap时，请注意，您很有可能正在以每秒140万个包的速度扫描整个IPv4地址空间 。我们建议用户即使在实施小范围扫描之前，也联系一下本地网络的管理员并参考我们列举的[最佳扫描体验](#bestpractices)。

默认情况下，ZMap会对于指定端口实施尽可能大速率的TCP SYN扫描。较为保守的情况下，对10,000个随机的地址的80端口以10Mbps的速度扫描，如下所示：

    $ zmap --bandwidth=10M --target-port=80 --max-targets=10000 --output-file=results.csv 

或者更加简洁地写成：

    $ zmap -B 10M -p 80 -n 10000 -o results.csv

ZMap也可用于扫描特定子网或CIDR地址块。例如，仅扫描10.0.0.0/8和192.168.0.0/16的80端口，运行指令如下：

    zmap -p 80 -o results.csv 10.0.0.0/8 192.168.0.0/16

如果扫描进行的顺利，ZMap会每秒输出类似以下内容的状态更新：

    0% (1h51m left); send: 28777 562 Kp/s (560 Kp/s avg); recv: 1192 248 p/s (231 p/s avg); hits: 0.04%
    0% (1h51m left); send: 34320 554 Kp/s (559 Kp/s avg); recv: 1442 249 p/s (234 p/s avg); hits: 0.04%
    0% (1h50m left); send: 39676 535 Kp/s (555 Kp/s avg); recv: 1663 220 p/s (232 p/s avg); hits: 0.04%
    0% (1h50m left); send: 45372 570 Kp/s (557 Kp/s avg); recv: 1890 226 p/s (232 p/s avg); hits: 0.04%

这些更新信息提供了扫描的即时状态并表示成：

	完成进度% (剩余时间); send: 发出包的数量 即时速率 (平均发送速率); recv: 接收包的数量 接收率 (平均接收率); hits: 命中率

如果您不知道您所在网络能支持的扫描速率，您可能要尝试不同的扫描速率和带宽限制直到扫描效果开始下降，借此找出当前网络能够支持的最快速度。

默认情况下，ZMap会输出不同IP地址的列表（例如，根据SYN ACK数据包的情况），像下面这样。其[输出结果](#output)还有几种附加的格式（如，JSON和Redis），可以用作生成[程序可解析的扫描统计](#verbosity)。 同样，可以指定附加的[输出字段](#outputfields)并使用[输出过滤](#outputfilter)来过滤输出的结果。

    115.237.116.119
    23.9.117.80
    207.118.204.141
    217.120.143.111
    50.195.22.82

我们强烈建议您使用[黑名单文件](#blacklisting)，以排除预留的/未分配的IP地址空间（如，RFC1918 规定的私有地址、组播地址），以及网络中需要排除在您扫描之外的地址。默认情况下，ZMap将采用位于 `/etc/zmap/blacklist.conf`的这个简单的[黑名单文件](#blacklisting)中所包含的预留和未分配地址。如果您需要某些特定设置，比如每次运行ZMap时的最大带宽或[黑名单文件](#blacklisting)，您可以在文件`/etc/zmap/zmap.conf`中指定或使用自定义[配置文件](#config)。

如果您正试图解决扫描的相关问题，有几个选项可以帮助您调试。首先，您可以通过添加`--dryrun`实施[预扫](#dryrun)，以此来分析包可能会发送到网络的何处。此外，还可以通过设置'--verbosity=n`来更改[日志详细程度](#verbosity)。 

### 最佳扫描体验 ###
<a name="bestpractices" ></a>

我们为针对互联网进行扫描的研究者提供了一些建议，以此来引导养成良好的互联网合作氛围。

- 密切协同本地的网络管理员，以减少风险和调查
- 确认扫描不会使本地网络或上游供应商瘫痪
- 在发起扫描的源地址的网页和DNS条目中申明你的扫描是善意的
- 明确解释你的扫描中所有连接的目的和范围
- 提供一个简单的退出扫描的方法并及时响应请求
- 实施扫描时，不使用比研究对象需求更大的扫描范围或更快的扫描频率
- 如果可以，将扫描流量分布到不同的时间或源地址上

即使不声明，使用扫描的研究者也应该避免利用漏洞或访问受保护的资源，并遵守其辖区内任何特殊的法律规定。

### 命令行参数 ###
<a name="args" ></a>

#### 通用选项 ####

这些选项是实施简单扫描时最常用的选项。我们注意到某些选项取决于所使用的[探测模块](#probemodule)或[输出模块](#outputmodule)（如，在实施ICMP Echo扫描时是不需要使用目的端口的）。

**-p, --target-port=port**

要扫描的目标TCP端口号（例如，443）

**-o, --output-file=name**

将结果写入该文件，使用`-`代表输出到标准输出。

**-b, --blacklist-file=path**

文件中被排除的子网使用CIDR表示法（如192.168.0.0/16），一个一行。建议您使用此方法排除RFC 1918地址、组播地址、IANA预留空间等IANA专用地址。在conf/blacklist.example中提供了一个以此为目的示例黑名单文件。

#### 扫描选项 ####

**-n, --max-targets=n**

限制探测目标的数量。后面跟的可以是一个数字（例如'-n 1000`），或可扫描地址空间的百分比（例如，`-n 0.1％`，不包括黑名单）

**-N, --max-results=n**

收到多少结果后退出

**-t, --max-runtime=secs**

限制发送报文的时间

**-r, --rate=pps**

设置发包速率，以包/秒为单位

**-B, --bandwidth=bps**

以比特/秒设置传输速率（支持使用后缀G，M或K（如`-B 10M`就是速度10 mbps）的。设置会覆盖`--rate`。

**-c, --cooldown-time=secs**

发送完成后等待多久继续接收回包（默认值= 8）

**-e, --seed=n**

地址排序种子。如果要用多个ZMap以相同的顺序扫描地址，那么就可以使用这个参数。

**--shards=n**

将扫描分片/区，使其可多个ZMap中执行（默认值= 1）。启用分片时，`--seed`参数是必需的。

**--shard=n**

选择扫描的分片（默认值= 0）。n的范围在[0，N)，其中N为碎片的总数。启用分片时，`--seed`参数是必需的。

**-T, --sender-threads=n**

用于发送数据包的线程数（默认值= 1）

**-P, --probes=n**

发送到每个IP的探测数（默认值= 1）

**-d, --dryrun**

用标准输出打印出每个包，而不是将其发送（用于调试）

#### 网络选项 ####

**-s, --source-port=port|range**

发送数据包的源端口

**-S, --source-ip=ip|range**

发送数据包的源地址。可以仅仅是一个IP，也可以是一个范围（如，10.0.0.1-10.0.0.9）

**-G, --gateway-mac=addr**

数据包发送到的网关MAC地址（用以防止自动检测不工作的情况）

**-i, --interface=name**

使用的网络接口

#### 探测选项 ####

ZMap允许用户指定并添加自己所需要的[探测模块](#probemodule)。 探测模块的职责就是生成要发送的探测包，并处理主机回复的响应包。

**--list-probe-modules**

列出可用探测模块（如tcp_synscan）

**-M, --probe-module=name**

选择[探测模块](#probemodule)（默认值= tcp_synscan）

**--probe-args=args**

向模块传递参数

**--list-output-fields**

列出可用的输出模块

#### 输出选项 ####

ZMap允许用户指定和编写他们自己的[输出模块](#outputmodule)。输出模块负责处理由探测模块返回的字段，并将它们输出给用户。用户可以指定输出的字段，并过滤相应字段。

**--list-output-modules**

列出可用输出模块（如tcp_synscan）

**-O, --output-module=name**

选择[输出模块](#outputmodule)（默认值为csv）

**--output-args=args**

传递给输出模块的参数

**-f, --output-fields=fields**

输出的字段列表，以逗号分割

**--output-filter**

指定输出[过滤器](#outputfilter)对[探测模块](#probemodule)定义字段进行过滤

#### 附加选项 ####

**-C, --config=filename**

加载[配置文件](#config)，可以指定其他路径。

**-q, --quiet**

不必每秒刷新输出

**-g, --summary**

在扫描结束后打印配置和结果汇总信息

**-v, --verbosity=n**

日志详细程度（0-5，默认值= 3）

**-h, --help**

打印帮助并退出

**-V, --version**

打印版本并退出

### 附加信息 ###
<a name="additional"></a>

#### TCP SYN 扫描 ####

在执行TCP SYN扫描时，ZMap需要指定一个目标端口，也支持指定发起扫描的源端口范围。

**-p, --target-port=port**

扫描的TCP端口（例如 443）

**-s, --source-port=port|range**

发送扫描数据包的源端口（例如 40000-50000）

**警示！** ZMap基于Linux内核使用RST包来应答SYN/ACK包响应，以关闭扫描器打开的连接。ZMap是在Ethernet层完成包的发送的，这样做是为了减少跟踪打开的TCP连接和路由寻路带来的内核开销。因此，如果您有跟踪连接建立的防火墙规则，如类似于`-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT`的netfilter规则，将阻止SYN/ACK包到达内核。这不会妨碍到ZMap记录应答，但它会阻止RST包被送回，最终被扫描主机的连接会一直打开，直到超时后断开。我们强烈建议您在执行ZMap时，选择一组主机上未使用且防火墙允许访问的端口，加在`-s`后（如 `-s '50000-60000' ` ）。

#### ICMP Echo 请求扫描 ####

虽然在默认情况下ZMap执行的是TCP SYN扫描，但它也支持使用ICMP echo请求扫描。在这种扫描方式下ICMP echo请求包被发送到每个主机，并以收到ICMP应答包作为答复。实施ICMP扫描可以通过选择icmp_echoscan扫描模块来执行，如下：

    $ zmap --probe-module=icmp_echoscan

#### UDP 数据报扫描 ####

ZMap还额外支持UDP探测，它会发出任意UDP数据报给每个主机，并接收UDP或ICMP不可达的应答。ZMap可以通过使用--probe-args命令行选项来设置四种不同的UDP载荷。这些是：可在命令行设置可打印的ASCII 码的‘text’载荷和十六进制载荷的‘hex’，外部文件中包含载荷的‘file’，和通过动态字段生成的载荷的‘template’。为了得到UDP响应，请使用-f参数确保您指定的“data”字段处于输出范围。

下面的例子将发送两个字节'ST'，即PCAnwywhere的'status'请求，到UDP端口5632。

    $ zmap -M udp -p 5632 --probe-args=text:ST -N 100 -f saddr,data -o -

下面的例子将发送字节“0X02”，即SQL Server的'client broadcast'请求，到UDP端口1434。

    $ zmap -M udp -p 1434 --probe-args=hex:02 -N 100 -f saddr,data -o -

下面的例子将发送一个NetBIOS状态请求到UDP端口137。使用一个ZMap自带的载荷文件。

    $ zmap -M udp -p 1434 --probe-args=file:netbios_137.pkt -N 100 -f saddr,data -o -

下面的例子将发送SIP的'OPTIONS'请求到UDP端口5060。使用附ZMap自带的模板文件。

    $ zmap -M udp -p 1434 --probe-args=file:sip_options.tpl -N 100 -f saddr,data -o -

UDP载荷模板仍处于实验阶段。当您在更多的使用一个以上的发送线程（-T）时可能会遇到崩溃和一个明显的相比静态载荷性能降低的表现。模板仅仅是一个由一个或多个使用${}将字段说明封装成序列构成的载荷文件。某些协议，特别是SIP，需要载荷来反射包中的源和目的包。其他协议，如portmapper和DNS，每个请求包含的字段应该是随机的，或降低被Zamp扫描的多宿主系统的风险。

以下的载荷模板将发送SIP OPTIONS请求到每一个目的地：

    OPTIONS sip:${RAND_ALPHA=8}@${DADDR} SIP/2.0
    Via: SIP/2.0/UDP ${SADDR}:${SPORT};branch=${RAND_ALPHA=6}.${RAND_DIGIT=10};rport;alias
    From: sip:${RAND_ALPHA=8}@${SADDR}:${SPORT};tag=${RAND_DIGIT=8}
    To: sip:${RAND_ALPHA=8}@${DADDR}
    Call-ID: ${RAND_DIGIT=10}@${SADDR}
    CSeq: 1 OPTIONS
    Contact: sip:${RAND_ALPHA=8}@${SADDR}:${SPORT}
    Content-Length: 0
    Max-Forwards: 20
    User-Agent: ${RAND_ALPHA=8}
    Accept: text/plain

就像在上面的例子中展示的那样，注意每行行末以\r\n结尾，请求以\r\n\r\n结尾，大多数SIP实现都可以正确处理它。一个可以工作的例子放在ZMap的examples/udp-payloads目录下 (sip_options.tpl).

当前实现了下面的模板字段：

- **SADDR**: 源IP地址的点分十进制格式
- **SADDR_N**: 源IP地址的网络字节序格式
- **DADDR**: 目的IP地址的点分十进制格式
- **DADDR_N**: 目的IP地址的网络字节序格式
- **SPORT**: 源端口的ascii格式
- **SPORT_N**: 源端口的网络字节序格式
- **DPORT**: 目的端口的ascii格式
- **DPORT_N**: 目的端口的网络字节序格式
- **RAND_BYTE**: 随机字节(0-255)，长度由=(length) 参数决定
- **RAND_DIGIT**: 随机数字0-9，长度由=(length) 参数决定
- **RAND_ALPHA**: 随机大写字母A-Z，长度由=(length) 参数决定
- **RAND_ALPHANUM**: 随机大写字母A-Z和随机数字0-9，长度由=(length) 参数决定

### 配置文件 ###
<a name="config"></a>

ZMap支持使用配置文件来代替在命令行上指定所有要求的选项。配置中可以通过每行指定一个长名称的选项和对应的值来创建：

    interface "eth1"
    source-ip 1.1.1.4-1.1.1.8
    gateway-mac b4:23:f9:28:fa:2d # upstream gateway
    cooldown-time 300 # seconds
    blacklist-file /etc/zmap/blacklist.conf
    output-file ~/zmap-output
    quiet
    summary

然后ZMap就可以按照配置文件并指定一些必要的附加参数运行了：

    $ zmap --config=~/.zmap.conf --target-port=443

### 详细 ###
<a name="verbosity" ></a>

ZMap可以在屏幕上生成多种类型的输出。默认情况下，Zmap将每隔1秒打印出相似的基本进度信息。可以通过设置`--quiet`来禁用。

    0:01 12%; send: 10000 done (15.1 Kp/s avg); recv: 144 143 p/s (141 p/s avg); hits: 1.44%

ZMap同样也可以根据扫描配置打印如下消息，可以通过'--verbosity`参数加以控制。

    Aug 11 16:16:12.813 [INFO] zmap: started
    Aug 11 16:16:12.817 [DEBUG] zmap: no interface provided. will use eth0
    Aug 11 16:17:03.971 [DEBUG] cyclic: primitive root: 3489180582
    Aug 11 16:17:03.971 [DEBUG] cyclic: starting point: 46588
    Aug 11 16:17:03.975 [DEBUG] blacklist: 3717595507 addresses allowed to be scanned
    Aug 11 16:17:03.975 [DEBUG] send: will send from 1 address on 28233 source ports
    Aug 11 16:17:03.975 [DEBUG] send: using bandwidth 10000000 bits/s, rate set to 14880 pkt/s
    Aug 11 16:17:03.985 [DEBUG] recv: thread started

ZMap还支持在扫描之后打印出一个的可grep的汇总信息，类似于下面这样，可以通过调用`--summary`来实现。

    cnf	target-port				443
    cnf	source-port-range-begin			32768
    cnf	source-port-range-end			61000
    cnf	source-addr-range-begin			1.1.1.4
    cnf	source-addr-range-end			1.1.1.8
    cnf	maximum-packets				4294967295
    cnf	maximum-runtime				0
    cnf	permutation-seed			0
    cnf	cooldown-period				300
    cnf	send-interface				eth1
    cnf	rate					45000
    env	nprocessors				16
    exc	send-start-time				Fri Jan 18 01:47:35 2013
    exc	send-end-time				Sat Jan 19 00:47:07 2013
    exc	recv-start-time				Fri Jan 18 01:47:35 2013
    exc	recv-end-time				Sat Jan 19 00:52:07 2013
    exc	sent					3722335150
    exc	blacklisted				572632145
    exc	first-scanned				1318129262
    exc	hit-rate				0.874102
    exc	synack-received-unique			32537000
    exc	synack-received-total			36689941
    exc	synack-cooldown-received-unique		193
    exc	synack-cooldown-received-total		1543
    exc	rst-received-unique			141901021
    exc	rst-received-total			166779002
    adv	source-port-secret			37952
    adv	permutation-gen				4215763218

### 结果输出 ###
<a name="output" />

ZMap可以通过**输出模块**生成不同格式的结果。默认情况下，ZMap只支持**csv**的输出，但是可以通过编译支持**redis**和**json** 。可以使用**输出过滤**来过滤这些发送到输出模块上的结果。输出模块输出的字段由用户指定。默认情况如果没有指定输出文件，ZMap将以csv格式返回结果，而不会生成特定结果。也可以编写自己的输出模块;请参阅[编写输出模块](#exteding)。

**-o, --output-file=p**

输出写入文件地址

**-O, --output-module=p**

调用自定义输出模块

**-f, --output-fields=p**

以逗号分隔的输出的字段列表

**--output-filter=filter**

对给定的探测指定字段输出过滤

**--list-output-modules**

列出可用输出模块

**--list-output-fields**

列出给定的探测的可用输出字段

#### 输出字段 ####

除了IP地址之外，ZMap有很多字段。这些字段可以通过在给定探测模块上运行`--list-output-fields`来查看。

    $ zmap --probe-module="tcp_synscan" --list-output-fields
    saddr           string: 应答包中的源IP地址
    saddr-raw          int: 网络字节格式的源IP地址
    daddr           string: 应答包中的目的IP地址
    daddr-raw          int: 网络字节格式的目的IP地址
    ipid               int: 应答包中的IP识别号
    ttl                int: 应答包中的ttl（存活时间）值
    sport              int: TCP 源端口
    dport              int: TCP 目的端口
    seqnum             int: TCP 序列号
    acknum             int: TCP Ack号
    window             int: TCP 窗口
    classification  string: 包类型
    success            int: 是应答包成功
    repeat             int: 是否是来自主机的重复响应
    cooldown           int: 是否是在冷却时间内收到的响应
    timestamp-str   string: 响应抵达时的时间戳使用ISO8601格式
    timestamp-ts       int: 响应抵达时的时间戳使用UNIX纪元开始的秒数
    timestamp-us       int: 时间戳的微秒部分(例如 从'timestamp-ts'的几微秒)

可以通过使用`--output-fields=fields`或`-f`来选择选择输出字段，任意组合的输出字段可以被指定为逗号分隔的列表。例如：

    $ zmap -p 80 -f "response,saddr,daddr,sport,seq,ack,in_cooldown,is_repeat,timestamp" -o output.csv

#### 过滤输出 ####

在传到输出模块之前，探测模块生成的结果可以先过滤。过滤是针对探测模块的输出字段的。过滤使用类似于SQL的简单过滤语法写成，通过ZMap的**--output-filter**选项来指定。输出过滤通常用于过滤掉重复的结果，或仅传输成功的响应到输出模块。

过滤表达式的形式为`<字段名> <操作符> <值>`。`<值>`的类型必须是一个字符串或一串无符号整数并且匹配`<字段名>`类型。对于整数比较有效的操作符是`= !=, <, >, <=, >=`。字符串比较的操作是=，!=。`--list-output-fields`可以打印那些可供探测模块选择的字段和类型，然后退出。

复合型的过滤操作，可以通过使用`&&`（逻辑与）和`||`（逻辑或）这样的运算符来组合出特殊的过滤操作。

**示例**

书写一则过滤仅显示成功的、不重复的应答

    --output-filter="success = 1 && repeat = 0"

过滤出RST分类并且TTL大于10的包，或者SYNACK分类的包

    --output-filter="(classification = rst && ttl > 10) || classification = synack"

#### CSV ####

csv模块将会生成以逗号分隔各个要求输出的字段的文件。例如，以下的指令将生成名为`output.csv`的CSV文件。

    $ zmap -p 80 -f "response,saddr,daddr,sport,seq,ack,in_cooldown,is_repeat,timestamp" -o output.csv

----------

    #响应, 源地址, 目的地址, 源端口, 目的端口, 序列号, 应答, 是否是冷却模式, 是否重复, 时间戳
    response, saddr, daddr, sport, dport, seq, ack, in_cooldown, is_repeat, timestamp
    synack, 159.174.153.144, 10.0.0.9, 80, 40555, 3050964427, 3515084203, 0, 0,2013-08-15 18:55:47.681
    rst, 141.209.175.1, 10.0.0.9, 80, 40136, 0, 3272553764, 0, 0,2013-08-15 18:55:47.683
    rst, 72.36.213.231, 10.0.0.9, 80, 56642, 0, 2037447916, 0, 0,2013-08-15 18:55:47.691
    rst, 148.8.49.150, 10.0.0.9, 80, 41672, 0, 1135824975, 0, 0,2013-08-15 18:55:47.692
    rst, 50.165.166.206, 10.0.0.9, 80, 38858, 0, 535206863, 0, 0,2013-08-15 18:55:47.694
    rst, 65.55.203.135, 10.0.0.9, 80, 50008, 0, 4071709905, 0, 0,2013-08-15 18:55:47.700
    synack, 50.57.166.186, 10.0.0.9, 80, 60650, 2813653162, 993314545, 0, 0,2013-08-15 18:55:47.704
    synack, 152.75.208.114, 10.0.0.9, 80, 52498, 460383682, 4040786862, 0, 0,2013-08-15 18:55:47.707
    synack, 23.72.138.74, 10.0.0.9, 80, 33480, 810393698, 486476355, 0, 0,2013-08-15 18:55:47.710

#### Redis ####

Redis的输出模块允许地址被添加到一个Redis的队列，而不是保存到文件，允许ZMap将它与之后的处理工具结合使用。

**注意!** ZMap默认不会编译Redis功能。如果你从源码构建ZMap，可以在CMake的时候加上`-DWITH_REDIS=ON`来增加Redis支持。

#### JSON ####

JSON输出模块用起来类似于CSV模块，只是以JSON格式写入到文件。JSON文件能轻松地导入到其它可以读取JSON的程序中。

**注意！**，ZMap默认不会编译JSON功能。如果你从源码构建ZMap，可以在CMake的时候加上`-DWITH_JSON=ON`来增加JSON支持。

### 黑名单和白名单 ###
<a name="blacklisting"></a>

ZMap同时支持对网络前缀做黑名单和白名单。如果ZMap不加黑名单和白名单参数，他将会扫描所有的IPv4地址（包括本地的，保留的以及组播地址）。如果指定了黑名单文件，那么在黑名单中的网络前缀将不再扫描；如果指定了白名单文件，只有那些网络前缀在白名单内的才会扫描。白名单和黑名单文件可以协同使用；黑名单优先于白名单（例如：如果您在白名单中指定了10.0.0.0/8并在黑名单中指定了10.1.0.0/16，那么10.1.0.0/16将不会扫描）。白名单和黑名单文件可以在命令行中指定，如下所示：

**-b, --blacklist-file=path**

文件用于记录黑名单子网，以CIDR（无类域间路由）的表示法，例如192.168.0.0/16

**-w, --whitelist-file=path**

文件用于记录限制扫描的子网，以CIDR的表示法，例如192.168.0.0/16

黑名单文件的每行都需要以CIDR的表示格式书写，一行单一的网络前缀。允许使用`#`加以备注。例如：

    # IANA（英特网编号管理局）记录的用于特殊目的的IPv4地址
    # http://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml
    # 更新于2013-05-22
    
    0.0.0.0/8           # RFC1122: 网络中的所有主机
    10.0.0.0/8          # RFC1918: 私有地址
    100.64.0.0/10       # RFC6598: 共享地址空间
    127.0.0.0/8         # RFC1122: 回环地址
    169.254.0.0/16      # RFC3927: 本地链路地址
    172.16.0.0/12       # RFC1918: 私有地址
    192.0.0.0/24        # RFC6890: IETF协议预留
    192.0.2.0/24        # RFC5737: 测试地址1
    192.88.99.0/24      # RFC3068: IPv6转换到IPv4的任播
    192.168.0.0/16      # RFC1918: 私有地址
    192.18.0.0/15       # RFC2544: 检测地址
    198.51.100.0/24     # RFC5737: 测试地址2
    203.0.113.0/24      # RFC5737: 测试地址3
    240.0.0.0/4         # RFC1112: 预留地址
    255.255.255.255/32  # RFC0919: 限制广播地址
    
    # IANA记录的用于组播的地址空间
    # http://www.iana.org/assignments/multicast-addresses/multicast-addresses.xhtml
    # 更新于2013-06-25
    
    224.0.0.0/4         # RFC5771: 组播/预留地址ed

如果您只是想扫描因特网中随机的一部分地址，使用[抽样](#ratelimiting)检出，来代替使用白名单和黑名单。

**注意！**ZMap默认设置使用`/etc/zmap/blacklist.conf`作为黑名单文件，其中包含有本地的地址空间和预留的IP空间。通过编辑`/etc/zmap/zmap.conf`可以改变默认的配置。

### 速度限制与抽样 ###
<a name="ratelimiting"></a>

默认情况下，ZMap将以您当前网卡所能支持的最快速度扫描。以我们对于常用硬件的经验，这通常是理论上Gbit以太网速度的95-98%，这可能比您的上游提供商可处理的速度还要快。ZMap是不会自动的根据您的上游提供商来调整发送速率的。您可能需要手动的调整发送速率来减少丢包和错误结果。

**-r, --rate=pps**

设置最大发送速率以包/秒为单位

**-B, --bandwidth=bps**

设置发送速率以比特/秒(支持G,M和K后缀)。这会覆盖--rate参数。 

ZMap同样支持对IPv4地址空间进行指定最大目标数和/或最长运行时间的随机采样。由于每次对主机的扫描是通过随机排序生成的，限制扫描的主机个数为N就会随机抽选N个主机。命令选项如下：

**-n, --max-targets=n**

探测目标上限数量

**-N, --max-results=n**

结果上限数量（累积收到这么多结果后退出）

**-t, --max-runtime=s**

发送数据包时间长度上限（以秒为单位）

**-s, --seed=n**

种子用以选择地址的排列方式。使用不同ZMap执行扫描操作时将种子设成相同的值可以保证相同的扫描顺序。

举个例子，如果您想要多次扫描同样的一百万个互联网主机，您可以设定排序种子和扫描主机的上限数量，大致如下所示：

    zmap -p 443 -s 3 -n 1000000 -o results

为了确定哪一百万主机将要被扫描，您可以执行预扫，只打印数据包而非发送，并非真的实施扫描。

    zmap -p 443 -s 3 -n 1000000 --dryrun | grep daddr
    	| awk -F'daddr: ' '{print $2}' | sed 's/ |.*//;' 

### 发送多个数据包 ###

ZMap支持向每个主机发送多个探测。增加这个数量既增加了扫描时间又增加了到达的主机数量。然而，我们发现，增加的扫描时间（每个额外扫描的增加近100％）远远大于到达的主机数量（每个额外扫描的增加近1％）。

**-P, --probes=n**

向每个IP发出的独立探测个数（默认值=1）

### 示例应用 ###

ZMap专为向大量主机发起连接并寻找那些正确响应而设计。然而，我们意识到许多用户需要执行一些后续处理，如执行应用程序级别的握手。例如，用户在80端口实施TCP SYN扫描也许想要实施一个简单的GET请求，还有用户扫描443端口可能希望完成TLS握手。

#### Banner获取 ####

我们收录了一个示例程序，banner-grab，伴随ZMap使用可以让用户从监听状态的TCP服务器上接收到消息。Banner-grab连接到提供的服务器上，发送一个可选的消息，然后打印出收到的第一个消息。这个工具可以用来获取banner，例如HTTP服务的回复的具体指令，telnet登陆提示，或SSH服务的字符串。

下面的例子寻找了1000个监听80端口的服务器，并向每个发送一个简单的GET请求，存储他们的64位编码响应至http-banners.out

    $ zmap -p 80 -N 1000 -B 10M -o - | ./banner-grab-tcp -p 80 -c 500 -d ./http-req > out

如果想知道更多使用`banner-grab`的细节,可以参考`examples/banner-grab`中的README文件。

**注意！** ZMap和banner-grab（如例子中）同时运行可能会比较显著的影响对方的表现和精度。确保不让ZMap占满banner-grab-tcp的并发连接，不然banner-grab将会落后于标准输入的读入，导致阻塞ZMap的输出写入。我们推荐使用较慢扫描速率的ZMap，同时提升banner-grab-tcp的并发性至3000以内（注意 并发连接>1000需要您使用`ulimit -SHn 100000`和`ulimit -HHn 100000`来增加每个进程的最大文件描述符数量）。当然，这些参数取决于您服务器的性能、连接成功率（hit-rate）；我们鼓励开发者在运行大型扫描之前先进行小样本的试验。

#### 建立套接字 ####

我们也收录了另一种形式的banner-grab，就是forge-socket， 重复利用服务器发出的SYN-ACK，连接并最终取得banner。在`banner-grab-tcp`中，ZMap向每个服务器发送一个SYN，并监听服务器发回的带有SYN+ACK的应答。运行ZMap主机的内核接受应答后发送RST，这样就没有与该包关联活动连接。程序banner-grab必须在这之后创建一个新的TCP连接到从服务器获取数据。

在forge-socket中，我们利用内核中同名的模块，使我们可以创建任意参数的TCP连接。可以通过抑制内核的RST包，并重用SYN+ACK的参数取代该包而创建套接字，通过这个套接字收发数据和我们平时使用的连接套接字并没有什么不同。

要使用forge-socket，您需要forge-socket内核模块，从[github][1]上可以获得。您需要`git clone git@github.com:ewust/forge_socket.git`至ZMap源码根目录，然后cd进入forge_socket目录，运行make。以root身份运行`insmod forge_socket.ko` 来安装该内核模块。

您也需要告知内核不要发送RST包。一个简单的在全系统禁用RST包的方法是使用**iptables**。以root身份运行`iptables -A OUTPUT -p tcp -m tcp --tcp-flgas RST,RST RST,RST -j DROP`即可，当然您也可以加上一项`--dport X`将禁用局限于所扫描的端口（X）上。扫描完成后移除这项设置，以root身份运行`iptables -D OUTPUT -p tcp -m tcp --tcp-flags RST,RST RST,RST -j DROP`即可。

现在应该可以建立forge-socket的ZMap示例程序了。运行需要使用**extended_file**ZMap[输出模块](#outputmodule)：

    $ zmap -p 80 -N 1000 -B 10M -O extended_file -o - | \
        ./forge-socket -c 500 -d ./http-req > ./http-banners.out

详细内容可以参考`examples/forge-socket`目录下的README。

----------

### 编写探测和输出模块 ###
<a name="extending"></a>

ZMap可以通过**探测模块**来扩展支持不同类型的扫描，通过**输出模块**增加不同类型的输出结果。注册过的探测和输出模块可以在命令行中列出：

**--list-probe-modules**

列出安装过的探测模块

**--list-output-modules**

列出安装过的输出模块

#### 输出模块 ####
<a name="outputmodule"></a>

ZMap的输出和输出后处理可以通过实现和注册扫描器的**输出模块**来扩展。输出模块在接收每一个应答包时都会收到一个回调。然而默认提供的模块仅提供简单的输出，这些模块同样支持更多的输出后处理（例如：重复跟踪或输出AS号码来代替IP地址）。

通过定义一个新的output_module结构来创建输出模块，并在[output_modules.c][2]中注册：

    typedef struct output_module {
        const char          *name;           // 在命令行如何引用输出模块
        unsigned            update_interval; // 以秒为单位的更新间隔
    	
        output_init_cb      init;            // 在扫描器初始化的时候调用
        output_update_cb    start;           // 在扫描器开始的时候调用
        output_update_cb    update;          // 每次更新间隔调用，秒为单位
        output_update_cb    close;           // 扫描终止后调用
    	
        output_packet_cb    process_ip;      // 接收到应答时调用
    
        const char          *helptext;       // 会在--list-output-modules时打印在屏幕上
      
    } output_module_t;

输出模块必须有名称，通过名称可以在命令行调用，并且通常会实现`success_ip`和常见的`other_ip`回调。process_ip的回调由每个收到并经由**probe module**过滤的应答包调用。应答是否被认定为成功并不确定（比如，它可以是一个TCP的RST）。这些回调必须定义匹配`output_packet_cb`定义的函数:

    int (*output_packet_cb) (
    
        ipaddr_n_t    saddr,         // 网络字节格式的发起扫描主机IP地址
        ipaddr_n_t    daddr,         // 网络字节格式的目的IP地址
        
        const char*   response_type, // 发送模块的数据包分类
        
        int           is_repeat,     // {0: 主机的第一个应答, 1: 后续的应答}
        int           in_cooldown,   // {0: 非冷却状态, 1: 扫描器处于冷却中}
        
        const u_char* packet,        // 指向IP包的iphdr结构体的指针
        size_t        packet_len     // 包的长度，以字节为单位
    );

输出模块还可以通过注册回调，执行在扫描初始化的时候（诸如打开输出文件的任务）、在扫描开始阶段（诸如记录黑名单的任务）、在扫描的常规间隔（诸如状态更新的任务）、在关闭的时候（诸如关掉所有打开的文件描述符）。提供的这些回调可以完整的访问扫描配置和当前状态：

    int (*output_update_cb)(struct state_conf*, struct state_send*, struct state_recv*);

这些定义在[output_modules.h][3]中。在[src/output_modules/module_csv.c][4]中有可用示例。

#### 探测模块 ####
<a name="probemodule"></a>

数据包由**探测模块**构造，它可以创建各种包和不同类型的响应。ZMap默认拥有两个扫描模块：`tcp_synscan`和`icmp_echoscan`。默认情况下，ZMap使用`tcp_synscan`来发送TCP SYN包并对每个主机的响应分类，如打开时（收到SYN+ACK）或关闭时（收到RST）。ZMap允许开发者编写自己的ZMap探测模块，使用如下的API：

任何类型的扫描都必须通过开发和注册`send_module_t`结构中的回调来实现：

    typedef struct probe_module {
        const char               *name;             // 如何在命令行调用扫描
        size_t                   packet_length;     // 探测包有多长(必须是静态的)
        
        const char               *pcap_filter;      // 对收到的响应实施PCAP过滤
        size_t                   pcap_snaplen;      // libpcap 捕获的最大字节数 
        uint8_t                  port_args;         // 设为1，如果ZMap需要用户指定--target-port
        
        probe_global_init_cb     global_initialize; // 在扫描初始化会时被调用一次
        probe_thread_init_cb     thread_initialize; // 每个包缓存区的线程中被调用一次
        probe_make_packet_cb     make_packet;       // 每个主机更新包的时候被调用一次
        probe_validate_packet_cb validate_packet;   // 每收到一个包被调用一次，
                                                    // 如果包无效返回0，
                                                    // 非零则有效。
        
        probe_print_packet_cb    print_packet;      // 如果在预扫模式下被每个包都调用
        probe_classify_packet_cb process_packet;    // 由区分响应的接收器调用
        probe_close_cb           close;             // 扫描终止后被调用
    
        fielddef_t               *fields            // 该模块指定的字段的定义
        int                      numfields          // 字段的数量
        
    } probe_module_t;

在扫描操作初始化时会调用一次`global_initialize`，可以用来实施一些必要的全局配置和初始化操作。然而，`global_initialize`并不能访问包缓冲区，那里是线程特定的。代替的，`thread_initialize`在每个发送线程初始化的时候被调用，提供对于缓冲区的访问，可以用来构建探测包和全局的源和目的值。此回调应用于构建主机不可知的包结构，甚至只有特定值（如：目的主机和校验和），需要随着每个主机更新。例如，以太网头部信息在交换时不会变更（减去校验和是由NIC硬件计算的）因此可以事先定义以减少扫描时间开销。

调用回调参数`make_packet`是为了让被扫描的主机允许**探测模块**更新主机指定的值，同时提供IP地址、一个非透明的验证字符串和探测数目（如下所示）。探测模块负责在探测中放置尽可能多的验证字符串，即便当服务器返回的应答为空时，探测模块也能验证它的当前状态。例如，针对TCP SYN扫描，tcp_synscan探测模块会使用TCP源端口和序列号的格式存储验证字符串。响应包（SYN+ACK）将包含目的端口和确认号的预期值。

    int make_packet(
        void        *packetbuf,  // 包的缓冲区
        ipaddr_n_t  src_ip,      // 网络字节格式源IP
        ipaddr_n_t	dst_ip,      // 网络字节格式目的IP
        uint32_t    *validation, // 探测中的有效字符串
        int         probe_num    // 如果向每个主机发送多重探测，
                                 // 该值为我们对于该主机
                                 // 正在发送的探测数目
    );

扫描模块也应该定义`pcap_filter`、`validate_packet`和`process_packet`。只有符合PCAP过滤器的包才会被扫描。举个例子，在一个TCP SYN扫描的情况下，我们只想要调查TCP SYN / ACK或RST TCP数据包，并利用类似`tcp && tcp[13] & 4 != 0 || tcp[13] == 18`的过滤方法。`validate_packet`函数将会被每个满足PCAP过滤条件的包调用。如果验证返回的值非零，将会调用`process_packet`函数，并使用`fields`定义的字段和包中的数据填充字段集。举个例子，如下代码为TCP synscan探测模块处理了一个数据包。

    void synscan_process_packet(const u_char *packet, uint32_t len, fieldset_t *fs)
    {
        struct iphdr *ip_hdr = (struct iphdr *)&packet[sizeof(struct ethhdr)];
        struct tcphdr *tcp = (struct tcphdr*)((char *)ip_hdr 
                + (sizeof(struct iphdr)));
    
        fs_add_uint64(fs, "sport", (uint64_t) ntohs(tcp->source)); 
        fs_add_uint64(fs, "dport", (uint64_t) ntohs(tcp->dest));
        fs_add_uint64(fs, "seqnum", (uint64_t) ntohl(tcp->seq));
        fs_add_uint64(fs, "acknum", (uint64_t) ntohl(tcp->ack_seq));
        fs_add_uint64(fs, "window", (uint64_t) ntohs(tcp->window));
    
        if (tcp->rst) { // RST packet
            fs_add_string(fs, "classification", (char*) "rst", 0);
            fs_add_uint64(fs, "success", 0);
        } else { // SYNACK packet
            fs_add_string(fs, "classification", (char*) "synack", 0);
            fs_add_uint64(fs, "success", 1);
        }
    }

--------------------------------------------------------------------------------

via: https://zmap.io/documentation.html

译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/ewust/forge_socket/
[2]:https://github.com/zmap/zmap/blob/v1.0.0/src/output_modules/output_modules.c
[3]:https://github.com/zmap/zmap/blob/master/src/output_modules/output_modules.h
[4]:https://github.com/zmap/zmap/blob/master/src/output_modules/module_csv.c
