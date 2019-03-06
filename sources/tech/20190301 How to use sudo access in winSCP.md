[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use sudo access in winSCP)
[#]: via: (https://kerneltalks.com/tools/how-to-use-sudo-access-in-winscp/)
[#]: author: (kerneltalks https://kerneltalks.com)

How to use sudo access in winSCP
======

Learn how to use sudo access in winSCP with screenshots.

![How to use sudo access in winSCP][1]sudo access in winSCP

First of all you need to check where is your SFTP server binary located on server you are trying to connect with winSCP.

You can check SFTP server binary location with below command –

```
[root@kerneltalks ~]# cat /etc/ssh/sshd_config |grep -i sftp-server
Subsystem sftp  /usr/libexec/openssh/sftp-server
```

Here you can see sftp server binary is located at `/usr/libexec/openssh/sftp-server`

Now open winSCP and click `Advanced` button to open up advanced settings.

![winSCP advance settings][2]
winSCP advance settings

It will open up advanced setting window like one below. Here select `SFTP `under `Environment` on left hand side panel. You will be presented with option on right hand side.

Now, add SFTP server value here with command `sudo su -c` here as displayed in screenshot below –

![SFTP server setting in winSCP][3]
SFTP server setting in winSCP

So we added `sudo su -c /usr/libexec/openssh/sftp-server` in settings here. Now click Ok and connect to server as you normally do.

After connection you will be able to transfer files from directory where you normally need sudo permission to access.

That’s it! You logged to server using winSCP and sudo access.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tools/how-to-use-sudo-access-in-winscp/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/kerneltalks.com/wp-content/uploads/2019/03/How-to-use-sudo-access-in-winSCP.png?ssl=1
[2]: https://i0.wp.com/kerneltalks.com/wp-content/uploads/2019/03/winscp-advanced-settings.jpg?ssl=1
[3]: https://i1.wp.com/kerneltalks.com/wp-content/uploads/2019/03/SFTP-server-setting-in-winSCP.jpg?ssl=1
