[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to the Linux chmod command)
[#]: via: (https://opensource.com/article/19/8/linux-chmod-command)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdosshttps://opensource.com/users/mralexjuarezhttps://opensource.com/users/brsonhttps://opensource.com/users/seth)

Introduction to the Linux chmod command
======
Chmod, which sets read, write, and execute permissions, is one of the
most important Linux security commands.
![5 pengiuns floating on iceburg][1]

Every object on your Linux system has a permission mode that describes what actions a user can perform on it. There are three types of permissions: read (**r**), write (**w**), and execute (**x**).

To **read** a file is to view its contents. For example, a text file must have **read** permission for someone to read the text within. If the user wants to add a sentence to that file, it needs **write** permission. The **execute** permission enables someone to run a file, such as a shell script or a binary program file.

### Basic permissions

The **ls -l** command displays the permissions assigned to a file. For example:


```
ls -l
-rw-rw-r-- 1 bruce bruce    0 Jul 30 16:25 schedule1.txt
```

Some permissions (**rw**) appear more than once because they are referring to different entities: _user_, _group_, and _other_. _User_ is synonymous with the owner, and _group_ refers to the user's primary group, both of which are **bruce**. _Other_ refers to all other users.

The first position denotes the object's type: **-** for a file, **d** for a directory, and **l** for a symbolic link. The next nine positions are grouped in threes and describe the permission mode. The positions are ordered **r**,**w**,**x**, and the groups are ordered **user**, **group**, **other**.

\--- --- --- | rwx rwx rwx
---|---
uuu ggg ooo | u=user, g=group, o=other

#### Files

A file with read, write, and execute bits set for all entities would appear:


```
`rwxrwxrwx`
```

Of course, we don't usually configure files this permissively in the real world; this is just an illustration of how each position is used.

In the following example, a file is configured for its owner (**pablo**) to have read and write permissions, for members of the group to only have read permission, and for everyone else to have no permissions.


```
`-rw-r----- 1 pablo pablo    0 Jul 30 16:25 textfile`
```

The **chmod** command modifies the permission mode of objects in the system. It is one of the most used and important commands in the set of Linux security commands.

A plus (**+**) symbol adds a permission, and a minus (**-**) symbol removes a permission. You can read **chmod u+r** as "user plus read," as it gives the user _read_ permission. The command **chmod u-r** means "user minus read," as it takes the _read_ permission away from the user.

#### Directories

The same three permissions also apply to a directory. A directory must have the _read_ permission for a user to view its contents. It will need _write_ permission for a user to add to the directory (e.g., to create a new file). For a user to change to a directory (**cd**), it must have _execute_ permission.


```
`drw-rw-r-- 2 pablo pablo 4096 Jul 30 15:56 JBOSS`
```

Pablo may be the owner of the JBOSS directory, but since he doesn't have execute permission, he can not **cd** into it. He can use the command **chmod u+x** to add the permission, and then he can **cd** into it.


```
$ cd JBOSS
bash: cd: JBOSS: Permission denied
$ chmod u+x JBOSS
$ ls -l
drwxrw-r-- 2 pablo pablo 4096 Jul 30 15:56 JBOSS
$ cd JBOSS
$ pwd
/opt/JBOSS
```

#### Combined arguments

You can combine arguments using a comma. In this example, you only need one command to set permissions so the group cannot write to a file nor can the rest of the world read it:


```
$ chmod o-r,g-w readme.txt
$ ls -l
-rw-r----- 1 pablo share 0 Jul 31 13:34 readme.txt
```

You can read this as "others minus read and group minus write."

Suppose Denise has written a Bash script called **home_backup.sh** and wants to give it _execute_ permission. She also wants to prevent anyone else from reading, writing, or executing it. One way to do this is with the plus and minus symbols:


```
`$ chmod go-rw,u+x home_backup.sh`
```

Another way is by using the equals (**=**) symbol. This will set the permissions absolutely without regard for previous settings. Note that there is a space after the second equals; this indicates a value of **none**:


```
`$ chmod u=rwx,go= home_backup.sh`
```

You can read this as "permissions for user equal read, write, and execute and permissions for group and other equal none."

### Numeric mode

Chmod also supports a numeric mode, which uses values assigned to each position:

owner

group

other

r

w

x

r

w

x

r

w

x

400

200

100

40

20

10

4

2

1

The total value of a set of permissions can be calculated and passed to the chmod command as a single argument. Take the example with Denise and her backup script. If she uses numeric mode to set the permissions on her script, she must first calculate the value total:


```
`-rwx------ 1 denise denise 0 Jul 31 13:53 home_backup.sh`
```

Denise adds the numbers that correspond to each permission she wants to apply:

**400 + 200 + 100 = 700**

Her command will be **chmod 700 home_backup.sh**. Suppose Denise wanted to reset the original permissions on the file:


```
`-rw-rw-r-- 1 denise denise 0 Jul 31 13:53 home_backup.sh`
```

The value of these permissions calculates to 664:

**400 + 200 + 40 + 20 + 4 = 664**

Denise can use the command **chmod 664 home_backup.sh** to restore the original permissions.

### Special modes

Three other modes can be set on an object:

name | symbolic | numeric
---|---|---
setuid | s | 4000
setgid | s | 2000
sticky | t | 1000

The **SetUID** bit enforces user ownership on an executable file. When it is set, the file will execute with the file owner's user ID, not the person running it.


```
`$ chmod u+s`
```

The **SetGID** bit enforces group ownership on files and directories. When it is set, any file or directory created in a directory will get the directory's group ownership, not the user's. When it is set on a file, the file will always be executed as its owning group rather than as the user:


```
`$ chmod g+s`
```

The **sticky** bit, also referred to as the "restricted deletion flag," can be set on a directory to prevent anyone except the directory's owner from deleting a file in that directory:


```
`$ chmod o+t`
```

The sticky bit can be set in numerical mode by adding its value to those of the other permissions. If you have an object with a value of 755 and you want to set the sticky bit, add 1000:

**1000 + 400 + 200 + 100 + 40 + 10 + 4 + 1 = 1755**

This command would be **chmod 1755**. Several symbolic methods are equivalent; one example is **chmod u=rwx,go=rx,o+t**.

### Extras

The letter **a** is a shortcut to assign permissions to all users. The command **chmod a+rwx** is equivalent to **chmod ugo+rwx**.

#### Recursive

Like many other Linux commands, chmod has a recursive argument, **-R**, which allows you to operate on a directory and its contents recursively. By recursive, It is meant that the command will attempt to operate on all objects below the specified directory rather than just the directory itself. This example starts in an empty directory and adds the **-v** (verbose) argument, so chmod will report what it is doing:


```
$ ls -l . conf
.:
drwxrwxr-x 2 alan alan 4096 Aug  5 15:33 conf

conf:
-rw-rw-r-- 1 alan alan 0 Aug  5 15:33 conf.xml
$ chmod -vR 700 conf
mode of 'conf' changed from 0775 (rwxrwxr-x) to 0700 (rwx------)
mode of 'conf/conf.xml' changed from 0664 (rw-rw-r--) to 0700 (rwx------)
```

#### Reference

A reference file command (**\--reference=RFILE**) can be used to duplicate the mode of another file (**RFILE**), known as a reference file. This is handy when you are changing modes on files to match a certain configuration or when you don't know the exact mode—or don't want to take time to calculate it:


```
$ ls -l
-rw-r--r-x 1 alan alan 0 Aug  5 17:10 notes.txt
-rw-rw-r-- 1 alan alan 0 Aug  5 17:10 readme.txt
$ chmod --reference=readme.txt notes.txt
$ ls -l
-rw-rw-r-- 1 alan alan 0 Aug  5 17:10 notes.txt
-rw-rw-r-- 1 alan alan 0 Aug  5 17:10 readme.txt
```

#### Report changes

The chmod command also has a **-c** (**\--changes**) argument, which tells chmod to report only when a change is made (versus **-v**, or **-verbose**, which tells chmod to report all its output). Chmod will still report other things, such as if an operation is not allowed.

The argument **-f** (**\--silent**, **\--quiet**) suppresses most error messages. Using this argument with **-c** will show only real changes.

#### Preserve root

The root (**/**) of the Linux filesystem should be treated with great respect. If someone makes a command mistake at this level, the consequences can be terrible and leave a system completely useless, particularly when you are running a recursive command that will make any kind of change—or worse: deletions. Fortunately, the chmod command's **\--preserve-root** argument will protect and preserve the root. If the argument is used with a recursive chmod command on the root, nothing will happen, and you will see this message:


```
[alan@localhost ~]# chmod -cfR --preserve-root a+w /
chmod: it is dangerous to operate recursively on '/'
chmod: use --no-preserve-root to override this failsafe
```

The option has no effect when it is not used with recursive. However, if the root user runs the command, the permissions of the **/** will change, but not those of other files or directories.


```
[alan@localhost ~]$ chmod -c --preserve-root a+w /
chmod: changing permissions of '/': Operation not permitted
[root@localhost /]# chmod -c --preserve-root a+w /
mode of '/' changed from 0555 (r-xr-xr-x) to 0777 (rwxrwxrwx)
```

Surprisingly, this is not the default argument; **\--no-preserve-root** is. If you run a command without the "preserve" option, it will default to "no preserve" mode and possibly change permissions on files that shouldn't be changed.


```
[alan@localhost ~]$ chmod -cfR a+x /
mode of '/proc/1525/task/1525/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
mode of '/proc/1541/task/1541/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
mode of '/proc/1541/task/1580/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
mode of '/proc/1541/task/1592/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
mode of '/proc/1557/task/1557/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
mode of '/proc/1558/task/1558/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
mode of '/proc/1561/task/1561/comm' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
```

### Conclusion

All objects on a Linux system have a set of permissions. It is important to check and maintain them occasionally to prevent unwanted access.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-chmod-command

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdosshttps://opensource.com/users/mralexjuarezhttps://opensource.com/users/brsonhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B (5 pengiuns floating on iceburg)
