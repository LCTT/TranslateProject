[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Viewing network bandwidth usage with bmon)
[#]: via: (https://www.networkworld.com/article/3447936/viewing-network-bandwidth-usage-with-bmon.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Viewing network bandwidth usage with bmon
======
Introducing bmon, a monitoring and debugging tool that captures network statistics and makes them easily digestible.
Sandra Henry-Stocker

Bmon is a monitoring and debugging tool that runs in a terminal window and captures network statistics, offering options on how and how much data will be displayed and displayed in a form that is easy to understand.

To check if **bmon** is installed on your system, use the **which** command:

```
$ which bmon
/usr/bin/bmon
```

### Getting bmon

On Debian systems, use **sudo apt-get install bmon** to install the tool.

[][1]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][1]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

For Red Hat and related distributions, you might be able to install with **yum install bmon** or **sudo dnf install bmon**. Alternately, you may have to resort to a more complex install with commands like these that first set up the required **libconfuse** using the root account or sudo:

```
# wget https://github.com/martinh/libconfuse/releases/download/v3.2.2/confuse-3.2.2.zip
# unzip confuse-3.2.2.zip && cd confuse-3.2.2
# sudo PATH=/usr/local/opt/gettext/bin:$PATH ./configure
# make
# make install
# git clone https://github.com/tgraf/bmon.git &&ammp; cd bmon
# ./autogen.sh
# ./configure
# make
# sudo make install
```

The first five lines will install **libconfuse** and the second five will grab and install **bmon** itself.

### Using bmon

The simplest way to start **bmon** is simply to type **bmon** on the command line. Depending on the size of the window you are using, you will be able to see and bring up a variety of data.

The top portion of your display will display stats on your network interfaces – the loopback (lo) and network-accessible (e.g., eth0). If you terminal window has few lines, this is all you may see, and it will look something like this:

[RELATED: 11 pointless but awesome Linux terminal tricks][2]

```
lo bmon 4.0
Interfaces                     x RX bps pps     %x TX bps pps     %
 >lo                           x      4B0      x0     0 0     4B        0
    qdisc none (noqueue) x      0 0      x      0 0
  enp0s25                      x    244B0      x1     0 0   470B        2
    qdisc none (fq_codel)      x      0 0      x      0 0   462B        2
q Increase screen height to see graphical statistics qq


q Press d to enable detailed statistics qq
q Press i to enable additional information qq
 Wed Oct 23 14:36:27 2019 Press ? for help
```

In this example, the network interface is enp0s25. Notice the helpful "Increase screen height" hint below the listed interfaces. Stretch your screen to add sufficient lines (no need to restart bmon) and you will see some graphs:

```
Interfaces                     x RX bps       pps     %x TX bps       pps     %
 >lo                           x      0         0      x      0         0
    qdisc none (noqueue)       x      0         0      x      0         0
  enp0s25                      x    253B        3      x   2.65KiB      6
    qdisc none (fq_codel)      x      0         0      x   2.62KiB      6
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
                              (RX Bytes/second)
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
         1   5   10   15   20   25   30   35   40   45   50   55   60
                              (TX Bytes/second)
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
         1   5   10   15   20   25   30   35   40   45   50   55   60
```

Notice, however, that the graphs are not showing values. This is because it is displaying the loopback **&gt;lo** interface. Arrow your way down to the public network interface and you will see some traffic.

```
Interfaces                     x RX bps       pps     %x TX bps       pps     %
  lo                           x      0         0      x      0         0
    qdisc none (noqueue)       x      0         0      x      0         0
 >enp0s25                      x    151B        2      x   1.61KiB      3
    qdisc none (fq_codel)      x      0         0      x   1.60KiB      3
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
       B                      (RX Bytes/second)
  635.00 ...............................|............................
  529.17 .....|.........................|....|.......................
  423.33 .....|................|..|..|..|..|.|.......................
  317.50 .|..||.|..||.|..|..|..|..|..|..||.||||......................
  211.67 .|..||.|..||.|..||||.||.|||.||||||||||......................
  105.83 ||||||||||||||||||||||||||||||||||||||......................
         1   5   10   15   20   25   30   35   40   45   50   55   60
     KiB                      (TX Bytes/second)
    4.59 .....................................|......................
    3.83 .....................................|......................
    3.06 ....................................||......................
    2.30 ....................................||......................
    1.53 |||..............|..|||.|...|.|||.||||......................
    0.77 ||||||||||||||||||||||||||||||||||||||......................
         1   5   10   15   20   25   30   35   40   45   50   55   60


q Press d to enable detailed statistics qq
q Press i to enable additional information qq
 Wed Oct 23 16:42:06 2019 Press ? for help
```

The change allows you to view a graph displaying network traffic. Note, however, that the default is to display bytes per second. To display bits per second instead, you would start the tool using **bmon -b**

Detailed statistics on network traffic can be displayed if your window is large enough and you press **d**. An example of the stats you will see is displayed below. This display was split into left and right portions because of its width.

##### left side:

```
RX        TX   │                  RX      TX   │
 Bytes          11.26MiB  11.26MiB│ Packets       25.91K  25.91K  │
 Collisions         -         0   │ Compressed        0       0   │
 Errors             0         0   │ FIFO Error        0       0   │
 ICMPv6             2         2   │ ICMPv6 Checksu    0       -   │
 Ip6 Broadcast      0         0   │ Ip6 Broadcast     0       0   │
 Ip6 Delivers       8         -   │ Ip6 ECT(0) Pac    0       -   │
 Ip6 Header Err     0         -   │ Ip6 Multicast     0     152B  │
 Ip6 Non-ECT Pa     8         -   │ Ip6 Reasm/Frag    0       0   │
 Ip6 Reassembly     0         -   │ Ip6 Too Big Er    0       -   │
 Ip6Discards        0         0   │ Ip6Octets       530B    530B  │
 Missed Error       0         -   │ Multicast         -       0   │
 Window Error       -         0   │                               │
```

##### right side

```
│                  RX      TX   │                  RX      TX
│ Abort Error       -       0   │ Carrier Error     -       0
│ CRC Error         0       -   │ Dropped           0       0
│ Frame Error       0       -   │ Heartbeat Erro    -
│ ICMPv6 Errors     0       0   │ Ip6 Address Er    0       -
│ Ip6 CE Packets    0       -   │ Ip6 Checksum E    0       -
│ Ip6 ECT(1) Pac    0       -   │ Ip6 Forwarded     -       0
│ Ip6 Multicast     0       2   │ Ip6 No Route      0       0
│ Ip6 Reasm/Frag    0       0   │ Ip6 Reasm/Frag    0       0
│ Ip6 Truncated     0       -   │ Ip6 Unknown Pr    0       -
│ Ip6Pkts           8       8   │ Length Error      0
│ No Handler        0       -   │ Over Error        0       -
```

Additional information on the network interface will be displayed if you press **i**

##### left side:

```
MTU                        1500 | Flags    broadcast,multicast,up |
Address       00:1d:09:77:9d:08 | Broadcast ff:ff:ff:ff:ff:ff     |
Family                   unspec | Alias                           |
```

##### right side:

```
| Operstate                 up | IfIndex                   2 |
| Mode                 default | TXQlen                 1000 |
| Qdisc               fq_codel |
```

A help menu will appear if you press **?** with brief descriptions of how to move around the screen, select data to be displayed and control the graphs.

To quit **bmon**, you would type **q** and then **y** in response to the prompt to confirm your choice to exit.

Some of the important things to note are that:

  * **bmon** adjusts its display to the size of the terminal window
  * some of the choices shown at the bottom of the display will only function if the window is large enough to accomodate the data
  * the display is updated every second unless you slow this down using the **-R** (e.g., **bmon -R 5)** option



Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3447936/viewing-network-bandwidth-usage-with-bmon.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
