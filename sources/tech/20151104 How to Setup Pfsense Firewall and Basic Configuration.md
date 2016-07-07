lujianbo

How to Setup Pfsense Firewall and Basic Configuration
================================================================================
In this article our focus is Pfsense setup, basic configuration and overview of features available in the security distribution of FreeBSD. In this tutorial we will run network wizard for basic setting of firewall and detailed overview of services. After the [installation process][1] following snapshot shows the IP addresses of WAN/LAN and different options for the management of Pfsense firewall.

![options](http://blog.linoxide.com/wp-content/uploads/2015/08/options.png)

After setup , following window appear which shows the url for configuration of Pfsense.

![URL for gui](http://blog.linoxide.com/wp-content/uploads/2015/08/login_pfsense.png)

Open above given URL in the browser and login with username **admin** and password **pfsense**

![login_username_password](http://blog.linoxide.com/wp-content/uploads/2015/08/login_username_password.png)

After successful login, following wizard appears for the basic setting of Pfsense firewall.  However setup wizard option can be bypassed and user can run it from the **System** menu from the web interface.

Click on the **Next** button to start basic configuration process on Pfsense firewall.

![wizard_start](http://blog.linoxide.com/wp-content/uploads/2015/08/wizard_start.png)

Setting hostname, domain and DNS addresses is shown in the following figure.

![basic_setting_wizard](http://blog.linoxide.com/wp-content/uploads/2015/08/basic_setting_wizard.png)

Setting time zone is shown in the below given snapshot.

![time_setting](http://blog.linoxide.com/wp-content/uploads/2015/08/time_setting.png)

Next window shows setting for the WAN interface. By defaults Pfsense firewall block bogus and private networks.

![wan setting](http://blog.linoxide.com/wp-content/uploads/2015/08/wan-setting.png)

Setting LAN IP address which is used to access the Pfsense web interface for further configuration.

![lan setting](http://blog.linoxide.com/wp-content/uploads/2015/08/lan-setting.png)

By default password for web interface is "pfsense". Enter new password for admin user  on the following window to access the web interface for further configuration.

![password](http://blog.linoxide.com/wp-content/uploads/2015/08/password.png)

Click on the "reload" button which is shown below. It applies the setting and redirect firewall user to main dashboard of Pfsense.

![)reload](http://blog.linoxide.com/wp-content/uploads/2015/08/reload.png

As shown in the following snapshot, Pfsense dashboard shows system information (such as cpu details, os version, dns detail, memory consumption) and status of ethernet/wireless interfaces etc.

![dashboard](http://blog.linoxide.com/wp-content/uploads/2015/08/dashboard1.png)

### Menu detail ###

PFsense consist of System, interfaces, firewall,services,vpn,status,diagnostics and help menus.

![all menu](http://blog.linoxide.com/wp-content/uploads/2015/10/all-menu.png)

### System Menu ###

Sub menus of **System** is given below.

![system menu](http://blog.linoxide.com/wp-content/uploads/2015/08/system-menu.png)

In the **Advanced** sub menu user can perform following operations.

1. Configuration of web interface
1. Firewall/Nat setting
1. Networking setting
1. System tuneables setting
1. Notification setting

![advanced-systemmenu](http://blog.linoxide.com/wp-content/uploads/2015/10/advanced-systemmenu.png)

In the **Cert manager** sub menu, firewall administrator generates certificates for CA and users.

![cert-manager-systemmenu](http://blog.linoxide.com/wp-content/uploads/2015/10/cert-manager-systemmenu.png)

In the **Firmware** sub menu, user can update Pfsense firmware manually/automatically. User can take full backup of Pfsense configurations.

![firmware-systemmenu](http://blog.linoxide.com/wp-content/uploads/2015/10/firmware-systemmenu.png)

In the **General Setup** sub menu, user can change basic setting such as hostname and domain etc.

![general setup-systemmenu](http://blog.linoxide.com/wp-content/uploads/2015/10/general-setup-systemmenu.png)

As menu title indicates, user can enable/disable high availability feature from this sub menu.

![highavail-systemmenu](http://blog.linoxide.com/wp-content/uploads/2015/10/highavail-systemmenu.png)

Packages sub menu provides package manager facility in the web interface for Pfsense .

![packages-system menu](http://blog.linoxide.com/wp-content/uploads/2015/10/packages-systemmenu.png)

User can perform gateway and route management using **Routing** sub menu.

![routing-system menu](http://blog.linoxide.com/wp-content/uploads/2015/10/routing-systemmenu.png)

**Setup Wizard** sub menu opens following window which start basic configuration of Pfsense.

![wizard_start](http://blog.linoxide.com/wp-content/uploads/2015/10/wizard_start.png)

Management of user can be done from the **User manager** sub menu.

![usermanager-system](http://blog.linoxide.com/wp-content/uploads/2015/10/usermanager-system.png)

### Interfaces Menu ###

This menu is used for the assignment of interfaces (LAN/WAN), VLAN setting,wireless and GRE configuration etc.

![Interfaces setting](http://blog.linoxide.com/wp-content/uploads/2015/10/interfaces-setting.png)

### Firewall Menu ###

Firewall is the main and core part of  Pfsense distribution  and it provides following features.

![firewall-menu](http://blog.linoxide.com/wp-content/uploads/2015/10/firewall-systemmenu.png)

**Aliases**

Aliases are defined for real hosts, networks or ports and they can be used to minimize the number of changes.

![firewall-aliases](http://blog.linoxide.com/wp-content/uploads/2015/10/firewall-aliases.png)

**NAT (Network Address Translation)**

NAT binds a specific internal address to a specific external address. Incoming traffic from the Internet to the specified IP will be directed toward the associated internal IP.

![firewall-nat](http://blog.linoxide.com/wp-content/uploads/2015/10/firewall-nat.png)

**Firewall Rules**

Firewall rules control what traffic is allowed to enter an interface on the firewall. After traffic is passed on the interface, it enters an entry in the state table is created.

![firewall-rules](http://blog.linoxide.com/wp-content/uploads/2015/10/firewall-rules.png)

**Schedules**

Firewall rules can be scheduled so that they are only active at certain times of day or on certain specific days or days of the week.

![firewall-schedules](http://blog.linoxide.com/wp-content/uploads/2015/10/firewall-schedules.png)

**Traffic Shaper**

Traffic shaping is the control of computer network traffic in order to optimize performance and lower latency.

![firewall-traffic shapper](http://blog.linoxide.com/wp-content/uploads/2015/10/firewall-traffic-shapper.png)

**Virtual IPs**

Virtual IPs add knowledge of additional IP addresses to the firewall that are different from the firewall's real interface addresses.

![firewall-virtualipaddresses](http://blog.linoxide.com/wp-content/uploads/2015/10/services-menu.png)

### Services Menu ###

Services menu shows  services which are provided by the Pfsense distribution along firewall.

![services-menu](http://blog.linoxide.com/wp-content/uploads/2015/10/services-menu.png)

New program/software installed for some specific service is also shown in this menu such as snort. By default following services are listed in services menu.

**Captive portal**

The captive portal functionality in Pfsense allows securing a network by requiring a username and password entered on a portal page.

![services-captive portal](http://blog.linoxide.com/wp-content/uploads/2015/10/services-captive-portal.png)

**DHCP Relay**

The DHCP Relay daemon will relay DHCP requests between broadcast domains for IPv4 DHCP.

![services-dhcp relay](http://blog.linoxide.com/wp-content/uploads/2015/10/services-dhcp-relay.png)

**DHCP Server**

User can run DHCP service on the firewall for the network devices.

![services-dhcp server](http://blog.linoxide.com/wp-content/uploads/2015/10/services-dhcp-server.png)

**DNS Forwarder/Resolver/Dynamic DNS**

DNS different services can be configured on the Pfsense firewall.

![services-dynamic dns client](http://blog.linoxide.com/wp-content/uploads/2015/10/services-dynamic-dns-client.png)

![services-dns resolver](http://blog.linoxide.com/wp-content/uploads/2015/10/services-dns-resolver.png)

![services-dns forwarder](http://blog.linoxide.com/wp-content/uploads/2015/10/services-dns-forwarder.png)

**IGMP Proxy**

User can configure IGMP  on the  Pfsense firewall from services menu.

![services igmp](http://blog.linoxide.com/wp-content/uploads/2015/10/services-igmp.png)

**Load Balancer**

Load Balancing is one of the important feature which is also supported by the Pfsense firewall.

![services load balancer](http://blog.linoxide.com/wp-content/uploads/2015/10/services-load-balancer.png)

**SNMP (Simple Network Management Protocol)**

Pfsense supports all versions of snmp for remote management of firewall.

![services snmp](http://blog.linoxide.com/wp-content/uploads/2015/10/services-snmp.png)

**Wake on Lan**

Using this feature packet  sent to a workstation on a locally connected network which will power on a workstation.

![services-wake on lan](http://blog.linoxide.com/wp-content/uploads/2015/10/services-wake-on-lan.png)

### VPN Menu ###

It is one of the most important feature of Pfsense. Its supports following types of vpn configuration.

**VPN IPsec**

IPsec is a standard for providing security to IP protocols via encryption and/or authentication.

![vpn-ipsec](http://blog.linoxide.com/wp-content/uploads/2015/10/vpn-ipsec.png)

**L2TP IPsec**

L2TP/IPsec is a common VPN type that wraps L2TP, an insecure tunneling protocol, inside a secure channel built using transport mode IPsec.

![vpn- l2tp](http://blog.linoxide.com/wp-content/uploads/2015/10/vpn-l2tp.png)

**OpenVPN**

OpenVPN is an Open Source VPN server and client that is supported on pfSense.

![vpn openvpn](http://blog.linoxide.com/wp-content/uploads/2015/10/vpn-openvpn.png)

**Status Menu**

It shows the status of services provided by Pfsense such as dhcp server, ipsec and load balancer etc.

![status-menu](http://blog.linoxide.com/wp-content/uploads/2015/10/status-menu.png)

**Diagnostic Menu**

This menu helps administrator/user for the rectification of  Pfsense issues or problems.

![diagnosics menu](http://blog.linoxide.com/wp-content/uploads/2015/10/diagnosics-menu.png)

**Help Menu**

This menu provides links for different useful resources such as  FreeBSD handbook,developer wiki, paid support and pfsense book.

![help menu](http://blog.linoxide.com/wp-content/uploads/2015/10/help-menu.png)

### Conclusion ###

In this article our focus was on the basic configuration and  features set of Pfsense distribution.  It is based on FreeBSD  distribution and widely used due to security and stability features. In our future articles on Pfsense, our focus will be on the basic firewall rules  setting, snort (IDS/IPS) and IPSEC VPN configuration.

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[nido][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:http://linoxide.com/firewall/install-pfsense-firewall/
