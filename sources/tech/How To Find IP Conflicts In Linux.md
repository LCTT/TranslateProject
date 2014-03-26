Translating------------------geekpi


How To Find IP Conflicts In Linux
================================================================================
You all know what IP addresses are, right? How they are assigned to devices on a network to represent them. They are assigned by DHCP servers and the change frequently. Now there are two kinds of IP’s. The dynamic ones who change frequently (a few times a day) and the static ones who, as the name suggests, are static, as in they don’t change. Sometimes that creates conflicts. When a dynamic IP is assigned and there is already another device on the network with the same static IP. Or it can happen when there are more than one DHCP servers giving IP’s on the same network from the same subnet. If you’re having connectivity issues and suspect it is due to IP conflict you can use a tool called arp-scan to detect them.

This tool sends ARP (Address Resolution Protocol) packets on local network to collect the addresses. If there is multiple MAC addresses claiming the same IP address, then there is conflict.

To install arp-scan on Ubuntu or Debian type:

    $ sudo apt-get install arp-scan

For Fedora, CentOS or Redhat:

    $ sudo yum install arp-scan

To detect IP conflicts, run the following:

    $ sudo arp-scan –I eth0 -l

An output example:

    192.168.1.10   00:1b:a9:63:a2:4c       BROTHER INDUSTRIES, LTD.
    192.168.1.30   00:1e:8f:58:ec:49       CANON INC.
    192.168.1.33   00:25:4b:1b:10:20       Apple, Inc
    192.168.1.37   10:9a:dd:55:d7:95       Apple Inc
    192.168.1.38   20:c9:d0:27:8d:56       (Unknown)
    192.168.1.39   d4:85:64:4d:35:be       Hewlett Packard
    192.168.1.39   00:0b:46:e4:8e:6d       Cisco (DUP: 2)
    192.168.1.40   90:2b:34:18:59:c0       (Unknown)

In this instance, the **19.168.1.39** IP is in conflict since it appears twice.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/find-ip-conflicts-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
