Setting Up NFS Server with Kerberos-based Authentication for Linux Clients – Part 7
================================================================================
In the last article of this series, we reviewed [how to set up a Samba share over a network][1] that may consist of multiple types of operating systems. Now, if you need to set up file sharing for a group of Unix-like clients you will automatically think of the Network File System, or NFS for short.

![Setting Up NFS Server with Kerberos Authentication](http://www.tecmint.com/wp-content/uploads/2015/09/Setting-Kerberos-Authentication-with-NFS.jpg)

RHCE Series: Setting Up NFS Server with Kerberos Authentication – Part 7

In this article we will walk you through the process of using Kerberos-based authentication for NFS shares. It is assumed that you already have set up a NFS server and a client. If not, please refer to [install and configure NFS server][2] – which will list the necessary packages that need to be installed and explain how to perform initial configurations on the server before proceeding further.

In addition, you will want to configure both [SELinux][3] and [firewalld][4] to allow for file sharing through NFS.

The following example assumes that your NFS share is located in /nfs in box2:

    # semanage fcontext -a -t public_content_rw_t "/nfs(/.*)?"
    # restorecon -R /nfs
    # setsebool -P nfs_export_all_rw on
    # setsebool -P nfs_export_all_ro on

(where the -P flag indicates persistence across reboots).

Finally, don’t forget to:

#### Create NFS Group and Configure NFS Share Directory ####

1. Create a group called nfs and add the nfsnobody user to it, then change the permissions of the /nfs directory to 0770 and its group owner to nfs. Thus, nfsnobody (which is mapped to the client requests) will have write permissions on the share) and you won’t need to use no_root_squash in the /etc/exports file.

    # groupadd nfs
    # usermod -a -G nfs nfsnobody
    # chmod 0770 /nfs
    # chgrp nfs /nfs

2. Modify the exports file (/etc/exports) as follows to only allow access from box1 using Kerberos security (sec=krb5).

**Note**: that the value of anongid has been set to the GID of the nfs group that we created previously:

**exports – Add NFS Share**

----------

    /nfs box1(rw,sec=krb5,anongid=1004)

3. Re-export (-r) all (-a) the NFS shares. Adding verbosity to the output (-v) is a good idea since it will provide helpful information to troubleshoot the server if something goes wrong:

    # exportfs -arv

4. Restart and enable the NFS server and related services. Note that you don’t have to enable nfs-lock and nfs-idmapd because they will be automatically started by the other services on boot:

    # systemctl restart rpcbind nfs-server nfs-lock nfs-idmap
    # systemctl enable rpcbind nfs-server

#### Testing Environment and Other Prerequisites ####

In this guide we will use the following test environment:

- Client machine [box1: 192.168.0.18]
- NFS / Kerberos server [box2: 192.168.0.20] (also known as Key Distribution Center, or KDC for short).

**Note**: that Kerberos service is crucial to the authentication scheme.

As you can see, the NFS server and the KDC are hosted in the same machine for simplicity, although you can set them up in separate machines if you have more available. Both machines are members of the `mydomain.com` domain.

Last but not least, Kerberos requires at least a basic schema of name resolution and the [Network Time Protocol][5] service to be present in both client and server since the security of Kerberos authentication is in part based upon the timestamps of tickets.

To set up name resolution, we will use the /etc/hosts file in both client and server:

**host file – Add DNS for Domain**

----------

    192.168.0.18    box1.mydomain.com    box1
    192.168.0.20    box2.mydomain.com    box2

In RHEL 7, chrony is the default software that is used for NTP synchronization:

    # yum install chrony
    # systemctl start chronyd
    # systemctl enable chronyd

To make sure chrony is actually synchronizing your system’s time with time servers you may want to issue the following command two or three times and make sure the offset is getting nearer to zero:

    # chronyc tracking

![Synchronize Server Time with Chrony](http://www.tecmint.com/wp-content/uploads/2015/09/Synchronize-Time-with-Chrony.png)

Synchronize Server Time with Chrony

### Installing and Configuring Kerberos ###

To set up the KDC, install the following packages on both server and client (omit the server package in the client):

    # yum update && yum install krb5-server krb5-workstation pam_krb5

Once it is installed, edit the configuration files (/etc/krb5.conf and /var/kerberos/krb5kdc/kadm5.acl) and replace all instances of example.com (lowercase and uppercase) with `mydomain.com` as follows.

Next, enable Kerberos through the firewall and start / enable the related services.

**Important**: nfs-secure must be started and enabled on the client as well:

    # firewall-cmd --permanent --add-service=kerberos
    # systemctl start krb5kdc kadmin nfs-secure   
    # systemctl enable krb5kdc kadmin nfs-secure       

Now create the Kerberos database (please note that this may take a while as it requires a some level of entropy in your system. To speed things up, I opened another terminal and ran ping -f localhost for 30-45 seconds):

    # kdb5_util create -s

![Create Kerberos Database](http://www.tecmint.com/wp-content/uploads/2015/09/Create-Kerberos-Database.png)

Create Kerberos Database

Next, using the kadmin.local tool, create an admin principal for root:

    # kadmin.local
    # addprinc root/admin

And add the Kerberos server to the database:

    # addprinc -randkey host/box2.mydomain.com

Same with the NFS service for both client (box1) and server (box2). Please note that in the screenshot below I forgot to do it for box1 before quitting:

    # addprinc -randkey nfs/box2.mydomain.com
    # addprinc -randkey nfs/box1.mydomain.com

And exit by typing quit and pressing Enter:

![Add Kerberos to NFS Server](http://www.tecmint.com/wp-content/uploads/2015/09/Create-Kerboros-for-NFS.png)

Add Kerberos to NFS Server

Then obtain and cache Kerberos ticket-granting ticket for root/admin:

    # kinit root/admin
    # klist

![Cache Kerberos](http://www.tecmint.com/wp-content/uploads/2015/09/Cache-kerberos-Ticket.png)

Cache Kerberos

The last step before actually using Kerberos is storing into a keytab file (in the server) the principals that are authorized to use Kerberos authentication:

    # kdadmin.local
    # ktadd host/box2.mydomain.com
    # ktadd nfs/box2.mydomain.com
    # ktadd nfs/box1.mydomain.com

Finally, mount the share and perform a write test:

    # mount -t nfs4 -o sec=krb5 box2:/nfs /mnt
    # echo "Hello from Tecmint.com" > /mnt/greeting.txt

![Mount NFS Share](http://www.tecmint.com/wp-content/uploads/2015/09/Mount-NFS-Share.png)

Mount NFS Share

Let’s now unmount the share, rename the keytab file in the client (to simulate it’s not present) and try to mount the share again:

    # umount /mnt
    # mv /etc/krb5.keytab /etc/krb5.keytab.orig

![Mount Unmount Kerberos NFS Share](http://www.tecmint.com/wp-content/uploads/2015/09/Mount-Unmount-Kerberos-NFS-Share.png)

Mount Unmount Kerberos NFS Share

Now you can use the NFS share with Kerberos-based authentication.

### Summary ###

In this article we have explained how to set up NFS with Kerberos authentication. Since there is much more to the topic than we can cover in a single guide, feel free to check the online [Kerberos documentation][6] and since Kerberos is a bit tricky to say the least, don’t hesitate to drop us a note using the form below if you run into any issue or need help with your testing or implementation.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/setting-up-nfs-server-with-kerberos-based-authentication/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/setup-samba-file-sharing-for-linux-windows-clients/
[2]:http://www.tecmint.com/configure-nfs-server/
[3]:http://www.tecmint.com/selinux-essentials-and-control-filesystem-access/
[4]:http://www.tecmint.com/firewalld-rules-for-centos-7/
[5]:http://www.tecmint.com/install-ntp-server-in-centos/
[6]:http://web.mit.edu/kerberos/krb5-1.12/doc/admin/admin_commands/