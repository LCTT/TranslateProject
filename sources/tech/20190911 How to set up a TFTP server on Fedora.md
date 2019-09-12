[#]: collector: (lujun9972)
[#]: translator: (amwps290 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up a TFTP server on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-set-up-a-tftp-server-on-fedora/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

How to set up a TFTP server on Fedora
======

![][1]

**TFTP**, or Trivial File Transfer Protocol, allows users to transfer files between systems using the [UDP protocol][2]. By default, it uses UDP port 69. The TFTP protocol is extensively used to support remote booting of diskless devices. So, setting up a TFTP server on your own local network can be an interesting way to do [Fedora installations][3], or other diskless operations.

TFTP can only read and write files to or from a remote system. It doesn’t have the capability to list files or make any changes on the remote server. There are also no provisions for user authentication. Because of security implications and the lack of advanced features, TFTP is generally only used on a local area network (LAN).

### TFTP server installation

The first thing you will need to do is install the TFTP client and server packages:

```
dnf install tftp-server tftp -y
```

This creates a _tftp_ service and socket file for [systemd][4] under _/usr/lib/systemd/system_.

```
/usr/lib/systemd/system/tftp.service
/usr/lib/systemd/system/tftp.socket
```

Next, copy and rename these files to _/etc/systemd/system_:

```
cp /usr/lib/systemd/system/tftp.service /etc/systemd/system/tftp-server.service

cp /usr/lib/systemd/system/tftp.socket /etc/systemd/system/tftp-server.socket
```

### Making local changes

You need to edit these files from the new location after you’ve copied and renamed them, to add some additional parameters. Here is what the _tftp-server.service_ file initially looks like:

```
[Unit]
Description=Tftp Server
Requires=tftp.socket
Documentation=man:in.tftpd

[Service]
ExecStart=/usr/sbin/in.tftpd -s /var/lib/tftpboot
StandardInput=socket

[Install]
Also=tftp.socket
```

Make the following changes to the _[Unit]_ section:

```
Requires=tftp-server.socket
```

Make the following changes to the _ExecStart_ line:

```
ExecStart=/usr/sbin/in.tftpd -c -p -s /var/lib/tftpboot
```

Here are what the options mean:

  * The _**-c**_ option allows new files to be created.
  * The _**-p**_ option is used to have no additional permissions checks performed above the normal system-provided access controls.
  * The _**-s**_ option is recommended for security as well as compatibility with some boot ROMs which cannot be easily made to include a directory name in its request.



The default upload/download location for transferring the files is _/var/lib/tftpboot_.

Next, make the following changes to the _[Install]_ section:

```
[Install]
WantedBy=multi-user.target
Also=tftp-server.socket
```

Don’t forget to save your changes!

Here is the completed _/etc/systemd/system/tftp-server.service_ file:

```
[Unit]
Description=Tftp Server
Requires=tftp-server.socket
Documentation=man:in.tftpd

[Service]
ExecStart=/usr/sbin/in.tftpd -c -p -s /var/lib/tftpboot
StandardInput=socket

[Install]
WantedBy=multi-user.target
Also=tftp-server.socket
```

### Starting the TFTP server

Reload the systemd daemon:

```
systemctl daemon-reload
```

Now start and enable the server:

```
systemctl enable --now tftp-server
```

To change the permissions of the TFTP server to allow upload and download functionality, use this command. Note TFTP is an inherently insecure protocol, so this may not be advised on a network you share with other people.

```
chmod 777 /var/lib/tftpboot
```

Configure your firewall to allow TFTP traffic:

```
firewall-cmd --add-service=tftp --perm
firewall-cmd --reload
```

### Client Configuration

Install the TFTP client:

```
yum install tftp -y
```

Run the _tftp_ command to connect to the TFTP server. Here is an example that enables the verbose option:

```
[client@thinclient:~ ]$ tftp 192.168.1.164
tftp> verbose
Verbose mode on.
tftp> get server.logs
getting from 192.168.1.164:server.logs to server.logs [netascii]
Received 7 bytes in 0.0 seconds [inf bits/sec]
tftp> quit
[client@thinclient:~ ]$
```

Remember, TFTP does not have the ability to list file names. So you’ll need to know the file name before running the _get_ command to download any files.

* * *

_Photo by _[_Laika Notebooks_][5]_ on [Unsplash][6]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-set-up-a-tftp-server-on-fedora/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/tftp-server-816x345.jpg
[2]: https://en.wikipedia.org/wiki/User_Datagram_Protocol
[3]: https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/advanced/Network_based_Installations/
[4]: https://fedoramagazine.org/systemd-getting-a-grip-on-units/
[5]: https://unsplash.com/@laikanotebooks?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[6]: https://unsplash.com/search/photos/file-folders?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
