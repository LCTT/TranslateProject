Translating by shipsw


Auditd - Tool for Security Auditing on Linux Server
================================================================================
First of all , we wish all our readers **Happy & Prosperous New YEAR 2015** from our Linoxide team. So lets start this new year explaining about Auditd tool.

Security is one of the main factor that we need to consider. We must maintain it because we don't want someone steal our data. Security includes many things. Audit, is one of it.

On Linux system, we know that we have a tool named **auditd**. This tool is by default exist in most of Linux operating system. What is auditd tool and how to use it? We will cover it below.

### What is auditd? ###

Auditd or audit daemon, is a userspace component to the Linux Auditing System. It’s responsible for writing audit records to the disk.

![](http://blog.linoxide.com/wp-content/uploads/2014/12/what_is_auditd.png)

### Installing auditd ###

On Ubuntu based system , we can use [wajig][1] tool or **apt-get tool** to install auditd.

![](http://blog.linoxide.com/wp-content/uploads/2014/12/install_auditd.png)

Just follow the instruction to get it done. Once it finish it will install some tools related to auditd tool. Here are the tools :

- **auditctl ;** is a tool to control the behaviour of the daemon on the fly, adding rules, etc
- **/etc/audit/audit.rules ;** is the file that contains audit rules
- **aureport ;** is tool to generate and view the audit report
- **ausearch ;** is a tool to search various events
- **auditspd ;** is a tool which can be used to relay event notifications to other applications instead of writing them to disk in the audit log
- **autrace ;** is a command that can be used to trace a process
- **/etc/audit/auditd.conf ;** is the configuration file of auditd tool
- When the first time we install **auditd**, there will be no rules available yet.

We can check it using this command :

    $ sudo auditctl -l

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_no_rules.png)

To add rules on auditd, let’s continue to the section below.

### How to use it ###

#### Audit files and directories access ####

One of the basic need for us to use an audit tool are, how can we know if someone change a file(s) or directories? Using auditd tool, we can do with those commands (please remember, we will need root privileges to configure auditd tool):

**Audit files**

    $ sudo auditctl -w /etc/passwd -p rwxa

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_w_etc_passwd.png)

**With :**

- **-w path ;** this parameter will insert a watch for the file system object at path. On the example above, auditd will wacth /etc/passwd file
- **-p ; **this parameter describes the permission access type that a file system watch will trigger on
- **rwxa ;** are the attributes which bind to -p parameter above. r is read, w is write, x is execute and a is attribute

#### Audit directories ####

To audit directories, we will use a similar command. Let’s take a look at the command below :

    $ sudo auditctl -w /production/

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_w_production.png)

The above command will watch any access to the **/production folder**.

Now, if we run **auditctl -l** command again, we will see that new rules are added.

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_rules.png)

Now let’s see the audit log says.

### Viewing the audit log ###

After rules are added, now we can see how auditd in action. To view audit log, we can use **ausearch** tool.

We already add rule to watch /etc/passwd file. Now we will try to use **ausearch** tool to view the audit log.

    $ sudo ausearch -f /etc/passwd

- **-f** parameter told ausearch to investigate /etc/passwd file
- The result is shown below :
> **time**->Mon Dec 22 09:39:16 2014
> type=PATH msg=audit(1419215956.471:194): item=0 **name="/etc/passwd"** inode=142512 dev=08:01 mode=0100644 ouid=0 ogid=0 rdev=00:00 nametype=NORMAL
> type=CWD msg=audit(1419215956.471:194): **cwd="/home/pungki"**
> type=SYSCALL msg=audit(1419215956.471:194): arch=40000003 **syscall=5** success=yes exit=3 a0=b779694b a1=80000 a2=1b6 a3=b8776aa8 items=1 ppid=2090 pid=2231 **auid=4294967295 uid=1000 gid=1000** euid=0 suid=0 fsuid=0 egid=1000 sgid=1000 fsgid=1000 tty=pts0 ses=4294967295 **comm="sudo" exe="/usr/bin/sudo"** key=(null)

  Now let’s we understand the result.

- **time ;** is when the audit is done
- **name ;** is the object name to be audited
- **cwd ;** is the current directory
- **syscall ;** is related syscall
- **auid ;** is the audit user ID
- **uid and gid ;** are User ID and Group ID of the user who access the file
- **comm ;** is the command that the user is used to access the file
- **exe ;** is the location of the command of comm parameter above
- The above audit log is the original file.

  Next, we are going to add a new user, to see how the auditd record the activity to /etc/passwd file.

> **time->**Mon Dec 22 11:25:23 2014
> type=PATH msg=audit(1419222323.628:510): item=1 **name="/etc/passwd.lock"** inode=143992 dev=08:01 mode=0100600 ouid=0 ogid=0 rdev=00:00 nametype=DELETE
> type=PATH msg=audit(1419222323.628:510): item=0 **name="/etc/"** inode=131073 dev=08:01 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=PARENT
> type=CWD msg=audit(1419222323.628:510): **cwd="/root"**
> type=SYSCALL msg=audit(1419222323.628:510): arch=40000003 **syscall=10** success=yes exit=0 a0=bfc0ceec a1=0 a2=bfc0ceec a3=897764c items=2 ppid=2978 pid=2994 **auid=4294967295 uid=0 gid=0** euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4294967295 **comm="chfn" exe="/usr/bin/chfn"** key=(null)

As we can see above, that on that particular time, **/etc/passwd was accessed** by user root (uid = 0 and gid = 0) **from** directory /root (cwd = /root). The /etc/passwd file was accessed using **chfn** command which located in **/usr/bin/chfn**

If we type **man chfn** on the console, we will see more detail about what is chfn.

![](http://blog.linoxide.com/wp-content/uploads/2014/12/chfn.png)

Now we take a look at another example.

We already told auditd to watch directory /production/ . That is a new directory. So when we try to use ausearch tool at the first time, it found nothing.

![](http://blog.linoxide.com/wp-content/uploads/2014/12/ausearch_production_empty.png)

Next, root account try to list the /production directory using ls command. The second time we use ausearch tool, it will show us some information.

![](http://blog.linoxide.com/wp-content/uploads/2014/12/ausearch_production_ls.png)

> **time->**Mon Dec 22 14:18:28 2014
> type=PATH msg=audit(1419232708.344:527): item=0 **name="/production/"** inode=797104 dev=08:01 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=NORMAL
> type=CWD msg=audit(1419232708.344:527): cwd="/root"
> type=SYSCALL msg=audit(1419232708.344:527): arch=40000003 syscall=295 success=yes exit=3 a0=ffffff9c a1=95761e8 a2=98800 a3=0 items=1 ppid=3033 pid=3444 **auid=4294967295 uid=0 gid=0** euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4294967295 **comm="ls" exe="/bin/ls"** key=(null)

Similar with the previous one, we can determine that **/production folder was looked** by root account (uid=0 gid=0) **using ls command** (comm = ls) and the ls command is **located in /bin/ls folder**.

### Viewing the audit reports ###

Once we put the audit rules, it will run automatically. And after a period of time, we want to see how auditd can help us to track them.

Auditd comes with another tool called **aureport**. As we can guess from its name, **aureport** is a tool that produces summary reports of the audit system log.

We already told auditd to track /etc/passwd before. And a moment after the auditd parameter is developed, the audit.log file is created.

To generate the report of audit, we can use aureport tool. Without any parameters, aureport will generate a summary report of audit activity.

    $ sudo aureport

![](http://blog.linoxide.com/wp-content/uploads/2014/12/aureport_2.png)

As we can see, there are some information available which cover most important area.

On the picture above we see there are **3 times failed authentication**. Using aureport, we can drill down to that information.

We can use this command to look deeper on failed authentication :

    $ sudo aureport -au

![](http://blog.linoxide.com/wp-content/uploads/2014/12/aureport_authentication.png)

As we can see on the picture above, there are two users which at the particular time are failed to authenticated

If we want to see all events related to account modification, we can use -m parameter.

    $ sudo aureport -m

![](http://blog.linoxide.com/wp-content/uploads/2014/12/aureport_m.png)

### Auditd configuration file ###

Previously we already added :

- $ sudo auditctl -w /etc/passwd -p rwxa
- $ sudo auditctl -w /production/
- Now, if we sure the rules are OK, we can add it into

**/etc/audit/audit.rules** to make them permanently.Here’s how to put them into the /etc/audit/audit.rules fileSample of audit rule file

![](http://blog.linoxide.com/wp-content/uploads/2014/12/audit_rules_file.png)

**Then don’t forget to restart auditd daemon.**

    # /etc/init.d/auditd restart

OR

    # service auditd restart

![](http://blog.linoxide.com/wp-content/uploads/2014/12/audit_restart.png)

### Conclusion ###

Auditd is one of the audit tool that available on Linux system. You can explore more detail about auditd and its related tools by reading its manual page. For example, just type **man auditd** to see more detail about auditd. Or type **man ausearch** to see more detail about ausearch tool.

**Please be careful before creating rules**. It will increase your log file size significantly if too much information to record.

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/auditd-tool-security-auditing/

作者：[Pungki Arianto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/pungki/
[1]:http://linoxide.com/tools/wajig-package-management-debian/
