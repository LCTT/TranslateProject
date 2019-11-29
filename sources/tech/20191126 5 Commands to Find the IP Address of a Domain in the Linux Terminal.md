[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Commands to Find the IP Address of a Domain in the Linux Terminal)
[#]: via: (https://www.2daygeek.com/linux-command-find-check-domain-ip-address/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

5 Commands to Find the IP Address of a Domain in the Linux Terminal
======

This tutorial shows you how to verify a domain name’s or computer name IP address from a Linux terminal.

This tutorial will allow you to check multiple domains at once.

You may have already used these commands to verify information.

However, we will teach you how to use these commands effectively to identify multiple domain IP address information from the Linux terminal.

This can be done using the following 5 commands.

  * **dig Command:** dig is a flexible cli tool for interrogating DNS name servers.
  * **host Command:** host is a simple utility for performing DNS lookups.
  * **nslookup Command:** Nslookup command is used to query Internet domain name servers.
  * **fping Command:** fping command is used to send ICMP ECHO_REQUEST packets to network hosts.
  * **ping Command:** ping command is used to send ICMP ECHO_REQUEST packets to network hosts.



To test this, we created a file called “domains-list.txt” and added the below domains.

```
# vi /opt/scripts/domains-list.txt

2daygeek.com
magesh.co.in
linuxtechnews.com
```

### Method-1: How to Find a IP Address of the Domain Using the dig Command

**[dig command][1]** stands for “domain information groper”‘ is a powerful and flexible command-line tool for querying DNS name servers.

It performs DNS lookups and displays the answers that are returned from the name server(s) that were queried.

Most DNS administrators use dig command to troubleshoot DNS problems because of its flexibility, ease of use and clarity of output.

It also has a batch mode functionality to read search requests from a file.

```
# dig 2daygeek.com | awk '{print $1,$5}'

2daygeek.com. 104.27.157.177
2daygeek.com. 104.27.156.177
```

Use the following bash script to find the multiple domain’s IP address.

```
# vi /opt/scripts/dig-command.sh

#!/bin/bash
for server in `cat /opt/scripts/domains-list.txt`
do echo $server "-"
dig $server +short
done | paste -d " " - - -
```

Once the above script is added to a file. Set the executable permission for the “dig-command.sh” file.

```
# chmod +x /opt/scripts/dig-command.sh
```

Finally run the bash script to get the output.

```
# sh /opt/scripts/dig-command.sh

2daygeek.com - 104.27.156.177 104.27.157.177
magesh.co.in - 104.18.35.52 104.18.34.52
linuxtechnews.com - 104.27.144.3 104.27.145.3
```

If you want to run the above script in one line, use the following script.

```
# for server in 2daygeek.com magesh.co.in linuxtechnews.com; do echo $server "-"; dig $server +short; done | paste -d " " - - -
```

Alternatively, you can use the following shell script to find the IP address of the multiple domain.

```
# for server in 2daygeek.com magesh.co.in linuxtechnews.com; do dig $server | awk '{print $1,$5}'; done

2daygeek.com. 104.27.157.177
2daygeek.com. 104.27.156.177
magesh.co.in. 104.18.34.52
magesh.co.in. 104.18.35.52
linuxtechnews.com. 104.27.144.3
linuxtechnews.com. 104.27.145.3
```

### Method-2: How to Find a Domain’s IP Address Using the host Command

**[Host Command][2]** is a simple CLI application to perform **[DNS lookup][3]**.

It is commonly used to convert names to IP addresses and vice versa.

When no arguments or options are given, host prints a short summary of its command line arguments and options.

You can view all types of records in the domain by adding a specific option or type of record in the host command.

```
# host 2daygeek.com | grep "has address" | sed 's/has address/-/g'

2daygeek.com - 104.27.157.177
2daygeek.com - 104.27.156.177
```

Use the following bash script to find the multiple domain’s IP address.

```
# vi /opt/scripts/host-command.sh

for server in `cat /opt/scripts/domains-list.txt`
do host $server | grep "has address" | sed 's/has address/-/g'
done
```

Once the above script is added to a file. Set the executable permission for the “host-command.sh” file.

```
# chmod +x /opt/scripts/host-command.sh
```

Finally run the bash script to get the output.

```
# sh /opt/scripts/host-command.sh

2daygeek.com - 104.27.156.177
2daygeek.com - 104.27.157.177
magesh.co.in - 104.18.35.52
magesh.co.in - 104.18.34.52
linuxtechnews.com - 104.27.144.3
linuxtechnews.com - 104.27.145.3
```

### Method-3: How to Find the IP Address of a Domain Using the nslookup Command

**[nslookup command][4]** is a program for querying Internet **[domain name servers (DNS)][5]**.

nslookup has two modes, which are interactive and interactive.

Interactive mode allows the user to query name servers for information about various hosts and domains or to print a list of hosts in a domain.

Non-interactive mode is used to print just the name and requested information for a host or domain.

It is a network administration tool that helps diagnose and resolve DNS related issues.

```
# nslookup -q=A 2daygeek.com | tail -n+4 | sed -e '/^$/d' -e 's/Address://g' | grep -v 'Name|answer' | xargs -n1

104.27.157.177
104.27.156.177
```

Use the following bash script to find the multiple domain’s IP address.

```
# vi /opt/scripts/nslookup-command.sh

#!/bin/bash
for server in `cat /opt/scripts/domains-list.txt`
do echo $server "-"
nslookup -q=A $server | tail -n+4 | sed -e '/^$/d' -e 's/Address://g' | grep -v 'Name|answer' | xargs -n1 done | paste -d " " - - -
```

Once the above script is added to a file. Set the executable permission for the “nslookup-command.sh” file.

```
# chmod +x /opt/scripts/nslookup-command.sh
```

Finally run the bash script to get the output.

```
# sh /opt/scripts/nslookup-command.sh

2daygeek.com - 104.27.156.177 104.27.157.177
magesh.co.in - 104.18.35.52 104.18.34.52
linuxtechnews.com - 104.27.144.3 104.27.145.3
```

### Method-4: How to Find a Domain’s IP Address Using the fping Command

**[fping command][6]** is a program such as ping, which uses the Internet Control Message Protocol (ICMP) echo request to determine whether a target host is responding.

fping differs from ping because it allows users to ping any number of host in parallel. Also, hosts can be entered from a text file.

fping sends an ICMP echo request, moves the next target in a round-robin fashion, and does not wait until the target host responds.

If a target host replies, it is noted as active and removed from the list of targets to check; if a target does not respond within a certain time limit and/or retry limit it is designated as unreachable.

```
# fping -A -d 2daygeek.com magesh.co.in linuxtechnews.com

104.27.157.177 (104.27.157.177) is alive
104.18.35.52 (104.18.35.52) is alive
104.27.144.3 (104.27.144.3) is alive
```

### Method-5: How to Find the IP Address of the Domain Using the ping Command

**[ping command][6]** stands for (Packet Internet Groper) command is a networking utility that used to test the target of a host availability/connectivity on an Internet Protocol (IP) network.

It’s verify a host availability by sending Internet Control Message Protocol (ICMP) Echo Request packets to the target host and waiting for an ICMP Echo Reply.

It summarize statistical results based on the packets transmitted, packets received, packet loss, typically including the min/avg/max times.

```
# ping -c 2 2daygeek.com | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g'

104.27.157.177
```

Use the following bash script to find the multiple domain’s IP address.

```
# vi /opt/scripts/ping-command.sh

#!/bin/bash
for server in `cat /opt/scripts/domains-list.txt`
do echo $server "-"
ping -c 2 $server | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g'
done | paste -d " " - -
```

Once the above script is added to a file. Set the executable permission for the “dig-command.sh” file.

```
# chmod +x /opt/scripts/ping-command.sh
```

Finally run the bash script to get the output.

```
# sh /opt/scripts/ping-command.sh

2daygeek.com - 104.27.156.177
magesh.co.in - 104.18.35.52
linuxtechnews.com - 104.27.144.3
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-find-check-domain-ip-address/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/dig-command-check-find-dns-records-lookup-linux/
[2]: https://www.2daygeek.com/linux-host-command-check-find-dns-records-lookup/
[3]: https://www.2daygeek.com/category/dns-lookup/
[4]: https://www.2daygeek.com/nslookup-command-check-find-dns-records-lookup-linux/
[5]: https://www.2daygeek.com/check-find-dns-records-of-domain-in-linux-terminal/
[6]: https://www.2daygeek.com/how-to-use-ping-fping-gping-in-linux/
