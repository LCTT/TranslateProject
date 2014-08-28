    Vic020

How to configure Access Control Lists (ACLs) on Linux
================================================================================
Working with permissions on Linux is rather a simple task. You can define permissions for users, groups or others. This works really well when you work on a desktop PC or a virtual Linux instance which typically doesn't have a lot of users, or when users don't share files among themselves. However, what if you are a big organization where you operate NFS or Samba servers for diverse users. Then you will need to be neat picky and set up more complex configurations and permissions to meet the requirements of your organization.

Linux (and other Unixes, that are POSIX compliant) has so-called Access Control Lists (ACLs), which are a way to assign permissions beyond the common paradigm. For example, by default you apply three permission groups: owner, group, and others. With ACLs, you can add permissions for other users or groups that are not simple "others" or any other group that the owner is not part of it. You can allow particular users A, B and C to have write permissions without letting their whole group to have writing permission.

ACLs are available for a variety of Linux filesystems including ext2, ext3, ext4, XFS, Btfrs, etc. If you are not sure if the filesystem you are using supports ACLs, just read the documentation.

### Enable ACLs on your Filesystem ###

First of all, we need to install the tools to manage ACLs.

On Ubuntu/Debian:

    $ sudo apt-get install acl

On CentOS/Fedora/RHEL:

    # yum -y install acl

On Archlinux:

    # pacman -S acl

For demonstration purpose, I will use Ubuntu server, but other distributions should work the same.

After installing ACL tools, it is necessary to enable ACL feature on our disk partitions so that we can start using it.

First, we can check if ACL feature is already enabled:

    $ mount

![](https://farm4.staticflickr.com/3859/14768099340_eab7b53e28_z.jpg)

As you noticed, my root partition has the ACL attribute enabled. In case yours doesn't, you need to edit your /etc/fstab file. Add acl flag in front of your options for the partition you want to enable ACL.

![](https://farm6.staticflickr.com/5566/14931771056_b48d5daae2_z.jpg)

Now we need to re-mount the partition (I prefer to reboot completely, because I don't like losing data). If you enabled ACL for any other partitions, you have to remount them as well.

    $ sudo mount / -o remount

Awesome! Now that we have enable ACL in our system, let's start to work with it.

### ACL Examples ###

Basically ACLs are managed by two commands: **setfacl** which is used to add or modify ACLs, and getfacl which shows assigned ACLs. Let's do some testing.

I created a directory /shared owned by a hypothetical user named freeuser.

    $ ls -lh /

![](https://farm4.staticflickr.com/3869/14954774565_49456360be_z.jpg)

I want to share this directory with two other users test and test2, one with full permissions and the other with just read permission.

First, to set ACLs for user test:

    $ sudo setfacl -m u:test:rwx /shared

Now user test can create directories, files, and access anything under /shared directory.

![](https://farm4.staticflickr.com/3924/14768099439_44780ff03b_z.jpg)

Now we will add read-only permission for user test2:

    $ sudo setfacl -m u:test2:rx /shared

Note that execution permission is necessary so test2 can read directories.

![](https://farm4.staticflickr.com/3918/14768215947_4cd86104d3_z.jpg)

Let me explain the syntax of setfacl command:

- **-m** means modify ACL. You can add new, or modify existing ACLs.
- **u:** means user. You can use **g** to set group permissions.
- **test** is the name of the user.
- **:rwx** represents permissions you want to set. 

Now let me show you how to read ACLs.

    $ ls -lh /shared

![](https://farm6.staticflickr.com/5591/14768099389_9a7f3a6bf2_z.jpg)

As you noticed, there is a + (plus) sign after normal permissions. It means that there are ACLs set up. To actually read ACLs, we need to run:

    $ sudo getfacl /shared

![](https://farm4.staticflickr.com/3839/14768099289_81bd9d21a4_z.jpg)

Finally if you want to remove ACL:

    $ sudo setfacl -x u:test /shared

![](https://farm4.staticflickr.com/3910/14768215837_d5306fe5bf_z.jpg)

If you want to wipe out all ACL entries at once:

    $ sudo setfacl -b /shared

![](https://farm4.staticflickr.com/3863/14768099130_a7d175f067_z.jpg)

One last thing. The commands cp and mv can change their behavior when they work over files or directories with ACLs. In the case of cp, you need to add the '-p' parameter to copy ACLs. If this is not posible, it will show you a warning. mv will always move the ACLs, and also if it is not posible, it will show you a warning.

### Conclusion ###

Using ACLs gives you a tremendous power and control over files you want to share, especially on NFS/Samba servers. Moreover, if you administer shared hosting, this tool is a must have.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/configure-access-control-lists-acls-linux.html

作者：[Christopher Valerio][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
