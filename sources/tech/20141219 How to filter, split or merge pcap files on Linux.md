How to filter, split or merge pcap files on Linux
================================================================================
If you are a network admin who is involved in testing an [intrusion detection system][1] or network access control policy, you may often rely on offline analysis using collected packet dumps. When it comes to storing packet dumps, libpcap's packet dump format (pcap format) is the most widely used by many open-source packet sniffing and capture programs. If pcap files are used as part of penetration testing or any kind of offline analysis, there's often need for manipulating pcap files before [injecting][2] them into the network.

![](https://farm8.staticflickr.com/7570/15425147404_a69f416673_c.jpg)

In this tutorial, I am going to introduce useful pcap manipulation tools and show their use cases.

### Editcap and Mergecap ###

Wireshark, the most popular GUI-based packet sniffer, actually comes with a suite of very useful command-line tools. Among them are editcap and mergecap. The former is a versatile pcap editor which can filter or split a pcap file in various fashions. The latter allows you to merge multiple pcap files into one. This tutorial is based on these Wireshark CLI tools.

If you already have Wireshark installed, these tools are already available for you. If not, go ahead and install Wireshark command-line tools on Linux. Note that on Debian-based distributions, you can install Wireshark command-line tools without installing Wireshark GUI, while on Red Hat based distributions, you need to install the whole Wireshark package.

**Debian, Ubunu or Linux Mint**

    $ sudo apt-get install wireshark-common

**Fedora, CentOS or RHEL**

    $ sudo yum install wireshark

Once you install Wireshark CLI tools, you can start using editcap and mergecap tools.

### Filter a Pcap File ###

editcap allows you to filter an input pcap file in various fashions, and save the result in a new pcap file.

First of all, you can filter an input pcap file based on start time and/or end time. "-A <start-time> and "-B <end-time> options are used to capture only those packets whose arrival time falls within a specific time range (e.g., between 2:30pm and 2:35pm). The time format to use is 'YYYY-MM-DD HH:MM:SS'.

    $ editcap -A '2014-12-10 10:11:01' -B '2014-12-10 10:21:01' input.pcap output.pcap 

If you want to extract specific N packets from an input pcap file, you can also do that. The command below extracts 100 packets (from 401 to 500) from input.pcap and save them as output.pcap:

    $ editcap input.pcap output.pcap 401-500 

If you want to filter out duplicate packets in a pcap file, use "-D <dup-window>" option. This will compare each packet against the previous (<dup-window> - 1) packets in terms of packet length and MD5 hash, and discard the packet if any match is found.

    $ editcap -D 10 input.pcap output.pcap 

> 37568 packets seen, 1 packets skipped with duplicate window of 10 packets.

Alternatively, you can define <dup-window> in terms of time interval. If you use "-w <dup-time-window> option, it will compare each packet against all the packets which arrived within <dup-time-window> seconds to determine its duplicity.

    $ editcap -w 0.5 input.pcap output.pcap 

> 50000 packets seen, 0 packets skipped with duplicate time window equal to or less than 0.500000000 seconds.

### Split a Pcap File ###

editcap can be also useful if you want to split a large pcap file into multiple smaller pcap files.

To split a pcap file into multiple pcap files of the same packet count:

    $ editcap -c <packets-per-file> <input-pcap-file> <output-prefix> 

Each output pcap file will have the same packet count, and be named as <output-prefix>-NNNN.

To split a pcap file into multiple pcap files with the same time interval:

    $ editcap -i <seconds-per-file> <input-pcap-file> <output-prefix> 

### Merge Pcap Files ###

If you want to combine multiple pcap files into one, mergecap is handy.

When combining pcap files, mergecap, by default, relies on per-packet timestamp information in pcap files to sort packets in chronological order.

    $ mergecap -w output.pcap input.pcap input2.pcap [input3.pcap . . .] 

If you want to ignore timestamp information, and simply merge multiple pcap files in their order in the command line, use '-a' option.

For example, the following command will write all packets from input.pcap to output.pcap, followed by all packets in input2.pcap.

    $ mergecap -a -w output.pcap input.pcap input2.pcap 

### Summary ###

In this tutorial, I presented several use cases of pcap file manipulation using editcap and mergecap. Besides these, there are other pcap related tools out there, for example, [reordercap][3] for reordering packets, [text2pcap][4] for text to pcap conversion), [pcap-diff][5] for diff pcap files, etc. Some of these pcap tools can be really handy along with [packet injection tools][6] for network penetration testing and various network troubleshooting purposes, so better to know they exist!

Do you use any pcap tool out there? If so, what is your use case?

--------------------------------------------------------------------------------

via: http://xmodulo.com/filter-split-merge-pcap-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-compile-and-install-snort-from-source-code-on-ubuntu.html
[2]:http://xmodulo.com/how-to-capture-and-replay-network-traffic-on-linux.html
[3]:https://www.wireshark.org/docs/man-pages/reordercap.html
[4]:https://www.wireshark.org/docs/man-pages/text2pcap.html
[5]:https://github.com/isginf/pcap-diff
[6]:http://xmodulo.com/how-to-capture-and-replay-network-traffic-on-linux.html