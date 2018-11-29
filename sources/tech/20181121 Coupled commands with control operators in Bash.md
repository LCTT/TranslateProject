Translating by Jamskr

Coupled commands with control operators in Bash
======
Add logic to the command line with control operators in compound commands.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-yearbook-best-couple.png?itok=a_99oCdE)

Simple compound commands—such as stringing several commands together in a sequence on the command line—are used often. Such commands are separated by semicolons, which define the end of a command. To create a simple series of shell commands on a single line, simply separate each command using a semicolon, like this:

```
command1 ; command2 ; command3 ; command4 ;
```

You don't need to add a final semicolon because pressing the Enter key implies the end of the final command, but it's fine to add it for consistency.

**& &** and **||** control operators built into Bash. These two control operators provide some flow control and enable us to alter the code-execution sequence. The semicolon and the **newline** character are also considered to be Bash control operators.

All the commands will run without a problem—as long as no error occurs. But what happens if an error happens? We can anticipate and allow for errors using theandcontrol operators built into Bash. These two control operators provide some flow control and enable us to alter the code-execution sequence. The semicolon and thecharacter are also considered to be Bash control operators.

The **& &** operator simply says "if command1 is successful, then run command2." If command1 fails for any reason, command2 won't run. That syntax looks like:

```
command1 && command2
```

This works because every command returns a code to the shell that indicates whether it completed successfully or failed during execution. By convention, a return code (RC) of 0 (zero) indicates success and any positive number indicates some type of failure. Some sysadmin tools just return a 1 to indicate any failure, but many use other positive numerical codes to indicate the type of failure.

The Bash shell's **$?** variable can be checked very easily by a script, by the next command in a list of commands, or even directly by a sysadmin. Let's look at RCs. We can run a simple command and immediately check the RC, which will always pertain to the last command that ran.

```
[student@studentvm1 ~]$ ll ; echo "RC = $?"
total 284
-rw-rw-r--  1 student student   130 Sep 15 16:21 ascii-program.sh
drwxrwxr-x  2 student student  4096 Nov 10 11:09 bin
<snip>
drwxr-xr-x. 2 student student  4096 Aug 18 10:21 Videos
RC = 0
[student@studentvm1 ~]$
```

This RC is 0, which means the command completed successfully. Now try the same command on a directory where we don't have permissions.

```
[student@studentvm1 ~]$ ll /root ; echo "RC = $?"
ls: cannot open directory '/root': Permission denied
RC = 2
[student@studentvm1 ~]$
```

This RC's meaning can be found in the [**ls** command's man page][1].

Let's try the **& &** control operator as it might be used in a command-line program. We'll start with something simple: Create a new directory and, if that is successful, create a new file in it.

We need a directory where we can create other directories. First, create a temporary directory in your home directory where you can do some testing.

```
[student@studentvm1 ~]$ cd ; mkdir testdir
```

Create a new directory in **~/testdir** , which should be empty because you just created it, and then create a new, empty file in that new directory. The following command will do those tasks.

```
[student@studentvm1 ~]$ mkdir ~/testdir/testdir2 && touch ~/testdir/testdir2/testfile1
[student@studentvm1 ~]$ ll ~/testdir/testdir2/
total 0
-rw-rw-r-- 1 student student 0 Nov 12 14:13 testfile1
[student@studentvm1 ~]$
```

We know everything worked as it should because the **testdir** directory is accessible and writable. Change the permissions on **testdir** so it is no longer accessible to the user **student** as follows:

```
[student@studentvm1 ~]$ chmod 076 testdir ; ll | grep testdir
d---rwxrw-. 3 student student  4096 Nov 12 14:13 testdir
[student@studentvm1 ~]$
```

Using the **grep** command after the long list ( **ll** ) shows the listing for **testdir**. You can see that the user **student** no longer has access to the **testdir** directory. Now let's run almost the same command as before but change it to create a different directory name inside **testdir**.

```
[student@studentvm1 ~]$ mkdir ~/testdir/testdir3 && touch ~/testdir/testdir3/testfile1
mkdir: cannot create directory ‘/home/student/testdir/testdir3’: Permission denied
[student@studentvm1 ~]$
```

Although we received an error message, using the **& &** control operator prevents the **touch** command from running because there was an error in creating **testdir3**. This type of command-line logical flow control can prevent errors from compounding and making a real mess of things. But let's make it a little more complicated.

The **||** control operator allows us to add another command that executes when the initial program statement returns a code larger than zero.

```
[student@studentvm1 ~]$ mkdir ~/testdir/testdir3 && touch ~/testdir/testdir3/testfile1 || echo "An error occurred while creating the directory."
mkdir: cannot create directory ‘/home/student/testdir/testdir3’: Permission denied
An error occurred while creating the directory.
[student@studentvm1 ~]$
```

Our compound command syntax using flow control takes this general form when we use the **& &** and **||** control operators:

```
preceding commands ; command1 && command2 || command3 ; following commands
```

The compound command using the control operators may be preceded and followed by other commands that can be related to the ones in the flow-control section but which are unaffected by the flow control. All of those commands will execute without regard to anything that takes place inside the flow-control compound command.

These flow-control operators can make working at the command line more efficient by handling decisions and letting us know when a problem has occurred. I use them directly on the command line as well as in scripts.

You can clean up as the root user to delete the directory and its contents.

```
[root@studentvm1 ~]# rm -rf /home/student/testdir
```

How do you use Bash control operators? Let us know in the comment section.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/control-operators-bash-shell

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: http://man7.org/linux/man-pages/man1/ls.1.html
