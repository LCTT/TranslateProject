Part 5 - How to Manage System Logs (Configure, Rotate and Import Into Database) in RHEL 7
================================================================================
In order to keep your RHEL 7 systems secure, you need to know how to monitor all of the activities that take place on such systems by examining log files. Thus, you will be able to detect any unusual or potentially malicious activity and perform system troubleshooting or take another appropriate action.

![Linux Rotate Log Files Using Rsyslog and Logrotate](http://www.tecmint.com/wp-content/uploads/2015/08/Manage-and-Rotate-Linux-Logs-Using-Rsyslog-Logrotate.jpg)

RHCE Exam: Manage System LogsUsing Rsyslogd and Logrotate – Part 5

In RHEL 7, the [rsyslogd][1] daemon is responsible for system logging and reads its configuration from /etc/rsyslog.conf (this file specifies the default location for all system logs) and from files inside /etc/rsyslog.d, if any.

### Rsyslogd Configuration ###

A quick inspection of the [rsyslog.conf][2] will be helpful to start. This file is divided into 3 main sections: Modules (since rsyslog follows a modular design), Global directives (used to set global properties of the rsyslogd daemon), and Rules. As you will probably guess, this last section indicates what gets logged or shown (also known as the selector) and where, and will be our focus throughout this article.

A typical line in rsyslog.conf is as follows:

![Rsyslogd Configuration](http://www.tecmint.com/wp-content/uploads/2015/08/Rsyslogd-Configuration.png)

Rsyslogd Configuration

In the image above, we can see that a selector consists of one or more pairs Facility:Priority separated by semicolons, where Facility describes the type of message (refer to [section 4.1.1 in RFC 3164][3] to see the complete list of facilities available for rsyslog) and Priority indicates its severity, which can be one of the following self-explanatory words:

- debug
- info
- notice
- warning
- err
- crit
- alert
- emerg

Though not a priority itself, the keyword none means no priority at all of the given facility.

**Note**: That a given priority indicates that all messages of such priority and above should be logged. Thus, the line in the example above instructs the rsyslogd daemon to log all messages of priority info or higher (regardless of the facility) except those belonging to mail, authpriv, and cron services (no messages coming from this facilities will be taken into account) to /var/log/messages.

You can also group multiple facilities using the colon sign to apply the same priority to all of them. Thus, the line:

    *.info;mail.none;authpriv.none;cron.none                /var/log/messages

Could be rewritten as

    *.info;mail,authpriv,cron.none                /var/log/messages

In other words, the facilities mail, authpriv, and cron are grouped and the keyword none is applied to the three of them.

#### Creating a custom log file ####

To log all daemon messages to /var/log/tecmint.log, we need to add the following line either in rsyslog.conf or in a separate file (easier to manage) inside /etc/rsyslog.d:

    daemon.*    /var/log/tecmint.log

Let’s restart the daemon (note that the service name does not end with a d):

    # systemctl restart rsyslog

And check the contents of our custom log before and after restarting two random daemons:

![Linux Create Custom Log File](http://www.tecmint.com/wp-content/uploads/2015/08/Create-Custom-Log-File.png)

Create Custom Log File

As a self-study exercise, I would recommend you play around with the facilities and priorities and either log additional messages to existing log files or create new ones as in the previous example.

### Rotating Logs using Logrotate ###

To prevent log files from growing endlessly, the logrotate utility is used to rotate, compress, remove, and alternatively mail logs, thus easing the administration of systems that generate large numbers of log files.

Logrotate runs daily as a cron job (/etc/cron.daily/logrotate) and reads its configuration from /etc/logrotate.conf and from files located in /etc/logrotate.d, if any.

As with the case of rsyslog, even when you can include settings for specific services in the main file, creating separate configuration files for each one will help organize your settings better.

Let’s take a look at a typical logrotate.conf:

![Logrotate Configuration](http://www.tecmint.com/wp-content/uploads/2015/08/Logrotate-Configuration.png)

Logrotate Configuration

In the example above, logrotate will perform the following actions for /var/loh/wtmp: attempt to rotate only once a month, but only if the file is at least 1 MB in size, then create a brand new log file with permissions set to 0664 and ownership given to user root and group utmp. Next, only keep one archived log, as specified by the rotate directive:

![Logrotate Logs Monthly](http://www.tecmint.com/wp-content/uploads/2015/08/Logrotate-Logs-Monthly.png)

Logrotate Logs Monthly

Let’s now consider another example as found in /etc/logrotate.d/httpd:

![Rotate Apache Log Files](http://www.tecmint.com/wp-content/uploads/2015/08/Rotate-Apache-Log-Files.png)

Rotate Apache Log Files

You can read more about the settings for logrotate in its man pages ([man logrotate][4] and [man logrotate.conf][5]). Both files are provided along with this article in PDF format for your reading convenience.

As a system engineer, it will be pretty much up to you to decide for how long logs will be stored and in what format, depending on whether you have /var in a separate partition / logical volume. Otherwise, you really want to consider removing old logs to save storage space. On the other hand, you may be forced to keep several logs for future security auditing according to your company’s or client’s internal policies.

#### Saving Logs to a Database ####

Of course examining logs (even with the help of tools such as grep and regular expressions) can become a rather tedious task. For that reason, rsyslog allows us to export them into a database (OTB supported RDBMS include MySQL, MariaDB, PostgreSQL, and Oracle.

This section of the tutorial assumes that you have already installed the MariaDB server and client in the same RHEL 7 box where the logs are being managed:

    # yum update && yum install mariadb mariadb-server mariadb-client rsyslog-mysql
    # systemctl enable mariadb && systemctl start mariadb

Then use the `mysql_secure_installation` utility to set the password for the root user and other security considerations:

![Secure MySQL Database](http://www.tecmint.com/wp-content/uploads/2015/08/Secure-MySQL-Database.png)

Secure MySQL Database

Note: If you don’t want to use the MariaDB root user to insert log messages to the database, you can configure another user account to do so. Explaining how to do that is out of the scope of this tutorial but is explained in detail in [MariaDB knowledge][6] base. In this tutorial we will use the root account for simplicity.

Next, download the createDB.sql script from [GitHub][7] and import it into your database server:

    # mysql -u root -p < createDB.sql

![Save Server Logs to Database](http://www.tecmint.com/wp-content/uploads/2015/08/Save-Server-Logs-to-Database.png)

Save Server Logs to Database

Finally, add the following lines to /etc/rsyslog.conf:

    $ModLoad ommysql
    $ActionOmmysqlServerPort 3306
    *.* :ommysql:localhost,Syslog,root,YourPasswordHere

Restart rsyslog and the database server:

    # systemctl restart rsyslog 
    # systemctl restart mariadb

#### Querying the Logs using SQL syntax ####

Now perform some tasks that will modify the logs (like stopping and starting services, for example), then log to your DB server and use standard SQL commands to display and search in the logs:

    USE Syslog;
    SELECT ReceivedAt, Message FROM SystemEvents;

![Query Logs in Database](http://www.tecmint.com/wp-content/uploads/2015/08/Query-Logs-in-Database.png)

Query Logs in Database

### Summary ###

In this article we have explained how to set up system logging, how to rotate logs, and how to redirect the messages to a database for easier search. We hope that these skills will be helpful as you prepare for the [RHCE exam][8] and in your daily responsibilities as well.

As always, your feedback is more than welcome. Feel free to use the form below to reach us.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-linux-system-logs-using-rsyslogd-and-logrotate/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/pdf/rsyslogd.pdf
[2]:http://www.tecmint.com/wp-content/pdf/rsyslog.conf.pdf
[3]:https://tools.ietf.org/html/rfc3164#section-4.1.1
[4]:http://www.tecmint.com/wp-content/pdf/logrotate.pdf
[5]:http://www.tecmint.com/wp-content/pdf/logrotate.conf.pdf
[6]:https://mariadb.com/kb/en/mariadb/create-user/
[7]:https://github.com/sematext/rsyslog/blob/master/plugins/ommysql/createDB.sql
[8]:http://www.tecmint.com/how-to-setup-and-configure-static-network-routing-in-rhel/