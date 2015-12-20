translating

Fix: Cannot establish FTP connection to an SFTP server
================================================================================
### Problem ###

The other day I had to connect to my web server. I use [FileZilla][1] for connecting to FTP servers. When I entered the hostname and password and tried to connect to the FTP server, it gave me the following error:

> Error:    Cannot establish FTP connection to an SFTP server. Please select proper protocol.
> 
> Error:    Critical error: Could not connect to server

![FileZilla Cannot establish FTP connection to an SFTP server](http://itsfoss.com/wp-content/uploads/2015/12/FileZilla_FTP_SFTP_Problem_1.jpeg)

### Reason ###

By reading the error message itself made me realize my mistake. I was trying to establish an [FTP][2] connection with an [SFTP][3] server. Clearly, I was not using the correct protocol (which should have been SFTP and not FTP).

As you can see in the picture above, FileZilla defaults to FTP protocol.

### Solution for “Cannot establish FTP connection to an SFTP server” ###

Solution is simple. Use SFTP protocol instead of FTP. The one problem you might face is to know how to change the protocol to SFTP. This is where I am going to help you.

In FileZilla menu, go to **File->Site Manager**.

![FileZilla Site Manager](http://itsfoss.com/wp-content/uploads/2015/12/FileZilla_FTP_SFTP_Problem_2.jpeg)

In the Site Manager, go in General tab and select SFTP in Protocol. Also fill in the host server, port number, user password etc.

![Cannot establish FTP connection to an SFTP server](http://itsfoss.com/wp-content/uploads/2015/12/FileZilla_FTP_SFTP_Problem_3.png)

I hope you can handle things from here onward.

I hope this quick tutorial helped you to fix “Cannot establish FTP connection to an SFTP server. Please select proper protocol.” problem. In related articles, you can read this post to [know how to set up FTP server in Linux][4].

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-establish-ftp-connection-sftp-server/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://filezilla-project.org/
[2]:https://en.wikipedia.org/wiki/File_Transfer_Protocol
[3]:https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol
[4]:http://itsfoss.com/set-ftp-server-linux/
