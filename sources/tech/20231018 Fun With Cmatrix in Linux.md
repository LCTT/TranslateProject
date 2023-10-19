[#]: subject: "Fun With Cmatrix in Linux"
[#]: via: "https://itsfoss.com/using-cmatrix/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fun With Cmatrix in Linux
======

Cmatrix is an entertaining command-line program for Linux and Unix systems. It gives a 'Matrix'-style display, where a rain of green characters streams down the screen, just like in the iconic Matrix film series.

![Cmatrix Command][1]

But other than this green streams of characters, you can do several other things with this interesting command.

🚧

Cmatrix is a CPU intensive command. So use this with caution.

### Install Cmatrix in Ubuntu and Other Linux systems

Cmatrix is available in the official repositories of almost all major Linux distributions. In Ubuntu, you can install Cmatrix using the command:

```

    sudo apt install cmatrix

```

Fedora users should use:

```

    sudo dnf install cmatrix

```

Arch Linux user can use pacman:

```

    sudo pacman -S cmatrix

```

### Basic cmatrix options

The cmatrix command alone provides several options, to change the appearance of the default output, that is the green character streams.

#### Bold characters

You can either toggle the bold characters on using `-b` option, where you will find occasional bold characters,

```

    cmatrix -b

```

![Cmatrix with Occasional Bold Characters][2]

or, turn all the characters to bold using:

```

    cmatrix -B

```

![All Bold Characters][3]

#### Asynchronous scroll

The usual Cmatrix will create a display, where characters are falling down in a synchronous manner. In this mode, you can see a dynamic and visually engaging display, where the speed of the characters is varied.

To use Cmatrix in asynchronous scroll:

```

    cmatrix -a

```

#### Change the speed of characters

Do you want to display the characters falling very fast, or very slow? You can do this in Cmatrix.

To make characters fall down fast, use:

```

    cmatrix -u 2

```

![Characters Moving Fast][4]

Here, the default value of screen update delay is 4 and if you reduce it, the speed will be increased and vice versa. So, to run a slower cmatrix, use:

```

    cmatrix -u 9

```

![Characters Moving Slow][5]

#### Use different Colors

Go green! Or perhaps go purple?

You can run Cmatrix with a different color. For this, you can use the `-C` option.

```

    cmatrix -C magenta

```

![The color is Magenta][6]

The supported colors are **green, red, blue, white, yellow, cyan, magenta and black**.

#### Other Options

Option | Function
---|---
cmatrix -o | Old Style Scrolling
cmatrix -m | Lambda Mode: Every character becomes a lambda
cmatrix -s | Screensaver Mode: Exits on first keystroke
cmatrix -h | Help

### Cmatrix keystrokes during execution

Even if you don’t provide any option in Cmatrix, you can provide some input later on during execution. Those are listed below.

#### Change Color

Yes, you can change the color of characters while running. But you need to remember some keys and their corresponding color. What to do is, while running Cmatrix, press these keys and the color will change.

Color | Keystroke
---|---
Red | !
Green | @
Yellow | #
Blue | $
Magenta | %
Cyan | ^
White | &
Black | )

#### Adjust update speed

While running, you can use the number keys from 0 through 9 to change the update speed.

There are other options also, which you can find from the man page of the command.

```

    man cmatrix

```

### Bonus: Cmatrix with lolcat

🚧

Cmatrix itself is CPU intensive. So use the other commands with caution.

You can use Cmatrix, in combination with the lolcat command, to make it look more interesting. In Ubuntu, you can install lolcat using:

```

    sudo apt install lolcat

```

Now, just pipe Cmatrix to lolcat so that you will get a rainbow effect.

```

    cmatrix | lolcat

```

![Cmatrix with Lolcat][7]

Also, try all the above functions of Cmatrix, while piping into lolcat.

Or, you can use an inclined stripe for a rainbow effect, giving another type of experience.

```

    cmatrix | lolcat -p 100

```

Additionally, you can just invert the background and foreground colors so that your terminal will be filled with colors.

```

    cmatrix | lolcat -i

```

![Cmatrix with Lolcat Inverted Color Option][8]

### More fun with terminal

I know this is not the [most useful Linux command][9] but it's fun nonetheless and you can have some [fun with your Linux system][10] sometime, right?

[Cowsay][11] is another such command:

![][12]

And even more here:

![][12]

I let you enjoy it now, Mr. Anderson.

--------------------------------------------------------------------------------

via: https://itsfoss.com/using-cmatrix/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/10/Cmatrix.gif
[2]: https://itsfoss.com/content/images/2023/10/cmatrix-occasional-bold-characters.png
[3]: https://itsfoss.com/content/images/2023/10/cmatrix-all-bold-characters.png
[4]: https://itsfoss.com/content/images/2023/10/Cmatrix-fast.gif
[5]: https://itsfoss.com/content/images/2023/10/cmatrix-slow.gif
[6]: https://itsfoss.com/content/images/2023/10/cmatrix-magenta-color.png
[7]: https://itsfoss.com/content/images/2023/10/Cmatrix-with-lolcat.png
[8]: https://itsfoss.com/content/images/2023/10/cmatrix-with-inverse-colors.png
[9]: https://itsfoss.com/essential-ubuntu-commands/
[10]: https://itsfoss.com/funny-linux-commands/
[11]: https://itsfoss.com/cowsay/
[12]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
