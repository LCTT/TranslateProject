[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Locking and unlocking accounts on Linux systems)
[#]: via: (https://www.networkworld.com/article/3513982/locking-and-unlocking-accounts-on-linux-systems.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Locking and unlocking accounts on Linux systems
======
There are times when locking a Linux user account is necessary and times when you need to reverse that action. Here are commands for managing account access and what's behind them.
SQBack / Getty Images

If you are administering a [Linux][1] system, there will likely be times that you need to lock an account. Maybe someone is changing positions and their continued need for the account is under question; maybe there’s reason to believe that access to the account has been compromised. In any event, knowing how to lock an account and how to unlock it should it be needed again is something you need to be able to do.

One important thing to keep in mind is that there are multiple ways to lock an account, and they don't all have the same effect. If the account user is accessing an account using public/private keys instead of a password, some commands you might use to block access to an account will not be effective.

### Locking an account using the passwd command

One of the simplest ways to lock an account is with the **passwd -l** command. For example:

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
$ sudo passwd -l tadpole
```

The effect of this command is to insert an exclamation point as the first character in the encrypted password field in the /etc/shadow file. This is enough to keep the password from working. What previously looked like this (note the first character):

```
$6$IC6icrWlNhndMFj6$Jj14Regv3b2EdK.8iLjSeO893fFig75f32rpWpbKPNz7g/eqeaPCnXl3iQ7RFIN0BGC0E91sghFdX2eWTe2ET0:18184:0:99999:7:::
```

will look like this:

```
!$6$IC6icrWlNhndMFj6$Jj14Regv3b2EdK.8iLjSeO893fFig75f32rpWpbKPNz7g/eqeaPCnXl3iQ7RFIN0BGC0E91sghFdX2eWTe2ET0:18184:0:99999:7:::
```

On his next login attempt (should there be one), tadpole would probably try his password numerous times and not gain access. You, on the other hand, would be able to check the status of his account with a command like this (-S = status):

```
$ sudo passwd -S tadpole
tadpole L 10/15/2019 0 99999 7 -1
```

The "L" in the second field tells you that the account is locked. Before the account was locked, it would have been a "P". An "NP" would mean that no password was set.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][3] ]**

The **usermod -L** command would have the same effect (inserting the exclamation character to disable use of the password).

One of the benefits of locking an account in this way is that it's very easy to unlock the account when and if needed. Just reverse the change by removing the added exclamation point with a text editor or, better yet, by using the **passwd -u** command.

```
$ sudo passwd -u tadpole
passwd: password expiry information changed.
```

The problem with this approach is that, if the user is accessing his or her account with public/private keys, this change will not block their use.

### Locking accounts with the chage command

Another way to lock a user account is to the the **chage** command that helps manage account expiration dates.

```
$ sudu chage -E0 tadpole
$ sudo passwd -S tadpole
tadpole P 10/15/2019 0 99999 7 -1
```

The **chage** command is going to make a subtle change to the /etc/shadow file. The eighth field in that colon-separated file (shown below) will be set to zero (previously empty) and this means the account is essentially expired. The **chage** command tracks the number of days between password changes, but also provides account expiration information when this option is used. A zero in the eiighth field would mean that the account expires a day after January 1, 1970, but also simply locks it when a command like that shown above is used.

```
$ sudo grep tadpole /etc/shadow | fold
tadpole:$6$IC6icrWlNhndMFj6$Jj14Regv3b2EdK.8iLjSeO893fFig75f32rpWpbKPNz7g/eqeaPC
nXl3iQ7RFIN0BGC0E91sghFdX2eWTe2ET0:18184:0:99999:7::0:
                                                    ^
                                                    |
                                                    +--- days until expiration
```

To reverse this change, you can simply remove the 0 that was placed in the /etc/shadow entry for the user with a command like this:

```
% sudo chage -E-1 tadpole
```

Once an account is expired in this way, even passwordless [SSH][4] will not provide access.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3513982/locking-and-unlocking-accounts-on-linux-systems.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.networkworld.com/article/3441777/how-the-linux-screen-tool-can-save-your-tasks-and-your-sanity-if-ssh-is-interrupted.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
