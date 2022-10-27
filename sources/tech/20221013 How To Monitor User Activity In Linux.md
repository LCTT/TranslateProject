[#]: subject: "How To Monitor User Activity In Linux"
[#]: via: "https://ostechnix.com/monitor-user-activity-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Monitor User Activity In Linux
======
As a Linux administrator, you need to keep track of all users' activities. When something goes wrong in the server, you can analyze and investigate the users' activities, and try to find the root cause of the problem. There are many ways to **monitor users in Linux**. In this guide, we are going to talk about **GNU accounting utilities** that can be used to **monitor the user activity in Linux**.

### What are Accounting utilities?

The Accounting utilities provides the useful information about system usage, such as connections, programs executed, and utilization of system resources in Linux. These accounting utilities can be installed using **psacct** or **acct** package.

The psacct or acct are same. In RPM-based systems, it is available as psacct, and in DEB-based systems, it is available as acct.

What is the use of psacct or acct utilities? You might wonder. Generally, the user's command line history details will be stored in **.bash_history** file in their $HOME directory. Some users might try to edit, modify or delete the history.

However, the accounting utilities will still be able to retrieve the users activities even though they [cleared their command line history][1] completely. Because, **all process accounting files are owned by root** user, and the normal users can't edit them.

### Install psacct or acct in Linux

The psacct/acct utilities are packaged for popular Linux distributions.

To install psacct in Alpine Linux, run:

```
$ sudo apk add psacct
```

To install acct in Arch Linux and its variants like EndeavourOS and Manjaro Linux, run:

```
$ sudo pacman -S acct
```

On Fedora, RHEL, and its clones like CentOS, AlmaLinux and Rocky Linux, run the following command to install psacct:

```
$ sudo dnf install psacct
```

In RHEL 6 and older versions, you should use `yum` instead of `dnf` to install psacct.

```
$ sudo yum install psacct
```

On Debian, Ubuntu, Linux Mint, install acct using command:

```
$ sudo apt install acct
```

To install acct on openSUSE, run:

```
$ sudo zypper install acct
```

### Start psacct/acct service

To enable and start the psacct service, run:

```
$ sudo systemctl enable psacct
```

```
$ sudo systemctl start psacct
```

To check if psacct service is loaded and active, run:

```
$ sudo systemctl status psacct
```

On DEB-based systems, the acct service will be automatically started after installing it.

You can verify whether acct service is started or not using command:

```
$ sudo systemctl status acct
```

**Sample output:**

```
● acct.service - Kernel process accounting
     Loaded: loaded (/lib/systemd/system/acct.service; enabled; vendor preset: enabled)
     Active: active (exited) since Thu 2022-10-13 16:06:35 IST; 28s ago
       Docs: man:accton(8)
    Process: 3241 ExecStart=/usr/sbin/accton /var/log/account/pacct (code=exited, status=0/SUCCESS)
   Main PID: 3241 (code=exited, status=0/SUCCESS)
        CPU: 879us

Oct 13 16:06:35 ubuntu2204 systemd[1]: Starting Kernel process accounting...
Oct 13 16:06:35 ubuntu2204 accton[3241]: Turning on process accounting, file set to '/var/log/account/pacct'.
Oct 13 16:06:35 ubuntu2204 systemd[1]: Finished Kernel process accounting.
```

> **Download** - [Free eBook: "Nagios Monitoring Handbook"][2]

### Monitor User Activity in Linux using psacct or acct

The psacct (Process accounting) package contains following useful utilities to monitor the user and process activities.

* ac - Displays statistics about how long users have been logged on.
* lastcomm - Displays information about previously executed commands.
* accton - Turns process accounting on or off.
* dump-acct - Transforms the output file from the accton format to a human-readable format.
* dump-utmp - Prints utmp files in human-readable format.
* sa - Summarizes information about previously executed commands.

Let us learn how to monitor the activities of Linux users by using each utility with examples.

#### 1. The ac command examples

The **ac** utility will display the report of connect time in hours. It can tell you how long a user or group of users were connected to the system.

##### 1.1. Display total connect time of all users

```
$ ac
```

This command displays the total connect time of all users in hours.

```
total       52.91
```

![Display total connect time of all users][3]

##### 1.2. Show total connect of all users by day-wise

You can sort this result by day-wise by using **-d** flag as shown below.

```
$ ac -d
```

**Sample output:**

```
May 11	total        4.29
May 13	total        3.23
May 14	total        7.66
May 15	total        8.97
May 16	total        0.52
May 20	total        4.09
May 24	total        1.32
Jun  9	total       15.18
Jun 10	total        2.97
Jun 22	total        2.61
Jul 19	total        1.95
Today	total        0.29
```

![Show total connect of all users by day-wise][4]

##### 1.3. Get total connect time by user-wise

Also, you can display how long each user was connected with the system with **-p** flag.

```
$ ac -p
```

**Sample output:**

```
ostechnix                           52.85
root                                 0.51
total       53.36
```

![Get total connect time by user-wise][5]

##### 1.4. Print total connect time of a specific user

And also, you can display the individual user's total login time as well.

```
$ ac ostechnix
```

**Sample output:**

```
total       52.95
```

##### 1.5. View total connect time of a certain user by day-wise

To display individual user's login time by day-wise, run:

```
$ ac -d ostechnix
```

**Sample output:**

```
May 11	total        4.29
May 13	total        3.23
May 14	total        7.66
May 15	total        8.97
May 16	total        0.01
May 20	total        4.09
May 24	total        1.32
Jun  9	total       15.18
Jun 10	total        2.97
Jun 22	total        2.61
Jul 19	total        1.95
Today	total        0.68
```

![View total connect time of a certain user by day-wise][6]

For more details, refer the man pages.

```
$ man ac
```

#### 2. The lastcomm command examples

The **lastcomm** utility displays the list of previously executed commands. The most recent executed commands will be listed first.

##### 2.1. Display previously executed commands

```
$ lastcomm
```

**Sample output:**

```
systemd-hostnam  S     root     __         0.06 secs Thu Oct 13 17:21
systemd-localed  S     root     __         0.06 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
awk                    ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
uname                  ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
sed                    ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
grep                   ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
grep                   ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
bash              F    ostechni pts/1      0.00 secs Thu Oct 13 17:22
[...]
```

##### 2.2. Print last executed commands of a specific user

The above command displays all user's commands. You can display the previously executed commands by a particular user using command:

```
$ lastcomm ostechnix
```

**Sample output:**

```
less                   ostechni pts/1      0.00 secs Thu Oct 13 17:26
lastcomm               ostechni pts/1      0.00 secs Thu Oct 13 17:26
lastcomm               ostechni pts/1      0.00 secs Thu Oct 13 17:26
lastcomm               ostechni pts/1      0.00 secs Thu Oct 13 17:26
gdbus                X ostechni __         0.00 secs Thu Oct 13 17:24
lastcomm               ostechni pts/1      0.00 secs Thu Oct 13 17:24
ac                     ostechni pts/1      0.00 secs Thu Oct 13 17:24
update-notifier   F    ostechni __         0.00 secs Thu Oct 13 17:23
apport-checkrep        ostechni __         0.06 secs Thu Oct 13 17:23
apport-checkrep        ostechni __         0.05 secs Thu Oct 13 17:23
systemctl              ostechni __         0.00 secs Thu Oct 13 17:23
apt-check              ostechni __         0.81 secs Thu Oct 13 17:23
dpkg                   ostechni __         0.00 secs Thu Oct 13 17:23
ischroot               ostechni __         0.00 secs Thu Oct 13 17:23
dpkg                   ostechni __         0.00 secs Thu Oct 13 17:23
[...]
```

##### 2.3. Print total number of command execution

Also, you can view how many times a particular command has been executed.

```
$ lastcomm apt
```

**Sample output:**

```
apt              S     root     pts/2      0.70 secs Thu Oct 13 16:06
apt               F    root     pts/2      0.00 secs Thu Oct 13 16:06
apt               F    root     pts/2      0.00 secs Thu Oct 13 16:06
```

As you see in the above output, the `apt` command has been executed three times by `root` user.

For more details, refer the man pages.

```
$ man lastcomm
```

#### 3. The sa command examples

The sa utility will summarize the information about previously executed commands.

##### 3.1. Print summary of all commands

```
$ sa
```

**Sample output:**

```
1522    1598.63re       0.23cp         0avio     32712k
    139     570.90re       0.05cp         0avio     36877k   ***other*
     38     163.63re       0.05cp         0avio    111445k   gdbus
      3       0.05re       0.04cp         0avio     12015k   apt-check
     27     264.27re       0.02cp         0avio         0k   kworker/dying*
      2      51.87re       0.01cp         0avio   5310464k   Docker Desktop
      5       0.03re       0.01cp         0avio       785k   snap-confine
      8      59.48re       0.01cp         0avio     85838k   gmain
      5     103.94re       0.01cp         0avio    112720k   dconf worker
     24       3.38re       0.00cp         0avio      2937k   systemd-udevd*
      7       0.01re       0.00cp         0avio     36208k   5
      3       1.51re       0.00cp         0avio      3672k   systemd-timedat
      2       0.00re       0.00cp         0avio     10236k   apport-checkrep
      2       0.01re       0.00cp         0avio   4316160k   ThreadPoolForeg*
      2       0.00re       0.00cp         0avio      8550k   package-data-do
      3       0.79re       0.00cp         0avio      2156k   dbus-daemon
     12       0.00re       0.00cp         0avio     39631k   ffmpeg
[...]
```

##### 3.2. View number of processes and CPU minutes

To print the number of processes and number of CPU minutes on a per-user basis, run `sa` command with `-m` flag:

```
$ sa -m
```

**Sample output:**

```
1525    1598.63re       0.23cp         0avio     32651k
root                                  561     647.23re       0.09cp         0avio      3847k
ostechnix                             825     780.79re       0.08cp         0avio     47788k
gdm                                   117      13.43re       0.06cp         0avio     63715k
colord                                  2      52.01re       0.00cp         0avio     89720k
geoclue                                 1       1.01re       0.00cp         0avio     70608k
jellyfin                               12       0.00re       0.00cp         0avio     39631k
man                                     1       0.00re       0.00cp         0avio      3124k
kernoops                                4     104.12re       0.00cp         0avio      3270k
sshd                                    1       0.05re       0.00cp         0avio      3856k
whoopsie                                1       0.00re       0.00cp         0avio      8552k
```

##### 3.3. Print user id and command name

For each command in the accounting file, print the userid and command name using `-u` flag.

```
$ sa -u
```

**Sample output:**

```
root       0.00 cpu      693k mem      0 io accton          
root       0.00 cpu     3668k mem      0 io systemd-tty-ask 
root       0.00 cpu     3260k mem      0 io systemctl       
root       0.01 cpu     3764k mem      0 io deb-systemd-inv 
root       0.00 cpu      722k mem      0 io acct.postinst   
root       0.00 cpu      704k mem      0 io rm              
root       0.00 cpu      939k mem      0 io cp              
root       0.00 cpu      704k mem      0 io rm              
root       0.00 cpu      951k mem      0 io find            
root       0.00 cpu      911k mem      0 io gzip            
root       0.00 cpu      722k mem      0 io sh              
root       0.00 cpu      748k mem      0 io install-info    
root       0.00 cpu      911k mem      0 io gzip            
[...]
```

For more details, refer the man pages.

```
$ man sa
```

#### 4. The dump-acct and dump-utmp command examples

The **dump-acct** utility displays the output file from the accton format to a human-readable format.

```
$ dump-acct /var/account/pacct
```

dump-utmp displays utmp files in human-readable format.

```
$ dump-utmp /var/run/utmp
```

For more details, refer the man pages.

```
$ man dump-acct
```

```
$ man dump-utmp
```

#### 5. The accton command examples

The accton command will allow you to turn on or turn off accounting.

To turn on process accounting, run:

```
$ accton on
```

To turn it off, run:

```
$ accton off
```

For more details, refer the man pages.

```
$ man accton
```

### Conclusion

Every Linux administrator should be aware of GNU accounting utilities to keep an eye on all users. These utilities will be quite helpful in troubleshooting time.

**Resource:**

* [The GNU Accounting Utilities website][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/monitor-user-activity-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-clear-command-line-history-in-linux/
[2]: https://ostechnix.tradepub.com/free/w_syst04/prgm.cgi
[3]: https://ostechnix.com/wp-content/uploads/2022/10/Display-total-connect-time-of-all-users.png
[4]: https://ostechnix.com/wp-content/uploads/2022/10/Show-total-connect-of-all-users-by-day-wise.png
[5]: https://ostechnix.com/wp-content/uploads/2022/10/Get-total-connect-time-by-user-wise.png
[6]: https://ostechnix.com/wp-content/uploads/2022/10/View-total-connect-time-of-a-certain-user-by-day-wise.png
[7]: https://www.gnu.org/software/acct/manual/accounting.html
