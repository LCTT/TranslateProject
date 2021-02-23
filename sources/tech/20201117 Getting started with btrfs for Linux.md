[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with btrfs for Linux)
[#]: via: (https://opensource.com/article/20/11/btrfs-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Getting started with btrfs for Linux
======
The B-tree filesystem is a filesystem and volume manager rolled into
one. It offers a lot of promise for delivering an advanced filesystem
feature set to Linux.
![Filing cabinet for organization][1]

Btrfs has been available for Linux for several years, so you may already be familiar with it. If not, you may have questions about it, especially if you use Fedora Workstation (Btrfs is now its default filesystem). This article aims to help you get familiar with it and its advanced features, such as [copy-on-write][2] and [checksums][3].

Btrfs, short for B-Tree Filesystem, is actually a filesystem and volume manager rolled into one. It's often seen as a response to ZFS, introduced in Sun Microsystem's Solaris OS back in 2005, now largely replaced by an open source implementation called OpenZFS. Ubuntu Linux and FreeBSD often feature OpenZFS. Other examples with similar features are Red Hat's Stratis and the Linux Logical Volume Manager (LVM).

### Setup

To try Btrfs, I [downloaded][4] the Fedora 33 Workstation ISO file and installed it into a new virtual machine (VM). The installation process has not changed from previous versions. I did not customize any settings, including drive partitioning and formatting, to maintain an accurate "out of the box" setup for this tutorial. Once the VM was up and running, I installed and ran the GNOME Partition Editor ([GParted][5]) for a nice, factory-fresh view of the drive layout.

![GParted's view of Btrfs on Fedora 33 Workstation using GParted][6]

(Alan Formy-Duvall, [CC BY-SA 4.0][7])

From this point, it's not much different from what you're used to; in fact, you can use the system normally, and you might not even notice that the filesystem is Btrfs. However, having this new default enables you to leverage several cool features.

### Examine the Btrfs filesystem

I am not aware of any Btrfs-specific graphical tools, although some of its functions have been incorporated into existing disk-management tools.

From the command line, you can get a closer look at the Btrfs format:


```
# btrfs filesystem show
Label: 'fedora_localhost-live'  uuid: f2bb02f9-5c41-4c91-8eae-827a801ee58a
        Total devices 1 FS bytes used 6.36GiB
        devid    1 size 10.41GiB used 8.02GiB path /dev/vda3
```

### Change Btrfs labels

The first thing I noticed was the filesystem label set by the installer: `fedora_localhost-live`. This is inaccurate because it is now an installed system and no longer a [live CD][8]. So I changed it using the `btrfs filesystem label` command.

Changing a Btrfs filesystem label is simple:


```
# btrfs filesystem label /
fedora_localhost-live
# btrfs filesystem label / fedora33workstation
# btrfs filesystem label /
fedora33workstation
```

### Manage Btrfs subvolumes

A subvolume appears to be a standard directory that can be managed by Btrfs. There are several subvolumes on my new Fedora 33 Workstation:


```
# btrfs subvolume list /
ID 256 gen 2458 top level 5 path home
ID 258 gen 2461 top level 5 path root
ID 265 gen 1593 top level 258 path var/lib/machines
```

Create a new subvolume using the `btrfs subvolume create` command, or delete a subvolume with `btrfs subvolume delete`:


```
# btrfs subvolume create /opt/foo
Create subvolume '/opt/foo'
# btrfs subvolume list /
ID 256 gen 2884 top level 5 path home
ID 258 gen 2888 top level 5 path root
ID 265 gen 1593 top level 258 path var/lib/machines
ID 276 gen 2888 top level 258 path opt/foo
# btrfs subvolume delete /opt/foo
Delete subvolume (no-commit): '/opt/foo'
```

Subvolumes allow actions like setting a quota, taking a snapshot, and replicating to other locations and hosts. How can system administrators take advantage of these capabilities? How about for user home directories?

#### Add a user

As has been the case since olden times, adding a new user account creates a home directory for the account to use:


```
# useradd student1
# getent passwd student1
student1❌1006:1006::/home/student1:/bin/bash
# ls -l /home
drwx------. 1 student1 student1  80 Oct 29 00:21 student1
```

Traditionally, a user's home directory is a subdirectory of `/home`. Ownership and privileges are tailored to the owner, but there are no special functions for managing them. The enterprise server environment is another scenario. Often, a directory is reserved for use by a particular application and its user. You can take advantage of Btrfs to manage and apply constraints to these directories.

To accommodate Btrfs subvolumes as user homes, there is a new option to the `useradd` command: `--btrfs-subvolume-home`. Although the man pages have not been updated (as of this writing), you can see the option by running `useradd --help`. By passing this option when adding a new user, a new Btrfs subvolume will be created. It functions just like the `-d` option does for creating a regular directory:


```
# useradd --btrfs-subvolume-home student2
Create subvolume '/home/student2'
```

Verify the user with `getent passwd student2`, and it will appear normal. However, run the `btrfs subvolume` command to list subvolumes, and you will see something interesting: the new user's home directory!


```
# btrfs subvolume list /
ID 256 gen 2458 top level 5 path home
ID 258 gen 2461 top level 5 path root
ID 265 gen 1593 top level 258 path var/lib/machines
ID 272 gen 2459 top level 256 path home/student2
```

Explore the second scenario of an enterprise server environment. Suppose you need to install a [WildFly][9] server in `/opt` and deploy a Java web application. Often, your first step is to create a `wildfly` user.  Do this using the new `--btrfs-subvolume-home` option along with the `-b` option to specify `/opt` as the base directory:


```
# useradd -b /opt --btrfs-subvolume-home wildfly
Create subvolume '/opt/wildfly'
```

Now, the `wildfly` user can log in and complete the installation in `/opt/wildfly`.

#### Delete a user

When you delete a user, sometimes you want to delete that user's files and the home directory at the same time. The `userdel` command has the `-r` option for this, and it also deletes Btrfs subvolumes:


```
# userdel -r student2
Delete subvolume (commit): '/home/student2'
```

#### Set disk-usage quotas

In one of my computer science classes, a student ran a C program that went out of control and wrote to the disk until the entire `/home` was filled on the department's Unix system! The server became unavailable until the admin killed the runaway process and cleared some space. The same is true for the scenario above; that Wildfly enterprise application will have a growing number of log files and content stores for its users. How can you prevent a server from grinding to a halt because the disk has filled up? Setting disk-usage constraints is a good idea. Fortunately, Btrfs supports this by way of quotas.

There are several steps required to configure quotas. The first step is to enable `quota` on the Btrfs filesystem:


```
`# btrfs quota enable /`
```

Make sure you know each subvolume's quota group (qgroup) ID number, which is displayed by the `btrfs subvolume list` command. Each subvolume needs an associated qgroup based on its ID number. This can be done on an individual basis with `btrfs qgroup create`, but, conveniently, the Btrfs wiki provides the following command to expedite creating qgroups for subvolumes on a filesystem:


```
`>btrfs subvolume list \<path> | cut -d' ' -f2 | xargs -I{} -n1 btrfs qgroup destroy 0/{} \<path>`
```

In a freshly installed Fedora 33 workstation system, you are operating on the root filesystem path, `/`. Substitute `\<path>` with the root path:


```
`# btrfs subvolume list / | cut -d' ' -f2 | xargs -I{} -n1 btrfs qgroup create 0/{} /`
```

Then run `btrfs quota rescan` and take a look at the new qgroups:


```
# btrfs quota rescan /
quota rescan started
# btrfs qgroup show /
qgroupid         rfer         excl
\--------         ----         ----
0/5          16.00KiB     16.00KiB
0/256       272.04MiB    272.04MiB
0/258         6.08GiB      6.08GiB
0/265        16.00KiB     16.00KiB
0/271        16.00KiB     16.00KiB
0/273        16.00KiB     16.00KiB
```

Now you can assign a quota to one of the qgroups, which, in turn, is applied to its associated subvolume. So, if you want to limit student3's home directory usage to 1GB, use the `btrfs qgroup limit` command:


```
`# btrfs qgroup limit 1G /home/student3`
```

Confirm the quota for the specific subvolume:


```
# btrfs qgroup show -reF /home/student3
qgroupid         rfer         excl     max_rfer     max_excl
\--------         ----         ----     --------     --------
0/271        16.00KiB     16.00KiB      1.00GiB         none
```

Slightly different options will show all qgroups and any quotas that are set:


```
# btrfs qgroup show -re /
qgroupid         rfer         excl     max_rfer     max_excl
\--------         ----         ----     --------     --------
0/5          16.00KiB     16.00KiB         none         none
0/256       272.04MiB    272.04MiB         none         none
0/258         6.08GiB      6.08GiB         none         none
0/265        16.00KiB     16.00KiB         none         none
0/271        16.00KiB     16.00KiB      1.00GiB         none
0/273        16.00KiB     16.00KiB         none         none
```

### Other features

These examples provide some idea of Btrfs' features. Run `btrfs --help` to see the full list of commands. Many other notable capabilities exist; for instance, snapshots and send/receive are two worth learning.

### Final thoughts

Btrfs offers a lot of promise for delivering an advanced filesystem feature set to Linux. It wasn't the first; I credit ZFS for my introduction to this type of filesystem some 15 years ago, but Btrfs is fully open source and unencumbered by patents.

I advise starting with a virtual machine or spare system if you want to explore this filesystem.

I would like to see some graphical management utilities produced for system administrators who like to operate in the GUI world. Fortunately, Btrfs has strong development activity, as evidenced by the Fedora project's decision to make it default on Workstation 33.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/btrfs-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://en.wikipedia.org/wiki/Copy-on-write
[3]: https://en.wikipedia.org/wiki/Checksum
[4]: https://getfedora.org/en/workstation/download/
[5]: https://gparted.org/
[6]: https://opensource.com/sites/default/files/uploads/gparted_btrfs.png (GParted's view of Btrfs on Fedora 33 Workstation using GParted)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://en.wikipedia.org/wiki/Live_CD
[9]: https://www.wildfly.org/
