How to Use RAR files in Ubuntu Linux
======
[RAR][1] is a quite good archive file format. But, it isn’t the best when you’ve got 7-zip offering great compression ratios and Zip files being easily supported across multiple platforms by default. It is one of the most popular archive formats, but, [Ubuntu][2]‘s archive manager does not support extracting RAR files nor does it let you create RAR files.

Fret not, we have a solution for you. To enable the support to extract RAR files, you need to install **UNRAR** – which is a freeware by [RARLAB][3]. And, to create and manage RAR files, you need to install **RAR** – which is available as a trial.

![RAR files in Ubuntu Linux][4]

### Extracting RAR Files

Unless you have it installed, extracting RAR files will show you an error “Extraction not performed“. Here’s how it should look like ([ **Ubuntu 18.04**][5]):

![Error in RAR extraction in Ubuntu][6]

If you want to resolve the error and easily be able to extract RAR files, follow the instructions below to install unrar:

**- >** Launch the terminal and type in:

```
 sudo apt-get install unrar

```

-> After installing unrar, you may choose to type in “ **unrar** ” (without the inverted commas) to know more about its usage and how to use RAR files with the help of it.

The most common usage would obviously be extracting the RAR file you have. So, **you can either perform a right-click on the file and proceed to extract it** from there or you can do it via the terminal with the help of this command:

```
unrar x FileName.rar

```

You can see that in action here:

![Using unrar in Ubuntu][7]

If the file isn’t present in the Home directory, then you have to navigate to the target folder by using the “ **cd** ” command. For instance, if you have the archive in the Music directory, simply type in “ **cd Music** ” to navigate to the location and then extract the RAR file.

### Creating & Managing RAR files

![Using rar archive in Ubuntu Linux][8]

UNRAR does not let you create RAR files. So, you need to install the RAR command-line tool to be able to create RAR archives.

To do that, you need to type in the following command:

```
sudo apt-get install rar

```

Here, we will help you create a RAR file. In order to do that, follow the command syntax below:

```
rar a ArchiveName File_1 File_2 Dir_1 Dir_2

```

When you type a command in this format, it will add every item inside the directory to the archive. In either case, if you want specific files, just mention the exact name/path.

By default, the RAR files reside in **HOME** directory.

In the same way, you can update/manage the RAR files. Just type in a command using the following syntax:

```
rar u ArchiveName Filename

```

To get the list of commands for the RAR tool, just type “ **rar** ” in the terminal.

### Wrapping Up

Now that you’ve known how to use RAR files on Ubuntu, will you prefer using it over 7-zip, Zip, or Tar.xz?

Let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-rar-ubuntu-linux/

作者：[Ankush Das][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[1]: https://www.rarlab.com/rar_file.htm
[2]: https://www.ubuntu.com/
[3]: https://www.rarlab.com/
[4]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/rar-ubuntu-linux.png
[5]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
[6]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/extract-rar-error.jpg
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/unrar-rar-extraction.jpg
[8]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/rar-update-create.jpg
