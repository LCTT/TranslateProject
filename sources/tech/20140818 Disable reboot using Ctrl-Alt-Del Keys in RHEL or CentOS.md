Disable reboot using Ctrl-Alt-Del Keys in RHEL / CentOS
================================================================================
In Linux , It's a security concern for us  to allow anyone  to **reboot** the server using  **Ctrl-Alt-Del keys**. It is always recommended in production boxes that one should disable reboot uisng Ctrl-Alt-Del keys.
 
In this article we will discuss how can we disable reboot via above keys in RHEL & CentOS

### For RHEL 5.X & CentOS 5.X ### 

To prevent the **init** process from handling **Ctrl-Alt-Del**, edit the file  '**/etc/inittab**' comment the line which begins with '**ca::ctrlaltdel**:'  as shown below :

    [root@localhost ~]# cat /etc/inittab
    # Trap CTRL-ALT-DELETE
    #ca::ctrlaltdel:/sbin/shutdown -t3 -r now

We can also modify the line 'ca::ctrlaltdel:'  to generate logs , if anybody try to reboot the server using the keys ,

    [root@localhost ~]# cat /etc/inittab
    # Trap CTRL-ALT-DELETE
    ca::ctrlaltdel:/bin/logger -p authpriv.warning -t init "Console-invoked Ctrl-Alt-Del was ignored"

### For RHEL6.X & CentOS 6.X ###

In RHEL 6.X / CentOS 6.X , reboot using the keys are handled by the file '**/etc/init/control-alt-delete.conf**'.

**Step:1** Before making the changes , first take the backup using below command

    [root@localhost ~]# cp -v /etc/init/control-alt-delete.conf /etc/init/control-alt-delete.override

**Step:2** Edit the file , replacing the 'exec /sbin/shutdown' line with the following, which will simply generate a log entry each time Ctrl-Alt-Del is pressed:

    [root@localhost ~]# cat /etc/init/control-alt-delete.conf
    exec /usr/bin/logger -p authpriv.notice -t init "Ctrl-Alt-Del was pressed and ignored" 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/disable-reboot-using-ctrl-alt-del-keys/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/