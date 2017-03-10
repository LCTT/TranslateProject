wcnnbdk1 translating
NMAP Common Scans – Part One
========================

In a previous article, ‘[NMAP Installation][1]’, a listing of ten different ZeNMAP Profiles were listed. Most of the Profiles used various parameters. Most of the parameters represented different scans which can be performed. This article will cover the common four scan types.

**The Common Four Scan Types**

The four main scan types which are used most often are the following:

1.  PING Scan (-sP)
2.  TCP SYN Scan (-sS)
3.  TCP Connect() Scan (-sT)
4.  UDP Scan (-sU)

When using NMAP to perform scans these four scans are the four to keep in mind. The main thing to keep in mind about them is what they do and how they do it. This article covers the PING and UDP scans. The next article will cover the TCP scans.

**PING Scan (-sP)**

Some scans can flood the network with packets, but the Ping Scan only puts, at most, two packets on the network. The two packets do not count DNS Lookup or ARP Requests if needed. A minimum of one packet is required per IP Address being scanned.

A typical PING operation is used to determine if a network host is on-line with the IP Address specified. For example, if I were on the Internet and found that I could not reach a specific Web Server I could PING the Server to determine if it were on-line. The PING would also verify that the route between my system and the Web Server was also functioning.

**NOTE:** When discussing TCP/IP the information is both useful for the Internet and a Local Area Network (LAN) using TCP/IP. The procedures work for both. The procedures would also work for a Wide Area Network (WAN) just as well.

If the Domain Name Service (DNS) Server is needed to find the IP Address (if a Domain Name is given) then extra packets are generated. For example, to ‘ping linuxforum.com’ would first require that the IP Address (98.124.199.63) be found for the Domain Name (linuxforum.com). If the command ‘ping 98.124.199.63’ was executed then the DNS Lookup is not needed. If the MAC Address is unknown, then an ARP Request is sent to find the MAC Address of the system with the specified IP Address.

The PING command sends an Internet Control Message Protocol (ICMP) packet to the given IP Address. The packet is an ICMP Echo Request which needs a response. A response will be sent back if the system is on-line. If a Firewall exists between the two systems a PING can be dropped by the Firewall. Some servers can be configured to ignore PING requests as well to prevent the possibility of a PING of Death.

**NOTE:** The PING of Death is a malformed PING packet which is sent to a system and causes it to leave a connection open to wait for the rest of the packet. Once a bunch of these are sent to the same system it will refuse any connections since it has all available connection opened. The system is then technically unavailable.

Once a system receives the ICMP Echo Request it will respond with an ICMP Echo Reply. Once the source system receives the ICMP Echo Reply then it knows the system is on-line.

Using NMAP you specify a single IP Address or a range of IP Addresses. A PING is then performed on each IP Address when a PING Scan (-sP) is specified.

In Figure 1 you can see I performed the command ‘nmap -sP 10.0.0.1-10’. The program will try to contact every system with an IP Address of 10.0.0.1 to 10.0.0.10\. An ARP is sent out, three for each IP Address given to the command. In this case thirty requests went out – two for each of the ten IP Addresses.

 ![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.105/) 

**FIGURE 1**

Figure 2 shows the Wireshark capture from another machine on the network – yes it is a Windows system. Line 1 shows the first request sent out to IP Address 10.0.0.2\. The IP Address 10.0.0.1 was skipped due to it being the local system on which NMAP was being run. Now we can say that there were only 27 ARP Requests since the local one was skipped. Line 2 shows the ARP Response from the system with the IP Address of 10.0.0.2\. Lines 3 through 10 are ARP Requests for the remaining IP Addresses. Line 11 is another response from the system at IP Address 10.0.0.2 since it has not heard back from the requesting system (10.0.0.1). Line 12 is a response from the source system to 10.0.0.2 responding with ‘SYN’ at Sequence 0\. Line 13 and 14 are the system at 10.0.0.2 responding twice with the Restart (RST) and Synchronize (SYN) response to close the two connections it had opened on Lines 2 and 11\. Notice the Sequence ID is ‘1’ - the source Sequence ID + 1\. Lines 15 on are a continuation of the same.

 ![Figure 02.jpg](https://www.linuxforum.com/attachments/figure-02-jpg.106/) 

**FIGURE 2**

Looking back at Figure 1 we can see that there were two hosts found up and running. Of course the local system was found (10.0.0.1) and one other (10.0.0.2). The whole scan took a total time of 14.40 seconds.

The PING Scan is a fast scan used to find systems which are up and running. No other information is really found about the network or the systems from the scan. The scan is a good start to see what is available on a network so you can perform more complex scans on the on-line systems only. You may also be able to find systems on the network which should not exist. Rogue systems on a network can be dangerous because they can be gathering internal network and system information easily.

Once you have a list of on-line systems you can then detect what Ports may be open on each system with a UDP Scan.

**UDP Scan (-sU)**

Now that you know what systems are available to scan you can concentrate on these IP Addresses only. It is not a good idea to flood a network with a lot of scan activity. Administrators can have programs monitor network traffic and alert them when large amounts of suspicious activities occur.

The User Datagram Protocol (UDP) is useful to determine open Ports on an on-line system. Since UDP is a connectionless protocol, a response is not needed. This scan can send a UDP packet to a system with a specified Port number. If the target system does not respond then the Port is either closed or filtered. If the Port is open then a response should be made. In most cases a target system will send an ICMP message back that the Port is unreachable. The ICMP information lets NMAP know that the Port is closed. If a Port is open then the target system should respond with an ICMP message to let NMAP know it is an available Port.

**NOTE: **Only the top 1,000 most used Ports are scanned. A deeper scan will be covered in later articles.

In my scan I will only perform the scan on the system with the IP Address 10.0.0.2 since I know it is on-line. The scan sends and receives a total of 3,278 packets. The result of the NMAP command ‘sudo nmap -sU 10.0.0.2’ is shown in Figure 3.

 ![Figure 03.jpg](https://www.linuxforum.com/attachments/figure-03-jpg.107/) 

**FIGURE 3**

Here you can see that one Port was found open – 137 (netbios-ns). The results from Wireshark are shown in Figure 4\. Not much to see but a bunch of UDP packets.

 ![Figure 4.jpg](https://www.linuxforum.com/attachments/figure-4-jpg.108/) 

**FIGURE 4**

What would happen if I turned off the Firewall on the target system? My results are quite a bit different. The NMAP command and results are shown in Figure 5.

 ![Figure 05.png](https://www.linuxforum.com/attachments/figure-05-png.109/) 

**FIGURE 5**

**NOTE:** When performing a UDP Scan you are required to have root permissions.

The high quantity of the number of packets is due to the fact that UDP is being used. Once the NMAP system sends a request it is not guaranteed that the packet was received. Because of the possible loss of packets the packets are sent multiple times.

--------------------------------------------------------------------------------

via: https://www.linuxforum.com/threads/nmap-common-scans-part-one.3637/

作者：[Jarret][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxforum.com/members/jarret.268/
[1]:https://www.linuxforum.com/threads/nmap-installation.3431/
