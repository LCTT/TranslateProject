[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Navigating your Linux files with ranger)
[#]: via: (https://www.networkworld.com/article/3583890/navigating-your-linux-files-with-ranger.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Navigating your Linux files with ranger
======
Ranger is a great tool for providing a multi-level view of your Linux files and allowing you to both browse and make changes using arrow keys and some handy commands.
[Heidi Sandstrom][1] [(CC0)][2]

Ranger is a unique and very handy file system navigator that allows you to move around in your Linux file system, go in and out of subdirectories, view text-file contents and even make changes to files without leaving the tool.

It runs in a terminal window and lets you navigate by pressing arrow keys. It provides a multi-level file display that makes it easy to see where you are, move around the file system and select particular files.

To install ranger, use your standard install command (e.g., **sudo apt install ranger**). To start it, simply type “ranger”. It comes with a lengthy, very detailed man page, but getting started with ranger is very simple.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

### The ranger display

One of the most important things you need to get used to right away is ranger’s way of displaying files. Once you start ranger, you will see four columns of data. The first column is one level up from wherever you started ranger. If you start from your home directory, for example, ranger will list all of the home directories in column 1. The second column will show the first screenful of directories and files in your home directory (or whatever directory you start it from).

The key here is moving past any inclination you might have to see the details in each line of the display as related. All the entries in column 2 relate to a single entry in column 1 and content in column 4 relates to the selected file or directory in column 2.

Unlike your normal command-line view, directories will be listed first (alphanumerically) and files will be listed second (also alphanumerically). Starting in your home directory, the display might look something like this:

```
shs@dragonfly /home/shs/backups     <== current selection
 bugfarm   backups            0  empty
 dory      bin               59
 eel       Buttons           15
 nemo      Desktop            0
 shark     Documents          0
 shs       Downloads          1
   ^         ^                ^      ^
   |         |                |      |
 homes     directories    # files    listing
           in selected    in each    of files in
           home           directory  selected directory
```

The top line in ranger's display tells you where  you are. In the abive example, the current directory is **/home/shs/backups**. We see the highlighted word "empty" because there are no files in this directory. If we press the down arrow key to select **bin** instead, we'll see a list of files:

```
shs@dragonfly /home/shs/bin      <== current selection
 bugfarm   backups            0    append
 dory      bin               59    calcPower
 eel       Buttons           15    cap
 nemo      Desktop            0    extract
 shark     Documents          0    finddups
 shs       Downloads          1    fix
   ^         ^                ^      ^
   |         |                |      |
 homes     directories    # files    listing
           in selected    in each    of files in
           home           directory  selected directory
```

The highlighted entries in each column show the current selections. Use the right arrow to move into deeper directories or view file content.

If you continue pressing the down arrow key to move to the file portion of the listing, you will note that the third column will show file sizes (instead of the numbers of files). The "current selection" line will also display the currently selected file name while the rightmost column displays the file content when possible.

```
shs@dragonfly /home/shs/busy_wait.c   <== current selection
 bugfarm   BushyRidge.zip    170 K  /*
 dory      busy_wait.c       338 B   * program that does a busy wait
 eel       camper.jpg       5.55 M   * it's used to show ASLR, and that's it
 nemo      check_lockscreen   80 B   */
 shark     chkrootkit-output 438 B  #include <stdio.h>
   ^         ^                ^       ^
   |         |                |       |
 homes     files            sizes    file content
```

The bottom line of the display will show some file and directory details:

```
-rw-rw-r—- shs shs 338B 2019-01-05 14:44    1.52G, 365G free  67/488  11%
```

If you select a directory and press enter, you will move into that directory. The leftmost column in your display will then be a listing of the contents of your home directory, and the second column will be a file listing of the directory contents. You can then examine the contents of subdirectories and the contents of files.

Press the left arrow key to move back up a level.

Quit ranger by pressing "q".

### Making changes

You can press **?** to bring up a help line at the bottom of your screen. It should look like this:

```
View [m]an page, [k]ey bindings, [c]commands or [s]ettings?  (press q to abort)
```

Press **c** and ranger will provide information on commands that you can use within the tool. For example, you can change permissions on the current file by entering **:chmod** followed by the intended permissions. For example, once a file is selected, you can type **:chmod 700** to set permissions to **rwx------**.

Typing **:edit** instead would open the file in **nano** and allow you to make changes and then save the file using **nano** commands.

### Wrap-Up

There are more ways to use **ranger** than are described in this post. The tool provides a very different way to list and interact with files on a Linux system and is easy to navigate once you get used to its multi-tiered way of listing directories and files and using arrow keys in place of **cd** commands to move around.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3583890/navigating-your-linux-files-with-ranger.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/mHC0qJ7l-ls
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
