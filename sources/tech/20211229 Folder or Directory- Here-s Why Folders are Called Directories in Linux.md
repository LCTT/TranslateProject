[#]: subject: "Folder or Directory? Here’s Why Folders are Called Directories in Linux"
[#]: via: "https://itsfoss.com/folder-directory-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: " "
[#]: url: " "

Folder or Directory? Here’s Why Folders are Called Directories in Linux
======

If you start using computers with Windows, you are likely to use the term folder.

But when you switch to Linux, you’ll find that folders are often termed as directory.

This may confuse some new Linux users. Should you call it folder or directory? Is there even a difference?

Here’s the thing. You can call it folder if you want or directory if you like. It won’t make a difference.

But if you wonder why a folder is called directory in Linux, here is some explanation.

### Why is a folder called a directory in Linux?

Before I explain that, let’s recall what a folder and directory are used for in the real world.

A folder (envelope) can be used to keep several files (or other items) in it. A directory can be used to maintain an index of items so that you can find which items is located where.

![Illustration of folder and directory][1]

Now, let’s go back to directory. The term existed even before the existence of Linux. It is coming from the UNIX era. Linux inherits a lot of things from UNIX and this is just one of those many things.

Now let me tell you something that may surprise you. A directory does NOT really keep files inside it. _**Directory is a ‘special file’ that knows where (the content of) a file is stored in the memory (through [inode][2]).**_

This makes sense why it is called directory. A directory keeps the index of items, not necessarily the items themselves. The directories in Linux and UNIX don’t keep the files inside it. They just have the information about the location of files.

If you want to learn more on it, my article on [hard links][3] should help you.

So, why it is called a folder then? To me, it comes from the perspective. When you are in a graphical environment, you visualize things. Here, files can be visualized like pages and those file pages are stored in an envelope (folder).

When the operating systems started using graphical elements, I think some terms were changed accordingly and directory-folder was one of them.

### Should you call it folder or directory?

That’s entirely up to you. You can use either term at your convenience.

However, if you are learning Linux command line or use it often, using the term directory could be a tad bit more helpful.

There are Linux commands like mkdir, rmdir etc. The term ‘dir’ gives a hint that these commands have something to do with directories.

Similarly, many Linux commands and bash scripts will use option `-d` for directories and `-f` for files.

Even the file properties in the terminal distinguish between files and folders (directories) by putting the letter `d` in front of the directories.

Take this example where I have a file names ‘some’ and a folder/directory named ‘something’. Notice how various Linux commands distinguish between file and directory with ‘dir’ or ‘d’.

![Example showing the difference between files and directories operations][4]

All this makes me think that using the term ‘directory’ will be beneficial while using Linux commands. It would be easier for your subconscious mind to relate the terms ‘dir’ and ‘d’ with directory.

Once again, it’s entirely up to you if you want to call it folder or directory. People would understand what you are referring to.

I just gave some insight into historical origin of term directory and this should give you some hint on why people say ‘everything is a file in Linux/UNIX’.

Now that I end my ramblings, I invite your comment on it. If you find any technical inaccuracies, let me know, please.

--------------------------------------------------------------------------------

via: https://itsfoss.com/folder-directory-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/folder-directory.png?resize=800%2C450&ssl=1
[2]: https://linuxhandbook.com/inode-linux/
[3]: https://linuxhandbook.com/hard-link/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/file-directory-commands-difference.png?resize=800%2C378&ssl=1
