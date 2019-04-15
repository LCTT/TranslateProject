[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Zip Files and Folders in Linux [Beginner Tip])
[#]: via: (https://itsfoss.com/linux-zip-folder/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Zip Files and Folders in Linux [Beginner Tip]
======

_**Brief: This quick tip shows you how to create a zip folder in Ubuntu and other Linux distributions. Both terminal and GUI methods have been discussed.**_

Zip is one of the most popular archive file format out there. With zip, you can compress multiple files into one file. This not only saves disk space, it also saves network bandwidth. This is why you’ll encounter zip files almost all the time.

As a normal user, mostly you’ll unzip folders in Linux. But how do you zip a folder in Linux? This article helps you answer that question.

**Prerequisite: Verify if zip is installed**

Normally [zip][1] support is installed but no harm in verifying. You can run the below command to install zip and unzip support. If it’s not installed already, it will be installed now.

```
sudo apt install zip unzip
```

Now that you know your system has zip support, you can read on to learn how to zip a directory in Linux.

![][2]

### Zip a folder in Linux Command Line

The syntax for using the zip command is pretty straight forward.

```
zip [option] output_file_name input1 input2
```

While there could be several options, I don’t want you to confuse with them. If your only aim is to create a zip folder from a bunch of files and directories, use the command like this:

```
zip -r output_file.zip file1 folder1
```

The -r option will recurse into directories and compress its contents as well. The .zip extension in the output files is optional as .zip is added by default.

You should see the files being added to the compressed folder during the zip operation.

```
zip -r myzip abhi-1.txt abhi-2.txt sample_directory
  adding: abhi-1.txt (stored 0%)
  adding: abhi-2.txt (stored 0%)
  adding: sample_directory/ (stored 0%)
  adding: sample_directory/newfile.txt (stored 0%)
  adding: sample_directory/agatha.txt (deflated 41%)
```

You can use the -e option to [create a password protect zip folder in Linux][3].

You are not always restricted to the terminal for creating zip archive files. You can do that graphically as well. Here’s how!

### Zip a folder in Ubuntu Linux Using GUI

_Though I have used Ubuntu here, the method should be pretty much the same in other distributions using GNOME or other desktop environment._

If you want to compress a file or folder in desktop Linux, it’s just a matter of a few clicks.

Go to the folder where you have the desired files (and folders) you want to compress into one zip folder.

In here, select the files and folders. Now, right click and select Compress. You can do the same for a single file as well.

![Select the files, right click and click compress][4]

Now you can create a compressed archive file in zip, tar xz or 7z format. In case you are wondering, all these three are various compression algorithms that you can use for compressing your files.

Give it the name you desire and click on Create.

![Create archive file][5]

It shouldn’t take long and you should see an archive file in the same directory.

![][6]

Well, that’s it. You successfully created a zip folder in Linux.

I hope this quick little tip helped you with the zip files. Please feel free to share your suggestions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-zip-folder/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Zip_(file_format)
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/zip-folder-linux.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/password-protect-zip-file/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/create-zip-file-ubuntu.jpg?resize=800%2C428&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/create-zip-folder-ubuntu-1.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/zip-file-created-in-ubuntu.png?resize=800%2C277&ssl=1
