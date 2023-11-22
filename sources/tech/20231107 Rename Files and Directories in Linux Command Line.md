[#]: subject: "Rename Files and Directories in Linux Command Line"
[#]: via: "https://itsfoss.com/linux-rename-files-directories/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Rename Files and Directories in Linux Command Line
======

How do you rename files and directories in the Linux terminal? You use the mv command.

Yes, the same mv command which is used for 'moving' files and folders from one location to another.

You can simply specify the new name for the files and directories while 'moving them'.

To rename a file, use:

```

    mv old_file new_file

```

Similarly, to rename a directory, use:

```

    mv old_dir new_dir

```

Sounds easy, right? But I'll discuss renaming of files in detail here:

  * Show you practical examples of renaming
  * Show example of bulk renaming multiple files by combining the find and exec command
  * Discuss a dedicated rename utility for batch renaming files



Let's see it one by one.

### Renaming files and directories with mv command

Use the mv command to rename a file in the same directory:

```

    mv file1.txt file2.txt

```

Similarly, you can rename a directory in the same location:

```

    mv dir1 dir2

```

Here's an example where I rename a file and a directory:

![][1]

As you can see, unlike the [cp command][2], you don't have to use the recursive option for handling directories with [mv command][3].

🚧

If you trying renaming the file with the same name, you'll see an error (obviously).

You may also rename a file while moving it to another location:

```

    mv old-file-name another_dir/new-file-name

```

In the example below, I moved the file named `firefox-quiz.txt` to the sample directory. And while doing that, I renamed it `quiz.txt`.

![][4]

I think of it as the cut-paste operation.

💡

While you can move multiple files to another location (mv file1 file2 file2 dir), you CANNOT rename multiple files with mv. For that, you have to employ other tactics that I discuss in the following sections.

### Renaming multiple files matching a pattern by combining mv, find and exec commands

🚧

Be extra careful while batch renaming files like these. One wrong move and you'll end up with undesired result that can not be undone.

The find command is used for finding files in the given directory based on their name, type, modification time and other parameters. The [exec command is combined with find][5] to execute commands on the result of the find command.

There is no set, standard structure to use find, exec and mv commands. You can combine them as per your need.

Let's say you want to rename all the files ending with `.txt` in the current directory by adding `_old` in its name. So `file_1.txt` becomes `file_1.txt_old` etc.

```

    find . -type f -name "*.txt" -exec mv {} {}_old ;

```

![][6]

This is just an example and your renaming requirements could be different. Also, **the above works with filenames without spaces only**.

**Pro Tip** : When dealing with bulk actions like this, you can smartly use the echo command to see what action will be performed instead of actually performing it. If it looks alright, then go with the actual action.

For example, first see what files will be renamed:

```

    find . -type f -name "*.txt" -exec echo mv {} {}_old \;

```

![][7]

As you can see, no files were actually renamed. But you get to see what command will be the action if you run the above command without echo.

If it looks alright to you, remove the echo command and proceed with actual renaming.

```

    find . -type f -name "*.txt" -exec mv {} {}_old \;

```

I learned this trick in the Efficient Linux at the Command Line book. An excellent book filled with small gems like this. No wonder it has become one of [my favorite Linux books][8].

![][9]

##### New Book: Efficient Linux at the Command Line

Pretty amazing Linux book with lots of practical tips. It fills in the gap, even for experienced Linux users. Must have in your collection.

[Get it from Amazon][10]

### Renaming multiple files easily with the rename command

There is a handy command line utility called rename which could be used for batch renaming files based on the given Perl regex pattern.

This utility is not party of GNU toolchain and neither it comes preinstalled. So you have to use your distribution's package manager to install it first.

For Debian/Ubuntu, the command would be:

```

    sudo apt install rename

```

You can use it in the following manner:

```

    rename [options] perl_regex [files]

```

The options are:

  * -v : Verbose mode
  * -n : No action, show the files that would be renamed but don’t rename them
  * -o : No overwrite
  * -f : Force overwrite existing files
  * -s : Don't rename the soft link but its target



Now, let's take the same example that you saw in the previous section. Renaming the *.txt to .txt_old.

```

    rename 's/\.txt$/.txt_old/' **

```

I am not going to explain the regex here. The `**` means to look into all files in all subdirectories.

![][11]

And as you can see, it works as expected.

### Conclusion

I hope you liked this tip that helps you learn to do basic tasks in the Linux command line. Of course, it is for those who want to learn and use the command line. Desktop users always have the GUI tools for such tasks.

If you are absolutely new to Linux commands, this series will help you a great deal.

![][12]

Let me know if you have questions or suggestions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-rename-files-directories/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/11/renaming-file-directory-linux-command-line.png
[2]: https://itsfoss.com/cp-command/
[3]: https://linuxhandbook.com/mv-command/
[4]: https://itsfoss.com/content/images/2023/11/rename-file-while-moving-another-location.png
[5]: https://linuxhandbook.com/find-exec-command/
[6]: https://itsfoss.com/content/images/2023/11/bulk-renaming-files-linux-1.png
[7]: https://itsfoss.com/content/images/2023/11/use-echo-for-dry-run-renaming-files.png
[8]: https://itsfoss.com/best-linux-books/
[9]: https://itsfoss.com/content/images/2023/04/efficient-at-linux-command-line-horizontal.png
[10]: https://amzn.to/3MPjiHw
[11]: https://itsfoss.com/content/images/2023/11/use-rename-command-linux.png
[12]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
