Translting by MjSeven


6 Easy Ways to Check User Name And Other Information in Linux
======
This is very basic topic, everyone knows how to find a user information in Linux using **id** command. Some of the users are filtering a user information from **/etc/passwd** file.

We also using these commands to get a user information.

You may ask, Why are you discussing this basic topic? Even i thought the same, there is no other ways except this two but we are having some good alternatives too.

Those are giving more detailed information compared with those two, which is very helpful for newbies.

This is one of the basic command which helps admin to find out a user information in Linux. Everything is file in Linux, even user information were stored in a file.

**Suggested Read :**
**(#)** [How To Check User Created Date On Linux][1]
**(#)** [How To Check Which Groups A User Belongs To On Linux][2]
**(#)** [How To Force User To Change Password On Next Login In Linux][3]

All the users are added in `/etc/passwd` file. This keep user name and other related details. Users details will be stored in /etc/passwd file when you created a user in Linux. The passwd file contain each/every user details as a single line with seven fields.

We can find a user information using the below six methods.

  * `id :`Print user and group information for the specified username.
  * `getent :`Get entries from Name Service Switch libraries.
  * `/etc/passwd file :`The /etc/passwd file contain each/every user details as a single line with seven fields.
  * `finger :`User information lookup program
  * `lslogins :`lslogins display information about known users in the system
  * `compgen :`compgen is bash built-in command and it will show all available commands for the user.



### 1) Using id Command

id stands for identity. print real and effective user and group IDs. To print user and group information for the specified user, or for the current user.
```
# id daygeek
uid=1000(daygeek) gid=1000(daygeek) groups=1000(daygeek),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),118(lpadmin),128(sambashare)

```

Below are the detailed information for the above output.

  * **`uid (1000/daygeek):`** It displays user ID  & Name
  * **`gid (1000/daygeek):`** It displays user’s primary group ID  & Name
  * **`groups:`** It displays user’s secondary groups ID  & Name



### 2) Using getent Command

The getent command displays entries from databases supported by the Name Service Switch libraries, which are configured in /etc/nsswitch.conf.

getent command shows user details similar to /etc/passwd file, it shows every user details as a single line with seven fields.
```
# getent passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
abrt:x:173:173::/etc/abrt:/sbin/nologin
haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
ntp:x:38:38::/etc/ntp:/sbin/nologin
saslauth:x:499:76:Saslauthd user:/var/empty/saslauth:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
centos:x:500:500:Cloud User:/home/centos:/bin/bash
prakash:x:501:501:2018/04/12:/home/prakash:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
nagios:x:498:498::/var/spool/nagios:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
nrpe:x:497:497:NRPE user for the NRPE service:/var/run/nrpe:/sbin/nologin
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash
thanu:x:503:504:2g Editor - Thanisha M:/home/thanu:/bin/bash
sudha:x:504:505:2g Editor - Sudha M:/home/sudha:/bin/bash

```

Below are the detailed information about seven fields.
```
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash

```

  * **`Username (magesh):`** Username of created user. Characters length should be between 1 to 32.
  * **`Password (x):`** It indicates that encrypted password is stored at /etc/shadow file.
  * **`User ID (UID-502):`** It indicates the user ID (UID) each user should be contain unique UID. UID (0-Zero) is reserved for root, UID (1-99) reserved for system users and UID (100-999) reserved for system accounts/groups
  * **`Group ID (GID-503):`** It indicates the group ID (GID) each group should be contain unique GID is stored at /etc/group file.
  * **`User ID Info (2g Admin - Magesh M):`** It indicates the command field. This field can be used to describe the user information.
  * **`Home Directory (/home/magesh):`** It indicates the user home directory.
  * **`shell (/bin/bash):`** It indicates the user’s bash shell.



If you would like to display only user names from the getent command output, use the below format.
```
# getent passwd | cut -d: -f1
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
uucp
operator
games
gopher
ftp
nobody
dbus
vcsa
abrt
haldaemon
ntp
saslauth
postfix
sshd
tcpdump
centos
prakash
apache
nagios
rpc
nrpe
magesh
thanu
sudha

```

To display only home directory users, use the below format.
```
# getent passwd | grep '/home' | cut -d: -f1
centos
prakash
magesh
thanu
sudha

```

### 3) Using /etc/passwd file

The `/etc/passwd` is a text file that contains each user information, which is necessary to login Linux system. It maintain useful information about users such as username, password, user ID, group ID, user ID info, home directory and shell. The /etc/passwd file contain every user details as a single line with seven fields as described below.
```
# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
abrt:x:173:173::/etc/abrt:/sbin/nologin
haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
ntp:x:38:38::/etc/ntp:/sbin/nologin
saslauth:x:499:76:Saslauthd user:/var/empty/saslauth:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
centos:x:500:500:Cloud User:/home/centos:/bin/bash
prakash:x:501:501:2018/04/12:/home/prakash:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
nagios:x:498:498::/var/spool/nagios:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
nrpe:x:497:497:NRPE user for the NRPE service:/var/run/nrpe:/sbin/nologin
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash
thanu:x:503:504:2g Editor - Thanisha M:/home/thanu:/bin/bash
sudha:x:504:505:2g Editor - Sudha M:/home/sudha:/bin/bash

```

Below are the detailed information about seven fields.
```
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash

```

  * **`Username (magesh):`** Username of created user. Characters length should be between 1 to 32.
  * **`Password (x):`** It indicates that encrypted password is stored at /etc/shadow file.
  * **`User ID (UID-502):`** It indicates the user ID (UID) each user should be contain unique UID. UID (0-Zero) is reserved for root, UID (1-99) reserved for system users and UID (100-999) reserved for system accounts/groups
  * **`Group ID (GID-503):`** It indicates the group ID (GID) each group should be contain unique GID is stored at /etc/group file.
  * **`User ID Info (2g Admin - Magesh M):`** It indicates the command field. This field can be used to describe the user information.
  * **`Home Directory (/home/magesh):`** It indicates the user home directory.
  * **`shell (/bin/bash):`** It indicates the user’s bash shell.



If you would like to display only user names from the /etc/passwd file, use the below format.
```
# cut -d: -f1 /etc/passwd
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
uucp
operator
games
gopher
ftp
nobody
dbus
vcsa
abrt
haldaemon
ntp
saslauth
postfix
sshd
tcpdump
centos
prakash
apache
nagios
rpc
nrpe
magesh
thanu
sudha

```

To display only home directory users, use the below format.
```
# cat /etc/passwd | grep '/home' | cut -d: -f1
centos
prakash
magesh
thanu
sudha

```

### 4) Using finger Command

The finger comamnd displays information about the system users. It displays the user’s real name, terminal name and write status (as a ‘‘*’’ after the terminal name if write permission is denied), idle time and login time.
```
# finger magesh
Login: magesh Name: 2g Admin - Magesh M
Directory: /home/magesh Shell: /bin/bash
Last login Tue Jul 17 22:46 (EDT) on pts/2 from 103.5.134.167
No mail.
No Plan.

```

Below are the detailed information for the above output.

  * **`Login:`** User’s login name
  * **`Name:`** Additional/Other information about the user
  * **`Directory:`** User home directory information
  * **`Shell:`** User’s shell information
  * **`LAST-LOGIN:`** Date of last login and other information



### 5) Using lslogins Command

It displays information about known users in the system. By default it will list information about all the users in the system.

The lslogins utility is inspired by the logins utility, which first appeared in FreeBSD 4.10.
```
# lslogins -u
UID USER PWD-LOCK PWD-DENY LAST-LOGIN GECOS
 0 root 0 0 00:17:28 root
500 centos 0 1 Cloud User
501 prakash 0 0 Apr12/04:08 2018/04/12
502 magesh 0 0 Jul17/22:46 2g Admin - Magesh M
503 thanu 0 0 Jul18/00:40 2g Editor - Thanisha M
504 sudha 0 0 Jul18/01:18 2g Editor - Sudha M

```

Below are the detailed information for the above output.

  * **`UID:`** User id
  * **`USER:`** Name of the user
  * **`PWD-LOCK:`** password defined, but locked
  * **`PWD-DENY:`** login by password disabled
  * **`LAST-LOGIN:`** Date of last login
  * **`GECOS:`** Other information about the user



### 6) Using compgen Command

compgen is bash built-in command and it will show all available commands, aliases, and functions for you.
```
# compgen -u
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
uucp
operator
games
gopher
ftp
nobody
dbus
vcsa
abrt
haldaemon
ntp
saslauth
postfix
sshd
tcpdump
centos
prakash
apache
nagios
rpc
nrpe
magesh
thanu
sudha

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-easy-ways-to-check-user-name-and-other-information-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/how-to-check-user-created-date-on-linux/
[2]:https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/
[3]:https://www.2daygeek.com/how-to-force-user-to-change-password-on-next-login-in-linux/
