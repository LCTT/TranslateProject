How to use special permissions: the setuid, setgid and sticky bits
======

### Objective

Getting to know how special permissions works, how to identify and set them.

### Requirements

  * Knowledge of the standard unix/linux permissions system

### Difficulty

EASY

### Conventions

  * **#** \- requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
  * **$** \- given command to be executed as a regular non-privileged user



### Introduction

Normally, on a unix-like operating system, the ownership of files and directories is based on the default `uid` (user-id) and `gid` (group-id) of the user who created them. The same thing happens when a process is launched: it runs with the effective user-id and group-id of the user who started it, and with the corresponding privileges. This behavior can be modified by using special permissions.

### The setuid bit

When the `setuid` bit is used, the behavior described above it's modified so that when an executable is launched, it does not run with the privileges of the user who launched it, but with that of the file owner instead. So, for example, if an executable has the `setuid` bit set on it, and it's owned by root, when launched by a normal user, it will run with root privileges. It should be clear why this represents a potential security risk, if not used correctly.

An example of an executable with the setuid permission set is `passwd`, the utility we can use to change our login password. We can verify that by using the `ls` command:
```

ls -l /bin/passwd
-rwsr-xr-x. 1 root root 27768 Feb 11 2017 /bin/passwd

```

How to identify the `setuid` bit? As you surely have noticed looking at the output of the command above, the `setuid` bit is represented by an `s` in place of the `x` of the executable bit. The `s` implies that the executable bit is set, otherwise you would see a capital `S`. This happens when the `setuid` or `setgid` bits are set, but the executable bit is not, showing the user an inconsistency: the `setuid` and `setgit` bits have no effect if the executable bit is not set. The setuid bit has no effect on directories.

### The setgid bit

Unlike the `setuid` bit, the `setgid` bit has effect on both files and directories. In the first case, the file which has the `setgid` bit set, when executed, instead of running with the privileges of the group of the user who started it, runs with those of the group which owns the file: in other words, the group ID of the process will be the same of that of the file.

When used on a directory, instead, the `setgid` bit alters the standard behavior so that the group of the files created inside said directory, will not be that of the user who created them, but that of the parent directory itself. This is often used to ease the sharing of files (files will be modifiable by all the users that are part of said group). Just like the setuid, the setgid bit can easily be spotted (in this case on a test directory):
```

ls -ld test
drwxrwsr-x. 2 egdoc egdoc 4096 Nov 1 17:25 test

```

This time the `s` is present in place of the executable bit on the group sector.

### The sticky bit

The sticky bit works in a different way: while it has no effect on files, when used on a directory, all the files in said directory will be modifiable only by their owners. A typical case in which it is used, involves the `/tmp` directory. Typically this directory is writable by all users on the system, so to make impossible for one user to delete the files of another one, the sticky bit is set:
```

$ ls -ld /tmp
drwxrwxrwt. 14 root root 300 Nov 1 16:48 /tmp

```

In this case the owner, the group, and all other users, have full permissions on the directory (read, write and execute). The sticky bit is identifiable by a `t` which is reported where normally the executable `x` bit is shown, in the "other" section. Again, a lowercase `t` implies that the executable bit is also present, otherwise you would see a capital `T`.

### How to set special bits

Just like normal permissions, the special bits can be assigned with the `chmod` command, using the numeric or the `ugo/rwx` format. In the former case the `setuid`, `setgid`, and `sticky` bits are represented respectively by a value of 4, 2 and 1. So for example if we want to set the `setgid` bit on a directory we would execute:
```
$ chmod 2775 test
```

With this command we set the `setgid` bit on the directory, (identified by the first of the four numbers), and gave full privileges on it to it's owner and to the user that are members of the group the directory belongs to, plus read and execute permission for all the other users (remember the execute bit on a directory means that a user is able to `cd` into it or use `ls` to list its content).

The other way we can set the special permissions bits is to use the ugo/rwx syntax:
```
$ chmod g+s test
```

To apply the `setuid` bit to a file, we would have run:
```
$ chmod u+s file
```

While to apply the sticky bit:
```
$ chmod o+t test
```

The use of special permissions can be very useful in some situations, but if not used correctly the can introduce serious vulnerabilities, so think twice before using them.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-use-special-permissions-the-setuid-setgid-and-sticky-bits

作者：[Egidio Docile][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
