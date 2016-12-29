translating---geekpi

Securing Your Server
============================================================

### Update Your System–Frequently

Keeping your software up to date is the single biggest security precaution you can take for any operating system. Software updates range from critical vulnerability patches to minor bug fixes, and many software vulnerabilities are actually patched by the time they become public.

### Automatic Security Updates

There are arguments for and against automatic updates on servers. [Fedora’s Wiki][15] has a good breakdown of the pros and cons, but the risk of automatic updates will be minimal if you limit them to security updates.

The practicality of automatic updates is something you must judge for yourself because it comes down to what _you_ do with your Linode. Bear in mind that automatic updates apply only to packages sourced from repositories, not self-compiled applications. You may find it worthwhile to have a test environment that replicates your production server. Updates can be applied there and reviewed for issues before being applied to the live environment.

*   CentOS uses _[yum-cron][2]_ for automatic updates.

*   Debian and Ubuntu use _[unattended upgrades][3]_.

*   Fedora uses _[dnf-automatic][4]_.

### Add a Limited User Account

Up to this point, you have accessed your Linode as the `root` user, which has unlimited privileges and can execute _any_ command–even one that could accidentally disrupt your server. We recommend creating a limited user account and using that at all times. Administrative tasks will be done using `sudo` to temporarily elevate your limited user’s privileges so you can administer your server.

> Not all Linux distributions include `sudo` on the system by default, but all the images provided by Linode have sudo in their package repositories. If you get the output `sudo: command not found`, install sudo before continuing.

To add a new user, first [log in to your Linode][16] via SSH.

### CentOS / Fedora

1.  Create the user, replacing `example_user` with your desired username, and assign a password:

```
    useradd example_user && passwd example_user
```

2.  Add the user to the `wheel` group for sudo privileges:

```
    usermod -aG wheel example_user
```

### Ubuntu

1.  Create the user, replacing `example_user` with your desired username. You’ll then be asked to assign the user a password:

```
    adduser example_user
```

2.  Add the user to the `sudo` group so you’ll have administrative privileges:


```
    adduser example_user sudo
```

### Debian

1.  Debian does not include `sudo` among their default packages. Use `apt-get` to install it:


```
    apt-get install sudo
```

2.  Create the user, replacing `example_user` with your desired username. You’ll then be asked to assign the user a password:

```
    adduser example_user
```

3.  Add the user to the `sudo` group so you’ll have administrative privileges:

```
    adduser example_user sudo
```

After creating your limited user, disconnect from your Linode:

```
exit
```

Log back in as your new user. Replace `example_user` with your username, and the example IP address with your Linode’s IP address:

```
ssh example_user@203.0.113.10
```

Now you can administer your Linode from your new user account instead of `root`. Nearly all superuser commands can be executed with `sudo` (example: `sudo iptables -L -nv`) and those commands will be logged to `/var/log/auth.log`.

### Harden SSH Access

By default, password authentication is used to connect to your Linode via SSH. A cryptographic key-pair is more secure because a private key takes the place of a password, which is generally much more difficult to brute-force. In this section we’ll create a key-pair and configure the Linode to not accept passwords for SSH logins.

### Create an Authentication Key-pair

1.  This is done on your local computer, **not** your Linode, and will create a 4096-bit RSA key-pair. During creation, you will be given the option to encrypt the private key with a passphrase. This means that it cannot be used without entering the passphrase, unless you save it to your local desktop’s keychain manager. We suggest you use the key-pair with a passphrase, but you can leave this field blank if you don’t want to use one.

    **Linux / OS X**

    > If you’ve already created an RSA key-pair, this command will overwrite it, potentially locking you out of other systems. If you’ve already created a key-pair, skip this step. To check for existing keys, run `ls ~/.ssh/id_rsa*`.

```
    ssh-keygen -b 4096
```


    Press **Enter** to use the default names `id_rsa` and `id_rsa.pub` in `/home/your_username/.ssh` before entering your passphrase.

    **Windows**

    This can be done using PuTTY as outlined in our guide: [Use Public Key Authentication with SSH][6].

2.  Upload the public key to your Linode. Replace `example_user` with the name of the user you plan to administer the server as, and `203.0.113.10` with your Linode’s IP address.

    **Linux**

    From your local computer:

```
    ssh-copy-id example_user@203.0.113.10
```
 
    **OS X**

    On your Linode (while signed in as your limited user):

```
    mkdir -p ~/.ssh && sudo chmod -R 700 ~/.ssh/
```
 
    From your local computer:

```
    scp ~/.ssh/id_rsa.pub example_user@203.0.113.10:~/.ssh/authorized_keys
```

    > `ssh-copy-id` is available in [Homebrew][5] if you prefer it over SCP. Install with `brew install ssh-copy-id`.

    **Windows**

    *   **Option 1**: This can be done using [WinSCP][1]. In the login window, enter your Linode’s public IP address as the hostname, and your non-root username and password. Click _Login_ to connect.

        Once WinSCP has connected, you’ll see two main sections. The section on the left shows files on your local computer and the section on the right shows files on your Linode. Using the file explorer on the left, navigate to the file where you’ve saved your public key, select the public key file, and click _Upload_ in the toolbar above.

        You’ll be prompted to enter a path where you’d like to place the file on your Linode. Upload the file to `/home/example_user/.ssh/authorized_keys`, replacing `example_user` with your username.

    *   **Option 2:** Copy the public key directly from the PuTTY key generator into the terminal emulator connected to your Linode (as a non-root user):

    ```
        mkdir ~/.ssh; nano ~/.ssh/authorized_keys
    ```
 

        The above command will open a blank file called `authorized_keys` in a text editor. Copy the public key into the text file, making sure it is copied as a single line exactly as it was generated by PuTTY. Press **CTRL+X**, then **Y**, then **Enter** to save the file.

    Finally, you’ll want to set permissions for the public key directory and the key file itself:

```
    sudo chmod 700 -R ~/.ssh && chmod 600 ~/.ssh/authorized_keys
```

    These commands provide an extra layer of security by preventing other users from accessing the public key directory as well as the file itself. For more information on how this works, see our guide on [how to modify file permissions][7].

3.  Now exit and log back into your Linode. If you specified a passphrase for your private key, you’ll need to enter it.

### SSH Daemon Options

1.  **Disallow root logins over SSH.** This requires all SSH connections be by non-root users. Once a limited user account is connected, administrative privileges are accessible either by using `sudo` or changing to a root shell using `su -`.

```
    # Authentication:
    ...
    PermitRootLogin no
```


2.  **Disable SSH password authentication.** This requires all users connecting via SSH to use key authentication. Depending on the Linux distribution, the line `PasswordAuthentication` may need to be added, or uncommented by removing the leading `#`.


```
    # Change to no to disable tunnelled clear text passwords
    PasswordAuthentication no
```

    > You may want to leave password authentication enabled if you connect to your Linode from many different computers. This will allow you to authenticate with a password instead of generating and uploading a key-pair for every device.

3.  **Listen on only one internet protocol.** The SSH daemon listens for incoming connections over both IPv4 and IPv6 by default. Unless you need to SSH into your Linode using both protocols, disable whichever you do not need. _This does not disable the protocol system-wide, it is only for the SSH daemon._

    Use the option:

    *   `AddressFamily inet` to listen only on IPv4.
    *   `AddressFamily inet6` to listen only on IPv6.

    The `AddressFamily` option is usually not in the `sshd_config` file by default. Add it to the end of the file:

```
    echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config
```
 

4.  Restart the SSH service to load the new configuration.

    If you’re using a Linux distribution which uses systemd (CentOS 7, Debian 8, Fedora, Ubuntu 15.10+)

```
    sudo systemctl restart sshd
```

    If your init system is SystemV or Upstart (CentOS 6, Debian 7, Ubuntu 14.04):

```
    sudo service ssh restart
```

### Use Fail2Ban for SSH Login Protection

[_Fail2Ban_][17] is an application that bans IP addresses from logging into your server after too many failed login attempts. Since legitimate logins usually take no more than three tries to succeed (and with SSH keys, no more than one), a server being spammed with unsuccessful logins indicates attempted malicious access.

Fail2Ban can monitor a variety of protocols including SSH, HTTP, and SMTP. By default, Fail2Ban monitors SSH only, and is a helpful security deterrent for any server since the SSH daemon is usually configured to run constantly and listen for connections from any remote IP address.

For complete instructions on installing and configuring Fail2Ban, see our guide: [Securing Your Server with Fail2ban][18].

### Remove Unused Network-Facing Services

Most Linux distributions install with running network services which listen for incoming connections from the internet, the loopback interface, or a combination of both. Network-facing services which are not needed should be removed from the system to reduce the attack surface of both running processes and installed packages.

### Determine Running Services

To see your Linode’s running network services:

```
sudo netstat -tulpn
```


> If netstat isn’t included in your Linux distribution by default, install the package `net-tools` or use the `ss -tulpn`command instead.

The following is an example of netstat’s output. Note that because distributions run different services by default, your output will differ:


```
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      7315/rpcbind
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      3277/sshd
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN      3179/exim4
tcp        0      0 0.0.0.0:42526           0.0.0.0:*               LISTEN      2845/rpc.statd
tcp6       0      0 :::48745                :::*                    LISTEN      2845/rpc.statd
tcp6       0      0 :::111                  :::*                    LISTEN      7315/rpcbind
tcp6       0      0 :::22                   :::*                    LISTEN      3277/sshd
tcp6       0      0 ::1:25                  :::*                    LISTEN      3179/exim4
udp        0      0 127.0.0.1:901           0.0.0.0:*                           2845/rpc.statd
udp        0      0 0.0.0.0:47663           0.0.0.0:*                           2845/rpc.statd
udp        0      0 0.0.0.0:111             0.0.0.0:*                           7315/rpcbind
udp        0      0 192.0.2.1:123           0.0.0.0:*                           3327/ntpd
udp        0      0 127.0.0.1:123           0.0.0.0:*                           3327/ntpd
udp        0      0 0.0.0.0:123             0.0.0.0:*                           3327/ntpd
udp        0      0 0.0.0.0:705             0.0.0.0:*                           7315/rpcbind
udp6       0      0 :::111                  :::*                                7315/rpcbind
udp6       0      0 fe80::f03c:91ff:fec:123 :::*                                3327/ntpd
udp6       0      0 2001:DB8::123           :::*                                3327/ntpd
udp6       0      0 ::1:123                 :::*                                3327/ntpd
udp6       0      0 :::123                  :::*                                3327/ntpd
udp6       0      0 :::705                  :::*                                7315/rpcbind
udp6       0      0 :::60671                :::*                                2845/rpc.statd
```
 
Netstat tells us that services are running for [Remote Procedure Call][19] (rpc.statd and rpcbind), SSH (sshd), [NTPdate][20] (ntpd) and [Exim][21] (exim4).

#### TCP

See the **Local Address** column of the netstat readout. The process `rpcbind` is listening on `0.0.0.0:111` and `:::111` for a foreign address of `0.0.0.0:*` or `:::*`. This means that it’s accepting incoming TCP connections from other RPC clients on any external address, both IPv4 and IPv6, from any port and over any network interface. We see similar for SSH, and that Exim is listening locally for traffic from the loopback interface, as shown by the `127.0.0.1` address.

#### UDP

UDP sockets are _[stateless][14]_, meaning they are either open or closed and every process’s connection is independent of those which occurred before and after. This is in contrast to TCP connection states such as _LISTEN_, _ESTABLISHED_ and _CLOSE_WAIT_.

Our netstat output shows that NTPdate is: 1) accepting incoming connections on the Linode’s public IP address; 2) communicates over localhost; and 3) accepts connections from external sources. These are over port 123, and both IPv4 and IPv6\. We also see more sockets open for RPC.

### Determine Which Services to Remove

If you were to do a basic TCP and UDP [nmap][22] scan of your Linode without a firewall enabled, SSH, RPC and NTPdate would be present in the result with ports open. By [configuring a firewall][23] you can filter those ports, with the exception of SSH because it must allow your incoming connections. Ideally, however, the unused services should be disabled.

*   You will likely be administering your server primarily through an SSH connection, so that service needs to stay. As mentioned above, [RSA keys][8] and [Fail2Ban][9] can help protect SSH.

*   NTP is necessary for your server’s timekeeping but there are alternatives to NTPdate. If you prefer a time synchronization method which does not hold open network ports, and you do not need nanosecond accuracy, then you may be interested in replacing NTPdate with [OpenNTPD][10].

*   Exim and RPC, however, are unnecessary unless you have a specific use for them, and should be removed.

> This section focused on Debian 8\. Different Linux distributions have different services enabled by default. If you are unsure of what a service does, do an internet search to understand what it is before attempting to remove or disable it.

### Uninstall the Listening Services

How to remove the offending packages will differ depending on your distribution’s package manager.

**Arch**

```
sudo pacman -Rs package_name
```

**CentOS**


```
sudo yum remove package_name
```


**Debian / Ubuntu**

```
sudo apt-get purge package_name
```

**Fedora**


```
sudo dnf remove package_name
```

Run `sudo netstat -tulpn` again. You should now only see listening services for SSH (sshd) and NTP (ntpdate, network time protocol).

### Configure a Firewall

Using a _firewall_ to block unwanted inbound traffic to your Linode provides a highly effective security layer. By being very specific about the traffic you allow in, you can prevent intrusions and network mapping. A best practice is to allow only the traffic you need, and deny everything else. See our documentation on some of the most common firewall applications:

*   [Iptables][11] is the controller for netfilter, the Linux kernel’s packet filtering framework. Iptables is included in most Linux distributions by default.

*   [FirewallD][12] is the iptables controller available for the CentOS / Fedora family of distributions.

*   [UFW][13] provides an iptables frontend for Debian and Ubuntu.

### Next Steps

These are the most basic steps to harden any Linux server, but further security layers will depend on its intended use. Additional techniques can include application configurations, using [intrusion detection][24] or installing a form of [access control][25].

Now you can begin setting up your Linode for any purpose you choose. We have a library of documentation to assist you with a variety of topics ranging from [migration from shared hosting][26] to [enabling two-factor authentication][27] to [hosting a website][28].

--------------------------------------------------------------------------------

via: https://www.linode.com/docs/security/securing-your-server/

作者：[Phil Zona ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linode.com/docs/security/securing-your-server/
[1]:http://winscp.net/
[2]:https://fedoraproject.org/wiki/AutoUpdates#Fedora_21_or_earlier_versions
[3]:https://help.ubuntu.com/lts/serverguide/automatic-updates.html
[4]:https://dnf.readthedocs.org/en/latest/automatic.html
[5]:http://brew.sh/
[6]:https://www.linode.com/docs/security/use-public-key-authentication-with-ssh#windows-operating-system
[7]:https://www.linode.com/docs/tools-reference/modify-file-permissions-with-chmod
[8]:https://www.linode.com/docs/security/securing-your-server/#create-an-authentication-key-pair
[9]:https://www.linode.com/docs/security/securing-your-server/#use-fail2ban-for-ssh-login-protection
[10]:https://en.wikipedia.org/wiki/OpenNTPD
[11]:https://www.linode.com/docs/security/firewalls/control-network-traffic-with-iptables
[12]:https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos
[13]:https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw
[14]:https://en.wikipedia.org/wiki/Stateless_protocol
[15]:https://fedoraproject.org/wiki/AutoUpdates#Why_use_Automatic_updates.3F
[16]:https://www.linode.com/docs/getting-started#logging-in-for-the-first-time
[17]:http://www.fail2ban.org/wiki/index.php/Main_Page
[18]:https://www.linode.com/docs/security/using-fail2ban-for-security
[19]:https://en.wikipedia.org/wiki/Open_Network_Computing_Remote_Procedure_Call
[20]:http://support.ntp.org/bin/view/Main/SoftwareDownloads
[21]:http://www.exim.org/
[22]:https://nmap.org/
[23]:https://www.linode.com/docs/security/securing-your-server/#configure-a-firewall
[24]:https://linode.com/docs/security/ossec-ids-debian-7
[25]:https://en.wikipedia.org/wiki/Access_control#Access_Control
[26]:https://www.linode.com/docs/migrate-to-linode/migrate-from-shared-hosting
[27]:https://www.linode.com/docs/security/linode-manager-security-controls
[28]:https://www.linode.com/docs/websites/hosting-a-website
