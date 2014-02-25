>>Translating by ThomazL
10 Useful Random Linux Interview Questions and Answers
================================================================================
To a little surprise this time we are not presenting Interview question on any specific subject but on random topics. These question will surely help you in cracking Interviews beside adding to your Knowledge.

![](http://www.tecmint.com/wp-content/uploads/2014/02/Random-Interview-Questions.png)

1. Let’s say you maintains a backup on regular basis for the company you are working. The backups are maintained in Compressed file format. You need to examine a log, two months old. What would you suggest without decompressing the compressed file?

> **Answer** : To check the contents of a compressed file without the need of decompressing it, we need to use ‘zcat’. The zcat utility makes it possible to view the contents of a compressed file.

    # zcat ­f phpshell­2.4.tar.gz

2. You need to track events on your system. What will you do?

> **Answer** : For tracking the events on the system, we need a daemon called syslogd. The syslogd daemon is useful in tracking the information of system and then saving it to specified log files.

Running ‘**syslogd**‘ application in terminal generates log file at the location ‘/var/log/syslog‘. The syslogd application is very useful in troubleshooting Linux sytems. A sample log file looks similar to below.

![syslongd](http://www.tecmint.com/wp-content/uploads/2014/02/syslongd.jpg)

3. How will you restrict IP so that the restricted IP’s may not use the FTP Server?

> **Answer** : We can block suspicious IP by integrating tcp_wrapper. We need to enable the parameter “tcp_wrapper=YES” in the configuration file at ‘/etc/vsftpd.conf’. And then add the suspicious IP in the ‘host.deny’ file at location ‘/etc/host.deny’.

#### Block IP Address ####

Open ‘/etc/hosts.deny’ file.

    # vi /etc/hosts.deny

Add the IP address that you want to block at the bottom of the file.

    #
    # hosts.deny    This file contains access rules which are used to
    #               deny connections to network services that either use
    #               the tcp_wrappers library or that have been
    #               started through a tcp_wrappers-enabled xinetd.
    #
    #               The rules in this file can also be set up in
    #               /etc/hosts.allow with a 'deny' option instead.
    #
    #               See 'man 5 hosts_options' and 'man 5 hosts_access'
    #               for information on rule syntax.
    #               See 'man tcpd' for information on tcp_wrappers
    #
    vsftpd:172.16.16.1
4. Tell us the difference between Telnet and SSH?

> **Answer** : Telnet and SSH both are communication protocol which are used to manage remote system. SSH is Secured, which requires exchanging of key opposite of telnet which transmit data in plain text, which means telnet is less secure than SSH.

5. You need to stop your X server. When you tries to kill your X server, You got an error message that you cannot quit X server. What will you do?

> **Answer** : When killing a X server, it won’t work normal way like doing ‘/etc/init.d/gdm stop’. We need to execute a special key combination ‘Ctrl+ Alt+ Back Space’ which will force X server to restart.

6. What is the difference between command ‘ping’ and ‘ping6′?

> **Answer** : Both the commands are same and used for the same purpose except that the fact that ping6 is used with ipv6 IP address.

7. You want to search for all the *.tar files in your Home directory and wants to delete all at once. How will you do it?

> **Answer** : We need to use find command with rm command to delete all “.tar” files.

    # find /home/ ­name '*.tar' | xargs rm ­rf

8. What is the difference between locate and slocate command?

> **Answer** : The slocate looks for the files that user have access whereas locate will search for the file with updated result.

9. You need to search for the string “Tecmint” in all the “.txt” files in the current directory. How will you do it?

> **Answer** : We need to run the fine command to search for the text “Tecmint” in the current directory, recursively.

    # find ­name “*.txt” | xargs grep “Tecmint”

10. You want to send a message to all connected users as “Server is going down for maintenance”, what will you do?

> **Answer** : This can be achieved using the wall command. The wall command sends a message to all connected users on the sever.

    # echo please save your work, immediately. The server is going down for Maintenance at 12:30 Pm, sharply. | wall

![wall command](http://www.tecmint.com/wp-content/uploads/2014/02/wall.jpg)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/useful-random-linux-interview-questions-and-answers/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
