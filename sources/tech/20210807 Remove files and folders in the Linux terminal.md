[#]: subject: "Remove files and folders in the Linux terminal"
[#]: via: "https://opensource.com/article/21/8/remove-files-linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Remove files and folders in the Linux terminal
======
Learn to safely remove files and folders in the Linux terminal.
![Removing files][1]

To remove a file on a computer using a graphical interface, you usually drag a file or a folder to a "trash" or "recycle" bin. Alternately, you might be able to select the file or folder you want to remove, right-click, and select **Delete**.

When removing a file or folder in the terminal, there is no trash bin, at least by default. On a graphical desktop, the Trash is a protected directory so that users don't accidentally trash the Trash, or move it from its default location and lose track of it. The Trash is just a highly managed folder, so you can make your own Trash folder for use in your terminal.

### Setting up a trash bin for the terminal

Create a directory called **Trash** in your home directory:


```
`$ mkdir ~/Trash`
```

### Removing a file

When you want to remove a file or folder, use the **mv** command to move a file or directory to your Trash:


```
`$ mv example.txt ~/Trash`
```

### Deleting a file or folder permanently

When you're ready to remove a file or folder from your system permanently, you can use the **rm** command to erase all of the data in your Trash folder. By directing the **rm** command to an asterisk (`*`), you delete all files and folders inside the **Trash** folder without deleting the **Trash** folder itself. If you accidentally delete the **Trash** folder, however, you can just recreate it because directories are easy and free to create.


```
`$ rm --recursive ~/Trash/*`
```

### Removing an empty directory

Deleting an empty directory has the special command **rmdir**, which only removes an empty directory, protecting you from recursive mistakes.


```
$ mkdir full
$ touch full/file.txt
$ rmdir full
rmdir: failed to remove 'full/': Directory not empty

$ mkdir empty
$ rmdir empty
```

### Better trash

There are [commands for trashing files][2] that aren't included by default in your terminal, but that you can install from a software repository. They make it even easier to trash files, because they manage and use the very same Trash folder you use on your desktop.


```
$ trash ~/example.txt
$ trash --list
example.txt
$ trash --empty
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/remove-files-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s10.svg_.png?itok=p07au80e (Removing files)
[2]: https://www.redhat.com/sysadmin/recover-file-deletion-linux
