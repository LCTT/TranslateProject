Rusking translating

Manage Samba4 AD Domain Controller DNS and Group Policy from Windows – Part 4
============================================================

Continuing the previous tutorial on [how to administer Samba4 from Windows 10 via RSAT][4], in this part we’ll see how to remotely manage our Samba AD Domain controller DNS server from Microsoft DNS Manager, how to create DNS records, how to create a Reverse Lookup Zone and how to create a domain policy via Group Policy Management tool.

#### Requirements

1.  [Create an AD Infrastructure with Samba4 on Ubuntu 16.04 – Part 1][1]
2.  [Manage Samba4 AD Infrastructure from Linux Command Line – Part 2][2]
3.  [Manage Samba4 Active Directory Infrastructure from Windows10 via RSAT – Part 3][3]

### Step 1: Manage Samba DNS Server

Samba4 AD DC uses an internal DNS resolver module which is created during the initial domain provision (if BIND9 DLZ module is not specifically used).

Samba4 internal DNS module supports the basic features needed for an AD Domain Controller. The domain DNS server can be managed in two ways, directly from command line through samba-tool interface or remotely from a Microsoft workstation which is part of the domain via RSAT DNS Manager.

Here, we’ll cover the second method because it’s more intuitive and not so prone to errors.

1. To administer the DNS service for your domain controller via RSAT, go to your Windows machine, open Control Panel -> System and Security -> Administrative Tools and run DNS Manager utility.

Once the tool opens, it will ask you on what DNS running server you want to connect. Choose The following computer, type your domain name in the field (or IP Address or FQDN can be used as well), check the box that says ‘Connect to the specified computer now’ and hit OK to open your Samba DNSservice.

[
 ![Connect Samba4 DNS on Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Connect-Samba4-DNS-on-Windows.png) 
][5]

Connect Samba4 DNS on Windows

2. In order to add a DNS record (as an example we will add an `A` record that will point to our LAN gateway), navigate to domain Forward Lookup Zone, right click on the right plane and choose New Host(`A` or `AAA`).

[
 ![Add DNS A Record on Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-A-Record.png) 
][6]

Add DNS A Record on Windows

3. On the New host opened window, type the name and the IP Address of your DNS resource. The FQDNwill be automatically written for you by DNS utility. When finished, hit the Add Host button and a pop-up window will inform you that your DNS A record has been successfully created.

Make sure you add DNS A records only for those resources in your network [configured with static IP Addresses][7]. Don’t add DNS A records for hosts which are configured to acquire network configurations from a DHCP server or their IP Addresses change often.

[
 ![Configure Samba Host on Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Host-on-Windows.png) 
][8]

Configure Samba Host on Windows

To update a DNS record just double click on it and write your modifications. To delete the record right click on the record and choose delete from the menu.

In the same way you can add other types of DNS records for your domain, such as CNAME (also known as DNS alias record) MX records (very useful for mail servers) or other type of records (SPF, TXT, SRVetc).

### Step 2: Create a Reverse Lookup Zone

By default, Samba4 Ad DC doesn’t automatically add a reverse lookup zone and PTR records for your domain because these types of records are not crucial for a domain controller to function correctly.

Instead, a DNS reverse zone and its PTR records are crucial for the functionality of some important network services, such as an e-mail service because these type of records can be used to verify the identity of clients requesting a service.

Practically, PTR records are just the opposite of standard DNS records. The clients know the IP address of a resource and queries the DNS server to find out their registered DNS name.

4. In order to a create a reverse lookup zone for Samba AD DC, open DNS Manager, right click on Reverse Lookup Zone from the left plane and choose New Zone from the menu.

[
 ![Create Reverse Lookup DNS Zone](http://www.tecmint.com/wp-content/uploads/2016/12/Create-Reverse-Lookup-DNS-Zone.png) 
][9]

Create Reverse Lookup DNS Zone

5. Next, hit Next button and choose Primary zone from Zone Type Wizard.

[
 ![Select DNS Zone Type](http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-Zone-Type.png) 
][10]

Select DNS Zone Type

6. Next, choose To all DNS servers running on domain controllers in this domain from the AD Zone Replication Scope, chose IPv4 Reverse Lookup Zone and hit Next to continue.

[
 ![Select DNS for Samba Domain Controller](http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-for-Samba-Domain-Controller.png) 
][11]

Select DNS for Samba Domain Controller

[
 ![Add Reverse Lookup Zone Name](http://www.tecmint.com/wp-content/uploads/2016/12/Add-Reverse-Lookup-Zone-Name.png) 
][12]

Add Reverse Lookup Zone Name

7. Next, type the IP network address for your LAN in Network ID filed and hit Next to continue.

All PTR records added in this zone for your resources will point back only to 192.168.1.0/24 network portion. If you want to create a PTR record for a server that does not reside in this network segment (for example mail server which is located in 10.0.0.0/24 network), then you’ll need to create a new reverse lookup zone for that network segment as well.

[
 ![Add IP Address of Reverse Lookup DNS Zone](http://www.tecmint.com/wp-content/uploads/2016/12/Add-IP-Address-of-Reverse-DNS-Zone.png) 
][13]

Add IP Address of Reverse Lookup DNS Zone

8. On the next screen choose to Allow only secure dynamic updates, hit next to continue and, finally hit on finish to complete zone creation.

[
 ![Enable Secure Dynamic Updates](http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Secure-Dynamic-Updates.png) 
][14]

Enable Secure Dynamic Updates

[
 ![New DNS Zone Summary](http://www.tecmint.com/wp-content/uploads/2016/12/New-DNS-Zone-Summary.png) 
][15]

New DNS Zone Summary

9. At this point you have a valid DNS reverse lookup zone configured for your domain. In order to add a PTR record in this zone, right click on the right plane and choose to create a PTR record for a network resource.

In this case we’ve created a pointer for our gateway. In order to test if the record was properly added and works as expected from client’s point of view, open a Command Prompt and issue a nslookup query against the name of the resource and another query for its IP Address.

Both queries should return the correct answer for your DNS resource.

```
nslookup gate.tecmint.lan
nslookup 192.168.1.1
ping gate
```
[
 ![Add DNS PTR Record and Query PTR](http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-PTR-Record-and-Query.png) 
][16]

Add DNS PTR Record and Query PTR

### Step 3: Domain Group Policy Management

10. An important aspect of a domain controller is its ability to control system resources and security from a single central point. This type of task can be easily achieved in a domain controller with the help of Domain Group Policy.

Unfortunately, the only way to edit or manage group policy in a samba domain controller is through RSAT GPM console provided by Microsoft.

In the below example we’ll see how simple can be to manipulate group policy for our samba domain in order to create an interactive logon banner for our domain users.

In order to access group policy console, go to Control Panel -> System and Security -> Administrative Tools and open Group Policy Management console.

Expand the fields for your domain and right click on Default Domain Policy. Choose Edit from the menu and a new windows should appear.

[
 ![Manage Samba Domain Group Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Manage-Samba-Domain-Group-Policy.png) 
][17]

Manage Samba Domain Group Policy

11. On Group Policy Management Editor window go to Computer Configuration -> Policies -> Windows Settings -> Security settings -> Local Policies -> Security Options and a new options list should appear in the right plane.

In the right plane search and edit with your custom settings following two entries presented on the below screenshot.

[
 ![Configure Samba Domain Group Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Domain-Group-Policy.png) 
][18]

Configure Samba Domain Group Policy

12. After finishing editing the two entries, close all windows, open an elevated Command prompt and force group policy to apply on your machine by issuing the below command:

```
gpupdate /force
```
[
 ![Update Samba Domain Group Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Update-Samba-Domain-Group-Policy.png) 
][19]

Update Samba Domain Group Policy

13. Finally, reboot your computer and you’ll see the logon banner in action when you’ll try to perform logon.

[
 ![Samba4 AD Domain Controller Logon Banner](http://www.tecmint.com/wp-content/uploads/2016/12/Samba4-Domain-Controller-User-Login.png) 
][20]

Samba4 AD Domain Controller Logon Banner

That’s all! Group Policy is a very complex and sensitive subject and should be treated with maximum care by system admins. Also, be aware that group policy settings won’t apply in any way to Linux systems integrated into the realm.

------

作者简介：I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/

作者：[Matei Cezar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[3]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[4]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Connect-Samba4-DNS-on-Windows.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-A-Record.png
[7]:http://www.tecmint.com/set-add-static-ip-address-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Host-on-Windows.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Create-Reverse-Lookup-DNS-Zone.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-Zone-Type.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-for-Samba-Domain-Controller.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-Reverse-Lookup-Zone-Name.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-IP-Address-of-Reverse-DNS-Zone.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Secure-Dynamic-Updates.png
[15]:http://www.tecmint.com/wp-content/uploads/2016/12/New-DNS-Zone-Summary.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-PTR-Record-and-Query.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/12/Manage-Samba-Domain-Group-Policy.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Domain-Group-Policy.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/12/Update-Samba-Domain-Group-Policy.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/12/Samba4-Domain-Controller-User-Login.png
[21]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[22]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[23]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[24]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[25]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#comments
