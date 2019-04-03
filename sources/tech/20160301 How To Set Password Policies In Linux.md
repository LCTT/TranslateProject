[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Set Password Policies In Linux)
[#]: via: (https://www.ostechnix.com/how-to-set-password-policies-in-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Set Password Policies In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2016/03/How-To-Set-Password-Policies-In-Linux-720x340.jpg)

Even though Linux is secure by design, there are many chances for the security breach. One of them is weak passwords. As a System administrator, you must provide a strong password for the users. Because, mostly system breaches are happening due to weak passwords. This tutorial describes how to set password policies such as **password length** , **password complexity** , **password** **expiration period** etc., in DEB based systems like Debian, Ubuntu, Linux Mint, and RPM based systems like RHEL, CentOS, Scientific Linux.

### Set password length in DEB based systems

By default, all Linux operating systems requires **password length of minimum 6 characters** for the users. I strongly advice you not to go below this limit. Also, don’t use your real name, parents/spouse/kids name, or your date of birth as a password. Even a novice hacker can easily break such kind of passwords in minutes. The good password must always contains more than 6 characters including a number, a capital letter, and a special character.

Usually, the password and authentication-related configuration files will be stored in **/etc/pam.d/** location in DEB based operating systems.

To set minimum password length, edit**/etc/pam.d/common-password** file;

```
$ sudo nano /etc/pam.d/common-password
```

Find the following line:

```
password [success=2 default=ignore] pam_unix.so obscure sha512
```

![][2]

And add an extra word: **minlen=8** at the end. Here I set the minimum password length as **8**.

```
password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=8
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_002-3-1.jpg)

Save and close the file. So, now the users can’t use less than 8 characters for their password.

### Set password length in RPM based systems

**In RHEL, CentOS, Scientific Linux 7.x** systems, run the following command as root user to set password length.

```
# authconfig --passminlen=8 --update
```

To view the minimum password length, run:

```
# grep "^minlen" /etc/security/pwquality.conf
```

**Sample output:**

```
minlen = 8
```

**In RHEL, CentOS, Scientific Linux 6.x** systems, edit **/etc/pam.d/system-auth** file:

```
# nano /etc/pam.d/system-auth
```

Find the following line and add the following at the end of the line:

```
password requisite pam_cracklib.so try_first_pass retry=3 type= minlen=8
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/root@server_003-3.jpg)

As per the above setting, the minimum password length is **8** characters.

### Set password complexity in DEB based systems

This setting enforces how many classes, i.e upper-case, lower-case, and other characters, should be in a password.

First install password quality checking library using command:

```
$ sudo apt-get install libpam-pwquality
```

Then, edit **/etc/pam.d/common-password** file:

```
$ sudo nano /etc/pam.d/common-password
```

To set at least one **upper-case** letters in the password, add a word **‘ucredit=-1’** at the end of the following line.

```
password requisite pam_pwquality.so retry=3 ucredit=-1
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_001-7.jpg)

Set at least one **lower-case** letters in the password as shown below.

```
password requisite pam_pwquality.so retry=3 dcredit=-1
```

Set at least **other** letters in the password as shown below.

```
password requisite pam_pwquality.so retry=3 ocredit=-1
```

As you see in the above examples, we have set at least (minimum) one upper-case, lower-case, and a special character in the password. You can set any number of maximum allowed upper-case, lower-case, and other letters in your password.

You can also set the minimum/maximum number of allowed classes in the password.

The following example shows the minimum number of required classes of characters for the new password:

```
password requisite pam_pwquality.so retry=3 minclass=2
```

### Set password complexity in RPM based systems

**In RHEL 7.x / CentOS 7.x / Scientific Linux 7.x:**

To set at least one lower-case letter in the password, run:

```
# authconfig --enablereqlower --update
```

To view the settings, run:

```
# grep "^lcredit" /etc/security/pwquality.conf
```

**Sample output:**

```
lcredit = -1
```

Similarly, set at least one upper-case letter in the password using command:

```
# authconfig --enablerequpper --update
```

To view the settings:

```
# grep "^ucredit" /etc/security/pwquality.conf
```

**Sample output:**

```
ucredit = -1
```

To set at least one digit in the password, run:

```
# authconfig --enablereqdigit --update
```

To view the setting, run:

```
# grep "^dcredit" /etc/security/pwquality.conf
```

**Sample output:**

```
dcredit = -1
```

To set at least one other character in the password, run:

```
# authconfig --enablereqother --update
```

To view the setting, run:

```
# grep "^ocredit" /etc/security/pwquality.conf
```

**Sample output:**

```
ocredit = -1
```

In **RHEL 6.x / CentOS 6.x / Scientific Linux 6.x systems** , edit **/etc/pam.d/system-auth** file as root user:

```
# nano /etc/pam.d/system-auth
```

Find the following line and add the following at the end of the line:

```
password requisite pam_cracklib.so try_first_pass retry=3 type= minlen=8 dcredit=-1 ucredit=-1 lcredit=-1 ocredit=-1
```

As per the above setting, the password must have at least 8 characters. In addtion, the password should also have at least one upper-case letter, one lower-case letter, one digit, and one other characters.

### Set password expiration period in DEB based systems

Now, We are going to set the following policies.

  1. Maximum number of days a password may be used.
  2. Minimum number of days allowed between password changes.
  3. Number of days warning given before a password expires.



To set this policy, edit:

```
$ sudo nano /etc/login.defs
```

Set the values as per your requirement.

```
PASS_MAX_DAYS 100
PASS_MIN_DAYS 0
PASS_WARN_AGE 7
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_002-8.jpg)

As you see in the above example, the user should change the password once in every **100** days and the warning message will appear **7** days before password expiration.

Be mindful that these settings will impact the newly created users.

To set maximum number of days between password change to existing users, you must run the following command:

```
$ sudo chage -M <days> <username>
```

To set minimum number of days between password change, run:

```
$ sudo chage -m <days> <username>
```

To set warning before password expires, run:

```
$ sudo chage -W <days> <username>
```

To display the password for the existing users, run:

```
$ sudo chage -l sk
```

Here, **sk** is my username.

**Sample output:**

```
Last password change : Feb 24, 2017
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
```

As you see in the above output, the password never expires.

To change the password expiration period of an existing user,

```
$ sudo chage -E 24/06/2018 -m 5 -M 90 -I 10 -W 10 sk
```

The above command will set password of the user **‘sk’** to expire on **24/06/2018**. Also the the minimum number days between password change is set 5 days and the maximum number of days between password changes is set to **90** days. The user account will be locked automatically after **10 days** and It will display a warning message for **10 days** before password expiration.

### Set password expiration period in RPM based systems

This is same as DEB based systems.

### Forbid previously used passwords in DEB based systems

You can limit the users to set a password which is already used in the past. To put this in layman terms, the users can’t use the same password again.

To do so, edit**/etc/pam.d/common-password** file:

```
$ sudo nano /etc/pam.d/common-password
```

Find the following line and add the word **‘remember=5’** at the end:

```
password        [success=2 default=ignore]      pam_unix.so obscure use_authtok try_first_pass sha512 remember=5
```

The above policy will prevent the users to use the last 5 used passwords.

### Forbid previously used passwords in RPM based systems

This is same for both RHEL 6.x and RHEL 7.x and it’s clone systems like CentOS, Scientific Linux.

Edit **/etc/pam.d/system-auth** file as root user,

```
# vi /etc/pam.d/system-auth
```

Find the following line, and add **remember=5** at the end.

```
password     sufficient     pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5
```

You know now what is password policies in Linux, and how to set different password policies in DEB and RPM based systems.

That’s all for now. I will be here soon with another interesting and useful article. Until then stay tuned with OSTechNix. If you find this tutorial helpful, share it on your social, professional networks and support us.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-set-password-policies-in-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_003-2-1.jpg
