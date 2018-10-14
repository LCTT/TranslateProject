translating---cyleft
====

6 Commands To Shutdown And Reboot The Linux System From Terminal
======
Linux administrator performing many tasks in their routine work. The system Shutdown and Reboot task also included in it.

It’s one of the risky task for them because some times it wont come back due to some reasons and they need to spend more time on it to troubleshoot.

These task can be performed through CLI in Linux. Most of the time Linux administrator prefer to perform these kind of tasks via CLI because they are familiar on this.

There are few commands are available in Linux to perform these tasks and user needs to choose appropriate command to perform the task based on the requirement.

All these commands has their own feature and allow Linux admin to use it.

**Suggested Read :**
**(#)** [11 Methods To Find System/Server Uptime In Linux][1]
**(#)** [Tuptime – A Tool To Report The Historical And Statistical Running Time Of Linux System][2]

When the system is initiated for Shutdown or Reboot. It will be notified to all logged-in users and processes. Also, it wont allow any new logins if the time argument is used.

I would suggest you to double check before you perform this action because you need to follow few prerequisites to make sure everything is fine.

Those steps are listed below.

  * Make sure you should have a console access to troubleshoot further in case any issues arise. VMWare access for VMs and IPMI/iLO/iDRAC access for physical servers.
  * You have to create a ticket as per your company procedure either Incident or Change ticket and get approval
  * Take the important configuration files backup and move to other servers for safety
  * Verify the log files (Perform the pre-check)
  * Communicate about your activity with other dependencies teams like DBA, Application, etc
  * Ask them to bring down their Database service or Application service and get a confirmation from them.
  * Validate the same from your end using the appropriate command to double confirm this.
  * Finally reboot the system
  * Verify the log files (Perform the post-check), If everything is good then move to next step. If you found something is wrong then troubleshoot accordingly.
  * If it’s back to up and running, ask the dependencies team to bring up their applications.
  * Monitor for some time, and communicate back to them saying everything is working fine as expected.



This task can be performed using following commands.

  * **`shutdown Command:`** shutdown command used to halt, power-off or reboot the machine.
  * **`halt Command:`** halt command used to halt, power-off or reboot the machine.
  * **`poweroff Command:`** poweroff command used to halt, power-off or reboot the machine.
  * **`reboot Command:`** reboot command used to halt, power-off or reboot the machine.
  * **`init Command:`** init (short for initialization) is the first process started during booting of the computer system.
  * **`systemctl Command:`** systemd is a system and service manager for Linux operating systems.



### Method-1: How To Shutdown And Reboot The Linux System Using Shutdown Command

shutdown command used to power-off or reboot a Linux remote machine or local host. It’s offering
multiple options to perform this task effectively. If the time argument is used, 5 minutes before the system goes down the /run/nologin file is created to ensure that further logins shall not be allowed.

The general syntax is

```
# shutdown [OPTION] [TIME] [MESSAGE]

```

Run the below command to shutdown a Linux machine immediately. It will kill all the processes immediately and will shutdown the system.

```
# shutdown -h now

```

  * **`-h:`** Equivalent to –poweroff, unless –halt is specified.



Alternatively we can use the shutdown command with `halt` option to bring down the machine immediately.

```
# shutdown --halt now
or
# shutdown -H now

```

  * **`-H, --halt:`** Halt the machine.



Alternatively we can use the shutdown command with `poweroff` option to bring down the machine immediately.

```
# shutdown --poweroff now
or
# shutdown -P now

```

  * **`-P, --poweroff:`** Power-off the machine (the default).



Run the below command to shutdown a Linux machine immediately. It will kill all the processes immediately and will shutdown the system.

```
# shutdown -h now

```

  * **`-h:`** Equivalent to –poweroff, unless –halt is specified.



If you run the below commands without time parameter, it will wait for a minute then execute the given command.

```
# shutdown -h
Shutdown scheduled for Mon 2018-10-08 06:42:31 EDT, use 'shutdown -c' to cancel.

[email protected]#
Broadcast message from [email protected] (Mon 2018-10-08 06:41:31 EDT):

The system is going down for power-off at Mon 2018-10-08 06:42:31 EDT!

```

All other logged in users can see a broadcast message in their terminal like below.

```
[[email protected] ~]$
Broadcast message from [email protected] (Mon 2018-10-08 06:41:31 EDT):

The system is going down for power-off at Mon 2018-10-08 06:42:31 EDT!

```

for Halt option.

```
# shutdown -H
Shutdown scheduled for Mon 2018-10-08 06:37:53 EDT, use 'shutdown -c' to cancel.

[email protected]#
Broadcast message from [email protected] (Mon 2018-10-08 06:36:53 EDT):

The system is going down for system halt at Mon 2018-10-08 06:37:53 EDT!

```

for Poweroff option.

```
# shutdown -P
Shutdown scheduled for Mon 2018-10-08 06:40:07 EDT, use 'shutdown -c' to cancel.

[email protected]#
Broadcast message from [email protected] (Mon 2018-10-08 06:39:07 EDT):

The system is going down for power-off at Mon 2018-10-08 06:40:07 EDT!

```

This can be cancelled by hitting `shutdown -c` option on your terminal.

```
# shutdown -c

Broadcast message from [email protected] (Mon 2018-10-08 06:39:09 EDT):

The system shutdown has been cancelled at Mon 2018-10-08 06:40:09 EDT!

```

All other logged in users can see a broadcast message in their terminal like below.

```
[[email protected] ~]$
Broadcast message from [email protected] (Mon 2018-10-08 06:41:35 EDT):

The system shutdown has been cancelled at Mon 2018-10-08 06:42:35 EDT!

```

Add a time parameter, if you want to perform shutdown or reboot in `N` seconds. Here you can add broadcast a custom message to logged-in users. In this example, we are rebooting the machine in another 5 minutes.

```
# shutdown -r +5 "To activate the latest Kernel"
Shutdown scheduled for Mon 2018-10-08 07:13:16 EDT, use 'shutdown -c' to cancel.

[[email protected] ~]#
Broadcast message from [email protected] (Mon 2018-10-08 07:08:16 EDT):

To activate the latest Kernel
The system is going down for reboot at Mon 2018-10-08 07:13:16 EDT!

```

Run the below command to reboot a Linux machine immediately. It will kill all the processes immediately and will reboot the system.

```
# shutdown -r now

```

  * **`-r, --reboot:`** Reboot the machine.



### Method-2: How To Shutdown And Reboot The Linux System Using reboot Command

reboot command used to power-off or reboot a Linux remote machine or local host. Reboot command comes with two useful options.

It will perform a graceful shutdown and restart of the machine (This is similar to your restart option which is available in your system menu).

Run “reboot’ command without any option to reboot Linux machine.

```
# reboot

```

Run the “reboot” command with `-p` option to power-off or shutdown the Linux machine.

```
# reboot -p

```

  * **`-p, --poweroff:`** Power-off the machine, either halt or poweroff commands is invoked.



Run the “reboot” command with `-f` option to forcefully reboot the Linux machine (This is similar to pressing the power button on the CPU).

```
# reboot -f

```

  * **`-f, --force:`** Force immediate halt, power-off, or reboot.



### Method-3: How To Shutdown And Reboot The Linux System Using init Command

init (short for initialization) is the first process started during booting of the computer system.

It will check the /etc/inittab file to decide the Linux run level. Also, allow users to perform shutdown and reboot the Linux machine. There are seven runlevels exist, from zero to six.

**Suggested Read :**
**(#)** [How To Check All Running Services In Linux][3]

Run the below init command to shutdown the system .

```
# init 0

```

  * **`0:`** Halt – to shutdown the system.



Run the below init command to reboot the system .

```
# init 6

```

  * **`6:`** Reboot – to reboot the system.



### Method-4: How To Shutdown The Linux System Using halt Command

halt command used to power-off or shutdown a Linux remote machine or local host.
halt terminates all processes and shuts down the cpu.

```
# halt

```

### Method-5: How To Shutdown The Linux System Using poweroff Command

poweroff command used to power-off or shutdown a Linux remote machine or local host. Poweroff is exactly like halt, but it also turns off the unit itself (lights and everything on a PC). It sends an ACPI command to the board, then to the PSU, to cut the power.

```
# poweroff

```

### Method-6: How To Shutdown And Reboot The Linux System Using systemctl Command

Systemd is a new init system and system manager which was implemented/adapted into all the major Linux distributions over the traditional SysV init systems.

systemd is compatible with SysV and LSB init scripts. It can work as a drop-in replacement for sysvinit system. systemd is the first process get started by kernel and holding PID 1.

**Suggested Read :**
**(#)** [chkservice – A Tool For Managing Systemd Units From Linux Terminal][4]

It’s a parent process for everything and Fedora 15 is the first distribution which was adapted systemd instead of upstart.

systemctl is command line utility and primary tool to manage the systemd daemons/services such as (start, restart, stop, enable, disable, reload & status).

systemd uses .service files Instead of bash scripts (SysVinit uses). systemd sorts all daemons into their own Linux cgroups and you can see the system hierarchy by exploring /cgroup/systemd file.

```
# systemctl halt
# systemctl poweroff
# systemctl reboot
# systemctl suspend
# systemctl hibernate

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/11-methods-to-find-check-system-server-uptime-in-linux/
[2]: https://www.2daygeek.com/tuptime-a-tool-to-report-the-historical-and-statistical-running-time-of-linux-system/
[3]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/
[4]: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/
