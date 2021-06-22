[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this helpful Bash script when stargazing)
[#]: via: (https://opensource.com/article/20/4/linux-astronomy)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Use this helpful Bash script when stargazing
======
Keep your eyes on the stars by putting your Linux machine in night
vision mode with xcalib.
![Computer laptop in space][1]

We often talk about [Linux][2] being used on servers and by developers, but it is used in many other fields too, including astronomy. There are a lot of astronomy tools available for Linux, such as sky maps, star charts, and interfaces to telescope drive systems for controlling your telescope. But one challenge for astronomers is using a computer while keeping their eyes working in the dark.

When working out in the field at night, astronomers need to preserve their night vision. It can take up to 30 minutes for the human eye to fully dilate and adjust to low light levels, and doing things like checking a phone or laptop at the regular color and brightness levels can cause the eyes to lose their adjustment. This reduces the ability to see in the dark. An example anyone can understand: if you're reading something on your phone in bed at night and get up to go to the bathroom, you know how difficult it can be to see any obstacles that might be in your way.

### A solution

I'd like to present a nifty little script to help the astronomer in your family keep "their eyes" in the dark. It relies on a utility called [xcalib][3], a "tiny monitor calibration loader for X.org." It can be installed easily using your Linux package manager.

On Fedora, for example:


```
$ sudo dnf info xcalib
$ sudo dnf install xcalib
```

Or Ubuntu:


```
`$ sudo apt-get install xcalib`
```

The xcalib application works only with X11, so it is not functional on Wayland systems. But Wayland has this functionality built-in, so you can get the same results through GNOME Settings. If you're using X11, xcalib is an easy way to change the color temperature of your display.

### The script

I discovered [Redscreen][4], a night vision filter script written by Jeff Jahr in 2014. The original script is written for the C shell, but Bash is the common default these days. In fact, the C shell is not installed by default on my current Fedora Linux workstation. So, I decided to write an updated version of the Redscreen script aimed at the newest Bash syntax, but I made one major change: utilizing a case statement.


```
#!/usr/bin/bash
# redscreen.sh Fri Feb 28 11:36 EST 2020 Alan Formy-Duval
# Turn screen red - Useful to Astronomers
# Inspired by redscreen.csh created by Jeff Jahr 2014
# (<http://www.jeffrika.com/\~malakai/redscreen/index.html>)

# This program is free software: you can redistribute it
# and/or modify it under the terms of the GNU General
# Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any
# later version.

# This program is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE.  See the GNU General Public License for
# more details.

# You should have received a copy of the GNU General Public
# License along with this program.  
# If not, see &lt;[http://www.gnu.org/licenses/\&gt;][5].

case $1 in
            on)
            # adjust color, gamma, brightness, contrast
            xcalib -green .1 0 1 -blue .1 0 1 -red 0.5 1 40 -alter
            exit 1
        ;;
        off)
                xcalib -clear
            exit 1
            ;;
        inv)
            # Invert screen
                xcalib -i -a
                    exit 1
        ;;
        dim)
            # Make the screen darker
                xcalib -clear
            xcalib -co 30 -alter
            exit 1      
        ;;
        *)
                echo "$0 [on | dim | inv | off]"
                    exit 1
        ;;
esac
```

![Skychart for Linux Version 4.2.1 on Fedora workstation][6]

A lot of astronomy programs include a "night-mode" function, but not all do. Also, this script provides a way to affect the entire screen, not just a specific application. This allows you to use your Linux system out in the field at night for other things than just stargazing—such as checking email or reading Opensource.com—without ruining your night vision.

Whether you are an astronomer or just an amateur stargazer, you can spend all night admiring the heavens using Linux and open source!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/linux-astronomy

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://opensource.com/resources/linux
[3]: http://xcalib.sourceforge.net/
[4]: http://www.jeffrika.com/~malakai/redscreen/index.html
[5]: http://www.gnu.org/licenses/\>
[6]: https://opensource.com/sites/default/files/uploads/starchart_in_red.png (A star chart displayed in red screen mode)
