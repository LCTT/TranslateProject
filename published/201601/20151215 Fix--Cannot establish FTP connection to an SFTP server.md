错误：无法与 SFTP 服务器建立 FTP 连接
================================================================================

### 问题 ###

有一天我要连接到我的 web 服务器。我使用 [FileZilla][1] 连接到 FTP 服务器。当我输入主机名和密码连接服务器后，我得到了下面的错误。

> Error:    Cannot establish FTP connection to an SFTP server. Please select proper protocol.
> 
> Error:    Critical error: Could not connect to server

![FileZilla Cannot establish FTP connection to an SFTP server](http://itsfoss.com/wp-content/uploads/2015/12/FileZilla_FTP_SFTP_Problem_1.jpeg)

### 原因 ###

看见错误信息后我意识到了我的错误是什么。我尝试与一台 **SFTP** 服务器建立一个 **[FTP][2]** 连接。很明显我没有使用一个正确的协议（应该是SFTP而不是FTP）。

如你在上图所见，FileZilla 默认使用的是FTP协议。

### 解决 “Cannot establish FTP connection to an SFTP server” 的方案 ###

解决方案很简单。使用 SFTP 协议而不是 FTP。你要做的就是把协议修改成 SFTP。这就是我要告诉你的。

在 FileZilla 菜单中，进入 **文件->站点管理**。

![FileZilla Site Manager](http://itsfoss.com/wp-content/uploads/2015/12/FileZilla_FTP_SFTP_Problem_2.jpeg)

在站点管理中，进入通用选项并选择 SFTP 协议。同样填上主机、端口号、用户密码等。

![Cannot establish FTP connection to an SFTP server](http://itsfoss.com/wp-content/uploads/2015/12/FileZilla_FTP_SFTP_Problem_3.png)

我希望你从这里可以开始工作了。

我希望本篇教程可以帮助你修复 “Cannot establish FTP connection to an SFTP server. Please select proper protocol.”这个问题。在相关的文章中，你可以读[了解在 Linux 中如何设置 FTP][4]。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-establish-ftp-connection-sftp-server/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://filezilla-project.org/
[2]:https://en.wikipedia.org/wiki/File_Transfer_Protocol
[3]:https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol
[4]:http://itsfoss.com/set-ftp-server-linux/
