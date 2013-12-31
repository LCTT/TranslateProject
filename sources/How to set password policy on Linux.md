How to set password policy on Linux
================================================================================
User account management is one of the most critical jobs of system admins. In particular, password security should be considered the top concern for any secure Linux system. In this tutorial, I will describe **how to set password policy on Linux**.

I assume that you are using [PAM (Pluggable Authentication Modules)][1] on your Linux system, which is the case on all recent Linux distros.

### Preparation ###

Install PAM module to enable cracklib support, which can provide additional password checking capabilities.

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install libpam-cracklib 

The cracklib PAM module is installed by default on CentOS, Fedora, or RHEL. So no further installation is necessary on those systems.

To enforce password policy, we need to modify PAM configuration file located at /etc/pam.d. Policy change will take effect immediately after change.

Note that the password rules presented in this tutorial will be enforced only when non-root users change passwords, but not the root.

### Prevent Reusing Old Passwords ###

Look for a line that contains both "password" and "pam_unix.so", and append "remember=5" to that line. It will prevent five most recently used passwords (by storing them in /etc/security/opasswd).

On Debian, Ubuntu or Linux Mint:

    $ sudo vi /etc/pam.d/common-password 

> password     [success=1 default=ignore]    pam_unix.so obscure sha512 remember=5

On Fedora, CentOS or RHEL:

    $ sudo vi /etc/pam.d/system-auth 

> password   sufficient   pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5

### Set Minimum Password Length ###

Look for a line that contains both "password" and "pam_cracklib.so", and append "minlen=10" to that line. This will enforce a password of length (10 - <# of types>), where <# of types> indicates how many different types of characters are used in the password. There are four types (upper-case, lower-case, numeric, and symbol) of characters. So if you use a combination of all four types, and minlen is set to 10, the shorted password allowed would be 6.

On Debian, Ubuntu or Linux Mint:

    $ sudo vi /etc/pam.d/common-password 

> password   requisite    pam_cracklib.so retry=3 minlen=10 difok=3

On Fedora, CentOS or RHEL:

    $ sudo vi /etc/pam.d/system-auth 

> password   requisite   pam_cracklib.so retry=3 difok=3 minlen=10

### Set Password Complexity ###

Look for a line that contains "password" and "pam_cracklib.so", and append "ucredit=-1 lcredit=-2 dcredit=-1 ocredit=-1" to that line. This will force you to include at least one upper-case letter (ucredit), two lower-case letters (lcredit), one digit (dcredit) and one symbol (ocredit).

On Debian, Ubuntu or Linux Mint:

    $ sudo vi /etc/pam.d/common-password 

> password   requisite    pam_cracklib.so retry=3 minlen=10 difok=3 ucredit=-1 lcredit=-2 dcredit=-1 ocredit=-1

On Fedora, CentOS or RHEL:

    $ sudo vi /etc/pam.d/system-auth 

> password   requisite   pam_cracklib.so retry=3 difok=3 minlen=10 ucredit=-1 lcredit=-2 dcredit=-1 ocredit=-1

### Set Password Expiration Period ###

To set the maximum period of time the current password is valid, edit the following variables in /etc/login.defs.

    $ sudo vi /etc/login.defs 

> PASS_MAX_DAYS   150
> PASS_MIN_DAYS   0
> PASS_WARN_AGE   7

This will force every user to change their password once every six months, and send out a warning message seven days prior to password expiration.

If you want to set password expiration on per-user basis, use chage command instead. To view password expiration policy for a specific user:

    $ sudo chage -l xmodulo 

> Last password change                                    : Dec 30, 2013
> Password expires                                        : never
> Password inactive                                       : never
> Account expires                                         : never
> Minimum number of days between password change          : 0
> Maximum number of days between password change          : 99999
> Number of days of warning before password expires       : 7

By default, a user's password is set to never expire.

To change the password expiration period for user xmodulo:

    $ sudo chage -E 6/30/2014 -m 5 -M 90 -I 30 -W 14 xmodulo 

The above command will set the password to expire on 6/30/2014. In addition, the minimum/maximum number of days between password changes is set to 5 and 90 respectively. The account will be locked 30 days after a password expires, and a warning message will be sent out 14 days before password expiration.

[![](http://farm4.staticflickr.com/3779/11640903324_474963b7bb.jpg)][2]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/set-password-policy-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux-pam.org/
[2]:http://www.flickr.com/photos/xmodulo/11640903324/