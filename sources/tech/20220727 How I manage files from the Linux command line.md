[#]: subject: "How I manage files from the Linux command line"
[#]: via: "https://opensource.com/article/22/7/manage-files-linux-command-line"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I manage files from the Linux command line
======
If you prefer to interact with your system through the terminal, check out my favorite Linux commands for managing files.

![Files in a folder][1]

Managing files in a graphical desktop like GNOME or KDE is an exercise in point-and-click. To move a file into a folder, you click and drag the icon to its new home. To remove a file, you drag it into the “Trash” icon. The graphical interface makes desktop computing easy to use.

But we don't always interact with Linux systems with a graphical interface. If you work on a server, you likely need to use the command line to get around. Even desktop users like me might prefer to interact with their system through a terminal and command line. I tend to rely on a few commands to manage my files from the command line:

### List files with Linux ls

```
ls
```

For anyone who uses the command line, you can't get far without seeing what's there. The [ls command][2] lists the contents of a directory. For example, to look at what's in a web server's document root in `/var/www/html`, you can type:

```
ls /var/www/html
```

Most of the time, I use `ls` to look at the directory I'm in. To do that, just type `ls` to list everything. For example, when I'm in the root directory of my web project, I might see this:

```
$ ls
about  fontawesome      fonts   index.php  styles
docs   fontawesome.zip  images  prism
```

The `ls` command has about 60 command line options that can list files and directories in all kinds of ways. One useful option is `-l` to provide a long or detailed listing, including permissions, file size, and owner:

```
$ ls -l

total 6252
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:18 about
drwxr-xr-x. 2 jhall jhall    4096 Jun 25 16:35 docs
drwxr-xr-x. 2 jhall jhall    4096 Jun  7 00:00 fontawesome
-rw-r--r--. 1 jhall jhall 6365962 Jun  2 16:26 fontawesome.zip
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:17 fonts
drwxr-xr-x. 2 jhall jhall    4096 Jun 25 13:03 images
-rw-rw-r--. 1 jhall jhall     327 Jun 22 16:38 index.php
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:18 prism
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:17 styles
```

File sizes are shown in bytes, which may not be useful if you are looking at very large files. To see file sizes in a format that is helpful to humans, add the `-h` or `--human-readable` option to print sizes with `G` for Gigabyte, `M` for Megabyte, and `K` for Kilobyte:

```
$ ls -l --human-readable
total 6.2M
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:18 about
drwxr-xr-x. 2 jhall jhall 4.0K Jun 25 16:35 docs
drwxr-xr-x. 2 jhall jhall 4.0K Jun  7 00:00 fontawesome
-rw-r--r--. 1 jhall jhall 6.1M Jun  2 16:26 fontawesome.zip
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:17 fonts
drwxr-xr-x. 2 jhall jhall 4.0K Jun 25 13:03 images
-rw-rw-r--. 1 jhall jhall  327 Jun 22 16:38 index.php
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:18 prism
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:17 styles
```

Rather than `6365962` for the file size, `ls` now displays the zip file as `6.1M` or just over 6 MB in size.

### View files with Linux cat, head, and tail

```
cat
```

```
head
```

```
tail
```

The next step after listing files is examining what each file contains. For that, I use a few commands. Starting with the `docs` directory on my web server:

```
$ ls docs
chapter1.tex  chapter4.tex  chapter7.tex  lorem.txt
chapter2.tex  chapter5.tex  chapter8.tex  readme.txt
chapter3.tex  chapter6.tex  chapter9.tex  workbook.tex
```

What are these files? Fortunately, this directory has a `readme.txt` file, which I might assume contains a description of the files in this project directory. If the file is not too long, I can view it using the `cat` command:

```
$ cat docs/readme.txt 
This is the workbook for the C programming self-paced
video series. The main file is the workbook.tex file,
which includes the other chapters.
```

If a file is very long, I can look at just the first few lines using the `head` command. This displays a certain number of lines from the file, usually the first 10 lines unless you tell `head` otherwise with the `-n` or `--lines` option. For example, these two versions of the `head` command examine the first three lines of the `lorem.txt` file:

```
$ head -n 3 docs/lorem.txt 
Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Nullam at ligula eget nunc feugiat pharetra. Nullam
nec vulputate augue. Suspendisse tincidunt aliquet
$ head --lines=3 docs/lorem.txt 
Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Nullam at ligula eget nunc feugiat pharetra. Nullam
nec vulputate augue. Suspendisse tincidunt aliquet
```

If I instead wanted to see the last few lines of a file, I can use the `tail` command in the same way. Again, these two `tail` commands each show the last three lines of the `lorem.txt` file:

```
$ tail -n 3 docs/lorem.txt 
egestas sodales. Vivamus tincidunt ex sed tellus tincidunt
varius. Nunc commodo volutpat risus, vitae luctus lacus
malesuada tempor. Nulla facilisi.
$ tail --lines=3 docs/lorem.txt 
egestas sodales. Vivamus tincidunt ex sed tellus tincidunt
varius. Nunc commodo volutpat risus, vitae luctus lacus
malesuada tempor. Nulla facilisi.
```

Using `head` and `tail` are also useful when examining log files on a server. I have a small web server I run on my at-home network to test websites before I make them live. I recently discovered that the web server's log is quite long, and I wondered how old it was. Using `head`, I printed just the first line to see that the log file was created in December 2020:

```
$ ls -l --human-readable /var/log/httpd
total 13M
-rw-r--r--. 1 root root 13M Jun 25 16:23 access_log
-rw-r--r--. 1 root root 45K Jun  2 00:00 error_log
$ sudo head -n 1 /var/log/httpd/access_log
10.0.0.177 - - [05/Dec/2020:14:58:35 -0600] "GET / HTTP/1.1" 403 5564 "-" "Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
```

**[[ Related read: Getting started with the Linux cat command ]][3]**

### Delete files with Linux rm

```
rm
```

In my directory with the sample text files, the `lorem.txt` file contains *Lorem Ipsum* text. This is just dummy text used in the printing industry, so the `lorem.txt` file doesn't really belong in this project. Let's delete it. The `rm` command removes a file like this:

```
$ ls docs
chapter1.tex  chapter4.tex  chapter7.tex  lorem.txt
chapter2.tex  chapter5.tex  chapter8.tex  readme.txt
chapter3.tex  chapter6.tex  chapter9.tex  workbook.tex
$ rm docs/lorem.txt 
$ ls docs
chapter1.tex  chapter4.tex  chapter7.tex  readme.txt
chapter2.tex  chapter5.tex  chapter8.tex  workbook.tex
chapter3.tex  chapter6.tex  chapter9.tex
```

The `rm` command is dangerous, because it removes a file without the intervention of a trash or recycle bin. It's much safer to install a trash command, such as [trashy][4] or [trash-cli][5]. Then you can send files to a staging area before deleting them forever:

```
$ rm docs/lorem.txt
```

Managing files on the command line requires only a few commands. The `ls` command lists the contents of a directory, and `cat`, `head` and `tail` show the contents of files. Use `rm` or a safe "trash" command to remove files you don't need. These five commands will help you manage your files on any Linux system. To learn more, including the options available, use the `--help` option to see a summary of how to use each command, such as `ls --help` to see how to use the `ls` command.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/manage-files-linux-command-line

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/files_documents_paper_folder.png
[2]: https://opensource.com/article/19/7/master-ls-command
[3]: https://opensource.com/article/19/2/getting-started-cat-command
[4]: https://gitlab.com/trashy/trashy
[5]: https://github.com/andreafrancia/trash-cli
