[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Start using systemd as a troubleshooting tool)
[#]: via: (https://opensource.com/article/20/5/systemd-troubleshooting-tool)
[#]: author: (David Both https://opensource.com/users/dboth)

Start using systemd as a troubleshooting tool
======
While systemd is not really a troubleshooting tool, the information in
its output points the way toward solving problems.
![Magnifying glass on code][1]

No one would really consider systemd to be a troubleshooting tool, but when I encountered a problem on my webserver, my growing knowledge of systemd and some of its features helped me locate and circumvent the problem.

The problem was that my server, yorktown, which provides name services, DHCP, NTP, HTTPD, and SendMail email services for my home office network, failed to start the Apache HTTPD daemon during normal startup. I had to start it manually after I realized that it was not running. The problem had been going on for some time, and I recently got around to trying to fix it.

Some of you will say that systemd itself is the cause of this problem, and, based on what I know now, I agree with you. However, I had similar types of problems with SystemV. (In the [first article][2] in this series, I looked at the controversy around systemd as a replacement for the old SystemV init program and startup scripts. If you're interested in learning more about systemd, read the [second][3] and [third][4] articles, too.) No software is perfect, and neither systemd nor SystemV is an exception, but systemd provides far more information for problem-solving than SystemV ever offered.

### Determining the problem

The first step to finding the source of this problem is to determine the httpd service's status:


```
[root@yorktown ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Thu 2020-04-16 11:54:37 EDT; 15min ago
     Docs: man:httpd.service(8)
  Process: 1101 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=exited, status=1/FAILURE)
 Main PID: 1101 (code=exited, status=1/FAILURE)
   Status: "Reading configuration..."
      CPU: 60ms

Apr 16 11:54:35 yorktown.both.org systemd[1]: Starting The Apache HTTP Server...
Apr 16 11:54:37 yorktown.both.org httpd[1101]: (99)Cannot assign requested address: AH00072: make_sock: could not bind to address 192.168.0.52:80
Apr 16 11:54:37 yorktown.both.org httpd[1101]: no listening sockets available, shutting down
Apr 16 11:54:37 yorktown.both.org httpd[1101]: AH00015: Unable to open logs
Apr 16 11:54:37 yorktown.both.org systemd[1]: httpd.service: Main process exited, code=exited, status=1/FAILURE
Apr 16 11:54:37 yorktown.both.org systemd[1]: httpd.service: Failed with result 'exit-code'.
Apr 16 11:54:37 yorktown.both.org systemd[1]: Failed to start The Apache HTTP Server.
[root@yorktown ~]#
```

This status information is one of the systemd features that I find much more useful than anything SystemV offers. The amount of helpful information here leads me easily to a logical conclusion that takes me in the right direction. All I ever got from the old **chkconfig** command is whether or not the service is running and the process ID (PID) if it is. That is not very helpful.

The key entry in this status report shows that HTTPD cannot bind to the IP address, which means it cannot accept incoming requests. This indicates that the network is not starting fast enough to be ready for the HTTPD service to bind to the IP address because the IP address has not yet been set. This is not supposed to happen, so I explored my network service systemd startup configuration files; all appeared to be correct with the right "after" and "requires" statements. Here is the **/lib/systemd/system/httpd.service** file from my server:


```
# Modifying this file in-place is not recommended, because changes                                                                                    
# will be overwritten during package upgrades.  To customize the                                                                                      
# behaviour, run "systemctl edit httpd" to create an override unit.                                                                                  
                                                                                                                                                     
# For example, to pass additional options (such as -D definitions) to                                                                                
# the httpd binary at startup, create an override unit (as is done by                                                                                
# systemctl edit) and enter the following:                                                                                                            
                                                                                                                                                     
#       [Service]                                                                                                                                    
#       Environment=OPTIONS=-DMY_DEFINE                                                                                                              
                                                                                                                                                     
[Unit]                                                                                                                                                
Description=The Apache HTTP Server                                                                                                                    
Wants=httpd-init.service                                                                                                                              
After=network.target remote-fs.target nss-lookup.target httpd-init.service                                                                            
Documentation=man:httpd.service(8)                                                                                                                    
                                                                                                                                                     
[Service]                                                                                                                                            
Type=notify                                                                                                                                          
Environment=LANG=C                                                                                                                                    
                                                                                                                                                     
ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND                                                                                                      
ExecReload=/usr/sbin/httpd $OPTIONS -k graceful                                                                                                      
# Send SIGWINCH for graceful stop                                                                                                                    
KillSignal=SIGWINCH                                                                                                                                  
KillMode=mixed                                                                                                                                        
PrivateTmp=true                                                                                                                                      
                                                                                                                                                     
[Install]                                                                                                                                            
WantedBy=multi-user.target
```

The **httpd.service** unit file explicitly specifies that it should load after the **network.target** and the **httpd-init.service** (among others). I tried to find all of these services using the **systemctl list-units** command and searching for them in the resulting data stream. All were present and should have ensured that the httpd service did not load before the network IP address was set.

### First solution

A bit of searching on the internet confirmed that others had encountered similar problems with httpd and other services. This appears to happen because one of the required services indicates to systemd that it has finished its startup—but it actually spins off a child process that has not finished. After a bit more searching, I came up with a circumvention.

I could not figure out why the IP address was taking so long to be assigned to the network interface card. So, I thought that if I could delay the start of the HTTPD service by a reasonable amount of time, the IP address would be assigned by that time.

Fortunately, the **/lib/systemd/system/httpd.service** file above provides some direction. Although it says not to alter it, it does indicate how to proceed: Use the command **systemctl edit httpd**, which automatically creates a new file (**/etc/systemd/system/httpd.service.d/override.conf**) and opens the [GNU Nano][5] editor. (If you are not familiar with Nano, be sure to look at the hints at the bottom of the Nano interface.)

Add the following text to the new file and save it:


```
[root@yorktown ~]# cd /etc/systemd/system/httpd.service.d/
[root@yorktown httpd.service.d]# ll
total 4
-rw-r--r-- 1 root root 243 Apr 16 11:43 override.conf
[root@yorktown httpd.service.d]# cat override.conf
# Trying to delay the startup of httpd so that the network is
# fully up and running so that httpd can bind to the correct
# IP address
#
# By David Both, 2020-04-16

[Service]
ExecStartPre=/bin/sleep 30
```

The **[Service]** section of this override file contains a single line that delays the start of the HTTPD service by 30 seconds. The following status command shows the service status during the wait time:


```
[root@yorktown ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/httpd.service.d
           └─override.conf
           /usr/lib/systemd/system/httpd.service.d
           └─php-fpm.conf
   Active: activating (start-pre) since Thu 2020-04-16 12:14:29 EDT; 28s ago
     Docs: man:httpd.service(8)
Cntrl PID: 1102 (sleep)
    Tasks: 1 (limit: 38363)
   Memory: 260.0K
      CPU: 2ms
   CGroup: /system.slice/httpd.service
           └─1102 /bin/sleep 30

Apr 16 12:14:29 yorktown.both.org systemd[1]: Starting The Apache HTTP Server...
Apr 16 12:15:01 yorktown.both.org systemd[1]: Started The Apache HTTP Server.
[root@yorktown ~]#
```

And this command shows the status of the HTTPD service after the 30-second delay expires. The service is up and running correctly:


```
[root@yorktown ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/httpd.service.d
           └─override.conf
           /usr/lib/systemd/system/httpd.service.d
           └─php-fpm.conf
   Active: active (running) since Thu 2020-04-16 12:15:01 EDT; 1min 18s ago
     Docs: man:httpd.service(8)
  Process: 1102 ExecStartPre=/bin/sleep 30 (code=exited, status=0/SUCCESS)
 Main PID: 1567 (httpd)
   Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
    Tasks: 213 (limit: 38363)
   Memory: 21.8M
      CPU: 82ms
   CGroup: /system.slice/httpd.service
           ├─1567 /usr/sbin/httpd -DFOREGROUND
           ├─1569 /usr/sbin/httpd -DFOREGROUND
           ├─1570 /usr/sbin/httpd -DFOREGROUND
           ├─1571 /usr/sbin/httpd -DFOREGROUND
           └─1572 /usr/sbin/httpd -DFOREGROUND

Apr 16 12:14:29 yorktown.both.org systemd[1]: Starting The Apache HTTP Server...
Apr 16 12:15:01 yorktown.both.org systemd[1]: Started The Apache HTTP Server.
```

I could have experimented to see if a shorter delay would work as well, but my system is not that critical, so I decided not to. It works reliably as it is, so I am happy.

Because I gathered all this information, I reported it to Red Hat Bugzilla as Bug [1825554][6]. I believe that it is much more productive to report bugs than it is to complain about them.

### The better solution

A couple of days after reporting this as a bug, I received a response indicating that systemd is just the manager, and if httpd needs to be ordered after some requirements are met, it needs to be expressed in the unit file. The response pointed me to the **httpd.service** man page. I wish I had found this earlier because it is a better solution than the one I came up with. This solution is explicitly targeted to the prerequisite target unit rather than a somewhat random delay.

From the [**httpd.service** man page][7]:

> **Starting the service at boot time**
>
> The httpd.service and httpd.socket units are _disabled_ by default. To start the httpd service at boot time, run: **systemctl enable httpd.service**. In the default configuration, the httpd daemon will accept connections on port 80 (and, if mod_ssl is installed, TLS connections on port 443) for any configured IPv4 or IPv6 address.
>
> If httpd is configured to depend on any specific IP address (for example, with a "Listen" directive) which may only become available during start-up, or if httpd depends on other services (such as a database daemon), the service _must_ be configured to ensure correct start-up ordering.
>
> For example, to ensure httpd is only running after all configured network interfaces are configured, create a drop-in file (as described above) with the following section:
>
> [Unit]
>  After=network-online.target
>  Wants=network-online.target

I still think this is a bug because it is quite common—at least in my experience—to use a **Listen** directive in the **httpd.conf** configuration file. I have always used **Listen** directives, even on hosts with only a single IP address, and it is clearly necessary on hosts with multiple network interface cards (NICs) and internet protocol (IP) addresses. Adding the lines above to the **/usr/lib/systemd/system/httpd.service** default file would not cause problems for configurations that do not use a **Listen** directive and would prevent this problem for those that do.

In the meantime, I will use the suggested solution.

### Next steps

This article describes a problem I had with starting the Apache HTTPD service on my server. It leads you through the problem determination steps I took and shows how I used systemd to assist. I also covered the circumvention I implemented using systemd and the better solution that followed from my bug report.

As I mentioned at the start, it is very likely that this is the result of a problem with systemd, specifically the configuration for httpd startup. Nevertheless, systemd provided me with the tools to locate the likely source of the problem and to formulate and implement a circumvention. Neither solution really resolves the problem to my satisfaction. For now, the root cause of the problem still exists and must be fixed. If that is simply adding the recommended lines to the **/usr/lib/systemd/system/httpd.service** file, that would work for me.

One of the things I discovered during this is process is that I need to learn more about defining the sequences in which things start. I will explore that in my next article, the fifth in this series.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide][8] [to systemd][8]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][9] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][10]'s [description of systemd][11].
  * [Linux.com][12]'s "More systemd fun" offers more advanced systemd [information and tips][13].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][14]
  * [systemd for Administrators, Part I][15]
  * [systemd for Administrators, Part II][16]
  * [systemd for Administrators, Part III][17]
  * [systemd for Administrators, Part IV][18]
  * [systemd for Administrators, Part V][19]
  * [systemd for Administrators, Part VI][20]
  * [systemd for Administrators, Part VII][21]
  * [systemd for Administrators, Part VIII][22]
  * [systemd for Administrators, Part IX][23]
  * [systemd for Administrators, Part X][24]
  * [systemd for Administrators, Part XI][25]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/systemd-troubleshooting-tool

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://opensource.com/article/20/4/systemd
[3]: https://opensource.com/article/20/4/systemd-startup
[4]: https://opensource.com/article/20/4/understanding-and-using-systemd-units
[5]: https://www.nano-editor.org/
[6]: https://bugzilla.redhat.com/show_bug.cgi?id=1825554
[7]: https://www.mankier.com/8/httpd.service#Description-Starting_the_service_at_boot_time
[8]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[9]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[10]: http://Freedesktop.org
[11]: http://www.freedesktop.org/wiki/Software/systemd
[12]: http://Linux.com
[13]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[14]: http://0pointer.de/blog/projects/systemd.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[18]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[19]: http://0pointer.de/blog/projects/three-levels-of-off.html
[20]: http://0pointer.de/blog/projects/changing-roots
[21]: http://0pointer.de/blog/projects/blame-game.html
[22]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[23]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[24]: http://0pointer.de/blog/projects/instances.html
[25]: http://0pointer.de/blog/projects/inetd.html
