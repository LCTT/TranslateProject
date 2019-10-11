[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Unzip a Zip File in Linux [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/unzip-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Unzip a Zip File in Linux [Beginner’s Tutorial]
======

_**Brief: This quick tip shows you how to unzip a file in Ubuntu and other Linux distributions. Both terminal and GUI methods have been discussed.**_

[Zip][1] is one of the most common and most popular way to create compressed archive files. It is also one of the older archive file format that was created in 1989. Since it is widely used, you’ll regularly come across a zip file.

In an earlier tutorial, I showed [how to zip a folder in Linux][2]. In this quick tutorial for beginner’s, I’ll show you how to unzip files in Linux.

**Prerequisite: Verify if you have unzip installed**

In order to unzip a zip archive file, you must have the unzip package installed in your system. Most modern Linux distributions come with uzip support but there is no harm in verifying it to avoid bad surprises later.

In [Ubuntu][3] and [Debian][4] based distributions, you can use the command below to install unzip. If it’s already installed, you’ll be notified about it.

```
sudo apt install unzip
```

Once you have made sure that your system has unzip support, it’s time to unzip a zip file in Linux.

You can use both command line and GUI for this purpose and I’ll show you both methods.

  * [Unzip files in Linux terminal][5]
  * [Unzip files in Ubuntu via GUI][6]



### Unzip file in Linux command line

Using unzip command in Linux is absolutely simple. In the directory, where you have the zip file, use this command:

```
unzip zipped_file.zip
```

You can also provide the path to the zip file instead of going to the directory. You’ll see extracted files in the output:

```
unzip metallic-container.zip -d my_zip
Archive:  metallic-container.zip
  inflating: my_zip/625993-PNZP34-678.jpg
  inflating: my_zip/License free.txt
  inflating: my_zip/License premium.txt
```

There is a slight problem with the above command. It will extract all the contents of the zip file in the current directory. That’s not a pretty thing to do because you’ll have a handful of files leaving the current directory unorganized.

#### Unzip to directory

A good practice is to unzip to directory in Linux command line. This way, all the extracted files are stored in the directory you specified. If the directory doesn’t exist, it will create one.

```
unzip zipped_file.zip -d unzipped_directory
```

Now all the contents of the zipped_file.zip will be extracted to unzipped_directory.

Since we are discussing good practices, another tip you can use is to have a look at the content of the zip file without actually extracting it.

#### See the content of zip file without unzipping it

You can check the content of the zip file without even extracting it with the option -l.

```
unzip -l zipped_file.zip
```

Here’s a sample output:

```
unzip -l metallic-container.zip
Archive:  metallic-container.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
  6576010  2019-03-07 10:30   625993-PNZP34-678.jpg
     1462  2019-03-07 13:39   License free.txt
     1116  2019-03-07 13:39   License premium.txt
---------                     -------
  6578588                     3 files
```

There are many other usage of the unzip command in Linux but I guess now you have enough knowledge to unzip files in Linux.

### Unzip files in Linux using GUI

You don’t always have to go to the terminal if you are using desktop Linux. Let’s see how to unzip in Ubuntu Linux graphically. I am using [GNOME desktop][7] here with Ubuntu 18.04 but the process is pretty much the same in other desktop Linux distributions.

Open the file manager and go to the folder where your zip file is stored. Right click the file and you’ll see the option “extract here”. Select this one.

![Unzip File in Ubuntu][8]

Unlike the unzip command, the extract here options create a folder of the same name as the zipped file and all the content of the zipped files are extracted to this newly created folder. I am glad that this is the default behavior instead of extracting everything in the current directory.

There is also the option of ‘extract to’ and with that you can specify the folder where you want to extract the files.

That’s it. Now you know how to unzip a file in Linux. Perhaps you might also be interested in learning about [using 7zip in Linux][9].

If you have questions or suggestions, do let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/unzip-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Zip_(file_format)
[2]: https://itsfoss.com/linux-zip-folder/
[3]: https://ubuntu.com/
[4]: https://www.debian.org/
[5]: tmp.eqEocGssC8#terminal
[6]: tmp.eqEocGssC8#gui
[7]: https://gnome.org/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/unzip-files-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/use-7zip-ubuntu-linux/
