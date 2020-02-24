[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Digging up IP addresses with the Linux dig command)
[#]: via: (https://www.networkworld.com/article/3527430/digging-up-ip-addresses-with-the-dig-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Digging up IP addresses with the Linux dig command
======
The dig command is extremely versatile both for retrieving information from domain name servers and for troubleshooting.
Thinkstock

Not unlike **nslookup** in function, but with a lot more options, the **dig** command provides information that name servers manage and can be very useful for troubleshooting problems. It’s both simple to use and has lots of useful options.

The name “dig” stands for “domain information groper” since domain groping is basically what it does. The amount of information that it provides depends on a series of options that you can use to tailor its output to your needs. Dig can provide a lot of detail or be surprisingly terse.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

### Just the IP, please

To get _just_ the IP address for a system, add the **+short** option to your dig command like this:

```
$ dig facebook.com +short
31.13.66.35
```

Don't be surprised, however, if some domains are tied to multiple IP addresses to make the sites they support more reliable.

```
$ dig networkworld.com +short
151.101.2.165
151.101.66.165
151.101.130.165
151.101.194.165
```

Also, don't be surprised if the order of the IP addresses changes from one query to the next. This is a side effect of load balancing.

```
$ dig networkworld.com +short
151.101.130.165
151.101.194.165
151.101.2.165
151.101.66.165
```

### Standard dig output

The standard dig display provides details on dig itself along with the response from the name server.

```
$ dig networkworld.com

; <<>> DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu <<>*gt; networkworld.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 39932
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;networkworld.com.              IN      A

;; ANSWER SECTION:
networkworld.com.       300     IN      A       151.101.194.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.2.165

;; Query time: 108 msec
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Thu Feb 13 13:49:53 EST 2020
;; MSG SIZE  rcvd: 109
```

Since name servers generally cache collected data for a while, the query time shown at the bottom of dig output might sometimes might say "0 msec":

[][2]

```
;; Query time: 0 msec        <==
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Thu Feb 13 15:30:09 EST 2020
;; MSG SIZE  rcvd: 109
```

### Who you gonna ask?

By default, dig will refer to your **/etc/resolv.conf** file to determine what name server to query, but you can refer queries to other DNS servers by adding an **@** option.

In the example below, for example, the query is being sent to Google's name server (i.e., 8.8.8.8).

```
$ dig @8.8.8.8 networkworld.com

; <<>> DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu <<>> @8.8.8.8 networkworld.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21163
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;networkworld.com.              IN      A

;; ANSWER SECTION:
networkworld.com.       299     IN      A       151.101.130.165
networkworld.com.       299     IN      A       151.101.66.165
networkworld.com.       299     IN      A       151.101.194.165
networkworld.com.       299     IN      A       151.101.2.165

;; Query time: 48 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Thu Feb 13 14:26:14 EST 2020
;; MSG SIZE  rcvd: 109
```

To determine what version of dig you’re using, use the **-v** option. You should see something like this:

```
$ dig -v
DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu
```

or this:

```
$ dig -v
DiG 9.11.4-P2-RedHat-9.11.4-22.P2.el8
```

To get just the answer portion of this response, you can omit name server details, but still get the answer you're looking for by using both a **+noall** (don't show everything) and a **+answer** (but show the answer section) like this:

```
$ dig networkworld.com +noall +answer

; <<>> DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu <<>> networkworld.com +noall +answer
;; global options: +cmd
networkworld.com.       300     IN      A       151.101.194.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.2.165
```

### Looking up a batch of systems

If you want to dig for a series of domain names, you can list the domain names in a file and then use a command like this one to have dig run through the list and provide the information.

```
$ dig +noall +answer -f domains
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.2.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.194.165
world.std.com.          77972   IN      A       192.74.137.5
uushenandoah.org.       1982    IN      A       162.241.24.209
amazon.com.             18      IN      A       176.32.103.205
amazon.com.             18      IN      A       176.32.98.166
amazon.com.             18      IN      A       205.251.242.103
```

You could add +short to the command above but, with some sites having multiple IP addresses, this might not be very useful. To cut down on the detail but be sure that you can tell which IP belongs to which domain, you could instead pass the output to **awk** to display just the first and last columns of data:

```
$ dig +noall +answer -f domains | awk '{print $1,$NF}'
networkworld.com. 151.101.66.165
networkworld.com. 151.101.130.165
networkworld.com. 151.101.194.165
networkworld.com. 151.101.2.165
world.std.com. 192.74.137.5
amazon.com. 176.32.98.166
amazon.com. 205.251.242.103
amazon.com. 176.32.103.205
```

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3527430/digging-up-ip-addresses-with-the-dig-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
