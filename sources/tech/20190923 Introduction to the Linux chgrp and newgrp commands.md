[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to the Linux chgrp and newgrp commands)
[#]: via: (https://opensource.com/article/19/9/linux-chgrp-and-newgrp-commands)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/seth)

Introduction to the Linux chgrp and newgrp commands
======
The chgrp and newgrp commands help you manage files that need to
maintain group ownership.
![Penguins walking on the beach ][1]

In a recent article, I introduced the [**chown** command][2], which is used for modifying ownership of files on systems. Recall that ownership is the combination of the user and group assigned to an object. The **chgrp** and **newgrp** commands provide additional help for managing files that need to maintain group ownership.

### Using chgrp

The **chgrp** command simply changes the group ownership of a file. It is the same as the **chown :&lt;group&gt;** command. You can use:


```
`$chown :alan mynotes`
```

or:


```
`$chgrp alan mynotes`
```

#### Recursive

A few additional arguments to chgrp can be useful at both the command line and in a script. Just like many other Linux commands, chgrp has a recursive argument, **-R**. You will need this to operate on a directory and its contents recursively, as I'll demonstrate below. I added the **-v** (**verbose**) argument so chgrp tells me what it is doing:


```
$ ls -l . conf
.:
drwxrwxr-x 2 alan alan 4096 Aug  5 15:33 conf

conf:
-rw-rw-r-- 1 alan alan 0 Aug  5 15:33 conf.xml
# chgrp -vR delta conf
changed group of 'conf/conf.xml' from alan to delta
changed group of 'conf' from alan to delta
```

#### Reference

A reference file (**\--reference=RFILE**) can be used when changing the group on files to match a certain configuration or when you don't know the group, as might be the case when running a script. You can duplicate another file's group (**RFILE**), referred to as a reference file. For example, to undo the changes made above (recall that a dot [**.**] refers to the present working directory):


```
`$ chgrp -vR --reference=. conf`
```

#### Report changes

Most commands have arguments for controlling their output. The most common is **-v** to enable verbose, and the chgrp command has a verbose mode. It also has a **-c** (**\--changes**) argument, which instructs chgrp to report only when a change is made. Chgrp will still report other things, such as if an operation is not permitted.

The argument **-f** (**\--silent**, **\--quiet**) is used to suppress most error messages. I will use this argument and **-c** in the next section so it will show only actual changes.

#### Preserve root

The root (**/**) of the Linux filesystem should be treated with great respect. If a command mistake is made at this level, the consequences can be terrible and leave a system completely useless. Particularly when you are running a recursive command that will make any kind of change—or worse, deletions. The chgrp command has an argument that can be used to protect and preserve the root. The argument is **\--preserve-root**. If this argument is used with a recursive chgrp command on the root, nothing will happen and a message will appear instead:


```
[root@localhost /]# chgrp -cfR --preserve-root a+w /
chgrp: it is dangerous to operate recursively on '/'
chgrp: use --no-preserve-root to override this failsafe
```

The option has no effect when it's not used in conjunction with recursive. However, if the command is run by the root user, the permissions of **/** will change, but not those of other files or directories within it:


```
[alan@localhost /]$ chgrp -c --preserve-root alan /
chgrp: changing group of '/': Operation not permitted
[root@localhost /]# chgrp -c --preserve-root alan /
changed group of '/' from root to alan
```

Surprisingly, it seems, this is not the default argument. The option **\--no-preserve-root** is the default. If you run the command above without the "preserve" option, it will default to "no preserve" mode and possibly change permissions on files that shouldn't be changed:


```
[alan@localhost /]$ chgrp -cfR alan /
changed group of '/dev/pts/0' from tty to alan
changed group of '/dev/tty2' from tty to alan
changed group of '/var/spool/mail/alan' from mail to alan
```

### About newgrp

The **newgrp** command allows a user to override the current primary group. newgrp can be handy when you are working in a directory where all files must have the same group ownership. Suppose you have a directory called _share_ on your intranet server where different teams store marketing photos. The group is **share**. As different users place files into the directory, the files' primary groups might become mixed up. Whenever new files are added, you can run **chgrp** to correct any mix-ups by setting the group to **share**:


```
$ cd share
ls -l
-rw-r--r--. 1 alan share 0 Aug  7 15:35 pic13
-rw-r--r--. 1 alan alan 0 Aug  7 15:35 pic1
-rw-r--r--. 1 susan delta 0 Aug  7 15:35 pic2
-rw-r--r--. 1 james gamma 0 Aug  7 15:35 pic3
-rw-rw-r--. 1 bill contract  0 Aug  7 15:36 pic4
```

I covered **setgid** mode in my article on the [**chmod** command][3]. This would be one way to solve this problem. But, suppose the setgid bit was not set for some reason. The newgrp command is useful in this situation. Before any users put files into the _share_ directory, they can run the command **newgrp share**. This switches their primary group to **share** so all files they put into the directory will automatically have the group **share**, rather than the user's primary group. Once they are finished, users can switch back to their regular primary group with (for example):


```
`newgrp alan`
```

### Conclusion

It is important to understand how to manage users, groups, and permissions. It is also good to know a few alternative ways to work around problems you might encounter since not all environments are set up the same way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-chgrp-and-newgrp-commands

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A (Penguins walking on the beach )
[2]: https://opensource.com/article/19/8/linux-chown-command
[3]: https://opensource.com/article/19/8/linux-chmod-command
