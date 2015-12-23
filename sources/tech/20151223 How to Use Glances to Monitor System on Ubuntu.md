How to Use Glances to Monitor System on Ubuntu
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/12/glances_featured.jpg)

Glances is a cross-platform command-line text-based tool to monitor your system. It is written in Python language and uses the `psutil` library to get information from the system. Using it you can monitor CPU, Load Average, Memory, Network Interfaces, Disk I/O, File System spaces utilization, mounted devices, total number of active processes and top processes. There are many interesting options available in Glances. One of the main features is that you can set thresholds (careful, warning and critical) in a configuration file, and information will be shown in colors which indicates the bottleneck in the system.

### Glances Features ###

- the average CPU load
- total number of processes like active, sleeping processes, etc.
- total memory information like RAM, swap, free memory, etc.
- CPU information
- Network download and upload speed of connections
- Disk I/O read/write speed details
- Currently mounted devices’ disk usages
- Top processes with their CPU/memory usages

### Installing Glances ###

Installing Glances on Ubuntu is easy, as it is available on Ubuntu’s repository. You can install Glances by running the following command.

    sudo apt-get install glances

### Usage of Glances ###

After installation has been finished, you can launch Glances by running the following command:

    glances

You will see an output like the following:

![glances monitor system output](https://www.maketecheasier.com/assets/uploads/2015/12/glances_output1.png)

Press ESC or “Ctrl + C” to quit from the Glances terminal.

By default, the interval time is set to 1 second, but you can define the custom interval time while running glances from the terminal.

To set the interval time to 5 seconds, run the following command:

    glances -t 5

### Glances Color Codes ###

Glances color code meanings:

- `GREEN` : OK
- `BLUE` : CAREFUL
- `VIOLET` : ALERT
- `RED` : CRITICAL

By default, Glances thresholds set is: careful=50, warning=70, critical=90. You can customize the threshold by using the default configuration file glances.conf located at the “/etc/glances/” directory.

### Glances Options ###

Glances provides sever so hot keys to find output information while it is running.

Below are the list of several hot keys.

- `m` : sort processes by MEM%
- `p` : sort processes by name
- `c` : sort processes by CPU%
- `d` : show/hide disk I/O stats
- `a` : sort processes automatically
- `f` : show/hide file system statshddtemp
- `i` : sort processes by I/O rate
- `s` : show/hide sensors’ stats
- `y` : show/hide hddtemp stats
- `l` : show/hide logs
- `n` : show/hide network stats
- `x` : delete warning and critical logs
- `h` : show/hide help screen
- `q` : quit
- `w` : delete warning logs

### Use Glances to Monitor Remote Systems ###

You can also monitor remote systems using Glances. To use it on a remote system, use the following command:

    glances -s

You will see an output like the following:

![glances monitor remote system server](https://www.maketecheasier.com/assets/uploads/2015/12/glances_server.png)

You will see Glances running on port 61209.

Now, go to the remote machine and execute the following command to connect to a Glances server by specifying the IP address as shown below. For example, 192.168.1.10 is your Glances server IP address.

    glances -c -P 192.168.1.10

### Conclusion ###

Glances is a very useful tool for every Linux system administrator. Using it, you can easily monitor your Linux system in less time. Feel free to comment if you have any questions.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/glances-monitor-system-ubuntu/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
