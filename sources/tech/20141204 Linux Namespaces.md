[bazz2222222222]
Linux Namespaces
================================================================================
### Background ###

Starting from kernel 2.6.24, Linux supports 6 different types of namespaces. Namespaces are useful in creating processes that are more isolated from the rest of the system, without needing to use full low level virtualization technology. 

- **CLONE_NEWIPC**: IPC Namespaces: SystemV IPC and POSIX Message Queues can be isolated.
- **CLONE_NEWPID**: PID Namespaces: PIDs are isolated, meaning that a virtual PID inside of the namespace can conflict with a PID outside of the namespace. PIDs inside the namespace will be mapped to other PIDs outside of the namespace. The first PID inside the namespace will be '1' which outside of the namespace is assigned to init
- **CLONE_NEWNET**: Network Namespaces: Networking (/proc/net, IPs, interfaces and routes) are isolated. Services can be run on the same ports within namespaces, and "duplicate" virtual interfaces can be created.
- **CLONE_NEWNS**: Mount Namespaces. We have the ability to isolate mount points as they appear to processes. Using mount namespaces, we can achieve similar functionality to chroot() however with improved security.
- **CLONE_NEWUTS**: UTS Namespaces. This namespaces primary purpose is to isolate the hostname and NIS name.
- **CLONE_NEWUSER**: User Namespaces. Here, user and group IDs are different inside and outside of namespaces and can be duplicated.

Let's look first at the structure of a C program, required to demonstrate process namespaces. The following has been tested on Debian 6 and 7. First, we need to allocate a page of memory on the stack, and set a pointer to the end of that memory page. We use **alloca** to allocate stack memory rather than malloc which would allocate memory on the heap. 

    void *mem = alloca(sysconf(_SC_PAGESIZE)) + sysconf(_SC_PAGESIZE);

Next, we use **clone** to create a child process, passing the location of our child stack 'mem', as well as the required flags to specify a new namespace. We specify 'callee' as the function to execute within the child space:

    mypid = clone(callee, mem, SIGCHLD | CLONE_NEWIPC | CLONE_NEWPID | CLONE_NEWNS | CLONE_FILES, NULL);

After calling **clone** we then wait for the child process to finish, before terminating the parent. If not, the parent execution flow will continue and terminate immediately after, clearing up the child with it:

    while (waitpid(mypid, &r, 0) < 0 && errno == EINTR)
    {
    	continue;
    }

Lastly, we'll return to the shell with the exit code of the child:

    if (WIFEXITED(r))
    {
    	return WEXITSTATUS(r);
    }
    return EXIT_FAILURE;

Now, let's look at the **callee** function:

    static int callee()
    {
    	int ret;
    	mount("proc", "/proc", "proc", 0, "");
    	setgid(u);
    	setgroups(0, NULL);
    	setuid(u);
    	ret = execl("/bin/bash", "/bin/bash", NULL);
    	return ret;
    }

Here, we mount a **/proc** filesystem, and then set the uid (User ID) and gid (Group ID) to the value of 'u' before spawning the **/bin/bash** shell. [LXC][1] is an OS level virtualization tool utilizing cgroups and namespaces for resource isolation. Let's put it all together, setting 'u' to 65534 which is user "nobody" and group "nogroup" on Debian:

    #define _GNU_SOURCE
    #include <unistd.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <sys/types.h>
    #include <sys/wait.h>
    #include <sys/mount.h>
    #include <grp.h>
    #include <alloca.h>
    #include <errno.h>
    #include <sched.h>
    static int callee();
    const int u = 65534;
    int main(int argc, char *argv[])
    {
    	int r;
    	pid_t mypid;
    	void *mem = alloca(sysconf(_SC_PAGESIZE)) + sysconf(_SC_PAGESIZE);
    	mypid = clone(callee, mem, SIGCHLD | CLONE_NEWIPC | CLONE_NEWPID | CLONE_NEWNS | CLONE_FILES, NULL);
    	while (waitpid(mypid, &r, 0) < 0 && errno == EINTR)
    	{
    		continue;
    	}
    	if (WIFEXITED(r))
    	{
    		return WEXITSTATUS(r);
    	}
    	return EXIT_FAILURE;
    }
    static int callee()
    {
    	int ret;
    	mount("proc", "/proc", "proc", 0, "");
    	setgid(u);
    	setgroups(0, NULL);
    	setuid(u);
    	ret = execl("/bin/bash", "/bin/bash", NULL);
    	return ret;
    }

To execute the code produces the following:

    root@w:~/pen/tmp# gcc -O -o ns.c -Wall -Werror -ansi -c89 ns.c
    root@w:~/pen/tmp# ./ns
    nobody@w:~/pen/tmp$ id
    uid=65534(nobody) gid=65534(nogroup)
    nobody@w:~/pen/tmp$ ps auxw
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    nobody       1  0.0  0.0   4620  1816 pts/1    S    21:21   0:00 /bin/bash
    nobody       5  0.0  0.0   2784  1064 pts/1    R+   21:21   0:00 ps auxw
    nobody@w:~/pen/tmp$ 

Notice that the UID and GID are set to that of nobody and nogroup. Specifically notice that the full ps output shows only two running processes and that their PIDs are 1 and 5 respectively. Now, let's move on to using ip netns to work with network namespaces. First, let's confirm that no namespaces exist currently: 

    root@w:~# ip netns list
    Object "netns" is unknown, try "ip help".

In this case, either ip needs an upgrade, or the kernel does. Assuming you have a kernel newer than 2.6.24, it's most likely **ip**. After upgrading, **ip netns list** should by default return nothing. Let's add a new namespace called 'ns1': 

    root@w:~# ip netns add ns1
    root@w:~# ip netns list
    ns1

First, let's list the current interfaces:

    root@w:~# ip link list
    1: lo:  mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: eth0:  mtu 1500 qdisc pfifo_fast state UNKNOWN mode DEFAULT qlen 1000
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff

Now to create a new virtual interface, and add it to our new namespace. Virtual interfaces are created in pairs, and are linked to each other - imagine a virtual crossover cable:

    root@w:~# ip link add veth0 type veth peer name veth1
    root@w:~# ip link list
    1: lo:  mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: eth0:  mtu 1500 qdisc pfifo_fast state UNKNOWN mode DEFAULT qlen 1000
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff
    3: veth1:  mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
        link/ether d2:e9:52:18:19:ab brd ff:ff:ff:ff:ff:ff
    4: veth0:  mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
        link/ether f2:f7:5e:e2:22:ac brd ff:ff:ff:ff:ff:ff

**ifconfig** -a will also now show the addition of both veth0 and veth1. 

Great, now to assign our new interfaces to the namespace. Note that ip **netns exec** is used to execute commands within the namespace:

    root@w:~# ip link set veth1 netns ns1
    root@w:~# ip netns exec ns1 ip link list
    1: lo:  mtu 65536 qdisc noop state DOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    3: veth1:  mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
    link/ether d2:e9:52:18:19:ab brd ff:ff:ff:ff:ff:ff

**ifconfig** -a will now only show veth0, as veth1 is in the ns1 namespace. 

Should we want to delete veth0/veth1:

    ip netns exec ns1 ip link del veth1

We can now assign IP address 192.168.5.5/24 to veth0 on our host:

    ifconfig veth0 192.168.5.5/24

And assign veth1 192.168.5.10/24 within ns1:

    ip netns exec ns1 ifconfig veth1 192.168.5.10/24 up

To execute ip addr **list** on both our host and within our namespace:

    root@w:~# ip addr list
    1: lo:  mtu 65536 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: eth0:  mtu 1500 qdisc pfifo_fast state UNKNOWN qlen 1000
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff
        inet 192.168.3.122/24 brd 192.168.3.255 scope global eth0
        inet6 fe80::20c:29ff:fe65:259e/64 scope link 
           valid_lft forever preferred_lft forever
    6: veth0:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 86:b2:c7:bd:c9:11 brd ff:ff:ff:ff:ff:ff
        inet 192.168.5.5/24 brd 192.168.5.255 scope global veth0
        inet6 fe80::84b2:c7ff:febd:c911/64 scope link 
           valid_lft forever preferred_lft forever
    root@w:~# ip netns exec ns1 ip addr list
    1: lo:  mtu 65536 qdisc noop state DOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    5: veth1:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 12:bd:b6:76:a6:eb brd ff:ff:ff:ff:ff:ff
        inet 192.168.5.10/24 brd 192.168.5.255 scope global veth1
        inet6 fe80::10bd:b6ff:fe76:a6eb/64 scope link 
           valid_lft forever preferred_lft forever

To view routing tables inside and outside of the namespace:

    root@w:~# ip route list
    default via 192.168.3.1 dev eth0  proto static 
    192.168.3.0/24 dev eth0  proto kernel  scope link  src 192.168.3.122 
    192.168.5.0/24 dev veth0  proto kernel  scope link  src 192.168.5.5 
    root@w:~# ip netns exec ns1 ip route list
    192.168.5.0/24 dev veth1  proto kernel  scope link  src 192.168.5.10 

Lastly, to connect our physical and virtual interfaces, we'll require a bridge. Let's bridge eth0 and veth0 on the host, and then use DHCP to gain an IP within the ns1 namespace:

    root@w:~# brctl addbr br0
    root@w:~# brctl addif br0 eth0
    root@w:~# brctl addif br0 veth0
    root@w:~# ifconfig eth0 0.0.0.0
    root@w:~# ifconfig veth0 0.0.0.0
    root@w:~# dhclient br0
    root@w:~# ip addr list br0
    7: br0:  mtu 1500 qdisc noqueue state UP 
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff
        inet 192.168.3.122/24 brd 192.168.3.255 scope global br0
        inet6 fe80::20c:29ff:fe65:259e/64 scope link 
           valid_lft forever preferred_lft forever

br0 has been assigned an IP of 192.168.3.122/24. Now for the namespace:

    root@w:~# ip netns exec ns1 dhclient veth1
    root@w:~# ip netns exec ns1 ip addr list
    1: lo:  mtu 65536 qdisc noop state DOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    5: veth1:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 12:bd:b6:76:a6:eb brd ff:ff:ff:ff:ff:ff
        inet 192.168.3.248/24 brd 192.168.3.255 scope global veth1
        inet6 fe80::10bd:b6ff:fe76:a6eb/64 scope link 
           valid_lft forever preferred_lft forever

Excellent! veth1 has been assigned 192.168.3.248/24

--------------------------------------------------------------------------------

via: http://www.howtoforge.com/linux-namespaces

作者：[aziods][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.howtoforge.com/forums/private.php?do=newpm&u=138952
[1]:http://en.wikipedia.org/wiki/LXC
