How To Protect Server Against Brute Force Attacks With Fail2ban On Linux
======
One of the important task for Linux administrator is to protect server against illegitimate attack or access. By default Linux system comes with well-configured firewall such as Iptables, Uncomplicated Firewall (UFW), ConfigServer Security Firewall (CSF), etc, which will prevent many kinds of attacks.

Any machine which is connected to the internet is a potential target for malicious attacks. There is a tool called fail2ban is available to mitigate illegitimate access on server.

### What Is Fail2ban?

[Fail2ban][1] is an intrusion prevention software, framework which protect server against brute force attacks. It's Written in Python programming language. Fail2ban work based on auth log files, by default it will scan the auth log files such as `/var/log/auth.log`, `/var/log/apache/access.log`, etc.. and bans IPs that show the malicious signs, too many password failures, seeking for exploits, etc.

Generally fail2Ban is used to update firewall rules to reject the IP addresses for a specified amount of time. Also it will send mail notification too. Fail2Ban comes with many filters for various services such as ssh, apache, nginx, squid, named, mysql, nagios, etc,.

Fail2Ban is able to reduce the rate of incorrect authentications attempts however it cannot eliminate the risk that weak authentication presents. this is one of the security for server which will prevent brute force attacks.

### How to Install Fail2ban In Linux

Fail2ban is already packaged with most of the Linux distribution so, just use you distribution package manager to install it.

For **`Debian/Ubuntu`** , use [APT-GET Command][2] or [APT Command][3] to install tilda.
```
$ sudo apt install fail2ban

```

For **`Fedora`** , use [DNF Command][4] to install tilda.
```
$ sudo dnf install fail2ban

```

For **`CentOS/RHEL`** systems, enable [EPEL Repository][5] or [RPMForge Repository][6] and use [YUM Command][7] to install Terminator.
```
$ sudo yum install fail2ban

```

For **`Arch Linux`** , use [Pacman Command][8] to install tilda.
```
$ sudo pacman -S fail2ban

```

For **`openSUSE`** , use [Zypper Command][9] to install tilda.
```
$ sudo zypper in fail2ban

```

### How To Configure Fail2ban

By default Fail2ban keeps all the configuration files in `/etc/fail2ban/` directory. The main configuration file is `jail.conf`, it contains a set of pre-defined filters. So, don't edit the file and it's not advisable because whenever new update comes the configuration get reset to default.

Just create a new configuration file called `jail.local` in the same directory and modify as per your wish.
```
# cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

```

By default most of the option was configured perfectly and if you want to enable access to any particular IP then you can add the IP address into `ignoreip` area, for more then one IP give a speace between the IP address.

The `DEFAULT` section contains the basic set of rules that Fail2Ban follow and you can adjust any parameter as per your wish.
```
# nano /etc/fail2ban/jail.local

[DEFAULT]
ignoreip = 127.0.0.1/8 192.168.1.100/24
bantime = 600
findtime = 600
maxretry = 3
destemail = 2daygeek@gmail.com

```

  * **ignoreip :** This section allow us to whitelist the list of IP address and Fail2ban will not ban a host which matches an address in this list
  * **bantime :** The number of seconds that a host is banned
  * **findtime :** A host is banned if it has generated "maxretry" during the last "findtime" seconds
  * **maxretry :** "maxretry" is the number of failures before a host get banned.



### How To Configure Service

Fail2ban comes with set of pre-defined filters for various servicess such as ssh, apache, nginx, squid, named, mysql, nagios, etc,. We don't want to make any changes on configuration file and just add following line `enabled = true` in the service area to enable jail to any services. To disable make the line to `false` instead of ture.
```
# SSH servers
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s

```

  * **enabled :** Determines whether the service is turned on or off.
  * **port :** It's refering to the particular service. If using the default port, then the service name can be placed here. If using a non-traditional port, this should be the port number.
  * **logpath :** Gives the location of the service's logs./li>
  * **backend :** "backend" specifies the backend used to get files modification.



### Restart Fail2Ban

After making changes restart Fail2Ban to take effect.
```
[For SysVinit Systems]
# service fail2ban restart

[For systemd Systems]
# systemctl restart fail2ban.service

```

### Verify Fail2Ban iptables rules

You can confirm whether Fail2Ban iptables rules are added into firewall using below command.
```
# iptables -L
Chain INPUT (policy ACCEPT)
target prot opt source destination
f2b-apache-auth tcp -- anywhere anywhere multiport dports http,https
f2b-sshd tcp -- anywhere anywhere multiport dports 1234
ACCEPT tcp -- anywhere anywhere tcp dpt:1234

Chain FORWARD (policy ACCEPT)
target prot opt source destination

Chain OUTPUT (policy ACCEPT)
target prot opt source destination

Chain f2b-apache-auth (1 references)
target prot opt source destination
RETURN all -- anywhere anywhere

Chain f2b-sshd (1 references)
target prot opt source destination
RETURN all -- anywhere anywhere
```

### How To Test Fail2ban

I have made some failed attempts to test this. To confirm this, I'm going to verify the `/var/log/fail2ban.log` file.
```
2017-11-05 14:43:22,901 fail2ban.server [7141]: INFO Changed logging target to /var/log/fail2ban.log for Fail2ban v0.9.6
2017-11-05 14:43:22,987 fail2ban.database [7141]: INFO Connected to fail2ban persistent database '/var/lib/fail2ban/fail2ban.sqlite3'
2017-11-05 14:43:22,996 fail2ban.database [7141]: WARNING New database created. Version '2'
2017-11-05 14:43:22,998 fail2ban.jail [7141]: INFO Creating new jail 'sshd'
2017-11-05 14:43:23,002 fail2ban.jail [7141]: INFO Jail 'sshd' uses poller {}
2017-11-05 14:43:23,019 fail2ban.jail [7141]: INFO Initiated 'polling' backend
2017-11-05 14:43:23,019 fail2ban.filter [7141]: INFO Set maxRetry = 5
2017-11-05 14:43:23,020 fail2ban.filter [7141]: INFO Set jail log file encoding to UTF-8
2017-11-05 14:43:23,020 fail2ban.filter [7141]: INFO Added logfile = /var/log/auth.log
2017-11-05 14:43:23,021 fail2ban.actions [7141]: INFO Set banTime = 600
2017-11-05 14:43:23,021 fail2ban.filter [7141]: INFO Set findtime = 600
2017-11-05 14:43:23,022 fail2ban.filter [7141]: INFO Set maxlines = 10
2017-11-05 14:43:23,070 fail2ban.server [7141]: INFO Jail sshd is not a JournalFilter instance
2017-11-05 14:43:23,081 fail2ban.jail [7141]: INFO Jail 'sshd' started
2017-11-05 14:43:23,763 fail2ban.filter [7141]: INFO [sshd] Found 103.5.134.167
2017-11-05 14:43:23,763 fail2ban.filter [7141]: INFO [sshd] Found 103.5.134.167
2017-11-05 14:43:23,764 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 14:43:23,764 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 14:43:23,765 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 14:43:23,765 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 15:19:06,192 fail2ban.server [7141]: INFO Stopping all jails
2017-11-05 15:19:06,874 fail2ban.jail [7141]: INFO Jail 'sshd' stopped
2017-11-05 15:19:06,879 fail2ban.server [7141]: INFO Exiting Fail2ban
2017-11-05 15:19:07,123 fail2ban.server [8528]: INFO Changed logging target to /var/log/fail2ban.log for Fail2ban v0.9.6
2017-11-05 15:19:07,123 fail2ban.database [8528]: INFO Connected to fail2ban persistent database '/var/lib/fail2ban/fail2ban.sqlite3'
2017-11-05 15:19:07,126 fail2ban.jail [8528]: INFO Creating new jail 'sshd'
2017-11-05 15:19:07,129 fail2ban.jail [8528]: INFO Jail 'sshd' uses poller {}
2017-11-05 15:19:07,141 fail2ban.jail [8528]: INFO Initiated 'polling' backend
2017-11-05 15:19:07,142 fail2ban.actions [8528]: INFO Set banTime = 60
2017-11-05 15:19:07,142 fail2ban.filter [8528]: INFO Set findtime = 60
2017-11-05 15:19:07,142 fail2ban.filter [8528]: INFO Set jail log file encoding to UTF-8
2017-11-05 15:19:07,143 fail2ban.filter [8528]: INFO Set maxRetry = 3
2017-11-05 15:19:07,144 fail2ban.filter [8528]: INFO Added logfile = /var/log/auth.log
2017-11-05 15:19:07,144 fail2ban.filter [8528]: INFO Set maxlines = 10
2017-11-05 15:19:07,189 fail2ban.server [8528]: INFO Jail sshd is not a JournalFilter instance
2017-11-05 15:19:07,195 fail2ban.jail [8528]: INFO Jail 'sshd' started
2017-11-05 15:20:03,263 fail2ban.filter [8528]: INFO [sshd] Found 103.5.134.167
2017-11-05 15:20:05,267 fail2ban.filter [8528]: INFO [sshd] Found 103.5.134.167
2017-11-05 15:20:12,276 fail2ban.filter [8528]: INFO [sshd] Found 103.5.134.167
2017-11-05 15:20:12,380 fail2ban.actions [8528]: NOTICE [sshd] Ban 103.5.134.167
2017-11-05 15:21:12,659 fail2ban.actions [8528]: NOTICE [sshd] Unban 103.5.134.167

```

To Check list of jail enabled, run the following command.
```
# fail2ban-client status
Status
|- Number of jail:	2
`- Jail list:	apache-auth, sshd

```

To get the blocked Ip address by running following command.
```
# fail2ban-client status ssh
Status for the jail: ssh
|- filter
| |- File list: /var/log/auth.log
| |- Currently failed: 1
| `- Total failed: 3
`- action
 |- Currently banned: 1
 | `- IP list: 192.168.1.115
 `- Total banned: 1

```

To remove blocked IP address from Fail2Ban, run the following command.
```
# fail2ban-client set ssh unbanip 192.168.1.115

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-setup-configure-fail2ban-on-linux/#

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://github.com/fail2ban/fail2ban
[2]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]:https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]:https://www.2daygeek.com/install-enable-repoforge-rpmforge-repository-on-rhel-centos-sl/
[7]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[10]:/cdn-cgi/l/email-protection
