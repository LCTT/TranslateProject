[#]: subject: "Navigate your FreeDOS system"
[#]: via: "https://opensource.com/article/21/2/freedos-dir"
[#]: author: "Kevin O'Brien https://opensource.com/users/ahuka"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Navigate your FreeDOS system
======
Master the DIR command to navigate your way around FreeDOS.

![A map with a route highlighted][1]

[FreeDOS][2] is an open source implementation of DOS. It's not a remix of Linux, and it is compatible with the operating system that introduced many people to personal computing. This makes it an important resource for running legacy applications, playing retro games, updating firmware on motherboards, and experiencing a little bit of living computer history. In this article, I'll look at some of the essential commands used to navigate a FreeDOS system.

### Change your current directory with CD

When you first boot FreeDOS, you're "in" the root directory, which is called `C:\`. This represents the foundation of your filesystem, specifically the system hard drive. It's labeled with a `C` because, back in the old days of MS-DOS and PC-DOS, there were always `A` and `B` floppy drives, making the physical hard drive the third drive by default. The convention has been retained to this day in FreeDOS and the operating system that grew out of MS-DOS, Windows.

There are many reasons not to work exclusively in your root directory. First of all, there are limitations to the FAT filesystem that would make that impractical at scale. Secondly, it would make for a very poorly organized filesystem. So it's common to make new directories (or "folders," as we often refer to them) to help keep your work tidy. To access these files easily, it's convenient to change your working directory.

The FreeDOS `CD` command changes your current working subdirectory to another subdirectory. Imagine a computer with the following directory structure:

```
C:\  
\LETTERS\  
  \LOVE\
  \BUSINESS\

\DND\
\MEMOS\  
\SCHOOL\
```

You start in the `C:\` directory, so to navigate to your love letter directory, you can use `CD` :

```
C:\>CD \LETTERS\LOVE\
```

To navigate to your `\LETTERS\BUSINESS` directory, you must specify the path to your business letters from a common fixed point on your filesystem. The most reliable starting location is `C:\`, because it's where *everything* on your computer is stored.

```
C:\LETTERS\LOVE\>CD C:\LETTERS\BUSINESS
```

#### Navigating with dots

There's a useful shortcut for navigating your FreeDOS system, which takes the form of dots. Two dots (`..` ) tell FreeDOS you want to move "back" or "down" in your directory tree. For instance, the `LETTERS` directory in this example system contains one subdirectory called `LOVE` and another called `BUSINESS`. If you're in `LOVE` currently, and you want to step back and change over to `BUSINESS`, you can just use two dots to represent that move:

```
C:\LETTERS\LOVE\>CD ..\BUSINESS
C:\LETTERS\BUSINESS\>
```

To get all the way back to your root directory, just use the right number of dots:

```
C:\LETTERS\BUSINESS\: CD ..\..
C:\>
```

#### Navigational shortcuts

There are some shortcuts for navigating directories, too.

To get back to the root directory from wherever you are:

```
C:\LETTERS\BUSINESS\>CD \
C:\>
```

### List directory contents with DIR

The `DIR` command displays the contents of a subdirectory, but it can also function as a search command. This is one of the most used commands in FreeDOS, and learning to use it properly is a great time saver.

`DIR` displays the contents of the current working subdirectory, and with an optional path argument, it displays the contents of some other subdirectory:

```
C:\LETTERS\BUSINESS\>DIR
MTG_CARD    TXT  1344 12-29-2020  3:06p
NON         TXT   381 12-31-2020  8:12p
SOMUCHFO    TXT   889 12-31-2020  9:36p
TEST        BAT    32 01-03-2021 10:34a
```

#### Attributes

With a special attribute argument, you can use `DIR` to find and filter out certain kinds of files. There are 10 attributes you can specify:

| - | - |
| :- | :- |
| H | Hidden | 
| -H | Not hidden | 
| S | System | 
| -S | Not system | 
| A | Archivable files | 
| -A | Already archived files | 
| R | Read-only files | 
| -R | Not read-only (i.e., editable and deletable) files | 
| D | Directories only, no files | 
| -D | Files only, no directories |

These special designators are denoted with `/A:` followed by the attribute letter. You can enter as many attributes as you like, in order, without leaving a space between them. For instance, to view only hidden directories:

```
C:\MEMOS\>DIR /A:HD
.OBSCURE    <DIR>  01-08-2021 10:10p
```

#### Listing in order

You can also display the results of your `DIR` command in a specific order. The syntax for this is very similar to using attributes. You leave a space after the `DIR` command or after any other switches, and enter `/O:` followed by a selection. There are 12 possible selections:

| - | - |
| :- | :- |
| N | Alphabetical order by file name | 
| -N | Reverse alphabetical order by file name | 
| E | Alphabetical order by file extension | 
| -E | Reverse alphabetical order by file extension | 
| D | Order by date and time, earliest first | 
| -D | Order by date and time, latest first | 
| S | By size, increasing | 
| -S | By size, decreasing | 
| C | By DoubleSpace compression ratio, lowest to highest (version 6.0 only) | 
| -C | By DoubleSpace compression ratio, highest to lowest (version 6.0 only) | 
| G | Group directories before other files | 
| -G | Group directories after other files |

To see your directory listing grouped by file extension:

```
C:\>DIR /O:E
TEST        BAT 01-10-2021 7:11a
TIMER       EXE 01-11-2021 6:06a
AAA         TXT 01-09-2021 4:27p
```

This returns a list of files in alphabetical order of file extension.

If you're looking for a file you were working on yesterday, you can order by modification time:

```
C:\>DIR /O:-D
AAA         TXT 01-09-2021 4:27p
TEST        BAT 01-10-2021 7:11a
TIMER       EXE 01-11-2021 6:06a
```

If you need to clean up your hard drive because you're running out of space, you can order your list by file size, and so on.

#### Multiple arguments

You can use multiple arguments in a `DIR` command to achieve fairly complex results. Remember that each argument has to be separated from its neighbors by a blank space on each side:

```
C:\>DIR /A:A /O:D /P
```

This command selects only those files that have not yet been backed up (`/A:A` ), orders them by date, beginning with the oldest (`/O:D` ), and displays the results on your monitor one page at a time (`/P` ). So you can really do some slick stuff with the `DIR` command once you've mastered these arguments and switches.

### Terminology

In case you were wondering, anything that modifies a command is an argument.

If it has a slash in front, it is a switch. So all switches are also arguments, but some arguments (for example, a file path) are not switches.

### Better navigation in FreeDOS

FreeDOS can be very different from what you're used to if you're used to Windows or macOS, and it can be just different enough if you're used to Linux. A little practice goes a long way, though, so try some of these on your own. You can always get a help message with the `/?` switch. The best way to get comfortable with these commands is to practice using them.

*Some of the information in this article was previously published in [DOS lesson 12: Expert DIR use][3] (CC BY-SA 4.0).*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/freedos-dir

作者：[Kevin O'Brien][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/map_route_location_gps_path.png
[2]: https://www.freedos.org/
[3]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-12-expert-dir-use/
