Advanced Dnsmasq Tips and Tricks
======

!](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_3.25.47_pm.png?itok=2YaDe86d)

Many people know and love Dnsmasq and rely on it for their local name services. Today we look at advanced configuration file management, how to test your configurations, some basic security, DNS wildcards, speedy DNS configuration, and some other tips and tricks. Next week, we'll continue with a detailed look at how to configure DNS and DHCP.

### Testing Configurations

When you're testing new configurations, you should run Dnsmasq from the command line, rather than as a daemon. This example starts it without launching the daemon, prints command output, and logs all activity:
```
# dnsmasq --no-daemon --log-queries
dnsmasq: started, version 2.75 cachesize 150
dnsmasq: compile time options: IPv6 GNU-getopt
 DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack
 ipset auth DNSSEC loop-detect inotify
dnsmasq: reading /etc/resolv.conf
dnsmasq: using nameserver 192.168.0.1#53
dnsmasq: read /etc/hosts - 9 addresses

```

You can see tons of useful information in this small example, including version, compiled options, system name service files, and its listening address. Ctrl+c stops it. By default, Dnsmasq does not have its own log file, so entries are dumped into multiple locations in `/var/log`. You can use good old `grep` to find Dnsmasq log entries. This example searches `/var/log` recursively, prints the line numbers after the filenames, and excludes `/var/log/dist-upgrade`:
```
# grep -ir --exclude-dir=dist-upgrade dnsmasq /var/log/

```

Note the fun grep gotcha with `--exclude-dir=`: Don't specify the full path, but just the directory name.

You can give Dnsmasq its own logfile with this command-line option, using whatever file you want:
```
# dnsmasq --no-daemon --log-queries --log-facility=/var/log/dnsmasq.log

```

Or enter it in your Dnsmasq configuration file as `log-facility=/var/log/dnsmasq.log`.

### Configuration Files

Dnsmasq is configured in `/etc/dnsmasq.conf`. Your Linux distribution may also use `/etc/default/dnsmasq`, `/etc/dnsmasq.d/`, and `/etc/dnsmasq.d-available/`. (No, there cannot be a universal method, as that is against the will of the Linux Cat Herd Ruling Cabal.) You have a fair bit of flexibility to organize your Dnsmasq configuration in a way that pleases you.

`/etc/dnsmasq.conf` is the grandmother as well as the boss. Dnsmasq reads it first at startup. `/etc/dnsmasq.conf` can call other configuration files with the `conf-file=` option, for example `conf-file=/etc/dnsmasqextrastuff.conf`, and directories with the `conf-dir=` option, e.g. `conf-dir=/etc/dnsmasq.d`.

Whenever you make a change in a configuration file, you must restart Dnsmasq.

You may include or exclude configuration files by extension. The asterisk means include, and the absence of the asterisk means exclude:
```
conf-dir=/etc/dnsmasq.d/,*.conf, *.foo
conf-dir=/etc/dnsmasq.d,.old, .bak, .tmp

```

You may store your host configurations in multiple files with the `--addn-hosts=` option.

Dnsmasq includes a syntax checker:
```
$ dnsmasq --test
dnsmasq: syntax check OK.

```

### Useful Configurations

Always include these lines:
```
domain-needed
bogus-priv

```

These prevent packets with malformed domain names and packets with private IP addresses from leaving your network.

This limits your name services exclusively to Dnsmasq, and it will not use `/etc/resolv.conf` or any other system name service files:
```
no-resolv

```

Reference other name servers. The first example is for a local private domain. The second and third examples are OpenDNS public servers:
```
server=/fooxample.com/192.168.0.1
server=208.67.222.222
server=208.67.220.220

```

Or restrict just local domains while allowing external lookups for other domains. These are answered only from `/etc/hosts` or DHCP:
```
local=/mehxample.com/
local=/fooxample.com/

```

Restrict which network interfaces Dnsmasq listens to:
```
interface=eth0
interface=wlan1

```

Dnsmasq, by default, reads and uses `/etc/hosts`. This is a fabulously fast way to configure a lot of hosts, and the `/etc/hosts` file only has to exist on the same computer as Dnsmasq. You can make the process even faster by entering only the hostnames in `/etc/hosts`, and use Dnsmasq to add the domain. `/etc/hosts` looks like this:
```
127.0.0.1 localhost
192.168.0.1 host2
192.168.0.2 host3
192.168.0.3 host4

```

Then add these lines to `dnsmasq.conf`, using your own domain, of course:
```
expand-hosts
domain=mehxample.com

```

Dnsmasq will automatically expand the hostnames to fully qualified domain names, for example, host2 to host2.mehxample.com.

### DNS Wildcards

In general, DNS wildcards are not a good practice because they invite abuse. But there are times when they are useful, such as inside the nice protected confines of your LAN. For example, Kubernetes clusters are considerably easier to manage with wildcard DNS, unless you enjoy making DNS entries for your hundreds or thousands of applications. Suppose your Kubernetes domain is mehxample.com; in Dnsmasq a wildcard that resolves all requests to mehxample.com looks like this:
```
address=/mehxample.com/192.168.0.5

```

The address to use in this case is the public IP address for your cluster. This answers requests for hosts and subdomains in mehxample.com, except for any that are already configured in DHCP or `/etc/hosts`.

Next week, we'll go into more detail on managing DNS and DHCP, including different options for different subnets, and providing authoritative name services.

### Additional Resources

*   [DNS Spoofing with Dnsmasq][1]

*   [Dnsmasq For Easy LAN Name Services][2]

*   [Dnsmasq][3]



--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/advanced-dnsmasq-tips-and-tricks

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/7/dns-spoofing-dnsmasq
[2]:https://www.linux.com/learn/dnsmasq-easy-lan-name-services
[3]:http://www.thekelleys.org.uk/dnsmasq/doc.html
