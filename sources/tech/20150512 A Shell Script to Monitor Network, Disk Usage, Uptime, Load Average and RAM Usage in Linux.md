Translating by GOLinux!
A Shell Script to Monitor Network, Disk Usage, Uptime, Load Average and RAM Usage in Linux
================================================================================
The duty of System Administrator is really tough as he/she has to monitor the servers, users, logs, create backup and blah blah blah. For the most repetitive task most of the administrator write a script to automate their day-to-day repetitive task. Here we have written a shell Script that do not aims to automate the task of a typical system admin, but it may be helpful at places and specially for those newbies who can get most of the information they require about their System, Network, Users, Load, Ram, host, Internal IP, External IP, Uptime, etc.

We have taken care of formatting the output (to certain extent). The Script don’t contains any Malicious contents and it can be run using Normal user Account. In-fact it is recommended to run this script as user and not as root.

![Linux Server Health Monitoring](http://www.tecmint.com/wp-content/uploads/2015/05/Linux-Health-Monitoring.png)
Shell Script to Monitor Linux System Health

You are free to use/modify/redistribute the below piece of code by giving proper credit to Tecmint and Author. We have tried to customize the output to the extent that nothing other than the required output is generated. We have tried to use those variables which are generally not used by Linux System and are probably free.

#### Minimum System Requirement ####

All you need to have is a working Linux box.

#### Dependency ####

There is no dependency required to use this package for a standard Linux Distribution. Moreover the script don’t requires root permission for execution purpose. However if you want to Install it, you need to enter root password once.

#### Security ####

We have taken care to ensure security of the system. Nothing additional package is required/installed. No root access required to run. Moreover code has been released under Apache 2.0 License, that means you are free to edit, modify and re-distribute by keeping Tecmint copyright.

### How Do I Install and Run Script? ###

First, use following [wget command][1] to download the monitor script `"tecmint_monitor.sh"` and make it executable by setting appropriate permissions.

    # wget http://tecmint.com/wp-content/scripts/tecmint_monitor.sh
    # chmod 755 tecmint_monitor.sh

It is strongly advised to install the script as user and not as root. It will ask for root password and will install the necessary components at required places.

To install `"tecmint_monitor.sh"` script, simple use -i (install) option as shown below.

    /tecmint_monitor.sh -i 

Enter root password when prompted. If everything goes well you will get a success message like shown below.

    Password: 
    Congratulations! Script Installed, now run monitor Command

After installation, you can run the script by calling command `'monitor'` from any location or user. If you don’t like to install it, you need to include the location every-time you want to run it.

    # ./Path/to/script/tecmint_monitor.sh

Now run monitor command from anywhere using any user account simply as:

    $ monitor

![TecMint Monitor Script in Action](http://www.tecmint.com/wp-content/uploads/2015/05/TecMint-Monitor-Script.gif)

As soon as you run the command you get various System related information which are:

- Internet Connectivity
- OS Type
- OS Name
- OS Version
- Architecture
- Kernel Release
- Hostname
- Internal IP
- External IP
- Name Servers
- Logged In users
- Ram Usages
- Swap Usages
- Disk Usages
- Load Average
- System Uptime

Check the installed version of script using -v (version) switch.

    $ monitor -v
    
    tecmint_monitor version 0.1
    Designed by Tecmint.com
    Released Under Apache 2.0 License

### Conclusion ###

This script is working out of the box on a few machines I have checked. It should work the same for you as well. If you find any bug let us know in the comments. This is not the end. This is the beginning. You can take it to any level from here. If you feel like editing the script and carry it further you are free to do so giving us proper credit and also share the updated script with us so that we can update this article by giving you proper credit.

Don’t forget to share your thoughts or your script with us. We will be here to help you. Thank you for all the love you have given us. Keep Connected! Stay tuned.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-server-health-monitoring-script/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/
