wyangsun translating
Two Outstanding All-in-One Linux Servers
================================================

keywords: Linux Server , SMB , clearos , Zentyal

![](http://www.linux.com/images/stories/66866/jack-clear_a.png)

>Figure 1: The ClearOS setup wizard.

Back in 2000, Microsoft released their Small Business Server. This product changed the way many people viewed how technology could function within the realm of business. Instead of having multiple machines handle different tasks, you could deploy a single server which would handle email, calendaring, file sharing, directory services, VPN, and a whole lot more. For many of small businesses, this was a serious boon, but for some the cost of the Windows SMB was prohibitive. For yet others, the idea of relying on such a server, designed by Microsoft, simply wasn’t an option.

For that last group, there are alternatives. In fact, within the realm of Linux and open source, you can choose from several solid platforms that can serve your small business as a one-stop server shop. If your small business has between 10 and 50 employees, the all-in-one server might be the ideal solution to meet your needs.

Here, I’ll look at two Linux all-in-one servers, so you can see if one of them is the perfect match for your company.

Remember, these servers are not, in any way, suited for big business or enterprise. Larger companies cannot rely on the all-in-one server simply because a single server cannot take the load expected within the realm of enterprise needs. With that said, here’s what SMBs can expect from a Linux all in one.

### ClearOS

[ClearOS][1] was originally released in 2009, under the name ClarkConnect, as a router and gateway distribution. Since then, ClearOS has added all the features necessary to define it as an all-in-one server. ClearOS offers more than just a piece of software. You can also purchase a [ClearBox 100][2] or [ClearBox 300][3]. These servers ship complete with ClearOS and are marketed as IT in a box. Check out the feature comparison/price matrix [here][4].

For those with hardware already in-house, you can download one of the following:

- [ClearOS Community][5] — The community (free) edition of ClearOS

- [ClearOS Home][6] — Ideal for home offices (details on features and subscription costs, see here)

- [ClearOS Business][7] — Ideal for small businesses (details on features and subscription costs, see here)

What do you get with ClearOS? You get a business-class server with a single, elegantly designed web interface. What is unique about ClearOS is that you will get plenty of features in the base server; beyond that, you must add on features from the [Clear Marketplace][8]. From within the Marketplace, you can install free or paid apps that extend the feature set of the ClearOS server. Here you’ll find add-ons for Windows Server Active Directory, OpenLDAP, Flexshares, Antimalware, Cloud, Web access control, Content filtering, and much more. You’ll even find some third-party add-ons such as Google Apps Synchronization, Zarafa Collaboration Platform, and Kaspersky Anti-virus.

ClearOS is installed like any other Linux distribution (based on Red Hat’s Anaconda installer). Once the install is complete, you will be prompted to set up the networking interface as well as presented with the address to point your browser (on the same network as the ClearOS server). The address will be in the form:

[https://IP_OF_CLEAROS_SERVER:81][9]

Where IP_OF_CLEAROS_SERVER is the actual IP address of the server. NOTE: When you first point your browser to the server, you will receive a “Connection is not private” warning. Proceed on to the address so you can continue the setup.

When the browser finally connects, you will be prompted for the root user credentials (you set the root user password up during initial installation). Once authenticated, you will be presented with the ClearOS setup wizard (Figure 1 above).

Click the Next button to begin the process of setting up your ClearOS server. The wizard is self-explanatory and, in the end, you will be asked which version of ClearOS you want to use. Click either Community, Home, or Business. Once selected, you will be required to register for an account. Once you’ve created an account and registered the server, you can then move on to updating the server, configuring the server, and adding modules from the marketplace (Figure 2).

![](http://www.linux.com/images/stories/66866/jack-clear_b.png)

>Figure 2: Installing modules from the marketplace.

At this point, you are ready to start digging deep into the configuration of your ClearOS small business server.

### Zentyal

[Zentyal][10] is a Ubuntu-based small business server that was, at one point, distributed under the name eBox. Zentyal offers plenty of servers/services to fit your SMB needs:

- Email — Webmail; Native MS Exchange protocols and Active Directory support; Calendars and contacts; Mobile device email sync; Antivirus/antispam; IMAP, POP, SMTP, CalDAV, and CardDAV support

- Domain & Directory — Central domain directory management; Multiple organization units; Single sign-on authentication; File sharing; ACLs, Advanced domain management, Printer management

- Networking & Firewall — Static and DHCP interfaces; Objects & services; Packet filter; Port forwarding

- Infrastructure — DNS; DHCP; NTP; Certification authority; VPN

- Firewall

The installation of Zentyal is very much like that of Ubuntu Server—it’s text based and quite simple: Boot up the install media, make a few quick selections, and wait for the installation to complete. Once the initial, text-based, installation is finished, you are presented with the GUI desktop where a wizard will appear for package selection. Select all the packages you want to install and allow the installer to finish the job.

Finally, you can log into your Zentyal server via the web interface (point your browser to [https://IP_OF_SERVER:8443][11] — where IP_OF_SERVER is the LAN address of the Zentyal server) or use the standalone, desktop GUI to administer the server (Zentyal includes quick access to an Administrator and User console as well as a Zentyal Administration console). When all systems have been saved and started, you will be presented with the Zentyal Dashboard (Figure 3).

![](http://www.linux.com/images/stories/66866/jack-zentyal_a.png)

>Figure 3: The Zentyal Dashboard in action.

The Dashboard allows you to control all aspects of the server, such as updating, managing servers/services, and getting a quick status update of the server. You can also go into the Components area and install components that you opted out of during installation or update the current package list. Click on Software Management > System Updates and select what you want to update (Figure 4), then click the UPDATE button at the bottom of the screen.

![](http://www.linux.com/images/stories/66866/jack-zentyal_b.png)

>Figure 4: Updating your Zentyal server is simple.

### Which Server Is Right for You?

The answer to this question depends on what you need. Zentyal is an amazing server that does a great job running your SMB network. If you need a bit more, such as groupware, your best bet is to go with ClearOS. If you don’t need groupware, either server will do an outstanding job.

I highly recommend installing both of these all-in-one servers to see which will best serve your small company needs.


------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/882146-two-outstanding-all-in-one-linux-servers

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linux.com/community/forums/person/93
[1]: http://www.linux.com/learn/tutorials/882146-two-outstanding-all-in-one-linux-servers#clearfoundation-overview
[2]: https://www.clearos.com/products/hardware/clearbox-100-series
[3]: https://www.clearos.com/products/hardware/clearbox-300-series
[4]: https://www.clearos.com/products/hardware/clearbox-overview
[5]: http://mirror.clearos.com/clearos/7/iso/x86_64/ClearOS-DVD-x86_64.iso
[6]: http://mirror.clearos.com/clearos/7/iso/x86_64/ClearOS-DVD-x86_64.iso
[7]: http://mirror.clearos.com/clearos/7/iso/x86_64/ClearOS-DVD-x86_64.iso
[8]: https://www.clearos.com/products/purchase/clearos-marketplace-overview
[9]: https://ip_of_clearos_server:81/
[10]: http://www.zentyal.org/server/
[11]: https://ip_of_server:8443/
