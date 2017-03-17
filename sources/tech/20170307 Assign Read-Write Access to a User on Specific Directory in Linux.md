翻译中 [ChrisLeeGit](https://github.com/chrisleegit)

Assign Read/Write Access to a User on Specific Directory in Linux
============================================================


In a previous article, we showed you how to [create a shared directory in Linux][3]. Here, we will describe how to give read/write access to a user on a specific directory in Linux.

There are two possible methods of doing this: the first is [using ACLs (Access Control Lists)][4] and the second is [creating user groups to manage file permissions][5], as explained below.

For the purpose of this tutorial, we will use following setup.

```
Operating system: CentOS 7
Test directory: /shares/project1/reports 
Test user: tecmint
Filesystem type: Ext4
```

Make sure all commands are executed as root user or use the the [sudo command][6] with equivalent privileges.

Let’s start by creating the directory called `reports` using the mkdir command:

```
# mkdir -p /shares/project1/reports   				
```

### Using ACL to Give Read/Write Access to User on Directory

Important: To use this method, ensure that your Linux filesystem type (such as Ext3 and Ext4, NTFS, BTRFS) support ACLs.

1. First, [check the current file system type][7] on your system, and also whether the kernel supports ACL as follows:

```
# df -T | awk '{print $1,$2,$NF}' | grep "^/dev"
# grep -i acl /boot/config*
```

From the screenshot below, the filesystem type is Ext4 and the kernel supports POSIX ACLs as indicated by the CONFIG_EXT4_FS_POSIX_ACL=y option.

[
 ![Check Filesystem Type and Kernel ACL Support](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Filesystem-Type-and-Kernel-ACL-Support.png) 
][8]

Check Filesystem Type and Kernel ACL Support

2. Next, check if the file system (partition) is mounted with ACL option or not:

```
# tune2fs -l /dev/sda1 | grep acl
```
[
 ![Check Partition ACL Support](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Partition-ACL-Support.png) 
][9]

Check Partition ACL Support

From the above output, we can see that default mount option already has support for ACL. If in case it’s not enabled, you can enable it for the particular partition (/dev/sda3 for this case):

```
# mount -o remount,acl /
# tune2fs -o acl /dev/sda3
```

3. Now, its time to assign a read/write access to a user `tecmint` to a specific directory called `reports`by running the following commands.

```
# getfacl /shares/project1/reports       		  # Check the default ACL settings for the directory 
# setfacl -m user:tecmint:rw /shares/project1/reports     # Give rw access to user tecmint 
# getfacl /shares/project1/reports    			  # Check new ACL settings for the directory
```
[
 ![Give Read/Write Access to Directory Using ACL](http://www.tecmint.com/wp-content/uploads/2017/03/Give-Read-Write-Access-to-Directory-Using-ACL.png) 
][10]

Give Read/Write Access to Directory Using ACL

In the screenshot above, the user `tecmint` now has read/write (rw) permissions on directory /shares/project1/reports as seen from the output of the second getfacl command.

For more information about ACL lists, do check out our following guides.

1.  [How to Use ACLs (Access Control Lists) to Setup Disk Quotas for Users/Groups][1]
2.  [How to Use ACLs (Access Control Lists) to Mount Network Shares][2]

Now let’s see the second method of assigning read/write access to a directory.

### Using Groups to Give Read/Write Access to User on Directory

1. If the user already has a default user group (normally with same name as username), simply change the group owner of the directory.

```
# chgrp tecmint /shares/project1/reports
```

Alternatively, create a new group for multiple users (who will be given read/write permissions on a specific directory), as follows. However, this will c[reate a shared directory][11]:

```
# groupadd projects
```

2. Then add the user `tecmint` to the group `projects` as follows:

```
# usermod -aG projects tecmint	    # add user to projects
# groups tecmint	            # check users groups
```

3. Change the group owner of the directory to projects:

```
# chgrp	projects /shares/project1/reports
```

4. Now set read/write access for the group members:

```
# chmod -R 0760 /shares/projects/reports
# ls  -l /shares/projects/	    #check new permissions
```

That’s it! In this tutorial, we showed you how to give read/write access to a user on a specific directory in Linux. If any issues, do ask via the comment section below.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/give-read-write-access-to-directory-in-linux/

作者：[Aaron Kili][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/set-access-control-lists-acls-and-disk-quotas-for-users-groups/
[2]:http://www.tecmint.com/rhcsa-exam-configure-acls-and-mount-nfs-samba-shares/
[3]:http://www.tecmint.com/create-a-shared-directory-in-linux/
[4]:http://www.tecmint.com/secure-files-using-acls-in-linux/
[5]:http://www.tecmint.com/manage-users-and-groups-in-linux/
[6]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[7]:http://www.tecmint.com/find-linux-filesystem-type/
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Filesystem-Type-and-Kernel-ACL-Support.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Partition-ACL-Support.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Give-Read-Write-Access-to-Directory-Using-ACL.png
[11]:http://www.tecmint.com/create-a-shared-directory-in-linux/
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/
