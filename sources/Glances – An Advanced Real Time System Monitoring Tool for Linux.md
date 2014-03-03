Glances – An Advanced Real Time System Monitoring Tool for Linux
================================================================================
Earlier, we’ve written about many Linux [System Monitor Tools][1] that can be used to monitor performance of Linux systems, but we think that, most users prefer the default one that comes with every Linux distributions (**top** command).

The [top command][2] is real time task manager in Linux and the most frequently used system monitoring tool in **GNU/Linux** distributions to find the performance related bottlenecks in system which help us to take corrective actions. It has a nice minimalist interface, comes with few amount of reasonable options that enables us to get a better idea about overall system performance quickly.

However, sometimes its very tricky to find an application/process that consuming lots of system resources is a bit difficult under top. Because top command doesn’t have a ability to highlights programs that are eating too much of **CPU**, **RAM**, other resources.

For keeping such approach, here we are bringing a powerful system monitor program called “**Glances**” that automatically highlights programs that are utilizing highest system resources and providing maximum of information about Linux/Unix server.

### What is Glances? ###

**Glances** is a cross-platform command-line curses-based system monitoring tool written in **Python** language which use the **psutil** library to grab informations from the system. With Glance, we can monitor **CPU, Load Average, Memory, Network Interfaces, Disk I/O, Processes** and **File System** spaces utilization.

Glances is a free tool and licensed under **GPL** to monitory **GNU/Linux** and **FreeBSD** operating systems. There are lots of interesting options available in Glances as well. One of the main features we have seen in Glances is that we can set thresholds (**careful**, **warning** and **critical**) in configuration file and informations will be shown in colors which indicates the bottleneck in the system.

### Glances Features ###

- CPU Informations (user related applications, system core programs and idle programs.
- Total memory Information including RAM, Swap, Free memory etc.
- The average CPU load for the past 1min, 5mins and 15 mins.
- Network Download/Upload rates of network connections.
- Total number of processes, active ones, sleeping processes etc.
- Disk I/O related (read or write) speed details
- Currently mounted devices disk usages.
- Top processes with their CPU/Memory usages, Names and location of application.
- Shows the current date and time at bottom.
- Highlights processes in Red that consumes highest system resources.

Here is an example screen grab of Glances.

![Glances View](http://www.tecmint.com/wp-content/uploads/2014/02/Glances-Monitoring.jpeg)

### Installation of Glances in Linux/Unix Systems ###

Although it’s a very young utility, you can install “**Glances**” in **Red Hat** based systems by turning on [EPEL repository][3] and then run the following command on the terminal.

#### On RHEL/CentOS/Fedora ####

    # yum install -y glances

#### On Debian/Ubuntu/Linux Mint ####

    $ sudo apt-add-repository ppa:arnaud-hartmann/glances-stable
    $ sudo apt-get update
    $ sudo apt-get install glances

### Usage of Glances ###

To start, issue the basic syntax on the terminal.

    # glances

![Glances Preview – Ubuntu 13.10](http://www.tecmint.com/wp-content/uploads/2014/02/Glances-Screen.jpeg)

Press ‘**q**‘ or (‘**ESC**‘ or ‘**Ctrl&C**‘ also works) to quit from Glances terminal. Here, is the another screen grab taken from the **CentOS 6.5** system.

![Glances Preview – CentOS 6.5](http://www.tecmint.com/wp-content/uploads/2014/02/Glances-Screen-Centos.jpeg)

y default, interval time is set to ’**1**‘ second. But you can define the custom interval time while running glances from the terminal.

    # glances -t 2

### Glances Color Codes ###

Meaning of Glances color code:

- GREEN: OK (everything is fine)
- BLUE: CAREFUL (need attention)
- VIOLET: WARNING (alert)
- RED: CRITICAL (critical)

We can set thresholds in configuration file. By default thresholds set is (**careful=50, warning=7**0 and **critical=90**), we can customized as per our needs. The default configuration file is located at ‘**/etc/glances/glances.conf**’.

### Glances Options ###

Besides, several command line options, glances provides many more **hot keys** to find output information while glances is running. Below are the list of several hot keys.

- a – Sort processes automatically
- c – Sort processes by CPU%
- m – Sort processes by MEM%
- p – Sort processes by name
- i – Sort processes by I/O rate
- d – Show/hide disk I/O stats ols
- f – Show/hide file system statshddtemp
- n – Show/hide network stats
- s – Show/hide sensors stats
- y – Show/hide hddtemp stats
- l – Show/hide logs
- b – Bytes or bits for network I/Oools
- w – Delete warning logs
- x – Delete warning and critical logs
- x – Delete warning and critical logs
- 1 – Global CPU or per-CPU stats
- h – Show/hide this help screen
- t – View network I/O as combination
- u – View cumulative network I/O
- q – Quit (Esc and Ctrl-C also work)

### Use Glances on Remote Systems ###

With the Glances, you can even monitor remote systems too. To use ‘**glances**‘ on remote systems, run the ‘**glances -s**‘ (-s enables server/client mode) command on the server.

    # glances -s

    Define the password for the Glances server
    Password: 
    Password (confirm): 
    Glances server is running on 0.0.0.0:61209

**Note** : Once, you issue ‘**glances**‘ command, it will prompt you to define the password for the Glances server. Define the password and hit enter, you see glances running on port **61209**.

Now, go to the remote host and execute the following command to connect to a Glances server by specifying IP address or hostname as shown below. Here ‘**172.16.27.56**‘ is my glances server IP Address.

    # glances -c -P 172.16.27.56

Below are few notable points that user must know while using glances in server/client mode.

    * In server mode, you can set the bind address -B ADDRESS and listening TCP port -p PORT.
    * In client mode, you can set the TCP port of the server -p PORT.
    * Default binding address is 0.0.0.0, but it listens on all network interfaces at port 61209.
    * In server/client mode, limits are set by the server side.
    * You can also define a password to access to the server -P password.

### Conclusion ###

**Glances** is a much resources friendly tool for most users. But if you’re a system administrator who’d like to quickly get overall “idea” about systems by just glancing at command line, then this tool will be must have tool for system administrators.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[2]:http://www.tecmint.com/12-top-command-examples-in-linux/
[3]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/