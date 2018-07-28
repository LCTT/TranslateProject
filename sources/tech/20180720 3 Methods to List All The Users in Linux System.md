Translating... by SunWave

3 Methods to List All The Users in Linux System
======
Everyone knows user information was residing in `/etc/passwd` file.

It’s a text file that contains the essential information about each user.

When we create a new user, the new user details will be appended into this file.

The /etc/passwd file contains each user essential information as a single line with seven fields.

Each line in /etc/passwd represents a single user. This file keep the user’s information in three parts.

  * `Part-1:` root user information
  * `Part-2:` system-defined accounts information
  * `Part-3:` Real user information



**Suggested Read :**
**(#)** [How To Check User Created Date On Linux][1]
**(#)** [How To Check Which Groups A User Belongs To On Linux][2]
**(#)** [How To Force User To Change Password On Next Login In Linux][3]

The first part is the root account, which is administrator account has complete power over every aspect of the system.

The second part is followed by system-defined groups and accounts that are required for proper installation and update of system software.

The third part at the end represent real people who use the system.

While creating a new users the below four files will be modified.

  * `/etc/passwd:` User details will be updated in this file.
  * `/etc/shadow:` User password info will be updated in this file.
  * `/etc/group:` Group details will be updated of the new user in this file.
  * `/etc/gshadow:` Group password info will be updated of the new user in the file.



### Method-1: Using /etc/passwd file

Use any of the file manipulation command such as cat, more, less, etc to print the list of users were created on your Linux system.

The `/etc/passwd` is a text file that contains each user information, which is necessary to login Linux system. It maintain useful information about users such as username, password, user ID, group ID, user ID info, home directory and shell.

The /etc/passwd file contain every user details as a single line with seven fields as described below, each fields separated by colon “:”
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
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
2gadmin:x:500:10::/home/viadmin:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
zabbix:x:498:499:Zabbix Monitoring System:/var/lib/zabbix:/sbin/nologin
mysql:x:497:502::/home/mysql:/bin/bash
zend:x:502:503::/u01/zend/zend/gui/lighttpd:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/cache/rpcbind:/sbin/nologin
2daygeek:x:503:504::/home/2daygeek:/bin/bash
named:x:25:25:Named:/var/named:/sbin/nologin
mageshm:x:506:507:2g Admin - Magesh M:/home/mageshm:/bin/bash

```

Below are the detailed information about seven fields.

  * **`Username (magesh):`** Username of created user. Characters length should be between 1 to 32.
  * **`Password (x):`** It indicates that encrypted password is stored at /etc/shadow file.
  * **`User ID (UID-506):`** It indicates the user ID (UID) each user should be contain unique UID. UID (0-Zero) is reserved for root, UID (1-99) reserved for system users and UID (100-999) reserved for system accounts/groups
  * **`Group ID (GID-507):`** It indicates the group ID (GID) each group should be contain unique GID is stored at /etc/group file.
  * **`User ID Info (2g Admin - Magesh M):`** It indicates the command field. This field can be used to describe the user information.
  * **`Home Directory (/home/mageshm):`** It indicates the user home directory.
  * **`shell (/bin/bash):`** It indicates the user’s bash shell.



You can use the **awk** or **cut** command to print only the user names list on your Linux system. Both are showing the same results.
```
# awk -F':' '{ print $1}' /etc/passwd
or
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
ftp
postfix
sshd
tcpdump
2gadmin
apache
zabbix
mysql
zend
rpc
2daygeek
named
mageshm

```

### Method-2: Using getent Command

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
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
2gadmin:x:500:10::/home/viadmin:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
zabbix:x:498:499:Zabbix Monitoring System:/var/lib/zabbix:/sbin/nologin
mysql:x:497:502::/home/mysql:/bin/bash
zend:x:502:503::/u01/zend/zend/gui/lighttpd:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/cache/rpcbind:/sbin/nologin
2daygeek:x:503:504::/home/2daygeek:/bin/bash
named:x:25:25:Named:/var/named:/sbin/nologin
mageshm:x:506:507:2g Admin - Magesh M:/home/mageshm:/bin/bash

```

Below are the detailed information about seven fields.

  * **`Username (magesh):`** Username of created user. Characters length should be between 1 to 32.
  * **`Password (x):`** It indicates that encrypted password is stored at /etc/shadow file.
  * **`User ID (UID-506):`** It indicates the user ID (UID) each user should be contain unique UID. UID (0-Zero) is reserved for root, UID (1-99) reserved for system users and UID (100-999) reserved for system accounts/groups
  * **`Group ID (GID-507):`** It indicates the group ID (GID) each group should be contain unique GID is stored at /etc/group file.
  * **`User ID Info (2g Admin - Magesh M):`** It indicates the command field. This field can be used to describe the user information.
  * **`Home Directory (/home/mageshm):`** It indicates the user home directory.
  * **`shell (/bin/bash):`** It indicates the user’s bash shell.



You can use the **awk** or **cut** command to print only the user names list on your Linux system. Both are showing the same results.
```
# getent passwd | awk -F':' '{ print $1}'
or
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
ftp
postfix
sshd
tcpdump
2gadmin
apache
zabbix
mysql
zend
rpc
2daygeek
named
mageshm

```

### Method-3: Using compgen Command

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
ftp
postfix
sshd
tcpdump
2gadmin
apache
zabbix
mysql
zend
rpc
2daygeek
named
mageshm

```

Please comment your inputs into our comment section, so based on that we can improve our blog and make effective article. So, stay tune with us.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/3-methods-to-list-all-the-users-in-linux-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/how-to-check-user-created-date-on-linux/
[2]:https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/
[3]:https://www.2daygeek.com/how-to-force-user-to-change-password-on-next-login-in-linux/
