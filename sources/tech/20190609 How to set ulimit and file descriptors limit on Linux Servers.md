[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set ulimit and file descriptors limit on Linux Servers)
[#]: via: (https://www.linuxtechi.com/set-ulimit-file-descriptors-limit-linux-servers/)
[#]: author: (Shashidhar Soppin https://www.linuxtechi.com/author/shashidhar/)

How to set ulimit and file descriptors limit on Linux Servers
======

**Introduction: ** Challenges like number of open files in any of the production environment has become common now a day. Since many applications which are Java based and Apache based, are getting installed and configured, which may lead to too many open files, file descriptors etc. If this exceeds the default limit that is set, then one may face access control problems and file opening challenges. Many production environments come to standstill kind of situations because of this.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/ulimit-number-openfiles-linux-server.jpg>

Luckily, we have “ **ulimit** ” command in any of the Linux based server, by which one can see/set/get number of files open status/configuration details. This command is equipped with many options and with this combination one can set number of open files. Following are step-by-step commands with examples explained in detail.

### To see what is the present open file limit in any Linux System

To get open file limit on any Linux server, execute the following command,

```
[root@linuxtechi ~]# cat /proc/sys/fs/file-max
146013
```

The above number shows that user can open ‘146013’ file per user login session.

```
[root@linuxtechi ~]# cat /proc/sys/fs/file-max
149219
[root@linuxtechi ~]# cat /proc/sys/fs/file-max
73906
```

This clearly indicates that individual Linux operating systems have different number of open files. This is based on dependencies and applications which are running in respective systems.

### ulimit command :

As the name suggests, ulimit (user limit) is used to display and set resources limit for logged in user.When we run ulimit command with -a option then it will print all resources’ limit for the logged in user. Now let’s run “ **ulimit -a** ” on Ubuntu / Debian and CentOS systems,

**Ubuntu / Debian System** ,

```
root@linuxtechi ~}$ ulimit -a
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 5731
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 5731
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited
```

**CentOS System**

```
root@linuxtechi ~}$ ulimit -a
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 5901
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 5901
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited
```

As we can be seen here different OS have different limits set. All these limits can be configured/changed using “ulimit” command.

To display the individual resource limit then pass the individual parameter in ulimit command, some of parameters are listed below:

  * ulimit -n –> It will display number of open files limit
  * ulimit -c –> It display the size of core file
  * umilit -u –> It will display the maximum user process limit for the logged in user.
  * ulimit -f –> It will display the maximum file size that the user can have.
  * umilit -m –> It will display the maximum memory size for logged in user.
  * ulimit -v –> It will display the maximum memory size limit



Use below commands check hard and soft limits for number of open file for the logged in user

```
root@linuxtechi ~}$ ulimit -Hn
1048576
root@linuxtechi ~}$ ulimit -Sn
1024
```

### How to fix the problem when limit on number of Maximum Files was reached ?

Let’s assume our Linux server has reached the limit of maximum number of open files and want to extend that limit system wide, for example we want to set 100000 as limit of number of open files.

Use sysctl command to pass fs.file-max parameter to kernel on the fly, execute beneath command as root user,

```
root@linuxtechi~]# sysctl -w fs.file-max=100000
fs.file-max = 100000
```

Above changes will be active until the next reboot, so to make these changes persistent across the reboot, edit the file **/etc/sysctl.conf** and add same parameter,

```
root@linuxtechi~]# vi /etc/sysctl.conf
fs.file-max = 100000
```

save and exit file,

Run the beneath command to make above changes into effect immediately without logout and reboot.

```
root@linuxtechi~]# sysctl -p
```

Now verify whether new changes are in effect or not.

```
root@linuxtechi~]# cat /proc/sys/fs/file-max
100000
```

Use below command to find out how many file descriptors are currently being utilized:

```
[root@linuxtechi ~]# more /proc/sys/fs/file-nr
1216    0       100000
```

Note:- Command “ **sysctl -p** ” is used to commit the changes without reboot and logout.

### Set User level resource limit via limit.conf file

“ **/etc/sysctl.conf** ” file is used to set resource limit system wide but if you want to set resource limit for specific user like Oracle, MariaDB and Apache then this can be achieved via “ **/etc/security/limits.conf** ” file.

Sample Limit.conf is shown below,

```
root@linuxtechi~]# cat /proc/sys/fs/file-max
```

![Limits-conf-linux-part1][1]

![Limits-conf-linux-part2][2]

Let’s assume we want to set hard and soft limit on number of open files for linuxtechi user and for oracle user set hard and soft limit on number of open process, edit the file “/etc/security/limits.conf” and add the following lines

```
# hard limit for max opened files for linuxtechi user
linuxtechi       hard    nofile          4096
# soft limit for max opened files for linuxtechi user
linuxtechi       soft    nofile          1024

# hard limit for max number of process for oracle user
oracle           hard    nproc          8096
# soft limit for max number of process for oracle user
oracle           soft    nproc          4096
```

Save & exit the file.

**Note:** In case you want to put resource limit on a group instead of users, then it can also be possible via limit.conf file, in place of user name , type **@ <Group_Name>** and rest of the items will be same, example is shown below,

```
# hard limit for max opened files for sysadmin group
@sysadmin        hard         nofile            4096
# soft limit for max opened files for sysadmin group
@sysadmin        soft         nofile            1024
```

Verify whether new changes are in effect or not,

```
~]# su - linuxtechi
~]$ ulimit -n -H
4096
~]$ ulimit -n -S
1024

~]# su - oracle
~]$ ulimit -H -u
8096
~]$ ulimit -S -u
4096
```

Note: Other majorly used command is “[ **lsof**][3]” which is used for finding out “how many files are opened currently”. This command is very helpful for admins.

**Conclusion:**

As mentioned in the introduction section “ulimit” command is very powerful and helps one to configure and make sure application installations are smoother without any bottlenecks. This command helps in fixing many of the number of file limitations in Linux based servers.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/set-ulimit-file-descriptors-limit-linux-servers/

作者：[Shashidhar Soppin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/shashidhar/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Limits-conf-linux-part1-1024x677.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Limits-conf-linux-part2-1024x443.jpg
[3]: https://www.linuxtechi.com/lsof-command-examples-linux-geeks/
