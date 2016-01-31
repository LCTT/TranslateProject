grep 命令系列：从文件中搜索并显示文件名
================================================================================

我怎样从几个文件中搜索（grep），并只显示匹配到的文件的文件名？

当你从不止一个的文件中搜索时，默认它将显示文件名：

    grep "word" 文件名
    grep root /etc/*

示例输出：

    /etc/bash.bashrc:       See "man sudo_root" for details.
    /etc/crontab:17 *       * * *   root    cd / && run-parts --report /etc/cron.hourly
    /etc/crontab:25 6       * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
    /etc/crontab:47 6       * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
    /etc/crontab:52 6       1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
    /etc/group:root:x:0:
    grep: /etc/gshadow: Permission denied
    /etc/logrotate.conf:    create 0664 root utmp
    /etc/logrotate.conf:    create 0660 root utmp

每行开始的第一个部分是文件名（如：/etc/crontab、/etc/group）。使用 -l 选项可以只显示文件名：

    grep -l "string" filename
    grep -l root /etc/*

示例输出：

    /etc/aliases
    /etc/arpwatch.conf
    grep: /etc/at.deny: Permission denied
    /etc/bash.bashrc
    /etc/bash_completion
    /etc/ca-certificates.conf
    /etc/crontab
    /etc/group

你也可以逆转输出；使用 -L 选项来输出**那些不匹配的文件的文件名**：

    grep -L "word" filename
    grep -L root /etc/*

示例输出：

    /etc/apm
    /etc/apparmor
    /etc/apparmor.d
    /etc/apport
    /etc/apt
    /etc/avahi
    /etc/bash_completion.d
    /etc/bindresvport.blacklist
    /etc/blkid.conf
    /etc/bluetooth
    /etc/bogofilter.cf
    /etc/bonobo-activation
    /etc/brlapi.key

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/grep-from-files-and-display-the-file-name/

作者：Vivek Gite
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出