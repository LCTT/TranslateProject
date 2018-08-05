pinewall is translating

Anatomy of a Linux DNS Lookup – Part I
============================================================

Since I [work][3] [a][4] [lot][5] [with][6] [clustered][7] [VMs][8], I’ve ended up spending a lot of time trying to figure out how [DNS lookups][9] work. I applied ‘fixes’ to my problems from StackOverflow without really understanding why they work (or don’t work) for some time.

Eventually I got fed up with this and decided to figure out how it all hangs together. I couldn’t find a complete guide for this anywhere online, and talking to colleagues they didn’t know of any (or really what happens in detail)

So I’m writing the guide myself.

 _If you’re looking for Part II, click [here][1]_ 

Turns out there’s quite a bit in the phrase ‘Linux does a DNS lookup’…

* * *

![linux-dns-0](https://zwischenzugs.files.wordpress.com/2018/06/linux-dns-0.png?w=121)

 _“How hard can it be?”_ 

* * *

These posts are intended to break down how a program decides how it gets an IP address on a Linux host, and the components that can get involved. Without understanding how these pieces fit together, debugging and fixing problems with (for example) `dnsmasq`, `vagrant landrush`, or `resolvconf` can be utterly bewildering.

It’s also a valuable illustration of how something so simple can get so very complex over time. I’ve looked at over a dozen different technologies and their archaeologies so far while trying to grok what’s going on.

I even wrote some [automation code][10] to allow me to experiment in a VM. Contributions/corrections are welcome.

Note that this is not a post on ‘how DNS works’. This is about everything up to the call to the actual DNS server that’s configured on a linux host (assuming it even calls a DNS server – as you’ll see, it need not), and how it might find out which one to go to, or how it gets the IP some other way.

* * *

### 1) There is no such thing as a ‘DNS Lookup’ call

* * *

![linux-dns-1](https://zwischenzugs.files.wordpress.com/2018/06/linux-dns-1.png?w=121)

 _This is NOT how it works_ 

* * *

The first thing to grasp is that there is no single method of getting a DNS lookup done on Linux. It’s not a core system call with a clean interface.

There is, however, a standard C library call called which many programs use: `[getaddrinfo][2]`. But not all applications use this!

Let’s just take two simple standard programs: `ping` and `host`:

```
root@linuxdns1:~# ping -c1 bbc.co.uk | head -1
PING bbc.co.uk (151.101.192.81) 56(84) bytes of data.
```

```
root@linuxdns1:~# host bbc.co.uk | head -1
bbc.co.uk has address 151.101.192.81
```

They both get the same result, so they must be doing the same thing, right?

Wrong.

Here’s the files that `ping` looks at on my host that are relevant to DNS:

```
root@linuxdns1:~# strace -e trace=open -f ping -c1 google.com
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/lib/x86_64-linux-gnu/libcap.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/etc/resolv.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/resolv.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 4
open("/lib/x86_64-linux-gnu/libnss_files.so.2", O_RDONLY|O_CLOEXEC) = 4
open("/etc/host.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/hosts", O_RDONLY|O_CLOEXEC)  = 4
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 4
open("/lib/x86_64-linux-gnu/libnss_dns.so.2", O_RDONLY|O_CLOEXEC) = 4
open("/lib/x86_64-linux-gnu/libresolv.so.2", O_RDONLY|O_CLOEXEC) = 4
PING google.com (216.58.204.46) 56(84) bytes of data.
open("/etc/hosts", O_RDONLY|O_CLOEXEC)  = 4
64 bytes from lhr25s12-in-f14.1e100.net (216.58.204.46): icmp_seq=1 ttl=63 time=13.0 ms
[...]
```

and the same for `host`:

```
$ strace -e trace=open -f host google.com
[...]
[pid  9869] open("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/libdst.cat", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  9869] open("/usr/share/locale/en/libdst.cat", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  9869] open("/usr/share/locale/en/LC_MESSAGES/libdst.cat", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  9869] open("/usr/lib/ssl/openssl.cnf", O_RDONLY) = 6
[pid  9869] open("/usr/lib/x86_64-linux-gnu/openssl-1.0.0/engines/libgost.so", O_RDONLY|O_CLOEXEC) = 6[pid  9869] open("/etc/resolv.conf", O_RDONLY) = 6
google.com has address 216.58.204.46
[...]
```

You can see that while my `ping` looks at `nsswitch.conf`, `host` does not. And they both look at `/etc/resolv.conf`.

We’re going to take these two `.conf` files in turn.

* * *

### 2) NSSwitch, and `/etc/nsswitch.conf`

We’ve established that applications can do what they like when they decide which DNS server to go to. Many apps (like `ping`) above can refer (depending on the implementation (*)) to NSSwitch via its config file `/etc/nsswitch.conf`.

###### (*) There’s a surprising degree of variation in
ping implementations. That’s a rabbit-hole I
 _didn’t_  want to get lost in.

NSSwitch is not just for DNS lookups. It’s also used for passwords and user lookup information (for example).

NSSwitch was originally created as part of the Solaris OS to allow applications to not have to hard-code which file or service they look these things up on, but defer them to this other configurable centralised place they didn’t have to worry about.

Here’s my `nsswitch.conf`:

```
passwd:         compat
group:          compat
shadow:         compat
gshadow:        files
hosts: files dns myhostname
networks:       files
protocols:      db files
services:       db files
ethers:         db files
rpc:            db files
netgroup:       nis
```

The ‘hosts’ line is the one we’re interested in. We’ve shown that `ping` cares about `nsswitch.conf` so let’s fiddle with it and see how we can mess with `ping`.

*   ### Set `nsswitch.conf` to only look at ‘files’

If you set the `hosts` line in `nsswitch.conf` to be ‘just’ `files`:

`hosts: files`

Then a `ping` to google.com will now fail:

```
$ ping -c1 google.com
ping: unknown host google.com
```

but `localhost` still works:

```
$ ping -c1 localhost
PING localhost (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.039 ms
```

and using `host` still works fine:

```
$ host google.com
google.com has address 216.58.206.110
```

since, as we saw, it doesn’t care about `nsswitch.conf`

*   ### Set `nsswitch.conf` to only look at ‘dns’

If you set the `hosts` line in `nsswitch.conf` to be ‘just’ dns:

`hosts: dns`

Then a `ping` to google.com will now succeed again:

```
$ ping -c1 google.com
PING google.com (216.58.198.174) 56(84) bytes of data.
64 bytes from lhr25s10-in-f174.1e100.net (216.58.198.174): icmp_seq=1 ttl=63 time=8.01 ms
```

But `localhost` is not found this time:

```
$ ping -c1 localhost
ping: unknown host localhost
```

Here’s a diagram of what’s going on with NSSwitch by default wrt `hosts` lookup:

* * *

![linux-dns-2 (1)](https://zwischenzugs.files.wordpress.com/2018/06/linux-dns-2-11.png?w=525)

 _My default ‘`hosts:`‘ configuration in `nsswitch.conf`_ 

* * *

### 3) `/etc/resolv.conf`

We’ve seen now that `host` and `ping` both look at this `/etc/resolv.conf` file.

Here’s what my `/etc/resolv.conf` looks like:

```
# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
nameserver 10.0.2.3
```

Ignore the first two lines – we’ll come back to those (they are significant, but you’re not ready for that ball of wool yet).

The `nameserver` lines specify the DNS servers to look up the host for.

If you hash out that line:

```
#nameserver 10.0.2.3
```

and run:

```
$ ping -c1 google.com
ping: unknown host google.com
```

it fails, because there’s no nameserver to go to (*).

###### * Another rabbit hole: `host` appears to fall back to
127.0.0.1:53 if there’s no nameserver specified.

This file takes other options too. For example, if you add this line to the `resolv.conf` file:

```
search com
```

and then `ping google` (sic)

```
$ ping google
PING google.com (216.58.204.14) 56(84) bytes of data.
```

it will try the `.com` domain automatically for you.

### End of Part I

That’s the end of Part I. The next part will start by looking at how that resolv.conf gets created and updated.

Here’s what you covered above:

*   There’s no ‘DNS lookup’ call in the OS

*   Different programs figure out the IP of an address in different ways
    *   For example, `ping` uses `nsswitch`, which in turn uses (or can use) `/etc/hosts`, `/etc/resolv.conf` and its own hostname to get the result

*   `/etc/resolv.conf` helps decide:
    *   which addresses get called

    *   which DNS server to look up

If you thought that was complicated, buckle up…

--------------------------------------------------------------------------------

via: https://zwischenzugs.com/2018/06/08/anatomy-of-a-linux-dns-lookup-part-i/

作者：[dmatech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/dmatech2
[1]:https://zwischenzugs.com/2018/06/18/anatomy-of-a-linux-dns-lookup-part-ii/
[2]:http://man7.org/linux/man-pages/man3/getaddrinfo.3.html
[3]:https://zwischenzugs.com/2017/10/31/a-complete-chef-infrastructure-on-your-laptop/
[4]:https://zwischenzugs.com/2017/03/04/a-complete-openshift-cluster-on-vagrant-step-by-step/
[5]:https://zwischenzugs.com/2017/03/04/migrating-an-openshift-etcd-cluster/
[6]:https://zwischenzugs.com/2017/03/04/1-minute-multi-node-vm-setup/
[7]:https://zwischenzugs.com/2017/03/18/clustered-vm-testing-how-to/
[8]:https://zwischenzugs.com/2017/10/27/ten-things-i-wish-id-known-before-using-vagrant/
[9]:https://zwischenzugs.com/2017/10/21/openshift-3-6-dns-in-pictures/
[10]:https://github.com/ianmiell/shutit-linux-dns/blob/master/linux_dns.py
