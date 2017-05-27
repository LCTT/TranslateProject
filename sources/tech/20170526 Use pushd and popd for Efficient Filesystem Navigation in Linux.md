Use ‘pushd’ and ‘popd’ for Efficient Filesystem Navigation in Linux
============================================================

Sometimes it can be painful to navigate the Linux file system with commands, especially for the newbies. Normally, we primarily use the [cd (Change Directory) command][1] for moving around the Linux file system.

In a previous article, we reviewed a simple yet helpful CLI utility for Linux called [bd – for quickly moving back into a parent directory][2] without typing cd ../../.. repeatedly.

This tutorial will explain a related set of commands: “pushd” and “popd” which are used for efficient navigation of the Linux directory structure. They exist in most shells such as bash, tcsh etc.

**Suggested Read:** [Autojump – An Advanced ‘cd’ Command to Quickly Navigate Linux Filesystem][3]

### How pushd and popd Commands Work in Linux

pushd and popd work according to the “LIFO” (last in, first out) principle. In this principle, only two operations are allowed: push an item into the stack, and pop an item out of the stack.

pushd adds a directory to the top of the stack and popd removes a directory from the top of the stack.

To display directories in the directory stack (or history), we can use the dirs command as shown.

```
$ dirs
OR
$ dirs -v
```

![Dirs - Display Directories in Directory](https://www.tecmint.com/wp-content/uploads/2017/05/dirs-command.png)

Dirs – Display Directories in Directory

pushd command – puts/adds directory paths onto a directory stack (history) and later allowing you to navigate back to any directory in history. While you add directories to the stack, it also echoes what’s existing in history (or “stack”).

The commands show how pushd works:

```
$ pushd  /var/www/html/
$ pushd ~/Documents/
$ pushd ~/Desktop/
$ pushd /var/log/
```

![pushd - Add Directories to Stack](https://www.tecmint.com/wp-content/uploads/2017/05/pushd-examples.png)

pushd – Add Directories to Stack

From directory stack in the output above (directory index is in reverse order):

*   /var/log is the fifth [index 0] in the directory stack.

*   ~/Desktop/ is fourth [index 1].

*   ~/Documents/ is third [index 2].

*   /var/www/html/ is second [index 3] and

*   ~ is first [index 4].

Optionally, we can use the directory index in the form `pushd +#` or `pushd -#` to add directories to the stack. To move into ~/Documents, we would type:

```
$ pushd +2
```

![pushd - Directory Navigation with Number](https://www.tecmint.com/wp-content/uploads/2017/05/pushd-Directory-Navigation-with-Number.png)

pushd – Directory Navigation with Number

Note after this, the stack content will change. So from the previous example, to move into /var/www/html, we would use:

```
$ pushd +1
```

![pushd - Navigate Directory with Number](https://www.tecmint.com/wp-content/uploads/2017/05/pushd-Navigate-Directory-with-Number.png)

pushd – Navigate Directory with Number

popd command – removes a directory from the top of the stack or history. To list the directory stack, type:

```
$ popd
```

To remove a directory from the directory stack inded use `popd +#` or `popd -#`, in this case, we would type the command below to remove ~/Documents:

```
$ popd +1
```

![popd - Remove Directory from Stack](https://www.tecmint.com/wp-content/uploads/2017/05/popd-exmples.png)

popd – Remove Directory from Stack

Also check out: [Fasd – A Commandline Tool That Offers Quick Access to Files and Directories][4]

In this tutorial we explained “pushd” and “popd” commands which are used for efficient navigation of the directory structure. Share your thoughts concerning this article via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

-----

via: https://www.tecmint.com/pushd-and-popd-linux-filesystem-navigation/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/cd-command-in-linux/
[2]:https://www.tecmint.com/bd-quickly-go-back-to-a-linux-parent-directory/
[3]:https://www.tecmint.com/autojump-a-quickest-way-to-navigate-linux-filesystem/
[4]:https://www.tecmint.com/autojump-a-quickest-way-to-navigate-linux-filesystem/
[5]:https://www.tecmint.com/author/aaronkili/
[6]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:https://www.tecmint.com/free-linux-shell-scripting-books/
