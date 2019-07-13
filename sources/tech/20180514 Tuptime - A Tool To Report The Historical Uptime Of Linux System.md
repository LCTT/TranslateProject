Tuptime - A Tool To Report The Historical Uptime Of Linux System
======
Beginning of this month we written an article about system uptime that helps user to check how long your Linux system has been running without downtime? when the system is up and what date. This can be done using 11 methods.

uptime is one of the very famous commands, which everyone use when there is a requirement to check the Linux server uptime.

But it won’t shows historical and statistical running time of Linux system, that’s why tuptime is came to picture.

server uptime is very important when the server running with critical applications such as online portals.

**Suggested Read :** [11 Methods To Find System/Server Uptime In Linux][1]

### What Is tuptime?

[Tuptime][2] is a tool for report the historical and statistical running time of the system, keeping it between restarts. Like uptime command but with more interesting output.

### tuptime Features

  * Count system startups
  * Register first boot time (a.k.a. installation time)
  * Count nicely and accidentally shutdowns
  * Uptime and downtime percentage since first boot time
  * Accumulated system uptime, downtime and total
  * Largest, shortest and average uptime and downtime
  * Current uptime
  * Print formatted table or list with most of the previous values
  * Register used kernels
  * Narrow reports since and/or until a given startup or timestamp
  * Reports in csv



### Prerequisites

Make sure your system should have installed Python3 as a prerequisites. If no, install it using your distribution package manager.

**Suggested Read :** [3 Methods To Install Latest Python3 Package On CentOS 6 System][3]

### How To Install tuptime

Few distributions offer tuptime package but it may be bit older version. I would advise you to install latest available version to avail all the features using the below method.

Clone tuptime repository from github.
```
# git clone https://github.com/rfrail3/tuptime.git

```

Copy executable file from `tuptime/src/tuptime` to `/usr/bin/` and assign 755 permission.
```
# cp tuptime/src/tuptime /usr/bin/tuptime
# chmod 755 /usr/bin/tuptime

```

All scripts, units and related files are provided inside this repo so, copy and past the necessary files in the appropriate location to get full functionality of tuptime utility.

Add tuptime user because it doesn’t run as a daemon, at least, it only need execution when the init manager startup and shutdown the system.
```
# useradd -d /var/lib/tuptime -s /bin/sh tuptime

```

Change owner of the db file.
```
# chown -R tuptime:tuptime /var/lib/tuptime

```

Copy cron file from `tuptime/src/tuptime` to `/usr/bin/` and assign 644 permission.
```
# cp tuptime/src/cron.d/tuptime /etc/cron.d/tuptime
# chmod 644 /etc/cron.d/tuptime

```

Add system service file based on your system initsystem. Use the below command to check if your system is running with systemd or init.
```
# ps -p 1
 PID TTY TIME CMD
 1 ? 00:00:03 systemd

# ps -p 1
 PID TTY TIME CMD
 1 ? 00:00:00 init

```

If is a system with systemd, copy service file and enable it.
```
# cp tuptime/src/systemd/tuptime.service /lib/systemd/system/
# chmod 644 /lib/systemd/system/tuptime.service
# systemctl enable tuptime.service

```

If have upstart system, copy the file:
```
# cp tuptime/src/init.d/redhat/tuptime /etc/init.d/tuptime
# chmod 755 /etc/init.d/tuptime
# chkconfig --add tuptime
# chkconfig tuptime on

```

If have init system, copy the file:
```
# cp tuptime/src/init.d/debian/tuptime /etc/init.d/tuptime
# chmod 755 /etc/init.d/tuptime
# update-rc.d tuptime defaults
# /etc/init.d/tuptime start

```

### How To Use tuptime

Make sure you should run the command with a privileged user. Intially you will get output similar to this.
```
# tuptime
System startups: 1 since 02:48:00 AM 04/12/2018
System shutdowns: 0 ok - 0 bad
System uptime: 100.0 % - 26 days, 5 hours, 31 minutes and 52 seconds
System downtime: 0.0 % - 0 seconds
System life: 26 days, 5 hours, 31 minutes and 52 seconds

Largest uptime: 26 days, 5 hours, 31 minutes and 52 seconds from 02:48:00 AM 04/12/2018
Shortest uptime: 26 days, 5 hours, 31 minutes and 52 seconds from 02:48:00 AM 04/12/2018
Average uptime: 26 days, 5 hours, 31 minutes and 52 seconds

Largest downtime: 0 seconds
Shortest downtime: 0 seconds
Average downtime: 0 seconds

Current uptime: 26 days, 5 hours, 31 minutes and 52 seconds since 02:48:00 AM 04/12/2018

```

### Details:

  * **`System startups:`** Total number of system startups from since to until date. Until is joined if is used in a narrow range.
  * **`System shutdowns:`** Total number of shutdowns done correctly or incorrectly. The separator usually points to the state of last shutdown () bad.
  * **`System uptime:`** Percentage of uptime and time counter.
  * **`System downtime:`** Percentage of downtime and time counter.
  * **`System life:`** Time counter since first startup date until last.
  * **`Largest/Shortest uptime:`** Time counter and date with the largest/shortest uptime register.
  * **`Largest/Shortest downtime:`** Time counter and date with the largest/shortest downtime register.
  * **`Average uptime/downtime:`** Time counter with the average time.
  * **`Current uptime:`** Actual time counter and date since registered boot date.



If you do the same a few days after some reboot, the output may will be more similar to this.
```
# tuptime
System startups: 3 since 02:48:00 AM 04/12/2018
System shutdowns: 0 ok -> 2 bad
System uptime: 97.0 % - 28 days, 4 hours, 6 minutes and 0 seconds
System downtime: 3.0 % - 20 hours, 54 minutes and 22 seconds
System life: 29 days, 1 hour, 0 minutes and 23 seconds

Largest uptime: 26 days, 5 hours, 32 minutes and 57 seconds from 02:48:00 AM 04/12/2018
Shortest uptime: 1 hour, 31 minutes and 12 seconds from 02:17:11 AM 05/11/2018
Average uptime: 9 days, 9 hours, 22 minutes and 0 seconds

Largest downtime: 20 hours, 51 minutes and 58 seconds from 08:20:57 AM 05/08/2018
Shortest downtime: 2 minutes and 24 seconds from 02:14:47 AM 05/11/2018
Average downtime: 10 hours, 27 minutes and 11 seconds

Current uptime: 1 hour, 31 minutes and 12 seconds since 02:17:11 AM 05/11/2018

```

Enumerate as table each startup number, startup date, uptime, shutdown date, end status and downtime. Multiple order options can be combined together.
```
# tuptime -t
No. Startup Date Uptime Shutdown Date End Downtime

1 02:48:00 AM 04/12/2018 26 days, 5 hours, 32 minutes and 57 seconds 08:20:57 AM 05/08/2018 BAD 20 hours, 51 minutes and 58 seconds
2 05:12:55 AM 05/09/2018 1 day, 21 hours, 1 minute and 52 seconds 02:14:47 AM 05/11/2018 BAD 2 minutes and 24 seconds
3 02:17:11 AM 05/11/2018 1 hour, 34 minutes and 33 seconds

```

Enumerate as list each startup number, startup date, uptime, shutdown date, end status and offtime. Multiple order options can be combined together.
```
# tuptime -l
Startup: 1 at 02:48:00 AM 04/12/2018
Uptime: 26 days, 5 hours, 32 minutes and 57 seconds
Shutdown: BAD at 08:20:57 AM 05/08/2018
Downtime: 20 hours, 51 minutes and 58 seconds

Startup: 2 at 05:12:55 AM 05/09/2018
Uptime: 1 day, 21 hours, 1 minute and 52 seconds
Shutdown: BAD at 02:14:47 AM 05/11/2018
Downtime: 2 minutes and 24 seconds

Startup: 3 at 02:17:11 AM 05/11/2018
Uptime: 1 hour, 34 minutes and 36 seconds

```

To print kernel information with tuptime output.
```
# tuptime -k
System startups: 3 since 02:48:00 AM 04/12/2018
System shutdowns: 0 ok -> 2 bad
System uptime: 97.0 % - 28 days, 4 hours, 11 minutes and 25 seconds
System downtime: 3.0 % - 20 hours, 54 minutes and 22 seconds
System life: 29 days, 1 hour, 5 minutes and 47 seconds
System kernels: 1

Largest uptime: 26 days, 5 hours, 32 minutes and 57 seconds from 02:48:00 AM 04/12/2018
...with kernel: Linux-2.6.32-696.23.1.el6.x86_64-x86_64-with-centos-6.9-Final
Shortest uptime: 1 hour, 36 minutes and 36 seconds from 02:17:11 AM 05/11/2018
...with kernel: Linux-2.6.32-696.23.1.el6.x86_64-x86_64-with-centos-6.9-Final
Average uptime: 9 days, 9 hours, 23 minutes and 48 seconds

Largest downtime: 20 hours, 51 minutes and 58 seconds from 08:20:57 AM 05/08/2018
...with kernel: Linux-2.6.32-696.23.1.el6.x86_64-x86_64-with-centos-6.9-Final
Shortest downtime: 2 minutes and 24 seconds from 02:14:47 AM 05/11/2018
...with kernel: Linux-2.6.32-696.23.1.el6.x86_64-x86_64-with-centos-6.9-Final
Average downtime: 10 hours, 27 minutes and 11 seconds

Current uptime: 1 hour, 36 minutes and 36 seconds since 02:17:11 AM 05/11/2018
...with kernel: Linux-2.6.32-696.23.1.el6.x86_64-x86_64-with-centos-6.9-Final

```

Change the date format. By default it’s printed based on system locales.
```
# tuptime -d %d/%m/%y %H:%M:%S
System startups: 3 since 12/04/18
System shutdowns: 0 ok -> 2 bad
System uptime: 97.0 % - 28 days, 4 hours, 15 minutes and 18 seconds
System downtime: 3.0 % - 20 hours, 54 minutes and 22 seconds
System life: 29 days, 1 hour, 9 minutes and 41 seconds

Largest uptime: 26 days, 5 hours, 32 minutes and 57 seconds from 12/04/18
Shortest uptime: 1 hour, 40 minutes and 30 seconds from 11/05/18
Average uptime: 9 days, 9 hours, 25 minutes and 6 seconds

Largest downtime: 20 hours, 51 minutes and 58 seconds from 08/05/18
Shortest downtime: 2 minutes and 24 seconds from 11/05/18
Average downtime: 10 hours, 27 minutes and 11 seconds

Current uptime: 1 hour, 40 minutes and 30 seconds since 11/05/18

```

Print information about the internals of tuptime. It’s good for debugging how it gets the variables.
```
# tuptime -v
INFO:Arguments: {'endst': 0, 'seconds': None, 'table': False, 'csv': False, 'ts': None, 'silent': False, 'order': False, 'since': 0, 'kernel': False, 'reverse': False, 'until': 0, 'db_file': '/var/lib/tuptime/tuptime.db', 'lst': False, 'tu': None, 'date_format': '%X %x', 'update': True}
INFO:Linux system
INFO:uptime = 5773.54
INFO:btime = 1526019431
INFO:kernel = Linux-2.6.32-696.23.1.el6.x86_64-x86_64-with-centos-6.9-Final
INFO:Execution user = 0
INFO:Directory exists = /var/lib/tuptime
INFO:DB file exists = /var/lib/tuptime/tuptime.db
INFO:Last btime from db = 1526019431
INFO:Last uptime from db = 5676.04
INFO:Drift over btime = 0
INFO:System wasn't restarted. Updating db values...
System startups: 3 since 02:48:00 AM 04/12/2018
System shutdowns: 0 ok -> 2 bad
System uptime: 97.0 % - 28 days, 4 hours, 11 minutes and 2 seconds
System downtime: 3.0 % - 20 hours, 54 minutes and 22 seconds
System life: 29 days, 1 hour, 5 minutes and 25 seconds

Largest uptime: 26 days, 5 hours, 32 minutes and 57 seconds from 02:48:00 AM 04/12/2018
Shortest uptime: 1 hour, 36 minutes and 14 seconds from 02:17:11 AM 05/11/2018
Average uptime: 9 days, 9 hours, 23 minutes and 41 seconds

Largest downtime: 20 hours, 51 minutes and 58 seconds from 08:20:57 AM 05/08/2018
Shortest downtime: 2 minutes and 24 seconds from 02:14:47 AM 05/11/2018
Average downtime: 10 hours, 27 minutes and 11 seconds

Current uptime: 1 hour, 36 minutes and 14 seconds since 02:17:11 AM 05/11/2018

```

Print a quick reference of the command line parameters.
```
# tuptime -h
Usage: tuptime [options]

Options:
 -h, --help show this help message and exit
 -c, --csv csv output
 -d DATE_FORMAT, --date=DATE_FORMAT
 date format output
 -f FILE, --filedb=FILE
 database file
 -g, --graceful register a gracefully shutdown
 -k, --kernel print kernel information
 -l, --list enumerate system life as list
 -n, --noup avoid update values
 -o TYPE, --order=TYPE
 order enumerate by []
 -r, --reverse reverse order
 -s, --seconds output time in seconds and epoch
 -S SINCE, --since=SINCE
 restric since this register number
 -t, --table enumerate system life as table
 --tsince=TIMESTAMP restrict since this epoch timestamp
 --tuntil=TIMESTAMP restrict until this epoch timestamp
 -U UNTIL, --until=UNTIL
 restrict until this register number
 -v, --verbose verbose output
 -V, --version show version
 -x, --silent update values into db without output

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/tuptime-a-tool-to-report-the-historical-and-statistical-running-time-of-linux-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/11-methods-to-find-check-system-server-uptime-in-linux/
[2]:https://github.com/rfrail3/tuptime/
[3]:https://www.2daygeek.com/3-methods-to-install-latest-python3-package-on-centos-6-system/
