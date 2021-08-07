[#]: subject: (Move files in the Linux terminal)
[#]: via: (https://opensource.com/article/21/8/move-files-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Move files in the Linux terminal
======
Use the mv command to move a file from one location to another.
![Moving files][1]

To move a file on a computer with a graphical interface, you open the folder where the file is currently located, and then open another window to the folder you want to move the file into. Finally, you drag and drop the file from one to the other.

To move a file in a terminal, you use the ** **mv** command to move a file from one location to another.


```
$ mv example.txt ~/Documents

$ ls ~/Documents
example.txt
```

In this example, you've moved **example.txt** from its current folder into the **Documents** folder.

As long as you know where you want to take a file _from_ and where you want to move it _to_, you can send files from any location to any location, no matter where you are. This can be a serious time saver compared to navigating through all the folders on your computer in a series of windows just to locate a file, and then opening a new window to where you want that file to go, and then dragging that file.

The **mv** command by default does exactly as it's told: it moves a file from one location to another. Should a file with the same name already exist in the destination location, it gets overwritten. To prevent a file from being overwritten without warning, use the **\--interactive** (or **-i** for short) option:


```
$ mv -i example.txt ~/Documents
mv: overwrite '/home/tux/Documents/example.txt'?
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/move-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s05.svg_.png?itok=PgKQEDZ7 (Moving files)
