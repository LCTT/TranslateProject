wyangsun translating
Managing Linux Logs
================================================================================
A key best practice for logging is to centralize or aggregate your logs in one place, especially if you have multiple servers or tiers in your architecture. We’ll tell you why this is a good idea and give tips on how to do it easily.

### Benefits of Centralizing Logs ###

It can be cumbersome to look at individual log files if you have many servers. Modern web sites and services often include multiple tiers of servers, distributed with load balancers, and more. It’d take a long time to hunt down the right file, and even longer to correlate problems across servers. There’s nothing more frustrating than finding the information you are looking for hasn’t been captured, or the log file that could have held the answer has just been lost after a restart.

Centralizing your logs makes them faster to search, which can help you solve production issues faster. You don’t have to guess which server had the issue because all the logs are in one place. Additionally, you can use more powerful tools to analyze them, including log management solutions. These solutions can [transform plain text logs][1] into fields that can be easily searched and analyzed.

Centralizing your logs also makes them easier to manage:

- They are safer from accidental or intentional loss when they are backed up and archived in a separate location. If your servers go down or are unresponsive, you can use the centralized logs to debug the problem.
- You don’t have to worry about ssh or inefficient grep commands requiring more resources on troubled systems.
- You don’t have to worry about full disks, which can crash your servers.
- You can keep your production servers secure without giving your entire team access just to look at logs. It’s much safer to give your team access to logs from the central location.

With centralized log management, you still must deal with the risk of being unable to transfer logs to the centralized location due to poor network connectivity or of using up a lot of network bandwidth. We’ll discuss how to intelligently address these issues in the sections below.

### Popular Tools for Centralizing Logs ###

The most common way of centralizing logs on Linux is by using syslog daemons or agents.  The syslog daemon supports local log collection, then transports logs through the syslog protocol to a central server. There are several popular daemons that you can use to centralize your log files:

- [rsyslog][2] is a light-weight daemon installed on most common Linux distributions.
- [syslog-ng][3] is the second most popular syslog daemon for Linux.
- [logstash][4] is a heavier-weight agent that can do more advanced processing and parsing.
- [fluentd][5] is another agent with advanced processing capabilities.

Rsyslog is the most popular daemon for centralizing your log data because it’s installed by default in most common distributions of Linux. You don’t need to download it or install it, and it’s lightweight so it won’t take up much of your system resources.

If you need more advanced filtering or custom parsing capabilities, Logstash is the next most popular choice if you don’t mind the extra system footprint.

### Configure Rsyslog.conf ###

Since rsyslog is the most widely used syslog daemon, we’ll show how to configure it to centralize logs. The global configuration file is located at /etc/rsyslog.conf. It loads modules, sets global directives, and has an include for application-specific files located in the directory /etc/rsyslog.d/.  This directory contains /etc/rsyslog.d/50-default.conf which instructs rsyslog to write the system logs to file. You can read more about the configuration files in the [rsyslog documentation][6].

The configuration language for rsyslog is [RainerScript][7]. You set up specific inputs for logs as well as actions to output them to another destination. Rsyslog already configures standard defaults for syslog input, so you usually just need to add an output to your log server. Here is an example configuration for rsyslog to output logs to an external server. In this example, **BEBOP** is the hostname of the server, so you should replace it with your own server name.

    action(type="omfwd" protocol="tcp" target="BEBOP" port="514")

You could send your logs to a log server with ample storage to keep a copy for search, backup, and analysis. If you’re storing logs in the file system, then you should set up [log rotation][8] to keep your disk from getting full.

Alternatively, you can send these logs to a log management solution. If your solution is installed locally you can send it to your local host and port as specified in your system documentation. If you use a cloud-based provider, you will send them to the hostname and port specified by your provider.

### Log Directories ###

You can centralize all the files in a directory or matching a wildcard pattern. The nxlog and syslog-ng daemons support both directories and wildcards (*).

Common versions of rsyslog can’t monitor directories directly. As a workaround, you can setup a cron job to monitor the directory for new files, then configure rsyslog to send those files to a destination, such as your log management system. As an example, the log management vendor Loggly has an open source version of a [script to monitor directories][9].

### Which Protocol: UDP, TCP, or RELP? ###

There are three main protocols that you can choose from when you transmit data over the Internet. The most common is UDP for your local network and TCP for the Internet. If you cannot lose logs, then use the more advanced RELP protocol.

[UDP][10] sends a datagram packet, which is a single packet of information. It’s an outbound-only protocol, so it doesn’t send you an acknowledgement of receipt (ACK). It makes only one attempt to send the packet. UDP can be used to smartly degrade or drop logs when the network gets congested. It’s most commonly used on reliable networks like localhost.

[TCP][11] sends streaming information in multiple packets and returns an ACK. TCP makes multiple attempts to send the packet, but is limited by the size of the [TCP buffer][12]. This is the most common protocol for sending logs over the Internet.

[RELP][13] is the most reliable of these three protocols but was created for rsyslog and has less industry adoption. It acknowledges receipt of data in the application layer and will resend if there is an error. Make sure your destination also supports this protocol.

### Reliably Send with Disk Assisted Queues ###

If rsyslog encounters a problem when storing logs, such as an unavailable network connection, it can queue the logs until the connection is restored. The queued logs are stored in memory by default. However, memory is limited and if the problem persists, the logs can exceed memory capacity.

**Warning: You can lose data if you store logs only in memory.**

Rsyslog can queue your logs to disk when memory is full. [Disk-assisted queues][14] make transport of logs more reliable. Here is an example of how to configure rsyslog with a disk-assisted queue:

    $WorkDirectory /var/spool/rsyslog # where to place spool files
    $ActionQueueFileName fwdRule1     # unique name prefix for spool files
    $ActionQueueMaxDiskSpace 1g       # 1gb space limit (use as much as possible)
    $ActionQueueSaveOnShutdown on     # save messages to disk on shutdown
    $ActionQueueType LinkedList       # run asynchronously
    $ActionResumeRetryCount -1        # infinite retries if host is down

### Encrypt Logs Using TLS ###

When the security and privacy of your data is a concern, you should consider encrypting your logs. Sniffers and middlemen could read your log data if you transmit it over the Internet in clear text. You should encrypt your logs if they contain private information, sensitive identification data, or government-regulated data. The rsyslog daemon can encrypt your logs using the TLS protocol and keep your data safer.

To set up TLS encryption, you need to do the following tasks:

1. Generate a [certificate authority][15] (CA). There are sample certificates in /contrib/gnutls, which are good only for testing, but you need to create your own for production. If you’re using a log management service, it will have one ready for you.
1. Generate a [digital certificate][16] for your server to enable SSL operation, or use one from your log management service provider.
1. Configure your rsyslog daemon to send TLS-encrypted data to your log management system.

Here’s an example rsyslog configuration with TLS encryption. Replace CERT and DOMAIN_NAME with your own server setting.

    $DefaultNetstreamDriverCAFile /etc/rsyslog.d/keys/ca.d/CERT.crt
    $ActionSendStreamDriver gtls
    $ActionSendStreamDriverMode 1
    $ActionSendStreamDriverAuthMode x509/name
    $ActionSendStreamDriverPermittedPeer *.DOMAIN_NAME.com

### Best Practices for Application Logging ###

In addition to the logs that Linux creates by default, it’s also a good idea to centralize logs from important applications. Almost all Linux-based server class applications write their status information in separate, dedicated log files. This includes database products like PostgreSQL or MySQL, web servers like Nginx or Apache, firewalls, print and file sharing services, directory and DNS servers and so on.

The first thing administrators do after installing an application is to configure it. Linux applications typically have a .conf file somewhere within the /etc directory. It can be somewhere else too, but that’s the first place where people look for configuration files.

Depending on how complex or large the application is, the number of settable parameters can be few or in hundreds. As mentioned before, most applications would write their status in some sort of log file: configuration file is where log settings are defined among other things.

If you’re not sure where it is, you can use the locate command to find it:

    [root@localhost ~]# locate postgresql.conf
    /usr/pgsql-9.4/share/postgresql.conf.sample
    /var/lib/pgsql/9.4/data/postgresql.conf

#### Set a Standard Location for Log Files ####

Linux systems typically save their log files under /var/log directory. This works fine, but check if the application saves under a specific directory under /var/log. If it does, great, if not, you may want to create a dedicated directory for the app under /var/log. Why? That’s because other applications save their log files under /var/log too and if your app saves more than one log file – perhaps once every day or after each service restart – it may be a bit difficult to trawl through a large directory to find the file you want.

If you have the more than one instance of the application running in your network, this approach also comes handy. Think about a situation where you may have a dozen web servers running in your network. When troubleshooting any one of the boxes, you would know exactly where to go.

#### Use A Standard Filename ####

Use a standard filename for the latest logs from your application. This makes it easy because you can monitor and tail a single file. Many applications add some sort of date time stamp in them. This makes it much more difficult to find the latest file and to setup file monitoring by rsyslog. A better approach is to add timestamps to older log files using logrotate. This makes them easier to archive and search historically.

#### Append the Log File ####

Is the log file going to be overwritten after each application restart? If so, we recommend turning that off. After each restart the app should append to the log file. That way, you can always go back to the last log line before the restart.

#### Appending vs. Rotation of Log File ####

Even if the application writes a new log file after each restart, how is it saving in the current log? Is it appending to one single, massive file? Linux systems are not known for frequent reboots or crashes: applications can run for very long periods without even blinking, but that can also make the log file very large.  If you are trying to analyze the root cause of a connection failure that happened last week, you could easily be searching through tens of thousands of lines.

We recommend you configure the application to rotate its log file once every day, say at mid-night.

Why? Well it becomes manageable for a starter. It’s much easier to find a file name with a specific date time pattern than to search through one file for that date’s entries. Files are also much smaller: you don’t think vi has frozen when you open a log file. Secondly, if you are sending the log file over the wire to a different location – perhaps a nightly backup job copying to a centralized log server – it doesn’t chew up your network’s bandwidth. Third and final, it helps with your log retention. If you want to cull old log entries, it’s easier to delete files older than a particular date than to have an application parsing one single large file.

#### Retention of Log File ####

How long do you keep a log file? That definitely comes down to business requirement. You could be asked to keep one week’s worth of logging information, or it may be a regulatory requirement to keep ten years’ worth of data. Whatever it is, logs need to go from the server at one time or other.

In our opinion, unless otherwise required, keep at least a month’s worth of log files online, plus copy them to a secondary location like a logging server. Anything older than that can be offloaded to a separate media. For example, if you are on AWS, your older logs can be copied to Glacier.

#### Separate Disk Location for Log Files ####

Linux best practice usually suggests mounting the /var directory to a separate file system. This is because of the high number of I/Os associated with this directory. We would recommend mounting /var/log directory under a separate disk system. This can save I/O contention with the main application’s data. Also, if the number of log files becomes too large or the single log file becomes too big, it doesn’t fill up the entire disk.

#### Log Entries ####

What information should be captured in each log entry?

That depends on what you want to use the log for. Do you want to use it only for troubleshooting purposes, or do you want to capture everything that’s happening? Is it a legal requirement to capture what each user is running or viewing?

If you are using logs for troubleshooting purposes, save only errors, warnings or fatal messages. There’s no reason to capture debug messages, for example. The app may log debug messages by default or another administrator might have turned this on for another troubleshooting exercise, but you need to turn this off because it can definitely fill up the space quickly. At a minimum, capture the date, time, client application name, source IP or client host name, action performed and the message itself.

#### A Practical Example for PostgreSQL ####

As an example, let’s look at the main configuration file for a vanilla PostgreSQL 9.4 installation. It’s called postgresql.conf and contrary to other config files in Linux systems, it’s not saved under /etc directory. In the code snippet below, we can see it’s in /var/lib/pgsql directory of our CentOS 7 server:

    root@localhost ~]# vi /var/lib/pgsql/9.4/data/postgresql.conf
    ... 
    #------------------------------------------------------------------------------
    # ERROR REPORTING AND LOGGING
    #------------------------------------------------------------------------------
    # - Where to Log -
    log_destination = 'stderr'      
          # Valid values are combinations of
          # stderr, csvlog, syslog, and eventlog,
          # depending on platform. csvlog
          # requires logging_collector to be on.
    # This is used when logging to stderr:
    logging_collector = on          
          # Enable capturing of stderr and csvlog
          # into log files. Required to be on for
          # csvlogs.
          # (change requires restart)
    # These are only used if logging_collector is on:
    log_directory = 'pg_log'       
          # directory where log files are written,
          # can be absolute or relative to PGDATA
    log_filename = 'postgresql-%a.log'    # log file name pattern,
         # can include strftime() escapes
    # log_file_mode = 0600           .
         # creation mode for log files,
         # begin with 0 to use octal notation
    log_truncate_on_rotation = on   # If on, an existing log file with the
         # same name as the new log file will be
         # truncated rather than appended to.
         # But such truncation only occurs on
         # time-driven rotation, not on restarts
         # or size-driven rotation. Default is
         # off, meaning append to existing files
         # in all cases.
    log_rotation_age = 1d           
         # Automatic rotation of logfiles will happen after that time. 0 disables.
    log_rotation_size = 0           # Automatic rotation of logfiles will happen after that much log output. 0 disables.
    # These are relevant when logging to syslog:
    #syslog_facility = 'LOCAL0'
    #syslog_ident = 'postgres'
    # This is only relevant when logging to eventlog (win32):
    #event_source = 'PostgreSQL'
    # - When to Log -
    #client_min_messages = notice   # values in order of decreasing detail:
    # debug5
    # debug4
    # debug3
    # debug2
    # debug1
    # log
    # notice
    # warning
    # error
    #log_min_messages = warning     # values in order of decreasing detail:
    # debug5
    # debug4
    # debug3
    # debug2
    # debug1
    # info
    # notice
    # warning
    # error
    # log
    # fatal
    # panic
    #log_min_error_statement = error    # values in order of decreasing detail:
    # debug5
    # debug4
    # debug3
    # debug2
    # debug1
    # info
    # notice
    # warning
    # error
    # log
    # fatal
    # panic (effectively off)
    #log_min_duration_statement = -1     # -1 is disabled, 0 logs all statements
    # and their durations, > 0 logs only
    # statements running at least this number
    # of milliseconds
    # - What to Log 
    #debug_print_parse = off
    #debug_print_rewritten = off
    #debug_print_plan = off
    #debug_pretty_print = on
    #log_checkpoints = off
    #log_connections = off
    #log_disconnections = off
    #log_duration = off
    #log_error_verbosity = default    
    # terse, default, or verbose messages
    #log_hostname = off
    log_line_prefix = '< %m >'          # special values:
    # %a = application name
    # %u = user name
    # %d = database name
    # %r = remote host and port
    # %h = remote host
    # %p = process ID
    # %t = timestamp without milliseconds
    # %m = timestamp with milliseconds
    # %i = command tag
    # %e = SQL state
    # %c = session ID
    # %l = session line number
    # %s = session start timestamp
    # %v = virtual transaction ID
    # %x = transaction ID (0 if none)
    # %q = stop here in non-session
    # processes
    # %% = '%'
    # e.g. '<%u%%%d> '
    #log_lock_waits = off               # log lock waits >= deadlock_timeout
    #log_statement = 'none'             # none, ddl, mod, all
    #log_temp_files = -1                # log temporary files equal or larger
    # than the specified size in kilobytes;5# -1 disables, 0 logs all temp files5
    log_timezone = 'Australia/ACT'

Although most parameters are commented out, they assume default values. We can see the log file directory is pg_log (log_directory parameter), the file names should start with postgresql (log_filename parameter), the files are rotated once every day (log_rotation_age parameter) and the log entries start with a timestamp (log_line_prefix parameter). Of particular interest is the log_line_prefix parameter: there is a whole gamut of information you can include there.

Looking under /var/lib/pgsql/9.4/data/pg_log directory shows us these files:

    [root@localhost ~]# ls -l /var/lib/pgsql/9.4/data/pg_log
    total 20
    -rw-------. 1 postgres postgres 1212 May 1 20:11 postgresql-Fri.log
    -rw-------. 1 postgres postgres 243 Feb 9 21:49 postgresql-Mon.log
    -rw-------. 1 postgres postgres 1138 Feb 7 11:08 postgresql-Sat.log
    -rw-------. 1 postgres postgres 1203 Feb 26 21:32 postgresql-Thu.log
    -rw-------. 1 postgres postgres 326 Feb 10 01:20 postgresql-Tue.log

So the log files only have the name of the weekday stamped in the file name. We can change it. How? Configure the log_filename parameter in postgresql.conf.

Looking inside one log file shows its entries start with date time only:

    [root@localhost ~]# cat /var/lib/pgsql/9.4/data/pg_log/postgresql-Fri.log
    ...
    < 2015-02-27 01:21:27.020 EST >LOG: received fast shutdown request
    < 2015-02-27 01:21:27.025 EST >LOG: aborting any active transactions
    < 2015-02-27 01:21:27.026 EST >LOG: autovacuum launcher shutting down
    < 2015-02-27 01:21:27.036 EST >LOG: shutting down
    < 2015-02-27 01:21:27.211 EST >LOG: database system is shut down

### Centralizing Application Logs ###

#### Log File Monitoring with Imfile ####

Traditionally, the most common way for applications to log their data is with files. Files are easy to search on a single machine but don’t scale well with more servers. You can set up log file monitoring and send the events to a centralized server when new logs are appended to the bottom. Create a new configuration file in /etc/rsyslog.d/ then add a file input like this:

    $ModLoad imfile
    $InputFilePollInterval 10
    $PrivDropToGroup adm

----------

    # Input for FILE1
    $InputFileName /FILE1
    $InputFileTag APPNAME1
    $InputFileStateFile stat-APPNAME1 #this must be unique for each file being polled
    $InputFileSeverity info
    $InputFilePersistStateInterval 20000
    $InputRunFileMonitor

Replace FILE1 and APPNAME1 with your own file and application names. Rsyslog will send it to the outputs you have configured.

#### Local Socket Logs with Imuxsock ####

A socket is similar to a UNIX file handle except that the socket is read into memory by your syslog daemon and then sent to the destination. No file needs to be written. As an example, the logger command sends its logs to this UNIX socket.

This approach makes efficient use of system resources if your server is constrained by disk I/O or you have no need for local file logs. The disadvantage of this approach is that the socket has a limited queue size. If your syslog daemon goes down or can’t keep up, then you could lose log data.

The rsyslog daemon will read from the /dev/log socket by default, but you can specifically enable it with the [imuxsock input module][17] using the following command:

    $ModLoad imuxsock

#### UDP Logs with Imupd ####

Some applications output log data in UDP format, which is the standard syslog protocol when transferring log files over a network or your localhost. Your syslog daemon receives these logs and can process them or transmit them in a different format. Alternately, you can send the logs to your log server or to a log management solution.

Use the following command to configure rsyslog to accept syslog data over UDP on the standard port 514:

    $ModLoad imudp

----------

    $UDPServerRun 514

### Manage Logs with Logrotate ###

Log rotation is a process that archives log files automatically when they reach a specified age. Without intervention, log files keep growing, using up disk space. Eventually they will crash your machine.

The logrotate utility can truncate your logs as they age, freeing up space. Your new log file retains the filename. Your old log file is renamed with a number appended to the end of it. Each time the logrotate utility runs, a new file is created and the existing file is renamed in sequence. You determine the threshold when old files are deleted or archived.

When logrotate copies a file, the new file has a new inode, which can interfere with rsyslog’s ability to monitor the new file. You can alleviate this issue by adding the copytruncate parameter to your logrotate cron job. This parameter copies existing log file contents to a new file and truncates these contents from the existing file. The inode never changes because the log file itself remains the same; its contents are in a new file.

The logrotate utility uses the main configuration file at /etc/logrotate.conf and application-specific settings in the directory /etc/logrotate.d/. DigitalOcean has a detailed [tutorial on logrotate][18].

### Manage Configuration on Many Servers ###

When you have just a few servers, you can manually configure logging on them. Once you have a few dozen or more servers, you can take advantage of tools that make this easier and more scalable. At a basic level, all of these copy your rsyslog configuration to each server, and then restart rsyslog so the changes take effect.

#### Pssh ####

This tool lets you run an ssh command on several servers in parallel. Use a pssh deployment for only a small number of servers. If one of your servers fails, then you have to ssh into the failed server and do the deployment manually. If you have several failed servers, then the manual deployment on them can take a long time.

#### Puppet/Chef ####

Puppet and Chef are two different tools that can automatically configure all of the servers in your network to a specified standard. Their reporting tools let you know about failures and can resync periodically. Both Puppet and Chef have enthusiastic supporters. If you aren’t sure which one is more suitable for your deployment configuration management, you might appreciate [InfoWorld’s comparison of the two tools][19].

Some vendors also offer modules or recipes for configuring rsyslog. Here is an example from Loggly’s Puppet module. It offers a class for rsyslog to which you can add an identifying token:

    node 'my_server_node.example.net' {
      # Send syslog events to Loggly
      class { 'loggly::rsyslog':
        customer_token => 'de7b5ccd-04de-4dc4-fbc9-501393600000',
      }
    }

#### Docker ####

Docker uses containers to run applications independent of the underlying server. Everything runs from inside a container, which you can think of as a unit of functionality. ZDNet has an in-depth article about [using Docker][20] in your data center.

There are several ways to log from Docker containers including linking to a logging container, logging to a shared volume, or adding a syslog agent directly inside the container. One of the most popular logging containers is called [logspout][21].

#### Vendor Scripts or Agents ####

Most log management solutions offer scripts or agents to make sending data from one or more servers relatively easy. Heavyweight agents can use up extra system resources. Some vendors like Loggly offer configuration scripts to make using existing syslog daemons easier. Here is an example [script][22] from Loggly which can run on any number of servers.

--------------------------------------------------------------------------------

via: http://www.loggly.com/ultimate-guide/logging/managing-linux-logs/

作者：[Jason Skowronski][a1]
作者：[Amy Echeverri][a2]
作者：[Sadequl Hussain][a3]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a1]:https://www.linkedin.com/in/jasonskowronski
[a2]:https://www.linkedin.com/in/amyecheverri
[a3]:https://www.linkedin.com/pub/sadequl-hussain/14/711/1a7
[1]:https://docs.google.com/document/d/11LXZxWlkNSHkcrCWTUdnLRf_CiZz9kK0cr3yGM_BU_0/edit#heading=h.esrreycnpnbl
[2]:http://www.rsyslog.com/
[3]:http://www.balabit.com/network-security/syslog-ng/opensource-logging-system
[4]:http://logstash.net/
[5]:http://www.fluentd.org/
[6]:http://www.rsyslog.com/doc/rsyslog_conf.html
[7]:http://www.rsyslog.com/doc/master/rainerscript/index.html
[8]:https://docs.google.com/document/d/11LXZxWlkNSHkcrCWTUdnLRf_CiZz9kK0cr3yGM_BU_0/edit#heading=h.eck7acdxin87
[9]:https://www.loggly.com/docs/file-monitoring/
[10]:http://www.networksorcery.com/enp/protocol/udp.htm
[11]:http://www.networksorcery.com/enp/protocol/tcp.htm
[12]:http://blog.gerhards.net/2008/04/on-unreliability-of-plain-tcp-syslog.html
[13]:http://www.rsyslog.com/doc/relp.html
[14]:http://www.rsyslog.com/doc/queues.html
[15]:http://www.rsyslog.com/doc/tls_cert_ca.html
[16]:http://www.rsyslog.com/doc/tls_cert_machine.html
[17]:http://www.rsyslog.com/doc/v8-stable/configuration/modules/imuxsock.html
[18]:https://www.digitalocean.com/community/tutorials/how-to-manage-log-files-with-logrotate-on-ubuntu-12-10
[19]:http://www.infoworld.com/article/2614204/data-center/puppet-or-chef--the-configuration-management-dilemma.html
[20]:http://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[21]:https://github.com/progrium/logspout
[22]:https://www.loggly.com/docs/sending-logs-unixlinux-system-setup/
