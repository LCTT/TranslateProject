[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Update/Change Users Password in Linux Using Different Ways)
[#]: via: (https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

How to Update/Change Users Password in Linux Using Different Ways
======

It’s a basic thing to set a user password whenever you create an user account in Linux.

Everybody uses passwd command followed by the user name `passwd USERNAME` to set a password for a user.

Make sure you have to set a hard and guess password that will help you to make the system more secure.

I mean to say, it should be the combination of Alphabets, Symbols and numbers.

Also, i advise you to change the password at least once in a month for security reason.

When you use the passwd command it will ask you to enter the password twice to set it. It’s a native method to set a user password.

If you don’t want to update the password twice and would like to do this in different way?

Yes, we can. There will be a possibility to do.

If you are working as a Linux admin you might have asked the below questions many times.

Some of you may or may not got answer for these questions.

Whatever it’s, don’t worry we are here to answer your all questions.

  * How to Update/Change Users Password in Single Command?
  * How to Update/Change a Same Password for Multiple users in Linux?
  * How to Update/Change Multiple Users Password in Linux?
  * How to Update/Change Password for Multiple Users in Linux?
  * How to Update/Change Different Password for Multiple Users in Linux?
  * How to Update/Change Users Password in Multiple Linux Servers?
  * How to Update/Change Multiple Users Password in Multiple Linux Servers?



### Method-1: Using passwd Command

passwd command is a standard method to set or update or change password for users in Linux. The below way is a standard method to do it.

```
# passwd renu
Changing password for user renu.
New password:
BAD PASSWORD: The password contains the user name in some form
Retype new password:
passwd: all authentication tokens updated successfully.
```

Run the following command if you would like to set or change password with single command. This allow users to update password in a single command.

```
# echo "new_password" | passwd --stdin thanu
Changing password for user thanu.
passwd: all authentication tokens updated successfully.
```

### Method-2: Using chpasswd Command

chpasswd is an another command will allow us to set or update or change password for users in Linux. Use the following format if you would like to use chpasswd command to change password for user in a single command.

```
# echo "thanu:new_password" | chpasswd
```

### Method-3: How to Set Different Password for Multiple Users

Use the below script if you would like to set or update or change a password for multiple users in Linux with different password.

To do so, first we need to get a users list by using the following command. The below command will list the users who’s having `/home` directory and redirect the output to `user-list.txt` file.

```
# cat /etc/passwd | grep "/home" | cut -d":" -f1 > user-list.txt
```

List out the users using cat command. Remove the user from the list if you don’t want to reset the password for the specific user.

```
# cat user-list.txt
centos
magi
daygeek
thanu
renu
```

Create a following small shell script to achieve this.

```
# vi password-update.sh

#!/bin/sh
for user in `more user-list.txt`
do
echo "[email protected]" | passwd --stdin "$user"
chage -d 0 $user
done
```

Set an executable permission to `password-update.sh` file.

```
# chmod +x password-update.sh
```

Finally run the script to achieve this.

```
# ./password-up.sh

magi
Changing password for user magi.
passwd: all authentication tokens updated successfully.
daygeek
Changing password for user daygeek.
passwd: all authentication tokens updated successfully.
thanu
Changing password for user thanu.
passwd: all authentication tokens updated successfully.
renu
Changing password for user renu.
passwd: all authentication tokens updated successfully.
```

### Method-4: How to Set a Same Password for Multiple Users

Use the below script if you would like to set or update or change a same password for multiple users in Linux.

```
# vi password-update.sh

#!/bin/sh
for user in `more user-list.txt`
do
echo "new_password" | passwd --stdin "$user"
chage -d 0 $user
done
```

### Method-5: How to Change User password in Multiple Servers

Use the following script if you want to change a user password in multiple servers. In my case, we are going to change a password for `renu` user. Make sure you have to give the user name which you want to update the password instead of us.

Make sure you have to update the servers list into `server-list.txt` file. Each server should be in separate line.

```
# vi password-update.sh

#!/bin/bash
for server in `cat server-list.txt`
do
ssh [email protected]$server 'passwd --stdin renu <<EOF
new_passwd
new_passwd
EOF';
done
```

You will be getting the output similar to us.

```
# ./password-update.sh

New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
Retype new password: Changing password for user renu.
passwd: all authentication tokens updated successfully.
New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
Retype new password: Changing password for user renu.
passwd: all authentication tokens updated successfully.
```

### Method-6: How to Change User password in Multiple Servers Using pssh Command

pssh is a program for executing ssh in parallel on a number of hosts. It provides features such as sending input to all of the processes, passing a password to ssh, saving output to files, and timing out. Navigate to the following link to know more about **[PSSH Command][1]**.

```
# pssh -i -h /tmp/server-list.txt "printf '%s\n' new_pass new_pass | passwd --stdin root"
```

You will be getting the output similar to us.

```
[1] 07:58:07 [SUCCESS] CentOS.2daygeek.com
Changing password for user root.
passwd: all authentication tokens updated successfully.
Stderr: New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
Retype new password:
[2] 07:58:07 [SUCCESS] ArchLinux.2daygeek.com
Changing password for user root.
passwd: all authentication tokens updated successfully.
Stderr: New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
```

### Method-7: How to Change User password in Multiple Servers Using chpasswd Command

Alternatively we can use the chpasswd command to update the password for user in multiple servers.

```
# ./password-update.sh

#!/bin/bash
for server in `cat server-list.txt`
do
ssh [email protected]$server 'echo "magi:new_password" | chpasswd'
done
```

### Method-8: How to Change Multiple Users password in Linux Servers Using chpasswd Command

To do so, first create a file and update username and password in the below format. In my case i have created a file called `user-list.txt`.

See the details below.

Create a following small shell script to achieve this.

```
# vi password-update.sh

#!/bin/bash
for users in `cat user-list.txt`
do
echo $users | chpasswd
done
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/
