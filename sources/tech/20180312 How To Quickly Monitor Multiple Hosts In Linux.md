How To Quickly Monitor Multiple Hosts In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/rwho-1-720x340.png)
There are plenty of monitoring tools out there to monitor local and remote Linux systems. One fine example is [**Cockpit**][1]. Those tools, however, are either bit complicated to install and use, at least for the newbie admins. The newbie admin might need to spend some time to figure out how to configure those tools to monitor the systems. If you want a quick and dirty way to monitor multiple hosts at a time in your local area network, you might need to check **“rwho”** tool. It will instantly and quickly will monitor the local and remote systems as soon as you install rwho utility. You configure nothing! All you have to do is to install “rwho” tool on the systems that you want to monitor.

Please don’t think of rwho as a feature-rich, and complete monitoring tool. This is just a simple tool that monitors only the **uptime** , **load** and **logged in users** of a remote system. Using “rwho” utility, we can find who is logged in on which computer, a list of monitored computers with uptime (time since last reboot), how many users are logged in and the load averages for the past 1, 5, and 15 minutes. Nothing more! Nothing less! Also, it will only monitor the systems that are in the same subnet. hence, it is ideal for small and home office network.

### Monitor Multiple Hosts In Linux

Let me explain how rwho works. Every system that uses rwho on the network will broadcast information about itself. The other computers can access these information using rwhod-daemon. So, every computer on the network must have rwho installed. Also, the rwhod-port (e.g. Port 513/UDP) must be allowed through your firewall/router in-order to distribute or access the information of other hosts.

Alright, let us install it.

I tested in on Ubuntu 16.04 LTS server. rwho is available in the default repositories, so we can install it using the APT package manager like below.
```
$ sudo apt-get install rwho

```

On RPM based systems such as CentOS, Fedora, RHEL, use this command to install it:
```
$ sudo yum install rwho

```

Make sure you have allowed the rwhod-port 513 if you are behind a firewall/router. Also, verify if the rwhod-daemon is running or not using command:

$ sudo systemctl status rwhod

If it is not started already, run the following commands to enable and start rwhod service:
```
$ sudo systemctl enable rwhod
$ sudo systemctl start rwhod

```

Now, it is time to monitor the systems. Run the following command to find out who is logged on which computer:
```
$ rwho
ostechni ostechnix:pts/5 Mar 12 17:41
root server:pts/0 Mar 12 17:42

```

As you can see, currently there are two systems on my local area network. The local system user is **ostechnix** (Ubuntu 16.04 LTS) and remote system’s user is **root** (CentOS 7). As you might guessed already, rwho is similar to “who” command, but it will monitor the remote systems too.

And, we can find the uptime of all running systems on the network, using command:
```
$ ruptime
ostechnix up 2:17, 1 user, load 0.09, 0.03, 0.01
server up 1:54, 1 user, load 0.00, 0.01, 0.05

```

Here, ruptime (similar to “uptime” command) displays the total uptime of my Ubuntu (local) and CentOS (remote) systems. Got it? Great! Here is the sample screenshot from my Ubuntu 16.04 LTS system:

![][3]

You can find the information about all other machines in the local area network in the following location:
```
$ ls /var/spool/rwho/
whod.ostechnix whod.server

```

This is a small, yet very useful to find out who is logged in on which computer and the uptime along with system load details.

**Suggested read:**

Please be mindful that this method has one serious loophole. Since information about every computer is broadcasted over the net, everyone in the subnet could potentially get this information. It is okay normally but on the other side this can be a unwanted side-effect when information about the network is distributed to non-authorized users. So, It is strongly recommended to use it in a trusted and protected local area network.

For more details, refer man pages.
```
$ man rwho

```

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cockpit-monitor-administer-linux-servers-via-web-browser/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/rwho.png
[4]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=reddit (Click to share on Reddit)
[5]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=twitter (Click to share on Twitter)
[6]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=facebook (Click to share on Facebook)
[7]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=google-plus-1 (Click to share on Google+)
[8]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=linkedin (Click to share on LinkedIn)
[9]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=pocket (Click to share on Pocket)
[10]:https://api.whatsapp.com/send?text=How%20To%20Quickly%20Monitor%20Multiple%20Hosts%20In%20Linux%20https%3A%2F%2Fwww.ostechnix.com%2Fhow-to-quickly-monitor-multiple-hosts-in-linux%2F (Click to share on WhatsApp)
[11]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=telegram (Click to share on Telegram)
[12]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=email (Click to email this to a friend)
[13]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/#print (Click to print)
