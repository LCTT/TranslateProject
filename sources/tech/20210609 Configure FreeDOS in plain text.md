[#]: subject: (Configure FreeDOS in plain text)
[#]: via: (https://opensource.com/article/21/6/freedos-fdconfigsys)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Configure FreeDOS in plain text
======
Learn how to configure FreeDOS with FDCONFIG.SYS.
![Person using a laptop][1]

The main configuration file for FreeDOS is a file in the root directory called `FDCONFIG.SYS`. This file contains a series of lines, each setting a value such as `LASTDRIVE=Z` or `FILES=40`. For example, the default `FDCONFIG.SYS` in FreeDOS 1.3 RC4 looks like this:


```
SET DOSDIR=C:\FDOS

!COUNTRY=001,858,C:\FDOS\BIN\COUNTRY.SYS
!LASTDRIVE=Z
!BUFFERS=20
!FILES=40
!MENUCOLOR=7,0

MENUDEFAULT=1,5
MENU 1 - Load FreeDOS with JEMMEX, no EMS (most UMBs), max RAM free
MENU 2 - Load FreeDOS with JEMM386 (Expanded Memory)
MENU 3 - Load FreeDOS low with some drivers (Safe Mode)
MENU 4 - Load FreeDOS without drivers (Emergency Mode)

12?DOS=HIGH
12?DOS=UMB
12?DOSDATA=UMB
1?DEVICE=C:\FDOS\BIN\JEMMEX.EXE NOEMS X=TEST I=TEST NOVME NOINVLPG
234?DEVICE=C:\FDOS\BIN\HIMEMX.EXE
2?DEVICE=C:\FDOS\BIN\JEMM386.EXE X=TEST I=TEST I=B000-B7FF NOVME NOINVLPG
34?SHELL=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT
12?SHELLHIGH=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT
```

But what do all those lines mean? Why do some have a question mark (`?`) or an exclamation point (`!`), while other lines do not?

### A simple configuration

Let's start with a simple configuration, so we can see what does what. Assume this very brief `FDCONFIG.SYS` file:


```
LASTDRIVE=Z
BUFFERS=20
FILES=40
DEVICE=C:\FDOS\BIN\HIMEMX.EXE
SHELL=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT
```

This configuration file contains only a few instructions:

  1. `LASTDRIVE=Z`
  2. `BUFFERS=20`
  3. `FILES=40`
  4. `DEVICE=C:\FDOS\BIN\HIMEMX.EXE`
  5. `SHELL=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT`



The first instruction tells FreeDOS how many drive letters to reserve in memory. (DOS uses letters to represent each drive attached to the system, and `LASTDRIVE=Z` says to reserve drive letters from "A" to "Z."). `LASTDRIVE` affects the number of _logical drives_ that your system can recognize. You probably don't have any logical drives; the FreeDOS installer doesn't set these up by default. In any case, it is safe to set `LASTDRIVE=Z` on any FreeDOS system.

The `BUFFERS` line reserves memory for file buffers. A _buffer_ helps to speed up certain processes that require storage, such as copying files. If you set a larger value for `BUFFERS`, FreeDOS will reserve more memory—and vice versa for smaller values. Most users will set this to `BUFFERS=20` or `BUFFERS=40`, depending on how often they need to read and write files on the system.

The `FILES` setting determines how many files DOS allows you to open at one time. If you run an application that needs to open many files at once, such as a Genealogy database, you may need to set `FILES` to a larger value. For most users, `FILES=40` is a reasonable value.

`DEVICE` is a special instruction that loads a _device driver_. DOS requires device drivers for certain hardware or configurations. The line `DEVICE=C:\FDOS\BIN\HIMEMX.EXE` loads the _HimemX_ device driver, so DOS can take advantage of expanded memory beyond the first 640 kilobytes.

The last line tells the FreeDOS kernel where to find the command-line shell. By default, the kernel will look for the shell as `COMMAND.COM`, but you can change it with the `SHELL` instruction. In this example, `SHELL=C:\FDOS\BIN\COMMAND.COM` says the shell is the `COMMAND.COM` program, located in the `\FDOS\BIN` directory on the `C` drive.

The other text at the end of the `SHELL` indicate the options to the `COMMAND.COM` shell. The FreeDOS `COMMAND.COM` supports several startup options to modify its behavior, including:

  * **`C:\FDOS\BIN`** \- The full path to the `COMMAND.COM` program
  * `/E:1024 -` The environment (E) size, in bytes. `/E:1024` tells `COMMAND.COM` to reserve 1024 bytes, or 1 kilobyte, to store its environment variables.
  * **`/P=C:\FDAUTO.BAT`** \- The `/P` option indicates that the shell is a permanent (P) shell, so the user cannot quit the shell by typing `EXIT` (the extra text `=C:\FDAUTO.BAT` tells `COMMAND.COM` to execute the `C:\FDAUTO.BAT` file at startup, instead of the default `AUTOEXEC.BAT` file)



With that simple configuration, you should be able to interpret some of the `FDCONFIG.SYS` file that's installed by FreeDOS 1.3 RC4.

### Boot menu

FreeDOS supports a neat feature—multiple configurations on one system, using a "boot menu" to select the configuration you want. The `FDCONFIG.SYS` file contains several lines that define the menu:


```
!MENUCOLOR=7,0

MENUDEFAULT=1,5
MENU 1 - Load FreeDOS with JEMMEX, no EMS (most UMBs), max RAM free
MENU 2 - Load FreeDOS with JEMM386 (Expanded Memory)
MENU 3 - Load FreeDOS low with some drivers (Safe Mode)
MENU 4 - Load FreeDOS without drivers (Emergency Mode)
```

The `MENUCOLOR` instruction defines the text color and background color of the boot menu. These values are typically in the range 0 to 7, and represent these colors:

  * 0 Black
  * 1 Blue
  * 2 Green
  * 3 Cyan
  * 4 Red
  * 5 Magenta
  * 6 Brown
  * 7 White



So the `MENUCOLOR=7,0` definition means to display the menu with white (7) text on a black (0) background. If you instead wanted to use white text on a blue background, you could define this as `MENUCOLOR=7,1`.

The exclamation point (`!`) at the start of the line means that this instruction will always be executed, no matter what menu option you choose.

The `MENUDEFAULT=1,5` line tells the kernel how long to wait for the user to select a boot menu entry, or what default menu entry to use if the user did not select one. `MENUDEFAULT=1,5` indicates the system will wait for 5 seconds; if the user did not attempt to select a menu item within that time, the kernel will assume boot menu "1" instead.

![boot menu][2]

Jim Hall, CC-BY SA 4.0

The `MENU` lines after that are labels for the different boot menu configurations. These are presented in order, so menu item "1" is first, then "2," and so on.

![menu select 4][3]

Jim Hall, CC-BY SA 4.0

In the lines that follow in `FDCONFIG.SYS`, you will see numbers before a question mark (`?`). These indicate "for this boot menu entry, use this line." For example, this line with `234?` will only load the HimemX device driver if the user selects boot menu entries "2," "3," or "4."


```
`234?DEVICE=C:\FDOS\BIN\HIMEMX.EXE`
```

There are lots of ways to use `FDCONFIG.SYS` to configure your FreeDOS system. We've only covered the basics here, the most common ways to define your FreeDOS kernel settings. For more information, explore the FreeDOS Help system (type `HELP` at the command line) to learn how to use all of the FreeDOS `FDCONFIG.SYS` options:

  * **SWITCHES**
    * Boot time processing behavior
  * **REM** and **;**
    * Comments (ignored in FDCONFIG.SYS)
  * **MENUCOLOR**
    * Boot menu text color and background color
  * **MENUDEFAULT**
    * Boot menu default value
  * **MENU**
    * Boot menu entry
  * **ECHO** and **EECHO**
    * Display messages
  * **BREAK**
    * Sets extended **Ctrl+C** checking on or off
  * **BUFFERS** or **BUFFERSHIGH**
    * How many disk buffers to allocate
  * **COUNTRY**
    * Sets international behavior
  * **DOS**
    * Tell the FreeDOS kernel how to load itself into memory
  * **DOSDATA**
    * Tell FreeDOS to load kernel data into upper memory
  * **FCBS**
    * Set the number of file control blocks (FCBs)
  * **KEYBUF**
    * Reassign the keyboard buffer in memory
  * **FILES** or **FILESHIGH**
    * How many files to have open at once
  * **LASTDRIVE** or **LASTDRIVEHIGH**
    * Set the last drive letter that can be used
  * **NUMLOCK**
    * Set the keyboard number pad lock on or off
  * **SHELL**, **SHELLHIGH**, or **COMMAND**
    * Set the command line shell
  * **STACKS** or **STACKSHIGH**
    * Add stacks to handle hardware interrupts
  * **SWITCHAR**
    * Redefines the command line option switch character
  * **SCREEN**
    * Set the number of lines on the screen
  * **VERSION**
    * Set what DOS version to report to programs
  * **IDLEHALT**
    * Activates energy saving features, useful on certain systems
  * **DEVICE** and **DEVICEHIGH**
    * Load a driver into memory
  * **INSTALL** and **INSTALLHIGH**
    * Load a "terminate and stay resident" (TSR) program
  * **SET**
    * Set a DOS environment variable



### Configuring in plain text

Like Linux and BSD, FreeDOS configuration happens in plain text. No special tools for editing are required, so dive in and see what options suit you best. It's easy but powerful!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-fdconfigsys

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/uploads/boot-menu.png (The boot menu waits for 5 seconds before assuming menu item 1)
[3]: https://opensource.com/sites/default/files/uploads/menu-select4.png (Use the arrow keys to select a boot menu configuration)
