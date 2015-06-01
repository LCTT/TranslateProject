如何修复 “fatal error: security/pam_modules.h: No such file or directory”
================================================================================
> **问题**: 我尝试在 [某某 Linux 发行版] 上编译程序，但是出现下面的编译错误：
> 
>     "pam_otpw.c:27:34: fatal error: security/pam_modules.h: No such file or directory"
> 
> 我怎样才能修复这个错误?

缺失的头文件 'security/pam_modules.h' 是 libpam 开发版的一部分，一个 PAM(Pluggable Authentication Modules:插入式验证模块)库。因此要修复这个错误，你需要安装 libpam 开发包，如下所示。

对于 Debian、 Ubuntu 或者 Linux Mint:

    $ sudo apt-get install libpam0g-dev

对与 CentOS、 Fedora 或者 RHEL:

    $ sudo yum install gcc pam-devel

现在验证缺失的头文件是否安装到了 /usr/include/security。

![](https://farm8.staticflickr.com/7751/16819069693_fa961f0d40_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fatal-error-security-pam-modules.html

作者：[Dan Nanni][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni