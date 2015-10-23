ictlyh Translating
Part 10: Setting Up “NTP (Network Time Protocol) Server” in RHEL/CentOS 7
================================================================================
Network Time Protocol – NTP- is a protocol which runs over port 123 UDP at Transport Layer and allows computers to synchronize time over networks for an accurate time. While time is passing by, computers internal clocks tend to drift which can lead to inconsistent time issues, especially on servers and clients logs files or if you want to replicate servers resources or databases.

![NTP Server Install in CentOS](http://www.tecmint.com/wp-content/uploads/2014/09/NTP-Server-Install-in-CentOS.png)

NTP Server Installation in CentOS and RHEL 7

#### Requirements: ####

- [CentOS 7 Installation Procedure][1]
- [RHEL 7 Installation Procedure][2]

#### Additional Requirements: ####

- [Register and Enbale RHEL 7 Subscription for Updates][3]
- [Configure Static IP Address on CentOS/Rhel 7][4]
- [Disable and Remove Unwanted Services in CentOS/RHEL 7][5]

This tutorial will demonstrate how you can install and configure NTP server on CentOS/RHEL 7 and automatically synchronize time with the closest geographically peers available for your server location by using NTP Public Pool Time Servers list.

#### Step 1: Install and configure NTP daemon ####

1. NTP server package is provided by default from official CentOS /RHEL 7 repositories and can be installed by issuing the following command.

    # yum install ntp

![Install NTP in CentOS](http://www.tecmint.com/wp-content/uploads/2014/09/Install-NTP-in-CentOS.png)

Install NTP Server

2. After the server is installed, first go to official [NTP Public Pool Time Servers][6], choose your Continent area where the server physically is located, then search for your Country location and a list of NTP servers should appear.

![NTP Pool Server](http://www.tecmint.com/wp-content/uploads/2014/09/NTP-Pool-Server.png)

NTP Pool Server

3. Then open NTP daemon main configuration file for editing, comment the default list of Public Servers from pool.ntp.org project and replace it with the list provided for your country like in the screenshot below.

![Configure NTP Server in CentOS](http://www.tecmint.com/wp-content/uploads/2014/09/Configure-NTP-Server.png)

Configure NTP Server

4. Further, you need to allow clients from your networks to synchronize time with this server. To accomplish this, add the following line to NTP configuration file, where restrict statement controls, what network is allowed to query and sync time – replace network IPs accordingly.

    restrict 192.168.1.0 netmask 255.255.255.0 nomodify notrap

The nomodify notrap statements suggest that your clients are not allowed to configure the server or be used as peers for time sync.

5. If you need additional information for troubleshooting in case there are problems with your NTP daemon add a log file statement which will record all NTP server issues into one dedicated log file.

    logfile /var/log/ntp.log

![Enable NTP Logs in CentOS](http://www.tecmint.com/wp-content/uploads/2014/09/Enable-NTP-Log.png)

Enable NTP Logs

6. After you have edited the file with all configuration explained above save and close ntp.conf file. Your final configuration should look like in the screenshot below.

![NTP Server Configuration in CentOS](http://www.tecmint.com/wp-content/uploads/2014/09/NTP-Server-Configuration.png)

NTP Server Configuration

### Step 2: Add Firewall Rules and Start NTP Daemon ###

7. NTP service uses UDP port 123 on OSI transport layer (layer 4). It is designed particularly to resist the effects of variable latency (jitter). To open this port on RHEL/CentOS 7 run the following commands against Firewalld service.

    # firewall-cmd --add-service=ntp --permanent
    # firewall-cmd --reload

![Open NTP Port in Firewall](http://www.tecmint.com/wp-content/uploads/2014/09/Open-NTP-Port.png)

Open NTP Port in Firewall

8. After you have opened Firewall port 123, start NTP server and make sure you enable it system-wide. Use the following commands to manage the service.

    # systemctl start ntpd
    # systemctl enable ntpd
    # systemctl status ntpd

![Start NTP Service](http://www.tecmint.com/wp-content/uploads/2014/09/Start-NTP-Service.png)

Start NTP Service

### Step 3: Verify Server Time Sync ###

9. After NTP daemon has been started, wait a few minutes for the server to synchronize time with its pool list servers, then run the following commands to verify NTP peers synchronization status and your system time.

    # ntpq -p
    # date -R

![Verify NTP Server Time](http://www.tecmint.com/wp-content/uploads/2014/09/Verify-NTP-Time-Sync.png)

Verify NTP Time Sync

10. If you want to query and synchronize against a pool of your choice use ntpdate command, followed by the server or servers addresses, as suggested in the following command line example.

    # ntpdate -q  0.ro.pool.ntp.org  1.ro.pool.ntp.org

![Synchronize NTP Time](http://www.tecmint.com/wp-content/uploads/2014/09/Synchronize-NTP-Time.png)

Synchronize NTP Time

### Step 4: Setup Windows NTP Client ###

11. If your windows machine is not a part of a Domain Controller you can configure Windows to synchronize time with your NTP server by going to Time from the right side of Taskbar -> Change Date and Time Settings -> Internet Time tab -> Change Settings -> Check Synchronize with an Internet time server -> put your server’s IP or FQDN on Server filed -> Update now -> OK.

![Synchronize Windows Time with NTP](http://www.tecmint.com/wp-content/uploads/2014/09/Synchronize-Windows-Time-with-NTP.png)

Synchronize Windows Time with NTP

That’s all! Setting up a local NTP Server on your network ensures that all your servers and clients have the same time set in case of an Internet connectivity failure and they all are synchronized with each other.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-ntp-server-in-centos/

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/centos-7-installation/
[2]:http://www.tecmint.com/redhat-enterprise-linux-7-installation/
[3]:http://www.tecmint.com/enable-redhat-subscription-reposiories-and-updates-for-rhel-7/
[4]:http://www.tecmint.com/configure-network-interface-in-rhel-centos-7-0/
[5]:http://www.tecmint.com/remove-unwanted-services-in-centos-7/
[6]:http://www.pool.ntp.org/en/