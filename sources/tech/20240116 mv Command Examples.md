[#]: subject: "mv Command Examples"
[#]: via: "https://itsfoss.com/mv-command/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

mv Command Examples
======

The **mv** command in Linux is used to rename and move files.

Please don't confuse it with the **cp** command. The **cp** command is used to copy files from one to another directory, whereas the mv command is for cutting and pasting files.

For a more in-depth understanding of the **mv command** , I'll be sharing the following aspects of the mv command:

  * The syntax of the **mv** command
  * Some practical examples of the mv command
  * Practice questions to get the most out of it



Let us get started...

### Here's How to use mv command in Linux

To get the most out of any command, you must learn the command syntax and the available options so you know the true potential of the utility.

So here's the command syntax for the mv command:

```

    mv [options] source destination

```

Here,

  * `[options]`: it is used to modify the default behavior of the mv command such as the `-f` option to force overwriting.
  * `source`: here's where you specify the file or path to the file which needs to be moved or renamed.
  * `destination`: here's where you specify the location where you want the file to be moved.



But as I mentioned, the mv command is used to rename and move files, and you can achieve both without using any options. Here's how:

  * When you use the mv command and use the same path in the `source` and `destination` field, it renames the file.
  * When you specify the filename in the `source` field and mention a different path in the `destination` field, it moves the file.



For example, if I want to rename the file `Hello.txt` to `Renamed_Hello.txt` located inside the `test` directory, then I will use the following:

```

    mv Hello.txt Renamed_Hello.txt

```

![][1]

As you can see, I used the mv command in the same directory, which renamed the file.

But if I would like to move the file, then I specify the destination directory, which has to be different from the source directory. For example, here, I've moved the `Hello.txt` file to the `Move` directory:

```

    mv Hello.txt ~/Test/

```

![][2]

But you can do a lot more than the basic tasks and for that, you would have to use the options (known as flags) with the mv command.

Here are some useful flags that you can use with the mv command:

Option | Description
---|---
`-i` | Get a prompt for confirmation before overwriting an existing file.
`-f` | Overwrite the existing file without giving the prompt.
`-u` | Updates the file by moving only if the source file is newer than the destination file or if the destination file does not exist.
`-n` | Prevent overwriting of the file without prompt.
`-v` | Display verbose output.

Now, let's take a look at some examples of using the **mv command**.

#### 1\. Rename files

To rename a file using the mv command, you have to use the same path for the source and destination directory:

```

    mv /path/to/mydir/filename /path/to/mydir

```

Or, you can change the directory in which the file is located and then use the mv command as shown for simple execution:

```

    mv Target_Filename New_Filename

```

For example, if I want to rename the file `MyFile.txt`, then I'll use the cd command to change directly where the file is stored and then use the mv command in the following manner:

```

    mv MyFile.txt Your_File.txt

```

![File renamed to Your_File.txt][3]

Sure, if you wish to use an absolute path, you can do that too.

#### 2\. Move a file to a different directory

To move a file to a different directory, all you have to do is specify the filename or the path to the file and then the path to the destination directory (where the file needs to be moved):

```

    mv /path/to/file /path/to/destination_directory

```

For example, here, I moved `Hello.txt` to another directory named `My_dir`:

```

    mv ~/test/Hello.txt ~/My_dir/

```

![The file moved to the My_dir directory][4]

#### 3\. Move multiple files at once

To move multiple files at once, all you have to do is specify the files in the source field, and then specify the path to the directory where the files need to be moved:

```

    mv File1 File2 File3 FileN /path/to/destination_directory

```

For example, here, I moved three files to the `My_dir` directory:

```

    mv File1.txt File2.txt File3.txt ~/My_dir/

```

![][5]

But if you want to move files from different directories, then you will have to provide a path for each. For example, here, I move two files from different directories to the `test` directory:

```

    mv My_dir/Haruki.txt Move/Hello.txt ~/test/

```

![Moved two files from different locations to the test directory][6]

#### 4\. Move a directory inside another directory

To move the entire directory, first, specify the target directory which needs to be moved and then the destination directory:

```

    mv /path/to/target_directory /path/to/destination

```

Let's say I want to move the `My_dir` directory inside the `test` directory, so I will be using the following command:

```

    mv ~/My_dir ~/test/

```

![The My_dir directory was moved inside the test directory][7]

#### 5\. Rename a directory

🚧

While renaming the directory, make sure you use a unique name for renaming and any other directory should not have the same name.

To rename a directory, all you have to do is specify the name or the path to the directory that needs to be renamed and then specify a non-existent directory name as the new name.

In simple terms, it must be unique and shouldn't be repeated in the same directory.

If you use the name of the existing directory, then the source directory will be moved to inside the destination directory, the same behavior as the previous example.

To rename a directory, use the mv command in the following manner:

```

    mv target_directory non-existent_directory_name

```

For example, here I renamed the `My_dir` directory to `Your_dir`:

```

    mv My_dir/ Your_dir

```

![My_dir is renamed to Your_dir][8]

#### 6\. Prevent overwriting while moving files

While moving files, if there's a file available with the same name, then it will be overwritten immediately.

Obviously, it is not the way most users would want to move files and want to prevent the overwriting of files and for that purpose, you can use the `-n` flag:

```

    mv -n /path/to/file /path/to/destination

```

![][9]

#### 7\. Get interactive prompt for better control over overwriting

While moving multiple files, you may want to overwrite some of them but not all, and in that case, you can get an interactive prompt using the `-i` flag:

```

    mv -i source destination

```

![][10]

#### 8\. Move files forcefully

You may be wondering if the files are overwritten by default, what's the use of moving them forcefully?

Well, if your file is write-protected (has permissions for read-only) then it will show you a prompt asking if you want to override the file:

![][11]

To get rid of this prompt, you can use the `-f` flag to move files forcefully:

```

    mv -f source destination

```

![][12]

As you can see, the prompt no longer exists.

### Practice questions ✍️

Master the commands can help you get things done faster. So, if you intend to use the mv command often, try out these activities to get the hang of it:

  1. **How do you move multiple directories at once?**
  2. **How do you use a wildcard to move all the files of a specific file type at once?**
  3. **How to get the interactive prompt while moving files?**
  4. **How do you rename and move files at once?**
  5. **How do you move all the hidden files at once?**



If you encounter any difficulty solving these questions, you can reach out to us through comments or ask for help in [our community forum.][13]

### Wrapping Up

In this tutorial, I went through how you can use the mv command to move and rename files, including the syntax, examples, and practice questions.

_What other command do you want to explore with me? Do you have any feedback or suggestions? You are welcome to share your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/mv-command/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2024/01/Rename-files-using-the-mv-command.png
[2]: https://itsfoss.com/content/images/2024/01/Move-files-using-the-mv-command-in-Linux.png
[3]: https://itsfoss.com/content/images/2024/01/Rename-files-in-Linux-using-the-mv-command.png
[4]: https://itsfoss.com/content/images/2024/01/Move-files-in-Linux-using-the-mv-command.png
[5]: https://itsfoss.com/content/images/2024/01/Move-multiple-files-in-Linux-using-the-mv-command.png
[6]: https://itsfoss.com/content/images/2024/01/Move-files-from-different-locations-using-the-mv-command.png
[7]: https://itsfoss.com/content/images/2024/01/Move-directory-in-Linux-using-the-mv-command.png
[8]: https://itsfoss.com/content/images/2024/01/Rename-directory-using-the-mv-command-in-Linux.png
[9]: https://itsfoss.com/content/images/2024/01/Prevent-overwriting-while-moving-files-using-the-mv-command.png
[10]: https://itsfoss.com/content/images/2024/01/get-interactive-prompt-with-the-mv-command.png
[11]: https://itsfoss.com/content/images/2024/01/File-is-write-protected-while-moving-files-using-the-mv-command.png
[12]: https://itsfoss.com/content/images/2024/01/move-files-forcefully-using-the-mv-command.png
[13]: https://itsfoss.community/
