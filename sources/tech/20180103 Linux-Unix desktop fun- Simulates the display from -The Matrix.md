Linux/Unix desktop fun: Simulates the display from “The Matrix”
======
The Matrix is a science fiction action movie from 1999. It was written and directed by the Wachowski Brothers. The film has falling green characters on screen. The digital rain is representing the activity of the virtual reality in "The Matrix." You can now have Matrix digital rain with CMatrix on a Linux or Unix terminal too.


## Install cmatrix

Install and setup CMatrix as per your Linux/Unix version.

### How to install cmatrix on a Debian/Ubuntu Linux

Type the following [apt-get command][1]/[apt command][2] on a Debian/Ubuntu/Mint Linux:
`$ sudo apt install cmatrix`
Sample outputs:
```
[sudo] password for vivek: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  cmatrix-xfont
The following NEW packages will be installed:
  cmatrix
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 15.8 kB of archives.
After this operation, 50.2 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 cmatrix amd64 1.2a-5build2 [15.8 kB]
Fetched 15.8 kB in 0s (19.7 kB/s)
Selecting previously unselected package cmatrix.
(Reading database ... 205388 files and directories currently installed.)
Preparing to unpack .../cmatrix_1.2a-5build2_amd64.deb ...
Unpacking cmatrix (1.2a-5build2) ...
Setting up cmatrix (1.2a-5build2) ...
Processing triggers for man-db (2.7.6.1-2) ...
```

### How to install cmatrix on an Arch Linux

Type the following pacman command:
`$ sudo pacman -S cmatrix`

### How to install cmatrix on a FreeBSD system

To install the port run:
`# cd /usr/ports/misc/cmatrix/ && make install clean`
OR add the binary package using the pkg command
`# pkg install cmatrix`

### How to install cmatrix on a macOS Unix

Type the following brew command:
`$ brew install cmatrix`

### How to install cmatrix on a OpenBSD

Type the following pkg_add command:
`# pkg_add cmatrix`

## Using cmatrix

Simply type the command:
`$ cmatrix`
[![cmtarix in action][3]][3]

### Using keyboard

The following keystrokes are available during execution (unavailable in -s mode):
| KEYSTROKES | Description |
| a | Toggle asynchronous scroll |
| b | Random bold characters |
| B | All bold characters |
| n | Turn off bold characters |
| 0-9 | Adjust update speed |
| ! @ # $ % ^ & ) | Change the color of the matrix to the corresponding color: ! – red, @ –
green, # – yellow, $ – blue, % – magenta, ^ – cyan, & – white, ) – black. |
| q | Quit the program |

You can pass the following option to the cmatrix command:
`$ cmatrix -h`
Sample outputs:
```
-a: Asynchronous scroll
 -b: Bold characters on
 -B: All bold characters (overrides -b)
 -f: Force the linux $TERM type to be on
 -l: Linux mode (uses matrix console font)
 -o: Use old-style scrolling
 -h: Print usage and exit
 -n: No bold characters (overrides -b and -B, default)
 -s: "Screensaver" mode, exits on first keystroke
 -x: X window mode, use if your xterm is using mtx.pcf
 -V: Print version information and exit
 -u delay (0 - 10, default 4): Screen update delay
 -C [color]: Use this color for matrix (default green)
```

You now have the coolest terminal app!


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/open-source/command-line-hacks/matrix-digital-rain-on-linux-macos-unix-terminal/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[2]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[3]:https://www.cyberciti.biz/media/new/cms/2018/01/small-cmtarix-file.gif
