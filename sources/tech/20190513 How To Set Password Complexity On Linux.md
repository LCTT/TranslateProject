[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Set Password Complexity On Linux?)
[#]: via: (https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Set Password Complexity On Linux?
======

User management is one of the important task of Linux system administration.

There are many aspect is involved in this and implementing the strong password policy is one of them.

Navigate to the following URL, if you would like to **[generate a strong password on Linux][1]**.

It will Restrict unauthorized access to systems.

By default Linux is secure that everybody know. however, we need to make necessary tweak on this to make it more secure.

Insecure password will leads to breach security. So, take additional care on this.

Navigate to the following URL, if you would like to see the **[password strength and score][2]** of the generated strong password.

In this article, we will teach you, how to implement the best security policy on Linux.

We can use PAM (the “pluggable authentication module”) to enforce password policy On most Linux systems.

The file can be found in the following location.

For Redhat based systems @ `/etc/pam.d/system-auth` and Debian based systems @ `/etc/pam.d/common-password`.

The default password aging details can be found in the `/etc/login.defs` file.

I have trimmed this file for better understanding.

```
# vi /etc/login.defs

PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_MIN_LEN    5
PASS_WARN_AGE   7
```

**Details:**

  * **`PASS_MAX_DAYS:`**` ` Maximum number of days a password may be used.
  * **`PASS_MIN_DAYS:`**` ` Minimum number of days allowed between password changes.
  * **`PASS_MIN_LEN:`**` ` Minimum acceptable password length.
  * **`PASS_WARN_AGE:`**` ` Number of days warning given before a password expires.



We will show you, how to implement the below eleven password policies in Linux.

  * Password Max days
  * Password Min days
  * Password warning days
  * Password history or Deny Re-Used Passwords
  * Password minimum length
  * Minimum upper case characters
  * Minimum lower case characters
  * Minimum digits in password
  * Minimum other characters (Symbols)
  * Account lock – retries
  * Account unlock time



### What Is Password Max days?

This parameter limits the maximum number of days a password can be used. It’s mandatory for user to change his/her account password before expiry.

If they forget to change, they are not allowed to login into the system. They need to work with admin team to get rid of it.

It can be set in `/etc/login.defs` file. I’m going to set `90 days`.

```
# vi /etc/login.defs

PASS_MAX_DAYS   90
```

### What Is Password Min days?

This parameter limits the minimum number of days after password can be changed.

Say for example, if this parameter is set to 15 and user changed password today. Then he won’t be able to change the password again before 15 days from now.

It can be set in `/etc/login.defs` file. I’m going to set `15 days`.

```
# vi /etc/login.defs

PASS_MIN_DAYS   15
```

### What Is Password Warning Days?

This parameter controls the password warning days and it will warn the user when the password is going to expires.

A warning will be given to the user regularly until the warning days ends. This can helps user to change their password before expiry. Otherwise we need to work with admin team for unlock the password.

It can be set in `/etc/login.defs` file. I’m going to set `10 days`.

```
# vi /etc/login.defs

PASS_WARN_AGE   10
```

**Note:** All the above parameters only applicable for new accounts and not for existing accounts.

### What Is Password History Or Deny Re-Used Passwords?

This parameter keep controls of the password history. Keep history of passwords used (the number of previous passwords which cannot be reused).

When the users try to set a new password, it will check the password history and warn the user when they set the same old password.

It can be set in `/etc/pam.d/system-auth` file. I’m going to set `5` for history of password.

```
# vi /etc/pam.d/system-auth

password  sufficient  pam_unix.so md5 shadow nullok try_first_pass use_authtok remember=5
```

### What Is Password Minimum Length?

This parameter keeps the minimum password length. When the users set a new password, it will check against this parameter and warn the user if they try to set the password length less than that.

It can be set in `/etc/pam.d/system-auth` file. I’m going to set `12` character for minimum password length.

```
# vi /etc/pam.d/system-auth

password  requisite   pam_cracklib.so try_first_pass retry=3 minlen=12
```

**try_first_pass retry=3** : Allow users to set a good password before the passwd command aborts.

### Set Minimum Upper Case Characters?

This parameter keeps, how many upper case characters should be added in the password. These are password strengthening parameters ,which increase the password strength.

When the users set a new password, it will check against this parameter and warn the user if they are not including any upper case characters in the password.

It can be set in `/etc/pam.d/system-auth` file. I’m going to set `1` character for minimum password length.

```
# vi /etc/pam.d/system-auth

password   requisite   pam_cracklib.so try_first_pass retry=3 minlen=12 ucredit=-1
```

### Set Minimum Lower Case Characters?

This parameter keeps, how many lower case characters should be added in the password. These are password strengthening parameters ,which increase the password strength.

When the users set a new password, it will check against this parameter and warn the user if they are not including any lower case characters in the password.

It can be set in `/etc/pam.d/system-auth` file. I’m going to set `1` character.

```
# vi /etc/pam.d/system-auth

password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=12 lcredit=-1
```

### Set Minimum Digits In Password?

This parameter keeps, how many digits should be added in the password. These are password strengthening parameters ,which increase the password strength.

When the users set a new password, it will check against this parameter and warn the user if they are not including any digits in the password.

It can be set in `/etc/pam.d/system-auth` file. I’m going to set `1` character.

```
# vi /etc/pam.d/system-auth

password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=12 dcredit=-1
```

### Set Minimum Other Characters (Symbols) In Password?

This parameter keeps, how many Symbols should be added in the password. These are password strengthening parameters ,which increase the password strength.

When the users set a new password, it will check against this parameter and warn the user if they are not including any Symbol in the password.

It can be set in `/etc/pam.d/system-auth` file. I’m going to set `1` character.

```
# vi /etc/pam.d/system-auth

password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=12 ocredit=-1
```

### Set Account Lock?

This parameter controls users failed attempts. It locks user account after reaches the given number of failed login attempts.

It can be set in `/etc/pam.d/system-auth` file.

```
# vi /etc/pam.d/system-auth

auth        required      pam_tally2.so onerr=fail audit silent deny=5
account required pam_tally2.so
```

### Set Account Unlock Time?

This parameter keeps users unlock time. If the user account is locked after consecutive failed authentications.

It’s unlock the locked user account after reaches the given time. Sets the time (900 seconds = 15 minutes) for which the account should remain locked.

It can be set in `/etc/pam.d/system-auth` file.

```
# vi /etc/pam.d/system-auth

auth        required      pam_tally2.so onerr=fail audit silent deny=5 unlock_time=900
account required pam_tally2.so
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/5-ways-to-generate-a-random-strong-password-in-linux-terminal/
[2]: https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/
