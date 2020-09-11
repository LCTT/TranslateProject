[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ops hacks for sysadmins)
[#]: via: (https://opensource.com/article/20/1/ops-hacks-sysadmins)
[#]: author: (Stephen Bancroft https://opensource.com/users/stevereaver)

5 ops hacks for sysadmins
======
Five tools to help you find the source of your users' IT problems when
you don't know where to start.
![Wratchet set tools][1]

As a sysadmin, every day I am faced with problems I need to solve quickly because there are users and managers who expect things to run smoothly. In a large environment like the one I manage, it's nearly impossible to know all of the systems and products from end to end, so I have to use creative techniques to find the source of the problems and (hopefully) come up with solutions.

This has been my daily experience for well over 20 years, and I love it! Coming to work each day, I never quite know what will happen. So, I have a few quick and dirty tricks that I default to when a problem lands on my lap, but I don't know where to start.

_BUT WAIT!_ Before you jump straight onto the command line, spend some time talking to your users. Yes, it can be tedious, but they will have some good information for you. Keep in mind that users probably don't have as much experience as you have, and you will need to do some interpreting of whatever they say. Try to get a clear picture of what _is_ happening and what _should be_ happening, then describe the fault to yourself in technical language. Be aware that most users don't read what is on the screen in front of them; it's sad but true. Make sure you and the user are reading all of the text to gather as much information as possible. Once you have that together, jump onto the command line with these five tools.

### Telnet

I am starting with a classic. [Telnet][2] was the predecessor to SSH, and, in the olden days, it was used on Unix systems to connect to a remote terminal just like SSH does, but it was not encrypted. Telnet has a very neat and invaluable trick for diagnosing network connectivity issues: you can Telnet into TCP ports that are not reserved for it. To do so, use Telnet like you normally would, but add the TCP port onto the end (**telnet localhost 80,** for instance) to connect to a web server. This enables you to check a server to see if a service is running or if a firewall is blocking it. So, without having the application client or even a login for the application, you can check if the TCP port is responding. If you know how, sometimes you can elicit a response from the server by manually typing into the Telnet prompt and checking the response. Web servers and mail servers are two examples where you can do this.

![Getting a response from a webserver with Telnet][3]

### Tcpdump

The [tcpdump][4] tool lets you inspect what data is being transmitted on the network. Most network protocols are fairly simple and, if you combine tcpdump with a tool like [Wireshark][5], you will have a nice, easy way to browse the traffic that you have captured. In the example below, I am inspecting packets in the bottom window and connecting to TCP port 3260 in the top.

![Inspecting packets in real time with tcpdump][6]

This screenshot shows a real-world use of Wireshark to look at the iSCSI protocol; in this case, I was able to identify that there was a problem with the way our QNAP network-attached storage was configured.

![Using Wireshark to inspect a TCP session][7]

### find

The [find][8] command is simply the best tool if you don't know where to start. In its most simple form, you can use it to "find" files. For example, if I wanted to do a recursive search through all directories and get a list of the conf files, I could enter:


```
`find . -name '*.conf'.`
```

![find command output][9]

But one of find's hidden gems is that you can use it to execute a command against each item it finds. For example, if I wanted to get a long list of each file, I could enter:


```
`find . -name '*.conf' -exec ls -las {} \;`
```

![find command output][10]

Once you know this technique, you can use it in all sorts of creative ways to find, search, and execute programs in specific ways.

### strace

I was introduced to the concept of [strace][11] on Solaris, where it is called truss. It is still as useful today as it was all those years ago. strace allows you to inspect what a process is doing as it runs in real time. Using it is simple; just use the command **ps -ef** and find the process ID that you are interested in. Start strace with **strace -p &lt;pid&gt;**; this will start printing out a whole lot of stuff, which at first looks like junk. But if you look closer, you will see text that you recognize, such as words like **OPEN** and **CLOSE** and filenames. This can lead you in the right direction if you are trying to figure out why a program is not working.

### grep

Leaving the best for last: [grep][12]. This tool is so useful and powerful that I have trouble coming up with a succinct way to describe it. Put simply, it's a search tool, but the way it searches is what makes it so powerful. In problem analysis, I typically grep over a bunch of logs to search for something. A companion command called zgrep does the same thing with zipped files. In the following example, I used **zgrep /var/log/* bancroft** to grep across all the log files to see what I have been up to on the system. I used zgrep because there are zipped files in the directory.

![grep command output][13]

Another great way to use grep is for piping the output of other tools into it; this way, it can be used as a filter of sorts. In the following example, I listed the auth file and grepped for my login to see what I have been doing by using **cat auth.log |grep bancroft**. This can also be written as **grep bancroft auth.log**, but I used the pipe (**|**) to demonstrate the point.

![grep command output][14]

### Other tools to consider

You can do a lot more with these tools, but I hope this brief introduction gives you a window into how to use them to solve the nasty problems that come your way. Another tool worth your attention is [Nmap][15], which I did not include because it is so comprehensive that it needs an entire article (or more) to explain it. Finally, I recommend learning some white hat and hacking techniques; they can be very beneficial when trying to get to the bottom of a problem because they can help you collect information that can be crucial in decision making.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/ops-hacks-sysadmins

作者：[Stephen Bancroft][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevereaver
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://en.wikipedia.org/wiki/Telnet
[3]: https://opensource.com/sites/default/files/uploads/telnet_1.png (Getting a response from a webserver with Telnet)
[4]: https://www.tcpdump.org/
[5]: https://www.wireshark.org/
[6]: https://opensource.com/sites/default/files/uploads/tcpdump_1.png (Inspecting packets in real time with tcpdump)
[7]: https://opensource.com/sites/default/files/uploads/tcpdump_2.png (Using Wireshark to inspect a TCP session)
[8]: https://en.wikipedia.org/wiki/Find_%28Unix%29
[9]: https://opensource.com/sites/default/files/uploads/find_1_0.png (find command output)
[10]: https://opensource.com/sites/default/files/uploads/find_2.png (find command output)
[11]: https://strace.io/
[12]: https://en.wikipedia.org/wiki/Grep
[13]: https://opensource.com/sites/default/files/uploads/grep_1.png (grep command output)
[14]: https://opensource.com/sites/default/files/uploads/grep_2.png (grep command output)
[15]: https://nmap.org/
