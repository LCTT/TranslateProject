How to set up Nagios Remote Plugin Executor (NRPE) in Linux
================================================================================
As far as network management is concerned, Nagios is one of the most powerful tools. Nagios can monitor the reachability of remote hosts, as well as the state of services running on them. However, what if we want to monitor something other than network services for a remote host? For example, we may want to monitor the disk utilization or [CPU processor load][1] of a remote host. Nagios Remote Plugin Executor (NRPE) is a tool that can help with doing that. NRPE allows one to execute Nagios plugins installed on remote hosts, and integrate them with an [existing Nagios server][2].

This tutorial will cover how to set up NRPE on an existing Nagios deployment. The tutorial is primarily divided into two parts:

- Configure remote hosts.
- Configure a Nagios monitoring server. 

We will then finish off by defining some custom commands that can be used with NRPE.

### Configure Remote Hosts for NRPE ###

#### Step One: Installing NRPE Service ####

You need to install NRPE service on every remote host that you want to monitor using NRPE. NRPE service daemon on each remote host will then communicate with a Nagios monitoring server.

Necessary packages for NRPE service can easily be installed using apt-get or yum, subject to the platform. In case of CentOS, we will need to [add Repoforge repository][3] as NRPE is not available in CentOS repositories.

**On Debian, Ubuntu or Linux Mint:**

    # apt-get install nagios-nrpe-server 

**On CentOS, Fedora or RHEL:**

    # yum install nagios-nrpe 

#### Step Two: Preparing Configuration File ####

The configuration file /etc/nagios/nrpe.cfg is similar for Debian-based and RedHat-based systems. The configuration file is backed up, and then updated as follows.

    # vim /etc/nagios/nrpe.cfg 

----------

    ## NRPE service port can be customized ##
    server_port=5666
    
    ## the nagios monitoring server is permitted ##
    ## NOTE: There is no space after the comma ##
    allowed_hosts=127.0.0.1,X.X.X.X-IP_v4_of_Nagios_server
    
    ## The following examples use hard-coded command arguments.
    ## These parameters can be modified as needed.
    
    ## NOTE: For CentOS 64 bit, use /usr/lib64 instead of /usr/lib ##
    
    command[check_users]=/usr/lib/nagios/plugins/check_users -w 5 -c 10
    command[check_load]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
    command[check_hda1]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1
    command[check_zombie_procs]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z
    command[check_total_procs]=/usr/lib/nagios/plugins/check_procs -w 150 -c 200

Now that the configuration file is ready, NRPE service is ready to be fired up.

#### Step Three: Initiating NRPE Service ####

For RedHat-based systems, the NRPE service needs to be added as a startup service.

**On Debian, Ubuntu, Linux Mint:**

    # service nagios-nrpe-server restart 

**On CentOS, Fedora or RHEL:**

    # service nrpe restart
    # chkconfig nrpe on 

#### Step Four: Verifying NRPE Service Status ####

Information about NRPE daemon status can be found in the system log. For a Debian-based system, the log file will be /var/log/syslog. The log file for a RedHat-based system will be /var/log/messages. A sample log is provided below for reference.

    nrpe[19723]: Starting up daemon
    nrpe[19723]: Listening for connections on port 5666
    nrpe[19723]: Allowing connections from: 127.0.0.1,X.X.X.X

In case firewall is running, TCP port 5666 should be open, which is used by NRPE daemon.

    # netstat -tpln | grep 5666 

----------

    tcp    0    0    0.0.0.0:5666      0.0.0.0:*      LISTEN    19885/nrpe

### Configure Nagios Monitoring Server for NRPE ###

The first step in configuring an existing Nagios monitoring server for NRPE is to install NRPE plugin on the server.

#### Step One: Installing NRPE Plugin ####

In case the Nagios server is running on a Debian-based system (Debian, Ubuntu or Linux Mint), a necessary package can be installed using apt-get.

    # apt-get install nagios-nrpe-plugin 

After the plugin is installed, the check_nrpe command, which comes with the plugin, is modified a bit.

    # vim /etc/nagios-plugins/config/check_nrpe.cfg 

----------

    ## the default command is overwritten ##
    define command{
            command_name    check_nrpe
            command_line    /usr/lib/nagios/plugins/check_nrpe -H '$HOSTADDRESS$' -c '$ARG1$'
    }

In case the Nagios server is running on a RedHat-based system (CentOS, Fedora or RHEL), you can install NRPE plugin using yum. On CentOS, [adding Repoforge repository][4] is necessary.

    # yum install nagios-plugins-nrpe 

Now that the NRPE plugin is installed, proceed to configure a Nagios server following the rest of the steps.

#### Step Two: Defining Nagios Command for NRPE Plugin ####

First, we need to define a command in Nagios for using NRPE.

    # vim /etc/nagios/objects/commands.cfg 

----------

    ## NOTE: For CentOS 64 bit, use /usr/lib64 instead of /usr/lib ##
    define command{
            command_name    check_nrpe
            command_line    /usr/lib/nagios/plugins/check_nrpe -H '$HOSTADDRESS$' -c '$ARG1$'
    }

#### Step Three: Adding Host and Command Definition ####

Next, define remote host(s) and commands to execute remotely on them.

The following shows sample definitions of a remote host a command to execute on the host. Naturally, your configuration will be adjusted based on your requirements. The path to the file is slightly different for Debian-based and RedHat-based systems. But the content of the files are identical.

**On Debian, Ubuntu or Linux Mint:**

    # vim /etc/nagios3/conf.d/nrpe.cfg 

**On CentOS, Fedora or RHEL:**

    # vim /etc/nagios/objects/nrpe.cfg 

----------

    define host{
            use                     linux-server
            host_name               server-1
            alias                   server-1
            address                 X.X.X.X-IPv4_address_of_remote_host
    }
    
    define service {
            host_name                       server-1
            service_description             Check Load
            check_command                   check_nrpe!check_load
            check_interval                  1
            use                             generic-service
    }

#### Step Four: Restarting Nagios Service ####

Before restarting Nagios, updated configuration is verified with a dry run.

**On Ubuntu, Debian, or Linux Mint:**

    # nagios3 -v /etc/nagios3/nagios.cfg 

**On CentOS, Fedora or RHEL:**

    # nagios -v /etc/nagios/nagios.cfg 

If everything goes well, Nagios service can be restarted.

    # service nagios restart 

![](https://farm8.staticflickr.com/7024/13330387845_0bde8b6db5_z.jpg)

### Configuring Custom Commands with NRPE ###

#### Setup on Remote Servers ####

The following is a list of custom commands that can be used with NRPE. These commands are defined in the file /etc/nagios/nrpe.cfg located at the remote servers.

    ## Warning status when load average exceeds 1, 2 and 1 for 1, 5, 15 minute interval, respectively.
    ## Critical status when load average exceeds 3, 5 and 3 for 1, 5, 15 minute interval, respectively.
    command[check_load]=/usr/lib/nagios/plugins/check_load -w 1,2,1 -c 3,5,3
    
    ## Warning level 25% and critical level 10% for free space of /home.
    ## Could be customized to monitor any partition (e.g. /dev/sdb1, /, /var, /home)
    command[check_disk]=/usr/lib/nagios/plugins/check_disk -w 25% -c 10% -p /home
    
    ## Warn if number of instances for process_ABC exceeds 10. Critical for 20 ##
    command[check_process_ABC]=/usr/lib/nagios/plugins/check_procs -w 1:10 -c 1:20 -C process_ABC
    
    ## Critical if the number of instances for process_XYZ drops below 1 ##
    command[check_process_XYZ]=/usr/lib/nagios/plugins/check_procs -w 1: -c 1: -C process_XYZ

#### Setup on Nagios Monitoring Server ####

To apply the custom commands defined above, we modify the service definition at Nagios monitoring server as follows. The service definition could go to the file where all the services are defined (e.g., /etc/nagios/objects/nrpe.cfg or /etc/nagios3/conf.d/nrpe.cfg)

    ## example 1: check process XYZ ##
    define service {
            host_name                       server-1
            service_description             Check Process XYZ
            check_command                   check_nrpe!check_process_XYZ
            check_interval                  1
            use                             generic-service
    }
    
    ## example 2: check disk state ##
    define service {
            host_name                       server-1
            service_description             Check Process XYZ
            check_command                   check_nrpe!check_disk
            check_interval                  1
            use                             generic-service
    }

To sum up, NRPE is a powerful add-on to Nagios as it provides provision for monitoring a remote server in a highly configurable fashion. Using NRPE, we can monitor server load, running processes, logged in users, disk states and other parameters.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/03/nagios-remote-plugin-executor-nrpe-linux.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://xmodulo.com/2012/08/how-to-measure-average-cpu-utilization.html
[2]:http://xmodulo.com/2013/12/install-configure-nagios-linux.html
[3]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[4]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
