[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 handy command-line internet speed tests)
[#]: via: (https://opensource.com/article/20/1/internet-speed-tests)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

3 handy command-line internet speed tests
======
Check your internet and network speeds with these three open source
tools.
![Old train][1]

Being able to validate your network connection speed puts you in control of your computer. Three open source tools that enable you to check your internet and network speeds at the command line are Speedtest, Fast, and iPerf.

### Speedtest

[Speedtest][2] is an old favorite. It's implemented in Python, packaged in Apt, and also available with pip. You can use it as a command-line tool or within a Python script.

Install it with:


```
`sudo apt install speedtest-cli`
```

or


```
`sudo pip3 install speedtest-cli`
```

Then run it with the command **speedtest**:


```
$ speedtest
Retrieving speedtest.net configuration...
Testing from CenturyLink (65.128.194.58)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by CenturyLink (Cambridge, UK) [20.49 km]: 31.566 ms
Testing download speed................................................................................
Download: 68.62 Mbit/s
Testing upload speed......................................................................................................
Upload: 10.93 Mbit/s
```

This gives you your download and upload Internet speeds. It's fast and scriptable, so you can run it regularly and save the output to a file or database for a record of your network speed over time.

### Fast

[Fast][3] is a service provided by Netflix. Its web interface is located at [Fast.com][4], and it has a command-line interface available through npm:


```
`npm install --global fast-cli`
```

Both the website and command-line utility provide the same basic interface: it's a simple-as-possible speed test:


```
$ fast

     82 Mbps ↓
```

The command returns your Internet download speed. To get your upload speed, use the **-u** flag:


```
$ fast -u

   ⠧ 80 Mbps ↓ / 8.2 Mbps ↑
```

### iPerf

[iPerf][5] is a great way to test your LAN speed (rather than your Internet speed, as the two previous tools do). Debian, Raspbian, and Ubuntu users can install it with **apt**:


```
`sudo apt install iperf`
```

It's also available for Mac and Windows.

Once it's installed, you need two machines on the same network to use it (both must have iPerf installed). Designate one as the server.

Obtain the IP address of the server machine:


```
`ip addr show | grep inet.*brd`
```

Your local IP address (assuming an IPv4 local network) starts with either **192.168** or **10**. Take note of the IP address so you can use it on the other machine (the one designated as the client).

Start **iperf** on the server:


```
`iperf -s`
```

This waits for incoming connections from clients. Designate another machine as a client and run this command, substituting the IP address of your server machine for the sample one here:


```
`iperf -c 192.168.1.2`
```

![iPerf][6]

It only takes a few seconds to do a test, and it returns the transfer size and calculated bandwidth. I ran a few tests from my PC and my laptop, using my home server as the server machine. I recently put in Cat6 Ethernet around my house, so I get up to 1Gbps speeds from my wired connections but much lower speeds on WiFi connections.

![iPerf][7]

­You may notice where it recorded 16Gbps. That was me using the server to test itself, so it's just testing how fast it can write to its own disk. The server has hard disk drives, which are only 16Gbps, but my desktop PC gets 46Gbps, and my (newer) laptop gets over 60Gbps, as they have solid-state drives.

![iPerf][8]

### Wrapping up

Knowing the speed of your network is a rather straightforward task with these tools. If you prefer to script or run these from the command line for the fun of it, any of the above projects will get you there. If you're after specific point-to-point metrics, iPerf is your go-to.

What other tools do you use to measure the network at home? Share in the comments.

* * *

_This article was originally published on Ben Nuttall's [Tooling blog][9] and is used here with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/internet-speed-tests

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/train-plane-speed-big-machine.png?itok=f377dXKs (Old train)
[2]: https://github.com/sivel/speedtest-cli
[3]: https://github.com/sindresorhus/fast-cli
[4]: https://fast.com/
[5]: https://iperf.fr/
[6]: https://opensource.com/sites/default/files/uploads/iperf.png (iPerf)
[7]: https://opensource.com/sites/default/files/uploads/iperf2.png (iPerf)
[8]: https://opensource.com/sites/default/files/uploads/iperf3.png (iPerf)
[9]: https://tooling.bennuttall.com/command-line-speedtest-tools/
