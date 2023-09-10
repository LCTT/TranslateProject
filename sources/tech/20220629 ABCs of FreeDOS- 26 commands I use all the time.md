[#]: subject: "ABCs of FreeDOS: 26 commands I use all the time"
[#]: via: "https://opensource.com/article/22/6/26-freedos-commands"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

ABCs of FreeDOS: 26 commands I use all the time
======
On its 28th anniversary, I'm pleased to share my top 26 favorite FreeDOS commands.

![FreeDOS fish logo and command prompt on computer][1]

Image by: Jim Hall, CC BY-SA 4.0.

One of my family's first computers ran a command-line operating system called DOS, the "Disk Operating System." I grew up with DOS, and learned to leverage the command line to make my work easier. And so did a lot of other people. We loved DOS so much that in 1994, we created the FreeDOS Project. Today on June 29, we celebrate 28 years of FreeDOS.

If you're new to FreeDOS, you may be confused about how to use the different command line programs that come with it. Let's get started with 26 of my favorite FreeDOS commands. To learn more, add the /? option after most commands to get more information:

```
C:\>attrib /?
ATTRIB v2.1 - Displays or changes file attributes.
Copyright (c) 1998-2003, licensed under GPL2.

Syntax: ATTRIB { options | [path][file] | /@[list] }

Options:

  +H Sets the Hidden attribute.     -H  Clears the Hidden attribute.
  +S Sets the System attribute.     -S  Clears the System attribute.
  +R Sets the Read-only attribute.  -R  Clears the Read-only attribute.
  +A Sets the Archive attribute.    -A  Clears the Archive attribute.

  /S Process files in all directories in the specified path(es).
  /D Process directory names for arguments with wildcards.
  /@ Process files, listed in the specified file [or in stdin].

Examples:

  attrib file -rhs
  attrib +a -r dir1 dir2*.dat /s
  attrib -hs/sd /@list.txt *.*
```

### A is for ATTRIB

The `ATTRIB` program displays or changes a file's *attributes*. An attribute can be one of four values: Hidden (H), System (S), Read-only (R), and Archive (A).

Files marked as Hidden don't display in a directory listing. For example, suppose you want to "hide" a file called `SECRET.TXT` so no one would know it was there. First, you can show the attributes on that file to see its current settings:

```
C:\FILES>attrib secret.txt 
[----A] SECRET.TXT
```

To hide this file, turn on the Hidden attribute by using the plus (`+` ) operator, like this:

```
C:\FILES>attrib +h secret.txt 
[----A] -> [-H--A] SECRET.TXT
C:\FILES>dir
 Volume in drive C is FREEDOS2022
 Volume Serial Number is 333D-0B18

 Directory of C:\FILES

.                   <DIR>  05-27-2022  9:22p
..                  <DIR>  05-27-2022  9:22p
         0 file(s)              0 bytes
         2 dir(s)     279,560,192 bytes free
```

Another common way to use `ATTRIB` is by manipulating the Read-only attribute, so you don't accidentally overwrite an important file. Suppose you want to protect the `SECRET.TXT` file so you can't delete or change it. Turn on the Read-only attribute like this, with the `+R` modifier:

```
C:\FILES>attrib +r secret.txt 
[----A] -> [---RA] SECRET.TXT
C:\FILES>del secret.txt
C:\FILES\SECRET.TXT: Permission denied
no file removed.
```

### B is for BEEP

If you need to add a little pizzazz to a batch file, you can use the `BEEP` command to get the user's attention. `BEEP` doesn't display anything to the screen, but simply generates a classic “beep” tone.

Note that `BEEP` uses the PC's built-in speaker to make the “beep” sound. If you boot FreeDOS using a virtual machine, check that your system is set up to correctly emulate the PC speaker. Otherwise, you will not hear anything.

### C is for CD

Like Linux, FreeDOS supports directories, which allow you to organize your files in a way that makes sense to you. For example, you might keep all of your files in a directory called `FILES`, and you might have other directories inside `FILES` for certain kinds of files, such as `DOCS` for word processor files, or `SPRDSHT` for spreadsheet files.

You can navigate into a directory using the `CD` or *change directory* command. The `CHDIR` command is the same as `CD`, if you prefer to use that syntax.

To change into a new directory, use the `CD` command with the destination directory:

```
C:\>cd files
C:\FILES>cd sprdsht
C:\FILES\SPRDSHT>dir
Volume in drive C is FREEDOS2022
Volume Serial Number is 333D-0B18
  
Directory of C:\FILES\SPRDSHT
  
. <DIR> 05-27-2022 9:59p
.. <DIR> 05-27-2022 9:59p
FIB WKS 2,093 05-27-2022 10:07p
LAB1 WKS 2,087 05-27-2022 10:10p
MIS100 WKS 2,232 05-27-2022 10:05p
3 file(s) 6,412 bytes
2 dir(s) 279,527,424 bytes free
```

You don't have to navigate one directory at a time. You can instead provide the full directory path you want to change to, with one `CD` command:

```
C:\>cd \files\sprdsht
C:\FILES\SPRDSHT>dir
Volume in drive C is FREEDOS2022
Volume Serial Number is 333D-0B18
  
Directory of C:\FILES\SPRDSHT
  
.  <DIR> 05-27-2022 9:59p
.. <DIR> 05-27-2022 9:59p
FIB WKS 2,093 05-27-2022 10:07p
LAB1 WKS 2,087 05-27-2022 10:10p
MIS100 WKS 2,232 05-27-2022 10:05p
3 file(s) 6,412 bytes
2 dir(s) 279,527,424 bytes free
```

### D is for DELTREE

If you need to delete a single file, you can use the `DEL` command. To remove an empty directory, you can use the `RMDIR` or `RD` commands. But what if you want to delete a directory that has lots of files and subdirectories inside it?

A directory with other directories inside it is called a *directory tree*. You can delete an entire directory tree with the `DELTREE` command. For example, to delete your `FILES` directory, including all the files and directories it contains, type this command:

```
C:\>deltree files

    [DEFAULT-BUILD v1.02g] of DELTREE.  The "ROOT-SAFETY-CHECK" is enabled.

Delete directory "C:\FILES"
and all its subdirectories?

[Y] [N] [Q], [ENTER] ?  Y

==> Deleting "C:\FILES" ...
```

You can easily and quickly wipe out a lot of work with a single `DELTREE` command, so the FreeDOS `DELTREE` prompts you to ask if this is really something you want to do. Use this command carefully.

### E is for EDIT

If you need to edit a text file on FreeDOS, the `EDIT` program lets you do that quickly and easily. For example, to start editing a file called `HELLO.TXT`, type `EDIT HELLO.TXT`. If the `HELLO.TXT` file already exists, `EDIT` opens the file for editing. If `HELLO.TXT` doesn't exist yet, then `EDIT` starts a new file for you.

![Image of edit][3]

FreeDOS `EDIT` uses a friendly interface that should be easy for most people to use. Use the menus to access the various features of EDIT, including saving a file, opening a new file, or exiting the editor. To access the menus, tap the Alt key on your keyboard, then use the arrow keys to get around and Enter to select an action.

![Image of save menu][4]

### F is for FIND

If you need to find text in a file, the `FIND` command does the job. Similar to `fgrep` on Linux, `FIND` prints lines that contain a string. For example, to check the "Menu Default" entry in the `FDCONFIG.SYS` file, use `FIND` like this:

```
C:\>find "MENUDEFAULT" fdconfig.sys

---------------- FDCONFIG.SYS
MENUDEFAULT=2,5
```

If you aren't sure if the string you want to find uses uppercase or lowercase letters, add the `/I` option to ignore the letter case:

```
C:\>find /i "menudefault" fdconfig.sys
---------------- FDCONFIG.SYS
MENUDEFAULT=2,5
```

### G is for GRAPHICS

If you want to capture a screen, you might use the **PrtScr** (Print Screen) key on your keyboard to print the text on your monitor directly to a printer. However, this only works for plain text. If you want to print graphic screens, you need to load the `GRAPHICS` program.

`GRAPHICS` supports different printer types, including HP PCL printers, Epson dot matrix printers, and PostScript-compatible printers. For example, if you have an HP laser printer connected to your computer, you can load support for that printer by typing this command:

```
C:\>graphics hpdefault
Running in MS GRAPHICS compatibility mode...
Using HPPCL type for type hpdefault
  If you think this is not correct, mail me (see help text).
Printing black as white and white as black
which internally uses /I of this GRAPHICS.
You can use the following command directly instead of
GRAPHICS [your options] in the future:
LH GRAPH-HP /I
Note that GRAPH-HP allows extra options:
  /E economy mode, /1 use LPT1, /2 use LPT2, /3 use LPT3,
  /R for random instead of ordered dither
  /C for 300dpi instead of 600dpi
Driver to make 'shift PrtScr' key work
even in CGA, EGA, VGA, MCGA graphics
modes loaded, in HP PCL mode.
```

### H is for HELP

If you're new to FreeDOS, you can get hints on how to use the different commands by typing `HELP`. This brings up the FreeDOS Help system, with documentation on all the commands:

![Image of FreeDos help system][6]

### I is for IF

You can add conditional statements to your command line or *batch file* using the `IF` statement. `IF` makes a simple test, then executes a single command. For example, to print the result "It's there" if a certain file exists, you can type:

```
C:\>if exist kernel.sys echo It's there
It's there
```

If you want to test the opposite, use the `NOT` keyword before the test. For example, to print "Not equal" if two strings are not the same value, type this:

```
C:\>if not "a"=="b" echo Not equal
Not equal
```

### J is for JOIN

Early DOS versions were fairly simple; the first version of DOS didn't even support directories. To provide backwards compatibility for those older programs, we have the `JOIN` program as a neat workaround. `JOIN` replaces a path with a drive letter, so you can put an old program in its own subdirectory, but access it using a single drive letter.

Let's say you had an old application called `VC` that doesn't understand directories. To keep working with `VC`, you can "join" its path to a drive letter. For example:

```
JOIN V: D:\VC
```

FreeDOS implements `JOIN` as `SWSUBST`, which also combines features from the similar `SUBST` command. To join the `D:\VC` path to a new drive letter called `V:`, type:

```
C:\>swsubst v: d:\vc
C:\>dir v:
Volume in drive V is DATA
Volume Serial Number is 212C-1DF8

Directory of V:\

. <DIR> 02-21-2022 10:35p
.. <DIR> 02-21-2022 10:35p
VC COM 27,520 07-14-2019 4:48p

1 file(s) 27,520 bytes
2 dir(s) 48,306,176 bytes free
```

### K is for KEYB

DOS assumes a US keyboard layout by default. If your keyboard is different, you can use the `KEYB` command to load a new keyboard language layout. For example, to load a German keyboard layout, type:

```
C:\>keyb gr
FreeDOS KEYB 2.01 - (c) Aitor Santamaría Merino - GNU GPL 2.0
Keyboard layout : C:\FREEDOS\BIN\KEYBOARD.SYS:GR [858] (3)
```

### L is for LABEL

FreeDOS names each floppy drive and hard drive with a *label*. These labels provide a handy way to identify what a disk might contain. The `LABEL` command was immensely useful when you needed store files across a number of different floppy disks, where you might label one floppy "Data" and another floppy as "Games."

To assign a new label to a drive, or to change the existing label on a drive, use LABEL like this:

```
D:\>label d: data
D:\>dir /w
Volume in drive D is DATA
Volume Serial Number is 212C-1DF8

Directory of D:\

[123] [ABILITY] [ASEASY] [GAMES2] [QUATTRO]
[SRC] [TEMP] [THE] [VC] [WORD]
[WS400] EDLIN16.EXE EDLIN32.EXE MYENV.BAT
3 file(s) 113,910 bytes
11 dir(s) 48,306,176 bytes free
```

### M is for MEM

Running programs and loading drivers takes memory. To see how much memory your system has, and how much memory is free for running DOS programs, use the `MEM` command:

```
C:\>mem

Memory Type Total Used Free
---------------- -------- -------- --------
Conventional 639K 11K 628K
Upper 104K 18K 86K
Reserved 281K 281K 0K
Extended (XMS) 15,224K 537K 14,687K
---------------- -------- -------- --------
Total memory 16,248K 847K 15,401K
  
Total under 1 MB 743K 29K 714K
  
Total Expanded (EMS) 8,576K (8,781,824 bytes)
Free Expanded (EMS) 8,192K (8,388,608 bytes)
  
Largest executable program size 628K (643,104 bytes)
Largest free upper memory block 84K ( 85,728 bytes)
FreeDOS is resident in the high memory area.
```

### N is for NANSI

If you want to add a little color to the FreeDOS command line, you can use ANSI escape sequences. These sequences are so named because each starts with code 33 (the `ESC` character) and a special sequence of characters, as defined by the American National Standards Institute, or ANSI.

FreeDOS supports ANSI escape sequences through the `NANSI.SYS` driver. With `NANSI` loaded, your FreeDOS console interprets the ANSI escape sequences, such as setting the text colors.

![Image of Nansi][8]

### O is for oZone

FreeDOS is a command line operating system, but some folks prefer to use a graphical user interface instead. That's why FreeDOS 1.3 includes several graphical desktops. One desktop I like is called oZone, which provides a sleek, modern-looking interface.

![Image of Ozone GUI][9]

Note that oZone has a few annoying bugs, and could use some love from a developer out there. If you're interested in making oZone even better, feel free to download the source code.

### P is for PROMPT

The standard FreeDOS command-line prompt tells you where you are in the filesystem. When you first boot FreeDOS, your prompt looks like `C:\>`, which means the "\" (root) directory on the "C:" drive. The ">" character indicates where you can type a command.

If you prefer different information on your prompt, use the `PROMPT` command to change it. You can represent different information with a special code preceded with `$`, such as `$D` for the date and `$T` for the time. For example, you can make your FreeDOS command line look like a Linux prompt with the `$$` instruction, to print a single dollar sign:

```
C:\>prompt $$
$
```

Type `PROMPT /?` to see a list of all special codes.

### Q is for QBASIC

FreeDOS doesn't actually have QBASIC. That was a proprietary BASIC programming environment for MS-DOS. Instead, we provide several open source compilers, including some for BASIC programming.

The FreeBASIC Compiler should compile most QBASIC programs out there. Here's a simple "guess the number" example:

```
dim number as integer
dim guess as integer
randomize timer
number = int( 10 * rnd() ) + 1
print "Guess the number from 1 to 10:"
do
input guess
if guess < number then print "Too low"
if guess > number then print "Too high"
loop while guess <> number
print "That's right!"
```

Use the `FBC` command to compile the program with FreeBASIC:

```
C:\DEVEL\FBC>fbc guess.bas
```

Here's a quick demonstration of that simple game:

```
C:\DEVEL\FBC>guess
Guess the number from 1 to 10:
? 5
Too high
? 3
Too low
? 4
That's right!
```

### R is for REM

Comments are great when writing programs; comments help us understand what the program is supposed to do. You can do the same in batch files using the `REM` command. Anything after the `REM` is ignored in a batch file.

```
REM this is a comment
```

### S is for SET

The FreeDOS command line uses a set of variables called *environment variables* that let you customize your system. You can set these variables with the `SET` command. For example, use the `DIRCMD` variable to control how `DIR` arranges directory listings. To set the `DIRCMD` variable, use the `SET` command:

```
SET DIRCMD=/O:GNE
```

This tells `DIR` to order (O) the output by grouping (G) directories first, then sorting the results by name (N) and extension (E).

### T is for TYPE

The `TYPE` command is one of the most-often used DOS commands. `TYPE` displays the contents of a file, similar to `cat` on Linux.

```
C:\DEVEL>type hello.c
#include 

int
main()
{
puts("Hello world");
return 0;
}
```

### U is for UNZIP

On Linux, you may be familiar with the standard Unix archive command: `tar`. There's a version of tar on FreeDOS too (and a bunch of other popular archive programs), but the de facto standard archiver on DOS is `ZIP` and `UNZIP`. Both are installed in FreeDOS 1.3 by default.

Let's say I had a zip archive of some files. If I want to extract the entire Zip file, I could just use the `UNZIP` command and provide the Zip file as a command-line option. That extracts the archive starting at my current working directory. Unless I'm restoring a previous version of something, I usually don't want to overwrite my current files. In that case, I will want to extract the archive to a new directory. You can specify the destination path with the `-d` ("destination") command-line option:

```
D:\SRC>unzip monkeys.zip -d monkeys.new
Warning: TZ environment variable not found, cannot use UTC times!!
Archive: monkeys.zip
creating: monkeys.new/monkeys/
inflating: monkeys.new/monkeys/banana.c
inflating: monkeys.new/monkeys/banana.obj
inflating: monkeys.new/monkeys/banana.exe
creating: monkeys.new/monkeys/putimg/
inflating: monkeys.new/monkeys/putimg/putimg.c
inflating: monkeys.new/monkeys/putimg/putimg.obj
inflating: monkeys.new/monkeys/putimg/putimg.exe
```

To learn more about the `ZIP` and `UNZIP` commands, read [How to archive files on FreeDOS][11].

### V is for VER

In the old days of DOS, the `VER` command reported the DOS distribution you were running, such as "MS-DOS 5.0.D" With FreeDOS, the `VER` command gives you additional details, such as the version of the FreeDOS Shell:

```
C:\DEVEL>ver
FreeCom version 0.85a - WATCOMC - XMS_Swap [Jul 10 2021 19:28:06]
```

If you also want to see the FreeDOS kernel version and the DOS compatibility level, add the `/R` option:

```
C:\DEVEL>ver /r

FreeCom version 0.85a - WATCOMC - XMS_Swap [Jul 10 2021 19:28:06]

DOS version 7.10
FreeDOS kernel 2043 (build 2043 OEM:0xfd) [compiled May 14 2021]
```

### W is for WHICH

The FreeDOS command line can run programs from a list of different directories, identified in a `PATH` variable. You can use the `WHICH` command to identify exactly where a program is located. Just type `WHICH` plus the name of the program you want to locate:

```
C:\>which xcopy
xcopy C:\FREEDOS\BIN\XCOPY.EXE
```

### X is for XCOPY

The `COPY` command copies only files from one place to another. If you want to extend the copy to include any directories, use the `XCOPY` command instead. I usually add the `/E` option to include all subdirectories, including empty ones, so I can copy the entire directory tree. This makes an effective backup of any project I am working on:

```
D:\SRC>xcopy /e monkeys monkeys.bak
Does MONKEYS.BAK specify a file name
or directory name on the target (File/Directory)? d
Copying D:\SRC\MONKEYS\PUTIMG\PUTIMG.C
Copying D:\SRC\MONKEYS\PUTIMG\PUTIMG.OBJ
Copying D:\SRC\MONKEYS\PUTIMG\PUTIMG.EXE
Copying D:\SRC\MONKEYS\BANANA.C
Copying D:\SRC\MONKEYS\BANANA.OBJ
Copying D:\SRC\MONKEYS\BANANA.EXE
6 file(s) copied
```

### Y is for Yellow

This isn't a command, but interesting trivia about how DOS displays colors. If you've looked carefully at FreeDOS, you've probably noticed that text only comes in a limited range of colors—sixteen text colors, and eight background colors.

The IBM 5153 color display presented color to the user by lighting up tiny red, green, and blue phosphor dots at different brightness levels to create a palette of 16 text colors and 8 background colors. Early PCs could only display the background color in the "normal intensity" level; only text colors could use bright colors.

If you look at the text colors, you have black, blue, green, cyan, red, magenta, orange, and white. The "bright" versions of these colors are bright black (a dull gray), bright blue, bright green, bright cyan, bright red, bright magenta, yellow, and bright white. The "bright" version of orange is actually yellow. There is no "bright orange."

If you want to learn more about text colors, read our article about [Why FreeDOS has 16 colors][12].

### Z is for ZIP

You can use `ZIP` at the DOS command line to create archives of files and directories. This is a handy way to make a backup copy of your work or to release a "package" to use in a future FreeDOS distribution. For example, let's say I wanted to make a backup of my project source code, which contains these source files:

```
D:\SRC>zip -9r monkeys.zip monkeys
zip warning: TZ environment variable not found, cannot use UTC times!!
adding: monkeys/ (stored 0%)
adding: monkeys/banana.c (deflated 66%)
adding: monkeys/banana.obj (deflated 26%)
adding: monkeys/banana.exe (deflated 34%)
adding: monkeys/putimg/ (stored 0%)
adding: monkeys/putimg/putimg.c (deflated 62%)
adding: monkeys/putimg/putimg.obj (deflated 29%)
adding: monkeys/putimg/putimg.exe (deflated 34%)
```

ZIP sports a ton of command-line options to do different things, but the command line options I use most are `-r` to process directories and subdirectories recursively, and `-9` to provide the maximum compression possible. `ZIP` and `UNZIP` use a Unix-like command line, so you can combine options behind the dash: `-9r` gives maximum compression and include subdirectories in the Zip file.

For more details about how to use the `ZIP` and `UNZIP` commands, read [How to archive files on FreeDOS][13].

### New FreeDOS guides

Ready for the next step in your FreeDOS journey? Check out our new eBooks and start experimenting with FreeDOS now!

**[A guide to using FreeDOS][14]**

**[An advanced guide to FreeDOS internals][15]**

Image by: (Jim Hall, CC BY-SA 40)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/26-freedos-commands

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/freedos-fish-laptop-color.png
[2]: https://opensource.com/article/22/6/linux-attr-command
[3]: https://opensource.com/sites/default/files/2022-06/FREEDedit_0.png
[4]: https://opensource.com/sites/default/files/2022-06/Freededit-save.png
[5]: https://opensource.com/Linux%20find%20cheat%20sheet
[6]: https://opensource.com/sites/default/files/2022-06/Freedhelp.system.png
[7]: https://opensource.com/article/22/6/linux-cheat-command
[8]: https://opensource.com/sites/default/files/2022-06/FreeDnansi.png
[9]: https://opensource.com/sites/default/files/2022-06/FreeDozone.png
[10]: https://opensource.com/article/21/1/fortran
[11]: https://opensource.com/article/21/6/archive-files-freedos
[12]: https://opensource.com/article/21/6/freedos-sixteen-colors
[13]: https://opensource.com/article/21/6/archive-files-freedos
[14]: https://opensource.com/downloads/guide-using-freedos
[15]: https://opensource.com/downloads/advanced-freedos
