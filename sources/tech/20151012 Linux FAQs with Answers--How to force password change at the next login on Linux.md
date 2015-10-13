translating----geekpi

Linux FAQs with Answers--How to force password change at the next login on Linux
================================================================================
> **Question**: I manage a Linux server for multiple users to share. I have just created a new user account with some default password, and I want the user to change the default password immediately after the first login. Is there a way to force a user to change his/her password at the next login? 

In multi-user Linux environment, it's a standard practice to create user accounts with some random default password. Then after a successful login, a new user can change the default password to his or her own. For security reasons, it is often recommended to "force" users to change the default password after the first login to make sure that the initial one-time password is no longer used.

Here is **how to force a user to change his or her password on the next login**.

Every user account in Linux is associated with various password-related configurations and information. For example, it remembers the date of the last password change, the minimum/maximum number of days between password changes, and when to expire the current password, etc.

A command-line tool called chage can access and adjust password expiration related configurations. You can use this tool to force password change of any user at the next login.

To view password expiration information of a particular user (e.g., alice), run the following command. Note that you need root privilege only when you are checking password age information of any other user than yourself.

    $ sudo chage -l alice 

![](https://c1.staticflickr.com/1/727/21955581605_5471e61ee0_c.jpg)

### Force Password Change for a User ###

If you want to force a user to change his or her password, use the following command.

    $ sudo chage -d0 <user-name> 

Originally the "-d <N>" option is supposed to set the "age" of a password (in terms of the number of days since January 1st, 1970 when the password was last changed). So "-d0" indicates that the password was changed on January 1st, 1970, which essentially expires the current password, and causes it to be changed on the next login.

Another way to expire the current password is via passwd command.

    $ sudo passwd -e <user-name> 

The above command has the same effect of "chage -d0", making the current password of the user expire immediately.

Now check the password information of the user again, and you will see:

![](https://c2.staticflickr.com/6/5770/21767501480_ba88f00d80_c.jpg)

When you log in again, you will be asked to change the password. You will need to verify the current password one more time before the change.

![](https://c2.staticflickr.com/6/5835/21929638636_eed4d69cb9_c.jpg)

To set more comprehensive password policies (e.g., password complexity, reuse prevention), you can use PAM. See [the article][1] for more detail.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/force-password-change-next-login-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/set-password-policy-linux.html
