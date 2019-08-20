[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cockpit and the evolution of the Web User Interface)
[#]: via: (https://fedoramagazine.org/cockpit-and-the-evolution-of-the-web-user-interface/)
[#]: author: (Shaun Assam https://fedoramagazine.org/author/sassam/)

Cockpit and the evolution of the Web User Interface
======

![][1]

Over 3 years ago the Fedora Magazine published an article entitled [Cockpit: an overview][2]. Since then, the interface has see some eye-catching changes. Today’s Cockpit is cleaner and the larger fonts makes better use of screen real-estate.

This article will go over some of the changes made to the UI. It will also explore some of the general tools available in the web interface to simplify those monotonous sysadmin tasks.

### Cockpit installation

Cockpit can be installed using the **dnf install cockpit** command. This provides a minimal setup providing the basic tools required to use the interface.

Another option is to install the Headless Management group. This will install additional packages used to extend the usability of Cockpit. It includes extensions for NetworkManager, software packages, disk, and SELinux management.

Run the following commands to enable the web service on boot and open the firewall port:

```
$ sudo systemctl enable --now cockpit.socket
Created symlink /etc/systemd/system/sockets.target.wants/cockpit.socket -> /usr/lib/systemd/system/cockpit.socket

$ sudo firewall-cmd --permanent --add-service cockpit
success
$ sudo firewall-cmd --reload
success
```

### Logging into the web interface

To access the web interface, open your favourite browser and enter the server’s domain name or IP in the address bar followed by the service port (9090). Because Cockpit uses HTTPS, the installation will create a self-signed certificate to encrypt passwords and other sensitive data. You can safely accept this certificate, or request a CA certificate from your sysadmin or a trusted source.

Once the certificate is accepted, the new and improved login screen will appear. Long-time users will notice the username and password fields have been moved to the top. In addition, the white background behind the credential fields immediately grabs the user’s attention.

![][3]

A feature added to the login screen since the previous article is logging in with **sudo** privileges — if your account is a member of the wheel group. Check the box beside _Reuse my password for privileged tasks_ to elevate your rights.

Another edition to the login screen is the option to connect to remote servers also running the Cockpit web service. Click _Other Options_ and enter the host name or IP address of the remote machine to manage it from your local browser.

### Home view

Right off the bat we get a basic overview of common system information. This includes the make and model of the machine, the operating system, if the system is up-to-date, and more.

![][4]

Clicking the make/model of the system displays hardware information such as the BIOS/Firmware. It also includes details about the components as seen with **lspci**.

![][5]

Clicking on any of the options to the right will display the details of that device. For example, the _% of CPU cores_ option reveals details on how much is used by the user and the kernel. In addition, the _Memory &amp; Swap_ graph displays how much of the system’s memory is used, how much is cached, and how much of the swap partition active. The _Disk I/O_ and _Network Traffic_ graphs are linked to the Storage and Networking sections of Cockpit. These topics will be revisited in an upcoming article that explores the system tools in detail.

#### Secure Shell Keys and authentication

Because security is a key factor for sysadmins, Cockpit now has the option to view the machine’s MD5 and SHA256 key fingerprints. Clicking the **Show fingerprints** options reveals the server’s ECDSA, ED25519, and RSA fingerprint keys.

![][6]

You can also add your own keys by clicking on your username in the top-right corner and selecting **Authentication**. Click on **Add keys** to validate the machine on other systems. You can also revoke your privileges in the Cockpit web service by clicking on the **X** button to the right.

![][7]

#### Changing the host name and joining a domain

Changing the host name is a one-click solution from the home page. Click the host name currently displayed, and enter the new name in the _Change Host Name_ box. One of the latest features is the option to provide a _Pretty name_.

Another feature added to Cockpit is the ability to connect to a directory server. Click _Join a domain_ and a pop-up will appear requesting the domain address or name, organization unit (optional), and the domain admin’s credentials. The Domain Membership group provides all the packages required to join an LDAP server including FreeIPA, and the popular Active Directory.

To opt-out, click on the domain name followed by _Leave Domain_. A warning will appear explaining the changes that will occur once the system is no longer on the domain. To confirm click the red _Leave Domain_ button.

![][8]

#### Configuring NTP and system date and time

Using the command-line and editing config files definitely takes the cake when it comes to maximum tweaking. However, there are times when something more straightforward would suffice. With Cockpit, you have the option to set the system’s date and time manually or automatically using NTP. Once synchronized, the information icon on the right turns from red to blue. The icon will disappear if you manually set the date and time.

To change the timezone, type the continent and a list of cities will populate beneath.

![][9]

#### Shutting down and restarting

You can easily shutdown and restart the server right from home screen in Cockpit. You can also delay the shutdown/reboot and send a message to warn users.

![][10]

#### Configuring the performance profile

If the _tuned_ and _tuned-utils_ packages are installed, performance profiles can be changed from the main screen. By default it is set to a recommended profile. However, if the purpose of the server requires more performance, we can change the profile from Cockpit to suit those needs.

![][11]

### Terminal web console

A Linux sysadmin’s toolbox would be useless without access to a terminal. This allows admins to fine-tune the server beyond what’s available in Cockpit. With the addition of themes, admins can quickly adjust the text and background colours to suit their preference.

Also, if you type **exit** by mistake, click the _Reset_ button in the top-right corner*.* This will provide a fresh screen with a flashing cursor.

![][12]

### Adding a remote server and the Dashboard overlay

The Headless Management group includes the Dashboard module (**cockpit-dashboard**). This provides an overview the of the CPU, memory, network, and disk performance in a real-time graph. Remote servers can also be added and managed through the same interface.

For example, to add a remote computer in Dashboard, click the **+** button. Enter the name or IP address of the server and select the colour of your choice. This helps to differentiate the stats of the servers in the graph. To switch between servers, click on the host name (as seen in the screen-cast below). To remove a server from the list, click the check-mark icon, then click the red trash icon. The example below demonstrates how Cockpit manages a remote machine named _server02.local.lan_.

![][13]

### Documentation and finding help

As always, the _man_ pages are a great place to find documentation. A simple search in the command-line results with pages pertaining to different aspects of using and configuring the web service.

```
$ man -k cockpit
cockpit (1)          - Cockpit
cockpit-bridge (1)   - Cockpit Host Bridge
cockpit-desktop (1)  - Cockpit Desktop integration
cockpit-ws (8)       - Cockpit web service
cockpit.conf (5)     - Cockpit configuration file
```

The Fedora repository also has a package called **cockpit-doc**. The package’s description explains it best:

> The Cockpit Deployment and Developer Guide shows sysadmins how to deploy Cockpit on their machines as well as helps developers who want to embed or extend Cockpit.

For more documentation visit <https://cockpit-project.org/external/source/HACKING>

### Conclusion

This article only touches upon some of the main functions available in Cockpit. Managing storage devices, networking, user account, and software control will be covered in an upcoming article. In addition, optional extensions such as the 389 directory service, and the _cockpit-ostree_ module used to handle packages in Fedora Silverblue.

The options continue to grow as more users adopt Cockpit. The interface is ideal for admins who want a light-weight interface to control their server(s).

What do you think about Cockpit? Share your experience and ideas in the comments below.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/cockpit-and-the-evolution-of-the-web-user-interface/

作者：[Shaun Assam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sassam/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-816x345.jpg
[2]: https://fedoramagazine.org/cockpit-overview/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-login-screen.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-home-screen.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-system-info.gif
[6]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-ssh-key-fingerprints.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-authentication.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-hostname-domain.gif
[9]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-date-time.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-power-options.gif
[11]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-tuned.gif
[12]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-terminal.gif
[13]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-add-remote-servers.gif
