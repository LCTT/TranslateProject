[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 Methods to Quickly Check if a Website is up or down from the Linux Terminal)
[#]: via: (https://www.2daygeek.com/linux-command-check-website-is-up-down-alive/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

6 Methods to Quickly Check if a Website is up or down from the Linux Terminal
======

This tutorial shows you how to quickly check whether a given website is up (alive) or down from a Linux terminal.

You may already know some of these commands to verify about this, namely ping, curl, and wget.

But we have added some other commands as well in this tutorial.

Also, we have added various options to check this information for single host and multiple hosts.

This article will help you to check whether the website is up or down.

But if you maintain some websites and want to get real-time alerts when the website is down.

I recommend you to use real-time website monitoring tools. There are many tools for this, and some are free and most of them are paid.

So choose the preferred one based on your needs. We will cover this topic in our upcoming article.

### Method-1: How to Check if a Website is up or down Using the fping Command

**[fping command][1]** is a program such as ping, which uses the Internet Control Message Protocol (ICMP) echo request to determine whether a target host is responding.

fping differs from ping because it allows users to ping any number of host in parallel. Also, hosts can be entered from a text file.

fping sends an ICMP echo request, moves the next target in a round-robin fashion, and does not wait until the target host responds.

If a target host replies, it is noted as active and removed from the list of targets to check; if a target does not respond within a certain time limit and/or retry limit it is designated as unreachable.

```
# fping 2daygeek.com linuxtechnews.com magesh.co.in

2daygeek.com is alive
linuxtechnews.com is alive
magesh.co.in is alive
```

### Method-2: How to Quickly Check Whether a Website is up or down Using the http Command

HTTPie (pronounced aitch-tee-tee-pie) is a command line HTTP client.

The **[httpie tool][2]** is a modern command line http client which makes CLI interaction with web services.

It provides a simple http command that allows for sending arbitrary HTTP requests using a simple and natural syntax, and displays colorized output.

HTTPie can be used for testing, debugging, and generally interacting with HTTP servers.

```
# http 2daygeek.com

HTTP/1.1 301 Moved Permanently
CF-RAY: 535b66722ab6e5fc-LHR
Cache-Control: max-age=3600
Connection: keep-alive
Date: Thu, 14 Nov 2019 19:30:28 GMT
Expires: Thu, 14 Nov 2019 20:30:28 GMT
Location: https://2daygeek.com/
Server: cloudflare
Transfer-Encoding: chunked
Vary: Accept-Encoding
```

### Method-3: How to Check if a Website is up or down Using the curl Command

**[curl command][3]** is a tool to transfer data from a server or to server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP).

The command is designed to work without user interaction.

Also curl support proxy support, user authentication, FTP upload, HTTP post, SSL connections, cookies, file transfer resume, Metalink, and more.

curl is powered by libcurl for all transfer-related features.

```
# curl -I https://www.magesh.co.in

HTTP/2 200
date: Thu, 14 Nov 2019 19:39:47 GMT
content-type: text/html
set-cookie: __cfduid=db16c3aee6a75c46a504c15131ead3e7f1573760386; expires=Fri, 13-Nov-20 19:39:46 GMT; path=/; domain=.magesh.co.in; HttpOnly
vary: Accept-Encoding
last-modified: Sun, 14 Jun 2015 11:52:38 GMT
x-cache: HIT from Backend
cf-cache-status: DYNAMIC
expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
server: cloudflare
cf-ray: 535b74123ca4dbf3-LHR
```

Use the following curl command if you want to see only the HTTP status code instead of entire output.

```
# curl -I "www.magesh.co.in" 2>&1 | awk '/HTTP\// {print $2}'
 200
```

If you want to see if a given website is up or down, use the following Bash script.

```
# vi curl-url-check.sh

#!/bin/bash
if curl -I "https://www.magesh.co.in" 2>&1 | grep -w "200\|301" ; then
    echo "magesh.co.in is up"
else
    echo "magesh.co.in is down"
fi
```

Once you have added the above script to a file, run the file to see the output.

```
# sh curl-url-check.sh

HTTP/2 200
magesh.co.in is up
```

Use the following shell script if you want to see the status of multiple websites.

```
# vi curl-url-check-1.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if curl -I "$site" 2>&1 | grep -w "200\|301" ; then
    echo "$site is up"
else
    echo "$site is down"
fi
echo "----------------------------------"
done
```

Once you have added the above script to a file, run the file to see the output.

```
# sh curl-url-check-1.sh

HTTP/1.1 200 OK
www.google.com is up
----------------------------------
HTTP/1.1 301 Moved Permanently
google.co.in is up
----------------------------------
www.xyzzz.com is down
----------------------------------
```

### Method-4: How to Quickly Check Whether a Website is up or down Using the wget Command

**[wget command][4]** (formerly known as Geturl) is a Free, open source, command line download tool which is retrieving files using HTTP, HTTPS and FTP, the most widely-used Internet protocols.

It is a non-interactive command line tool and Its name is derived from World Wide Web and get.

wget handle download pretty much good compared with other tools, futures included working in background, recursive download, multiple file downloads, resume downloads, non-interactive downloads &amp; large file downloads.

```
# wget -S --spider https://www.magesh.co.in

Spider mode enabled. Check if remote file exists.
--2019-11-15 01:22:00--  https://www.magesh.co.in/
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving www.magesh.co.in (www.magesh.co.in)… 104.18.35.52, 104.18.34.52, 2606:4700:30::6812:2334, …
Connecting to www.magesh.co.in (www.magesh.co.in)|104.18.35.52|:443… connected.
HTTP request sent, awaiting response…
  HTTP/1.1 200 OK
  Date: Thu, 14 Nov 2019 19:52:01 GMT
  Content-Type: text/html
  Connection: keep-alive
  Set-Cookie: __cfduid=db73306a2f1c72c1318ad4709ef49a3a01573761121; expires=Fri, 13-Nov-20 19:52:01 GMT; path=/; domain=.magesh.co.in; HttpOnly
  Vary: Accept-Encoding
  Last-Modified: Sun, 14 Jun 2015 11:52:38 GMT
  X-Cache: HIT from Backend
  CF-Cache-Status: DYNAMIC
  Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
  Server: cloudflare
  CF-RAY: 535b85fe381ee684-LHR
Length: unspecified [text/html]
Remote file exists and could contain further links,
but recursion is disabled -- not retrieving.
```

Use the following wget command if you want to see only the HTTP status code instead of entire output.

```
# wget --spider -S "www.magesh.co.in" 2>&1 | awk '/HTTP\// {print $2}'
 200
```

If you want to see if a given website is up or down, use the following Bash script.

```
# vi wget-url-check.sh

#!/bin/bash
if wget --spider -S "https://www.google.com" 2>&1 | grep -w "200\|301" ; then
    echo "Google.com is up"
else
    echo "Google.com is down"
fi
```

Once you have added the above script to a file, run the file to see the output.

```
# wget-url-check.sh

HTTP/1.1 200 OK
Google.com is up
```

Use the following shell script if you want to see the status of multiple websites.

```
# vi curl-url-check-1.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if wget --spider -S "$site" 2>&1 | grep -w "200\|301" ; then
    echo "$site is up"
else
    echo "$site is down"
fi
echo "----------------------------------"
done
```

Once you have added the above script to a file, run the file to see the output.

```
# sh wget-url-check-1.sh

HTTP/1.1 200 OK
www.google.com is up
----------------------------------
HTTP/1.1 301 Moved Permanently
google.co.in is up
----------------------------------
www.xyzzz.com is down
----------------------------------
```

### Method-5: How to Quickly Check Whether a Website is up or down Using the lynx Command

**[lynx][5]** is a highly configurable text-based web browser for use on cursor-addressable character cell terminals. It’s the oldest web browser and it’s still in active development.

```
# lynx -head -dump http://www.magesh.co.in

HTTP/1.1 200 OK
Date: Fri, 15 Nov 2019 08:14:23 GMT
Content-Type: text/html
Connection: close
Set-Cookie: __cfduid=df3cb624024b81df7362f42ede71300951573805662; expires=Sat, 1
4-Nov-20 08:14:22 GMT; path=/; domain=.magesh.co.in; HttpOnly
Vary: Accept-Encoding
Last-Modified: Sun, 14 Jun 2015 11:52:38 GMT
X-Cache: HIT from Backend
CF-Cache-Status: DYNAMIC
Server: cloudflare
CF-RAY: 535fc5704a43e694-LHR
```

Use the following lynx command if you want to see only the HTTP status code instead of entire output.

```
# lynx -head -dump https://www.magesh.co.in 2>&1 | awk '/HTTP\// {print $2}'
 200
```

If you want to see if a given website is up or down, use the following Bash script.

```
# vi lynx-url-check.sh

#!/bin/bash
if lynx -head -dump http://www.magesh.co.in 2>&1 | grep -w "200\|301" ; then
    echo "magesh.co.in is up"
else
    echo "magesh.co.in is down"
fi
```

Once you have added the above script to a file, run the file to see the output.

```
# sh lynx-url-check.sh

HTTP/1.1 200 OK
magesh.co.in is up
```

Use the following shell script if you want to see the status of multiple websites.

```
# vi lynx-url-check-1.sh

#!/bin/bash
for site in http://www.google.com https://google.co.in http://www.xyzzz.com
do
if lynx -head -dump "$site" 2>&1 | grep -w "200\|301" ; then
    echo "$site is up"
else
    echo "$site is down"
fi
echo "----------------------------------"
done
```

Once you have added the above script to a file, run the file to see the output.

```
# sh lynx-url-check-1.sh

HTTP/1.0 200 OK
http://www.google.com is up
----------------------------------
HTTP/1.0 301 Moved Permanently
https://google.co.in is up
----------------------------------
www.xyzzz.com is down
----------------------------------
```

### Method-6: How to Check if a Website is up or down Using the ping Command

**[ping command][1]** stands for (Packet Internet Groper) command is a networking utility that used to test the target of a host availability/connectivity on an Internet Protocol (IP) network.

It’s verify a host availability by sending Internet Control Message Protocol (ICMP) Echo Request packets to the target host and waiting for an ICMP Echo Reply.

It summarize statistical results based on the packets transmitted, packets received, packet loss, typically including the min/avg/max times.

```
# ping -c 5 2daygeek.com

PING 2daygeek.com (104.27.157.177) 56(84) bytes of data.
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=1 ttl=58 time=228 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=2 ttl=58 time=227 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=3 ttl=58 time=250 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=4 ttl=58 time=171 ms
64 bytes from 104.27.157.177 (104.27.157.177): icmp_seq=5 ttl=58 time=193 ms

--- 2daygeek.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 13244ms
rtt min/avg/max/mdev = 170.668/213.824/250.295/28.320 ms
```

### Method-7: How to Quickly Check Whether a Website is up or down Using the telnet Command

The Telnet command is an old network protocol used to communicate with another host over a TCP/IP network using the TELNET protocol.

It uses port 23 to connect to other devices, such as computer and network equipment.

Telnet is not a secure protocol and is now not recommended to use because the data sent to the protocol is not encrypted and can be intercepted by hackers.

Everyone uses SSH protocol instead of telnet, which is encrypted and very secure.

```
# telnet google.com 80

Trying 216.58.194.46…
Connected to google.com.
Escape character is '^]'.
^]
telnet> quit
Connection closed.
```

### Method-8: How to Check if a Website is up or down Using the Bash Script

In simple words, a **[shell script][6]** is a file that contains a series of commands. The shell reads this file and executes the commands one by one as they are entered directly on the command line.

To make this more useful we can add some conditions. This reduces the Linux admin task.

If you want to see the status of multiple websites using the wget command, use the following shell script.

```
# vi wget-url-check-2.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if wget --spider -S "$site" 2>&1 | grep -w "200\|301" > /dev/null ; then
    echo "$site is up"
else
    echo "$site is down"
fi
done
```

Once you have added the above script to a file, run the file to see the output.

```
# sh wget-url-check-2.sh

www.google.com is up
google.co.in is up
www.xyzzz.com is down
```

If you want to see the status of multiple websites using the curl command, use the following **[bash script][7]**.

```
# vi curl-url-check-2.sh

#!/bin/bash
for site in www.google.com google.co.in www.xyzzz.com
do
if curl -I "$site" 2>&1 | grep -w "200\|301" > /dev/null ; then
    echo "$site is up"
else
    echo "$site is down"
fi
done
```

Once you have added the above script to a file, run the file to see the output.

```
# sh curl-url-check-2.sh

www.google.com is up
google.co.in is up
www.xyzzz.com is down
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-check-website-is-up-down-alive/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-use-ping-fping-gping-in-linux/
[2]: https://www.2daygeek.com/httpie-curl-wget-alternative-http-client-linux/
[3]: https://www.2daygeek.com/curl-linux-command-line-download-manager/
[4]: https://www.2daygeek.com/wget-linux-command-line-download-utility-tool/
[5]: https://www.2daygeek.com/best-text-mode-based-command-line-web-browser-for-linux/
[6]: https://www.2daygeek.com/category/shell-script/
[7]: https://www.2daygeek.com/category/bash-script/
