[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10616-1.html)
[#]: subject: (How to use sudo access in winSCP)
[#]: via: (https://kerneltalks.com/tools/how-to-use-sudo-access-in-winscp/)
[#]: author: (kerneltalks https://kerneltalks.com)

如何在 winSCP 中使用 sudo
======

> 用截图了解如何在 winSCP 中使用 sudo。

![How to use sudo access in winSCP][1]

*sudo access in winSCP*

首先你需要检查你尝试使用 winSCP 连接的 sftp 服务器的二进制文件的位置。

你可以使用以下命令检查 SFTP 服务器二进制文件位置： 

```
[root@kerneltalks ~]# cat /etc/ssh/sshd_config |grep -i sftp-server
Subsystem sftp  /usr/libexec/openssh/sftp-server
```

你可以看到 sftp 服务器的二进制文件位于 `/usr/libexec/openssh/sftp-server`。

打开 winSCP 并单击“高级”按钮打开高级设置。

![winSCP advance settings][2]

*winSCP 高级设置*

它将打开如下高级设置窗口。在左侧面板上选择“Environment”下的 “SFTP”。你会在右侧看到选项。

现在，使用命令 `sudo su -c` 在这里添加 SFTP 服务器值，如下截图所示：

![SFTP server setting in winSCP][3]

*winSCP 中的 SFTP 服务器设置*

所以我们在设置中添加了 `sudo su -c /usr/libexec/openssh/sftp-server`。单击“Ok”并像平常一样连接到服务器。

连接之后，你将可以从你以前需要 sudo 权限的目录传输文件了。

完成了！你已经使用 winSCP 使用 sudo 登录服务器了。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tools/how-to-use-sudo-access-in-winscp/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/kerneltalks.com/wp-content/uploads/2019/03/How-to-use-sudo-access-in-winSCP.png?ssl=1
[2]: https://i0.wp.com/kerneltalks.com/wp-content/uploads/2019/03/winscp-advanced-settings.jpg?ssl=1
[3]: https://i1.wp.com/kerneltalks.com/wp-content/uploads/2019/03/SFTP-server-setting-in-winSCP.jpg?ssl=1
