> translating by rieonke
Containing System Services in Red Hat Enterprise Linux – Part 1
============================================================


At the 2017 Red Hat Summit, several people asked me “We normally use full VMs to separate network services like DNS and DHCP, can we use containers instead?”. The answer is yes, and here’s an example of how to create a system container in Red Hat Enterprise Linux 7 today.   

### **THE GOAL**

####  _Create a network service that can be updated independently of any other services of the system, yet easily managed and updated from the host._ 

Let’s explore setting up a BIND server running under systemd in a container. In this part, we’ll look at building our container, as well as managing the BIND configuration and data files.

In Part Two, we’ll look at how systemd on the host integrates with systemd in the container. We’ll explore managing the service in the container, and enabling it as a service on the host.

### **CREATING THE BIND CONTAINER**

To get systemd working inside a container easily, we first need to add two packages on the host: `oci-register-machine` and `oci-systemd-hook`. The `oci-systemd-hook` hook allows us to run systemd in a container without needing to use a privileged container or manually configuring tmpfs and cgroups. The `oci-register-machine` hook allows us to keep track of the container with the systemd tools like `systemctl` and `machinectl`.

```
[root@rhel7-host ~]# yum install oci-register-machine oci-systemd-hook
```

On to creating our BIND container. The [Red Hat Enterprise Linux 7 base image][6]  includes systemd as an init system. We can install and enable BIND the same way we would on a typical system. You can [download this Dockerfile from the git repository][7] in the Resources.

```
[root@rhel7-host bind]# vi Dockerfile

# Dockerfile for BIND
FROM registry.access.redhat.com/rhel7/rhel
ENV container docker
RUN yum -y install bind && \
    yum clean all && \
    systemctl enable named
STOPSIGNAL SIGRTMIN+3
EXPOSE 53
EXPOSE 53/udp
CMD [ "/sbin/init" ]
```

Since we’re starting with an init system as PID 1, we need to change the signal sent by the docker CLI when we tell the container to stop. From the `kill` system call man pages (`man 2 kill`):

```
The only signals that can be sent to process ID 1, the init 
process, are those for which init has explicitly installed 
signal handlers. This is done to assure the system is not 
brought down accidentally.
```

For the systemd signal handlers, `SIGRTMIN+3` is the signal that corresponds to `systemd start halt.target`. We also expose both TCP and UDP ports for BIND, since both protocols could be in use.

### **MANAGING DATA**

With a functional BIND service, we need a way to manage the configuration and zone files. Currently those are inside the container, so we  _could_  enter the container any time we wanted to update the configs or make a zone file change. This isn’t ideal from a management perspective.  We’ll need to rebuild the container when we need to update BIND, so changes in the images would be lost. Having to enter the container any time we need to update a file or restart the service adds steps and time.

Instead, we’ll extract the configuration and data files from the container and copy them to the host, then mount them at run time. This way we can easily restart or rebuild the container without losing changes. We can also modify configs and zones by using an editor outside of the container. Since this container data looks like “ _site-specific data served by this system_ ”, let’s follow the File System Hierarchy and create `/srv/named` on the local host to maintain administrative separation.

```
[root@rhel7-host ~]# mkdir -p /srv/named/etc

[root@rhel7-host ~]# mkdir -p /srv/named/var/named
```

#####  _NOTE: If you are migrating an existing configuration, you can skip the following step and copy it directly to the`/srv/named` directories. You may still want to check the container assigned GID with a temporary container._ 

Let’s build and run an temporary container to examine BIND. With a init process as PID 1, we can’t run the container interactively to get a shell. We’ll exec into it after it launches, and check for important files with `rpm`.

```
[root@rhel7-host ~]# docker build -t named . 

[root@rhel7-host ~]# docker exec -it $( docker run -d named ) /bin/bash

[root@0e77ce00405e /]# rpm -ql bind
```

For this example, we’ll need `/etc/named.conf` and everything under `/var/named/`. We can extract these with `machinectl`. If there’s more than one container registered, we can see what’s running in any machine with `machinectl status`. Once we have the configs we can stop the temporary container.

 _There’s also a[ sample `named.conf` and zone files for `example.com` in the Resources][2] if you prefer._ 

```
[root@rhel7-host bind]# machinectl list

MACHINE                          CLASS     SERVICE
8824c90294d5a36d396c8ab35167937f container docker 

[root@rhel7-host ~]# machinectl copy-from 8824c90294d5a36d396c8ab35167937f /etc/named.conf /srv/named/etc/named.conf

[root@rhel7-host ~]# machinectl copy-from 8824c90294d5a36d396c8ab35167937f /var/named /srv/named/var/named

[root@rhel7-host ~]# docker stop infallible_wescoff
```

### **FINAL CREATION**

To create and run the final container, add the volume options to mount:

*   file `/srv/named/etc/named.conf` as `/etc/named.conf`

*   directory `/srv/named/var/named` as `/var/named`

Since this is our final container, we’ll also provide a meaningful name that we can refer to later.

```
[root@rhel7-host ~]# docker run -d -p 53:53 -p 53:53/udp -v /srv/named/etc/named.conf:/etc/named.conf:Z -v /srv/named/var/named:/var/named:Z --name named-container named
```

With the final container running, we can modify the local configs to change the behavior of BIND in the container. The BIND server will need to listen on any IP that the container might be assigned. Be sure the GID of any new file matches the rest of the BIND files from the container. 

```
[root@rhel7-host bind]# cp named.conf /srv/named/etc/named.conf 

[root@rhel7-host ~]# cp example.com.zone /srv/named/var/named/example.com.zone

[root@rhel7-host ~]# cp example.com.rr.zone  /srv/named/var/named/example.com.rr.zone
```

> [Curious why I didn’t need to change SELinux context on the host directories?][3]

We’ll reload the config by exec’ing the `rndc` binary provided by the container. We can use `journald` in the same fashion to check the BIND logs. If you run into errors, you can edit the file on the host, and reload the config. Using `host` or `dig` on the host, we can check the responses from the contained service for example.com.

```
[root@rhel7-host ~]# docker exec -it named-container rndc reload       
server reload successful

[root@rhel7-host ~]# docker exec -it named-container journalctl -u named -n
-- Logs begin at Fri 2017-05-12 19:15:18 UTC, end at Fri 2017-05-12 19:29:17 UTC. --
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: 9.E.F.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: A.E.F.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: B.E.F.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: 8.B.D.0.1.0.0.2.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: reloading configuration succeeded
May 12 19:29:17 ac1752c314a7 named[27]: reloading zones succeeded
May 12 19:29:17 ac1752c314a7 named[27]: zone 1.0.10.in-addr.arpa/IN: loaded serial 2001062601
May 12 19:29:17 ac1752c314a7 named[27]: zone 1.0.10.in-addr.arpa/IN: sending notifies (serial 2001062601)
May 12 19:29:17 ac1752c314a7 named[27]: all zones loaded
May 12 19:29:17 ac1752c314a7 named[27]: running

[root@rhel7-host bind]# host www.example.com localhost
Using domain server:
Name: localhost
Address: ::1#53
Aliases: 
www.example.com is an alias for server1.example.com.
server1.example.com is an alias for mail
```

> [Did your zone file not update? It might be your editor not the serial number.][4]

### THE FINISH LINE (?)

We’ve got what we set out to accomplish. DNS requests and zones are being served from a container. We’ve got a persistent location to manage data and configurations across updates.  

In Part 2 of this series, we’ll see how to treat the container as a normal service on the host.

* * *

 _[Follow the RHEL Blog][5] to receive updates on Part 2 of this series and other new posts via email._ 

* * *

###  _**Additional Resources:**_  

#### GitHub repository for accompanying files:  [https://github.com/nzwulfin/named-container][8]

#### **SIDEBAR 1: ** _SELinux context on local files accessed by a container_ 

You may have noticed that when I copied the files from the container to the local host, I didn’t run a `chcon` to change the files on the host to type `svirt_sandbox_file_t`.  Why didn’t it break? Copying a file into `/srv` should have made that file label type `var_t`. Did I `setenforce 0`?

Of course not, that would make Dan Walsh cry.  And yes, `machinectl` did indeed set the label type as expected, take a look:

Before starting the container:

```
[root@rhel7-host ~]# ls -Z /srv/named/etc/named.conf

-rw-r-----. unconfined_u:object_r:var_t:s0   /srv/named/etc/named.conf
```

No, I used a volume option in run that makes Dan Walsh happy, `:Z`.  This part of the command `-v /srv/named/etc/named.conf:/etc/named.conf:Z` does two things: first it says this needs to be relabeled with a private volume SELinux label, and second it says to mount it read / write.

After starting the container:

```
[root@rhel7-host ~]# ls -Z /srv/named/etc/named.conf 

-rw-r-----. root 25 system_u:object_r:svirt_sandbox_file_t:s0:c821,c956 /srv/named/etc/named.conf
```

#### **SIDEBAR 2: ** _VIM backup behavior can change inodes_ 

If you made the edits to the config file with `vim` on the local host and you aren’t seeing the changes in the container, you may have inadvertently created a new file that the container isn’t aware of. There are three `vim` settings that affect backup copies during editing: backup, writebackup, and backupcopy.

I’ve snipped out the defaults that apply for RHEL 7 from the official VIM backup_table [http://vimdoc.sourceforge.net/htmldoc/editing.html#backup-table]

```
backup    writebackup

   off      on backup current file, deleted afterwards (default)
```

So we don’t create tilde copies that stick around, but we are creating backups. The other setting is backupcopy, where `auto` is the shipped default:

```
"yes" make a copy of the file and overwrite the original one
 "no" rename the file and write a new one
 "auto" one of the previous, what works best
```

This combo means that when you edit a file, unless `vim` sees a reason not to (check the docs for the logic) you will end up with a new file that contains your edits, which will be renamed to the original filename when you save. This means the file gets a new inode. For most situations this isn’t a problem, but here the bind mount into the container *is* senstive to inode changes. To solve this, you need to change the backupcopy behavior.

Either in the `vim` session or in your `.vimrc`, add `set backupcopy=yes`. This will make sure the original file gets truncated and overwritten, preserving the inode and propagating the changes into the container.

--------------------------------------------------------------------------------

via: http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/

作者：[Matt Micene ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/
[1]:http://rhelblog.redhat.com/author/mmicenerht/
[2]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#repo
[3]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#sidebar_1
[4]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#sidebar_2
[5]:http://redhatstackblog.wordpress.com/feed/
[6]:https://access.redhat.com/containers
[7]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#repo
[8]:https://github.com/nzwulfin/named-container
