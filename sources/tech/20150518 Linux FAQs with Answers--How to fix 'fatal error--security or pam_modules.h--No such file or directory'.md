Linux FAQs with Answers--How to fix “fatal error: security/pam_modules.h: No such file or directory”
================================================================================
> **Question**: I was trying to compile a program on [insert your Linux distro], but was getting the following compile error:
> 
>     "pam_otpw.c:27:34: fatal error: security/pam_modules.h: No such file or directory"
> 
> How can I fix this error?

The missing header file 'security/pam_modules.h' is part of development files for libpam, a PAM (Pluggable Authentication Modules) library. Thus to fix this error, you need to install libpam development package, as described below.

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install libpam0g-dev

On CentOS, Fedora or RHEL:

    $ sudo yum install gcc pam-devel

Now verify that the missing header file is installed under /usr/include/security.

![](https://farm8.staticflickr.com/7751/16819069693_fa961f0d40_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fatal-error-security-pam-modules.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni