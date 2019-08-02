[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux permissions 101)
[#]: via: (https://opensource.com/article/19/8/linux-permissions-101)
[#]: author: (Alex Juarez https://opensource.com/users/mralexjuarezhttps://opensource.com/users/marcobravohttps://opensource.com/users/greg-p)

Linux permissions 101
======
Knowing how to control users' access to files is a fundamental system
administration skill.
![Penguins][1]

Understanding Linux permissions and how to control which users have access to files is a fundamental skill for systems administration.

This article will cover standard Linux file systems permissions, dig further into special permissions, and wrap up with an explanation of default permissions using **umask**.

### Understanding the ls command output

Before we can talk about how to modify permissions, we need to know how to view them. The **ls** command with the long listing argument (**-l**) gives us a lot of information about a file.


```
$ ls -lAh
total 20K
-rwxr-xr--+ 1 root root    0 Mar  4 19:39 file1
-rw-rw-rw-. 1 root root    0 Mar  4 19:39 file10
-rwxrwxr--+ 1 root root    0 Mar  4 19:39 file2
-rw-rw-rw-. 1 root root    0 Mar  4 19:39 file8
-rw-rw-rw-. 1 root root    0 Mar  4 19:39 file9
drwxrwxrwx. 2 root root 4.0K Mar  4 20:04 testdir
```

To understand what this means, let's break down the output regarding the permissions into individual sections. It will be easier to reference each section individually.

Take a look at each component of the final line in the output above:


```
`drwxrwxrwx. 2 root root 4.0K Mar  4 20:04 testdir`
```

Section 1 | Section 2 | Section 3 | Section 4 | Section 5 | Section 6 | Section 7
---|---|---|---|---|---|---
d | rwx | rwx | rwx | . | root | root

Section 1 (on the left) reveals what type of file it is.

d | Directory
---|---
- | Regular file
l | A soft link

The [info page][2] for **ls** has a full listing of the different file types.

Each file has three modes of access:

  * the owner
  * the group
  * all others



Sections 2, 3, and 4 refer to the user, group, and "other users" permissions. And each section can include a combination of **r** (read), **w** (write), and **x** (executable) permissions.

Each of the permissions is also assigned a numerical value, which is important when talking about the octal representation of permissions.

Permission | Octal Value
---|---
Read | 4
Write | 2
Execute | 1

Section 5 details any alternative access methods, such as SELinux or File Access Control List (FACL).

Method | Character
---|---
No other method | -
SELinux | .
FACLs | +
Any combination of methods | +

Sections 6 and 7 are the names of the owner and the group, respectively.

### Using chown and chmod

#### The chown command

The **chown** (change ownership) command is used to change a file's user and group ownership.

To change both the user and group ownership of the file **foo** to **root**, we can use these commands:


```
$ chown root:root foo
$ chown root: foo
```

Running the command with the user followed by a colon (**:**) sets both the user and group ownership.

To set only the user ownership of the file **foo** to the **root** user, enter:


```
`$ chown root foo`
```

To change only the group ownership of the file **foo**, precede the group with a colon:


```
`$ chown :root foo`
```

#### The chmod command

The **chmod** (change mode) command controls file permissions for the owner, group, and all other users who are neither the owner nor part of the group associated with the file.

The **chmod** command can set permissions in both octal (e.g., 755, 644, etc.) and symbolic (e.g., u+rwx, g-rwx, o=rw) formatting.

Octal notation assigns 4 "points" to **read**, 2 to **write**, and 1 to **execute**. If we want to assign the user **read** permissions, we assign 4 to the first slot, but if we want to add **write** permissions, we must add 2. If we want to add **execute**, then we add 1. We do this for each permission type: owner, group, and others.

For example, if we want to assign **read**, **write**, and **execute** to the owner of the file, but only **read** and **execute** to group members and all other users, we would use 755 in octal formatting. That's all permission bits for the owner (4+2+1), but only a 4 and 1 for the group and others (4+1).

> The breakdown for that is: 4+2+1=7; 4+1=5; and 4+1=5.

If we wanted to assign **read** and **write** to the owner of the file but only **read** to members of the group and all other users, we could use **chmod** as follows:


```
`$ chmod 644 foo_file`
```

In the examples below, we use symbolic notation in different groupings. Note the letters **u**, **g**, and **o** represent **user**, **group**, and **other**. We use **u**, **g**, and **o** in conjunction with **+**, **-**, or **=** to add, remove, or set permission bits.

To add the **execute** bit to the ownership permission set:


```
`$ chmod u+x foo_file`
```

To remove **read**, **write**, and **execute** from members of the group:


```
`$ chmod g-rwx foo_file`
```

To set the ownership for all other users to **read** and **write**:


```
`$ chmod o=rw`
```

### The special bits: Set UID, set GID, and sticky bits

In addition to the standard permissions, there are a few special permission bits that have some useful benefits.

#### Set user ID (suid)

When **suid** is set on a file, an operation executes as the owner of the file, not the user running the file. A [good example][3] of this is the **passwd** command. It needs the **suid** bit to be set so that changing a password runs with root permissions.


```
$ ls -l /bin/passwd
-rwsr-xr-x. 1 root root 27832 Jun 10  2014 /bin/passwd
```

An example of setting the **suid** bit would be:


```
`$ chmod u+s /bin/foo_file_name`
```

#### Set group ID (sgid)

The **sgid** bit is similar to the **suid** bit in the sense that the operations are done under the group ownership of the directory instead of the user running the command.

An example of using **sgid** would be if multiple users are working out of the same directory, and every file created in the directory needs to have the same group permissions. The example below creates a directory called **collab_dir**, sets the **sgid** bit, and changes the group ownership to **webdev**.


```
$ mkdir collab_dir
$ chmod g+s collab_dir
$ chown :webdev collab_dir
```

Now any file created in the directory will have the group ownership of **webdev** instead of the user who created the file.


```
$ cd collab_dir
$ touch file-sgid
$ ls -lah file-sgid
-rw-r--r--. 1 root webdev 0 Jun 12 06:04 file-sgid
```

#### The "sticky" bit

The sticky bit denotes that only the owner of a file can delete the file, even if group permissions would otherwise allow it. This setting usually makes the most sense on a common or collaborative directory such as **/tmp**. In the example below, the **t** in the **execute** column of the **all others** permission set indicates that the sticky bit has been applied.


```
$ ls -ld /tmp
drwxrwxrwt. 8 root root 4096 Jun 12 06:07 /tmp/
```

Keep in mind this does not prevent somebody from editing the file; it just keeps them from deleting the contents of a directory.

We set the sticky bit with:


```
`$ chmod o+t foo_dir`
```

On your own, try setting the sticky bit on a directory and give it full group permissions so that multiple users can read, write and execute on the directory because they are in the same group.

From there, create files as each user and then try to delete them as the other.

If everything is configured correctly, one user should not be able to delete users from the other user.

Note that each of these bits can also be set in octal format with SUID=4, SGID=2, and Sticky=1.


```
$ chmod 4744
$ chmod 2644
$ chmod 1755
```

#### Uppercase or lowercase?

If you are setting the special bits and see an uppercase **S** or **T** instead of lowercase (as we've seen until this point), it is because the underlying execute bit is not present. To demonstrate, the following example creates a file with the sticky bit set. We can then add/remove the execute bit to demonstrate the case change.


```
$ touch file cap-ST-demo
$ chmod 1755 cap-ST-demo
$ ls -l cap-ST-demo
-rwxr-xr-t. 1 root root 0 Jun 12 06:16 cap-ST-demo

$ chmod o-x cap-X-demo
$ ls -l cap-X-demo
-rwxr-xr-T. 1 root root 0 Jun 12 06:16 cap-ST-demo
```

#### Setting the execute bit conditionally

To this point, we've set the **execute** bit using a lowercase **x**, which sets it without asking any questions. We have another option: using an uppercase **X** instead of lowercase will set the **execute** bit only if it is already present somewhere in the permission group. This can be a difficult concept to explain, but the demo below will help illustrate it. Notice here that after trying to add the **execute** bit to the group privileges, it is not applied.


```
$ touch cap-X-file
$ ls -l cap-X-file
-rw-r--r--. 1 root root 0 Jun 12 06:31 cap-X-file
$ chmod g+X cap-X-file
$ ls -l cap-X-file
-rw-r--r--. 1 root root 0 Jun 12 06:31 cap-X-file
```

In this similar example, we add the execute bit first to the group permissions using the lowercase **x** and then use the uppercase **X** to add permissions for all other users. This time, the uppercase **X** sets the permissions.


```
$ touch cap-X-file
$ ls -l cap-X-file
-rw-r--r--. 1 root root 0 Jun 12 06:31 cap-X-file
$ chmod g+x cap-X-file
$ ls -l cap-X-file
-rw-r-xr--. 1 root root 0 Jun 12 06:31 cap-X-file
$ chmod g+x cap-X-file
$ chmod o+X cap-X-file
ls -l cap-X-file
-rw-r-xr-x. 1 root root 0 Jun 12 06:31 cap-X-file
```

### Understanding umask

The **umask** masks (or "blocks off") bits from the default permission set in order to define permissions for a file or directory. For example, a 2 in the **umask** output indicates it is blocking the **write** bit from a file, at least by default.

Using the **umask** command without any arguments allows us to see the current **umask** setting. There are four columns: the first is reserved for the special suid, sgid, or sticky bit, and the remaining three represent the owner, group, and other permissions.


```
$ umask
0022
```

To understand what this means, we can execute **umask** with a **-S** (as shown below) to get the result of masking the bits. For instance, because of the **2** value in the third column, the **write** bit is masked off from the group and other sections; only **read** and **execute** can be assigned for those.


```
$ umask -S
u=rwx,g=rx,o=rx
```

To see what the default permission set is for files and directories, let's set our **umask** to all zeros. This means that we are not masking off any bits when we create a file.


```
$ umask 000
$ umask -S
u=rwx,g=rwx,o=rwx

$ touch file-umask-000
$ ls -l file-umask-000
-rw-rw-rw-. 1 root root 0 Jul 17 22:03 file-umask-000
```

Now when we create a file, we see the default permissions are **read** (4) and **write** (2) for all sections, which would equate to 666 in octal representation.

We can do the same for a directory and see its default permissions are 777. We need the **execute** bit on directories so we can traverse through them.


```
$ mkdir dir-umask-000
$ ls -ld dir-umask-000
drwxrwxrwx. 2 root root 4096 Jul 17 22:03 dir-umask-000/
```

### Conclusion

There are many other ways an administrator can control access to files on a system. These permissions are basic to Linux, and we can build upon these fundamental aspects. If your work takes you into FACLs or SELinux, you will see that they also build upon these first rules of file access.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-permissions-101

作者：[Alex Juarez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mralexjuarezhttps://opensource.com/users/marcobravohttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ (Penguins)
[2]: https://www.gnu.org/software/texinfo/manual/info-stnd/info-stnd.html
[3]: https://www.theurbanpenguin.com/using-a-simple-c-program-to-explain-the-suid-permission/
