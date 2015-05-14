ZMap Documentation
================================================================================
1. Getting Started with ZMap
1. Scanning Best Practices
1. Command Line Arguments
1. Additional Information
    1. TCP SYN Probe Module
    1. ICMP Echo Probe Module
    1. UDP Probe Module
    1. Configuration Files
    1. Verbosity
    1. Results Output
    1. Blacklisting
    1. Rate Limiting and Sampling
    1. Sending Multiple Probes
1. Extending ZMap
    1. Sample Applications
    1. Writing Probe and Output Modules

----------

### Getting Started with ZMap ###

ZMap is designed to perform comprehensive scans of the IPv4 address space or large portions of it. While ZMap is a powerful tool for researchers, please keep in mind that by running ZMap, you are potentially scanning the ENTIRE IPv4 address space at over 1.4 million packets per second. Before performing even small scans, we encourage users to contact their local network administrators and consult our list of scanning best practices.

By default, ZMap will perform a TCP SYN scan on the specified port at the maximum rate possible. A more conservative configuration that will scan 10,000 random addresses on port 80 at a maximum 10 Mbps can be run as follows:

    $ zmap --bandwidth=10M --target-port=80 --max-targets=10000 --output-file=results.csv 

Or more concisely specified as:

    $ zmap -B 10M -p 80 -n 10000 -o results.csv

ZMap can also be used to scan specific subnets or CIDR blocks. For example, to scan only 10.0.0.0/8 and 192.168.0.0/16 on port 80, run:

    zmap -p 80 -o results.csv 10.0.0.0/8 192.168.0.0/16

If the scan started successfully, ZMap will output status updates every one second similar to the following:

    0% (1h51m left); send: 28777 562 Kp/s (560 Kp/s avg); recv: 1192 248 p/s (231 p/s avg); hits: 0.04%
    0% (1h51m left); send: 34320 554 Kp/s (559 Kp/s avg); recv: 1442 249 p/s (234 p/s avg); hits: 0.04%
    0% (1h50m left); send: 39676 535 Kp/s (555 Kp/s avg); recv: 1663 220 p/s (232 p/s avg); hits: 0.04%
    0% (1h50m left); send: 45372 570 Kp/s (557 Kp/s avg); recv: 1890 226 p/s (232 p/s avg); hits: 0.04%

These updates provide information about the current state of the scan and are of the following form: %-complete (est time remaining); packets-sent curr-send-rate (avg-send-rate); recv: packets-recv recv-rate (avg-recv-rate); hits: hit-rate

If you do not know the scan rate that your network can support, you may want to experiment with different scan rates or bandwidth limits to find the fastest rate that your network can support before you see decreased results.

By default, ZMap will output the list of distinct IP addresses that responded successfully (e.g. with a SYN ACK packet) similar to the following. There are several additional formats (e.g. JSON and Redis) for outputting results as well as options for producing programmatically parsable scan statistics. As wells, additional output fields can be specified and the results can be filtered using an output filter.

    115.237.116.119
    23.9.117.80
    207.118.204.141
    217.120.143.111
    50.195.22.82

We strongly encourage you to use a blacklist file, to exclude both reserved/unallocated IP space (e.g. multicast, RFC1918), as well as networks that request to be excluded from your scans. By default, ZMap will utilize a simple blacklist file containing reserved and unallocated addresses located at `/etc/zmap/blacklist.conf`. If you find yourself specifying certain settings, such as your maximum bandwidth or blacklist file every time you run ZMap, you can specify these in `/etc/zmap/zmap.conf` or use a custom configuration file.

If you are attempting to troubleshoot scan related issues, there are several options to help debug. First, it is possible can perform a dry run scan in order to see the packets that would be sent over the network by adding the `--dryrun` flag. As well, it is possible to change the logging verbosity by setting the `--verbosity=n` flag. 

----------

### Scanning Best Practices ###

We offer these suggestions for researchers conducting Internet-wide scans as guidelines for good Internet citizenship.

- Coordinate closely with local network administrators to reduce risks and handle inquiries
- Verify that scans will not overwhelm the local network or upstream provider
- Signal the benign nature of the scans in web pages and DNS entries of the source addresses
- Clearly explain the purpose and scope of the scans in all communications
- Provide a simple means of opting out and honor requests promptly
- Conduct scans no larger or more frequent than is necessary for research objectives
- Spread scan traffic over time or source addresses when feasible

It should go without saying that scan researchers should refrain from exploiting vulnerabilities or accessing protected resources, and should comply with any special legal requirements in their jurisdictions.

----------

### Command Line Arguments ###

#### Common Options ####

These options are the most common options when performing a simple scan. We note that some options are dependent on the probe module or output module used (e.g. target port is not used when performing an ICMP Echo Scan). 


**-p, --target-port=port**

TCP port number to scan (e.g. 443)

**-o, --output-file=name**

Write results to this file. Use - for stdout

**-b, --blacklist-file=path**

File of subnets to exclude, in CIDR notation (e.g. 192.168.0.0/16), one-per line. It is recommended you use this to exclude RFC 1918 addresses, multicast, IANA reserved space, and other IANA special-purpose addresses. An example blacklist file is provided in conf/blacklist.example for this purpose. 

#### Scan Options ####

**-n, --max-targets=n**

Cap the number of targets to probe. This can either be a number (e.g. `-n 1000`) or a percentage (e.g. `-n 0.1%`) of the scannable address space (after excluding blacklist)

**-N, --max-results=n**

Exit after receiving this many results

**-t, --max-runtime=secs**

Cap the length of time for sending packets

**-r, --rate=pps**

Set the send rate in packets/sec

**-B, --bandwidth=bps**

Set the send rate in bits/second (supports suffixes G, M, and K (e.g. `-B 10M` for 10 mbps). This overrides the `--rate` flag.

**-c, --cooldown-time=secs**

How long to continue receiving after sending has completed (default=8)

**-e, --seed=n**

Seed used to select address permutation. Use this if you want to scan addresses in the same order for multiple ZMap runs.

**--shards=n**

Split the scan up into N shards/partitions among different instances of zmap (default=1). When sharding, `--seed` is required

**--shard=n**

Set which shard to scan (default=0). Shards are indexed in the range [0, N), where N is the total number of shards. When sharding `--seed` is required.

**-T, --sender-threads=n**

Threads used to send packets (default=1)

**-P, --probes=n**

Number of probes to send to each IP (default=1)

**-d, --dryrun**

Print out each packet to stdout instead of sending it (useful for debugging)

#### Network Options ####

**-s, --source-port=port|range**

Source port(s) to send packets from

**-S, --source-ip=ip|range**

Source address(es) to send packets from. Either single IP or range (e.g. 10.0.0.1-10.0.0.9)

**-G, --gateway-mac=addr**

Gateway MAC address to send packets to (in case auto-detection does not work)

**-i, --interface=name**

Network interface to use 

#### Probe Options ####

ZMap allows users to specify and write their own probe modules for use with ZMap. Probe modules are responsible for generating probe packets to send, and processing responses from hosts.

**--list-probe-modules**

List available probe modules (e.g. tcp_synscan)

**-M, --probe-module=name**

Select probe module (default=tcp_synscan)

**--probe-args=args**

Arguments to pass to probe module

**--list-output-fields**

List the fields the selected probe module can send to the output module 

#### Output Options ####

ZMap allows users to specify and write their own output modules for use with ZMap. Output modules are responsible for processing the fieldsets returned by the probe module, and outputing them to the user. Users can specify output fields, and write filters over the output fields.

**--list-output-modules**

List available output modules (e.g. tcp_synscan)

**-O, --output-module=name**

Select output module (default=csv)

**--output-args=args**

Arguments to pass to output module

**-f, --output-fields=fields**

Comma-separated list of fields to output

**--output-filter**

Specify an output filter over the fields defined by the probe module 

#### Additional Options ####

**-C, --config=filename**

Read a configuration file, which can specify any other options.

**-q, --quiet**

Do not print status updates once per second

**-g, --summary**

Print configuration and summary of results at the end of the scan 

**-v, --verbosity=n**

Level of log detail (0-5, default=3)

**-h, --help**

Print help and exit

**-V, --version**

Print version and exit 

----------

### Additional Information ###

#### TCP SYN Scans ####

When performing a TCP SYN scan, ZMap requires a single target port and supports specifying a range of source ports from which the scan will originate.

**-p, --target-port=port**

TCP port number to scan (e.g. 443)

**-s, --source-port=port|range**

Source port(s) for scan packets (e.g. 40000-50000) 

**Warning!** ZMap relies on the Linux kernel to respond to SYN/ACK packets with RST packets in order to close connections opened by the scanner. This occurs because ZMap sends packets at the Ethernet layer in order to reduce overhead otherwise incurred in the kernel from tracking open TCP connections and performing route lookups. As such, if you have a firewall rule that tracks established connections such as a netfilter rule similar to `-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT`, this will block SYN/ACK packets from reaching the kernel. This will not prevent ZMap from recording responses, but it will prevent RST packets from being sent back, ultimately using up a connection on the scanned host until your connection times out. We strongly recommend that you select a set of unused ports on your scanning host which can be allowed access in your firewall and specifying this port range when executing ZMap, with the `-s` flag (e.g. `-s '50000-60000'`). 

#### ICMP Echo Request Scans ####

While ZMap performs TCP SYN scans by default, it also supports ICMP echo request scans in which an ICMP echo request packet is sent to each host and the type of ICMP response received in reply is denoted. An ICMP scan can be performed by selecting the icmp_echoscan scan module similar to the following:

    $ zmap --probe-module=icmp_echoscan

#### UDP Datagram Scans ####

ZMap additionally supports UDP probes, where it will send out an arbitrary UDP datagram to each host, and receive either UDP or ICMP Unreachable responses. ZMap supports four different methods of setting the UDP payload through the --probe-args command-line option. These are 'text' for ASCII-printable payloads, 'hex' for hexadecimal payloads set on the command-line, 'file' for payloads contained in an external file, and 'template' for payloads that require dynamic field generation. In order to obtain the UDP response, make sure that you specify 'data' as one of the fields to report with the -f option. 

The example below will send the two bytes 'ST', a PCAnwywhere 'status' request, to UDP port 5632.

    $ zmap -M udp -p 5632 --probe-args=text:ST -N 100 -f saddr,data -o -

The example below will send the byte '0x02', a SQL Server 'client broadcast' request, to UDP port 1434.

    $ zmap -M udp -p 1434 --probe-args=hex:02 -N 100 -f saddr,data -o -

The example below will send a NetBIOS status request to UDP port 137. This uses a payload file that is included with the ZMap distribution.

    $ zmap -M udp -p 1434 --probe-args=file:netbios_137.pkt -N 100 -f saddr,data -o -

The example below will send a SIP 'OPTIONS' request to UDP port 5060. This uses a template file that is included with the ZMap distribution.

    $ zmap -M udp -p 1434 --probe-args=file:sip_options.tpl -N 100 -f saddr,data -o -

UDP payload templates are still experimental. You may encounter crashes when more using more than one send thread (-T) and there is a significant decrease in performance compared to static payloads. A template is simply a payload file that contains one or more field specifiers enclosed in a ${} sequence. Some protocols, notably SIP, require the payload to reflect the source and destination of the packet. Other protocols, such as portmapper and DNS, contain fields that should be randomized per request or risk being dropped by multi-homed systems scanned by ZMap.

The payload template below will send a SIP OPTIONS request to every destination:

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

In the example above, note that line endings are \r\n and the end of this request must contain \r\n\r\n for most SIP implementations to correcly process it. A working example is included in the examples/udp-payloads directory of the ZMap source tree (sip_options.tpl).

The following template fields are currently implemented:


- **SADDR**: Source IP address in dotted-quad format
- **SADDR_N**: Source IP address in network byte order
- **DADDR**: Destination IP address in dotted-quad format
- **DADDR_N**: Destination IP address in network byte order
- **SPORT**: Source port in ascii format
- **SPORT_N**: Source port in network byte order
- **DPORT**: Destination port in ascii format
- **DPORT_N**: Destination port in network byte order
- **RAND_BYTE**: Random bytes (0-255), length specified with =(length) parameter
- **RAND_DIGIT**: Random digits from 0-9, length specified with =(length) parameter
- **RAND_ALPHA**: Random mixed-case letters from A-Z, length specified with =(length) parameter
- **RAND_ALPHANUM**: Random mixed-case letters from A-Z and digits from 0-9, length specified with =(length) parameter

### Configuration Files ###

ZMap supports configuration files instead of requiring all options to be specified on the command-line. A configuration can be created by specifying one long-name option and the value per line such as:

    interface "eth1"
    source-ip 1.1.1.4-1.1.1.8
    gateway-mac b4:23:f9:28:fa:2d # upstream gateway
    cooldown-time 300 # seconds
    blacklist-file /etc/zmap/blacklist.conf
    output-file ~/zmap-output
    quiet
    summary

ZMap can then be run with a configuration file and specifying any additional necessary parameters:

    $ zmap --config=~/.zmap.conf --target-port=443

### Verbosity ###

There are several types of on-screen output that ZMap produces. By default, ZMap will print out basic progress information similar to the following every 1 second. This can be disabled by setting the `--quiet` flag.

    0:01 12%; send: 10000 done (15.1 Kp/s avg); recv: 144 143 p/s (141 p/s avg); hits: 1.44%

ZMap also prints out informational messages during scanner configuration such as the following, which can be controlled with the `--verbosity` argument.

    Aug 11 16:16:12.813 [INFO] zmap: started
    Aug 11 16:16:12.817 [DEBUG] zmap: no interface provided. will use eth0
    Aug 11 16:17:03.971 [DEBUG] cyclic: primitive root: 3489180582
    Aug 11 16:17:03.971 [DEBUG] cyclic: starting point: 46588
    Aug 11 16:17:03.975 [DEBUG] blacklist: 3717595507 addresses allowed to be scanned
    Aug 11 16:17:03.975 [DEBUG] send: will send from 1 address on 28233 source ports
    Aug 11 16:17:03.975 [DEBUG] send: using bandwidth 10000000 bits/s, rate set to 14880 pkt/s
    Aug 11 16:17:03.985 [DEBUG] recv: thread started

ZMap also supports printing out a grep-able summary at the end of the scan, similar to below, which can be invoked with the `--summary` flag.

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

### Results Output ###

ZMap can produce results in several formats through the use of **output modules**. By default, ZMap only supports **csv** output, however support for **redis** and **json** can be compiled in. The results sent to these output modules may be filtered using an **output filter**. The fields the output module writes are specified by the user. By default, ZMap will return results in csv format and if no output file is specified, ZMap will not produce specific results. It is also possible to write your own output module; see Writing Output Modules for information.

**-o, --output-file=p**

File to write output to

**-O, --output-module=p**

Invoke a custom output module


**-f, --output-fields=p**

Comma-separated list of fields to output

**--output-filter=filter**

Specify an output filter over fields for a given probe

**--list-output-modules**

Lists available output modules

**--list-output-fields**

List available output fields for a given probe 

#### Output Fields ####

ZMap has a variety of fields it can output beyond IP address. These fields can be viewed for a given probe module by running with the `--list-output-fields` flag.

    $ zmap --probe-module="tcp_synscan" --list-output-fields
    saddr           string: source IP address of response
    saddr-raw          int: network order integer form of source IP address
    daddr           string: destination IP address of response
    daddr-raw          int: network order integer form of destination IP address
    ipid               int: IP identification number of response
    ttl                int: time-to-live of response packet
    sport              int: TCP source port
    dport              int: TCP destination port
    seqnum             int: TCP sequence number
    acknum             int: TCP acknowledgement number
    window             int: TCP window
    classification  string: packet classification
    success            int: is response considered success
    repeat             int: is response a repeat response from host
    cooldown           int: Was response received during the cooldown period
    timestamp-str   string: timestamp of when response arrived in ISO8601 format.
    timestamp-ts       int: timestamp of when response arrived in seconds since Epoch
    timestamp-us       int: microsecond part of timestamp (e.g. microseconds since 'timestamp-ts')

To select which fields to output, any combination of the output fields can be specified as a comma-separated list using the `--output-fields=fields` or `-f` flags. Example:

    $ zmap -p 80 -f "response,saddr,daddr,sport,seq,ack,in_cooldown,is_repeat,timestamp" -o output.csv

#### Filtering Output ####

Results generated by a probe module can be filtered before being passed to the output module. Filters are defined over the output fields of a probe module. Filters are written in a simple filtering language, similar to SQL, and are passed to ZMap using the **--output-filter** option. Output filters are commonly used to filter out duplicate results, or to only pass only sucessful responses to the output module.

Filter expressions are of the form `<fieldname> <operation> <value>`. The type of `<value>` must be either a string or unsigned integer literal, and match the type of `<fieldname>`. The valid operations for integer comparisons are `= !=, <, >, <=, >=`. The operations for string comparisons are =, !=. The `--list-output-fields` flag will print what fields and types are available for the selected probe module, and then exit.

Compound filter expressions may be constructed by combining filter expressions using parenthesis to specify order of operations, the `&&` (logical AND) and `||` (logical OR) operators.

**Examples**

Write a filter for only successful, non-duplicate responses

    --output-filter="success = 1 && repeat = 0"

Filter for packets that have classification RST and a TTL greater than 10, or for packets with classification SYNACK

    --output-filter="(classification = rst && ttl > 10) || classification = synack"

#### CSV ####

The csv module will produce a comma-separated value file of the output fields requested. For example, the following command produces the following CSV in a file called `output.csv`.

    $ zmap -p 80 -f "response,saddr,daddr,sport,seq,ack,in_cooldown,is_repeat,timestamp" -o output.csv

----------

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

The redis output module allows addresses to be added to a Redis queue instead of being saved to file which ultimately allows ZMap to be incorporated with post processing tools.

**Heads Up!** ZMap does not build with Redis support by default. If you are building ZMap from source, you can build with Redis support by running CMake with `-DWITH_REDIS=ON`.

### Blacklisting and Whitelisting ###

ZMap supports both blacklisting and whitelisting network prefixes. If ZMap is not provided with blacklist or whitelist parameters, ZMap will scan all IPv4 addresses (including local, reserved, and multicast addresses). If a blacklist file is specified, network prefixes in the blacklisted segments will not be scanned; if a whitelist file is provided, only network prefixes in the whitelist file will be scanned. A whitelist and blacklist file can be used in coordination; the blacklist has priority over the whitelist (e.g. if you have whitelisted 10.0.0.0/8 and blacklisted 10.1.0.0/16, then 10.1.0.0/16 will not be scanned). Whitelist and blacklist files can be specified on the command-line as follows:

**-b, --blacklist-file=path**

File of subnets to blacklist in CIDR notation, e.g. 192.168.0.0/16

**-w, --whitelist-file=path**

File of subnets to limit scan to in CIDR notation, e.g. 192.168.0.0/16 

Blacklist files should be formatted with a single network prefix in CIDR notation per line. Comments are allowed using the `#` character. Example:

    # From IANA IPv4 Special-Purpose Address Registry
    # http://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml
    # Updated 2013-05-22
    
    0.0.0.0/8           # RFC1122: "This host on this network"
    10.0.0.0/8          # RFC1918: Private-Use
    100.64.0.0/10       # RFC6598: Shared Address Space
    127.0.0.0/8         # RFC1122: Loopback
    169.254.0.0/16      # RFC3927: Link Local
    172.16.0.0/12       # RFC1918: Private-Use
    192.0.0.0/24        # RFC6890: IETF Protocol Assignments
    192.0.2.0/24        # RFC5737: Documentation (TEST-NET-1)
    192.88.99.0/24      # RFC3068: 6to4 Relay Anycast
    192.168.0.0/16      # RFC1918: Private-Use
    192.18.0.0/15       # RFC2544: Benchmarking
    198.51.100.0/24     # RFC5737: Documentation (TEST-NET-2)
    203.0.113.0/24      # RFC5737: Documentation (TEST-NET-3)
    240.0.0.0/4         # RFC1112: Reserved
    255.255.255.255/32  # RFC0919: Limited Broadcast
    
    # From IANA Multicast Address Space Registry
    # http://www.iana.org/assignments/multicast-addresses/multicast-addresses.xhtml
    # Updated 2013-06-25
    
    224.0.0.0/4         # RFC5771: Multicast/Reserved

If you are looking to scan only a random portion of the internet, checkout Sampling, instead of using whitelisting and blacklisting.

**Heads Up!** The default ZMap configuration uses the blacklist file at `/etc/zmap/blacklist.conf`, which contains locally scoped address space and reserved IP ranges. The default configuration can be changed by editing `/etc/zmap/zmap.conf`.

### Rate Limiting and Sampling ###

By default, ZMap will scan at the fastest rate that your network adaptor supports. In our experiences on commodity hardware, this is generally around 95-98% of the theoretical speed of gigabit Ethernet, which may be faster than your upstream provider can handle. ZMap will not automatically adjust its send-rate based on your upstream provider. You may need to manually adjust your send-rate to reduce packet drops and incorrect results.

**-r, --rate=pps**

Set maximum send rate in packets/sec

**-B, --bandwidth=bps**

Set send rate in bits/sec (supports suffixes G, M, and K). This overrides the --rate flag. 

ZMap also allows random sampling of the IPv4 address space by specifying max-targets and/or max-runtime. Because hosts are scanned in a random permutation generated per scan instantiation, limiting a scan to n hosts will perform a random sampling of n hosts. Command-line options:

**-n, --max-targets=n**

Cap number of targets to probe

**-N, --max-results=n**

Cap number of results (exit after receiving this many positive results)

**-t, --max-runtime=s**

Cap length of time for sending packets (in seconds)

**-s, --seed=n**

Seed used to select address permutation. Specify the same seed in order to scan addresses in the same order for different ZMap runs. 

For example, if you wanted to scan the same one million hosts on the Internet for multiple scans, you could set a predetermined seed and cap the number of scanned hosts similar to the following:

    zmap -p 443 -s 3 -n 1000000 -o results

In order to determine which one million hosts were going to be scanned, you could run the scan in dry-run mode which will print out the packets that would be sent instead of performing the actual scan.

    zmap -p 443 -s 3 -n 1000000 --dryrun | grep daddr
    	| awk -F'daddr: ' '{print $2}' | sed 's/ |.*//;' 

### Sending Multiple Packets ###

ZMap supports sending multiple probes to each host. Increasing this number both increases scan time and hosts reached. However, we find that the increase in scan time (~100% per additional probe) greatly outweighs the increase in hosts reached (~1% per additional probe).

**-P, --probes=n**

The number of unique probes to send to each IP (default=1) 

----------

### Sample Applications ###

ZMap is designed for initiating contact with a large number of hosts and finding ones that respond positively. However, we realize that many users will want to perform follow-up processing, such as performing an application level handshake. For example, users who perform a TCP SYN scan on port 80 might want to perform a simple GET request and users who scan port 443 may be interested in completing a TLS handshake.

#### Banner Grab ####

We have included a sample application, banner-grab, with ZMap that enables users to receive messages from listening TCP servers. Banner-grab connects to the provided servers, optionally sends a message, and prints out the first message received from the server. This tool can be used to fetch banners such as HTTP server responses to specific commands, telnet login prompts, or SSH server strings.

This example finds 1000 servers listening on port 80, and sends a simple GET request to each, storing their base-64 encoded responses in http-banners.out

    $ zmap -p 80 -N 1000 -B 10M -o - | ./banner-grab-tcp -p 80 -c 500 -d ./http-req > out

For more details on using `banner-grab`, see the README file in `examples/banner-grab`.

**Heads Up!** ZMap and banner-grab can have significant performance and accuracy impact on one another if run simultaneously (as in the example). Make sure not to let ZMap saturate banner-grab-tcp's concurrent connections, otherwise banner-grab will fall behind reading stdin, causing ZMap to block on writing stdout. We recommend using a slower scanning rate with ZMap, and increasing the concurrency of banner-grab-tcp to no more than 3000 (Note that > 1000 concurrent connections requires you to use `ulimit -SHn 100000` and `ulimit -HHn 100000` to increase the maximum file descriptors per process). These parameters will of course be dependent on your server performance, and hit-rate; we encourage developers to experiment with small samples before running a large scan.

#### Forge Socket ####

We have also included a form of banner-grab, called forge-socket, that reuses the SYN-ACK sent from the server for the connection that ultimately fetches the banner. In `banner-grab-tcp`, ZMap sends a SYN to each server, and listening servers respond with a SYN+ACK. The ZMap host's kernel receives this, and sends a RST, as no active connection is associated with that packet. The banner-grab program must then create a new TCP connection to the same server to fetch data from it.

In forge-socket, we utilize a kernel module by the same name, that allows us to create a connection with arbitrary TCP parameters. This enables us to suppress the kernel's RST packet, and instead create a socket that will reuse the SYN+ACK's parameters, and send and receive data through this socket as we would any normally connected socket.

To use forge-socket, you will need the forge-socket kernel module, available from [github][1]. You should git clone `git@github.com:ewust/forge_socket.git` in the ZMap root source directory, and then cd into the forge_socket directory, and run make. Install the kernel module with `insmod forge_socket.ko` as root.

You must also tell the kernel not to send RST packets. An easy way to disable RST packets system wide is to use **iptables**. `iptables -A OUTPUT -p tcp -m tcp --tcp-flgas RST,RST RST,RST -j DROP` as root will do this, though you may also add an optional --dport X to limit this to the port (X) you are scanning. To remove this after your scan completes, you can run `iptables -D OUTPUT -p tcp -m tcp --tcp-flags RST,RST RST,RST -j DROP` as root. 

Now you should be able to build the forge-socket ZMap example program. To run it, you must use the **extended_file** ZMap output module:

    $ zmap -p 80 -N 1000 -B 10M -O extended_file -o - | \
        ./forge-socket -c 500 -d ./http-req > ./http-banners.out

See the README in `examples/forge-socket` for more details.

----------

### Writing Probe and Output Modules ###

ZMap can be extended to support different types of scanning through **probe modules** and additional types of results **output through** output modules. Registered probe and output modules can be listed through the command-line interface:

**--list-probe-modules**

Lists installed probe modules

**--list-output-modules**

Lists installed output modules 

#### Output Modules ####

ZMap output and post-processing can be extended by implementing and registering **output modules** with the scanner. Output modules receive a callback for every received response packet. While the default provided modules provide simple output, these modules are also capable of performing additional post-processing (e.g. tracking duplicates or outputting numbers in terms of AS instead of IP address)

Output modules are created by defining a new output_module struct and registering it in [output_modules.c][2]:

    typedef struct output_module {
        const char          *name;           // how is output module referenced in the CLI
        unsigned            update_interval; // how often is update called in seconds
    	
        output_init_cb      init;            // called at scanner initialization
        output_update_cb    start;           // called at the beginning of scanner
        output_update_cb    update;          // called every update_interval seconds
        output_update_cb    close;           // called at scanner termination
    	
        output_packet_cb    process_ip;      // called when a response is received
    
        const char          *helptext;       // Printed when --list-output-modules is called
      
    } output_module_t;

Output modules must have a name, which is how they are referenced on the command-line and generally implement `success_ip` and oftentimes `other_ip` callback. The process_ip callback is called for every response packet that is received and passed through the output filter by the current **probe module**. The response may or may not be considered a success (e.g. it could be a TCP RST). These callbacks must define functions that match the `output_packet_cb` definition:

    int (*output_packet_cb) (
    
        ipaddr_n_t    saddr,         // IP address of scanned host in network-order
        ipaddr_n_t    daddr,         // destination IP address in network-order 
        
        const char*   response_type, // send-module classification of packet
        
        int           is_repeat,     // {0: first response from host, 1: subsequent responses}
        int           in_cooldown,   // {0: not in cooldown state, 1: scanner in cooldown state}
        
        const u_char* packet,        // pointer to struct iphdr of IP packet
        size_t        packet_len     // length of packet in bytes 
    );

An output module can also register callbacks to be executed at scanner initialization (tasks such as opening an output file), start of the scan (tasks such as documenting blacklisted addresses), during regular intervals during the scan (tasks such as progress updates), and close (tasks such as closing any open file descriptors). These callbacks are provided with complete access to the scan configuration and current state:

    int (*output_update_cb)(struct state_conf*, struct state_send*, struct state_recv*);

which are defined in [output_modules.h][3]. An example is available at [src/output_modules/module_csv.c][4].

#### Probe Modules ####

Packets are constructed using probe modules which allow abstracted packet creation and response classification. ZMap comes with two scan modules by default: `tcp_synscan` and `icmp_echoscan`. By default, ZMap uses `tcp_synscan`, which sends TCP SYN packets, and classifies responses from each host as open (received SYN+ACK) or closed (received RST). ZMap also allows developers to write their own probe modules for use with ZMap, using the following API.

Each type of scan is implemented by developing and registering the necessary callbacks in a `send_module_t` struct:

    typedef struct probe_module {
        const char               *name;             // how scan is invoked on command-line
        size_t                   packet_length;     // how long is probe packet (must be static size)
        
        const char               *pcap_filter;      // PCAP filter for collecting responses
        size_t                   pcap_snaplen;      // maximum number of bytes for libpcap to capture
        
        uint8_t                  port_args;         // set to 1 if ZMap requires a --target-port be
                                                    // specified by the user
        
        probe_global_init_cb     global_initialize; // called once at scanner initialization
        probe_thread_init_cb     thread_initialize; // called once for each thread packet buffer
        probe_make_packet_cb     make_packet;       // called once per host to update packet
        probe_validate_packet_cb validate_packet;   // called once per received packet, 
                                                    // return 0 if packet is invalid,
                                                    // non-zero otherwise.
        
        probe_print_packet_cb    print_packet;      // called per packet if in dry-run mode
        probe_classify_packet_cb process_packet;   // called by receiver to classify response
        probe_close_cb           close;             // called at scanner termination
    
        fielddef_t               *fields           // Definitions of the fields specific to this module
        int                      numfields         // Number of fields
        
    } probe_module_t;

At scanner initialization, `global_initialize` is called once and can be utilized to perform any necessary global configuration or initialization. However, `global_initialize` does not have access to the packet buffer which is thread-specific. Instead, `thread_initialize` is called at the initialization of each sender thread and is provided with access to the buffer that will be used for constructing probe packets along with global source and destination values. This callback should be used to construct the host agnostic packet structure such that only specific values (e.g. destination host and checksum) need to be be updated for each host. For example, the Ethernet header will not change between headers (minus checksum which is calculated in hardware by the NIC) and therefore can be defined ahead of time in order to reduce overhead at scan time.

The `make_packet` callback is called for each host that is scanned to allow the **probe module** to update host specific values and is provided with IP address values, an opaque validation string, and probe number (shown below). The probe module is responsible for placing as much of the verification string into the probe, in such a way that when a valid response is returned by a server, the probe module can verify that it is present. For example, for a TCP SYN scan, the tcp_synscan probe module can use the TCP source port and sequence number to store the validation string. Response packets (SYN+ACKs) will contain the expected values in the destination port and acknowledgement number.

    int make_packet(
        void        *packetbuf,  // packet buffer
        ipaddr_n_t  src_ip,      // source IP in network-order
        ipaddr_n_t	dst_ip,      // destination IP in network-order
        uint32_t    *validation, // validation string to place in probe
        int         probe_num    // if sending multiple probes per host,
                                 // this will be which probe number for this
                                 // host we are currently sending
    );

Scan modules must also define `pcap_filter`, `validate_packet`, and `process_packet`. Only packets that match the PCAP filter will be considered by the scanner. For example, in the case of a TCP SYN scan, we only want to investigate TCP SYN/ACK or TCP RST packets and would utilize a filter similar to `tcp && tcp[13] & 4 != 0 || tcp[13] == 18`. The `validate_packet` function will be called for every packet that fulfills this PCAP filter. If the validation returns non-zero, the `process_packet` function will be called, and will populate a fieldset using fields defined in `fields` with data from the packet. For example, the following code processes a packet for the TCP synscan probe module.

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

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/ewust/forge_socket/
[2]:https://github.com/zmap/zmap/blob/v1.0.0/src/output_modules/output_modules.c
[3]:https://github.com/zmap/zmap/blob/master/src/output_modules/output_modules.h
[4]:https://github.com/zmap/zmap/blob/master/src/output_modules/module_csv.c
