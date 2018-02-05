Make “rm” Command To Move The Files To “Trash Can” Instead Of Removing Them Completely
======
Human makes mistake because we are not a programmed devices so, take additional care while using `rm` command and don't use `rm -rf *` at any point of time. When you use rm command it will delete the files permanently and doesn't move those files to `Trash Can` like how file manger does.

Sometimes we delete by mistake and sometimes it happens accidentally, so what to do when it happens? You have to look recovery tools (There are plenty of data recovery tools available in Linux) but we don't know it can able to recover 100% so, how to overcome this?

We have recently published an article about [Trash-Cli][1], in the comment section we got an update about [saferm.sh][2] script from the user called Eemil Lgz which help us to move the files to "Trash Can" instead of deleting them permanently.

Moving files to "Trash Can" is a good idea, that save you when you run `rm` command accidentally but few people would say it's a bad habit of course, if you are not taking care the "Trash Can" it might be accumulated with files & folders after certain duration. In this case i would advise you to create a cronjob as per your wish.

This works on both environments like Server & Desktop. If script detecting **GNOME or KDE or Unity or LXDE** Desktop Environment (DE) then it move files or folders safely to default trash **$HOME/.local/share/Trash/files** else it creates trash folder in your home directory **$HOME/Trash**.

saferm.sh Script is hosted in github, either clone below repository or Create a file called saferm.sh and past the code on it.
```
$ git clone https://github.com/lagerspetz/linux-stuff
$ sudo mv linux-stuff/scripts/saferm.sh /bin
$ rm -Rf linux-stuff

```

Create a alias on `bashrc` file.
```
alias rm=saferm.sh

```

To take this effect, run the following command.
```
$ source ~/.bashrc

```

That's it everything is done, now you can perform rm command which automatically move the files to "Trash Can" instead of deleting them permanently.

For testing purpose, we are going to delete file called `magi.txt`, it's clearly saying `Moving magi.txt to $HOME/.local/share/Trash/file`
```
$ rm -rf magi.txt
Moving magi.txt to /home/magi/.local/share/Trash/files

```

The same can be validated through `ls` command or `trash-cli` utility.
```
$ ls -lh /home/magi/.local/share/Trash/files
Permissions Size User Date Modified Name
.rw-r--r-- 32 magi 11 Oct 16:24 magi.txt

```

Alternatively we can check the same in GUI through file manager.
[![][3]![][3]][4]

Create a cronjob to remove files from "Trash Can" once in a week.
```
$ 1 1 * * * trash-empty

```

`Note` For server environment, we need to remove manually using rm command.
```
$ rm -rf /root/Trash/
/root/Trash/magi1.txt is on . Unsafe delete (y/n)? y
Deleting /root/Trash/magi1.txt

```

The same can be achieved by trash-put command for desktop environment.

Create a alias on `bashrc` file.
```
alias rm=trash-put

```

To take this effect, run the following command.
```
$ source ~/.bashrc

```

To know other options for saferm.sh, navigate to help section.
```
$ saferm.sh -h
This is saferm.sh 1.16. LXDE and Gnome3 detection.
 Will ask to unsafe-delete instead of cross-fs move. Allows unsafe (regular rm) delete (ignores trashinfo).
 Creates trash and trashinfo directories if they do not exist. Handles symbolic link deletion.
 Does not complain about different user any more.

Usage: /path/to/saferm.sh [OPTIONS] [--] files and dirs to safely remove
OPTIONS:
-r allows recursively removing directories.
-f Allow deleting special files (devices, ...).
-u Unsafe mode, bypass trash and delete files permanently.
-v Verbose, prints more messages. Default in this version.
-q Quiet mode. Opposite of verbose.

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/rm-command-to-move-files-to-trash-can-rm-alias/

作者：[2DAYGEEK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://www.2daygeek.com/trash-cli-command-line-trashcan-linux-system/
[2]:https://github.com/lagerspetz/linux-stuff/blob/master/scripts/saferm.sh
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:https://www.2daygeek.com/wp-content/uploads/2017/10/rm-command-to-move-files-to-trash-can-rm-alias-1.png
