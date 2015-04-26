30 Things to Do After Minimal RHEL/CentOS 7 Installation--5
================================================================================
### 25. Install Linux Malware Detect (LMD) ###

Linux Malware Detect (LMD) is a open source Linux malware scanner released under the GNU GPLv2 license, that is
specially designed for threats faced in hosting environments. For complete installation, configuration and usage of LMD can be found at:

- [Install and Use (LMD) with ClamAV as Antivirus Engine][1]

### 26. Server Bandwidth Testing with Speedtest-cli ###

speedtest-cli is a tool written in python to test internet bandwidth including download and upload speed. For complete installation and usage of speedtest-cli tool, read our article at [Check Linux Server Bandwidth Speed from Command Line][2]

### 27. Configure Cron Jobs ###

This is one of the most widely used software utility. It function as job scheduler i.e., schedule a job now that will execute in future itself. It is useful in logging and maintaining records unattained as well as several other routine work like regular backup. All the schedule is written in /etc/crontab file.

The crontab file contains 6 fields as follows:

    Minutes	         Hour		Day of Month		Month of Year		Week Day		Command
    (0-59)           (0-23)		  (1-31)                (1/jan-12/dec)       (0-6/sun-sat)          Command/script

![Crontab Fields](http://www.tecmint.com/wp-content/uploads/2015/04/Crontab-Fields.jpeg)
Crontab Fields

To run a cron job (say run /home/$USER/script.sh) everyday at 04:30 am.

    Minutes 	  Hour   	Day of Month        month of year 	Week Day         command
    30                4  		      *		         *		   *            speedtest-cli

Add the following entry to the crontab file ‘/etc/crontab/‘.

    30  4  *  *  *  /home/$user/script.sh

After adding the above line to crontab, it will run automatically at 04:30 am everyday and the output depends upon what is there in script file. Moreover script can be replaced by commands. For more examples of cron jobs, read [11 Cron Jobs Examples in Linux][3]

### 28. Install Owncloud ###

Owncloud is a HTTP based data synchronization, file sharing and remote file storage application. For more detail on installing own cloud, you may like to see this article : [Create Personal/Private Cloud Storage in Linux][4]

### 29. Enable Virtualization with Virtualbox ###

Virtualization is a process of creating virtual OS, Hardware and Network, is one of the most sought technology of these days. We will be discussing on how to install and configure virtualization in detail.

Our CentOS Minimal server is a headless server. Lets prepare it to host virtual machines that is accessible over HTTP by installing following packages.

    # yum groupinstall 'Development Tools' SDL kernel-devel kernel-headers dkms

![Install Development Tools](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Development-Tool.jpeg)
Install Development Tools

Change working directory to ‘/etc/yum.repos.d/‘ and download Virtualbox repository.

    # wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

Install the key just downloaded.

    # rpm --import oracle_vbox.asc

Update and Install Virtualbox.

    # yum update && yum install virtualbox-4.3

Next, download and install Virtualbox extension pack.

    # wget http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack
    # VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack

![Install Virtualbox Extension Pack](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Virtualbox-Extension-Pack.jpeg)
Install Virtualbox Extension Pack

![Installing Virtualbox Extension Pack](http://www.tecmint.com/wp-content/uploads/2015/04/Installing-Virtualbox-Extension-Pack.jpeg)
Installing Virtualbox Extension Pack

Create a user ‘vbox‘ to manage virtualbox and add it to group vboxusers.

    # adduser vbox
    # passwd vobx
    # usermod -G vboxusers vbox

Install HTTPD server.

    # yum install httpd

Install PHP (with soap extension).

    # yum install php php-devel php-common php-soap php-gd

Download PHP virtualBox.

    # wget http://sourceforge.net/projects/phpvirtualbox/files/phpvirtualbox-4.3-1.zip

Extract the zip and copy the extracted folder to HTTP working directory.

    # unzip phpvirtualbox-4.*.zip
    # cp phpvirtualbox-4.3-1 -R /var/www/html

Next, rename file /var/www/html/phpvirtualbox/config.php-example to var/www/html/phpvirtualbox/config.php.

    # mv config.php.example config.php

Open the configuration file to edit and add ‘username‘ and ‘password‘ we just created in the above step.

    # vi config.php

Finally, restart VirtualBox and HTTP server.

    # service vbox-service restart
    # service httpd restart

Now forward the port and access it on a headed server.

    http://192.168.0.15/phpvirtualbox-4.3-1/

![PHP Virtualbox Login](http://www.tecmint.com/wp-content/uploads/2015/04/PHP-Virtualbox-Login.png)
PHP Virtualbox Login

![PHP Virtualbox Dashboard](http://www.tecmint.com/wp-content/uploads/2015/04/PHP-Virtualbox.png)
PHP Virtualbox Dashboard

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/5/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/install-linux-malware-detect-lmd-in-rhel-centos-and-fedora/
[2]:http://www.tecmint.com/check-internet-speed-from-command-line-in-linux/
[3]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[4]:http://www.tecmint.com/install-owncloud-to-create-personal-storage-in-linux/