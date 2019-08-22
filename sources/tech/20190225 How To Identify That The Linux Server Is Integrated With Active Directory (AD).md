[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Identify That The Linux Server Is Integrated With Active Directory (AD)?)
[#]: via: (https://www.2daygeek.com/how-to-identify-that-the-linux-server-is-integrated-with-active-directory-ad/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

How To Identify That The Linux Server Is Integrated With Active Directory (AD)?
======

Single Sign On (SSO) Authentication is an implemented in most of the organizations due to multiple applications access.

It allows a user to logs in with a single ID and password to all the applications which is available in the organization.

It uses a centralized authentication system for all the applications.

A while ago we had written an article, **[how to integrate Linux system with AD][1]**.

Today we are going to show you, how to check that the Linux system is integrated with AD using multiple ways.

It can be done in four ways and we will explain one by one.

  * **`ps Command:`** It report a snapshot of the current processes.
  * **`id Command:`** It prints user identity.
  * **`/etc/nsswitch.conf file:`** It is Name Service Switch configuration file.
  * **`/etc/pam.d/system-auth file:`** It is Common configuration file for PAMified services.



### How To Identify That The Linux Server Is Integrated With AD Using PS Command?

ps command displays information about a selection of the active processes.

To integrate the Linux server with AD, we need to use either `winbind` or `sssd` or `ldap` service.

So, use the ps command to filter these services.

If you found any of these services is running on system then we can decide that the system is currently integrate with AD using “winbind” or “sssd” or “ldap” service.

You might get the output similar to below if the system is integrated with AD using `SSSD` service.

```
# ps -ef | grep -i "winbind\|sssd"

root 29912 1 0 2017 ? 00:19:09 /usr/sbin/sssd -f -D
root 29913 29912 0 2017 ? 04:36:59 /usr/libexec/sssd/sssd_be --domain 2daygeek.com --uid 0 --gid 0 --debug-to-files
root 29914 29912 0 2017 ? 00:29:28 /usr/libexec/sssd/sssd_nss --uid 0 --gid 0 --debug-to-files
root 29915 29912 0 2017 ? 00:09:19 /usr/libexec/sssd/sssd_pam --uid 0 --gid 0 --debug-to-files
root 31584 26666 0 13:41 pts/3 00:00:00 grep sssd
```

You might get the output similer to below if the system is integrated with AD using `winbind` service.

```
# ps -ef | grep -i "winbind\|sssd"

root 676 21055 0 2017 ? 00:00:22 winbindd
root 958 21055 0 2017 ? 00:00:35 winbindd
root 21055 1 0 2017 ? 00:59:07 winbindd
root 21061 21055 0 2017 ? 11:48:49 winbindd
root 21062 21055 0 2017 ? 00:01:28 winbindd
root 21959 4570 0 13:50 pts/2 00:00:00 grep -i winbind\|sssd
root 27780 21055 0 2017 ? 00:00:21 winbindd
```

### How To Identify That The Linux Server Is Integrated With AD Using id Command?

It Prints information for given user name, or the current user. It displays the UID, GUID, User Name, Primary Group Name and Secondary Group Name, etc.,

If the Linux system is integrated with AD then you might get the output like below. The GID clearly shows that the user is coming from AD “domain users”.

```
# id daygeek

uid=1918901106(daygeek) gid=1918900513(domain users) groups=1918900513(domain users)
```

### How To Identify That The Linux Server Is Integrated With AD Using nsswitch.conf file?

The Name Service Switch (NSS) configuration file, `/etc/nsswitch.conf`, is used by the GNU C Library and certain other applications to determine the sources from which to obtain name-service information in a range of categories, and in what order. Each category of information is identified by a database name.

You might get the output similar to below if the system is integrated with AD using `SSSD` service.

```
# cat /etc/nsswitch.conf | grep -i "sss\|winbind\|ldap"

passwd: files sss
shadow: files sss
group: files sss
services:   files sss
netgroup: files sss
automount: files sss
```

You might get the output similar to below if the system is integrated with AD using `winbind` service.

```
# cat /etc/nsswitch.conf | grep -i "sss\|winbind\|ldap"

passwd: files [SUCCESS=return] winbind
shadow: files [SUCCESS=return] winbind
group: files [SUCCESS=return] winbind
```

You might get the output similer to below if the system is integrated with AD using `ldap` service.

```
# cat /etc/nsswitch.conf | grep -i "sss\|winbind\|ldap"

passwd: files ldap
shadow: files ldap
group: files ldap
```

### How To Identify That The Linux Server Is Integrated With AD Using system-auth file?

It is Common configuration file for PAMified services.

PAM stands for Pluggable Authentication Module that provides dynamic authentication support for applications and services in Linux.

system-auth configuration file is provide a common interface for all applications and service daemons calling into the PAM library.

The system-auth configuration file is included from nearly all individual service configuration files with the help of the include directive.

You might get the output similar to below if the system is integrated with AD using `SSSD` service.

```
# cat /etc/pam.d/system-auth | grep -i "pam_sss.so\|pam_winbind.so\|pam_ldap.so"
or
# cat /etc/pam.d/system-auth-ac | grep -i "pam_sss.so\|pam_winbind.so\|pam_ldap.so"

auth sufficient pam_sss.so use_first_pass
account [default=bad success=ok user_unknown=ignore] pam_sss.so
password sufficient pam_sss.so use_authtok
session optional pam_sss.so
```

You might get the output similar to below if the system is integrated with AD using `winbind` service.

```
# cat /etc/pam.d/system-auth | grep -i "pam_sss.so\|pam_winbind.so\|pam_ldap.so"
or
# cat /etc/pam.d/system-auth-ac | grep -i "pam_sss.so\|pam_winbind.so\|pam_ldap.so"

auth sufficient pam_winbind.so cached_login use_first_pass
account [default=bad success=ok user_unknown=ignore] pam_winbind.so cached_login
password sufficient pam_winbind.so cached_login use_authtok
```

You might get the output similar to below if the system is integrated with AD using `ldap` service.

```
# cat /etc/pam.d/system-auth | grep -i "pam_sss.so\|pam_winbind.so\|pam_ldap.so"
or
# cat /etc/pam.d/system-auth-ac | grep -i "pam_sss.so\|pam_winbind.so\|pam_ldap.so"

auth sufficient pam_ldap.so cached_login use_first_pass
account [default=bad success=ok user_unknown=ignore] pam_ldap.so cached_login
password sufficient pam_ldap.so cached_login use_authtok
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-identify-that-the-linux-server-is-integrated-with-active-directory-ad/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/join-integrate-rhel-centos-linux-system-to-windows-active-directory-ad-domain/
