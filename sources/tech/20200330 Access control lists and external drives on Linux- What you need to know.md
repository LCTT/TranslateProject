[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Access control lists and external drives on Linux: What you need to know)
[#]: via: (https://opensource.com/article/20/3/external-drives-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Access control lists and external drives on Linux: What you need to know
======
Learn how to use external drives correctly on Linux.
![Penguin driving a car with a yellow background][1]

While cloud storage offers many advantages, there's nothing quite like having your data on a physical hard drive. When you save data to a drive, you know exactly where your data is, and it's always available when you need it. When you save data to an external portable drive like a USB thumb drive, it's even better—not only do you know where your data is, but you can take your data with you everywhere you go. If you're new to [Linux][2], or you're trying to use a Linux file system on an external drive, you might find external drives confusing, being prone to permission errors or conflicts, or even losing metadata.

There are two "right" answers to this:

### ExFAT

Formerly, ExFAT was a file system fraught with legal threats from Microsoft because they own the code. They've sued companies and organizations before to defend their ownership of FAT, so it was commonly feared that they could do the same over ExFAT. However, recently. Microsoft made the specifications for ExFAT open source. They didn't provide a driver, unfortunately, but there's an existing drive to make it function on Linux, and, now that developers have access to the full specs, improvements are inevitable.

The advantage of ExFAT is that it's cross-platform (Windows, Mac, and many portable devices use it), and it's designed without the overhead of file permissions. You can attach a drive formatted as ExFAT to any computer, and all files are available to anyone. Whether that's good or bad depends on your use case, but for portable media, that's often exactly the intent.

### Access control lists (ACL)

If you prefer to use a Linux file system on your portable drive, then you can do that, but to make sharing files seamless, you should use access control lists (ACL).

When you create a file or directory on a drive, there are defaults on your system determining what file permissions it gets. For most cases, those defaults make sense—when you create a file in your home directory, you probably don't want other users to have access to that file. However, when you're creating a file on an external drive, there's a high likelihood that it's because you need to share that file with someone else (even if that someone is you on another computer).

You can override default permissions for file viewing with an ACL, and you can control default file creation mode by setting a sticky bit. An ACL is a layer of security policies in the extended attributes of directories and files. It allows you to specify exceptions to what the file system permissions indicate. Most notably, this allows you to transcend the single-owner and single-group model of traditional UNIX permissions.

For instance, while the **seth** (ID 1000) account might own a directory created on my desktop, **seth** (ID 500) on my laptop does not, because the user IDs are different.

The same could be true for a group. If a directory with group ID 1000 is assigned to a directory on one computer, then a group with an ID 500 or 10922 doesn't have access to it on another computer. But an ACL can add secondary owners and groups to directories and files.

#### View the current ACL

Any directory and file on any common Linux filesystem has ACL rules by default. They're stored in extended attributes, a kind of metadata that you don't normally see.

You can view them in the terminal:


```
$ getfacl ./example
# file: /run/media/drive/example
# owner: seth
# group: users
user::rwx
group::rwx
other::r--
```

The commented lines are just for your reference; they tell you the path, and the owner and group, of the file or directory you're viewing information about. The next lines display the rules applied to the file or directory. In this example, the user permissions are set to **rwx**, the group to **r-x**, and other to **r-x**. These permissions are reflected by a normal filesystem list:


```
$ ls -lA /run/media/drive
drwxrwxr-- 26 seth users 4096 Jan 16 21:04 example
$ id
uid=1000(seth) gid=100(users) groups=100(users)...
```

As long as user **seth** (UID 1000) or a member of **group** (GID 100) interacts with the **example** directory, full access is granted. Any other account, however, has only read (**r**) permission.

#### Setting an ACL

To modify an ACL, you use the **setfacl** command or use a file manager with ACL support. You can be very specific or very generic when setting your ACL.

To just modify the filesystem permission settings, you can use either **chmod** or **setfacl**. This is a very generic ACL setting because you're not adding anything to the permissions already available to UNIX from the filesystem specification.


```
$ setfacl --modify g::r example
$ getfacl ./example | grep "group::"
group::r--
$ ls -l . | grep example
drwxr--r-- 26 seth users 4096 Jan 16 21:04 example
```

The same effect is available through **chmod**:


```
$ chmod g+x example
$ getfacl ./example | grep "group::"
group::r-x
$ ls -l . | grep example
drwxr-xr-- 26 seth users 4096 Jan 16 21:04 example
```

#### Adding users and groups

To really benefit from an ACL is to use it for permissions outside the scope of native UNIX permissions. If I'm logged into my desktop as **seth** with user ID 1000, and I know that a directory on my portable drive needs to be usable by **seth** with ID 500 on my laptop, then just declaring **seth** as owner isn't enough because the user IDs aren't the same.

You can add a user or user ID to an access control list:


```
$ setfacl --modify u:500:rwx example
$ getfacl example
# file: /run/media/drive/example
# owner: seth
# group: users
user::rwx
user:500:rwx
[...]
```

A new entry, specific to user ID 500, has been added to the list. Attaching the drive to another Linux or UNIX computer now allows the user with ID 500 to access the **example** folder.

You can also add users by account name, or groups by either group name or group ID. The IDs are what really count with permissions, though, so if you're in a mixed environment (RHEL servers and Elementary clients, for example), you should verify the user IDs and group IDs lurking behind accounts that seem, on the surface, identical.

#### Setting default ACL rules

If you treat access control as a one-time setting, you'll quickly run into problems once your different user accounts start creating files and directories. Any new file or directory created by each user inherits the system's default permissions (and ACL). This means that once laptop user **seth** with ID 500 creates a file in a directory, it could be off-limits to desktop user **seth** with ID 1000 because the owner of the file is set to UID 500.

A default ACL can be applied to directories so that files and subdirectories created within them inherit the parent ACL. You can set the default ACL of a directory with the **–default** option:


```
$ setfacl --default --modify u:500:rwx example
$ setfacl --default --modify u:1000:rwx example
$ getfacl --omit-header example
user::rwx
user:500:rwx
group::rw-
mask::rwx
other::r-x
default:user::rwx
default:group::rw-
default:group:500:rwx
default:group:1000:rwx
default😷:rwx
default:other::r-x
```

When a user creates a new directory within the **example** directory, the inherited ACL is the same as its parent:


```
$ cd example
$ mkdir penguins
$ getfacl --omit-header penguins
user::rwx
group::rw-
group:500:rwx
group:1000:rwx
mask::rwx
other::r-x
default:user::rwx
default:group::rw-
default:group:500:rwx
default:group:1000:rwx
default😷:rwx
default:other::r-x
```

This means that any directory or file created inherits the same ACL, so neither user 500 or 1000 are ever excluded from access.

#### Pragmatic ACL for external drives

When using a Linux filesystem for external drives, the easy method of ensuring it works with all the users who expect to use the portable drive is to set an ACL on a single top-level directory.

For instance, assume you have formatted a USB drive called **mydrive** as an ext4 filesystem. You want your account on your laptop and your desktop, as well as your colleague Alice, to be able to access the files.

First, create a directory at the top level of the drive:


```
$ mkdir /mnt/mydrive/umbrella
```

Then apply an ACL to the top-level directory to grant all-important users access:


```
$ setfacl --modify \
  u:500:rwx,u:1000:rwx,u:alice:rwx \
  /mnt/mydrive/umbrella
```

Finally, apply a default ACL so that all directories and files created within the top-level directory **umbrella** inherit the same default ACL (note that this command uses the short version of **–modify**):


```
$ setfacl --default -m u:500:rwx,u:1000:rwx,u:alice:rwx \
  /mnt/mydrive/umbrella
```

#### Applying defaults to an existing system

If you need to apply ACL settings to many files that already exist, you can accomplish that with the **find** command.

First, find all directories and apply ACL rules:


```
$ find /mnt/mydrive/umbrella -type d | \
  parallel --max-args=6 setfacl \
  --default -m u:500:rwx,u:1000:rwx,u:alice:rwx
```

It's not wise to indiscriminately set all file permissions to executable, so next, find all files and set permissions to **re**. Files that require an executable bit can be set manually or by file extension:


```
$ find /mnt/mydrive/umbrella -type f | \
  parallel --max-args=6 setfacl \
  --default -m u:500:rw,u:1000:rw,u:alice:rw
```

Adjust the logic of these commands to suit your individual need (don't run a command that removes the executable bit on **/usr**, for instance, or on a directory containing nothing but executable programs).

### External drives

Don't let confusion around external drives on Linux get the best of you, and don't limit yourself to traditional UNIX permissions. Put access control lists to work for you, and feel free to use native journaled Linux filesystems on your portable drives.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/external-drives-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://opensource.com/resources/linux
