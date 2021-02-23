[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use systemd timers instead of cronjobs)
[#]: via: (https://opensource.com/article/20/7/systemd-timers)
[#]: author: (David Both https://opensource.com/users/dboth)

Use systemd timers instead of cronjobs
======
Timers provide finer-grained control of events than cronjobs.
![Team checklist][1]

I am in the process of converting my [cron][2] jobs to systemd timers. I have used timers for a few years, but usually, I learned just enough to perform the task I was working on. While doing research for this [systemd series][3], I learned that systemd timers have some very interesting capabilities.

Like cron jobs, systemd timers can trigger events—shell scripts and programs—at specified time intervals, such as once a day, on a specific day of the month (perhaps only if it is a Monday), or every 15 minutes during business hours from 8am to 6pm. Timers can also do some things that cron jobs cannot. For example, a timer can trigger a script or program to run a specific amount of time after an event such as boot, startup, completion of a previous task, or even the previous completion of the service unit called by the timer.

### System maintenance timers

When Fedora or any systemd-based distribution is installed on a new system, it creates several timers that are part of the system maintenance procedures that happen in the background of any Linux host. These timers trigger events necessary for common maintenance tasks, such as updating system databases, cleaning temporary directories, rotating log files, and more.

As an example, I'll look at some of the timers on my primary workstation by using the `systemctl status *timer` command to list all the timers on my host. The asterisk symbol works the same as it does for file globbing, so this command lists all systemd timer units:


```
[root@testvm1 ~]# systemctl status *timer
● mlocate-updatedb.timer - Updates mlocate database every day
     Loaded: loaded (/usr/lib/systemd/system/mlocate-updatedb.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 00:00:00 EDT; 15h left
   Triggers: ● mlocate-updatedb.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Updates mlocate database every day.

● logrotate.timer - Daily rotation of log files
     Loaded: loaded (/usr/lib/systemd/system/logrotate.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 00:00:00 EDT; 15h left
   Triggers: ● logrotate.service
       Docs: man:logrotate(8)
             man:logrotate.conf(5)

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Daily rotation of log files.

● sysstat-summary.timer - Generate summary of yesterday's process accounting
     Loaded: loaded (/usr/lib/systemd/system/sysstat-summary.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 00:07:00 EDT; 15h left
   Triggers: ● sysstat-summary.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Generate summary of yesterday's process accounting.

● fstrim.timer - Discard unused blocks once a week
     Loaded: loaded (/usr/lib/systemd/system/fstrim.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Mon 2020-06-08 00:00:00 EDT; 3 days left
   Triggers: ● fstrim.service
       Docs: man:fstrim

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Discard unused blocks once a week.

● sysstat-collect.timer - Run system activity accounting tool every 10 minutes
     Loaded: loaded (/usr/lib/systemd/system/sysstat-collect.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Thu 2020-06-04 08:50:00 EDT; 41s left
   Triggers: ● sysstat-collect.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Run system activity accounting tool every 10 minutes.

● dnf-makecache.timer - dnf makecache --timer
     Loaded: loaded (/usr/lib/systemd/system/dnf-makecache.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Thu 2020-06-04 08:51:00 EDT; 1min 41s left
   Triggers: ● dnf-makecache.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started dnf makecache –timer.

● systemd-tmpfiles-clean.timer - Daily Cleanup of Temporary Directories
     Loaded: loaded (/usr/lib/systemd/system/systemd-tmpfiles-clean.timer; static; vendor preset: disabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 08:19:00 EDT; 23h left
   Triggers: ● systemd-tmpfiles-clean.service
       Docs: man:tmpfiles.d(5)
             man:systemd-tmpfiles(8)

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Daily Cleanup of Temporary Directories.
```

Each timer has at least six lines of information associated with it:

  * The first line has the timer's file name and a short description of its purpose.
  * The second line displays the timer's status, whether it is loaded, the full path to the timer unit file, and the vendor preset.
  * The third line indicates its active status, which includes the date and time the timer became active.
  * The fourth line contains the date and time the timer will be triggered next and an approximate time until the trigger occurs.
  * The fifth line shows the name of the event or the service that is triggered by the timer.
  * Some (but not all) systemd unit files have pointers to the relevant documentation. Three of the timers in my virtual machine's output have pointers to documentation. This is a nice (but optional) bit of data.
  * The final line is the journal entry for the most recent instance of the service triggered by the timer.



Depending upon your host, you will probably have a different set of timers.

### Create a timer

Although we can deconstruct one or more of the existing timers to learn how they work, let’s create our own [service unit][4] and a timer unit to trigger it. We will use a fairly trivial example in order to keep this simple. After we have finished this, it will be easier to understand how the other timers work and to determine what they are doing.

First, create a simple service that will run something basic, such as the `free` command. For example, you may want to monitor free memory at regular intervals. Create the following `myMonitor.service` unit file in the `/etc/systemd/system` directory. It does not need to be executable:


```
# This service unit is for testing timer units
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=Logs system statistics to the systemd journal
Wants=myMonitor.timer

[Service]
Type=oneshot
ExecStart=/usr/bin/free

[Install]
WantedBy=multi-user.target
```

This is about the simplest service unit you can create. Now let’s look at the status and test our service unit to ensure that it works as we expect it to.


```
[root@testvm1 system]# systemctl status myMonitor.service
● myMonitor.service - Logs system statistics to the systemd journal
     Loaded: loaded (/etc/systemd/system/myMonitor.service; disabled; vendor preset: disabled)
     Active: inactive (dead)
[root@testvm1 system]# systemctl start myMonitor.service
[root@testvm1 system]#
```

Where is the output? By default, the standard output (`STDOUT`) from programs run by systemd service units is sent to the systemd journal, which leaves a record you can view now or later—up to a point. (I will look at systemd journaling and retention strategies in a future article in this series.) Look at the journal specifically for your service unit and for today only. The `-S` option, which is the short version of `--since`, allows you to specify the time period that the `journalctl` tool should search for entries. This isn't because you don't care about previous results—in this case, there won't be any—it is to shorten the search time if your host has been running for a long time and has accumulated a large number of entries in the journal:


```
[root@testvm1 system]# journalctl -S today -u myMonitor.service
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Thu 2020-06-11 09:40:47 EDT. --
Jun 11 09:12:09 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 11 09:12:09 testvm1.both.org free[377966]:               total        used        free      shared  buff/cache   available
Jun 11 09:12:09 testvm1.both.org free[377966]: Mem:       12635740      522868    11032860        8016     1080012    11821508
Jun 11 09:12:09 testvm1.both.org free[377966]: Swap:       8388604           0     8388604
Jun 11 09:12:09 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
[root@testvm1 system]#
```

A task triggered by a service can be a single program, a series of programs, or a script written in any scripting language. Add another task to the service by adding the following line to the end of the `[Service]` section of the `myMonitor.service` unit file:


```
`ExecStart=/usr/bin/lsblk`
```

Start the service again and check the journal for the results, which should look like this. You should see the results from both commands in the journal:


```
Jun 11 15:42:18 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 11 15:42:18 testvm1.both.org free[379961]:               total        used        free      shared  buff/cache   available
Jun 11 15:42:18 testvm1.both.org free[379961]: Mem:       12635740      531788    11019540        8024     1084412    11812272
Jun 11 15:42:18 testvm1.both.org free[379961]: Swap:       8388604           0     8388604
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: sda             8:0    0  120G  0 disk
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: ├─sda1          8:1    0    4G  0 part /boot
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: └─sda2          8:2    0  116G  0 part
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: sr0            11:0    1 1024M  0 rom
Jun 11 15:42:18 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 11 15:42:18 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
```

Now that you know your service works as expected, create the timer unit file, `myMonitor.timer` in `/etc/systemd/system`, and add the following:


```
# This timer unit is for testing
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=Logs some system statistics to the systemd journal
Requires=myMonitor.service

[Timer]
Unit=myMonitor.service
OnCalendar=*-*-* *:*:00

[Install]
WantedBy=timers.target
```

The `OnCalendar` time specification in the `myMonitor.timer file`, `*-*-* *:*:00`, should trigger the timer to execute the `myMonitor.service` unit every minute. I will explore `OnCalendar` settings a bit later in this article.

For now, observe any journal entries pertaining to running your service when it is triggered by the timer. You could also follow the timer, but following the service allows you to see the results in near real time. Run `journalctl` with the `-f` (follow) option:


```
[root@testvm1 system]# journalctl -S today -f -u myMonitor.service
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT. --
```

Start but do not enable the timer, and see what happens after it runs for a while:


```
[root@testvm1 ~]# systemctl start myMonitor.service
[root@testvm1 ~]#
```

One result shows up right away, and the next ones come at—sort of—one-minute intervals. Watch the journal for a few minutes and see if you notice the same things I did:


```
[root@testvm1 system]# journalctl -S today -f -u myMonitor.service
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT. --
Jun 13 08:39:18 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 13 08:39:18 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 13 08:39:19 testvm1.both.org free[630566]:               total        used        free      shared  buff/cache   available
Jun 13 08:39:19 testvm1.both.org free[630566]: Mem:       12635740      556604    10965516        8036     1113620    11785628
Jun 13 08:39:19 testvm1.both.org free[630566]: Swap:       8388604           0     8388604
Jun 13 08:39:18 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: sda             8:0    0  120G  0 disk
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: ├─sda1          8:1    0    4G  0 part /boot
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: └─sda2          8:2    0  116G  0 part
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: sr0            11:0    1 1024M  0 rom
Jun 13 08:40:46 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 13 08:40:46 testvm1.both.org free[630572]:               total        used        free      shared  buff/cache   available
Jun 13 08:40:46 testvm1.both.org free[630572]: Mem:       12635740      555228    10966836        8036     1113676    11786996
Jun 13 08:40:46 testvm1.both.org free[630572]: Swap:       8388604           0     8388604
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: sda             8:0    0  120G  0 disk
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: ├─sda1          8:1    0    4G  0 part /boot
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: └─sda2          8:2    0  116G  0 part
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: sr0            11:0    1 1024M  0 rom
Jun 13 08:40:46 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 13 08:40:46 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
Jun 13 08:41:46 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 13 08:41:46 testvm1.both.org free[630580]:               total        used        free      shared  buff/cache   available
Jun 13 08:41:46 testvm1.both.org free[630580]: Mem:       12635740      553488    10968564        8036     1113688    11788744
Jun 13 08:41:46 testvm1.both.org free[630580]: Swap:       8388604           0     8388604
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: sda             8:0    0  120G  0 disk
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: ├─sda1          8:1    0    4G  0 part /boot
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: └─sda2          8:2    0  116G  0 part
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: sr0            11:0    1 1024M  0 rom
Jun 13 08:41:47 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 13 08:41:47 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
```

Be sure to check the status of both the timer and the service.

You probably noticed at least two things in the journal. First, you do not need to do anything special to cause the `STDOUT` from the `ExecStart` triggers in the `myMonitor.service` unit to be stored in the journal. That is all part of using systemd for running services. However, it does mean that you might need to be careful about running scripts from a service unit and how much `STDOUT` they generate.

The second thing is that the timer does not trigger exactly on the minute at :00 seconds or even exactly one minute from the previous instance. This is intentional, but it can be overridden if necessary (or if it just offends your sysadmin sensibilities).

The reason for this behavior is to prevent multiple services from triggering at exactly the same time. For example, you can use time specifications such as Weekly, Daily, and more. These shortcuts are all defined to trigger at 00:00:00 hours on the day they are triggered. When multiple timers are specified this way, there is a strong likelihood that they would attempt to start simultaneously.

systemd timers are intentionally designed to trigger somewhat randomly around the specified time to try to prevent simultaneous triggers. They trigger semi-randomly within a time window that starts at the specified trigger time and ends at the specified time plus one minute. This trigger time is maintained at a stable position with respect to all other defined timer units, according to the `systemd.timer` man page. You can see in the journal entries above that the timer triggered immediately when it started and then about 46 or 47 seconds after each minute.

Most of the time, such probabilistic trigger times are fine. When scheduling tasks such as backups to run, so long as they run during off-hours, there will be no problems. A sysadmin can select a deterministic start time, such as 01:05:00 in a typical cron job specification, to not conflict with other tasks, but there is a large range of time values that will accomplish that. A one-minute bit of randomness in a start time is usually irrelevant.

However, for some tasks, exact trigger times are an absolute requirement. For those, you can specify greater trigger time-span accuracy (to within a microsecond) by adding a statement like this to the `Timer` section of the timer unit file:


```
`AccuracySec=1us`
```

Time spans can be used to specify the desired accuracy as well as to define time spans for repeating or one-time events. It recognizes the following units:

  * usec, us, µs
  * msec, ms
  * seconds, second, sec, s
  * minutes, minute, min, m
  * hours, hour, hr, h
  * days, day, d
  * weeks, week, w
  * months, month, M (defined as 30.44 days)
  * years, year, y (defined as 365.25 days)



All the default timers in `/usr/lib/systemd/system` specify a much larger range for accuracy because exact times are not critical. Look at some of the specifications in the system-created timers:


```
[root@testvm1 system]# grep Accur /usr/lib/systemd/system/*timer
/usr/lib/systemd/system/fstrim.timer:AccuracySec=1h
/usr/lib/systemd/system/logrotate.timer:AccuracySec=1h
/usr/lib/systemd/system/logwatch.timer:AccuracySec=12h
/usr/lib/systemd/system/mlocate-updatedb.timer:AccuracySec=24h
/usr/lib/systemd/system/raid-check.timer:AccuracySec=24h
/usr/lib/systemd/system/unbound-anchor.timer:AccuracySec=24h
[root@testvm1 system]#
```

View the complete contents of some of the timer unit files in the `/usr/lib/systemd/system` directory to see how they are constructed.

You do not have to enable the timer in this experiment to activate it at boot time, but the command to do so would be:


```
`[root@testvm1 system]# systemctl enable myMonitor.timer`
```

The unit files you created do not need to be executable. You also did not enable the service unit because it is triggered by the timer. You can still trigger the service unit manually from the command line, should you want to. Try that and observe the journal.

See the man pages for `systemd.timer` and `systemd.time` for more information about timer accuracy, event-time specifications, and trigger events.

### Timer types

systemd timers have other capabilities that are not found in cron, which triggers only on specific, repetitive, real-time dates and times. systemd timers can be configured to trigger based on status changes in other systemd units. For example, a timer might be configured to trigger a specific elapsed time after system boot, after startup, or after a defined service unit activates. These are called monotonic timers. Monotonic refers to a count or sequence that continually increases. These timers are not persistent because they reset after each boot.

Table 1 lists the monotonic timers along with a short definition of each, as well as the `OnCalendar` timer, which is not monotonic and is used to specify future times that may or may not be repetitive. This information is derived from the `systemd.timer` man page with a few minor changes.

Timer | Monotonic | Definition
---|---|---
`OnActiveSec=` | X | This defines a timer relative to the moment the timer is activated.
`OnBootSec=` | X | This defines a timer relative to when the machine boots up.
`OnStartupSec=` | X | This defines a timer relative to when the service manager first starts. For system timer units, this is very similar to `OnBootSec=`, as the system service manager generally starts very early at boot. It's primarily useful when configured in units running in the per-user service manager, as the user service manager generally starts on first login only, not during boot.
`OnUnitActiveSec=` | X | This defines a timer relative to when the timer that is to be activated was last activated.
`OnUnitInactiveSec=` | X | This defines a timer relative to when the timer that is to be activated was last deactivated.
`OnCalendar=` |  | This defines real-time (i.e., wall clock) timers with calendar event expressions. See `systemd.time(7)` for more information on the syntax of calendar event expressions. Otherwise, the semantics are similar to `OnActiveSec=` and related settings. This timer is the one most like those used with the cron service.

_Table 1: systemd timer definitions_

The monotonic timers can use the same shortcut names for their time spans as the `AccuracySec` statement mentioned before, but systemd normalizes those names to seconds. For example, you might want to specify a timer that triggers an event one time, five days after the system boots; that might look like: `OnBootSec=5d`. If the host booted at `2020-06-15 09:45:27`, the timer would trigger at `2020-06-20 09:45:27` or within one minute after.

### Calendar event specifications

Calendar event specifications are a key part of triggering timers at desired repetitive times. Start by looking at some specifications used with the `OnCalendar` setting.

systemd and its timers use a different style for time and date specifications than the format used in crontab. It is more flexible than crontab and allows fuzzy dates and times in the manner of the `at` command. It should also be familiar enough that it will be easy to understand.

The basic format for systemd timers using `OnCalendar=` is `DOW YYYY-MM-DD HH:MM:SS`. DOW (day of week) is optional, and other fields can use an asterisk (*) to match any value for that position. All calendar time forms are converted to a normalized form. If the time is not specified, it is assumed to be 00:00:00. If the date is not specified but the time is, the next match might be today or tomorrow, depending upon the current time. Names or numbers can be used for the month and day of the week. Comma-separated lists of each unit can be specified. Unit ranges can be specified with `..` between the beginning and ending values.

There are a couple interesting options for specifying dates. The Tilde (~) can be used to specify the last day of the month or a specified number of days prior to the last day of the month. The “/” can be used to specify a day of the week as a modifier.

Here are some examples of some typical time specifications used in `OnCalendar` statements.

Calendar event specification | Description
---|---
DOW YYYY-MM-DD HH:MM:SS |
*-*-* 00:15:30 | Every day of every month of every year at 15 minutes and 30 seconds after midnight
Weekly | Every Monday at 00:00:00
Mon *-*-* 00:00:00 | Same as weekly
Mon | Same as weekly
Wed 2020-*-* | Every Wednesday in 2020 at 00:00:00
Mon..Fri 2021-*-* | Every weekday in 2021 at 00:00:00
2022-6,7,8-1,15 01:15:00 | The 1st and 15th of June, July, and August of 2022 at 01:15:00am
Mon *-05~03 | The next occurrence of a Monday in May of any year which is also the 3rd day from the end of the month.
Mon..Fri *-08~04 | The 4th day preceding the end of August for any years in which it also falls on a weekday.
*-05~03/2 | The 3rd day from the end of the month of May and then again two days later. Repeats every year. Note that this expression uses the Tilde (~).
*-05-03/2 | The third day of the month of may and then every 2nd day for the rest of May. Repeats every year. Note that this expression uses the dash (-).

_Table 2: Sample `OnCalendar` event specifications_

### Test calendar specifications

systemd provides an excellent tool for validating and examining calendar time event specifications in a timer. The `systemd-analyze calendar` tool parses a calendar time event specification and provides the normalized form as well as other interesting information such as the date and time of the next "elapse," i.e., match, and the approximate amount of time before the trigger time is reached.

First, look at a date in the future without a time (note that the times for `Next elapse` and `UTC` will differ based on your local time zone):


```
[student@studentvm1 ~]$ systemd-analyze calendar 2030-06-17
  Original form: 2030-06-17                
Normalized form: 2030-06-17 00:00:00        
    Next elapse: Mon 2030-06-17 00:00:00 EDT
       (in UTC): Mon 2030-06-17 04:00:00 UTC
       From now: 10 years 0 months left    
[root@testvm1 system]#
```

Now add a time. In this example, the date and time are analyzed separately as non-related entities:


```
[root@testvm1 system]# systemd-analyze calendar 2030-06-17 15:21:16
  Original form: 2030-06-17                
Normalized form: 2030-06-17 00:00:00        
    Next elapse: Mon 2030-06-17 00:00:00 EDT
       (in UTC): Mon 2030-06-17 04:00:00 UTC
       From now: 10 years 0 months left    

  Original form: 15:21:16                  
Normalized form: *-*-* 15:21:16            
    Next elapse: Mon 2020-06-15 15:21:16 EDT
       (in UTC): Mon 2020-06-15 19:21:16 UTC
       From now: 3h 55min left              
[root@testvm1 system]#
```

To analyze the date and time as a single unit, enclose them together in quotes. Be sure to remove the quotes when using them in the `OnCalendar=` event specification in a timer unit or you will get errors:


```
[root@testvm1 system]# systemd-analyze calendar "2030-06-17 15:21:16"
Normalized form: 2030-06-17 15:21:16        
    Next elapse: Mon 2030-06-17 15:21:16 EDT
       (in UTC): Mon 2030-06-17 19:21:16 UTC
       From now: 10 years 0 months left    
[root@testvm1 system]#
```

Now test the entries in Table 2. I like the last one, especially:


```
[root@testvm1 system]# systemd-analyze calendar "2022-6,7,8-1,15 01:15:00"
  Original form: 2022-6,7,8-1,15 01:15:00
Normalized form: 2022-06,07,08-01,15 01:15:00
    Next elapse: Wed 2022-06-01 01:15:00 EDT
       (in UTC): Wed 2022-06-01 05:15:00 UTC
       From now: 1 years 11 months left
[root@testvm1 system]#
```

Let’s look at one example in which we list the next five elapses for the timestamp expression.


```
[root@testvm1 ~]# systemd-analyze calendar --iterations=5 "Mon *-05~3"
  Original form: Mon *-05~3                
Normalized form: Mon *-05~03 00:00:00      
    Next elapse: Mon 2023-05-29 00:00:00 EDT
       (in UTC): Mon 2023-05-29 04:00:00 UTC
       From now: 2 years 11 months left    
       Iter. #2: Mon 2028-05-29 00:00:00 EDT
       (in UTC): Mon 2028-05-29 04:00:00 UTC
       From now: 7 years 11 months left    
       Iter. #3: Mon 2034-05-29 00:00:00 EDT
       (in UTC): Mon 2034-05-29 04:00:00 UTC
       From now: 13 years 11 months left    
       Iter. #4: Mon 2045-05-29 00:00:00 EDT
       (in UTC): Mon 2045-05-29 04:00:00 UTC
       From now: 24 years 11 months left    
       Iter. #5: Mon 2051-05-29 00:00:00 EDT
       (in UTC): Mon 2051-05-29 04:00:00 UTC
       From now: 30 years 11 months left    
[root@testvm1 ~]#
```

This should give you enough information to start testing your `OnCalendar` time specifications. The `systemd-analyze` tool can be used for other interesting analyses, which I will begin to explore in the next article in this series.

### Summary

systemd timers can be used to perform the same kinds of tasks as the cron tool but offer more flexibility in terms of the calendar and monotonic time specifications for triggering events.

Even though the service unit you created for this experiment is usually triggered by the timer, you can also use the `systemctl start myMonitor.service` command to trigger it at any time. Multiple maintenance tasks can be scripted in a single timer; these can be Bash scripts or Linux utility programs. You can run the service triggered by the timer to run all the scripts, or you can run individual scripts as needed.

I will explore systemd's use of time and time specifications in much more detail in the next article.

I have not yet seen any indication that `cron` and `at` will be deprecated. I hope that does not happen because `at`, at least, is much easier to use for one-off task scheduling than systemd timers.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide to systemd][5]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][6] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][7]'s [description of systemd][8].
  * [Linux.com][9]'s "More systemd fun" offers more advanced systemd [information and tips][10].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][11]
  * [systemd for Administrators, Part I][12]
  * [systemd for Administrators, Part II][13]
  * [systemd for Administrators, Part III][14]
  * [systemd for Administrators, Part IV][15]
  * [systemd for Administrators, Part V][16]
  * [systemd for Administrators, Part VI][17]
  * [systemd for Administrators, Part VII][18]
  * [systemd for Administrators, Part VIII][19]
  * [systemd for Administrators, Part IX][20]
  * [systemd for Administrators, Part X][21]
  * [systemd for Administrators, Part XI][22]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/systemd-timers

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/article/17/11/how-use-cron-linux
[3]: https://opensource.com/users/dboth
[4]: https://opensource.com/article/20/5/manage-startup-systemd
[5]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[6]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[7]: http://Freedesktop.org
[8]: http://www.freedesktop.org/wiki/Software/systemd
[9]: http://Linux.com
[10]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[11]: http://0pointer.de/blog/projects/systemd.html
[12]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[13]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[14]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[16]: http://0pointer.de/blog/projects/three-levels-of-off.html
[17]: http://0pointer.de/blog/projects/changing-roots
[18]: http://0pointer.de/blog/projects/blame-game.html
[19]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[20]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[21]: http://0pointer.de/blog/projects/instances.html
[22]: http://0pointer.de/blog/projects/inetd.html
