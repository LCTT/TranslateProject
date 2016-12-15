Add Rainbow Colors to Linux Command Output in Slow Motion
============================================================

In this article, we will review a cool and simple way of giving a command screen output a rainbow colors and slowing down its output speed as well for one reason or the other.

The [lolcat program][2] is used for the above purpose. It basically functions by concatenating files, or standard input, to standard output in a similar way as the [cat command][3], overrides the default screen output color of a particular command and adds rainbow coloring to it.

### How to Install Lolcat Program in Linux

Lolcat program is available on almost all modern Linux distributions from its default repository, but the available version bit older. Alternatively you can install latest version of lolcat from git repository using this following guide.

1.  [Install Lolcat to Output Rainbow Of Colors in Linux Terminal][1]

Once lolcat installed, the basic syntax for running lolcat is:

```
$ lolcat [options] [files] ...
```

It comes with several options that control its behavior, below are a few of the most considerable flags we will emphasis for the scope of this guide:

1.  `-a` – passes every input line through an animation effect.
2.  `-d` – specifies the duration (number of steps before displaying next line) of the animation effect, the default value is 12.
3.  `-s` – it specifies the speed (frame rate- number of steps per second) of the animation effect, default value is 20.
4.  `-f` – enables forcing of coloring in case standard output is not a tty.

You can find more options in the lolcat man page:

```
$ man lolcat 
```

### How to Use Lolcat in Linux

To use lolcat, simply pipe the output of any relevant command to it and watch the magic.

For example:

```
$ ls -l | lolcat -as 25
```

[
 ![colorful Linux Terminal Output](http://www.tecmint.com/wp-content/uploads/2016/12/Colorful-Linux-Terminal-Output.gif) 
][4]

Besides you can alter the default speed, in the following command, we will use a relatively slow speed of 10steps per second:

```
$ ls -l | lolcat -as 10
```

You can use any command with lolcat display output in colorful fashion on Linux terminal, few commands say ps, date and cal as:

```
$ ps | lolcat
$ date | lolcat
$ cal | lolcat
```

In this article, we have looked at how to significantly reduce the speed of a command screen output and give it a rainbow coloring effect.

As usual, you can address to us any questions or comments concerning this article via the feedback section below. Lastly, you can mention to us any useful Linux commands you have discovered there.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/add-colors-to-command-output-terminal-linux/

作者：[ Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/
[2]:http://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/
[3]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2016/12/Colorful-Linux-Terminal-Output.gif
