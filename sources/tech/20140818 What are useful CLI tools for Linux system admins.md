What are useful CLI tools for Linux system admins
================================================================================
System administrators (sysadmins) are responsible for day-to-day operations of production systems and services. One of the critical roles of sysadmins is to ensure that operational services are available round the clock. For that, they have to carefully plan backup policies, disaster management strategies, scheduled maintenance, security audits, etc. Like every other discipline, sysadmins have their tools of trade. Utilizing proper tools in the right case at the right time can help maintain the health of operating systems with minimal service interruptions and maximum uptime.

This article will present some of the most popular and useful CLI tools recommended for sysadmins in their day to day activities. If you would like to recommend any useful tool which is not listed here, don't forget to share it in the comment section.

### Network Tools ###

1. **ping**: Check end-to-end connectivity (RTT delay, jitter, packet loss) of a remote host with ICMP echo/reply. Useful to check system status and reachability.

2. **[phping][1]**: Network scanning and testing tool that can generate ICMP/TCP/UDP ping packets. Often used for advanced port scanning, firewall testing, manual path MTU discovery and fragmentation testing.

3. **traceroute**: Discover a layer-3 forwarding path from a local host to a remote destination host with TTL-limited ICMP/UDP/TCP probe packets. Useful to troubleshoot network reachability and routing problems.

4. **mtr**: A variation of traceroute which characterizes per-hop packet loss/jitter with running statistics. Useful to characterize routing path delays.

5. **[netcat][2]/[socat][3]**: A swiss army knife of TCP/IP networking, allowing to read/write byte streams over TCP/UDP. Useful to troubleshoot firewall policies and service availability.

6. **dig**: DNS troubleshooting tool that can generate forward queries, reverse queries, find authoritative name servers, check CNAME, MX and other DNS records. Can be instructed to query a specific DNS server of your choosing.

7. **nslookup**: Another DNS checking/troubleshooting tool. Works with all DNS queries and records. Can query a particular DNS server.

8. **dnsyo**: A DNS testing tool which checks DNS propagation by performing DNS lookup from over a number of open resolvers located across 1,500 different networks around the world.

9. **lsof**: Show information about files (e.g., regular files, pipes or sockets) which are opened by processes. Useful to monitor open network connections.

10. **iftop**: A ncurses-based TUI utility that can be used to monitor in real time bandwidth utilization and network connections for each network interfaces. Useful to keep track of bandwidth hogging applications, users, destinations and ports.

11. **netstat**: A network statistics utility that can show status information and statistics about open network connections (TCP/UDP ports, IP addresses), routing tables, TX/RX traffic and protocols. Useful for network related diagnosis and performance tuning.

12. **[tcpdump][4]**: A popular packet sniffer tool based on libpcap packet capture library. Can define packet capturing filters in Berkeley Packet Filters format.

13. **[tshark][5]**: Another CLI packet sniffer software with full compatibility with its GUI counterpart, Wireshark. Supports [1,000 protocols][6] and the list is growing. Useful to troubleshoot, analyze and store information on live packets.

14. **ip**: A versatile CLI networking tool which is part of iproute2 package. Used to check and modifying routing tables, network device state, and IP tunneling settings. Useful to view routing tables, add/remove static routes, configure network interfaces, and otherwise troubleshoot routing issues.

15. **ifup/ifdown**: Used to bring up or shut down a particular network interface. Often a preferred alternative to restarting the entire network service.

16. **[autossh][7]**: A program which create an SSH session and automatically restarts the session should it disconnect. Often useful to create a persistent reverse SSH tunnel across restrictive corporate networks.

17. **iperf**: A network testing tool which measures maximum bi-directional throughput between a pair of hosts by injecting customizable TCP/UDP data streams in between.

18. **[elinks][8]/[lynx][9]**: text-based web browsers for CLI-based server environment.

### Security Tools ###

19. **[iptables][10]**: A user-space CLI tool for configuring Linux kernel firewall. Provides means to create and modify rules for incoming, transit and outgoing packets within Linux kernel space.

20. **[nmap][11]**: A popular port scanning and network discovery tool used for security auditing purposes. Useful to find out which hosts are up and running on the local network, and what ports are open on a particular host.

21. **[TCP Wrappers][12]**: A host-based network ACL tool that can be used to filter incoming/outgoing reqeuests/replies. Often used alongside iptables as an additional layer of security.

22. **getfacl/setfacl**: View and customize access control lists of files and directories, as extensions to traditional file permissions.

23. **cryptsetup**: Used to create and manage LUKS-encrypted disk partitions.

24. **lynis**: A CLI-based vulnerability scanner tool. Can scan the entire Linux system, and report potential vulnerabilities along with possible solutions.

25. **maldet**: A malware scanner CLI tool which can detect and quarantine potentially malware-infected files. Can run as a background daemon for continuous monitoring.

26. **[rkhunter][13]/[chkrootkit][14]**: CLI tools which scan for potential rootkits, hidden backdoors and suspected exploits on a local system, and disable them.

### Storage Tools ###

27. **fdisk**: A disk partition editor tool. Used to view, create and modify disk partitions on hard drives and removable media.

28. **sfdisk**: A variant of fdisk which accesses or updates a partition table in a non-interactive fashion. Useful to automate disk partitioning as part of backup and recovery procedure.

29. **[parted][15]**: Another disk partition editor which can support disk larger than 2TB with GPT (GUID Partitioning Table). Gparted is a GTK+ GUI front-end of parted.

30. **df**: Used to check used/available storage and mount point of different partitions or file directories. A user-friendly variant dfc exists.

31. **du**: Used to view current disk usage associated with different files and directories (e.g., du -sh *).

32. **mkfs**: A disk formatting command used to build a filesystem on individual disk partitions. Filesystem-specific versions of mkfs exist for a number of filesystems including ext2, ext3, ext4, bfs, ntfs, vfat/fat.

33. **fsck**: A CLI tool used to check a filesystem for errors and repair where possible. Typically run automatically upon boot when necessary, but also invoked manually on demand once unmounting a partition.

34. **mount**: Used to map a physical disk partition, network share or remote storage to a local mount point. Any read/write in the mount point makes actual data being read/written in the correspoinding actual storage.

35. **mdadm**: A CLI tool for managing software RAID devices on top of physical block devices. Can create, build, grow or monitor RAID array.

36. **lvm**: A suite of CLI tools for managing volume groups and physical/logical volumes, which allows one to create, resize, split and merge volumes on top of multiple physical disks with minimum downtime.

### Log Processing Tools ###

37. **tail**: Used to monitor trailing part of a (growing) log file. Other variants include multitail (multi-window monitoring) and [ztail][16] (inotify support and regex filtering and coloring).

38. **logrotate**: A CLI tool that can split, compresse and mail old/large log files in a pre-defined interval. Useful for administration of busy servers which may produce a large amount of log files.

39. **grep/egrep**: Can be used to filter log content for a particular pattern or a regular expression. Variants include user-friendly ack and faster ag.

40. **awk**: A versatile text scanning and processing tool. Often used to extract certain columns or fields from text/log files, and feed the result to other tools.

41. **sed**: A text stream editor tool which can filter and transform (e.g., remove line/whitespace, substitute/convert a word, add numbering) text streams and pipeline the result to stdout/stderr or another tool.

### Backup Tools ###

42. **[rsync][17]**: A fast one-way incremental backup and mirroring tool. Often used to replicate a data repository to an offsite storage, optionally over a secure connection such as SSH or stunnel.

43. **[rdiff-backup][18]**: Another bandwidth-efficient, incremental backup tool. Maintains differential of two consecutive snapshots.

44. **duplicity**: An encrypted incremental backup utility. Uses GnuPG to encrypt a backup, and transfers to a remote server over SSH.

### Performance Monitoring Tools ###

45. **top**: A CLI-based process viewer program. Can monitor system load, process states, CPU and memory utilization. Variants include more user-friendly htop.

46. **ps**: Shows a snapshot of all running processes in the system. The output can be customized to show PID, PPID, user, load, memory, cummulative user/system time, start time, and more. Variants include pstree which shows 

### processes in a tree hierarchy. ###

47. **[nethogs][19]**: A bandwidth monitoring tool which groups active network connections by processes, and reports per-process (upload/download) bandwidth consumption in real-time.

48. **ngxtop**: A web-server access log parser and monitoring tool whose interface is inspired by top command. It can report, in real time, a sorted list of web requests along with frequency, size, HTTP return code, IP address, etc.

49. **vmstat**: A simple CLI tool which shows various run-time system properties such as process count, free memory, paging status, CPU utilization, block I/O activities, interrupt/context switch statistics, and more.

50. **iotop**: An ncurses-based I/O monitoring tool which shows in real time disk I/O activities of all running processes in sorted order.

51. **iostat**: A CLI tool which reports current CPU utilization, as well as device I/O utilization, where I/O utilization (e.g., block transfer rate, byte read/write rate) is reported on a per-device or per-partition basis.

### Productivity Tools ###

52. **screen**: Used to split a single terminal into multiple persistent virtual terminals, which can also be made accessible to remote users, like teamviewer-like screen sharing.

53. **tmux**: Another terminal multiplexer tool which enables multiple persistent sessions, as well as horizontal/vertial splits of a terminal.

54. **cheat**: A simple CLI tool which allows you to read cheat sheets of many common Linux commands, conveniently right at your fingertips. Pre-built cheat sheets are fully customizable.

55. **apropos**: Useful when you are searching man pages for descriptions or keywords.

### Package Management Tools ###

56. **apt**: The de facto package manager for Debian based systems like Debain, Ubuntu or Backtrack. A life saver.

57. **apt-fast**: A supporting utility for apt-get, which can significantly improve apt-get's download speed by using multiple concurrent connections.

58. **apt-file**: Used to find out which .deb package a specific file belongs to, or to show all files in a particular .deb package. Works on both installed and non-installed packages.

59. **dpkg**: A CLI utility to install a .deb package manually. Highly advised to use apt whenever possible.

60. **yum**: The de facto automatic package manager for Red Hat based systems like RHEL, CentOS or Fedora. Yet another life saver.

61. **rpm**: Typically I use rpmyum something. Has some useful parameters like -q, -f, -l for querying, files and locations, respectively.

### Hardware Tools ###

62. **lspci**: A command line tool which shows various information about installed PCI devices, such as model names, device drivers, capabilities, memory address, PCI bus address.

63. **lshw**: A command line tool which queries and displays detailed information of hardware configuration in various categories (e.g., processor, memory, motherboard, network, storage). Supports multiple output formats: html, xml, json, text.

64. **[inxi][20]**: A comprehensive hardware reporting tool which gives an overview of various hardware components such as CPU, graphics card, sound card, network card, temperature/fan sensors, etc.

If you would like to recommend any useful tool which is not listed here, feel free to share it in the comment section.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/useful-cli-tools-linux-system-admins.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://www.hping.org/
[2]:http://netcat.sourceforge.net/
[3]:http://www.dest-unreach.org/socat/
[4]:http://www.tcpdump.org/
[5]:https://www.wireshark.org/docs/man-pages/tshark.html
[6]:https://www.wireshark.org/docs/dfref/
[7]:http://www.harding.motd.ca/autossh/
[8]:http://elinks.or.cz/
[9]:http://lynx.isc.org/
[10]:http://www.netfilter.org/projects/iptables/
[11]:http://nmap.org/
[12]:http://en.wikipedia.org/wiki/TCP_Wrapper
[13]:http://rkhunter.sourceforge.net/
[14]:http://www.chkrootkit.org/
[15]:http://www.gnu.org/software/parted/
[16]:https://hackage.haskell.org/package/ztail
[17]:http://rsync.samba.org/
[18]:http://www.nongnu.org/rdiff-backup/
[19]:http://nethogs.sourceforge.net/
[20]:http://code.google.com/p/inxi/