[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A beginner's guide to Linux permissions)
[#]: via: (https://opensource.com/article/19/6/understanding-linux-permissions)
[#]: author: (Bryant Son https://opensource.com/users/brson/users/greg-p/users/tj)

A beginner's guide to Linux permissions
======
Linux security permissions designate who can do what with a file or
directory.
![Hand putting a Linux file folder into a drawer][1]

One of the main benefits of Linux systems is that they are known to be less prone to security vulnerabilities and exploits than other systems. Linux definitely gives users more flexibility and granular controls over its file systems' security permissions. This may imply that it's critical for Linux users to understand security permissions. That isn't necessarily true, but it's still wise for beginning users to understand the basics of Linux permissions.

### View Linux security permissions

To start learning about Linux permissions, imagine we have a newly created directory called **PermissionDemo**. Run **cd** inside the directory and use the **ls -l** command to view the Linux security permissions. If you want to sort them by time modified, add the **-t** option.


```
`ls -lt`
```

Since there are no files inside this new directory, this command returns nothing.

![No output from ls -l command][2]

To learn more about the **ls** option, access its man page by entering **man ls** on the command line.

![ls man page][3]

Now, let's create two files: **cat.txt** and **dog.txt** with empty content; this is easy to do using the **touch** command. Let's also create an empty directory called **Pets** with the **mkdir** command. We can use the **ls -l** command again to see the permissions for these new files.

![Creating new files and directory][4]

We need to pay attention to two sections of output from this command.

### Who has permission?

The first thing to examine indicates _who_ has permission to access the file/directory. Note the section highlighted in the red box below. The first column refers to the _user_ who has access, while the second column refers to the _group_ that has access.

![Output from -ls command][5]

There are three main types of users: **user** , **group** ; and **other** (essentially neither a user nor a group). There is one more: **all** , which means practically everyone.

![User types][6]

Because we are using **root** as the user, we can access any file or directory because **root** is the superuser. However, this is generally not the case, and you will probably be restricted to your username. A list of all users is stored in the **/etc/passwd** file.

![/etc/passwd file][7]

Groups are maintained in the **/etc/group** file.

![/etc/passwd file][8]

### What permissions do they have?

The other section of the output from **ls -l** that we need to pay attention to relates to enforcing permissions. Above, we confirmed that the owner and group permissions for the files dog.txt and cat.txt and the directory Pets we created belong to the **root** account. We can use that information about who owns what to enforce permissions for the different user ownership types, as highlighted in the red box below.

![Enforcing permissions for different user ownership types][9]

We can dissect each line into five bits of information. The first part indicates whether it is a file or a directory; files are labeled with a **-** (hyphen), and directories are labeled with **d**. The next three parts refer to permissions for **user** , **group** , and **other** , respectively. The last part is a flag for the [**access-control list**][10] (ACL), a list of permissions for an object.

![Different Linux permissions][11]

Linux permission levels can be identified with letters or numbers. There are three privilege types:

  * **read** : r or 4
  * **write:** w or 2
  * **executable:** e or 1



![Privilege types][12]

The presence of each letter symbol ( **r** , **w** , or **x** ) means that the permission exists, while **-** indicates it does not. In the example below, the file is readable and writeable by the owner, only readable if the user belongs to the group, and readable and executable by anyone else. Converted to numeric notation, this would be 645 (see the image below for an explanation of how this is calculated).

![Permission type example][13]

Here are a few more examples:

![Permission type examples][14]

Test your knowledge by going through the following exercises.

![Permission type examples][15]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/understanding-linux-permissions

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson/users/greg-p/users/tj
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/sites/default/files/uploads/1_3.jpg (No output from ls -l command)
[3]: https://opensource.com/sites/default/files/uploads/1_man.jpg (ls man page)
[4]: https://opensource.com/sites/default/files/uploads/2_6.jpg (Creating new files and directory)
[5]: https://opensource.com/sites/default/files/uploads/3_2.jpg (Output from -ls command)
[6]: https://opensource.com/sites/default/files/uploads/4_0.jpg (User types)
[7]: https://opensource.com/sites/default/files/uploads/linuxpermissions_4_passwd.jpg (/etc/passwd file)
[8]: https://opensource.com/sites/default/files/uploads/linuxpermissions_4_group.jpg (/etc/passwd file)
[9]: https://opensource.com/sites/default/files/uploads/linuxpermissions_5.jpg (Enforcing permissions for different user ownership types)
[10]: https://en.wikipedia.org/wiki/Access-control_list
[11]: https://opensource.com/sites/default/files/uploads/linuxpermissions_6.jpg (Different Linux permissions)
[12]: https://opensource.com/sites/default/files/uploads/linuxpermissions_7.jpg (Privilege types)
[13]: https://opensource.com/sites/default/files/uploads/linuxpermissions_8.jpg (Permission type example)
[14]: https://opensource.com/sites/default/files/uploads/linuxpermissions_9.jpg (Permission type examples)
[15]: https://opensource.com/sites/default/files/uploads/linuxpermissions_10.jpg (Permission type examples)
