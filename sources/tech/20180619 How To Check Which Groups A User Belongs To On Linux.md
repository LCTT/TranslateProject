translating---geekpi

How To Check Which Groups A User Belongs To On Linux
======
Adding a user into existing group is one of the regular activity for Linux admin. This is daily activity for some of the administrator who’s working one big environments.

Even i am performing such a activity on daily in my environment due to business requirement. It’s one of the important command which helps you to identify existing groups on your environment.

Also these commands helps you to identify which groups a user belongs to. All the users are listed in `/etc/passwd` file and groups are listed in `/etc/group`.

Whatever command we use, that will fetch the information from these files. Also, each command has their unique feature which helps user to get the required information alone.

### What Is /etc/passwd?

`/etc/passwd` is a text file that contains each user information, which is necessary to login Linux system. It maintain useful information about users such as username, password, user ID, group ID, user ID info, home directory and shell. The passwd file contain every user details as a single line with seven fields as described above.
```
$ grep "daygeek" /etc/passwd
daygeek:x:1000:1000:daygeek,,,:/home/daygeek:/bin/bash

```

### What Is /etc/group?

`/etc/group` is a text file that defines which groups a user belongs to. We can add multiple users into single group. It allows user to access other users files and folders as Linux permissions are organized into three classes, user, group, and others. It maintain useful information about group such as Group name, Group password, Group ID (GID) and Member list. each on a separate line. The group file contain every group details as a single line with four fields as described above.

This can be performed by using below methods.

  * `groups:`Show All Members of a Group.
  * `id:`Print user and group information for the specified username.
  * `lid:`It display user’s groups or group’s users.
  * `getent:`get entries from Name Service Switch libraries.
  * `grep`grep stands for “global regular expression print” which prints matching pattern.



### What Is groups Command?

groups command prints the names of the primary and any supplementary groups for each given username.
```
$ groups daygeek
daygeek : daygeek adm cdrom sudo dip plugdev lpadmin sambashare

```

If you would like to check list of groups associated with current user. Just run **“group”** command alone without any username.
```
$ groups
daygeek adm cdrom sudo dip plugdev lpadmin sambashare

```

### What Is id Command?

id stands for identity. print real and effective user and group IDs. To print user and group information for the specified user, or for the current user.
```
$ id daygeek
uid=1000(daygeek) gid=1000(daygeek) groups=1000(daygeek),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),118(lpadmin),128(sambashare)

```

If you would like to check list of groups associated with current user. Just run **“id”** command alone without any username.
```
$ id
uid=1000(daygeek) gid=1000(daygeek) groups=1000(daygeek),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),118(lpadmin),128(sambashare)

```

### What Is lid Command?

It display user’s groups or group’s users. Displays information about groups containing user name, or users contained in group name. This command required privileges to run.
```
$ sudo lid daygeek
 adm(gid=4)
 cdrom(gid=24)
 sudo(gid=27)
 dip(gid=30)
 plugdev(gid=46)
 lpadmin(gid=108)
 daygeek(gid=1000)
 sambashare(gid=124)

```

### What Is getent Command?

The getent command displays entries from databases supported by the Name Service Switch libraries, which are configured in /etc/nsswitch.conf.
```
$ getent group | grep daygeek
adm:x:4:syslog,daygeek
cdrom:x:24:daygeek
sudo:x:27:daygeek
dip:x:30:daygeek
plugdev:x:46:daygeek
lpadmin:x:118:daygeek
daygeek:x:1000:
sambashare:x:128:daygeek

```

If you would like to print only associated groups name then include **“awk”** command along with above command.
```
$ getent group | grep daygeek | awk -F: '{print $1}'
adm
cdrom
sudo
dip
plugdev
lpadmin
daygeek
sambashare

```

Run the below command to print only primary group information.
```
$ getent group daygeek
daygeek:x:1000:

```

### What Is grep Command?

grep stands for “global regular expression print” which prints matching pattern from the file.
```
$ grep "daygeek" /etc/group
adm:x:4:syslog,daygeek
cdrom:x:24:daygeek
sudo:x:27:daygeek
dip:x:30:daygeek
plugdev:x:46:daygeek
lpadmin:x:118:daygeek
daygeek:x:1000:
sambashare:x:128:daygeek

```

If you would like to print only associated groups name then include **“awk”** command along with above command.
```
$ grep "daygeek" /etc/group | awk -F: '{print $1}'
adm
cdrom
sudo
dip
plugdev
lpadmin
daygeek
sambashare

```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
