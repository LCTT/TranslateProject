[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Four Easy Ways to Search Or Find Files And Folders in Linux)
[#]: via: (https://www.2daygeek.com/four-easy-ways-to-search-or-find-files-and-folders-in-linux/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

Four Easy Ways to Search Or Find Files And Folders in Linux
======

Linux admins can’t able to leave a day without performing a file search as this one of the activity for their routine.

It’s good to know all the file search stuffs because it would help you in many ways when you are working on headless server.

These commands are not complicate to remember because these are using a standard syntax.

This can be performed through Four Linux commands and each command has their own unique feature.

### Method-1: Search Files And Folders in Linux Using find Command

Find command is widely used and very famous command to search files and folders in Linux. It searches given files in the current directory and recursively through its sub-directories based on the search criteria.

It allow users to perform all kind of file searches based on the criteria lie by size, name, owner, group, type, permissions, date, and other criteria.

Run the following command to find a given file in system.

```
# find / -iname "sshd_config"
/etc/ssh/sshd_config
```

Run the following command to find a given folder in system. To search a folder in Linux we need to use `-type` parameter.

```
# find / -type d -iname "ssh"
/usr/lib/ssh
/usr/lib/go/src/cmd/vendor/golang.org/x/crypto/ssh
/usr/lib/go/pkg/linux_amd64/cmd/vendor/golang.org/x/crypto/ssh
/etc/ssh
```

Use wildcard option to search set of files on your system. We are going to search all files available in the system with `.config` extension.

```
# find / -name "*.config"
/usr/lib/mono/gac/avahi-sharp/1.0.0.0__4d116c78973743f5/avahi-sharp.dll.config
/usr/lib/mono/gac/avahi-ui-sharp/0.0.0.0__4d116c78973743f5/avahi-ui-sharp.dll.config
/usr/lib/python2.7/config/Setup.config
/usr/share/git/mw-to-git/t/test.config
/var/lib/lightdm/.config
/home/daygeek/.config
/root/.config
/etc/skel/.config
```

Use the following command format to find an empty files and folders in system.

```
# find / -empty
```

Use the following command combination to find all files containing specific text on Linux.

```
# find / -type f -exec grep "Port 22" '{}' \; -print
# find / -type f -print | xargs grep "Port 22"
# find / -type f | xargs grep 'Port 22'
# find / -type f -exec grep -H 'Port 22' {} \;
```

### Method-2: Search Files And Folders in Linux Using locate command

locate command works faster than the find command because it uses updatedb database, whereas the find command searches in the real system.

It uses a database rather than hunting individual directory paths to get a given file.

locate command doesn’t pre-installed in most of the distributions so, use your distribution package manager to install it.

The database is updated regularly through cron, however we can manually update it by running the following command.

```
$ sudo updatedb
```

Simply run the following command to list the given file or folder. There is no specific options need to be specified in locate command to print file or folder.

To search `ssh` folder in system.

```
# locate --basename '\ssh'
/etc/ssh
/usr/bin/ssh
/usr/lib/ssh
/usr/lib/go/pkg/linux_amd64/cmd/vendor/golang.org/x/crypto/ssh
/usr/lib/go/src/cmd/go/testdata/failssh/ssh
/usr/lib/go/src/cmd/vendor/golang.org/x/crypto/ssh
```

To search `ssh_config` file in system.

```
# locate --basename '\sshd_config'
/etc/ssh/sshd_config
```

### Method-3: Search Files in Linux Using which command

TThe which command returns the full path of the executable that would have been executed when the command had been entered in terminal.

It’s very useful when you want to create a desktop shortcut or symbolic link for executable files.

Which command searches the directories listed in the current user’s PATH environment variable not for all the users. I mean, when you are logged in your own account and you can’t able to search for root user file or directory.

Run the following command to print the full path of the vim executable file location.

```
# which vi
/usr/bin/vi
```

Alternatively, it’s allowing user to perform multiple file search in one shot.

```
# which -a vi sudo
/usr/bin/vi
/bin/vi
/usr/bin/sudo
/bin/sudo
```

### Method-4: Search Files in Linux Using whereis command

The whereis command used to search the binary, source, and man page files for a given command.

```
# whereis vi
vi: /usr/bin/vi /usr/share/man/man1/vi.1p.gz /usr/share/man/man1/vi.1.gz
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/four-easy-ways-to-search-or-find-files-and-folders-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
