Command Line Basics – watch
================================================================================
There are several log files in a Linux system. Keeping an eye on these log files can be one of the important tasks of a Linux System administrator. You can easily view the end of a log file [using the tail command][1]. But if you want to monitor that file all day long it's pretty tedious to enter the tail command every few minutes to check on that log file. You could write a short [script  with an infinite loop][2] to check the file periodically, but it turns out that there is already a program to handle repetitive tasks for you.

### The Linux watch Command ###

The **watch** command in Linux provides a way to handle repetitive tasks. By default **watch** will repeat the command that follows it every two seconds. As you can imagine, watch is a great tool to keep an eye on log files. Here's an example.

    watch tail /var/log/syslog

In order to stop the command execution, just use the standard kill sequence, **[Ctrl]+C**.

![Using the Linux watch command to monitor the syslog](http://tuxtweaks.com/wp-content/uploads/2013/12/Watch_01_wm.png)
*Using the Linux watch command to monitor the syslog*

You can change the time interval by issuing the **-n** switch and specifying the interval in seconds. To check the log file every 10 seconds, try this.

    watch -n 10 tail /var/log/syslog

### The Linux watch Command with a Pipe ###

The **watch** command isn't limited to viewing log files. It can be used to repeat any command you give it. If you have your system [set up to monitor the CPU temperature][3], you can use **watch** to view that with the **sensors** command.

    watch -n 1 sensors

The output on my netbook looks like this:

    acpitz-virtual-0
    Adapter: Virtual device
    temp1:        +45.0°C  (crit = +100.0°C)

I'd like to filter this output to only show the temperature output without all of the rest.

I can use this command to view it one time.

    sensors | grep temp | awk '{ print $2 }'

Keep in mind that the watch command will repeat the first command that is sees. Care must be taken when pipelining one command to the next. This can be managed by placing your command pipeline inside quotes.

    watch -n1 "sensors | grep temp | awk '{ print $2 }'"

![Using the Linux watch command with a pipe](http://tuxtweaks.com/wp-content/uploads/2013/12/Watch_02_wm.png)
*Using the Linux watch command with a pipe*

### Use watch as a clock ###

As you've probably noticed by now, the **watch** command shows the time that the command was executed in the upper right corner of the terminal window. We can use **watch** as a simple clock by passing an empty command line argument. We can just enclose a space in quotes to act as the empty command.

    watch -n 1 " "

So you can see, this gives another meaning for the command name, **watch**. You can use it just like your wrist watch.

So now you know how to use the Linux watch command. What repetitive tasks will you use it to handle?

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2013/12/linux-watch-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2011/02/command-line-basics-head-and-tail/
[2]:http://tuxtweaks.com/2012/01/creating-a-terminal-window-clock/
[3]:http://tuxtweaks.com/2008/08/how-to-control-fan-speeds-in-ubuntu/