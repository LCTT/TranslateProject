[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A deeper dive into Linux permissions)
[#]: via: (https://www.networkworld.com/article/3397790/a-deeper-dive-into-linux-permissions.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

A deeper dive into Linux permissions
======
Sometimes you see more than just the ordinary r, w, x and - designations when looking at file permissions on Linux. How can you get a clearer view of what the uncommon charactrers are trying to tell you and how do these permissions work?
![Sandra Henry-Stocker][1]

Sometimes you see more than just the ordinary **r** , **w** , **x** and **-** designations when looking at file permissions on Linux. Instead of **rwx** for the owner, group and other fields in the permissions string, you might see an **s** or **t** , as in this example:

```
drwxrwsrwt
```

One way to get a little more clarity on this is to look at the permissions with the **stat** command. The fourth line of stat’s output displays the file permissions both in octal and string format:

```
$ stat /var/mail
  File: /var/mail
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d      Inode: 1048833     Links: 2
Access: (3777/drwxrwsrwt)  Uid: (    0/    root)   Gid: (    8/    mail)
Access: 2019-05-21 19:23:15.769746004 -0400
Modify: 2019-05-21 19:03:48.226656344 -0400
Change: 2019-05-21 19:03:48.226656344 -0400
 Birth: -
```

This output reminds us that there are more than nine bits assigned to file permissions. In fact, there are 12. And those extra three bits provide a way to assign permissions beyond the usual read, write and execute — 3777 (binary 011111111111), for example, indicates that two extra settings are in use.

The first **1** (second bit) in this particular value represents the SGID (set group ID) and assigns temporary permission to run the file or use the directory with the permissions of the associated group.

```
011111111111
 ^
```

**SGID** gives temporary permissions to the person using the file to act as a member of that group.

The second **1** (third bit) is the “sticky” bit. It ensures that _only_ the owner of the file is able to delete or rename the file or directory.

```
011111111111
  ^
```

Had the permissions been 7777 rather than 3777, we’d have known that the SUID (set UID) field had also been set.

```
111111111111
^
```

**SUID** gives temporary permissions to the user using the file to act as the file owner.

As for the /var/mail directory which we looked at above, all users require some access so some special values are required to provide it.

But now let’s take this a step further.

One of the common uses of the special permission bits is with commands like the **passwd** command. If you look at the /usr/bin/passwd file, you’ll notice that the SUID bit is set, allowing you to change your password (and, thus, the contents of the /etc/shadow file) even when you’re running as an ordinary (not a privileged) user and have no read or write access to this file. Of course, the passwd command is clever enough not to allow you to change other people's passwords unless you are actually running as root or using sudo.

```
$ ls -l /usr/bin/passwd
-rwsr-xr-x 1 root root 63736 Mar 22 14:32 /usr/bin/passwd
$ ls -l /etc/shadow
-rw-r----- 1 root shadow 2195 Apr 22 10:46 /etc/shadow
```

Now, let’s look at what you can do with the these special permissions.

### How to assign special file permissions

As with many things on the Linux command line, you have some choices on how you make your requests. The **chmod** command allows you to change permissions numerically or using character expressions.

To change file permissions numerically, you might use a command like this to set the setuid and setgid bits:

```
$ chmod 6775 tryme
```

Or you might use a command like this:

```
$ chmod ug+s tryme <== for SUID and SGID permissions
```

If the file that you are adding special permissions to is a script, you might be surprised that it doesn’t comply with your expectations. Here’s a very simple example:

```
$ cat tryme
#!/bin/bash

echo I am $USER
```

Even with the SUID and SGID bits set and the file root-owned file, running a script like this won’t yield the “I am root” response you might expect. Why? Because Linux ignores the set-user-ID and set-group-ID bits on scripts.

```
$ ls -l tryme
-rwsrwsrwt 1 root root 29 May 26 12:22 tryme
$ ./tryme
I am jdoe
```

If you try something similar using a compiled program, on the other hand, as with this simple C program, you’ll see a different effect. In this example program, we prompt the user to enter a file and create it for them, giving the file write permission.

```
#include <stdlib.h>

int main()
{
    FILE *fp;   /* file pointer*/
    char fName[20];

    printf("Enter the name of file to be created: ");
    scanf("%s",fName);

    /* create the file with write permission */
    fp=fopen(fName,"w");
    /* check if file was created */
    if(fp==NULL)
    {
        printf("File not created");
        exit(0);
    }

    printf("File created successfully\n");
    return 0;
}
```

Once you compile the program and run the commands for both making root the owner and setting the needed permissions, you’ll see that it runs with root authority as expected — leaving a newly created root-owned file. Of course, you must have sudo privileges to run some of the required commands.

```
$ cc -o mkfile mkfile.c            <== compile the program
$ sudo chown root:root mkfile       <== change owner and group to “root”
$ sudo chmod ug+s mkfile        <== add SUID and SGID permissions
$ ./mkfile              <== run the program
Enter name of file to be create: empty
File created successfully
$ ls -l empty
-rw-rw-r-- 1 root root 0 May 26 13:15 empty
```

Notice that the file is owned by root — something that wouldn’t have happened if the program hadn’t run with root authority.

The positions of the uncommon settings in the permissions string (e.g., rw **s** rw **s** rw **t** ) can help remind us what each bit means. At least the first "s" (SUID) is in the owner-permissions area and the second (SGID) is in the group-permissions area. Why the sticky bit is a "t" instead of an "s" is beyond me. Maybe the founders imagined referring to it as the "tacky bit" and changed their minds due to less flattering second definition of the word. In any case, the extra permissions settings provide a lot of additional functionality to Linux and other Unix systems.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397790/a-deeper-dive-into-linux-permissions.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/shs_rwsr-100797564-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
