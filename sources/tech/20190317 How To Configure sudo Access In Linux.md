[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Configure sudo Access In Linux?)
[#]: via: (https://www.2daygeek.com/how-to-configure-sudo-access-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Configure sudo Access In Linux?
======

The root user has all the controls in Linux system.

root user is the most powerful user in the Linux system and can perform any action in the system.

If any users wants to perform some actions, don’t provide the root access to anybody because if he/she done anything wrong there is no option/way to rectify it.

To fix this, what will be the solution?

We can grant sudo permission to the corresponding user to overcome this situation.

The sudo command offers a mechanism for providing trusted users with administrative access to a system without sharing the password of the root user.

They can perform most of the administrative operations but not all operations like root.

### What Is sudo?

sudo is a program, which can be used by a normal users to execute a command as the super user or another user, as specified by the security policy.

sudo users access is controlled by `/etc/sudoers` file.

### What Is An Advantage Of sudo Users?

sudo is a safe way to run a command in Linux system if you are not familiar on it.

  * The Linux system keeps a logs into the `/var/log/secure` and `/var/log/auth.log` file where you can verify what actions was made by the sudo user.
  * Every time, it will prompt a password to perform the current action. So, you will be getting a time to verify the action, which you are going to perform. If you feel it’s not a correct action then you can safely exit there itself without perform the current action.



It’s different for RHEL based systems such as Redhat (RHEL), CentOS and Oracle Enterprise Linux (OEL) and Debian based systems such as Debian, Ubuntu and LinuxMint.

We will tech you, how to perform this on both the distributions in this article.

It can be done in three ways in both the distributions.

  * Add a user into corresponding groups. For RHEL based system, we need to add a user into `wheel` group. For Debian based system, we need to add a user into `sudo` or `admin` groups.
  * Add a user into `/etc/group` file manually.
  * Add a user into `/etc/sudoers` file using visudo.



### How To Configure sudo Access In RHEL/CentOS/OEL Systems?

It can be done on RHEL based systems such as Redhat (RHEL), CentOS and Oracle Enterprise Linux (OEL) using following three methods.

### Method-1: How To Grant The Super User Access To A Normal User In Linux Using wheel Group?

Wheel is a special group in the RHEL based systems that provides additional privileges that empower a user to execute restricted commands as the super user.

Make a note that the `wheel` group should be enabled in the `/etc/sudoers` file to gain this access.

```
# grep -i wheel /etc/sudoers

## Allows people in group wheel to run all commands
%wheel ALL=(ALL) ALL
# %wheel ALL=(ALL) NOPASSWD: ALL
```

I assume that we had already created an user account to perform this. In my case, I’m going to use `daygeek` user account.

Run the following command to add an user into wheel group.

```
# usermod -aG wheel daygeek
```

We can doube confirm this by running the following command.

```
# getent group wheel
wheel:x:10:daygeek
```

I’m going to check whether `daygeek` user can access a file which is owned by the root user.

```
$ tail -5 /var/log/secure
tail: cannot open _/var/log/secure_ for reading: Permission denied
```

I was getting an error when i try to access the `/var/log/secure` file as a normal user. I’m going to access the same file with sudo, let’s see the magic.

```
$ sudo tail -5 /var/log/secure
[sudo] password for daygeek:
Mar 17 07:01:56 CentOS7 sudo: daygeek : TTY=pts/0 ; PWD=/home/daygeek ; USER=root ; COMMAND=/bin/tail -5 /var/log/secure
Mar 17 07:01:56 CentOS7 sudo: pam_unix(sudo:session): session opened for user root by daygeek(uid=0)
Mar 17 07:01:56 CentOS7 sudo: pam_unix(sudo:session): session closed for user root
Mar 17 07:05:10 CentOS7 sudo: daygeek : TTY=pts/0 ; PWD=/home/daygeek ; USER=root ; COMMAND=/bin/tail -5 /var/log/secure
Mar 17 07:05:10 CentOS7 sudo: pam_unix(sudo:session): session opened for user root by daygeek(uid=0)
```

### Method-2: How To Grant The Super User Access To A Normal User In RHEL/CentOS/OEL using /etc/group file?

We can manually add an user into the wheel group by editing the `/etc/group` file.

Just open the file then append the corresponding user in the appropriate group to achieve this.

```
$ grep -i wheel /etc/group
wheel:x:10:daygeek,user1
```

In this example, I’m going to use `user1` user account.

I’m going to check whether `user1` user has sudo access or not by restarting the `Apache` service in the system. let’s see the magic.

```
$ sudo systemctl restart httpd
[sudo] password for user1:

$ sudo grep -i user1 /var/log/secure
[sudo] password for user1:
Mar 17 07:09:47 CentOS7 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/bin/systemctl restart httpd
Mar 17 07:10:40 CentOS7 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/bin/systemctl restart httpd
Mar 17 07:12:35 CentOS7 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/bin/grep -i httpd /var/log/secure
```

### Method-3: How To Grant The Super User Access To A Normal User In Linux Using /etc/sudoers file?

sudo users access is controlled by `/etc/sudoers` file. So, simply add an user into the sudoers file under wheel group.

Just append the desired user into /etc/suoders file by using visudo command.

```
# grep -i user2 /etc/sudoers
user2 ALL=(ALL) ALL
```

In this example, I’m going to use `user2` user account.

I’m going to check whether `user2` user has sudo access or not by restarting the `MariaDB` service in the system. let’s see the magic.

```
$ sudo systemctl restart mariadb
[sudo] password for user2:

$ sudo grep -i mariadb /var/log/secure
[sudo] password for user2:
Mar 17 07:23:10 CentOS7 sudo: user2 : TTY=pts/0 ; PWD=/home/user2 ; USER=root ; COMMAND=/bin/systemctl restart mariadb
Mar 17 07:26:52 CentOS7 sudo: user2 : TTY=pts/0 ; PWD=/home/user2 ; USER=root ; COMMAND=/bin/grep -i mariadb /var/log/secure
```

### How To Configure sudo Access In Debian/Ubuntu Systems?

It can be done on Debian based systems such as Debian based systems such as Debian, Ubuntu and LinuxMint using following three methods.

### Method-1: How To Grant The Super User Access To A Normal User In Linux Using sudo or admin Groups?

sudo or admin is a special group in the Debian based systems that provides additional privileges that empower a user to execute restricted commands as the super user.

Make a note that the `sudo` or `admin` group should be enabled in the `/etc/sudoers` file to gain this access.

```
# grep -i 'sudo\|admin' /etc/sudoers

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo ALL=(ALL:ALL) ALL
```

I assume that we had already created an user account to perform this. In my case, I’m going to use `2gadmin` user account.

Run the following command to add an user into sudo group.

```
# usermod -aG sudo 2gadmin
```

We can doube confirm this by running the following command.

```
# getent group sudo
sudo:x:27:2gadmin
```

I’m going to check whether `2gadmin` user can access a file which is owned by the root user.

```
$ less /var/log/auth.log
/var/log/auth.log: Permission denied
```

I was getting an error when i try to access the `/var/log/auth.log` file as a normal user. I’m going to access the same file with sudo, let’s see the magic.

```
$ sudo tail -5 /var/log/auth.log
[sudo] password for 2gadmin:
Mar 17 20:39:47 Ubuntu18 sudo: 2gadmin : TTY=pts/0 ; PWD=/home/2gadmin ; USER=root ; COMMAND=/bin/bash
Mar 17 20:39:47 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by 2gadmin(uid=0)
Mar 17 20:40:23 Ubuntu18 sudo: pam_unix(sudo:session): session closed for user root
Mar 17 20:40:48 Ubuntu18 sudo: 2gadmin : TTY=pts/0 ; PWD=/home/2gadmin ; USER=root ; COMMAND=/usr/bin/tail -5 /var/log/auth.log
Mar 17 20:40:48 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by 2gadmin(uid=0)
```

Alternatively we can perform the same by adding an user to `admin` group.

Run the following command to add an user into sudo group.

```
# usermod -aG admin user1
```

We can doube confirm this by running the following command.

```
# getent group admin
admin:x:1011:user1
```

Let’s see the output.

```
$ sudo tail -2 /var/log/auth.log
[sudo] password for user1:
Mar 17 20:53:36 Ubuntu18 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/usr/bin/tail -2 /var/log/auth.log
Mar 17 20:53:36 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by user1(uid=0)
```

### Method-2: How To Grant The Super User Access To A Normal User In Debian/Ubuntu using /etc/group file?

We can manually add an user into the sudo or admin group by editing the `/etc/group` file.

Just open the file then append the corresponding user in the appropriate group to achieve this.

```
$ grep -i sudo /etc/group
sudo:x:27:2gadmin,user2
```

In this example, I’m going to use `user2` user account.

I’m going to check whether `user2` user has sudo access or not by restarting the `Apache` service in the system. let’s see the magic.

```
$ sudo systemctl restart apache2
[sudo] password for user2:

$ sudo tail -f /var/log/auth.log
[sudo] password for user2:
Mar 17 21:01:04 Ubuntu18 systemd-logind[559]: New session 22 of user user2.
Mar 17 21:01:04 Ubuntu18 systemd: pam_unix(systemd-user:session): session opened for user user2 by (uid=0)
Mar 17 21:01:33 Ubuntu18 sudo: user2 : TTY=pts/0 ; PWD=/home/user2 ; USER=root ; COMMAND=/bin/systemctl restart apache2
```

### Method-3: How To Grant The Super User Access To A Normal User In Linux Using /etc/sudoers file?

sudo users access is controlled by `/etc/sudoers` file. So, simply add an user into the sudoers file under sudo or admin group.

Just append the desired user into /etc/suoders file by using visudo command.

```
# grep -i user3 /etc/sudoers
user3 ALL=(ALL:ALL) ALL
```

In this example, I’m going to use `user3` user account.

I’m going to check whether `user3` user has sudo access or not by restarting the `MariaDB` service in the system. let’s see the magic.

```
$ sudo systemctl restart mariadb
[sudo] password for user3:

$ sudo tail -f /var/log/auth.log
[sudo] password for user3:
Mar 17 21:12:32 Ubuntu18 systemd-logind[559]: New session 24 of user user3.
Mar 17 21:12:49 Ubuntu18 sudo: user3 : TTY=pts/0 ; PWD=/home/user3 ; USER=root ; COMMAND=/bin/systemctl restart mariadb
Mar 17 21:12:49 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by user3(uid=0)
Mar 17 21:12:53 Ubuntu18 sudo: pam_unix(sudo:session): session closed for user root
Mar 17 21:13:08 Ubuntu18 sudo: user3 : TTY=pts/0 ; PWD=/home/user3 ; USER=root ; COMMAND=/usr/bin/tail -f /var/log/auth.log
Mar 17 21:13:08 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by user3(uid=0)
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-configure-sudo-access-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
