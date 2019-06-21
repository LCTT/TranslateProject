[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Three Ways to Lock and Unlock User Account in Linux)
[#]: via: (https://www.2daygeek.com/lock-unlock-disable-enable-user-account-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Three Ways to Lock and Unlock User Account in Linux
======

If password policy had already implemented in your organization, then you no need to look for this options.

However, if you had set up lock period for 24 hours, in this case you might need to unlock the user’s account manually.

This tutorial will help you to manually lock and unlock users account in Linux.

This can be done using the following two Linux Commands in three ways.

  * **`passwd:`**The passwd command is used to update user’s authentication tokens. This task is achieved by calling the Linux-PAM and Libuser API
  * **`usermod:`**The usermod command is used to modify/update given user’s account information. It used to add a user to a specific group, etc.,



To exprement this, we are choosing `daygeek` user account. Let’s see, how to do step by step.

Make a note, you have to use corresponding user account which you need to lock or unlock instead of ours.

You can check the given user account is available or not in system by using `id Command`. Yes, my account is available in the system.

```
# id daygeek

uid=2240(daygeek) gid=2243(daygeek) groups=2243(daygeek),2244(ladmin)
```

### Method-1: How To Lock, Unlock and Check Status of the Given User Account in Linux Using passwd Command?

The passwd command is one of the frequently used command by Linux administrator very often.

It used to update user’s authentication tokens in the `/etc/shadow` file.

Run the passwd command with the `-l` switch to lock the given user account.

```
# passwd -l daygeek

Locking password for user daygeek.
passwd: Success
```

You can check the locked account status either passwd command or grep the given user name from /etc/shadow file.

Checking the user account locked status using passwd command.

```
# passwd -S daygeek
or
# passwd --status daygeek

daygeek LK 2019-05-30 7 90 7 -1 (Password locked.)
```

This will output a short information about the status of the password for a given account.

  * **`LK:`**` ` Password locked
  * **`NP:`**` ` No password
  * **`PS:`**` ` Password set



Checking the locked user account status using `/etc/shadow` file. Two exclamation mark will be added in front of the password, if the account is already locked.

```
# grep daygeek /etc/shadow

daygeek:!!$6$tGvVUhEY$PIkpI43HPaEoRrNJSRpM3H0YWOsqTqXCxtER6rak5PMaAoyQohrXNB0YoFCmAuh406n8XOvBBldvMy9trmIV00:18047:7:90:7:::
```

Run the passwd command with the `-u` switch to unlock the given user account.

```
# passwd -u daygeek

Unlocking password for user daygeek.
passwd: Success
```

### Method-2: How To Lock, Unlock and Check Status of the Given User Account in Linux Using usermod Command?

Even, the usermod command also frequently used by Linux administrator very often.

The usermod command is used to modify/update given user’s account information. It used to add a user to a specific group, etc.,

Run the usermod command with the `-L` switch to lock the given user account.

```
# usermod --lock daygeek
or
# usermod -L daygeek
```

You can check the locked account status either passwd command or grep the given user name from /etc/shadow file.

Checking the user account locked status using passwd command.

```
# passwd -S daygeek
or
# passwd --status daygeek

daygeek LK 2019-05-30 7 90 7 -1 (Password locked.)
```

This will output a short information about the status of the password for a given account.

  * **`LK:`**` ` Password locked
  * **`NP:`**` ` No password
  * **`PS:`**` ` Password set



Checking the locked user account status using /etc/shadow file. Two exclamation mark will be added in front of the password, if the account is already locked.

```
# grep daygeek /etc/shadow

daygeek:!!$6$tGvVUhEY$PIkpI43HPaEoRrNJSRpM3H0YWOsqTqXCxtER6rak5PMaAoyQohrXNB0YoFCmAuh406n8XOvBBldvMy9trmIV00:18047:7:90:7:::
```

Run the usermod command with the `-U` switch to unlock the given user account.

```
# usermod --unlock daygeek
or
# usermod -U daygeek
```

### Method-3: How To Disable, Enable SSH Access To the Given User Account in Linux Using usermod Command?

Even, the usermod command also frequently used by Linux administrator very often.

The usermod command is used to modify/update given user’s account information. It used to add a user to a specific group, etc.,

Alternativly this can be done by assigning the `nologin` shell to the given user. To do so, run the below command.

```
# usermod -s /sbin/nologin daygeek
```

You can check the locked user account details by greping the given user name from /etc/passwd file.

```
# grep daygeek /etc/passwd

daygeek:x:2240:2243::/home/daygeek:/sbin/nologin
```

We can enable the user ssh access by assigning back to the old shell.

```
# usermod -s /bin/bash daygeek
```

### How To Lock, Unlock and Check Status of Multiple User Account in Linux Using Shell Script?

If you would like to lock/unlock more than one account then you need to look for script.

Yes, we can write a small shell script to perform this. To do so, use the following shell script.

Create The Users list. Each user should be in separate line.

```
$ cat user-lists.txt

u1
u2
u3
u4
u5
```

Use the following shell script to lock multiple users account in Linux.

```
# user-lock.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
passwd -l $user
done
```

Set an executable permission to `user-lock.sh` file.

```
# chmod + user-lock.sh
```

Finally run the script to achieve this.

```
# sh user-lock.sh

Locking password for user u1.
passwd: Success
Locking password for user u2.
passwd: Success
Locking password for user u3.
passwd: Success
Locking password for user u4.
passwd: Success
Locking password for user u5.
passwd: Success
```

Use the following shell script to check locked users account in Linux.

```
# vi user-lock-status.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
passwd -S $user
done
```

Set an executable permission to `user-lock-status.sh` file.

```
# chmod + user-lock-status.sh
```

Finally run the script to achieve this.

```
# sh user-lock-status.sh

u1 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u2 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u3 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u4 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u5 LK 2019-06-10 0 99999 7 -1 (Password locked.)
```

Use the following shell script to unlock multiple users account in Linux.

```
# user-unlock.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
passwd -u $user
done
```

Set an executable permission to `user-unlock.sh` file.

```
# chmod + user-unlock.sh
```

Finally run the script to achieve this.

```
# sh user-unlock.sh

Unlocking password for user u1.
passwd: Success
Unlocking password for user u2.
passwd: Success
Unlocking password for user u3.
passwd: Success
Unlocking password for user u4.
passwd: Success
Unlocking password for user u5.
passwd: Success
```

Run the same shell script `user-lock-status.sh` to check these locked user accounts got unlocked in Linux.

```
# sh user-lock-status.sh

u1 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u2 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u3 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u4 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u5 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/lock-unlock-disable-enable-user-account-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
