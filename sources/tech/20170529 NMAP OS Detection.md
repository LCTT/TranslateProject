NMAP OS Detection
===================

Sometimes on a network it is beneficial to know the Operating System (OS) of a machine. Accessing a system is easier when you know the OS because you can specifically search the Internet for known security holes in the OS. Granted, security holes are usually patched quickly, but you need to know when a security hole exists.

Scanning your own network to detect the OS types can help you to see what a hacker will be able to see about your network.

**OS Detection Database**

NMAP has a database which is installed when you install NMAP. The database is used when doing OS detection, but it is not automatically updated.

The database is located at ‘/usr/share/nmap/nmap-os-db’. The easiest way to manage an update is first to look at the database version number. Open the file in a text editor and the version number is usually listed on the second line. The second line of my database is ‘# $Id: nmap-os-db 35407 2015-11-10 04:26:26Z dmiller $’. The database version for this file is 35407.

To look on the Internet for an updated version go to ‘[https://svn.nmap.org/nmap][1]’ as shown in Figure 1.

![Figure 01.jpg](https://www.linux.org/attachments/figure-01-jpg.699/)

**FIGURE 1**

Here you can see that the version number is 36736\. This seems like quite an update compared to what is currently on my system. The database definitely needs to be updated for proper OS Detection of newer systems.

It may be a good idea to keep the older database version. Since my current version is 35407 I will perform the following command in a Terminal:

 _sudo mv /usr/share/nmap/nmap-os-db /usr/share/nmap/nmap-os-db-35407_ 

The database is ‘moved’ or ‘renamed’ to include the version number. The next step is to download the new version from the website. Perform the following commands in a Terminal:

 _cd /usr/share/nmap
sudo su
wget _  [_https://svn.nmap.org/nmap/nmap-os-db_][2] 

The new database should be downloaded and ready to go, but you should add the version number. As you saw in Figure 1 the version number is 36736\. Use a text editor to open the database and on the second line add the version number. By adding the version number it will be easier to check later if the version number has changed. When the version number has changed you can update the database and add the version number so you are prepared when checking for updates again.

**OS Detection Process**

Before we get into the actual command and performing an OS Detection we should cover some details about what is happening during this scan.

There are five separate probes being performed. Each probe may consist of one or more packets. The response to each packet by the target system helps to determine the OS type.

The five different probes are:

1.  Sequence Generation

2.  ICMP Echo

3.  TCP Explicit Congestion Notification

4.  TCP

5.  UDP

Now we can look at these individually to see what they are doing.

**Sequence Generation**

The Sequence Generation Probe consists of six packets. The six packets are sent 100 ms apart and are all TCP SYN packets.

The result of each TCP SYN packet will help NMAP determine the OS type.

**ICMP Echo**

Two ICMP Request packets are sent to the target system with varying settings in the packet.

The resulting responses will help verify the OS type by NMAP.

**TCP Explicit Congestion Notification**

When a lot of packets are being generated and passing through a router causing it to be burdened is known as congestion. The result is that systems slow down to reduce congestion so the router is not dropping packets.

The packet being sent is only to get a response from the target system. Specific values returned are used to determine the specific OS since each OS handles the packets in different ways.

**TCP**

Six packets are sent during this probe.

Some packets are sent to open or closed ports with specific packet settings. Again, the results will vary depending on the target OS.

The TCP Packets are all sent with varying flags as follows:

1.  no flags

2.  SYN, FIN, URG and PSH

3.  ACK

4.  SYN

5.  ACK

6.  FIN, PSH, and URG

**UDP**

This probe consists of a single packet sent to a closed port.

If the port used on the target system is closed and an ICMP Port Unreachable message is returned then there is no Firewall.

**NMAP OS Detection Command**

Now we need to run the actual command to perform an OS Detection. If you have read any of the other of my NMAP articles then it is best not to perform a PING. To skip the PING we use the parameter ‘-Pn’. To see the extra information we may require you should use the ‘-v’ parameter for adding verbosity. Specifically to get the OS Detection the parameter ‘-O’ is needed.

For the command to complete properly and perform the TCP SYN Scan you need to perform the command as ROOT. In my case, I will perform the scan on one system only and not the whole network so the command would be:

 _sudo nmap -v -Pn -O 192.168.0.63_ 

The results of the scan are shown in Figure 2\. The scan shows that there are seven open ports using a SYN Stealth Scan.

![Figure 02.jpg](https://www.linux.org/attachments/figure-02-jpg.700/)

**FIGURE 2**

The open ports are:

1.  21/tcp ftp

2.  22/tcp ssh

3.  111/tcp rpcbind

4.  139/tcp netbios-ssn

5.  445/tcp microsoft-ds

6.  2049/tcp nfs

7.  54045/tcp unknown

The MAC Address of the system is 00:1E:4F:9F
![:D](https://www.linux.org/styles/default/xenforo/clear.png "Big Grin    :D")
F:7F.

The final portion shows the OS type:

 _Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.2 - 4.6
Uptime guess: 0.324 days (since Sun Apr 23 08:43:32 2017)_ 

The system is running Ubuntu Server 16.10 and the Linux Kernel is 4.8\. The uptime is guessed correctly.

I performed a second test against another system. The results are shown in Figure 3.

![Figure 03.jpg](https://www.linux.org/attachments/figure-03-jpg.701/)

**FIGURE 3**

In this scan different ports are open. The system is guessed to be ‘Microsoft Windows 2000|XP’. It is Windows XP running SP3.

**Port Sniffer Results.**

Let’s look at what is going on in the background of the first scan shown in Figure 2.

Initially NMAP is performing a TCP Stealth Scan. In this instance the OS Detection Probes start at Packet 2032 in Figure 4.

![Figure 04.jpg](https://www.linux.org/attachments/figure-04-jpg.702/)

**FIGURE 4**

The Sequence Generation starts at Packet 2032/2033 and the sixth one is at Packet 2047/2048\. Notice that each one is sent twice and the next packet in the probe is sent 100 ms later.

The ICMP Packets are sent at 2050-2053\. The two packets are duplicated making a total of four.

Packets 2056-2057 are the TCP Explicit Congestion Notification packets.

The six probes for the TCP are on lines 2059, 2060, 2061, 2063, 2065 and 2067.

The last probe for UDP is line 2073.

These are the probes that are used to determine the OS of the target system.

I hope this helps you to understand how to update the NMAP OS Detection Database and perform a scan on systems. Be aware that you can run the scan on systems which are not on your network, so the scan can be performed on systems on the Internet.

--------------------------------------------------------------------------------

via: https://www.linux.org/threads/nmap-os-detection.4564/

作者：[Jarret B ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.org/members/jarret-b.29858/
[1]:https://svn.nmap.org/nmap
[2]:https://svn.nmap.org/nmap/nmap-os-db
