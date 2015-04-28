在RHEL/CentOS 5/6下停用按下Ctrl-Alt-Del 重启系统的功能
================================================================================
在Linux里，由于对安全的考虑，我们允许任何人按下**Ctrl-Alt-Del**来**重启**系统。但是在生产环境中，应该停用按下Ctrl-Alt-Del 重启系统的功能。

在这篇文章里，我们将要介绍如何在RHEL和CentOS下停用该热键。

### 在RHEL 5.X和CentOS 5.X下 ### 

保护**init**进程免于**Ctrl-Alt-Del**,像下面一样编辑'**/etc/inittab**'里由'**ca::ctrlaltdel**:'开头的一行:

    [root@localhost ~]# cat /etc/inittab
    # Trap CTRL-ALT-DELETE
    #ca::ctrlaltdel:/sbin/shutdown -t3 -r now

我们还可以改变'ca::ctrlaltdel:'这行来输出日志 ,如果任何人想用该热键重启服务器,就会有日志,

    [root@localhost ~]# cat /etc/inittab
    # Trap CTRL-ALT-DELETE
    ca::ctrlaltdel:/bin/logger -p authpriv.warning -t init "Console-invoked Ctrl-Alt-Del was ignored"

### 在RHEL6.X和CentOS 6.X下 ###

在RHEL6.X和CentOS 6.X下, 该热键的行为由'**/etc/init/control-alt-delete.conf**'控制.

**第一步** 在变化之前，先用下列命令备份配置

    [root@localhost ~]# cp -v /etc/init/control-alt-delete.conf /etc/init/control-alt-delete.override

**第二步**编辑文件，把'exec /sbin/shutdown'这一行用下方配置代替，这个配置会在每次按下Ctrl-Alt-Del 时输出日志:

    [root@localhost ~]# cat /etc/init/control-alt-delete.conf
    exec /usr/bin/logger -p authpriv.notice -t init "Ctrl-Alt-Del was pressed and ignored" 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/disable-reboot-using-ctrl-alt-del-keys/

作者：[Pradeep Kumar][a]
译者：[2q1w2007](https://github.com/2q1w2007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/