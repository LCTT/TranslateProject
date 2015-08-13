FSSlc translating

RHCSA Series: Process Management in RHEL 7: Boot, Shutdown, and Everything in Between – Part 5
================================================================================
We will start this article with an overall and brief revision of what happens since the moment you press the Power button to turn on your RHEL 7 server until you are presented with the login screen in a command line interface.

![RHEL 7 Boot Process](http://www.tecmint.com/wp-content/uploads/2015/03/RHEL-7-Boot-Process.png)

Linux Boot Process

**Please note that:**

1. the same basic principles apply, with perhaps minor modifications, to other Linux distributions as well, and
2. the following description is not intended to represent an exhaustive explanation of the boot process, but only the fundamentals.

### Linux Boot Process ###

1. The POST (Power On Self Test) initializes and performs hardware checks.

2. When the POST finishes, the system control is passed to the first stage boot loader, which is stored on either the boot sector of one of the hard disks (for older systems using BIOS and MBR), or a dedicated (U)EFI partition.

3. The first stage boot loader then loads the second stage boot loader, most usually GRUB (GRand Unified Boot Loader), which resides inside /boot, which in turn loads the kernel and the initial RAM–based file system (also known as initramfs, which contains programs and binary files that perform the necessary actions needed to ultimately mount the actual root filesystem).

4. We are presented with a splash screen that allows us to choose an operating system and kernel to boot:

![RHEL 7 Boot Screen](http://www.tecmint.com/wp-content/uploads/2015/03/RHEL-7-Boot-Screen.png)

Boot Menu Screen

5. The kernel sets up the hardware attached to the system and once the root filesystem has been mounted, launches process with PID 1, which in turn will initialize other processes and present us with a login prompt.

Note: That if we wish to do so at a later time, we can examine the specifics of this process using the [dmesg command][1] and filtering its output using the tools that we have explained in previous articles of this series.

![Login Screen and Process PID](http://www.tecmint.com/wp-content/uploads/2015/03/Login-Screen-Process-PID.png)

Login Screen and Process PID

In the example above, we used the well-known ps command to display a list of current processes whose parent process (or in other words, the process that started them) is systemd (the system and service manager that most modern Linux distributions have switched to) during system startup:

    # ps -o ppid,pid,uname,comm --ppid=1

Remember that the -o flag (short for –format) allows you to present the output of ps in a customized format to suit your needs using the keywords specified in the STANDARD FORMAT SPECIFIERS section in man ps.

Another case in which you will want to define the output of ps instead of going with the default is when you need to find processes that are causing a significant CPU and / or memory load, and sort them accordingly:

    # ps aux --sort=+pcpu              # Sort by %CPU (ascending)
    # ps aux --sort=-pcpu              # Sort by %CPU (descending)
    # ps aux --sort=+pmem              # Sort by %MEM (ascending)
    # ps aux --sort=-pmem              # Sort by %MEM (descending)
    # ps aux --sort=+pcpu,-pmem        # Combine sort by %CPU (ascending) and %MEM (descending)

![http://www.tecmint.com/wp-content/uploads/2015/03/ps-command-output.png](http://www.tecmint.com/wp-content/uploads/2015/03/ps-command-output.png)

Customize ps Command Output

### An Introduction to SystemD ###

Few decisions in the Linux world have caused more controversies than the adoption of systemd by major Linux distributions. Systemd’s advocates name as its main advantages the following facts:

Read Also: [The Story Behind ‘init’ and ‘systemd’][2]

1. Systemd allows more processing to be done in parallel during system startup (as opposed to older SysVinit, which always tends to be slower because it starts processes one by one, checks if one depends on another, and then waits for daemons to launch so more services can start), and

2. It works as a dynamic resource management in a running system. Thus, services are started when needed (to avoid consuming system resources if they are not being used) instead of being launched without a valid reason during boot.

3. Backwards compatibility with SysVinit scripts.

Systemd is controlled by the systemctl utility. If you come from a SysVinit background, chances are you will be familiar with:

- the service tool, which -in those older systems- was used to manage SysVinit scripts, and
- the chkconfig utility, which served the purpose of updating and querying runlevel information for system services.
- shutdown, which you must have used several times to either restart or halt a running system.

The following table shows the similarities between the use of these legacy tools and systemctl:

注：表格
<table cellspacing="0" border="0">
<colgroup width="237"></colgroup>
<colgroup width="256"></colgroup>
<colgroup width="1945"></colgroup>
<tbody>
<tr>
<td align="left" height="25" bgcolor="#B7B7B7" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial; font-size: small;">Legacy tool</span></b></td>
<td align="left" bgcolor="#B7B7B7" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial; font-size: small;">Systemctl equivalent</span></b></td>
<td align="left" bgcolor="#B7B7B7" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial; font-size: small;">Description</span></b></td>
</tr>
<tr class="alt">
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service name start</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl start name</span></td>
<td align="left" style="border: 1px solid #000000;">Start name (where name is a service)</td>
</tr>
<tr>
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service name stop</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl stop name</span></td>
<td align="left" style="border: 1px solid #000000;">Stop name</td>
</tr>
<tr class="alt">
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service name condrestart</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl try-restart name</span></td>
<td align="left" style="border: 1px solid #000000;">Restarts name (if it’s already running)</td>
</tr>
<tr>
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service name restart</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl restart name</span></td>
<td align="left" style="border: 1px solid #000000;">Restarts name</td>
</tr>
<tr class="alt">
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service name reload</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl reload name</span></td>
<td align="left" style="border: 1px solid #000000;">Reloads the configuration for name</td>
</tr>
<tr>
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service name status</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl status name</span></td>
<td align="left" style="border: 1px solid #000000;">Displays the current status of name</td>
</tr>
<tr class="alt">
<td align="left" height="23" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">service &ndash;status-all</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">Displays the status of all current services</span></td>
</tr>
<tr>
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">chkconfig name on</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl enable name</span></td>
<td align="left" style="border: 1px solid #000000;">Enable name to run on startup as specified in the unit file (the file to which the symlink points). The process of enabling or disabling a service to start automatically on boot consists in adding or removing symbolic links inside the /etc/systemd/system directory.</td>
</tr>
<tr class="alt">
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">chkconfig name off</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl disable name</span></td>
<td align="left" style="border: 1px solid #000000;">Disables name to run on startup as specified in the unit file (the file to which the symlink points)</td>
</tr>
<tr>
<td align="left" height="21" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">chkconfig &ndash;list name</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl is-enabled name</span></td>
<td align="left" style="border: 1px solid #000000;">Verify whether name (a specific service) is currently enabled</td>
</tr>
<tr class="alt">
<td align="left" height="23" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">chkconfig &ndash;list</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl &ndash;type=service</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">Displays all services and tells whether they are enabled or disabled</span></td>
</tr>
<tr>
<td align="left" height="23" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">shutdown -h now</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl poweroff</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">Power-off the machine (halt)</span></td>
</tr>
<tr class="alt">
<td align="left" height="23" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">shutdown -r now</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Courier New;">systemctl reboot</span></td>
<td align="left" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">Reboot the system</span></td>
</tr>
</tbody>
</table>

Systemd also introduced the concepts of units (which can be either a service, a mount point, a device, or a network socket) and targets (which is how systemd manages to start several related process at the same time, and can be considered -though not equal- as the equivalent of runlevels in SysVinit-based systems.

### Summing Up ###

Other tasks related with process management include, but may not be limited to, the ability to:

**1. Adjust the execution priority as far as the use of system resources is concerned of a process:**

This is accomplished through the renice utility, which alters the scheduling priority of one or more running processes. In simple terms, the scheduling priority is a feature that allows the kernel (present in versions => 2.6) to allocate system resources as per the assigned execution priority (aka niceness, in a range from -20 through 19) of a given process.

The basic syntax of renice is as follows:

    # renice [-n] priority [-gpu] identifier

In the generic command above, the first argument is the priority value to be used, whereas the other argument can be interpreted as process IDs (which is the default setting), process group IDs, user IDs, or user names. A normal user (other than root) can only modify the scheduling priority of a process he or she owns, and only increase the niceness level (which means taking up less system resources).

![Renice Process in Linux](http://www.tecmint.com/wp-content/uploads/2015/03/Process-Scheduling-Priority.png)

Process Scheduling Priority

**2. Kill (or interrupt the normal execution) of a process as needed:**

In more precise terms, killing a process entitles sending it a signal to either finish its execution gracefully (SIGTERM=15) or immediately (SIGKILL=9) through the [kill or pkill commands][3].

The difference between these two tools is that the former is used to terminate a specific process or a process group altogether, while the latter allows you to do the same based on name and other attributes.

In addition, pkill comes bundled with pgrep, which shows you the PIDs that will be affected should pkill be used. For example, before running:

    # pkill -u gacanepa

It may be useful to view at a glance which are the PIDs owned by gacanepa:

    # pgrep -l -u gacanepa

![Find PIDs of User](http://www.tecmint.com/wp-content/uploads/2015/03/Find-PIDs-of-User.png)

Find PIDs of User

By default, both kill and pkill send the SIGTERM signal to the process. As we mentioned above, this signal can be ignored (while the process finishes its execution or for good), so when you seriously need to stop a running process with a valid reason, you will need to specify the SIGKILL signal on the command line:

    # kill -9 identifier               # Kill a process or a process group
    # kill -s SIGNAL identifier        # Idem
    # pkill -s SIGNAL identifier       # Kill a process by name or other attributes 

### Conclusion ###

In this article we have explained the basics of the boot process in a RHEL 7 system, and analyzed some of the tools that are available to help you with managing processes using common utilities and systemd-specific commands.

Note that this list is not intended to cover all the bells and whistles of this topic, so feel free to add your own preferred tools and commands to this article using the comment form below. Questions and other comments are also welcome.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-boot-process-and-process-management/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/dmesg-commands/
[2]:http://www.tecmint.com/systemd-replaces-init-in-linux/
[3]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
