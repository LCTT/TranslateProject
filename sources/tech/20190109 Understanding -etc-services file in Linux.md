[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding /etc/services file in Linux)
[#]: via: (https://kerneltalks.com/linux/understanding-etc-services-file-in-linux/)
[#]: author: (kerneltalks https://kerneltalks.com)

Understanding /etc/services file in Linux
======

Article which helps you to understand /etc/services file in Linux. Learn about content, format & importance of this file.

![/etc/services file in Linux][1]
/etc/services file in Linux

Internet daemon is important service in Linux world. It takes care of all network services with the help of `/etc/services` file. In this article we will walk you through content, format of this file and what it means to a Linux system.

`/etc/services` file contains list of network services and ports mapped to them. `inetd` or `xinetd` looks at these details so that it can call particular program when packet hits respective port and demand for service.

As a normal user you can view this file since file is world readable. To edit this file you need to have root privileges.

```
$ ll /etc/services
-rw-r--r--. 1 root root 670293 Jun  7  2013 /etc/services
```

### `/etc/services` file format

```
service-name    port/protocol   [aliases..]  [#comment]
```

Last two fields are optional hence denoted in `[` `]`

where –

  * service-name is name of the network service. e.g. [telnet][2], [ftp][3] etc.
  * port/protocol is port being used by that network service (numerical value) and protocol (TCP/UDP) used for communication by service.
  * alias is alternate name for service.
  * comment is note or description you can add to service. Starts with `#` mark



### Sample` /etc/services` file

```
# Each line describes one service, and is of the form:
#
# service-name  port/protocol  [aliases ...]   [# comment]

tcpmux          1/tcp                           # TCP port service multiplexer
rje             5/tcp                           # Remote Job Entry
echo            7/udp
discard         9/udp           sink null
```

Here, you can see use of optional last two fields as well. `discard` service has alternate name as `sink` or `null`.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/linux/understanding-etc-services-file-in-linux/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/kerneltalks.com/wp-content/uploads/2019/01/undestanding-etc-service-file-in-linux.png?ssl=1
[2]: https://kerneltalks.com/config/configure-telnet-server-linux/
[3]: https://kerneltalks.com/config/ftp-server-configuration-steps-rhel-6/
