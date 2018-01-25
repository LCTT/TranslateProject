Trash-Cli : A Command Line Interface For Trashcan On Linux
======
Everyone knows about `Trashcan` which is common for all users like Linux, or Windows, or Mac. Whenever you delete a file or folder, it will be moved to trash.

Note that moving files to the trash does not free up space on the file system until the Trashcan is empty.

Trash stores deleted files temporarily which help us to restore when it's necessary, if you don't want these files then delete it permanently (empty the trash).

Make sure, you won't find any files or folders in the trash when you delete using `rm` command. So, think twice before performing rm command. If you did a mistake that's it, it'll go away and you can't restore back. since metadata is not stored on disk nowadays.

Trash is a feature provided by the desktop manager such as GNOME, KDE, and XFCE, etc, as per [freedesktop.org specification][1]. when you delete a file or folder from file manger then it will go to trash and the trash folder can be found @ `$HOME/.local/share/Trash`.

Trash folder contains two folder `files` & `info`. Files folder stores actual deleted files and folders & Info folder contains deleted files & folders information such as file path, deleted date & time in separate file.

You might ask, Why you want CLI utility When having GUI Trashcan, most of the NIX guys (including me) play around CLI instead of GUI even though when they working GUI based system. So, if some one looking for CLI based Trashcan then this is the right choice for them.

### What's Trash-Cli

[trash-cli][2] is a command line interface for Trashcan utility compliant with the FreeDesktop.org trash specifications. It stores the name, original path, deletion date, and permissions of each trashed file.

### How to Install Trash-Cli in Linux

Trash-Cli is available on most of the Linux distribution official repository, so run the following command to install.

For **`Debian/Ubuntu`** , use [apt-get command][3] or [apt command][4] to install Trash-Cli.
```
$ sudo apt install trash-cli

```

For **`RHEL/CentOS`** , use [YUM Command][5] to install Trash-Cli.
```
$ sudo yum install trash-cli

```

For **`Fedora`** , use [DNF Command][6] to install Trash-Cli.
```
$ sudo dnf install trash-cli

```

For **`Arch Linux`** , use [Pacman Command][7] to install Trash-Cli.
```
$ sudo pacman -S trash-cli

```

For **`openSUSE`** , use [Zypper Command][8] to install Trash-Cli.
```
$ sudo zypper in trash-cli

```

If you distribution doesn't offer Trash-cli, we can easily install from pip. Your system should have pip package manager, in order to install python packages.
```
$ sudo pip install trash-cli
Collecting trash-cli
 Downloading trash-cli-0.17.1.14.tar.gz
Installing collected packages: trash-cli
 Running setup.py bdist_wheel for trash-cli ... done
Successfully installed trash-cli-0.17.1.14

```

### How to Use Trash-Cli

It's not a big deal since it's offering native syntax. It provides following commands.

  * **`trash-put:`** Delete files and folders.
  * **`trash-list:`** Pint Deleted files and folders.
  * **`trash-restore:`** Restore a file or folder from trash.
  * **`trash-rm:`** Remove individual files from the trashcan.
  * **`trash-empty:`** Empty the trashcan(s).



Let's try some examples to experiment this.

1) Delete files and folders : In our case, we are going to send a file named `2g.txt` and folder named `magi` to Trash by running following command.
```
$ trash-put 2g.txt magi

```

You can see the same in file manager.

2) Pint Delete files and folders : To view deleted files and folders, run the following command. As i can see detailed infomation about deleted files and folders such as name, date & time, and file path.
```
$ trash-list
2017-10-01 01:40:50 /home/magi/magi/2g.txt
2017-10-01 01:40:50 /home/magi/magi/magi

```

3) Restore a file or folder from trash : At any point of time you can restore a files and folders by running following command. It will ask you to enter the choice which you want to restore. In our case, we are going to restore `2g.txt` file, so my option is `0`.
```
$ trash-restore
 0 2017-10-01 01:40:50 /home/magi/magi/2g.txt
 1 2017-10-01 01:40:50 /home/magi/magi/magi
What file to restore [0..1]: 0

```

4) Remove individual files from the trashcan : If you want to remove specific files from trashcan, run the following command. In our case, we are going to remove `magi` folder.
```
$ trash-rm magi

```

5) Empty the trashcan : To remove everything from the trashcan, run the following command.
```
$ trash-empty

```

6) Remove older then X days file : Alternatively you can remove older then X days files so, run the following command to do it. In our case, we are going to remove `10` days old items from trashcan.
```
$ trash-empty 10

```

trash-cli works great but if you want to try alternative, give a try to [gvfs-trash][9] & [autotrash][10]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/trash-cli-command-line-trashcan-linux-system/

作者：[2daygeek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://freedesktop.org/wiki/Specifications/trash-spec/
[2]:https://github.com/andreafrancia/trash-cli
[3]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[8]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]:http://manpages.ubuntu.com/manpages/trusty/man1/gvfs-trash.1.html
[10]:https://github.com/bneijt/autotrash
