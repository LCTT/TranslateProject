bmon – A Powerful Network Bandwidth Monitoring and Debugging Tool for Linux
============================================================

bmon is a simple yet powerful, text-based [network monitoring and debugging tool][1] for Unix-like systems, which captures networking related statistics and displays them visually in a human friendly format. It is a reliable and effective real-time bandwidth monitor and rate estimator.

It can read input using an assortment of input modules and presents output in various output modes, including an interactive curses user interface as well as a programmable text output for scripting purposes.

**Suggested Read:** [20 Command Line Tools to Monitor Linux Performance][2]

### Install bmon Bandwidth Monitoring Tool in Linux

Almost all Linux distributions has bmon package in the default repositories and can be easily install from default package manger, but the available version might be little older.

```
$ sudo yum install bmon      [On RHEL/CentOS/Fedora]
$ sudo dnf install bmon      [On Fedora 22+]
$ sudo apt-get install bmon  [On Debian/Ubuntu/Mint]
```

Alternatively, you can get `.rpm` and `.deb` packages for your Linux distribution from [https://pkgs.org/download/bmon][3].

If you wanted to have a most recent version of bmon (i.e version 4.0), you need to build it from source using following commands.

#### On CentOS, RHEL and Fedora

```
$ git clone https://github.com/tgraf/bmon.git
$ cd bmon
$ sudo yum install make libconfuse-devel libnl3-devel libnl-route3-devel ncurses-devel
$ sudo ./autogen.sh
$ sudo./configure
$ sudo make
$ sudo make install
```

#### On Debian, Ubuntu and Linux Mint

```
$ git clone https://github.com/tgraf/bmon.git
$ cd bmon
$ sudo apt-get install build-essential make libconfuse-dev libnl-3-dev libnl-route-3-dev libncurses-dev pkg-config dh-autoreconf
$ sudo ./autogen.sh
$ sudo ./configure
$ sudo make
$ sudo make install
```

### How to Use bmon Bandwidth Monitoring Tool in Linux

Run it as below (for starters: RX means received bytes per second and TX refers to transmitted bytes per second):

```
$ bmon
```

[
 ![bmon - Linux Bandwidth Monitoring](http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Linux-Bandwidth-Monitoring.gif) 
][4]

To view more detailed graphical statistics/information of bandwidth usage, press `d` key and refer screnshot below.

[
 ![bmon - Detailed Bandwidth Statistics](http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Detailed-Bandwidth-Statistics.gif) 
][5]

Press `[Shift + ?]` to view the quick reference below. To exit the interface, press [Shift + ?] again.

[
 ![bmon - Quick Reference](http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Quick-Reference.png) 
][6]

bmon – Quick Reference

To view statistics of a given interface, select it using the `Up` and `Down` arrows. However, to monitor a specific interface only, specify it as an argument on the command line as follows.

**Suggested Read:** [13 Tools to Monitor Linux Performance][7]

The flag `-p` sets a policy defining which network interfaces to display, in the example below, we will be monitoring the `enp1s0` network interface:

```
$ bmon -p enp1s0
```
[
 ![bmon - Monitor Ethernet Bandwidth](http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Monitor-Ethernet-Bandwidth.png) 
][8]

bmon – Monitor Ethernet Bandwidth

To use bit per second instead of bytes per second, use the `-b` flag like so:

```
$ bmon -bp enp1s0
```

We can also define the intervals per second with the `-r` flag as follows:

```
$ bmon -r 5 -p enp1s0
```

### How to Use bmon Input Modules

bmon has a number of input modules that offer statistical data about interfaces, which includes:

1.  netlink – employs the Netlink protocol to collect interface and traffic control statistics from the kernel. This is the default input module.
2.  proc — reads interface statistics from the /proc/net/dev file. It is considered a legacy interface and offered for backwards compatibly. It is a fallback module in case the Netlink interface is not available.
3.  dummy – this is a programmable input module for debugging and testing purposes.
4.  null – disables data collection.

To find additional info about a module, invoke the it with the “help” option set as follows:

```
$ bmon -i netlink:help
```

The next command will invoke bmon with the proc input module enabled:

```
$ bmon -i proc -p enp1s0
```

### How to Use bmon Output Modules

bmon also uses output modules to display or export the statistical data collected by the input modules above, which includes:

1.  curses – this is an interactive curses based text user interface, it offers real time rate estimations and a graphical representation of each attribute. It is the default output mode.
2.  ascii – is a straightforward programmable text output meant for human consumption. It can display list of interfaces, detailed counters and graphs to the console. It is the default fallback output mode when curses is not available.
3.  format – is a fully scriptable output mode, it’s meant for consumption by other programs-meaning we can use its output values at a later time in scripts or programs for analysis and more.
4.  null – this disables output.

To get more info concerning a module, run the it with the “help” flag set like so:

```
$ bmon -o curses:help
```

The command that follows will invoke bmon in ascii output mode:

```
$ bmon -p enp1s0 -o ascii  
```
[
 ![bmon - Ascii Output Mode](http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Ascii-Output-Mode.png) 
][9]

bmon – Ascii Output Mode

We can run the format output module as well, then use the values obtained for scripting or in another program:

```
$ bmon -p enp1s0 -o format
```
[
 ![bmon - Format Output Mode](http://www.tecmint.com/wp-content/uploads/2017/02/bmon-format-output-mode.png) 
][10]

bmon – Format Output Mode

For additional usage info, options and examples, read the bmon man page:

```
$ man bmon 
```

Visit the bmon Github repository: [https://github.com/tgraf/bmon][11].

That’s all for now, test the various features of bmon in different scenarios and share your thoughts about it with us via the comment section below.

--------------------------------------------------------------------------------

译者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/bmon-network-bandwidth-monitoring-debugging-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/bcc-best-linux-performance-monitoring-tools/
[2]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[3]:https://pkgs.org/download/bmon
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Linux-Bandwidth-Monitoring.gif
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Detailed-Bandwidth-Statistics.gif
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Quick-Reference.png
[7]:http://www.tecmint.com/linux-performance-monitoring-tools/
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Monitor-Ethernet-Bandwidth.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/bmon-Ascii-Output-Mode.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/bmon-format-output-mode.png
[11]:https://github.com/tgraf/bmon
