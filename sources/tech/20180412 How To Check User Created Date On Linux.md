How To Check User Created Date On Linux
======
Did you know, how to check user account created date on Linux system? If Yes, what are the ways to do.

Are you getting succeed on this? If yes, how to do?

Basically Linux operating system doesn’t track this information so, what are the alternate ways to get this information.

You might ask why i want to check this?

Yes, in some cases you may want to check this information, at that time this will very helpful for you.

This can be verified using below 7 methods.

  * Using /var/log/secure file
  * Using aureport utility
  * Using .bash_logout file
  * Using chage Command
  * Using useradd Command
  * Using passwd Command
  * Using last Command



### Method-1: Using /var/log/secure file

It stores all security related messages including authentication failures and authorization privileges. It also tracks sudo logins, SSH logins and other errors logged by system security services daemon.
```
# grep prakash /var/log/secure
Apr 12 04:07:18 centos.2daygeek.com useradd[21263]: new group: name=prakash, GID=501
Apr 12 04:07:18 centos.2daygeek.com useradd[21263]: new user: name=prakash, UID=501, GID=501, home=/home/prakash, shell=/bin/bash
Apr 12 04:07:34 centos.2daygeek.com passwd: pam_unix(passwd:chauthtok): password changed for prakash
Apr 12 04:08:32 centos.2daygeek.com sshd[21269]: Accepted password for prakash from 103.5.134.167 port 60554 ssh2
Apr 12 04:08:32 centos.2daygeek.com sshd[21269]: pam_unix(sshd:session): session opened for user prakash by (uid=0)

```

### Method-2: Using aureport utility

The aureport utility allows you to generate summary and columnar reports on the events recorded in Audit log files. By default, all audit.log files in the /var/log/audit/ directory are queried to create the report.
```
# aureport --auth | grep prakash
46. 04/12/2018 04:08:32 prakash 103.5.134.167 ssh /usr/sbin/sshd yes 288
47. 04/12/2018 04:08:32 prakash 103.5.134.167 ssh /usr/sbin/sshd yes 291

```

### Method-3: Using .bash_logout file

The .bash_logout file in your home directory have a special meaning to bash, it provides a way to execute commands when the user logs out of the system.

We can check for the Change date of the .bash_logout file in the user’s home directory. This file is created upon user’s first logout.
```
# stat /home/prakash/.bash_logout
 File: `/home/prakash/.bash_logout'
 Size: 18 Blocks: 8 IO Block: 4096 regular file
Device: 801h/2049d Inode: 256153 Links: 1
Access: (0644/-rw-r--r--) Uid: ( 501/ prakash) Gid: ( 501/ prakash)
Access: 2017-03-22 20:15:00.000000000 -0400
Modify: 2017-03-22 20:15:00.000000000 -0400
Change: 2018-04-12 04:07:18.283000323 -0400

```

### Method-4: Using chage Command

chage stand for change age. This command allows user to mange password expiry information. The chage command changes the number of days between password changes and the date of the last password change.

This information is used by the system to determine when a user must change his/her password. This will work if the user does not change the password since the account creation date.
```
# chage --list prakash
Last password change : Apr 12, 2018
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7

```

### Method-5: Using useradd Command

useradd command is used to create new accounts in Linux. By default, it wont add user creation date and we have to add date using “Comment” option.
```
# useradd -m prakash -c `date +%Y/%m/%d`

# grep prakash /etc/passwd
prakash:x:501:501:2018/04/12:/home/prakash:/bin/bash

```

### Method-6: Using useradd Command

passwd command used assign password to local accounts or users. If the user has not changed his password since the account’s creation date, then you can use the passwd command to find out the date of the last password reset.
```
# passwd -S prakash
prakash PS 2018-04-11 0 99999 7 -1 (Password set, MD5 crypt.)

```

### Method-7: Using last Command

last command reads the file /var/log/wtmp and displays a list of all users logged in (and out) since that file was created.
```
# last | grep "prakash"
prakash pts/2 103.5.134.167 Thu Apr 12 04:08 still logged in

```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-user-created-date-on-linux/

作者：[Prakash Subramanian][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
