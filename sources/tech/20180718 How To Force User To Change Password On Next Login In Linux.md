Translating by MjSeven


How To Force User To Change Password On Next Login In Linux
======
When you created the users account with a default password, you have to force the users to change their password on next login.

This option is mandatory when you were working in organization because old employees might know the default password and they may or may not try to malpractices.

This is one of the security complaint so, make sure you have to take care this in the proper way without any fail. Even your team members can do the same.

Most of the users are lazy and they don’t change their password until you force them to do so, make this practices.

For security reason you need to change your password frequently, or at-least once in a month.

Make sure you are using hard and guess password (The combination of Upper and Lower alphabets, Numbers, and Special characters) . It should be at-least 10-15 characters.

We have ran a shell script to create a user account in Linux server which automatically append a password for user, with combination of actual username followed by few numeric values.

We can achieve this by using the below two methods.

  * passwd command
  * chage command



**Suggested Read :**
**(#)** [How To Check Which Groups A User Belongs To On Linux][1]
**(#)** [How To Check User Created Date On Linux][2]
**(#)** [How To Reset/Change User Password In Linux][3]
**(#)** [How To Manage Password Expiration & Aging Using passwd Command][4]

### Method-1: Using passwd Command

passwd stands for password. It updates user’s authentication tokens. The passwd command/utility is used to set or modify or change users password.

Normal users are only allowed to change their own account but super users can change the password for any account.

Also, we can use an additional options which allows user to perform other activities such as deleting password for the user, lock/unlock the user account, set the password expiry for given user account, etc,.

This can be performed in Linux by calling the Linux-PAM and Libuser API.

Users details will be stored in /etc/passwd file when you created a user in Linux. The passwd file contain each/every user details as a single line with seven fields.

Also below four files will be updated while creating a new users in the Linux system.

  * `/etc/passwd:` User details will be updated in this file.
  * `/etc/shadow:` User password info will be updated in this file.
  * `/etc/group:` Group details will be updated of the new user in this file.
  * `/etc/gshadow:` Group password info will be updated of the new user in the file.



#### How To Perform This With passwd Command

We can perform this with passwd command by adding the `-e` option.

To test this, let’s create a new user account and see how it’s working.
```
# useradd -c "2g Admin - Magesh M" magesh && passwd magesh
Changing password for user magesh.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.

```

Expire the password for the given user account. The user will be forced to change the password during the next login attempt.
```
# passwd -e magesh
Expiring password for user magesh.
passwd: Success

```

It’s asking me to set a new password when i’m trying to login to the system at first time.
```
login as: magesh
[email protected]'s password:
You are required to change your password immediately (root enforced)
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user magesh.
Changing password for magesh.
(current) UNIX password:
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
Connection to localhost closed.

```

### Method-2: Using chage Command

chage stands for change age. It changes user password expiry information.

The chage command changes the number of days between password changes and the date of the last password change. This information is used by the system to determine when a user must change his/her password.

This allows user to perform other activities such as set account expiration date, set password inactive after expiration, show account aging information, set minimum & maximum number of days before password change and set expiration warning days.

#### How To Perform This With chage Command

Let’s perform this with help of chage command by adding the `-d` option.

To test this, let’s create a new user account and see how it’s working. We are going to create a user account called `thanu`.
```
# useradd -c "2g Editor - Thanisha M" thanu && passwd thanu
Changing password for user thanu.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.

```

To achieve this, set a user’s date of last password change to “0” with the chage command.
```
# chage -d 0 thanu

# chage -l thanu
Last password change : Jul 18, 2018
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7

```

It’s asking me to set a new password when i’m trying to login to the system at first time.
```
login as: thanu
[email protected]'s password:
You are required to change your password immediately (root enforced)
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user thanu.
Changing password for thanu.
(current) UNIX password:
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
Connection to localhost closed.

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-force-user-to-change-password-on-next-login-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/
[2]:https://www.2daygeek.com/how-to-check-user-created-date-on-linux/
[3]:https://www.2daygeek.com/passwd-command-examples/
[4]:https://www.2daygeek.com/passwd-command-examples-part-l/
