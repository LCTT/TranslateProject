FSSlc translating

RHCSA Series: Using ACLs (Access Control Lists) and Mounting Samba / NFS Shares – Part 7
================================================================================
In the last article ([RHCSA series Part 6][1]) we started explaining how to set up and configure local system storage using parted and ssm.

![Configure ACL's and Mounting NFS / Samba Shares](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-ACLs-and-Mounting-NFS-Samba-Shares.png)

RHCSA Series:: Configure ACL’s and Mounting NFS / Samba Shares – Part 7

We also discussed how to create and mount encrypted volumes with a password during system boot. In addition, we warned you to avoid performing critical storage management operations on mounted filesystems. With that in mind we will now review the most used file system formats in Red Hat Enterprise Linux 7 and then proceed to cover the topics of mounting, using, and unmounting both manually and automatically network filesystems (CIFS and NFS), along with the implementation of access control lists for your system.

#### Prerequisites ####

Before proceeding further, please make sure you have a Samba server and a NFS server available (note that NFSv2 is no longer supported in RHEL 7).

During this guide we will use a machine with IP 192.168.0.10 with both services running in it as server, and a RHEL 7 box as client with IP address 192.168.0.18. Later in the article we will tell you which packages you need to install on the client.

### File System Formats in RHEL 7 ###

Beginning with RHEL 7, XFS has been introduced as the default file system for all architectures due to its high performance and scalability. It currently supports a maximum filesystem size of 500 TB as per the latest tests performed by Red Hat and its partners for mainstream hardware.

Also, XFS enables user_xattr (extended user attributes) and acl (POSIX access control lists) as default mount options, unlike ext3 or ext4 (ext2 is considered deprecated as of RHEL 7), which means that you don’t need to specify those options explicitly either on the command line or in /etc/fstab when mounting a XFS filesystem (if you want to disable such options in this last case, you have to explicitly use no_acl and no_user_xattr).

Keep in mind that the extended user attributes can be assigned to files and directories for storing arbitrary additional information such as the mime type, character set or encoding of a file, whereas the access permissions for user attributes are defined by the regular file permission bits.

#### Access Control Lists ####

As every system administrator, either beginner or expert, is well acquainted with regular access permissions on files and directories, which specify certain privileges (read, write, and execute) for the owner, the group, and “the world” (all others). However, feel free to refer to [Part 3 of the RHCSA series][2] if you need to refresh your memory a little bit.

However, since the standard ugo/rwx set does not allow to configure different permissions for different users, ACLs were introduced in order to define more detailed access rights for files and directories than those specified by regular permissions.

In fact, ACL-defined permissions are a superset of the permissions specified by the file permission bits. Let’s see how all of this translates is applied in the real world.

1. There are two types of ACLs: access ACLs, which can be applied to either a specific file or a directory), and default ACLs, which can only be applied to a directory. If files contained therein do not have a ACL set, they inherit the default ACL of their parent directory.

2. To begin, ACLs can be configured per user, per group, or per an user not in the owning group of a file.

3. ACLs are set (and removed) using setfacl, with either the -m or -x options, respectively.

For example, let us create a group named tecmint and add users johndoe and davenull to it:

    # groupadd tecmint
    # useradd johndoe
    # useradd davenull
    # usermod -a -G tecmint johndoe
    # usermod -a -G tecmint davenull

And let’s verify that both users belong to supplementary group tecmint:

    # id johndoe
    # id davenull

![Verify Users](http://www.tecmint.com/wp-content/uploads/2015/04/Verify-Users.png)

Verify Users

Let’s now create a directory called playground within /mnt, and a file named testfile.txt inside. We will set the group owner to tecmint and change its default ugo/rwx permissions to 770 (read, write, and execute permissions granted to both the owner and the group owner of the file):

    # mkdir /mnt/playground
    # touch /mnt/playground/testfile.txt
    # chmod 770 /mnt/playground/testfile.txt

Then switch user to johndoe and davenull, in that order, and write to the file:

    echo "My name is John Doe" > /mnt/playground/testfile.txt
    echo "My name is Dave Null" >> /mnt/playground/testfile.txt

So far so good. Now let’s have user gacanepa write to the file – and the write operation will, which was to be expected.

But what if we actually need user gacanepa (who is not a member of group tecmint) to have write permissions on /mnt/playground/testfile.txt? The first thing that may come to your mind is adding that user account to group tecmint. But that will give him write permissions on ALL files were the write bit is set for the group, and we don’t want that. We only want him to be able to write to /mnt/playground/testfile.txt.

    # touch /mnt/playground/testfile.txt
    # chown :tecmint /mnt/playground/testfile.txt
    # chmod 777 /mnt/playground/testfile.txt
    # su johndoe
    $ echo "My name is John Doe" > /mnt/playground/testfile.txt
    $ su davenull
    $ echo "My name is Dave Null" >> /mnt/playground/testfile.txt
    $ su gacanepa
    $ echo "My name is Gabriel Canepa" >> /mnt/playground/testfile.txt

![Manage User Permissions](http://www.tecmint.com/wp-content/uploads/2015/04/User-Permissions.png)

Manage User Permissions

Let’s give user gacanepa read and write access to /mnt/playground/testfile.txt.

Run as root,

    # setfacl -R -m u:gacanepa:rwx /mnt/playground

and you’ll have successfully added an ACL that allows gacanepa to write to the test file. Then switch to user gacanepa and try to write to the file again:

    $ echo "My name is Gabriel Canepa" >> /mnt/playground/testfile.txt

To view the ACLs for a specific file or directory, use getfacl:

    # getfacl /mnt/playground/testfile.txt

![Check ACLs of Files](http://www.tecmint.com/wp-content/uploads/2015/04/Check-ACL-of-File.png)

Check ACLs of Files

To set a default ACL to a directory (which its contents will inherit unless overwritten otherwise), add d: before the rule and specify a directory instead of a file name:

    # setfacl -m d:o:r /mnt/playground

The ACL above will allow users not in the owner group to have read access to the future contents of the /mnt/playground directory. Note the difference in the output of getfacl /mnt/playground before and after the change:

![Set Default ACL in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Set-Default-ACL-in-Linux.png)

Set Default ACL in Linux

[Chapter 20 in the official RHEL 7 Storage Administration Guide][3] provides more ACL examples, and I highly recommend you take a look at it and have it handy as reference.

#### Mounting NFS Network Shares ####

To show the list of NFS shares available in your server, you can use the showmount command with the -e option, followed by the machine name or its IP address. This tool is included in the nfs-utils package:

    # yum update && yum install nfs-utils

Then do:

    # showmount -e 192.168.0.10

and you will get a list of the available NFS shares on 192.168.0.10:

![Check Available NFS Shares](http://www.tecmint.com/wp-content/uploads/2015/04/Mount-NFS-Shares.png)

Check Available NFS Shares

To mount NFS network shares on the local client using the command line on demand, use the following syntax:

    # mount -t nfs -o [options] remote_host:/remote/directory /local/directory

which, in our case, translates to:

    # mount -t nfs 192.168.0.10:/NFS-SHARE /mnt/nfs

If you get the following error message: “Job for rpc-statd.service failed. See “systemctl status rpc-statd.service” and “journalctl -xn” for details.”, make sure the rpcbind service is enabled and started in your system first:

    # systemctl enable rpcbind.socket
    # systemctl restart rpcbind.service

and then reboot. That should do the trick and you will be able to mount your NFS share as explained earlier. If you need to mount the NFS share automatically on system boot, add a valid entry to the /etc/fstab file:

    remote_host:/remote/directory /local/directory nfs options 0 0

The variables remote_host, /remote/directory, /local/directory, and options (which is optional) are the same ones used when manually mounting an NFS share from the command line. As per our previous example:

    192.168.0.10:/NFS-SHARE /mnt/nfs nfs defaults 0 0

#### Mounting CIFS (Samba) Network Shares ####

Samba represents the tool of choice to make a network share available in a network with *nix and Windows machines. To show the Samba shares that are available, use the smbclient command with the -L flag, followed by the machine name or its IP address. This tool is included in the samba-client package:

You will be prompted for root’s password in the remote host:

    # smbclient -L 192.168.0.10

![Check Samba Shares](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Samba-Shares.png)

Check Samba Shares

To mount Samba network shares on the local client you will need to install first the cifs-utils package:

    # yum update && yum install cifs-utils

Then use the following syntax on the command line:

    # mount -t cifs -o credentials=/path/to/credentials/file //remote_host/samba_share /local/directory

which, in our case, translates to:

    # mount -t cifs -o credentials=~/.smbcredentials //192.168.0.10/gacanepa /mnt/samba

where smbcredentials:

    username=gacanepa
    password=XXXXXX

is a hidden file inside root’s home (/root/) with permissions set to 600, so that no one else but the owner of the file can read or write to it.

Please note that the samba_share is the name of the Samba share as returned by smbclient -L remote_host as shown above.

Now, if you need the Samba share to be available automatically on system boot, add a valid entry to the /etc/fstab file as follows:

    //remote_host:/samba_share /local/directory cifs options 0 0

The variables remote_host, /samba_share, /local/directory, and options (which is optional) are the same ones used when manually mounting a Samba share from the command line. Following the definitions given in our previous example:

    //192.168.0.10/gacanepa /mnt/samba	cifs credentials=/root/smbcredentials,defaults 0 0

### Conclusion ###

In this article we have explained how to set up ACLs in Linux, and discussed how to mount CIFS and NFS network shares in a RHEL 7 client.

I recommend you to practice these concepts and even mix them (go ahead and try to set ACLs in mounted network shares) until you feel comfortable. If you have questions or comments feel free to use the form below to contact us anytime. Also, feel free to share this article through your social networks.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-configure-acls-and-mount-nfs-samba-shares/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/rhcsa-exam-create-format-resize-delete-and-encrypt-partitions-in-linux/
[2]:http://www.tecmint.com/rhcsa-exam-manage-users-and-groups/
[3]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Storage_Administration_Guide/ch-acls.html
