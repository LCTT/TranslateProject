[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to the Linux chown command)
[#]: via: (https://opensource.com/article/19/8/linux-chown-command)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/greg-phttps://opensource.com/users/alanfdoss)

Introduction to the Linux chown command
======
Learn how to change a file or directory's ownership with chown.
![Hand putting a Linux file folder into a drawer][1]

Every file and directory on a Linux system is owned by someone, and the owner has complete control to change or delete the files they own. In addition to having an owning _user_, a file has an owning _group_.

You can view the ownership of a file using the **ls -l** command:


```
[pablo@workstation Downloads]$ ls -l
total 2454732
-rw-r--r--. 1 pablo pablo 1934753792 Jul 25 18:49 Fedora-Workstation-Live-x86_64-30-1.2.iso
```

The third and fourth columns of the output are the owning user and group, which together are referred to as _ownership_. Both are **pablo** for the ISO file above.

The ownership settings, set by the [**chmod** command][2], control who is allowed to perform read, write, or execute actions. You can change ownership (one or both) with the **chown** command.

It is often necessary to change ownership. Files and directories can live a long time on a system, but users can come and go. Ownership may also need to change when files and directories are moved around the system or from one system to another.

The ownership of the files and directories in my home directory are my user and my primary group, represented in the form **user:group**. Suppose Susan is managing the Delta group, which needs to edit a file called **mynotes**. You can use the **chown** command to change the user to **susan** and the group to **delta**:


```
$ chown susan:delta mynotes
ls -l
-rw-rw-r--. 1 susan delta 0 Aug  1 12:04 mynotes
```

Once the Delta group is finished with the file, it can be assigned back to me:


```
$ chown alan mynotes
$ ls -l mynotes
-rw-rw-r--. 1 alan delta 0 Aug  1 12:04 mynotes
```

Both the user and group can be assigned back to me by appending a colon (**:**) to the user:


```
$ chown alan: mynotes
$ ls -l mynotes
-rw-rw-r--. 1 alan alan 0 Aug  1 12:04 mynotes
```

By prepending the group with a colon, you can change just the group. Now members of the **gamma** group can edit the file:


```
$ chown :gamma mynotes
$ ls -l
-rw-rw-r--. 1 alan gamma 0 Aug  1 12:04 mynotes
```

A few additional arguments to chown can be useful at both the command line and in a script. Just like many other Linux commands, chown has a recursive argument ****(**-R**) which tells the command to descend into the directory to operate on all files inside. Without the **-R** flag, you change permissions of the folder only, leaving the files inside it unchanged. In this example, assume that the intent is to change permissions of a directory and all its contents. Here I have added the **-v** (verbose) argument so that chown reports what it is doing:


```
$ ls -l . conf
.:
drwxrwxr-x 2 alan alan 4096 Aug  5 15:33 conf

conf:
-rw-rw-r-- 1 alan alan 0 Aug  5 15:33 conf.xml

$ chown -vR susan:delta conf
changed ownership of 'conf/conf.xml' from alan:alan to  susan:delta
changed ownership of 'conf' from alan:alan to  susan:delta
```

Depending on your role, you may need to use **sudo** to change ownership of a file.

You can use a reference file (**\--reference=RFILE**) when changing the ownership of files to match a certain configuration or when you don't know the ownership (as might be the case when running a script). You can duplicate the user and group of another file (**RFILE**, known as a reference file), for example, to undo the changes made above. Recall that a dot (**.**) refers to the present working directory.


```
`$ chown -vR --reference=. conf`
```

### Report Changes

Most commands have arguments for controlling their output. The most common is **-v** (-**-verbose**) to enable verbose, but chown also has a **-c** (**\--changes**) argument to instruct chown to only report when a change is made. Chown still reports other things, such as when an operation is not permitted.

The argument **-f** (**\--silent**, **\--quiet**) is used to suppress most error messages. I will use **-f** and the **-c** in the next section so that only actual changes are shown.

### Preserve Root

The root (**/**) of the Linux filesystem should be treated with great respect. If a mistake is made at this level, the consequences could leave a system completely useless. Particularly when you are running a recursive command that makes any kind of change or worse: deletions. The chown command has an argument that can be used to protect and preserve the root. The argument is **\--preserve-root**. If this argument is used with a recursive chown command on the root, nothing is done and a message appears instead.


```
$ chown -cfR --preserve-root alan /
chown: it is dangerous to operate recursively on '/'
chown: use --no-preserve-root to override this failsafe
```

The option has no effect when not used in conjunction with **\--recursive**. However, if the command is run by the root user, the permissions of the **/** itself will be changed, but not of other files or directories within.


```
$ chown -c --preserve-root alan /
chown: changing ownership of '/': Operation not permitted
[root@localhost /]# chown -c --preserve-root alan /
changed ownership of '/' from root to alan
```

### Ownership is security

File and directory ownership is part of good information security, so it's important to occasionally check and maintain file ownership to prevent unwanted access. The chown command is one of the most common and important in the set of Linux security commands.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-chown-command

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/greg-phttps://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/19/8/introduction-linux-chmod-command
