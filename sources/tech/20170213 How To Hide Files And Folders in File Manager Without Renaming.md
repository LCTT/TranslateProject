ucasFL translating
How To Hide Files And Folders in File Manager Without Renaming
============================================================

If the system used by more than one users and you want to hide some files or folders (personal reasons) from others in file manager (most of the users won’t go depth in Linux, they will see what are the files or folders listed in file manager), we can do it in three way. Additionally you can protect files or folders with password. In this tutorial we are going to see, How To Hide Files And Folders in File Manager Without Renaming.

We all knows, by renaming a file or folder with a `dot` (“.”) prefix, can hide a file or folder in Linux. This is not the right/efficient way to hide a file or folder. Some file managers also hide files that end with a tilde (“~”), those are considered backup files.

Three way to hide files or folders in file manager.

*   Add a `dot` (“.”) prefix with file or folder name.
*   Create a file called `.hidden` and add files or folders on it.
*   Nautilus Hide extension

#### Hide a file or folder with dot (“.”) prefix

This is known method for everyone because by default file manager & terminal wont shows the `dot` (“.”) prefix files or folders. To hide an existing file, we have to rename it. That’s not always good idea. I will not recommend this but for emergence purpose you can use it and don’t do this purposely.

For testing purpose, i’m going to create a new folder called `.magi`. See the below output, it won’t shows the `dot` (“.”) prefix files or folders when i use `ls -lh`. The same out you can see the file managers too.

```
# mkdir .magi

# ls -lh
total 36K
-rw-r--r-- 1 magi magi  32K Dec 28 03:29 nmon-old
```

File Manager View.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][2]

For clarification, i added `-a` options with ls command to list hidden files too (Yes, now i can see the file name .magi).

```
# ls -la
total 52
drwxr-xr-x  4 magi magi  4096 Feb 12 01:09 .
drwxr-xr-x 24 magi magi  4096 Feb 11 23:41 ..
drwxr-xr-x  2 magi magi  4096 Feb 12 01:09 .magi
-rw-r--r--  1 magi magi 32387 Dec 28 03:29 nmon-old
```

To see the hidden files on file manager, simple press `Ctrl+h`, again press `Ctrl+h` to hide it.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][3]

#### Hide a file or folder with help of (“.hidden”) file Without Renaming

If you want to hide a file without renaming it ? In other hand some of the applications wont allow you to rename. For this kind of situation, you can go with `.hidden` file, probably well suitable option for you.

Some file managers, like Nautilus, Nemo, Caja, Thunar offering a native way to hide files without renaming it, how ? simple create the file called `.hidden` where you want to hide files, and add the list of files and folders line-by-line (one by one). Finally refresh the folder, now those files will not be visible.

For testing purpose, i’m going create a file name called `.hidden` and 2g & 2daygeek in the same directory (Documents), then add those into “.hidden” file.

```
# touch 2g
# mkdir 2daygeek

# nano .hidden
2g
2daygeek
```

Before adding files into .hidden file.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][4]

After files added into .hidden file.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][5]

Bring all the files by hitting `Ctrl+h`
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][6]

#### Nautilus Hide extension

[Nautilus Hide][7] is a simple Python extension for the Nautilus file manager that adds options to the right-click menu to hide or unhide files.

Install Nautilus & Namo Hide extension on Ubuntu and its directives We can easily install Nautilus & Namo Hide extension on Ubuntu and its directives by running following commands.

```
$ sudo apt install nautilus-hide
$ nautilus -q

$ sudo apt install nemo-hide
$ nemo -q
```

Follow the below procedure to install Nautilus hide extension on DEB based systems

```
$ sudo apt install cmake gettext python-nautilus xdotool
$ mkdir build
$ cd build
$ cmake ..
$ sudo make
$ sudo make install
$ nautilus -q
```

Follow the below procedure to install Nautilus hide extension on RPM based systems

```
$ sudo [yum|dnf|zypper] install cmake gettext nautilus-python xdotool
$ mkdir build
$ cd build
$ cmake ..
$ sudo make
$ sudo make install
$ nautilus -q
```

This extension simply uses that `.hidden` file to hide files. When you choose a file to hide, its name is added to `.hidden` file. When you choose to unhide it (For unhidden, press `Ctrl+h` to bring all the files, including (“.”) files, then Unhide Files), the name is removed from `.hidden` file (.hidden file also go away, when you unhidden all the files which is listed in .hidden file). If the file isn’t hidden/unhidden, press F5 to refresh the folder.

You might ask me, why i want to install Nautilus Hide extension because method two also doing the same. In method two, we need to create a `.hidden` file manually wherever it’s required then have to add file lists but here everything automated. simple right click then chose hide or unhide (it will automatically create .hidden file, if it’s not present).

Hide a file using Nautilus Hide extension See the below screenshot, we are using Nautilus Hide extension to hiding a file.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][8]

Unhide a file using Nautilus Hide extension See the below screenshot, we are using Nautilus Hide extension to unhiding a file (Bring all the files by hitting `Ctrl+k`, so that you can see all the hidden files & folders).
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif)
][9]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/how-to-hide-files-and-folders-in-file-manager-without-renaming/

作者：[MAGESH MARUTHAMUTHU ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/how-to-hide-files-and-folders-in-file-manager-without-renaming/
[1]:http://www.2daygeek.com/author/magesh/
[2]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-1a.png
[3]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-2a.png
[4]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-5.png
[5]:http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-6.png
[6]:http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-7.png
[7]:https://github.com/brunonova/nautilus-hide
[8]:http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-3a.png
[9]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-4.png
