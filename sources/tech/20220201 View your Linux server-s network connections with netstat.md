[#]: subject: "View your Linux server's network connections with netstat"
[#]: via: "https://opensource.com/article/22/2/linux-network-security-netstat"
[#]: author: "Sahana Sreeram https://opensource.com/users/sahanasreeram01gmailcom"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

View your Linux server's network connections with netstat
======
The netstat command provides important insight into your Linux server,
both for monitoring and network troubleshooting.
![A rack of servers, blue background][1]

I shared some important first steps to help manage your personal Linux server in a [previous article][2]. I briefly mentioned monitoring network connections for listening ports, and I want to expand on this by using the `netstat` command for Linux systems.

Service monitoring and port scanning are standard industry practices. There's very good software like [Prometheus][3] to help automate the process, and [SELinux][4] to help contextualize and protect system access. However, I believe that understanding how your server connects to other networks and devices is key to establishing a baseline of what's normal for your server, which helps you recognize abnormalities that may suggest a bug or intrusion. As a beginner, I've discovered that the `netstat` command provides important insight into my server, both for monitoring and network troubleshooting.

Netstat and similar network monitoring tools, grouped together in the [net-tools package][5], display information about active network connections. Because services running on open ports are often vulnerable to exploitation, practicing regular network monitoring can help you detect suspicious activity early.

### Install netstat

Netstat is frequently pre-installed on Linux distributions. If netstat is not installed on your server, install it with your package manager. On a Debian-based system:


```
`$ sudo apt-get install net-tools`
```

For Fedora-based systems:


```
`$ dnf install net-tools`
```

### Use netstat

On its own, the `netstat` command displays all established connections. You can use the `netstat` options above to specify the intended output further. For example, to show all listening and non-listening connections, use the `--all` (`-a` for short) option. This returns a lot of results, so in this example I pipe the output to `head` to display just the first 15 lines of output:


```


$ netstat --all | head -n 15
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 *:27036                 *:*                     LISTEN      
tcp        0      0 localhost:27060         *:*                     LISTEN      
tcp        0      0 *:16001                 *:*                     LISTEN      
tcp        0      0 localhost:6463          *:*                     LISTEN      
tcp        0      0 *:ssh                   *:*                     LISTEN      
tcp        0      0 localhost:57343         *:*                     LISTEN      
tcp        0      0 *:ipp                   *:*                     LISTEN      
tcp        0      0 *:4713                  *:*                     LISTEN      
tcp        0      0 10.0.1.222:48388        syd15s17-in-f5.1e:https ESTABLISHED
tcp        0      0 10.0.1.222:48194        ec2-35-86-38-2.us:https ESTABLISHED
tcp        0      0 10.0.1.222:56075        103-10-125-164.va:27024 ESTABLISHED
tcp        0      0 10.0.1.222:46680        syd15s20-in-f10.1:https ESTABLISHED
tcp        0      0 10.0.1.222:52730        syd09s23-in-f3.1e:https ESTABLISHED

```

To show only TCP ports, use the `--all` and `--tcp` options, or `-at` for short:


```


$ netstat -at | head -n 5
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address   Foreign Address  State      
tcp        0      0 *:27036         *:*              LISTEN      
tcp        0      0 localhost:27060 *:*              LISTEN      
tcp        0      0 *:16001         *:*              LISTEN

```

To show only UDP ports, use the `--all` and `--udp` options, or `-au` for short:


```


$ netstat -au | head -n 5
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address     Foreign Address    State      
udp        0      0 *:27036           *:*                                
udp        0      0 10.0.1.222:44741  224.0.0.56:46164   ESTABLISHED
udp        0      0 *:bootpc          

```

The options for netstat are often intuitive. For example, to show all listening TCP and UDP ports with process ID (PID) and numerical address:


```


$ sudo netstat --tcp --udp --listening --programs --numeric
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address      Foreign Addr  State   PID/Program name    
tcp        0      0 0.0.0.0:111        0.0.0.0:*     LISTEN  1/systemd            
tcp        0      0 192.168.122.1:53   0.0.0.0:*     LISTEN  2500/dnsmasq        
tcp        0      0 0.0.0.0:22         0.0.0.0:*     LISTEN  1726/sshd            
tcp        0      0 127.0.0.1:631      0.0.0.0:*     LISTEN  1721/cupsd          
tcp        0      0 127.0.0.1:6010     0.0.0.0:*     LISTEN  4023/sshd: tux@  
tcp6       0      0 :::111             :::*          LISTEN  1/systemd            
tcp6       0      0 :::22              :::*          LISTEN  1726/sshd            
tcp6       0      0 ::1:631            :::*          LISTEN  1721/cupsd          
tcp6       0      0 ::1:6010           :::*          LISTEN  4023/sshd: tux@  
udp        0      0 0.0.0.0:40514      0.0.0.0:*             1499/avahi-daemon:  
udp        0      0 192.168.122.1:53   0.0.0.0:*             2500/dnsmasq        
udp        0      0 0.0.0.0:67         0.0.0.0:*             2500/dnsmasq        
udp        0      0 0.0.0.0:111        0.0.0.0:*             1/systemd            
udp        0      0 0.0.0.0:5353       0.0.0.0:*             1499/avahi-daemon:  
udp6       0      0 :::111             :::*                  1/systemd            
udp6       0      0 :::44235           :::*                  1499/avahi-daemon:  
udp6       0      0 :::5353            :::*                  1499/avahi-daemon:

```

The short version of this common combination is `-tulpn`.

To display information about a specific service, [filter with `grep`][6]:


```


$ sudo netstat -anlp | grep cups
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      1721/cupsd           tcp6       0      0 ::1:631                 :::*                    LISTEN      1721/cupsd
unix  2      [ ACC ]     STREAM     LISTENING     27251    1/systemd /var/run/cups/cups.sock
unix  2      [ ]         DGRAM                    59530    1721/cupsd
unix  3      [ ]         STREAM     CONNECTED     55196    1721/cupsd /var/run/cups/cups.sock

```

### Next steps

Once you've run the `netstat` command, you can take steps to secure your system by ensuring that only services that you actively use are listening on your network.

  1. Recognize commonly exploited ports and services. As a general rule, close the ports you're not actually using.
  2. Be on the lookout for uncommon port numbers, and learn to recognize legitimate ports in use on your system.
  3. Pay close attention to SELinux errors. Sometimes all you need to do is update contexts to match a legitimate change you've made to your system, but read the errors to make sure that SELinux isn't alerting you of suspicious or malicious activity.



If you find that a port is running a suspicious service, or you simply want to close a port that you no longer use, you can manually deny port access through firewall rules by following these steps:

If you're using `firewall-cmd`, run these commands:


```


$ sudo firewall-cmd –remove-port=&lt;port number&gt;/tcp
$ sudo firewall-cmd –runtime-to-permanent

```

If you're using UFW, run the following command:


```
`$ sudo ufw deny <port number>`
```

Next, stop the service itself using `systemctl`:


```
`$ systemctl stop <service>`
```

### Learn netstat

Netstat is a useful tool to quickly collect information about your server's network connections. Regular network monitoring is important an important part of getting to know your system, and it helps you keep your system safe. To incorporate this step into your administrative routine, you can use network monitoring tools like netstat or ss, as well as open source port [scanners such as Nmap or sniffers like Wireshark][7], which allow for [scheduled tasks][8].

As servers house larger amounts of personal data, it's increasingly important to ensure the security of personal servers. By understanding how your server connects to the Internet, you can decrease your machine's vulnerability, while still benefiting from the growing connectivity of the digital age.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/linux-network-security-netstat

作者：[Sahana Sreeram][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sahanasreeram01gmailcom
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rack_server_sysadmin_cloud_520.png?itok=fGmwhf8I (A rack of servers, blue background)
[2]: https://opensource.com/article/21/4/securing-linux-servers
[3]: https://opensource.com/article/19/11/introduction-monitoring-prometheus
[4]: https://opensource.com/business/13/11/selinux-policy-guide
[5]: http://sourceforge.net/projects/net-tools/
[6]: https://opensource.com/article/21/3/grep-cheat-sheet
[7]: https://redhat.com/sysadmin/troubleshoot-dhcp-nmap-tcpdump-and-wireshark
[8]: https://opensource.com/article/22/2/redhat.com/sysadmin/nmap-scripting-engine
