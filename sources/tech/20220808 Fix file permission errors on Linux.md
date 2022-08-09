[#]: subject: "Fix file permission errors on Linux"
[#]: via: "https://opensource.com/article/22/8/fix-file-permission-errors-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fix file permission errors on Linux
======
Don't let file permissions slow you down. Here's how to manage them on Linux and macOS.

![open source button on keyboard][1]

Image by: Opensource.com

If you're sharing files between two users over the network or "sneaker net" (saving a file to a hard drive and copying it to a computer), you may encounter permission errors when you try to read or write the file. Even if you understand the concept of , you may not know exactly how to diagnose the problem or solve it. I used to perform data migration as a service, so I've run into my fair share of permission errors and ownership conflicts. Here's how I fix them fast.

### 1. Determine the correct user

Before you can fix a permission error, you must determine who requires permission. You might think you already know that, but what you may not realize is that the user *name* isn't the most definitive attribute of user identity. Your computer doesn't see you as a person so much as it sees you as a number. To learn your number, take a look at your user ID:

```
$ id --user
1005
```

### 2. Get the current owner

Next, determine the owner of the file you're unable to interact with. Because there's a file permission problem happening, you may need to use the `sudo` command to see the information about the file:

```
$ sudo ls --numeric-uid-gid
-rw------- 1 1000 100  23041 Aug  2 05:26 bar
-rw------- 1 1000 100  54281 Aug  2 04:58 baz
-rw------- 1 1000 100    822 Aug  2 08:19 foo
```

In this example, the user owning the files is identified as user ID 1000, and that's why user ID 1005 can't interact with them. Worse yet, the files are marked as readable and writable only by the user that owns them, so not even members of the same group can interact with the files.

### 3. Change permissions to match

You know the user requiring permission, so you can change the current owner to match your current user:

```
$ sudo chown 1005 foo
```

You can also grant members of your group, and possibly other users on the system, access to the files by changing the file mode. For instance, to maintain read and write permissions (7) while granting read permissions (4) to the group and any other user:

```
$ sudo chmod 744 foo
```

### Learn more

File permissions can seem tricky when you're not comfortable with them. For more information on how file ownership works, read [Introduction to chown][2]. For more information on how file permissions work, read [Introduction to chmod][3].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/fix-file-permission-errors-linux

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/button_push_open_keyboard_file_organize.png
[2]: https://opensource.com/article/19/8/linux-chown-command
[3]: https://opensource.com/article/19/8/linux-chmod-command
