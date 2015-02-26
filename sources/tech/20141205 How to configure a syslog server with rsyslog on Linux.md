How to configure a syslog server with rsyslog on Linux
================================================================================
A syslog server represents a central log monitoring point on a network, to which all kinds of devices including Linux or Windows servers, routers, switches or any other hosts can send their logs over network. By setting up a syslog server, you can filter and consolidate logs from different hosts and devices into a single location, so that you can view and archive important log messages more easily.

On most Linux distributions, **rsyslog** is the standard syslog daemon that comes pre-installed. Configured in a client/server architecture, **rsyslog** can play both roles; as a syslog server **rsyslog** can gather logs from other devices, and as a syslog client, **rsyslog** can transmit its internal logs to a remote syslog server.

In this tutorial, we cover how to configure a centralized syslog server using **rsyslog** on Linux. Before we go into the details, it is instructive to go over syslog standard first.

### Basic of Syslog Standard ###

When logs are collected with syslog mechanism, three important things must be taken into consideration:

- **Facility level**: what type of processes to monitor
- **Severity (priority) level**: what type of log messages to collect
- **Destination**: where to send or record log messages 

Let's take a look at how the configuration is defined in more detail.

The facility levels define a way to categorize internal system processes. Some of the common standard facilities in Linux are:

- **auth**: messages related to authentication (login)
- **cron**: messages related to scheduled processes or applications
- **daemon**: messages related to daemons (internal servers)
- **kernel**: messages related to the kernel
- **mail**: messages related to internal mail servers
- **syslog**: messages related to the syslog daemon itself
- **lpr**: messages related to print servers
- **local0 - local7**: messages defined by user (local7 is usually used by Cisco and Windows servers) 

The severity (priority) levels are standardized, and defined by using standard abbreviation and an assigned number with number 7 being the highest level of all. These levels are: 

- emerg: Emergency - 0
- alert: Alerts - 1
- crit: Critical - 2
- err: Errors - 3
- warn: Warnings - 4
- notice: Notification - 5
- info: Information - 6
- debug: Debugging - 7 

Finally, the destination statement enforces a syslog client to perform one of three following tasks: (1) save log messages on a local file, (2) route them to a remote syslog server over TCP/UDP, or (3) send them to stdout such as a console.

In rsyslog, syslog configuration is structured based on the following schema.

    [facility-level].[severity-level]  [destination]

### Configure Rsyslog on Linux ###

Now that we understand syslog, it's time to configure a Linux server as a central syslog server using rsyslog. We will also see how to configure a Windows based system as a syslog client to send internal logs to the syslog server.

#### Step One: Initial System Requirements ####

To set up a Linux host as a central log server, we need to create a separate /var partition, and allocate a large enough disk size or create a LVM special volume group. That way, the syslog server will be able to sustain the exponential growth of collected logs over time.

#### Step Two: Enable Rsyslog Daemon ####

rsyslog daemon comes pre-installed on modern Linux distributions, but is not enabled by default. To enable rsyslog daemon to receive external messages, edit its configuration file located in /etc/rsyslog.conf.

Once the file is opened for editing, search and uncomment the below two lines by removing the # sign from the beginning of lines.

    $ModLoad imudp
    $UDPServerRun 514

This will enable rsyslog daemon to receive log messages on UDP port 514. UDP is way faster than TCP, but does not provide reliability on data flow the same way as TCP does. If you need to reliable delivery, you can enable TCP by uncommenting the following lines.

    $ModLoad imtcp
    $InputTCPServerRun 514 

Note that both TCP and UDP can be set on the server simultaneously to listen on TCP/UDP connections.

#### Step Three: Create a Template for Log Receipt ####

In the next step we need to create a template for remote messages, and tell rsyslog daemon how to record messages received from other client machines.

Open /etc/rsyslog.conf with a text editor, and append the following template before the GLOBAL DIRECTIVES block:

    $template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" *
    *.*  ?RemoteLogs
    & ~

This template needs a little explanation. The $template RemoteLogs directive ("RemoteLogs" string can be changed to any other descriptive name) forces rsyslog daemon to write log messages to separate local log files in /var/log/, where log file names are defined based on the hostname of the remote sending machine as well as the remote application that generated the logs. The second line ("*.* ?RemoteLogs") implies that we apply RemoteLogs template to all received logs.

The "& ~" sign represents a redirect rule, and is used to tell rsyslog daemon to stop processing log messages further, and not write them locally. If this redirection is not used, all the remote messages would be also written on local log files besides the log files described above, which means they would practically be written twice. Another consequence of using this rule is that the syslog server's own log messages would only be written to dedicated files named after machine's hostname. 

If you want, you can direct log messages with a specific facility or severity level to this new template using the following schema.

    [facility-level].[severity-level]    ?RemoteLogs

For example:

Direct all internal authentication messages of all priority levels to RemoteLogs template:

    authpriv.*   ?RemoteLogs 

Direct informational messages generated by all system processes, except mail, authentication and cron messages to RemoteLogs template:

    *.info,mail.none,authpriv.none,cron.none    ?RemoteLogs

If we want all received messages from remote clients written to a single file named after their IP address, you can use the following template. We assign a new name "IpTemplate" to this template.

    $template IpTemplate,"/var/log/%FROMHOST-IP%.log" 
    *.*  ?IpTemplate 
    & ~ 

After we have enabled rsyslog daemon and edited its configuration file, we need to restart the daemon.

On Debian, Ubuntu or CentOS/RHEL 6:

    $ sudo service rsyslog restart 

On Fedora or CentOS/RHEL 7:

    $ sudo systemctl restart rsyslog 

We can verify that rsyslog daemon is functional by using netstat command.

     $ sudo netstat -tulpn | grep rsyslog 

The output should look like the following in case rsyslog daemon listens on UDP port. 

    udp     0 0    0.0.0.0:514    0.0.0.0:*      551/rsyslogd 
    udp6    0 0    :::514         :::*           551/rsyslogd 

If rsyslog daemon is set up to listen on TCP connections, the output should look like this.

    tcp     0 0     0.0.0.0:514   0.0.0.0:*     LISTEN    1891/rsyslogd 
    tcp6    0 0     :::514        :::*          LISTEN    1891/rsyslogd

#### Send Windows Logs to a Remote Rsyslog Server ####

To forward a Windows based client's log messages to our rsyslog server, we need a Windows syslog agent. While there are a multitude of syslog agents that can run on Windows, we can use [Datagram SyslogAgent][1], which is a freeware program.

After downloading and installing the syslog agent, we need to configure it to run as a service. Specify the protocol though which it will send data, the IP address and port of a remote rsyslog server, and what type of event logs should be transmitted as follows.

![](https://farm8.staticflickr.com/7509/15305930594_27b7f4440a_o.jpg)

After we have set up all the configurations, we can start the service and watch the log files on the central rsyslog server using tailf command line utility.

### Conclusion ###

By creating a central rsyslog server that can collect log files of local or remote hosts, we can get a better idea on what is going on internally in their systems, and can debug their problems more easily should any of them become unresponsive or crash.

--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-syslog-server-linux.html

作者：[Caezsar M][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/caezsar
[1]:http://www.syslogserver.com/download.html