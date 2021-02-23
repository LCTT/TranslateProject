[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage startup using systemd)
[#]: via: (https://opensource.com/article/20/5/manage-startup-systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

Manage startup using systemd
======
Learn how systemd determines the order services start, even though it is
essentially a parallel system.
![Penguin with green background][1]

While setting up a Linux system recently, I wanted to know how to ensure that dependencies for services and other units were up and running before those dependent services and units start. Specifically, I needed more knowledge of how systemd manages the startup sequence, especially in determining the order services are started in what is essentially a parallel system.

You may know that SystemV (systemd's predecessor, as I explained in the [first article][2] in this series) orders the startup sequence by naming the startup scripts with an SXX prefix, where XX is a number from 00 to 99. SystemV then uses the sort order by name and runs each start script in sequence for the desired runlevel.

But systemd uses unit files, which can be created or modified by a sysadmin, to define subroutines for not only initialization but also for regular operation. In the [third article][3] in this series, I explained how to create a mount unit file. In this fifth article, I demonstrate how to create a different type of unit file—a service unit file that runs a program at startup. You can also change certain configuration settings in the unit file and use the systemd journal to view the location of your changes in the startup sequence.

### Preparation

Make sure you have removed `rhgb` and `quiet` from the `GRUB_CMDLINE_LINUX=` line in the `/etc/default/grub` file, as I showed in the [second article][4] in this series. This enables you to observe the Linux startup message stream, which you'll need for some of the experiments in this article.

### The program

In this tutorial, you will create a simple program that enables you to observe a message during startup on the console and later in the systemd journal.

Create the shell program `/usr/local/bin/hello.sh` and add the following content. You want to ensure that the result is visible during startup and that you can easily find it when looking through the systemd journal. You will use a version of the "Hello world" program with some bars around it, so it stands out. Make sure the file is executable and has user and group ownership by root with [700 permissions][5] for security:


```
#!/usr/bin/bash
# Simple program to use for testing startup configurations
# with systemd.
# By David Both
# Licensed under GPL V2
#
echo "###############################"
echo "######### Hello World! ########"
echo "###############################"
```

Run this program from the command line to verify that it works correctly:


```
[root@testvm1 ~]# hello.sh
###############################
######### Hello World! ########
###############################
[root@testvm1 ~]#
```

This program could be created in any scripting or compiled language. The `hello.sh` program could also be located in other places based on the [Linux filesystem hierarchical structure][6] (FHS). I place it in the `/usr/local/bin` directory so that it can be easily run from the command line without having to prepend a path when I type the command. I find that many of the shell programs I create need to be run from the command line and by other tools such as systemd.

### The service unit file

Create the service unit file `/etc/systemd/system/hello.service` with the following content. This file does not need to be executable, but for security, it does need user and group ownership by root and [644][7] or [640][8] permissions:


```
# Simple service unit file to use for testing
# startup configurations with systemd.
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=My hello shell script

[Service]
Type=oneshot
ExecStart=/usr/local/bin/hello.sh

[Install]
WantedBy=multi-user.target
```

Verify that the service unit file performs as expected by viewing the service status. Any syntactical errors will show up here:


```
[root@testvm1 ~]# systemctl status hello.service
● hello.service - My hello shell script
     Loaded: loaded (/etc/systemd/system/hello.service; disabled; vendor preset: disabled)
     Active: inactive (dead)
[root@testvm1 ~]#
```

You can run this "oneshot" service type multiple times without problems. The oneshot type is intended for services where the program launched by the service unit file is the main process and must complete before systemd starts any dependent process.

There are seven service types, and you can find an explanation of each (along with the other parts of a service unit file) in the [systemd.service(5)][9] man page. (You can also find more information in the [resources][10] at the end of this article.)

As curious as I am, I wanted to see what an error might look like. So, I deleted the "o" from the `Type=oneshot` line, so it looked like `Type=neshot`, and ran the command again:


```
[root@testvm1 ~]# systemctl status hello.service
● hello.service - My hello shell script
     Loaded: loaded (/etc/systemd/system/hello.service; disabled; vendor preset: disabled)
     Active: inactive (dead)

May 06 08:50:09 testvm1.both.org systemd[1]: /etc/systemd/system/hello.service:12: Failed to parse service type, ignoring: neshot
[root@testvm1 ~]#
```

These results told me precisely where the error was and made it very easy to resolve the problem.

Just be aware that even after you restore the `hello.service` file to its original form, the error will persist. Although a reboot will clear the error, you should not have to do that, so I went looking for a method to clear out persistent errors like this. I have encountered service errors that require the command `systemctl daemon-reload` to reset an error condition, but that did not work in this case. The error messages that can be fixed with this command always seem to have a statement to that effect, so you know to run it.

It is, however, recommended that you run `systemctl daemon-reload` after changing a unit file or creating a new one. This notifies systemd that the changes have been made, and it can prevent certain types of issues with managing altered services or units. Go ahead and run this command.

After correcting the misspelling in the service unit file, a simple `systemctl restart hello.service` cleared the error. Experiment a bit by introducing some other errors into the `hello.service` file to see what kinds of results you get.

### Start the service

Now you are ready to start the new service and check the status to see the result. Although you probably did a restart in the previous section, you can start or restart a oneshot service as many times as you want since it runs once and then exits.

Go ahead and start the service (as shown below), and then check the status. Depending upon how much you experimented with errors, your results may differ from mine:


```
[root@testvm1 ~]# systemctl start hello.service
[root@testvm1 ~]# systemctl status hello.service
● hello.service - My hello shell script
     Loaded: loaded (/etc/systemd/system/hello.service; disabled; vendor preset: disabled)
     Active: inactive (dead)

May 10 10:37:49 testvm1.both.org hello.sh[842]: ######### Hello World! ########
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
[root@testvm1 ~]#
```

Notice in the status command's output that the systemd messages indicate that the `hello.sh` script started and the service completed. You can also see the output from the script. This display is generated from the journal entries of the most recent invocations of the service. Try starting the service several times, and then run the status command again to see what I mean.

You should also look at the journal contents directly; there are multiple ways to do this. One way is to specify the record type identifier, in this case, the name of the shell script. This shows the journal entries for previous reboots as well as the current session. As you can see, I have been researching and testing for this article for some time now:


```
[root@testvm1 ~]# journalctl -t hello.sh
&lt;snip&gt;
\-- Reboot --
May 08 15:55:47 testvm1.both.org hello.sh[840]: ###############################
May 08 15:55:47 testvm1.both.org hello.sh[840]: ######### Hello World! ########
May 08 15:55:47 testvm1.both.org hello.sh[840]: ###############################
\-- Reboot --
May 08 16:01:51 testvm1.both.org hello.sh[840]: ###############################
May 08 16:01:51 testvm1.both.org hello.sh[840]: ######### Hello World! ########
May 08 16:01:51 testvm1.both.org hello.sh[840]: ###############################
\-- Reboot --
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org hello.sh[842]: ######### Hello World! ########
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
[root@testvm1 ~]#
```

To locate the systemd records for the `hello.service` unit, you can search on systemd. You can use **G+Enter** to page to the end of the journal entries and then scroll back to locate the ones you are interested in. Use the `-b` option to show only the entries for the most recent startup:


```
[root@testvm1 ~]# journalctl -b -t systemd
&lt;snip&gt;
May 10 10:37:49 testvm1.both.org systemd[1]: Starting SYSV: Late init script for live image....
May 10 10:37:49 testvm1.both.org systemd[1]: Started SYSV: Late init script for live image..
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:37:50 testvm1.both.org systemd[1]: Starting D-Bus System Message Bus...
May 10 10:37:50 testvm1.both.org systemd[1]: Started D-Bus System Message Bus.
```

I copied a few other journal entries to give you an idea of what you might find. This command spews all of the journal lines pertaining to systemd—109,183 lines when I wrote this. That is a lot of data to sort through. You can use the pager's search facility, which is usually `less`, or you can use the built-in `grep` feature. The `-g` (or `--grep=`) option uses Perl-compatible regular expressions:


```
[root@testvm1 ~]# journalctl -b -t systemd -g "hello"
[root@testvm1 ~]# journalctl -b -t systemd -g "hello"
\-- Logs begin at Tue 2020-05-05 18:11:49 EDT, end at Sun 2020-05-10 11:01:01 EDT. --
May 10 10:37:49 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
[root@testvm1 ~]#
```

You could use the standard GNU `grep` command, but that would not show the log metadata in the first line.

If you do not want to see just the journal entries pertaining to your `hello` service, you can narrow things down a bit by specifying a time range. For example, I will start with the beginning time of `10:54:00` on my test VM, which was the start of the minute the entries above are from. ****Note that the `--since=` option must be enclosed in quotes and that this option can also be expressed as `-S "<time specification>"`.

The date and time will be different on your host, so be sure to use the timestamps that match the times in your journals:


```
[root@testvm1 ~]# journalctl --since="2020-05-10 10:54:00"
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=54 op=LOAD
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=55 op=LOAD
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd"'
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/"'
May 10 10:56:00 testvm1.both.org NetworkManager[840]: &lt;error&gt; [1589122560.0633] dhcp4 (enp0s3): error -113 dispatching events
May 10 10:56:00 testvm1.both.org NetworkManager[840]: &lt;info&gt;  [1589122560.0634] dhcp4 (enp0s3): state changed bound -&gt; fail
&lt;snip&gt;
```

The `since` specification skips all of the entries before that time, but there are still a lot of entries after that time that you do not need. You can also use the `until` option to trim off the entries that come a bit after the time you are interested in. I want the entire minute when the event occurred and nothing more:


```
[root@testvm1 ~]# journalctl --since="2020-05-10 10:54:35" --until="2020-05-10 10:55:00"
\-- Logs begin at Tue 2020-05-05 18:11:49 EDT, end at Sun 2020-05-10 11:04:59 EDT. --
May 10 10:54:35 testvm1.both.org systemd[1]: Reloading.
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=27 op=UNLOAD
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=26 op=UNLOAD
&lt;snip&gt;
ay 10 10:54:35 testvm1.both.org audit: BPF prog-id=55 op=LOAD
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd&gt;
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/&gt;
lines 1-46/46 (END)
```

If there were a lot of activity in this time period, you could further narrow the resulting data stream using a combination of these options:


```
[root@testvm1 ~]# journalctl --since="2020-05-10 10:54:35" --until="2020-05-10 10:55:00" -t "hello.sh"
\-- Logs begin at Tue 2020-05-05 18:11:49 EDT, end at Sun 2020-05-10 11:10:41 EDT. --
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
[root@testvm1 ~]#
```

Your results should be similar to mine. You can see from this series of experiments that the service executed properly.

### Reboot—finally

So far, you have not rebooted the host where you installed your service. So do that now because, after all, this how-to is about running a program at startup. First, you need to enable the service to launch during the startup sequence:


```
[root@testvm1 ~]# systemctl enable hello.service
Created symlink /etc/systemd/system/multi-user.target.wants/hello.service → /etc/systemd/system/hello.service.
[root@testvm1 ~]#
```

Notice that the link was created in the `/etc/systemd/system/multi-user.target.wants` directory. This is because the service unit file specifies that the service is "wanted" by the `multi-user.target`.

Reboot, and be sure to watch the data stream during the startup sequence to see the "Hello world" message. Wait … you did not see it? Well, neither did I. Although it went by very fast, I did see systemd's message that it was starting the `hello.service`.

Look at the journal since the latest system boot. You can use the `less` pager's search tool to find "Hello" or "hello." I pruned many lines of data, but I left some of the surrounding journal entries, so you can get a feel for what the entries pertaining to your service look like locally:


```
[root@testvm1 ~]# journalctl -b
&lt;snip&gt;
May 10 10:37:49 testvm1.both.org systemd[1]: Listening on SSSD Kerberos Cache Manager responder socket.
May 10 10:37:49 testvm1.both.org systemd[1]: Reached target Sockets.
May 10 10:37:49 testvm1.both.org systemd[1]: Reached target Basic System.
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Modem Manager...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Network Manager...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
May 10 10:37:49 testvm1.both.org systemd[1]: Condition check resulted in Secure Boot DBX (blacklist) updater being skipped.
May 10 10:37:49 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting IPv4 firewall with iptables...
May 10 10:37:49 testvm1.both.org systemd[1]: Started irqbalance daemon.
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=irqbalance comm="systemd" exe="/usr/lib/sy&gt;"'
May 10 10:37:49 testvm1.both.org systemd[1]: Starting LSB: Init script for live image....
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Hardware Monitoring Sensors...
&lt;snip&gt;
May 10 10:37:49 testvm1.both.org systemd[1]: Starting NTP client/server...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting SYSV: Late init script for live image....
May 10 10:37:49 testvm1.both.org systemd[1]: Started SYSV: Late init script for live image..
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=livesys-late comm="systemd" exe="/usr/lib/&gt;"'
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org hello.sh[842]: ######### Hello World! ########
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd&gt;"'
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/&gt;
May 10 10:37:50 testvm1.both.org audit: BPF prog-id=28 op=LOAD
&lt;snip&gt;
```

You can see that systemd started the `hello.service` unit, which ran the `hello.sh` shell script with the output recorded in the journal. If you were able to catch it during boot, you would also have seen the systemd message indicating that it was starting the script and another message indicating that the service succeeded. By looking at the first systemd message in the data stream above, you can see that systemd started your service very soon after reaching the basic system target.

But I would like to see the message displayed at startup as well. There is a way to make that happen: Add the following line to the `[Service]` section of the `hello.service` file:


```
`StandardOutput=journal+console`
```

The `hello.service` file now looks like this:


```
# Simple service unit file to use for testing
# startup configurations with systemd.
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=My hello shell script

[Service]
Type=oneshot
ExecStart=/usr/local/bin/hello.sh
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
```

After adding this line, reboot the system, and watch the data stream as it scrolls up the display during the boot process. You should see the message in its little box. After the startup sequence completes, you can view the journal for the most recent boot and locate the entries for your new service.

### Changing the sequence

Now that your service is working, you can look at where it starts in the startup sequence and experiment with changing it. It is important to remember that systemd's intent is to start as many services and other unit types in parallel within each of the major targets: `basic.target`, `multi-user.target`, and `graphical.target`. You should have just seen the journal entries for the most recent boot, which should look similar to my journal in the output above.

Notice that systemd started your test service soon after it reached the target basic system. This is what you specified in the service unit file in the `WantedBy` line, so it is correct. Before you change anything, list the contents of the `/etc/systemd/system/multi-user.target.wants` directory, and you will see a symbolic (soft) link to the service unit file. The `[Install]` section of the service unit file specifies which target will start the service, and running the `systemctl enable hello.service` command creates the link in the appropriate "target wants" directory:


```
`hello.service -> /etc/systemd/system/hello.service`
```

Certain services need to start during the `basic.target`, and others do not need to start unless the system is starting the `graphical.target`. The service in this experiment will not start in the `basic.target`—assume you do not need it to start until the `graphical.target`. So change the `WantedBy` line:


```
`WantedBy=graphical.target`
```

Be sure to disable the `hello.service` and re-enable it to delete the old link and add the new one in the `graphical.targets.wants` directory. I have noticed that if I forget to disable the service before changing the target that wants it, I can run the `systemctl disable` command, and the links will be removed from both "target wants" directories. Then, I just need to re-enable the service and reboot.

One concern with starting services in the `graphical.target` is that if the host boots to `multi-user.target`, this service will not start automatically. That may be what you want if the service requires a GUI desktop interface, but it also may not be what you want.

Look at the journal entries for the `graphical.target` and the `multi-user.target` using the `-o short-monotonic` option that displays seconds after kernel startup with microsecond precision:


```
`[root@testvm1 ~]# journalctl -b -o short-monotonic`
```

Some results for `multi-user.target`:


```
[   17.264730] testvm1.both.org systemd[1]: Starting My hello shell script...
[   17.265561] testvm1.both.org systemd[1]: Starting IPv4 firewall with iptables...
&lt;SNIP&gt;
[   19.478468] testvm1.both.org systemd[1]: Starting LSB: Init script for live image....
[   19.507359] testvm1.both.org iptables.init[844]: iptables: Applying firewall rules: [  OK  ]
[   19.507835] testvm1.both.org hello.sh[843]: ###############################
[   19.507835] testvm1.both.org hello.sh[843]: ######### Hello World! ########
[   19.507835] testvm1.both.org hello.sh[843]: ###############################
&lt;SNIP&gt;
[   21.482481] testvm1.both.org systemd[1]: hello.service: Succeeded.
[   21.482550] testvm1.both.org smartd[856]: Opened configuration file /etc/smartmontools/smartd.conf
[   21.482605] testvm1.both.org systemd[1]: Finished My hello shell script.
```

And some results for `graphical.target`:


```
[   19.436815] testvm1.both.org systemd[1]: Starting My hello shell script...
[   19.437070] testvm1.both.org systemd[1]: Starting IPv4 firewall with iptables...
&lt;SNIP&gt;
[   19.612614] testvm1.both.org hello.sh[841]: ###############################
[   19.612614] testvm1.both.org hello.sh[841]: ######### Hello World! ########
[   19.612614] testvm1.both.org hello.sh[841]: ###############################
[   19.629455] testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   19.629569] testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   19.629682] testvm1.both.org systemd[1]: hello.service: Succeeded.
[   19.629782] testvm1.both.org systemd[1]: Finished My hello shell script.
```

Despite having the `graphical.target` "want" in the unit file, the `hello.service` unit runs about 19.5 or 19.6 seconds into startup. But `hello.service` starts at about 17.24 seconds in the `multi-user.target` and 19.43 seconds in the graphical target.

What does this mean? Look at the `/etc/systemd/system/default.target` link. The contents of that file show that systemd first starts the default target, `graphical.target`, which then pulls in the `multi-user.target`:


```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes
[root@testvm1 system]#
```

Whether it starts the service with the `graphical.target` or the `multi-user.target`, the `hello.service` unit runs at about 19.5 or 19.6 seconds into startup. Based on this and the journal results (especially the ones using the monotonic output), you know that both of these targets are starting in parallel. Look at one more thing from the journal output:


```
[   28.397330] testvm1.both.org systemd[1]: Reached target Multi-User System.
[   28.397431] testvm1.both.org systemd[1]: Reached target Graphical Interface.
```

Both targets finish at almost the same time. This is consistent because the `graphical.target` pulls in the `multi-user.target` and cannot finish until the `multi.user target` is reached, i.e., finished. But  **hello.service** finishes much earlier than this.

What all this means is that these two targets start up pretty much in parallel. If you explore the journal entries, you will see various targets and services from each of those primary targets starting mostly in parallel. It is clear that the `multi-user.target` does not need to complete before the `graphical.target` starts. Therefore, simply using these primary targets to sequence the startup does not work very well, although it can be useful for ensuring that units are started only when they are needed for the `graphical.target`.

Before continuing, revert the `hello.service` unit file to `WantedBy=multi-user.target` (if it is not already.)

### Ensure a service starts after the network is running

A common startup sequence issue is ensuring that a unit starts after the network is up and running. The Freedesktop.org article [_Running services after the network is up_][11] says there is no real consensus on when a network is considered "up." However, the article provides three options, and the one that meets the needs of a fully operational network is `network-online.target`. Just be aware that `network.target` is used during shutdown rather than startup, so it will not do you any good when you are trying to sequence the startup.

Before making any other changes, be sure to examine the journal and verify that the `hello.service` unit starts well before the network. You can look for the `network-online.target` in the journal to check.

Your service does not really require the network service, but you can use it as an avatar for one that does.

Because setting `WantedBy=graphical.target` does not ensure that the service will be started after the network is up and running, you need another way to ensure that it is. Fortunately, there is an easy way to do this. Add the following two lines to the `[Unit]` section of the `hello.service` unit file:


```
After=network-online.target                                                                            
Wants=network-online.target
```

Both of these entries are required to make this work. Reboot the host and look for the location of entries for your service in the journals:


```
[   26.083121] testvm1.both.org NetworkManager[842]: &lt;info&gt;  [1589227764.0293] device (enp0s3): Activation: successful, device activated.
[   26.083349] testvm1.both.org NetworkManager[842]: &lt;info&gt;  [1589227764.0301] manager: NetworkManager state is now CONNECTED_GLOBAL
[   26.085818] testvm1.both.org NetworkManager[842]: &lt;info&gt;  [1589227764.0331] manager: startup complete
[   26.089911] testvm1.both.org systemd[1]: Finished Network Manager Wait Online.
[   26.090254] testvm1.both.org systemd[1]: Reached target Network is Online.
[   26.090399] testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-wait-online comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? termina&gt;"'
[   26.091991] testvm1.both.org systemd[1]: Starting My hello shell script...
[   26.095864] testvm1.both.org sssd[be[implicit_files]][1007]: Starting up
[   26.290539] testvm1.both.org systemd[1]: Condition check resulted in Login and scanning of iSCSI devices being skipped.
[   26.291075] testvm1.both.org systemd[1]: Reached target Remote File Systems (Pre).
[   26.291154] testvm1.both.org systemd[1]: Reached target Remote File Systems.
[   26.292671] testvm1.both.org systemd[1]: Starting Notify NFS peers of a restart...
[   26.294897] testvm1.both.org systemd[1]: iscsi.service: Unit cannot be reloaded because it is inactive.
[   26.304682] testvm1.both.org hello.sh[1010]: ###############################
[   26.304682] testvm1.both.org hello.sh[1010]: ######### Hello World! ########
[   26.304682] testvm1.both.org hello.sh[1010]: ###############################
[   26.306569] testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   26.306669] testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   26.306772] testvm1.both.org systemd[1]: hello.service: Succeeded.
[   26.306862] testvm1.both.org systemd[1]: Finished My hello shell script.
[   26.584966] testvm1.both.org sm-notify[1011]: Version 2.4.3 starting
```

This confirms that the `hello.service` unit started after the `network-online.target`. This is exactly what you want. You may also have seen the "Hello World" message as it passed by during startup. Notice also that the timestamp is about six seconds later in the startup than it was before.

### The best way to define the start sequence

This article explored Linux startup with systemd and unit files and journals in greater detail and discovered what happens when errors are introduced into the service file. As a sysadmin, I find that this type of experimentation helps me understand the behaviors of a program or service when it breaks, and breaking things intentionally is a good way to learn in a safe environment.

As the experiments in this article proved, just adding a service unit to either the `multi-user.target` or the `graphical.target` does not define its place in the start sequence. It merely determines whether a unit starts as part of a graphical environment or not. The reality is that the startup targets `multi-user.target` and `graphical.target`—and all of their Wants and Requires—start up pretty much in parallel. The best way to ensure that a unit starts in a specific order is to determine the unit it is dependent on and configure the new unit to "Want" and "After" the unit upon which it is dependent.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide to systemd][12]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][13] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][14]'s [description of systemd][15].
  * [Linux.com][16]'s "More systemd fun" offers more advanced systemd [information and tips][17].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][18]
  * [systemd for Administrators, Part I][19]
  * [systemd for Administrators, Part II][20]
  * [systemd for Administrators, Part III][21]
  * [systemd for Administrators, Part IV][22]
  * [systemd for Administrators, Part V][23]
  * [systemd for Administrators, Part VI][24]
  * [systemd for Administrators, Part VII][25]
  * [systemd for Administrators, Part VIII][26]
  * [systemd for Administrators, Part IX][27]
  * [systemd for Administrators, Part X][28]
  * [systemd for Administrators, Part XI][29]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/manage-startup-systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://opensource.com/article/20/4/systemd
[3]: https://opensource.com/article/20/5/systemd-units
[4]: https://opensource.com/article/20/5/systemd-startup
[5]: https://chmodcommand.com/chmod-700/
[6]: https://opensource.com/life/16/10/introduction-linux-filesystems
[7]: https://chmodcommand.com/chmod-644/
[8]: https://chmodcommand.com/chmod-640/
[9]: http://man7.org/linux/man-pages/man5/systemd.service.5.html
[10]: tmp.bYMHU00BHs#resources
[11]: https://www.freedesktop.org/wiki/Software/systemd/NetworkTarget/
[12]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[13]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[14]: http://Freedesktop.org
[15]: http://www.freedesktop.org/wiki/Software/systemd
[16]: http://Linux.com
[17]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[18]: http://0pointer.de/blog/projects/systemd.html
[19]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[20]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[21]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[22]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[23]: http://0pointer.de/blog/projects/three-levels-of-off.html
[24]: http://0pointer.de/blog/projects/changing-roots
[25]: http://0pointer.de/blog/projects/blame-game.html
[26]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[27]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[28]: http://0pointer.de/blog/projects/instances.html
[29]: http://0pointer.de/blog/projects/inetd.html
