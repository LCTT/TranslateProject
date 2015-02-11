translating by martin.

Install Linux-Dash (Web Based Monitoring tool) on Ubntu 14.10
================================================================================
A low-overhead monitoring web dashboard for a GNU/Linux machine. Simply drop-in the app and go!.Linux Dash's interface provides a detailed overview of all vital aspects of your server, including RAM and disk usage, network, installed software, users, and running processes. All information is organized into sections, and you can jump to a specific section using the buttons in the main toolbar. Linux Dash is not the most advanced monitoring tool out there, but it might be a good fit for users looking for a slick, lightweight, and easy to deploy application.

### Linux-Dash Features ###

A beautiful web-based dashboard for monitoring server info

Live, on-demand monitoring of RAM, Load, Uptime, Disk Allocation, Users and many more system stats

Drop-in install for servers with Apache2/nginx + PHP

Click and drag to re-arrange widgets

Support for wide range of linux server flavors

### List of Current Widgets ###

- General info
- Load Average
- RAM
- Disk Usage
- Users
- Software
- IP
- Internet Speed
- Online
- Processes
- Logs

### Install Linux-dash on ubuntu server 14.10 ###

First you need to make sure you have [Ubuntu LAMP server 14.10][1] installed and Now you have to install the following package

    sudo apt-get install php5-json unzip

After the installation this module will enable for apache2 so you need to restart the apache2 server using the following command

    sudo service apache2 restart

Now you need to download the linux-dash package and install

    wget https://github.com/afaqurk/linux-dash/archive/master.zip

    unzip master.zip

    sudo mv linux-dash-master/ /var/www/html/linux-dash-master/

Now you need to change the permissions using the following command

    sudo chmod 755 /var/www/html/linux-dash-master/

Now you need to go to http://serverip/linux-dash-master/ you should see similar to the following output

![](http://www.ubuntugeek.com/wp-content/uploads/2015/02/1.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/02/2.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-linux-dash-web-based-monitoring-tool-on-ubntu-14-10.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.ubuntugeek.com/step-by-step-ubuntu-14-10-utopic-unicorn-lamp-server-setup.html
