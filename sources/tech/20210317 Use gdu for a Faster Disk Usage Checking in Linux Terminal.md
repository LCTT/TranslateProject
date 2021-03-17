[#]: subject: (Use gdu for a Faster Disk Usage Checking in Linux Terminal)
[#]: via: (https://itsfoss.com/gdu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use gdu for a Faster Disk Usage Checking in Linux Terminal
======

There are two popular [ways to check disk usage in Linux terminal][1]: du command and df command. The [du command is more for checking the space used by a directory][2] and the df command gives you the disk utilization on filesystem level.

There are more friendly [ways to see the disk usage in Linux with graphical tools like GNOME Disks][3]. If you are confined to the terminal, you can use a [TUI][4] tool like [ncdu][5] to get the disk usage information with a sort of graphical touch.

### Gdu: Disk usage checking in Linux terminal

[Gdu][6] is such a tool written in Go (hence the ‘g’ in gdu). Gdu developer has [benchmark tests][7] to show that it is quite fast for disk usage checking, specifically on SSDs. In fact, gdu is intended primarily for SSDs though it can work for HDD as well.

If you use the gdu command without any options, it shows the disk usage for the current directory you are in.

![][8]

Since it has terminal user interface (TUI), you can navigate through directories and disk using arrows. You can also sort the result by file names or size.

Here’s how to do that:

  * Up arrow or k to move cursor up
  * Down arrow or j to move cursor down
  * Enter to select directory / device
  * Left arrow or h to go to parent directory
  * Use d to delete the selected file or directory
  * Use n to sort by name
  * Use s to sort by size
  * Use c to sort by items



You’ll notice some symbols before some file entries. Those have specific meaning.

![][9]

  * `!` means an error occurred while reading the directory.
  * `.` means an error occurred while reading a subdirectory, size may not be correct.
  * `@` means file is a symlink or socket.
  * `H` means the file was already counted (hard link).
  * `e` means directory is empty.



To see the disk utilization and free space for all mounted disks, use the option `d`:

```
gdu -d
```

It shows all the details in one screen:

![][10]

Sounds like a handy tool, right? Let’s see how to get it on your Linux system.

### Installing gdu on Linux

Gdu is available for Arch and Manjaro users through the [AUR][11]. I presume that as an Arch user, you know how to use AUR.

It is included in the universe repository of the upcoming Ubuntu 21.04 but chances are that you are not using it at present. In that case, you may install it using Snap through it may seem like a lot of snap commands:

```
snap install gdu-disk-usage-analyzer
snap connect gdu-disk-usage-analyzer:mount-observe :mount-observe
snap connect gdu-disk-usage-analyzer:system-backup :system-backup
snap alias gdu-disk-usage-analyzer.gdu gdu
```

You may also find the source code on its release page:

[Source code download for gdu][12]

I am more used to of using du and df commands but I can see some Linux users might like gdu. Are you one of them?

--------------------------------------------------------------------------------

via: https://itsfoss.com/gdu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/df-command/
[2]: https://linuxhandbook.com/find-directory-size-du-command/
[3]: https://itsfoss.com/check-free-disk-space-linux/
[4]: https://itsfoss.com/gui-cli-tui/
[5]: https://dev.yorhel.nl/ncdu
[6]: https://github.com/dundee/gdu
[7]: https://github.com/dundee/gdu#benchmarks
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gdu-disk-utilization.png?resize=800%2C471&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/gdu-entry-symbols.png?resize=800%2C302&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/gdu-disk-utilization-for-all-drives.png?resize=800%2C471&ssl=1
[11]: https://itsfoss.com/aur-arch-linux/
[12]: https://github.com/dundee/gdu/releases
