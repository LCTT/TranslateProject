How to set up server monitoring system with Monit
================================================================================
Many Linux admins rely on a centralized remote monitoring system (e.g., [Nagios][1] or [Cacti][2]) to check the health of their network infrastructure. While centralized monitoring makes an admin's life easy when dealing with many hosts and devices, a dedicated monitoring box obviously becomes a single point of failure; if the monitoring box goes down or becomes unreachable for whatever reason (e.g., bad hardware or network outage), you will lose visibility on your entire infrastructure.

One way to add redundancy to your monitoring system is to install standalone monitoring software (as a fallback) at least on any critical/core servers on your network. In case a centralized monitor is down, you will still be able to maintain visibility on your core servers from their backup monitor.

### What is Monit? ###

[Monit][3] is a cross-platform open-source tool for monitoring Unix/Linux systems (e.g., Linux, BSD, OSX, Solaris). Monit is extremely easy to install and reasonably lightweight (with only 500KB in size), and does not require any third-party programs, plugins or libraries. Yet, Monit lends itself to full-blown monitoring, capable of process status monitoring, filesystem change monitoring, email notification, customizable actions for core services, and so on. The combination of ease of setup, lightweight implementation and powerful features makes Monit an ideal candidate for a backup monitoring tool.

I have been using Monit for several years on multiple hosts, and I am very pleased how reliable it has been. Even as a full-blown monitoring system, Monit is very useful and powerful for any Linux admin. In this tutorial, let me demonstrate how to set up Monit on a local server (as a backup monitor) to monitor common services. With this setup, I will only scrach the surface of what Monit can do for us.

### Installation of Monit on Linux ###

Most Linux distributions already include Monit in their repositories.

Debian, Ubuntu or Linux Mint:

    $ sudo aptitude install monit

Fedora or CentOS/RHEL:

On CentOS/RHEL, you must enable either [EPEL][4] or [Repoforge][5] repository first.

    # yum install monit

Monit comes with a very well documented configuration file with a lots of examples. The main configuration file is located in /etc/monit.conf in Fedora/CentOS/RHEL, or /etc/monit/monitrc in Debian/Ubuntu/Mint. Monit configuration has two parts: "Global" and "Services" sections. 

Gl###  ###obal Configuration: Web Status Page

Monit can use several mail servers for notifications, and/or an HTTP/HTTPS status page. Let's start with the web status page with the following requirements.

- Monit listens on port 1966.
- Access to the web status page is encrypted with SSL.
- Login requires monituser/romania as user/password.
- Login is permitted from localhost, myhost.mydomain.ro, and internal LAN (192.168.0.0/16) only.
- Monit stores an SSL certificate in a pem format. 

For subsequent steps, I will use a Red Hat based system. Similar steps will be applicable on a Debian based system.

First, generate and store a self-signed certificate (monit.pem) in /var/cert.

    # mkdir /var/certs
    # cd /etc/pki/tls/certs
    # ./make-dummy-cert monit.pem
    # cp monit.pem /var/certs
    # chmod 0400 /var/certs/monit.pem 

Now put the following snippet in the Monit's main configuration file. You can start with an empty configuration file or make a copy of the original file.

    set httpd port 1966 and
         SSL ENABLE
         PEMFILE  /var/certs/monit.pem
         allow monituser:romania
         allow localhost
         allow 192.168.0.0/16
         allow myhost.mydomain.ro

### Global Configuration: Email Notification ###

Next, let's set up email notification in Monit. We need at least one active [SMTP server][6] which can send mails from the Monit host. Something like the following will do (adjust it for your case):

- Mail server hostname: smtp.monit.ro
- Sender email address used by monit (from): monit@monit.ro
- Who will receive mail from monit daemon: guletz@monit.ro
- SMTP port used by mail server: 587 (default is 25) 

With the above information, email notification would be configured like this:

    set mailserver  smtp.monit.ro port 587
    set mail-format {
     from: monit@monit.ro
     subject: $SERVICE $EVENT at $DATE on $HOST
     message: Monit $ACTION $SERVICE $EVENT at $DATE on $HOST : $DESCRIPTION.
         
           Yours sincerely,
              Monit
      
      }
     
    set alert guletz@monit.ro

As you can see, Monit offers several built-in variables ($DATE, $EVENT, $HOST, etc.), and you can customize your email message for your needs. If you want to send mails from the Monit host itself, you need a sendmail-compatible program (e.g., postfix or ssmtp) already installed.

### Global Configuration: Monit Daemon ###

The next part is setting up monit daemon. We will set it up as follows.

- Performs the first check after 120 seconds.
- Checks services once every 3 minutes.
- Use syslog for logging. 

Place the following snippet to achieve the above setting.

    set daemon 120
       with start delay 240
    set logfile syslog facility log_daemon

We must also define "idfile", a unique ID used by monit demon, and "eventqueue", a path where mails sent by monit but undelivered due to SMTP/network errors. Verifiy that path (/var/monit) already exists. The following configuration will do.

    set idfile /var/monit/id
     set eventqueue
         basedir /var/monit

### Test Global Configuration ###

Now the "Global" section is finished. The Monit configuration file will look like this:

    #  Global Section
     
    # status webpage and acl's
    set httpd port 1966 and
         SSL ENABLE
         PEMFILE  /var/certs/monit.pem
         allow monituser:romania
         allow localhost
         allow 192.168.0.0/16
         allow myhost.mydomain.ro
     
    # mail-server
    set mailserver  smtp.monit.ro port 587
    # email-format
    set mail-format {
     from: monit@monit.ro
     subject: $SERVICE $EVENT at $DATE on $HOST
     message: Monit $ACTION $SERVICE $EVENT at $DATE on $HOST : $DESCRIPTION.
         
           Yours sincerely,
              Monit
      
      }
     
    set alert guletz@monit.ro
     
    # delay checks
    set daemon 120
       with start delay 240
    set logfile syslog facility log_daemon
     
    # idfile and mail queue path
    set idfile /var/monit/id
     set eventqueue
         basedir /var/monit

Now it is time to check what we have done. You can test an existing configuration file (/etc/monit.conf) by running:

    # monit -t 

----------

    Control file syntax OK

If Monit complains about any error, please review the configuration file again. Fortunately, error/warnings messages are informative. For example:

    monit: Cannot stat the SSL server PEM file '/var/certs/monit.pem' -- No such file or directory
    /etc/monit/monitrc:10: Warning: hostname did not resolve 'smtp.monit.ro'

Once you verify the syntax of configuration, start monit daemon, and wait 2 to 3 minutes:

    # service monit start

If you are using systemd, run:

    # systemctl start monit

Now open a browser window, and go to https://<monit_host>:1966. Replace &<monit_host> with your Monit hostname or IP address.

Note that if you have a self-signed SSL certificate, you will see a warning message in your browser.

![](https://farm8.staticflickr.com/7596/16737206479_96b9f7dfdb_c.jpg)

After you have completed login, you must see the following page.

![](https://farm8.staticflickr.com/7594/16303369973_6019482dea_c.jpg)

In the rest of the tutorial, let me show how we can monitor a local server and common services. You will see a lot of useful examples on the [official wiki page][7]. Most of them are copy-and-pastable!

### Service Configuration: CPU/Memory Monitoring ###

Let start with monitoring a local server's CPU/memory usage. Copy the following snippet in the configuration file.

    check system localhost
        if loadavg (1min) > 10 then alert
        if loadavg (5min) > 6 then alert
        if memory usage > 75% then alert
        if cpu usage (user) > 70% then alert
        if cpu usage (system) > 60% then alert
        if cpu usage (wait) > 75% then alert

You can easily interpret the above configuration. The above checks are performed on local host for every monitoring cycle (which is set to 120 seconds in the Global section). If any condition is met, monit daemon will send an alert with an email.

If certain properties do not need to be monitored for every cycle, you can use the following format. For example, this will monitor average load every other cycle (i.e., every 240 seconds).
	
    if loadavg (1min) > 10 for 2 cycles then alert

### Service Configuration: SSH Service Monitoring ###

Let's check if we have sshd binary installed in /usr/sbin/sshd:

    check file sshd_bin with path /usr/sbin/sshd

We also want to check if the init script for sshd exist:

    check file sshd_init with path /etc/init.d/sshd

Finally, we want to check if sshd daemon is up an running, and listens on port 22:

    check process sshd with pidfile /var/run/sshd.pid
       start program  "/etc/init.d/sshd start"
       stop program  "/etc/init.d/sshd stop"
       if failed port 22 protocol ssh then restart
       if 5 restarts within 5 cycles then timeout

More specifically, we can interpret the above configuration as follows. We check if a process named sshd and a pidfile (/var/run/sshd.pid) exist. If either one does not exist, we restart sshd demon using init script. We check if a process listening on port 22 can speak SSH protocol. If not, we restart sshd daemon. If there are at least 5 restarts within the last 5 monitoring cycles (i.e., 5x120 seconds), sshd daemon is declared non-functional, and we do not try to check again.

![](https://farm9.staticflickr.com/8685/16735725998_62c26a24bc_c.jpg)

### Service Configuration: SMTP Service Monitoring ###

Now let's set up a check on a remote SMTP mail server (e.g., 192.168.111.102). Let's assume that the SMTP server is running SMTP, IMAP and SSH on its LAN interface.

    check host MAIL with address 192.168.111.102
       if failed icmp type echo within 10 cycles then alert
       if failed port 25  protocol smtp then alert
                 else if recovered then exec "/scripts/mail-script"
       if failed port 22  protocol ssh  then alert
       if failed port 143 protocol imap then alert

We check if the remote host responds to ICMP. If we haven't received ICMP response within 10 cycles, we send out an alert. If testing for SMTP protocol on port 25 fails, we send out an alert. If testing succeeds again after a failed test, we run a script (/scripts/mail-script). If testing for SSH and IMAP protocols fail on port 22 and 143, respectively, we send out an alert.

### Conclusion ###

In this tutorial, I demonstrate how to set up Monit on a local server. What I showed here is just the tip of the iceberg, as far as Monit's capabilities are concerned. Take your time and read the man page about Monit (a very good one). Monit can do a lot for any Linux admin with a very nice and easy to understand syntax. If you put together a centralized remote monitor and Monit to work for you, you will have a more reliable monitoring system. What is your thought on Monit?

--------------------------------------------------------------------------------

via: http://xmodulo.com/server-monitoring-system-monit.html

作者：[Iulian Murgulet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/iulian
[1]:http://xmodulo.com/monitor-common-services-nagios.html
[2]:http://xmodulo.com/monitor-linux-servers-snmp-cacti.html
[3]:http://mmonit.com/monit/
[4]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[5]:http://xmodulo.com/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[6]:http://xmodulo.com/mail-server-ubuntu-debian.html
[7]:http://mmonit.com/wiki/Monit/ConfigurationExamples