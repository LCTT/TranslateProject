[#]: subject: "Configure your OpenVPN server on Linux"
[#]: via: "https://opensource.com/article/21/7/openvpn-firewall"
[#]: author: "D. Greg Scott https://opensource.com/users/greg-scott"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Configure your OpenVPN server on Linux
======
After you install OpenVPN, it's time to configure it.
![Lock][1]

OpenVPN creates an encrypted tunnel between two points, preventing a third party from accessing your network traffic. By setting up your virtual private network (VPN) server, you become your own VPN provider. Many popular VPN services already use [OpenVPN][2], so why tie your connection to a specific provider when you can have complete control?

The [first article][3] in this series set up a server for your VPN, and the [second article][4] demonstrated how to install and configure the OpenVPN server software. This third article shows how to start OpenVPN with authentication in place.

To set up an OpenVPN server, you must:

  * Create a configuration file.
  * Set the `sysctl` value `net.ipv4.ip_forward = 1` to enable routing.
  * Set up appropriate ownership for all configuration and authentication files to run the OpenVPN server daemon under a non-root account.
  * Set OpenVPN to start with the appropriate configuration file.
  * Configure your firewall.



### Configuration file

You must create a server config file in `/etc/openvpn/server/`. You can start from scratch if you want, and OpenVPN includes several sample configuration files to use as a starting point. Have a look in `/usr/share/doc/openvpn/sample/sample-config-files/` to see them all.

If you want to build a config file by hand, start with either `server.conf` or `roadwarrior-server.conf` (as appropriate), and place your config file in `/etc/openvpn/server`. Both files are extensively commented, so read the comments and decide which makes the most sense for your situation.

You can save time and aggravation by using my prebuilt server and client configuration file templates and `sysctl` file to turn on network routing. This configuration also includes customization to log connects and disconnects. It keeps logs on the OpenVPN server in `/etc/openvpn/server/logs`.

If you use my templates, you'll need to edit them to use your IP addresses and hostnames.

To use my prebuilt config templates, scripts, and `sysctl` to turn on IP forwarding, download my script:


```
$ curl \
<https://www.dgregscott.com/ovpn/OVPNdownloads.sh> &gt; \
OVPNdownloads.sh
```

Read the script to get an idea of what it does. Here's a quick overview of its actions:

  * Creates the appropriate directories on your OpenVPN server
  * Downloads server and client config file templates from my website
  * Downloads my custom scripts and places them into the correct directory with correct permissions
  * Downloads `99-ipforward.conf` and places it into `/etc/sysctl.d` to turn on IP forwarding at the next boot
  * Sets up ownership for everything in `/etc/openvpn`



Once you're satisfied that you understand what the script does, make it executable and run it:


```
$ chmod +x OVPNdownloads.sh
$ sudo ./OVPNdownloads.sh
```

Here are the files it copies (notice the file ownership):


```
$ ls -al -R /etc/openvpn
/etc/openvpn:
total 12
drwxr-xr-x.   4 openvpn openvpn   34 Apr  6 20:35 .
drwxr-xr-x. 139 root    root    8192 Apr  6 20:35 ..
drwxr-xr-x.   2 openvpn openvpn   33 Apr  6 20:35 client
drwxr-xr-x.   4 openvpn openvpn   56 Apr  6 20:35 server

/etc/openvpn/client:
total 4
drwxr-xr-x. 2 openvpn openvpn   33 Apr  6 20:35 .
drwxr-xr-x. 4 openvpn openvpn   34 Apr  6 20:35 ..
-rw-r--r--. 1 openvpn openvpn 1764 Apr  6 20:35 OVPNclient2020.ovpn

/etc/openvpn/server:
total 4
drwxr-xr-x. 4 openvpn openvpn   56 Apr  6 20:35 .
drwxr-xr-x. 4 openvpn openvpn   34 Apr  6 20:35 ..
drwxr-xr-x. 2 openvpn openvpn   59 Apr  6 20:35 ccd
drwxr-xr-x. 2 openvpn openvpn    6 Apr  6 20:35 logs
-rw-r--r--. 1 openvpn openvpn 2588 Apr  6 20:35 OVPNserver2020.conf

/etc/openvpn/server/ccd:
total 8
drwxr-xr-x. 2 openvpn openvpn  59 Apr  6 20:35 .
drwxr-xr-x. 4 openvpn openvpn  56 Apr  6 20:35 ..
-rwxr-xr-x. 1 openvpn openvpn 917 Apr  6 20:35 client-connect.sh
-rwxr-xr-x. 1 openvpn openvpn 990 Apr  6 20:35 client-disconnect.sh

/etc/openvpn/server/logs:
total 0
drwxr-xr-x. 2 openvpn openvpn  6 Apr  6 20:35 .
drwxr-xr-x. 4 openvpn openvpn 56 Apr  6 20:35 ..
```

Here's the `99-ipforward.conf` file:


```
# Turn on IP forwarding. OpenVPN servers need to do routing
net.ipv4.ip_forward = 1
```

Edit `OVPNserver2020.conf` and `OVPNclient2020.ovpn` to include your IP addresses. Also, edit `OVPNserver2020.conf` to include your server certificate names from earlier. Later, you will rename and edit a copy of `OVPNclient2020.ovpn` for use with your client computers. The blocks that start with `***?` show you where to edit.

### File ownership

If you used the automated script from my website, file ownership is already in place. If not, you must ensure that your system has a user called `openvpn` that is a member of a group named `openvpn`. You must set the ownership of everything in `/etc/openvpn` to that user and group. It's safe to do this if you're unsure whether the user and group already exist because `useradd` will refuse to create a user with the same name as one that already exists:


```
$ sudo useradd openvpn
$ sudo chown -R openvpn.openvpn /etc/openvpn
```

### Firewall

If you decided not to disable the firewalld service in step 1, then your server's firewall service might not allow VPN traffic by default. Using the [`firewall-cmd` command][5], you can enable the OpenVPN service, which opens the necessary ports and routes traffic as necessary:


```
$ sudo firewall-cmd --add-service openvpn --permanent
$ sudo firewall-cmd --reload
```

No need to get lost in a maze of iptables!

### Start your server

You can now start your OpenVPN server. So that it starts automatically after a reboot, use the `enable` subcommand of `systemctl`:


```
`systemctl enable --now openvpn-server@OVPNserver2020.service`
```

### Final steps

The fourth and final article in this article will demonstrate how to set up clients to connect to your OpenVPN from afar.

* * *

_This article is based on D. Greg Scott's [blog][6] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/openvpn-firewall

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://openvpn.net/
[3]: https://opensource.com/article/21/7/vpn-openvpn-part-1
[4]: https://opensource.com/article/21/7/vpn-openvpn-part-2
[5]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[6]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/
