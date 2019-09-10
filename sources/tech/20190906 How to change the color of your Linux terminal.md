[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to change the color of your Linux terminal)
[#]: via: (https://opensource.com/article/19/9/linux-terminal-colors)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/jason-bakerhttps://opensource.com/users/tlaihttps://opensource.com/users/amjithhttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravo)

How to change the color of your Linux terminal
======
Make Linux as colorful (or as monochromatic) as you want.
![4 different color terminal windows with code][1]

You can add color to your Linux terminal using special ANSI encoding settings, either dynamically in a terminal command or in configuration files, or you can use ready-made themes in your terminal emulator. Either way, the nostalgic green or amber text on a black screen is wholly optional. This article demonstrates how you can make Linux as colorful (or as monochromatic) as you want.

### Terminal capabilities

Modern systems usually default to at least xterm-256color, but if you try to add color to your terminal without success, you should check your TERM setting.

Historically, Unix terminals were literally that: physical points at the literal endpoint (termination) of a shared computer system where users could type in commands. They were unique from the teletype machines (which is why we still have /dev/tty devices in Linux today) that were often used to issue commands remotely. Terminals had CRT monitors built-in, so users could sit at a terminal in their office to interact directly with the mainframe. CRT monitors were expensive—both to manufacture and to control; it was easier to have a computer spit out crude ASCII text than to worry about anti-aliasing and other niceties that modern computerists take for granted. However, developments in technology happened fast even then, and it quickly became apparent that as new video display terminals were designed, they needed new capabilities to be available on an optional basis.

For instance, the fancy new VT100 released in 1978 supported ANSI color, so if a user identified the terminal type as vt100, then a computer could deliver color output, while a basic serial device might not have such an option. The same principle applies today, and it's set by the TERM [environment variable][2]. You can check your TERM definition with **echo**:


```
$ echo $TERM
xterm-256color
```

The obsolete (but still maintained on some systems in the interest of backward compatibility) /etc/termcap file defined the capabilities of terminals and printers. The modern version of that is terminfo, located in either /etc or /usr/share, depending on your distribution. These files list features available in different kinds of terminals, many of which are defined by historical hardware: there are definitions for vt100 through vt220, as well as for modern software emulators like xterm and Xfce. Most software doesn't care what terminal type you're using; in rare instances, you might get a warning or error about an incorrect terminal type when logging into a server that checks for compatible features. If your terminal is set to a profile with very few features, but you know the emulator you use is capable of more, then you can change your setting by defining the TERM environment variable. You can do this by exporting the TERM variable in your ~/.bashrc configuration file:


```
`export TERM=xterm-256color`
```

Save the file, and reload your settings:


```
`$ source ~/.bashrc`
```

### ANSI color codes

Modern terminals have inherited ANSI escape sequences for "meta" features. These are special sequences of characters that a terminal interprets as actions instead of characters. For instance, this sequence clears the screen up to the next prompt:


```
`$ printf `\033[2J``
```

It doesn't clear your history; it just clears up the screen in your terminal emulator, so it's a safe and demonstrative ANSI escape sequence.

ANSI also has sequences to set the color of your terminal. For example, typing this code changes the subsequent text to green:


```
`$ printf '\033[32m'`
```

As long as you see color the same way your computer does, you could use color to help you remember what system you're logged into. For example, if you regularly SSH into your server, you can set your server prompt to green to help you differentiate it at a glance from your local prompt. For a green prompt, use the ANSI code for green before your prompt character and end it with the code representing your normal default color:


```
`export PS1=`printf "\033[32m$ \033[39m"``
```

### Foreground and background

You're not limited to setting the color of your text. With ANSI codes, you can control the background color of your text as well as do some rudimentary styling.

For instance, with **\033[4m**, you can cause text to be underlined, or with **\033[5m** you can set it to blink. That might seem silly at first—because you're probably not going to set your terminal to underline all text and blink all day—but it can be useful for select functions. For instance, you might set an urgent error produced by a shell script to blink (as an alert for your user), or you might underline a URL.

For your reference, here are the foreground and background color codes. Foreground colors are in the 30 range, while background colors are in the 40 range:

Color | Foreground | Background
---|---|---
Black | \033[30m | \033[40m
Red | \033[31m | \033[41m
Green | \033[32m | \033[42m
Orange | \033[33m | \033[43m
Blue | \033[34m | \033[44m
Magenta | \033[35m | \033[45m
Cyan | \033[36m | \033[46m
Light gray | \033[37m | \033[47m
Fallback to distro's default | \033[39m | \033[49m

There are some additional colors available for the background:

Color | Background
---|---
Dark gray | \033[100m
Light red | \033[101m
Light green | \033[102m
Yellow | \033[103m
Light blue | \033[104m
Light purple | \033[105m
Teal | \033[106m
White | \033[107m

### Permanency

Setting colors in your terminal session is only temporary and relatively unconditional. Sometimes the effect lasts for a few lines; that's because this method of setting colors relies on a printf statement to set a mode that lasts only until something else overrides it.

The way a terminal emulator typically gets instructions on what colors to use is from the settings of the LS_COLORS environment variable, which is in turn populated by the settings of dircolors. You can view your current settings with an echo statement:


```
$ echo $LS_COLORS
rs=0:di=38;5;33:ln=38;5;51:mh=00:pi=40;
38;5;11:so=38;5;13:do=38;5;5:bd=48;5;
232;38;5;11:cd=48;5;232;38;5;3:or=48;
5;232;38;5;9:mi=01;05;37;41:su=48;5;
196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;
196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;
[...]
```

Or you can use dircolors directly:


```
$ dircolors --print-database
[...]
# image formats
.jpg 01;35
.jpeg 01;35
.mjpg 01;35
.mjpeg 01;35
.gif 01;35
.bmp 01;35
.pbm 01;35
.tif 01;35
.tiff 01;35
[...]
```

If that looks cryptic, it's because it is. The first digit after a file type is the attribute code, and it has six options:

  * 00 none
  * 01 bold
  * 04 underscore
  * 05 blink
  * 07 reverse
  * 08 concealed



The next digit is the color code in a simplified form. You can get the color code by taking the final digit of the ANSII code (32 for green foreground, 42 for green background; 31 or 41 for red, and so on).

Your distribution probably sets LS_COLORS globally, so all users on your system inherit the same colors. If you want a customized set of colors, you can use dircolors for that. First, generate a local copy of your color settings:


```
`$ dircolors --print-database > ~/.dircolors`
```

Edit your local list as desired. When you're happy with your choices, save the file. Your color settings are just a database and can't be used directly by [ls][3], but you can use dircolors to get shellcode you can use to set LS_COLORS:


```
$ dircolors --bourne-shell ~/.dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:
pi=40;33:so=01;35:do=01;35:bd=40;33;01:
cd=40;33;01:or=40;31;01:mi=00:su=37;41:
sg=30;43:ca=30;41:tw=30;42:ow=34;
[...]
export LS_COLORS
```

Copy and paste that output into your ~/.bashrc file and reload. Alternatively, you can dump that output straight into your .bashrc file and reload.


```
$ dircolors --bourne-shell ~/.dircolors &gt;&gt; ~/.bashrc
$ source ~/.bashrc
```

You can also make Bash resolve .dircolors upon launch instead of doing the conversion manually. Realistically, you're probably not going to change colors often, so this may be overly aggressive, but it's an option if you plan on changing your color scheme a lot. In your .bashrc file, add this rule:


```
`[[ -e $HOME/.dircolors ]] && eval "`dircolors --sh $HOME/.dircolors`"`
```

Should you have a .dircolors file in your home directory, Bash evaluates it upon launch and sets LS_COLORS accordingly.

### Color

Colors in your terminal are an easy way to give yourself a quick visual reference for specific information. However, you might not want to lean on them too heavily. After all, colors aren't universal, so if someone else uses your system, they may not see the colors the same way you do. Furthermore, if you use a variety of tools to interact with computers, you might also find that some terminals or remote connections don't provide the colors you expect (or colors at all).

Those warnings aside, colors can be useful and fun in some workflows, so create a .dircolor database and customize it to your heart's content.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-terminal-colors

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/jason-bakerhttps://opensource.com/users/tlaihttps://opensource.com/users/amjithhttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/article/19/8/what-are-environment-variables
[3]: https://opensource.com/article/19/7/master-ls-command
