Install a Centralized Log Server with Rsyslog in Debian 9
======

In Linux, the log files are files that contain messages about the system functions which are used by system administrators to identify eventual issues on the machines. The logs help administrators to visualize the events that happened in the system over time periods. Usually, all log files are kept under **/var/log** directory in Linux. In this location, there are several types of log files for storing various messages, such as a log file for recording system events, a log file for security related messages, other log files dedicated for kernel, users or cron jobs. The main purpose of log files is to troubleshoot system problems. Most log files in Linux are controlled by rsyslogd service. On newer releases of Linux distributions, the log files are also controlled and managed by the journald system service, which is a part of systemd initialization program. The logs stored by journal daemon are written in a binary format and are mainly volatile, stored in RAM and in a ring-buffer in /run/log/journal/. However, the journal service can be also configured to permanently store the Syslog messages.

In Linux, the rsyslog server can be configured to run a central log manager, in a service-client model fashion, and send log messages over the network via TCP or UDP transport protocols or receive logs from network devices, servers, routers, switches or other systems or embedded devices that generate logs.

Rsyslog daemon can be setup to run as a client and server at the same time. Configured to run as a server, Rsyslog will listen on default port 514 TCP and UDP and will start to collect log messages that are sent over the network by remote systems.  As client, Rsyslog will send over the network the internal log messages to a remote Ryslog server via the same TCP or UDP ports.

Rsyslog will filter syslog messages according to selected properties and actions. The rsyslog filters are as follows:

  1. Facility or Priority filers
  2. Property-based filters
  3. Expression-based filters



The **facility** filter is represented by the Linux internal subsystem that produces the logs. They are categorized as presented below:

  * **auth/authpriv** = messages produced by authentication processes
  * **cron** = logs related to cron tasks
  * **daemon** = messages related to running system services
  * **kernel** = Linux kernel messages
  * **mail** = mail server messages
  * **syslog** = messages related to syslog or other daemons (DHCP server sends logs here)
  * **lpr** = printers or print server messages
  * **local0 - local7** = custom messages under administrator control



The **priority or severity** levels are assigned to a keyword and a number as described below.

  * **emerg** = Emergency - 0
  * **alert** = Alerts - 1
  * **err** = Errors - 3
  * **warn** = Warnings - 4
  * **notice** = Notification - 5
  * **info** = Information - 6
  * **debug** = Debugging - 7 highest level



There are also some special Rsyslog keywords available such as the asterisk ( ***** ) sign to define all
facilities or priorities, the **none** keyword which specify no priorities, the equal sign ( **=** ) which selects only that priority and the exclamation sign ( **!** ) which negates a priority.

The action part of the syslog is represented by the **destination** statement. The destination of a log message can be a file stored in the file system, a file in /var/log/ system path, another local process input via a named pipe or FIFO. The log messages can be also directed to users, discarded to a black hole (/dev/null) or sent to stdout or to a remote syslog server via TCP/UDP protocol. The log messages can be also stored in a database, such as MySQL or PostgreSQL.

### Configure Rsyslog as a Server

The Rsyslog daemon is automatically installed in most Linux distributions. However, if Rsyslog is not installed on your system you can issue one of the below commands in order to install the service> you will require root privileges to run the commands.

In Debian based distros:

sudo apt-get install rsyslog

In RHEL based distros like CentOS:

sudo yum install rsyslog

In order to verify if Rsyslog daemon is started on a system execute the below commands, depending on your distribution version.

On newer Linux distros with systemd:

systemctl status rsyslog.service

On older Linux versions with init:

service rsyslog status

/etc/init.d/rsyslog status

In order to start the rsyslog daemon issue the following command.

On older Linux versions with init:

service rsyslog start

/etc/init.d/rsyslog start

On latest Linux distros:

systemctl start rsyslog.service

To setup an rsyslog program to run in server mode, edit the main configuration file in **/etc/rsyslog.conf.** In this file make the following changes as shown in the below sample.

sudo vi /etc/rsyslog.conf

Locate and uncomment by removing the hashtag (#) the following lines in order to allow UDP log message reception on 514 port. By default, the UDP port is used by syslog to send-receive messages.
```
$ModLoad imudp
$UDPServerRun 514
```

Because the UDP protocol is not reliable to exchange data over a network, you can setup Rsyslog to output log messages to a remote server via TCP protocol. To enable TCP reception protocol, open **/etc/rsyslog.conf** file and uncomment the following lines as shown below. This will allow the rsyslog daemon to bind and listen on a TCP socket on port 514.
```
$ModLoad imtcp
 $InputTCPServerRun 514 ****
```

Both protocols can be enabled in rsyslog to run at the same time.

If you want to specify to which senders you permit access to rsyslog daemon, add the following line after the enabled protocol lines:
```
$AllowedSender TCP, 127.0.0.1, 10.110.50.0/24, *.yourdomain.com
```

You will also need to create a new template that will be parsed by rsyslog daemon before receiving the incoming logs. The template should instruct the local Rsyslog server where to store the incoming log messages. Define the template right after the **$AllowedSender** line as shown in the below sample.
```
$template Incoming-logs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" 
*.*  ?Incoming-logs
& ~
```

**** To log only the messages generated by kern facility use the below syntax.
```
kern.*   ?Incoming-logs
```

The received logs are parsed by the above template and will be stored in the local file system in /var/log/ directory, in files named after the client hostname client facility that produced the messages: %HOSTNAME% and %PROGRAMNAME% variables.

The below **& ~** redirect rule configures the Rsyslog daemon to save the incoming log messages only to the above files specified by the variables names. Otherwise, the received logs will be further processed and also stored in the content of local logs, such as /var/log/syslog file.

To add a rule to discard all related log messages to mail, you can use the following statement.
```
mail.* ~
```

Other variables that can be used to output file names are: %syslogseverity%, %syslogfacility%, %timegenerated%, %HOSTNAME%, %syslogtag%, %msg%, %FROMHOST-IP%, %PRI%, %MSGID%, %APP-NAME%, %TIMESTAMP%, %$year%, %$month%, %$day%

Starting with Rsyslog version 7, a new configuration format can be used to declare a template in an Rsyslog server.

A version 7 template sample can look like shown in the below lines.
```
template(name="MyTemplate" type="string"
         string="/var/log/%FROMHOST-IP%/%PROGRAMNAME:::secpath-replace%.log"
        )
```

**** Another mode you can write the above template can also be as shown below:
```
template(name="MyTemplate" type="list") {
    constant(value="/var/log/")
    property(name="fromhost-ip")
    constant(value="/")
    property(name="programname" SecurePath="replace")
    constant(value=".log")
    } **
**
```

In order to apply any changes made to rsyslog configuration file, you must restart the daemon to load the new configuration.

sudo service rsyslog restart

sudo systemctl restart rsyslog

To check which rsyslog sockets in listening state are opened on a Debian Linux system, you can execute the **netstat** command with root privileges. Pass the results via a filter utility, such as **grep**.

sudo netstat -tulpn | grep rsyslog

Be aware that you must also open Rsyslog ports in firewall in order to allow incoming connections to be established.

In RHEL based distros with Firewalld activated issue the below commands:

firewall-cmd --permanent --add-port=514/tcp

firewall-cmd --permanent --add-port=514/tcp

firewall-cmd -reload

In Debian based distros with UFW firewall active issue the below commands:

ufw allow 514/tcp

ufw allow 514/udp

Iptables firewall rules:

iptables -A INPUT -p tcp -m tcp --dport 514 -j ACCEPT

iptables -A INPUT -p udp --dport 514 -j ACCEPT

### Configure Rsyslog as a Client

To enable rsyslog daemon to run in client mode and output local log messages to a remote Rsyslog server, edit **/etc/rsyslog.conf** file and add one of the following lines:

*. * @IP_REMOTE_RSYSLOG_SERVER:514

*. * @FQDN_RSYSLOG_SERVER:514

This line enables the Rsyslog service to output all internal logs to a distant Rsyslog server on UDP port 514.

To send the logs over TCP protocol use the following template:
```
*. *  @@IP_reomte_syslog_server:514
```

To output only cron related logs with all priorities to a rsyslog server, use the below template:
```
cron.* @ IP_reomte_syslog_server:514
```

In cases when the Rsyslog server is not reachable via network, append the below lines to /etc/rsyslog.conf file on the client side in order temporarily store the logs in a disk buffered file, until the server comes online.
```
$ActionQueueFileName queue
$ActionQueueMaxDiskSpace 1g
$ActionQueueSaveOnShutdown on
$ActionQueueType LinkedList
$ActionResumeRetryCount -1
```

To apply the above rules, Rsyslog daemon needs to be restarted in order to act as a client.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/rsyslog-centralized-log-server-in-debian-9/

作者：[Matt Vas][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
