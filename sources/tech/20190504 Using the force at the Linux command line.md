[#]: collector: (lujun9972)
[#]: translator: (Moelf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the force at the Linux command line)
[#]: via: (https://opensource.com/article/19/5/may-the-force-linux)
[#]: author: (Alan Formy-Duval  https://opensource.com/users/alanfdoss)

Using the force at the Linux command line
======
Like the Jedi Force, -f is powerful, potentially destructive, and very
helpful when you know how to use it.
![Fireworks][1]

Sometime in recent history, sci-fi nerds began an annual celebration of everything [_Star Wars_ on May the 4th][2], a pun on the Jedi blessing, "May the Force be with you." Although most Linux users are probably not Jedi, they still have ways to use the force. Of course, the movie might not have been quite as exciting if Yoda simply told Luke to type **man X-Wing fighter** or **man force**. Or if he'd said, "RTFM" (Read the Force Manual, of course).

Many Linux commands have an **-f** option, which stands for, you guessed it, force! Sometimes when you execute a command, it fails or prompts you for additional input. This may be an effort to protect the files you are trying to change or inform the user that a device is busy or a file already exists.

If you don't want to be bothered by prompts or don't care about errors, use the force!

Be aware that using a command's force option to override these protections is, generally, destructive. Therefore, the user needs to pay close attention and be sure that they know what they are doing. Using the force can have consequences!

Following are four Linux commands with a force option and a brief description of how and why you might want to use it.

### cp

The **cp** command is short for copy—it's used to copy (or duplicate) a file or directory. The [man page][3] describes the force option for **cp** as:


```
-f, --force
if an existing destination file cannot be opened, remove it
and try again
```

This example is for when you are working with read-only files:


```
[alan@workstation ~]$ ls -l
total 8
-rw-rw---- 1 alan alan 13 May 1 12:24 Hoth
-r--r----- 1 alan alan 14 May 1 12:23 Naboo
[alan@workstation ~]$ cat Hoth Naboo
Icy Planet

Green Planet
```

If you want to copy a file called _Hoth_ to _Naboo_ , the **cp** command will not allow it since _Naboo_ is read-only:


```
[alan@workstation ~]$ cp Hoth Naboo
cp: cannot create regular file 'Naboo': Permission denied
```

But by using the force, **cp** will not prompt. The contents and permissions of _Hoth_ will immediately be copied to _Naboo_ :


```
[alan@workstation ~]$ cp -f Hoth Naboo
[alan@workstation ~]$ cat Hoth Naboo
Icy Planet

Icy Planet

[alan@workstation ~]$ ls -l
total 8
-rw-rw---- 1 alan alan 12 May 1 12:32 Hoth
-rw-rw---- 1 alan alan 12 May 1 12:38 Naboo
```

Oh no! I hope they have winter gear on Naboo.

### ln

The **ln** command is used to make links between files. The [man page][4] describes the force option for **ln** as:


```
-f, --force
remove existing destination files
```

Suppose Princess Leia is maintaining a Java application server and she has a directory where all Java versions are stored. Here is an example:


```
leia@workstation:/usr/lib/java$ ls -lt
total 28
lrwxrwxrwx 1 leia leia 12 Mar 5 2018 jdk -> jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Mar 5 2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28 2017 jdk1.8.0_144
```

As you can see, there are several versions of the Java Development Kit (JDK) and a symbolic link pointing to the latest one. She uses a script with the following commands to install new JDK versions. However, it won't work without a force option or unless the root user runs it:


```
tar xvzmf jdk1.8.0_181.tar.gz -C jdk1.8.0_181/
ln -vs jdk1.8.0_181 jdk
```

The **tar** command will extract the .gz file to the specified directory, but the **ln** command will fail to upgrade the link because one already exists. The result will be that the link no longer points to the latest JDK:


```
leia@workstation:/usr/lib/java$ ln -vs jdk1.8.0_181 jdk
ln: failed to create symbolic link 'jdk/jdk1.8.0_181': File exists
leia@workstation:/usr/lib/java$ ls -lt
total 28
drwxr-x--- 2 leia leia 4096 May 1 15:44 jdk1.8.0_181
lrwxrwxrwx 1 leia leia 12 Mar 5 2018 jdk -> jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Mar 5 2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28 2017 jdk1.8.0_144
```

She can force **ln** to update the link correctly by passing the force option and one other, **-n**. The **-n** is needed because the link points to a directory. Now, the link again points to the latest JDK:


```
leia@workstation:/usr/lib/java$ ln -vsnf jdk1.8.0_181 jdk
'jdk' -> 'jdk1.8.0_181'
leia@workstation:/usr/lib/java$ ls -lt
total 28
lrwxrwxrwx 1 leia leia 12 May 1 16:13 jdk -> jdk1.8.0_181
drwxr-x--- 2 leia leia 4096 May 1 15:44 jdk1.8.0_181
drwxr-xr-x 8 leia leia 4096 Mar 5 2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28 2017 jdk1.8.0_144
```

A Java application can be configured to find the JDK with the path **/usr/lib/java/jdk** instead of having to change it every time Java is updated.

### rm

The **rm** command is short for "remove" (which we often call delete, since some other operating systems have a **del** command for this action). The [man page][5] describes the force option for **rm** as:


```
-f, --force
ignore nonexistent files and arguments, never prompt
```

If you try to delete a read-only file, you will be prompted by **rm** :


```
[alan@workstation ~]$ ls -l
total 4
-r--r----- 1 alan alan 16 May 1 11:38 B-wing
[alan@workstation ~]$ rm B-wing
rm: remove write-protected regular file 'B-wing'?
```

You must type either **y** or **n** to answer the prompt and allow the **rm** command to proceed. If you use the force option, **rm** will not prompt you and will immediately delete the file:


```
[alan@workstation ~]$ rm -f B-wing
[alan@workstation ~]$ ls -l
total 0
[alan@workstation ~]$
```

The most common use of force with **rm** is to delete a directory. The **-r** (recursive) option tells **rm** to remove a directory. When combined with the force option, it will remove the directory and all its contents without prompting.

The **rm** command with certain options can be disastrous. Over the years, online forums have filled with jokes and horror stories of users completely wiping their systems. This notorious usage is **rm -rf ***. This will immediately delete all files and directories without any prompt wherever it is used.

### userdel

The **userdel** command is short for user delete, which will delete a user. The [man page][6] describes the force option for **userdel** as:


```
-f, --force
This option forces the removal of the user account, even if the
user is still logged in. It also forces userdel to remove the
user's home directory and mail spool, even if another user uses
the same home directory or if the mail spool is not owned by the
specified user. If USERGROUPS_ENAB is defined to yes in
/etc/login.defs and if a group exists with the same name as the
deleted user, then this group will be removed, even if it is
still the primary group of another user.

Note: This option is dangerous and may leave your system in an
inconsistent state.
```

When Obi-Wan reached the castle on Mustafar, he knew what had to be done. He had to delete Darth's user account—but Darth was still logged in.


```
[root@workstation ~]# ps -fu darth
UID PID PPID C STIME TTY TIME CMD
darth 7663 7655 0 13:28 pts/3 00:00:00 -bash
[root@workstation ~]# userdel darth
userdel: user darth is currently used by process 7663
```

Since Darth is currently logged in, Obi-Wan has to use the force option to **userdel**. This will delete the user account even though it's logged in.


```
[root@workstation ~]# userdel -f darth
userdel: user darth is currently used by process 7663
[root@workstation ~]# finger darth
finger: darth: no such user.
[root@workstation ~]# ps -fu darth
error: user name does not exist
```

As you can see, the **finger** and **ps** commands confirm the user Darth has been deleted.

### Using force in shell scripts

Many other commands have a force option. One place force is very useful is in shell scripts. Since we use scripts in cron jobs and other automated operations, avoiding any prompts is crucial, or else these automated processes will not complete.

I hope the four examples I shared above help you understand how certain circumstances may require the use of force. You should have a strong understanding of the force option when used at the command line or in creating automation scripts. It's misuse can have devastating effects—sometimes across your infrastructure, and not only on a single machine.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/may-the-force-linux

作者：[Alan Formy-Duval ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fireworks_light_art_design.jpg?itok=hfx9i4By (Fireworks)
[2]: https://www.starwars.com/star-wars-day
[3]: http://man7.org/linux/man-pages/man1/cp.1.html
[4]: http://man7.org/linux/man-pages/man1/ln.1.html
[5]: http://man7.org/linux/man-pages/man1/rm.1.html
[6]: http://man7.org/linux/man-pages/man8/userdel.8.html
