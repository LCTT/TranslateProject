tranlating by lujun9972
How To Allow/Permit User To Access A Specific File or Folder In Linux Using ACL
======
When you are come to file or folder permission part, you may first look owner/group/others permission. This can be done through chmod, chown, etc., commands.

Files and directories have permission sets such as owner (owner or user of the file), group (associated group) and others. However, these permission sets have limitations and doesn't allow users to set different permissions to different users.

By default Linux has following permission set for files & folders.

`Files` -> 644 -> -rw-r-r- (User has Read & Write access, Group has Read only access, and Others also has Read only access)  
`Folders` -> 755 -> drwxr-xr-x (User has Read, Write & Execute access, Group has Read & Execute access, and Others also has the same access)

For example: By default users can access & edit their own home directory files, also can access associated group files but they can't modify those since group doesn't has write access and it's not advisable to permit group level. Also he/she can't access other users files. In some case multiple users want to access the same file, what will be the solution?

I have user called `magi` and he wants to modify `httpd.conf` file? how to grant since it's owned by root user. Thus, Access Control Lists (ACLs) were implemented.

### What Is ACL?

ACL stands for Access Control List (ACL) provides an additional, more flexible permission mechanism for file systems. It is designed to assist with UNIX file permissions. ACL allows you to give permissions for any user or group to any disc resource. setfacl & getfacl commands help you to manage AcL without any trouble.

### What Is setfacl?

setfacl is used to sets Access Control Lists (ACLs) of files and directories.

### What Is getfacl?

getfacl - get file access control lists. For each file, getfacl displays the file name, owner, the group, and the Access Control List (ACL). If a directory has a default ACL, getfacl also displays the default ACL.

### How to check whether ACL is enabled or not?

Run `tune2fs` command to Check whether ACL is enabled or not.
```
# tune2fs -l /dev/sdb1 | grep options
Default mount options: (none)

```

The above output clearly shows that ACL is not enabled for `/dev/sdb1` partition.

If acl is not listed then you will need to add acl as a mount option. To do so persistently, change the `/etc/fstab` line for `/app` to look like this.
```
# more /etc/fstab

UUID=f304277d-1063-40a2-b9dc-8bcf30466a03 / ext4 defaults 1 1
/dev/sdb1 		 /app ext4 defaults,acl 1 1

```

Or alternatively, you can add this to the filesystem superblock by using the following command.
```
# tune2fs -o +acl /dev/sdb1

```

Now, change the option in the current run-time without interruption by running the following command.
```
# mount -o remount,acl /app

```

Then run the tune2fs command again to see acl as an option.
```
# tune2fs -l /dev/sdb1 | grep options
Default mount options: acl

```

Yes, now i can see the ACLs option on `/dev/sdb1` partition.

### How to check default ACL values

To check the default ACL values for a file or directory, use the `getfacl` command followed by `/path to file` or `/path to folder`. Make a note, when you run getfacl command on non ACLs file or folder, it wont shows additional user and mask parameter values.
```
# getfacl /etc/apache2/apache2.conf

# file: etc/apache2/apache2.conf
# owner: root
# group: root
user::rw-
group::r--
other::r--

```

### How to Set ACL for files

Run the setfacl command with below format to set ACL on the given file. In the below example we are going to give a `rwx` access to `magi` user on the `/etc/apache2/apache2.conf` file.
```
# setfacl -m u:magi:rwx /etc/apache2/apache2.conf

```

**Details :**

  * **`setfacl:`** Command
  * **`-m:`** modify the current ACL(s) of file(s)
  * **`u:`** Indicate a user
  * **`magi:`** Name of the user
  * **`rwx:`** Permissions which you want to set
  * **`/etc/apache2/apache2.conf:`** Name of the file



Run the command once again to view the new ACL values.
```
# getfacl /etc/apache2/apache2.conf

# file: etc/apache2/apache2.conf
# owner: root
# group: root
user::rw-
user:magi:rwx
group::r--
mask::rwx
other::r--

```

Make a note : If you noticed a plus (+) sign after the file or folder permissions then it's ACL setup.
```
# ls -lh /etc/apache2/apache2.conf
-rw-rwxr--+ 1 root root 7.1K Sep 19 14:58 /etc/apache2/apache2.conf

```

### How to Set ACL for folders

Run the setfacl command with below format to set ACL on the given folder recursively. In the below example we are going to give a `rwx` access to `magi` user on the `/etc/apache2/sites-available/` folder.
```
# setfacl -Rm u:magi:rwx /etc/apache2/sites-available/

```

**Details :**

  * **`-R:`** Recurse into sub directories



Run the command once again to view the new ACL values.
```
# getfacl /etc/apache2/sites-available/

# file: etc/apache2/sites-available/
# owner: root
# group: root
user::rwx
user:magi:rwx
group::r-x
mask::rwx
other::r-x

```

Now, all the files and folders having ACLs values under `/etc/apache2/sites-available/` folder.
```
# ls -lh /etc/apache2/sites-available/
total 20K
-rw-rwxr--+ 1 root root 1.4K Sep 19 14:56 000-default.conf
-rw-rwxr--+ 1 root root 6.2K Sep 19 14:56 default-ssl.conf
-rw-rwxr--+ 1 root root 1.4K Dec 8 02:57 mywebpage.com.conf
-rw-rwxr--+ 1 root root 1.4K Dec 7 19:07 testpage.com.conf

```

### How to Set ACL for group

Run the setfacl command with below format to set ACL on the given file. In the below example we are going to give a `rwx` access to `appdev` group on the `/etc/apache2/apache2.conf` file.
```
# setfacl -m g:appdev:rwx /etc/apache2/apache2.conf

```

**Details :**

  * **`g:`** Indicate a group



For multiple users and groups, just add `comma` between the users or group like below.
```
# setfacl -m u:magi:rwx,g:appdev:rwx /etc/apache2/apache2.conf

```

### How to remove ACL

Run the setfacl command with below format to remove ACL for the given user on the file. This will remove only user permissions and keep `mask` values as read.
```
# setfacl -x u:magi /etc/apache2/apache2.conf

```

**Details :**

  * **`-x:`** Remove entries from the ACL(s) of file(s)



Run the command once again to view the removed ACL values. In the below output i can see the `mask` values as read.
```
# getfacl /etc/apache2/apache2.conf

# file: etc/apache2/apache2.conf
# owner: root
# group: root
user::rw-
group::r--
mask::r--
other::r--

```

Use `-b` option to remove all ACLs associated to a file.
```
# setfacl -b /etc/apache2/apache2.conf

```

**Details :**

  * **`-b:`** Remove all extended ACL entries



Run the command once again to view the removed ACL values. Here everything is gone and there is no mask value also.
```
# getfacl /etc/apache2/apache2.conf

# file: etc/apache2/apache2.conf
# owner: root
# group: root
user::rw-
group::r--
other::r--

```

### How to Backup and Restore ACL

Run the following command to backup and restore ACLs values. To take a backup, navigate to corresponding directory and do it.

We are going to take a backup of `sites-available` folder. So, you have to do like below.
```
# cd /etc/apache2/sites-available/
# getfacl -R 20171202 docker - Use multi-stage builds.md comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE published README.md sign.md sources translated 选题模板.txt 中文排版指北.md > acl_backup_for_folder

```

To resote, run the following command.
```
# setfacl --restore=/etc/apache2/sites-available/acl_backup_for_folder
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-configure-access-control-lists-acls-setfacl-getfacl-linux/

作者：[Magesh Maruthamuthu;Steven M. Dupuis][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com
