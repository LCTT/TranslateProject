Translating-----------geekpi


How to monitor server memory usage with Nagios Remote Plugin Executor (NRPE)
================================================================================
In a [previous tutorial][1]注：此篇文章在同一个更新中，如果也翻译了，发布的时候可修改相应的链接, we have seen how we can set up Nagios Remote Plugin Executor (NRPE) in an existing Nagios setup. However, the scripts and plugins needed to monitor memory usage do not come with stock Nagios. In this tutorial, we will see how we can configure NRPE to monitor RAM usage of a remote server.

The script that we will use for monitoring RAM is available at [Nagios Exchange][2], as well as the creators' [Github repository][3].

Assuming that NRPE has already been set up, we start the process by downloading the script in the server that we want to monitor.

### Preparing Remote Servers ###

#### On Debain/Ubuntu: ####

    # cd /usr/lib/nagios/plugins/
    # wget https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl
    # mv check_mem.pl check_mem
    # chmod +x check_mem 

#### On RHEL/CentOS: ####

    # cd /usr/lib64/nagios/plugins/ (or /usr/lib/nagios/plugins/ for 32-bit)
    # wget https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl
    # mv check_mem.pl check_mem
    # chmod +x check_mem

You can check whether the script generates output properly by manually running the following command on localhost. When used with NRPE, this command is supposed to check free memory, warn when free memory is less than 20%, and generate critical alarm when free memory is less than 10%.

    # ./check_mem -f -w 20 -c 10 

----------

    OK - 34.0% (2735744 kB) free.|TOTAL=8035340KB;;;; USED=5299596KB;6428272;7231806;; FREE=2735744KB;;;; CACHES=2703504KB;;;;

If you see something like the above as an output, that means the command is working okay.

Now that the script is ready, we define the command to check RAM usage for NRPE. As mentioned before, the command will check free memory, warn when free memory is less than 20%, and generate critical alarm when free memory is less than 10%.

    # vim /etc/nagios/nrpe.cfg 
 
#### For Debian/Ubuntu: ####

    command[check_mem]=/usr/lib/nagios/plugins/check_mem  -f -w 20 -c 10

#### For RHEL/CentOS 32 bit: ####

    command[check_mem]=/usr/lib/nagios/plugins/check_mem  -f -w 20 -c 10

#### For RHEL/CentOS 64 bit: ####

    command[check_mem]=/usr/lib64/nagios/plugins/check_mem  -f -w 20 -c 10

### Preparing Nagios Server ###

In the Nagios server, we define a custom command for NRPE. The command can be stored in any directory within Nagios. To keep the tutorial simple, we will put the command definition in /etc/nagios directory.

#### For Debian/Ubuntu: ####

    # vim /etc/nagios3/conf.d/nrpe_command.cfg 

----------

    define command{
            command_name check_nrpe
            command_line /usr/lib/nagios/plugins/check_nrpe -H '$HOSTADDRESS$'  -c '$ARG1$'
    }

#### For RHEL/CentOS 32 bit: ####

    # vim /etc/nagios/objects/nrpe_command.cfg 

----------

    define command{
            command_name check_nrpe
            command_line /usr/lib/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
            }

#### For RHEL/CentOS 64 bit: ####

    # vim /etc/nagios/objects/nrpe_command.cfg 

----------

    define command{
            command_name check_nrpe
            command_line /usr/lib64/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
            }

Now we define the service check in Nagios.

#### On Debian/Ubuntu: ####

    # vim /etc/nagios3/conf.d/nrpe_service_check.cfg 

----------

    define service{
            use                            local-service
            host_name                      remote-server
            service_description            Check RAM
            check_command                  check_nrpe!check_mem
    }

#### On RHEL/CentOS: ####

    # vim /etc/nagios/objects/nrpe_service_check.cfg 

----------

    define service{
            use                            local-service
            host_name                      remote-server
            service_description            Check RAM
            check_command                  check_nrpe!check_mem
    }

Finally, we restart the Nagios service.

#### On Debian/Ubuntu: ####

    # service nagios3 restart 

#### On RHEL/CentOS 6: ####

    # service nagios restart 

#### On RHEL/CentOS 7: ####

    # systemctl restart nagios.service 

### Troubleshooting ###

Nagios should start checking RAM usage of a remote-server using NRPE. If you are having any problem, you could check the following.


- Make sure that NRPE port is allowed all the way to the remote host. Default NRPE port is TCP 5666.
- You could try manually checking NRPE operation by executing the check_nrpe command: /usr/lib/nagios/plugins/check_nrpe -H remote-server
- You could also try to run the check_mem command manually: /usr/lib/nagios/plugins/check_nrpe -H remote-server –c check_mem
- In the remote server, set debug=1 in /etc/nagios/nrpe.cfg. Restart the NRPE service and check the log file /var/log/messages (RHEL/CentOS) or /var/log/syslog (Debain/Ubuntu). The log files should contain relevant information if there is any configuration or permission errors. If there are not hits in the log, it is very likely that the requests are not reaching the remote server due to port filtering at some point. 

To sum up, this tutorial demonstrated how we can easily tune NRPE to monitor RAM usage of remote servers. The process is as simple as downloading the script, defining the commands, and restarting the services. Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/monitor-server-memory-usage-nagios-remote-plugin-executor.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://xmodulo.com/2014/03/nagios-remote-plugin-executor-nrpe-linux.html
[2]:http://exchange.nagios.org/directory/Plugins/Operating-Systems/Solaris/check_mem-2Epl/details
[3]:https://github.com/justintime/nagios-plugins/blob/master/check_mem/check_mem.pl