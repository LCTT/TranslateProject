[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Protect your system with fail2ban and firewalld blacklists)
[#]: via: (https://fedoramagazine.org/protect-your-system-with-fail2ban-and-firewalld-blacklists/)
[#]: author: (hobbes1069 https://fedoramagazine.org/author/hobbes1069/)

Protect your system with fail2ban and firewalld blacklists
======

![][1]

If you run a server with a public-facing SSH access, you might have experienced malicious login attempts. This article shows how to use two utilities to keep the intruder out of our systems.

To protect against repeated ssh login attempts, we’ll look at _fail2ban_. And if you don’t travel much, and perhaps stay in one or two countries, you can configure _firewalld_ to only [allow access from the countries you choose][2].

First let’s work through a little terminology for those not familiar with the various applications we’ll need to make this work:

**fail2ban:** Daemon to ban hosts that cause multiple authentication errors.

fail2ban will monitor the SystemD journal to look for failed authentication attempts for whichever jails have been enabled. After the number of failed attempts specified it will add a firewall rule to block that specific IP address for an amount of time configured.

**firewalld:** A firewall daemon with D-Bus interface providing a dynamic firewall.

Unless you’ve manually decided to use traditional iptables, you’re already using firewalld on all supported releases of Fedora and CentOS.

### Assumptions

  * The host system has an internet connection and is either fully exposed directly, through a DMZ (both REALLY bad ideas unless you know what you’re doing), or has a port being forwarded to it from a router.
  * While most of this might apply to other systems, this article assumes a current version of Fedora (31 and up) or RHEL/CentOS 8. On CentOS you must enable the Fedora EPEL repo with sudo dnf install epel-release



### Install &amp; Configuration

#### Fail2Ban

More than likely whichever FirewallD zone is set already allows SSH access but the sshd service itself is not enabled by default. To start it manually and without permanently enabling on boot:

```
$ sudo systemctl start sshd
```

Or to start and enable on boot:

```
$ sudo systemctl enable --now sshd
```

The next step is to install, configure, and enable fail2ban. As usual the install can be done from the command line:

```
$ sudo dnf install fail2ban
```

Once installed the next step is to configure a jail (a service you want to monitor and ban at whatever thresholds you’ve set). By default IPs are banned for 1 hour (which is not near long enough). The best practice is to override the system defaults using *.local files instead of directly modifying the *.config files. If we look at my jail.local we see:

```
# cat /etc/fail2ban/jail.local
[DEFAULT]

# "bantime" is the number of seconds that a host is banned.
bantime  = 1d

# A host is banned if it has generated "maxretry" during the last "findtime"
findtime  = 1h

# "maxretry" is the number of failures before a host get banned.
maxretry = 5
```

Turning this into plain language, after 5 attempts within the last hour the IP will be blocked for 1 day. There’s also options for increasing the ban time for IPs that get banned multiple times, but that’s the subject for another article.

The next step is to configure a jail. In this tutorial sshd is shown but the steps are more or less the same for other services. Create a configuration file inside _/etc/fail2ban/jail.d_. Here’s mine:

```
# cat /etc/fail2ban/jail.d/sshd.local
[sshd]
enabled = true
```

It’s that simple! A lot of the configuration is already handled within the package built for Fedora (Hint: I’m the current maintainer). Next enable and start the fail2ban service.

```
$ sudo systemctl enable --now fail2ban
```

Hopefully there were not any immediate errors, if not, check the status of fail2ban using the following command:

```
$ sudo systemctl status fail2ban
```

If it started without errors it should look something like this:

```
$ systemctl status fail2ban
● fail2ban.service - Fail2Ban Service
Loaded: loaded (/usr/lib/systemd/system/fail2ban.service; disabled; vendor preset: disabled)
Active: active (running) since Tue 2020-06-16 07:57:40 CDT; 5s ago
Docs: man:fail2ban(1)
Process: 11230 ExecStartPre=/bin/mkdir -p /run/fail2ban (code=exited, status=0/SUCCESS)
Main PID: 11235 (f2b/server)
Tasks: 5 (limit: 4630)
Memory: 12.7M
CPU: 109ms
CGroup: /system.slice/fail2ban.service
└─11235 /usr/bin/python3 -s /usr/bin/fail2ban-server -xf start
Jun 16 07:57:40 localhost.localdomain systemd[1]: Starting Fail2Ban Service…
Jun 16 07:57:40 localhost.localdomain systemd[1]: Started Fail2Ban Service.
Jun 16 07:57:41 localhost.localdomain fail2ban-server[11235]: Server ready
```

If recently started, fail2ban is unlikely to show anything interesting going on just yet but to check the status of fail2ban and make sure the jail is enabled enter:

```
$ sudo fail2ban-client status
Status
|- Number of jail:      1
`- Jail list:   sshd
```

And the high level status of the sshd jail is shown. If multiple jails were enabled they would show up here.

To check the detailed status a jail, just add the jail to the previous command. Here’s the output from my system which has been running for a while. I have removed the banned IPs from the output:

```
$ sudo fail2ban-client status sshd
Status for the jail: sshd
|- Filter
|  |- Currently failed: 8
|  |- Total failed:     4399
|  `- Journal matches:  _SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned: 101
   |- Total banned:     684
   `- Banned IP list:   ...
```

Monitoring the fail2ban log file for intrusion attempts can be achieved by “tailing” the log:

```
$ sudo tail -f /var/log/fail2ban.log
```

Tail is a nice little command line utility which by default shows the last 10 lines of a file. Adding the “-f” tells it to follow the file which is a great way to watch a file that’s still being written to.

Since the output has real IPs in it, a sample won’t be provided but it’s pretty human readable. The INFO lines will usually be attempts at a login. If enough attempts are made from a specific IP address you will see a NOTICE line showing an IP address was banned. After the ban time has been reached you will see an NOTICE unban line.

Lookout for several WARNING lines. Most often this happens when a ban is added but fail2ban finds the IP address already in its ban database, which means banning may not be working correctly. If recently installed the fail2ban package it should be setup for FirewallD rich rules. The package was only switched from “ipset” to “rich rules” as of _fail2ban-0.11.1-6_ so if you have an older install of fail2ban it may still be trying to use the ipset method which utilizes legacy iptables and is not very reliable.

#### FirewallD Configuration

##### Reactive or Proactive?

There are two strategies that can be used either separately or together. Reactive or proactive permanent blacklisting of individual IP address or subnets based on country of origin.

For the reactive approach once fail2ban has been running for a while it’s a good idea to take a look at how “bad is bad” by running _sudo fail2ban-client status sshd_ again. There most likely will be many banned IP addresses. Just pick one and try running _whois_ on it. There can be quite a bit of interesting information in the output but for this method, only the country of origin is of importance. To keep things simple, let’s filter out everything but the country.

For this example a few well known domain names will be used:

```
$ whois google.com | grep -i country
Registrant Country: US
Admin Country: US
Tech Country: US
```

```
$ whois rpmfusion.org | grep -i country
Registrant Country: FR
```

```
$ whois aliexpress.com | grep -i country
Registrant Country: CN
```

The reason for the _grep -i_ is to make grep non-case sensitive while most entries use “Country”, some are in all lower case so this method matches regardless.

Now that the country of origin of an intrusion attempt is known the question is, “Does anyone from that country have a legitimate reason to connect to this computer?” If the answer is NO, then it should be acceptable to block the entire country.

Functionally the proactive approach it not very different from the reactive approach, however, there are countries from which intrusion attempts are very common. If the system neither resides in one of those countries, nor has any customers originating from them, then why not add them to the blacklist now rather than waiting?

##### Blacklisting Script and Configuration

So how do you do that? With FirewallD ipsets. I developed the following script to automate the process as much as possible:

```
#!/bin/bash
# Based on the below article
# https://www.linode.com/community/questions/11143/top-tip-firewalld-and-ipset-country-blacklist

# Source the blacklisted countries from the configuration file
. /etc/blacklist-by-country

# Create a temporary working directory
ipdeny_tmp_dir=$(mktemp -d -t blacklist-XXXXXXXXXX)
pushd $ipdeny_tmp_dir

# Download the latest network addresses by country file
curl -LO http://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz
tar xf all-zones.tar.gz

# For updates, remove the ipset blacklist and recreate
if firewall-cmd -q --zone=drop --query-source=ipset:blacklist; then
    firewall-cmd -q --permanent --delete-ipset=blacklist
fi

# Create the ipset blacklist which accepts both IP addresses and networks
firewall-cmd -q --permanent --new-ipset=blacklist --type=hash:net \
    --option=family=inet --option=hashsize=4096 --option=maxelem=200000 \
    --set-description="An ipset list of networks or ips to be dropped."

# Add the address ranges by country per ipdeny.com to the blacklist
for country in $countries; do
    firewall-cmd -q --permanent --ipset=blacklist \
        --add-entries-from-file=./$country.zone && \
        echo "Added $country to blacklist ipset."
done

# Block individual IPs if the configuration file exists and is not empty
if [ -s "/etc/blacklist-by-ip" ]; then
    echo "Adding IPs blacklists."
    firewall-cmd -q --permanent --ipset=blacklist \
        --add-entries-from-file=/etc/blacklist-by-ip && \
        echo "Added IPs to blacklist ipset."
fi

# Add the blacklist ipset to the drop zone if not already setup
if firewall-cmd -q --zone=drop --query-source=ipset:blacklist; then
    echo "Blacklist already in firewalld drop zone."
else
    echo "Adding ipset blacklist to firewalld drop zone."
    firewall-cmd --permanent --zone=drop --add-source=ipset:blacklist
fi

firewall-cmd -q --reload

popd
rm -rf $ipdeny_tmp_dir
```

This should be installed to _/usr/local/sbin_ and don’t forget to make it executable!

```
$ sudo chmod +x /usr/local/sbin/firewalld-blacklist
```

Then create a configure file: _/etc/blacklist-by-country_:

```
# Which countries should be blocked?
# Use the two letter designation separated by a space.
countries=""
```

And another configuration file _/etc/blacklist-by-ip_, which is just one IP per line without any additional formatting.

For this example 10 random countries were selected from the ipdeny zones:

```
# ls | shuf -n 10 | sed "s/\.zone//g" | tr '\n' ' '
nl ee ie pk is sv na om gp bn
```

Now as long as at least one country has been added to the config file it’s ready to run!

```
$ sudo firewalld-blacklist
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   142  100   142    0     0   1014      0 --:--:-- --:--:-- --:--:--  1014
100  662k  100  662k    0     0   989k      0 --:--:-- --:--:-- --:--:--  989k
Added nl to blacklist ipset.
Added ee to blacklist ipset.
Added ie to blacklist ipset.
Added pk to blacklist ipset.
Added is to blacklist ipset.
Added sv to blacklist ipset.
Added na to blacklist ipset.
Added om to blacklist ipset.
Added gp to blacklist ipset.
Added bn to blacklist ipset.
Adding ipset blacklist to firewalld drop zone.
success
```

To verify that the firewalld blacklist was successful, check the drop zone and blacklist ipset:

```
$ sudo firewall-cmd --info-zone=drop
drop (active)
  target: DROP
  icmp-block-inversion: no
  interfaces:
  sources: ipset:blacklist
  services:
  ports:
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:

$ sudo firewall-cmd --info-ipset=blacklist | less
blacklist
  type: hash:net
  options: family=inet hashsize=4096 maxelem=200000
  entries:
```

The second command will output all of the subnets that were added based on the countries blocked and can be quite lengthy.

##### So now what do I do?

While it will be a good idea to monitor things more frequently at the beginning, over time the number of intrusion attempts should decline as the blacklist grows. Then the goal should be maintenance rather than active monitoring.

To this end I created a SystemD service file and timer so that on a monthly basis the by country subnets maintained by ipdeny are refreshed. In fact everything discussed here can be downloaded from my pagure.io project:

<https://pagure.io/firewalld-blacklist>

Aren’t you glad you read the whole article? Now just download the service file and timer to _/etc/systemd/system/_ and enable the timer:

```
$ sudo systemctl daemon-reload
$ sudo systemctl enable --now firewalld-blacklist.timer
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/protect-your-system-with-fail2ban-and-firewalld-blacklists/

作者：[hobbes1069][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hobbes1069/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/fail2ban-and-firewalld-816x345.png
[2]: https://www.linode.com/community/questions/11143/top-tip-firewalld-and-ipset-country-blacklist
