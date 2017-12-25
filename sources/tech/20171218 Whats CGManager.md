translating---geekpi

What's CGManager?[][1]
============================================================

CGManager is a central privileged daemon that manages all your cgroups for you through a simple D-Bus API. It's designed to work with nested LXC containers as well as accepting unprivileged requests including resolving user namespaces UIDs/GIDs.

# Components[][2]

### cgmanager[][3]

This daemon runs on the host, mounts cgroupfs into a separate mount namespace (so it's invisible from the host), binds /sys/fs/cgroup/cgmanager/sock for incoming D-Bus queries and generally handles all clients running directly on the host.

cgmanager accepts both authentication requests using D-Bus + SCM credentials used for translation of uid, gid and pid across namespaces or using simple "unauthenticated" (just the initial ucred) D-Bus for queries coming from the host level.

### cgproxy[][4]

You may see this daemon run in two cases. On the host if your kernel is older than 3.8 (doesn't have pidns attach support) or in containers (where only cgproxy runs).

cgproxy doesn't itself do any cgroup configuration change but instead as its name indicates, proxies requests to the main cgmanager process.

This is necessary so a process may talk to /sys/fs/cgroup/cgmanager/sock using straight D-Bus (for example using dbus-send).

cgproxy will then catch the ucred from that query and do an authenticated SCM query to the real cgmanager socket, passing the arguments through ucred structs so that they get properly translated into something cgmanager in the host namespace can understand.

### cgm[][5]

A simple command line tool which talks to the D-Bus service and lets you perform all the usual cgroup operations from the command line.

# Communication protocol[][6]

As mentioned above, cgmanager and cgproxy use D-Bus. It's recommended that external clients (so not cgproxy itself) use the standard D-Bus API and do not attempt to implement the SCM creds protocol as it's unnecessary and easy to get wrong.

Instead, simply assume that talking to /sys/fs/cgroup/cgmanager/sock will always do the right thing.

The cgmanager API is only available on that separate D-Bus socket, cgmanager itself doesn't attach to the system bus and so a running dbus daemon isn't a requirement of cgmanager/cgproxy.

You can read more about the D-Bus API [here][7].

# Licensing[][8]

CGManager is free software, most of the code is released under the terms of the GNU LGPLv2.1+ license, some binaries are released under the GNU GPLv2 license.

The default license for the project is the GNU LGPLv2.1+.

# Support[][9]

CGManager's stable release support relies on the Linux distributions and their own commitment to pushing stable fixes and security updates.

Commercial support for CGManager on Ubuntu LTS releases can be obtained from [Canonical Ltd][10].

--------------------------------------------------------------------------------

via: https://linuxcontainers.org/cgmanager/introduction/

作者：[Canonical Ltd. ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.canonical.com/
[1]:https://linuxcontainers.org/cgmanager/introduction/#whats-cgmanager
[2]:https://linuxcontainers.org/cgmanager/introduction/#components
[3]:https://linuxcontainers.org/cgmanager/introduction/#cgmanager
[4]:https://linuxcontainers.org/cgmanager/introduction/#cgproxy
[5]:https://linuxcontainers.org/cgmanager/introduction/#cgm
[6]:https://linuxcontainers.org/cgmanager/introduction/#communication-protocol
[7]:https://linuxcontainers.org/cgmanager/dbus-api/
[8]:https://linuxcontainers.org/cgmanager/introduction/#licensing
[9]:https://linuxcontainers.org/cgmanager/introduction/#support
[10]:http://www.canonical.com/
