Translating by ucasFL
NMAP Common Scans – Part Two
=====================



In a previous article, ‘[NMAP Installation][1]’, a listing of ten different ZeNMAP Profiles were listed. Most of the Profiles used various parameters. Most of the parameters represented different scans which can be performed. This article will cover the last two remaining of the common four scan types.

**The Common Four Scan Types**

The four main scan types which are used most often are the following:

1.  PING Scan (-sP)
2.  TCP SYN Scan (-sS)
3.  TCP Connect() Scan (-sT)
4.  UDP Scan (-sU)

When using NMAP to perform scans these four scans are the four to keep in mind. The main thing to keep in mind about them is what they do and how they do it. This article covers the two TCP scans – TCP SYN Scan and TCP Connect Scan.

([See Common scans - part one][2])

**TCP SYN Scan (-sS)**

The TCP SYN Scan is the default NMAP scan. To run the TCP SYN Scan you are required to have Root privileges.

The purpose of the TCP SYN Scan is to find open Ports on the scanned systems. As with NMAP scans you can scan systems on the other side of a Firewall. When scanning through a Firewall the scan time will be lengthened since packets will be slowed down.

The way the TCP SYN Scan works is that it starts a three-way handshake. As described in another article, the three-way handshake takes place between two systems. The Source System sends a packet to the Target System which is a SYN (Sync) request. The Target System will respond with a SYN/ACK (Sync/Acknowledgement). The Source System will the respond with an Acknowledgement (ACK) so the communication link is established and data can be transferred between them.

The TCP Syn Scan works by performing the steps as follows:

1.  Source System sends a SYN request to the Target but a Port number is added to the request in this case.
2.  The Target System will respond with a SYN/ ACK (Sync/Acknowledgement) to the Source if the specified Port is open.
3.  The Source System responds with a RST (Reset) to the Target to close the connection.
4.  The Target System can respond with a RST/ACK (Reset/Acknowledgement) to the Source System.

The connection was started to be established so this is considered a half-open connection. Because the connection state is being managed by NMAP you need Root privileges.

If the Port being scanned is closed the following will occur:

1.  Source System sends a SYN request to the Target and a Port number is added to the request.
2.  The Target responds with a RST (Reset) since the Port is closed.

If the Target System is behind a Firewall then the ICMP transmission or responses will be blocked by the Firewall and the following happens:

1.  Source System sends a SYN request to the Target and the Port number is added to the request.
2.  No response is received since it was Filtered by the Firewall.

In this case the port is listed as Filtered and the Port may or may not be open. The Firewall may be set to stop all outgoing packets on the specified Port. The Firewall may block all incoming packets to a specified Port and so the Target System does not receive the request.

**NOTE:** The lack of a response may also occur on a system with a Firewall program enabled on it. Even on a local network you may find Filtered Ports.

I will perform a scan of a single system (10.0.0.2) and perform the TCP Syn Scan as shown in Figure 1\. The scan is done with the command ‘sudo nmap -sS <IP Address>’. The ‘<IP Address>’ can be exchanged with a single IP Address, as in Figure 1, or by using a group of IP Addresses.

 ![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.119/)

**FIGURE 1**

You can see that it states that 997 Filtered Ports are not shown. NMAP then finds two Ports open – 139 and 445.

**NOTE:** Keep in mind that NMAP only scans the most well-known 1,000 Ports. We will cover other scans later which will allow us to scan all ports or only those specified.

The scan was captured by WireShark as shown in Figure 2\. Here you can see the initial Address Resolution Protocol (ARP) requests being made for the Target System. Following the ARP requests are a long list of TCP requests to the Ports on the Target System. Line 4 is to the ‘http-alt’ Port (8080). The Source System Port number is 47,128\. Many SYN requests are sent until a response is made as shown in Figure 3.

 ![Figure 2.jpg](https://www.linuxforum.com/attachments/figure-2-jpg.120/)

**FIGURE 2**

 ![Figure 3.jpg](https://www.linuxforum.com/attachments/figure-3-jpg.121/)

**FIGURE 3**

In Figure 3 on Lines 50 and 51 you can see the RST (Reset) packet sent to the Source System. Lines 53 and 55 shows a RST/ACK (Reset/Acknowledgement). Line 50 is for the ‘microsoft-ds’ Port (445) and Line 51 is for the ‘netbios-ssn’ Port (135) we can see that the Ports are opened. No other ACK (Acknowledgments) are made from the Target System except for these Ports. Each request can be sent over 1,000 times.

The Target System was a Windows System and I turned off the Firewall software on the system and performed the scan again as shown in Figure 4\. Now instead of seeing 997 Filtered Ports there are 997 Closed Ports. Port 135 is also now open on the Target System which was being blocked by the Firewall.

 ![Figure 04.jpg](https://www.linuxforum.com/attachments/figure-04-jpg.122/)

**FIGURE 4**

**TCP Connect() Scan (-sT)**

The TCP Connect() Scan (-sT) does not require Root privileges as the TCP Syn Scan does. A full Three-Way Handshake is performed in this Scan. Because Root privileges are not needed this scan can be helpful on a network where you cannot get Root privileges.

The way the TCP Connect Scan works is that it performs a three-way handshake. As described above, the three-way handshake takes place between two systems. The Source System sends a packet to the Target System which is a SYN (Sync) request. The Target System will respond with a SYN/ACK (Sync/Acknowledgement). The Source System will then respond with an Acknowledgement (ACK) so the communication link is established and data can be transferred between them.

The TCP Connect Scan works by performing the steps as follows:

1.  Source System sends a SYN request to the Target but a Port number is added to the request in this case.
2.  The Target System will respond with a SYN/ ACK (Sync/Acknowledgement) to the Source if the specified Port is open.
3.  The Source System responds with an ACK (Acknowledgement) to the Target to finish the session creation.
4.  The Source System then sends the Target System a RST (Reset) packet to close the session.
5.  The Target System can respond with a RST/ACK (Reset/Acknowledgement) to the Source System.

When step 2 occurs the Source System knows that the Port Specified in Step 1 is an Open Port.

If a Port is closed then the same thing happens as in a TCP Scan. In Step 2 the Target System will respond with a RST (Reset) packet.

The scan is done with the command ‘nmap -sT <IP Address>’. The ‘<IP Address>’ can be exchanged with a single IP Address, as in Figure 5, or by using a group of IP Addresses.

The results of a TCP Connect Scan can be seen in Figure 5\. Here you can see that the two open Ports, 139 and 445, are found just like with the TCP SYN Scan. Port 80 is listed as being Closed. The remaining Ports are not shown and listed as Filtered.

 ![Figure 05.jpg](https://www.linuxforum.com/attachments/figure-05-jpg.123/)

**FIGURE 5**

Let’s try the scan again after shutting off the Firewall. The results are shown in Figure 6.

 ![Figure 06.jpg](https://www.linuxforum.com/attachments/figure-06-jpg.124/)

**FIGURE 6**

With the Firewall off we can see more Ports have been found. Just as with the TCP SYN Scan when having the Firewall off we find Ports 139, 445 and 135 are open. We also have found that Port 2869 is also open. There are also 996 closed Ports. Port 80 is now part of the 996 closed Ports – no longer Filtered by the Firewall.

In some cases the TCP Connect Scan may finish in a shorter amount of time. The TCP Connect Scan also seems to find more open Ports than the TCP SYN Scan.

--------------------------------------------------------------------------------

via: https://www.linuxforum.com/threads/nmap-common-scans-part-two.3879/

作者：[Jarret ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxforum.com/members/jarret.268/
[1]:https://www.linuxforum.com/threads/nmap-installation.3431/
[2]:https://www.linuxforum.com/threads/nmap-common-scans-part-one.3637/
