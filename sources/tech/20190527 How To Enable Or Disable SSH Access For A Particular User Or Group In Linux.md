[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Enable Or Disable SSH Access For A Particular User Or Group In Linux?)
[#]: via: (https://www.2daygeek.com/allow-deny-enable-disable-ssh-access-user-group-in-linux/)
[#]: author: (2daygeek http://www.2daygeek.com/author/2daygeek/)

How To Enable Or Disable SSH Access For A Particular User Or Group In Linux?
======

As per your organization standard policy, you may need to allow only the list of users that are allowed to access the Linux system.

Or you may need to allow only few groups, which are allowed to access the Linux system.

How to achieve this? What is the best way? How to achieve this in a simple way?

Yes, there are many ways are available to perform this.

However, we need to go with simple and easy method.

If so, it can be done by making the necessary changes in `/etc/ssh/sshd_config` file.

In this article we will show you, how to perform this in details.

Why are we doing this? due to security reason. Navigate to the following URL to know more about **[openSSH][1]** usage.

### What Is SSH?

openssh stands for OpenBSD Secure Shell. Secure Shell (ssh) is a free open source networking tool which allow us to access remote system over an unsecured network using Secure Shell (SSH) protocol.

It’s a client-server architecture. It handles user authentication, encryption, transferring files between computers and tunneling.

These can be accomplished via traditional tools such as telnet or rcp, these are insecure and use transfer password in cleartext format while performing any action.

### How To Allow A User To Access SSH In Linux?

We can allow/enable the ssh access for a particular user or list of the users using the following method.

If you would like to allow more than one user then you have to add the users with space in the same line.

To do so, just append the following value into `/etc/ssh/sshd_config` file. In this example, we are going to allow ssh access for `user3`.

```
# echo "AllowUsers user3" >> /etc/ssh/sshd_config
```

You can double check this by running the following command.

```
# cat /etc/ssh/sshd_config | grep -i allowusers
AllowUsers user3
```

That’s it. Just bounce the ssh service and see the magic.

```
# systemctl restart sshd

# service restart sshd
```

Simple open a new terminal or session and try to access the Linux system with different user. Yes, `user2` isn’t allowed for SSH login and will be getting an error message as shown below.

```
# ssh [email protected]
[email protected]'s password:
Permission denied, please try again.
```

Output:

```
Mar 29 02:00:35 CentOS7 sshd[4900]: User user2 from 192.168.1.6 not allowed because not listed in AllowUsers
Mar 29 02:00:35 CentOS7 sshd[4900]: input_userauth_request: invalid user user2 [preauth]
Mar 29 02:00:40 CentOS7 unix_chkpwd[4902]: password check failed for user (user2)
Mar 29 02:00:40 CentOS7 sshd[4900]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=user2
Mar 29 02:00:43 CentOS7 sshd[4900]: Failed password for invalid user user2 from 192.168.1.6 port 42568 ssh2
```

At the same time `user3` is allowed to login into the system because it’s in allowed users list.

```
# ssh [email protected]
[email protected]'s password:
[[email protected] ~]$
```

Output:

```
Mar 29 02:01:13 CentOS7 sshd[4939]: Accepted password for user3 from 192.168.1.6 port 42590 ssh2
Mar 29 02:01:13 CentOS7 sshd[4939]: pam_unix(sshd:session): session opened for user user3 by (uid=0)
```

### How To Deny Users To Access SSH In Linux?

We can deny/disable the ssh access for a particular user or list of the users using the following method.

If you would like to disable more than one user then you have to add the users with space in the same line.

To do so, just append the following value into `/etc/ssh/sshd_config` file. In this example, we are going to disable ssh access for `user1`.

```
# echo "DenyUsers user1" >> /etc/ssh/sshd_config
```

You can double check this by running the following command.

```
# cat /etc/ssh/sshd_config | grep -i denyusers
DenyUsers user1
```

That’s it. Just bounce the ssh service and see the magic.

```
# systemctl restart sshd

# service restart sshd
```

Simple open a new terminal or session and try to access the Linux system with Deny user. Yes, `user1` is in denyusers list. So, you will be getting an error message as shown below when you are try to login.

```
# ssh [email protected]
[email protected]'s password:
Permission denied, please try again.
```

Output:

```
Mar 29 01:53:42 CentOS7 sshd[4753]: User user1 from 192.168.1.6 not allowed because listed in DenyUsers
Mar 29 01:53:42 CentOS7 sshd[4753]: input_userauth_request: invalid user user1 [preauth]
Mar 29 01:53:46 CentOS7 unix_chkpwd[4755]: password check failed for user (user1)
Mar 29 01:53:46 CentOS7 sshd[4753]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=user1
Mar 29 01:53:48 CentOS7 sshd[4753]: Failed password for invalid user user1 from 192.168.1.6 port 42522 ssh2
```

### How To Allow Groups To Access SSH In Linux?

We can allow/enable the ssh access for a particular group or groups using the following method.

If you would like to allow more than one group then you have to add the groups with space in the same line.

To do so, just append the following value into `/etc/ssh/sshd_config` file. In this example, we are going to disable ssh access for `2g-admin` group.

```
# echo "AllowGroups 2g-admin" >> /etc/ssh/sshd_config
```

You can double check this by running the following command.

```
# cat /etc/ssh/sshd_config | grep -i allowgroups
AllowGroups 2g-admin
```

Run the following command to know the list of the users are belongs to this group.

```
# getent group 2g-admin
2g-admin:x:1005:user1,user2,user3
```

That’s it. Just bounce the ssh service and see the magic.

```
# systemctl restart sshd

# service restart sshd
```

Yes, `user3` is allowed to login into the system because user3 is belongs to `2g-admin` group.

```
# ssh [email protected]
[email protected]'s password:
[[email protected] ~]$
```

Output:

```
Mar 29 02:10:21 CentOS7 sshd[5165]: Accepted password for user1 from 192.168.1.6 port 42640 ssh2
Mar 29 02:10:22 CentOS7 sshd[5165]: pam_unix(sshd:session): session opened for user user1 by (uid=0)
```

Yes, `user2` is allowed to login into the system because user2 is belongs to `2g-admin` group.

```
# ssh [email protected]
[email protected]'s password:
[[email protected] ~]$
```

Output:

```
Mar 29 02:10:38 CentOS7 sshd[5225]: Accepted password for user2 from 192.168.1.6 port 42642 ssh2
Mar 29 02:10:38 CentOS7 sshd[5225]: pam_unix(sshd:session): session opened for user user2 by (uid=0)
```

When you are try to login into the system with other users which are not part of this group then you will be getting an error message as shown below.

```
# ssh [email protected]
[email protected]'s password:
Permission denied, please try again.
```

Output:

```
Mar 29 02:12:36 CentOS7 sshd[5306]: User ladmin from 192.168.1.6 not allowed because none of user's groups are listed in AllowGroups
Mar 29 02:12:36 CentOS7 sshd[5306]: input_userauth_request: invalid user ladmin [preauth]
Mar 29 02:12:56 CentOS7 unix_chkpwd[5310]: password check failed for user (ladmin)
Mar 29 02:12:56 CentOS7 sshd[5306]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=ladmin
Mar 29 02:12:58 CentOS7 sshd[5306]: Failed password for invalid user ladmin from 192.168.1.6 port 42674 ssh2
```

### How To Deny Group To Access SSH In Linux?

We can deny/disable the ssh access for a particular group or groups using the following method.

If you would like to disable more than one group then you need to add the group with space in the same line.

To do so, just append the following value into `/etc/ssh/sshd_config` file.

```
# echo "DenyGroups 2g-admin" >> /etc/ssh/sshd_config
```

You can double check this by running the following command.

```
# # cat /etc/ssh/sshd_config | grep -i denygroups
DenyGroups 2g-admin

# getent group 2g-admin
2g-admin:x:1005:user1,user2,user3
```

That’s it. Just bounce the ssh service and see the magic.

```
# systemctl restart sshd

# service restart sshd
```

Yes `user3` isn’t allowed to login into the system because it’s not part of `2g-admin` group. It’s in Denygroups.

```
# ssh [email protected]
[email protected]'s password:
Permission denied, please try again.
```

Output:

```
Mar 29 02:17:32 CentOS7 sshd[5400]: User user1 from 192.168.1.6 not allowed because a group is listed in DenyGroups
Mar 29 02:17:32 CentOS7 sshd[5400]: input_userauth_request: invalid user user1 [preauth]
Mar 29 02:17:38 CentOS7 unix_chkpwd[5402]: password check failed for user (user1)
Mar 29 02:17:38 CentOS7 sshd[5400]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=user1
Mar 29 02:17:41 CentOS7 sshd[5400]: Failed password for invalid user user1 from 192.168.1.6 port 42710 ssh2
```

Anyone can login into the system except `2g-admin` group. Hence, `ladmin` user is allowed to login into the system.

```
# ssh [email protected]
[email protected]'s password:
[[email protected] ~]$
```

Output:

```
Mar 29 02:19:13 CentOS7 sshd[5432]: Accepted password for ladmin from 192.168.1.6 port 42716 ssh2
Mar 29 02:19:13 CentOS7 sshd[5432]: pam_unix(sshd:session): session opened for user ladmin by (uid=0)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/allow-deny-enable-disable-ssh-access-user-group-in-linux/

作者：[2daygeek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.2daygeek.com/author/2daygeek/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/ssh-tutorials/
