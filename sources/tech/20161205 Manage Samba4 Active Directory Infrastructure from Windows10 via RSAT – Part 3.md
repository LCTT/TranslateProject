Manage Samba4 Active Directory Infrastructure from Windows10 via RSAT – Part 3
============================================================

In this part of the [Samba4 AD DC infrastructure series][8] we will talk on how join a Windows 10 machine into a Samba4 realm and how to administer the domain from a Windows 10 workstation.

Once a Windows 10 system has been joined to Samba4 AD DC we can create, remove or disable domain users and groups, we can create new Organizational Units, we can create, edit and manage domain policy or we can manage Samba4 domain DNS service.

All of the above functions and other complex tasks concerning domain administration can be achieved via any modern Windows platform with the help of RSAT – Microsoft Remote Server Administration Tools.

#### Requirements

1.  [Create an AD Infrastructure with Samba4 on Ubuntu 16.04 – Part 1][1]
2.  [Manage Samba4 AD Infrastructure from Linux Command Line – Part 2][2]
3.  [Manage Samba4 AD Domain Controller DNS and Group Policy from Windows – Part 4][3]

### Step 1: Configure Domain Time Synchronization

1. Before starting to administer Samba4 ADDC from Windows 10 with the help of RSAT tools, we need to know and take care of a crucial piece of service required for an Active Directory and this service refers to [accurate time synchronization][9].

Time synchronization can be offered by NTP daemon in most of the Linux distributions. The default maximum time period discrepancy an AD can support is about 5 minutes.

If the divergence time period is greater than 5 minutes you should start experience various errors, most important concerning AD users, joined machines or share access.

To install Network Time Protocol daemon and NTP client utility in Ubuntu, execute the below command.

```
$ sudo apt-get install ntp ntpdate
```
[
 ![Install NTP on Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/12/Install-NTP-on-Ubuntu.png) 
][10]

Install NTP on Ubuntu

2. Next, open and edit NTP configuration file and replace the default NTP pool server list with a new list of NTP servers which are geographically located near your current physical equipment location.

The list of NTP servers can be obtained by visiting official NTP Pool Project webpage [http://www.pool.ntp.org/en/][11].

```
$ sudo nano /etc/ntp.conf
```

Comment the default server list by adding a `#` in front of each pool line and add the below pool lines with your proper NTP servers as illustrated on the below screenshot.

```
pool 0.ro.pool.ntp.org iburst
pool 1.ro.pool.ntp.org iburst
pool 2.ro.pool.ntp.org iburst
# Use Ubuntu's ntp server as a fallback.
pool 3.ro.pool.ntp.org
```
[
 ![Configure NTP Server in Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/12/Configure-NTP-Server-in-Ubuntu.png) 
][12]

Configure NTP Server in Ubuntu

3. Now, don’t close the file yet. Move to the top at the file and add the below line after the driftfile statement. This setup allows the clients to query the server using AD signed NTP requests.

```
ntpsigndsocket /var/lib/samba/ntp_signd/
```
[
 ![Sync AD with NTP](http://www.tecmint.com/wp-content/uploads/2016/12/Sync-AD-with-NTP.png) 
][13]

Sync AD with NTP

4. Finally, move to the bottom of the file and add the below line, as illustrated on the below screenshot, which will allow network clients only to query the time on the server.

```
restrict default kod nomodify notrap nopeer mssntp
```
[
 ![Query Clients to NTP Server](http://www.tecmint.com/wp-content/uploads/2016/12/Query-Client-to-NTP-Server.png) 
][14]

Query Clients to NTP Server

5. When finished, save and close the NTP configuration file and grant NTP service with the proper permissions in order to read the ntp_signed directory.

This is the system path where Samba NTP socket is located. Afterwards, restart NTP daemon to apply changes and verify if NTP has open sockets in your system network table using [netstat command][15]combined with [grep filter][16].

```
$ sudo chown root:ntp /var/lib/samba/ntp_signd/
$ sudo chmod 750 /var/lib/samba/ntp_signd/
$ sudo systemctl restart ntp
$ sudo netstat –tulpn | grep ntp
```
[
 ![Grant Permission to NTP](http://www.tecmint.com/wp-content/uploads/2016/12/Grant-Permission-to-NTP.png) 
][17]

Grant Permission to NTP

Use the ntpq command line utility to monitor NTP daemon along with the `-p` flag in order to print a summary of peers state.

```
$ ntpq -p
```
[
 ![Monitor NTP Server Pool](http://www.tecmint.com/wp-content/uploads/2016/12/Monitor-NTP-Server-Pool.png) 
][18]

Monitor NTP Server Pool

### Step 2: Troubleshoot NTP Time Issues

6. Sometimes the NTP daemon gets stuck in calculations while trying to synchronize time with an upstream ntp server peer, resulting the following error messages when manually trying to force time synchronization by running ntpdate utility on a client side:

```
# ntpdate -qu adc1
ntpdate[4472]: no server suitable for synchronization found
```
[
 ![NTP Time Synchronization Error](http://www.tecmint.com/wp-content/uploads/2016/12/NTP-Time-Synchronization-Error.png) 
][19]

NTP Time Synchronization Error

when using ntpdate command with `-d` flag.

```
# ntpdate -d adc1.tecmint.lan
Server dropped: Leap not in sync
```
[
 ![NTP Server Dropped Leap Not in Sync](http://www.tecmint.com/wp-content/uploads/2016/12/NTP-Server-Dropped-Leap-Not-Sync.png) 
][20]

NTP Server Dropped Leap Not in Sync

7. To circumvent this issue, use the following trick to solve the problem: On the server, stop the NTP service and use the ntpdate client utility to manually force time synchronization with an external peer using the `-b` flag as shown below:

```
# systemctl stop ntp.service
# ntpdate -b 2.ro.pool.ntp.org  [your_ntp_peer]
# systemctl start ntp.service
# systemctl status ntp.service
```
[
 ![Force NTP Time Synchronization](http://www.tecmint.com/wp-content/uploads/2016/12/Force-NTP-Time-Synchronization.png) 
][21]

Force NTP Time Synchronization

8. After the time has been accurately synchronized, start the NTP daemon on the server and verify from the client side if the service is ready to serve time for local clients by issuing the following command:

```
# ntpdate -du adc1.tecmint.lan    [your_adc_server]
```
[
 ![Verify NTP Time Synchronization](http://www.tecmint.com/wp-content/uploads/2016/12/Verify-NTP-Time-Synchronization.png) 
][22]

Verify NTP Time Synchronization

By now, NTP server should work as expected.

### Step 3: Join Windows 10 into Realm

9. As we saw in our previous tutorial, [Samba4 Active Directory can be managed from command line using samba-tool][23] utility interface which can be accessed directly from server’s VTY console or remotely connected through SSH.

Other, more intuitively and flexible alternative, would be to manage our Samba4 AD Domain Controller via Microsoft Remote Server Administration Tools (RSAT) from a Windows workstation integrated into the domain. These tools are available in almost all modern Windows systems.

The process of joining Windows 10 or older versions of Microsoft OS into Samba4 AD DC is very simple. First, make sure that your Windows 10 workstation has the correct Samba4 DNS IP address configured in order to query the proper realm resolver.

Open Control panel -> Network and Internet -> Network and Sharing Center -> Ethernet card -> Properties -> IPv4 -> Properties -> Use the following DNS server addresses and manually place Samba4 AD IP Address to the network interface as illustrated in the below screenshots.

[
 ![join Windows to Samba4 AD](http://www.tecmint.com/wp-content/uploads/2016/12/Join-Windows-to-Samba4-AD.png) 
][24]

join Windows to Samba4 AD

[
 ![Add DNS and Samba4 AD IP Address](http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-and-Samba4-AD-IP-Address.png) 
][25]

Add DNS and Samba4 AD IP Address

Here, 192.168.1.254 is the IP Address of Samba4 AD Domain Controller responsible for DNS resolution. Replace the IP Address accordingly.

10. Next, apply the network settings by hitting on OK button, open a Command Prompt and issue a pingagainst the generic domain name and Samba4 host FQDN in order to test if the realm is reachable through DNS resolution.

```
ping tecmint.lan
ping adc1.tecmint.lan
```
[
 ![Check Network Connectivity Between Windows and Samba4 AD](http://www.tecmint.com/wp-content/uploads/2016/12/Check-Samba4-AD-from-Windows.png) 
][26]

Check Network Connectivity Between Windows and Samba4 AD

11. If the resolver correctly responds to Windows client DNS queries, then, you need to assure that the time is accurately synchronized with the realm.

Open Control Panel -> Clock, Language and Region -> Set Time and Date -> Internet Time tab -> Change Settings and write your domain name on Synchronize with and Internet time server field.

Hit on Update Now button to force time synchronization with the realm and hit OK to close the window.

[
 ![Synchronize Time with Internet Server](http://www.tecmint.com/wp-content/uploads/2016/12/Synchronize-Time-with-Internet-Server.png) 
][27]

Synchronize Time with Internet Server

12. Finally, join the domain by opening System Properties -> Change -> Member of Domain, write your domain name, hit OK, enter your domain administrative account credentials and hit OK again.

A new pop-up window should open informing you’re a member of the domain. Hit OK to close the pop-up window and reboot the machine in order to apply domain changes.

The below screenshot will illustrate these steps.

[
 ![Join Windows Domain to Samba4 AD](http://www.tecmint.com/wp-content/uploads/2016/12/Join-Windows-Domain-to-Samba4-AD.png) 
][28]

Join Windows Domain to Samba4 AD

[
 ![Enter Domain Administration Login](http://www.tecmint.com/wp-content/uploads/2016/12/Enter-Domain-Administration-Login.png) 
][29]

Enter Domain Administration Login

[
 ![Domain Joined to Samba4 AD Confirmation](http://www.tecmint.com/wp-content/uploads/2016/12/Domain-Joined-to-Samba4-AD.png) 
][30]

Domain Joined to Samba4 AD Confirmation

[
 ![Restart Windows Server for Changes](http://www.tecmint.com/wp-content/uploads/2016/12/Restart-Windows-Server-for-Changes.png) 
][31]

Restart Windows Server for Changes

13. After restart, hit on Other user and logon to Windows with a Samba4 domain account with administrative privileges and you should be ready to move to the next step.

[
 ![Login to Windows Using Samba4 AD Account](http://www.tecmint.com/wp-content/uploads/2016/12/Login-to-Windows-Using-Samba4-AD-Account.png) 
][32]

Login to Windows Using Samba4 AD Account

#### Step 4: Administer Samba4 AD DC with RSAT

14. Microsoft Remote Server Administration Tools (RSAT), which will be further used to administer Samba4 Active Directory, can be downloaded from the following links, depending on your Windows version:

1.  Windows 10: [https://www.microsoft.com/en-us/download/details.aspx?id=45520][4]
2.  Windows 8.1: [http://www.microsoft.com/en-us/download/details.aspx?id=39296][5]
3.  Windows 8: [http://www.microsoft.com/en-us/download/details.aspx?id=28972][6]
4.  Windows 7: [http://www.microsoft.com/en-us/download/details.aspx?id=7887][7]

Once the update standalone installer package for Windows 10 has been downloaded on your system, run the installer, wait for the installation to finish and restart the machine to apply all updates.

After reboot, open Control Panel -> Programs (Uninstall a Program) -> Turn Windows features on or offand check all Remote Server Administration Tools.

Click OK to start the installation and after the installation process finishes, restart the system.

[
 ![Administer Samba4 AD from Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Administer-Samba4-AD-from-Windows.png) 
][33]

Administer Samba4 AD from Windows

15. To access RSAT tools go to Control Panel -> System and Security -> Administrative Tools.

The tools can also be found in the Administrative tools menu from start menu. Alternatively, you can open Windows MMC and add Snap-ins using the File -> Add/Remove Snap-in menu.

[
 ![Access Remote Server Administration Tools](http://www.tecmint.com/wp-content/uploads/2016/12/Access-Remote-Server-Administration-Tools.png) 
][34]

Access Remote Server Administration Tools

The most used tools, such as AD UC, DNS and Group Policy Management can be launched directly from Desktop by creating shortcuts using Send to feature from menu.

16. You can verify RSAT functionality by opening AD UC and list domain Computers (newly joined windows machine should appear in the list), create a new Organizational Unit or a new user or group.

Verify if the users or groups had been properly created by issuing wbinfo command from Samba4 server side.

[
 ![Active Directory Users and Computers](http://www.tecmint.com/wp-content/uploads/2016/12/Active-Directory-Users-and-Computers.png) 
][35]

Active Directory Users and Computers

[
 ![Create Organizational Units and New Users](http://www.tecmint.com/wp-content/uploads/2016/12/Create-Organizational-Unit-and-Users.png) 
][36]

Create Organizational Units and New Users

[
 ![Confirm Samba4 AD Users](http://www.tecmint.com/wp-content/uploads/2016/12/Confirm-Samba4-AD-Users.png) 
][37]

Confirm Samba4 AD Users

That’s it! On the next part of this topic we will cover other important aspects of a Samba4 Active Directory which can be administered via RSAT, such as, how to manage DNS server, add DNS records and create a reverse DNS lookup zone, how to manage and apply domain policy and how to create an interactive logon banner for your domain users.

------

作者简介：I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/

作者：[Matei Cezar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[3]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/
[4]:https://www.microsoft.com/en-us/download/details.aspx?id=45520
[5]:http://www.microsoft.com/en-us/download/details.aspx?id=39296
[6]:http://www.microsoft.com/en-us/download/details.aspx?id=28972
[7]:http://www.microsoft.com/en-us/download/details.aspx?id=7887
[8]:http://www.tecmint.com/category/samba4-active-directory/
[9]:http://www.tecmint.com/how-to-synchronize-time-with-ntp-server-in-ubuntu-linux-mint-xubuntu-debian/
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Install-NTP-on-Ubuntu.png
[11]:http://www.pool.ntp.org/en/
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Configure-NTP-Server-in-Ubuntu.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/12/Sync-AD-with-NTP.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Query-Client-to-NTP-Server.png
[15]:http://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[16]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[17]:http://www.tecmint.com/wp-content/uploads/2016/12/Grant-Permission-to-NTP.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/12/Monitor-NTP-Server-Pool.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/12/NTP-Time-Synchronization-Error.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/12/NTP-Server-Dropped-Leap-Not-Sync.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/12/Force-NTP-Time-Synchronization.png
[22]:http://www.tecmint.com/wp-content/uploads/2016/12/Verify-NTP-Time-Synchronization.png
[23]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[24]:http://www.tecmint.com/wp-content/uploads/2016/12/Join-Windows-to-Samba4-AD.png
[25]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-and-Samba4-AD-IP-Address.png
[26]:http://www.tecmint.com/wp-content/uploads/2016/12/Check-Samba4-AD-from-Windows.png
[27]:http://www.tecmint.com/wp-content/uploads/2016/12/Synchronize-Time-with-Internet-Server.png
[28]:http://www.tecmint.com/wp-content/uploads/2016/12/Join-Windows-Domain-to-Samba4-AD.png
[29]:http://www.tecmint.com/wp-content/uploads/2016/12/Enter-Domain-Administration-Login.png
[30]:http://www.tecmint.com/wp-content/uploads/2016/12/Domain-Joined-to-Samba4-AD.png
[31]:http://www.tecmint.com/wp-content/uploads/2016/12/Restart-Windows-Server-for-Changes.png
[32]:http://www.tecmint.com/wp-content/uploads/2016/12/Login-to-Windows-Using-Samba4-AD-Account.png
[33]:http://www.tecmint.com/wp-content/uploads/2016/12/Administer-Samba4-AD-from-Windows.png
[34]:http://www.tecmint.com/wp-content/uploads/2016/12/Access-Remote-Server-Administration-Tools.png
[35]:http://www.tecmint.com/wp-content/uploads/2016/12/Active-Directory-Users-and-Computers.png
[36]:http://www.tecmint.com/wp-content/uploads/2016/12/Create-Organizational-Unit-and-Users.png
[37]:http://www.tecmint.com/wp-content/uploads/2016/12/Confirm-Samba4-AD-Users.png
[38]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/#
[39]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/#
[40]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/#
[41]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/#
[42]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/#comments
