[#]: subject: "Using Asciiquarium for Aquarium Like Animation Effects in Linux Terminal"
[#]: via: "https://itsfoss.com/asciiquarium/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Asciiquarium for Aquarium Like Animation Effects in Linux Terminal
======

There are a bunch of [Linux command tools that are more for amusement][1] than serious work. Asciiquarium is one of them.

It provides a simple aquarium like animation effects in ASCII format for the Linux terminal.

![][2]

Looks interesting? Let's explore it.

### Install Asciiquarium in Linux

If you are using Arch Linux or Fedora, you can install it from your official repositories.

Fedora users:

```

    sudo dnf install asciiquarium

```

Arch Linux users:

```

    sudo pacman -S asciiquarium

```

Asciiquarium is not available in the default repos of Ubuntu. So, you either need to use a prebuilt binary or an external PPA.

#### Install Asciiquarium using PPA

First, add the PPA for Asciiquarium.

```

    sudo add-apt-repository ppa:ytvwld/asciiquarium
    sudo apt update

```

Now, install the package and its dependencies using:

```

    sudo apt install asciiquarium

```

##### Remove PPA

To remove the Asciiquarium PPA, first remove the package.

```

    sudo apt purge asciiquarium
    sudo apt autoremove

```

Now, remove the PPA from your system:

```

    sudo add-apt-repository --remove ppa:openshot.developers/ppa
    sudo apt update

```

#### Install Asciiquarium using Binary

🚧

This needs separate Perl modules installed to your system. Also, it will install several Perl related packages to your system. So keep caution.

![Installing Perl Dependencies][3]

To run the binary, you need the Animation and Curses module from CPAN (Comprehensive Perl Archive Network).

Install CPAN in Ubuntu using:

```

    sudo apt install cpanminus libcurses-perl

```

Now, run:

```

    cpan Term::Animation

```

![Animation Module][4]

This will ask for some configuration, just accept the defaults. Once both are set up, download the Asciiquarium release.

[Download Asciiquarium][5]

Extract the file. You will get a file called Asciiquarium. Now, make it executable.

![Make Asciiquarium Executable][6]

To do it via command line, open a terminal there and give the file execution permission [using chmod command][7].

```

    chmod +x asciiquarium

```

Now, to get the animation, you can run inside that location:

```

    ./asciiquarium

```

Or you can place the file in a [location that is in your path][8].

### Using Asciiquarium

Asciiquarium is a simple program. It does not have any command line options. Once you run `asciiquarium`, you will get the aquarium animation effect on your terminal.

![Asciiquarium][2]

A couple of in-program keys are supported.

  * `r`: Repaint the animation
  * `p`: Pause or Play the animation
  * `q`: Quit



📋

Also, you can use your Arrow keys to speed up the animation

#### Using Asciiquarium with lolcat

If you want to make Asciiquarium more colorful, you can use it with `lolcat`. Install lolcat first using:

```

    sudo apt install lolcat

```

Now, run:

```

    asciiquarium | lolcat

```

![Asciiquarium Lolcat][9]

If you need more animation effect, tweak lolcat accordingly. For example,

```

    asciiquarium | lolcat -p 200

```

![Asciiquarium with lolcat tweaks][10]

This will give you various color effects.

You can use the `-i` option of lolcat, to invert the colors:

```

    asciiquarium | lolcat -i -p 200

```

![Inverted Colors][11]

### Bonus: XFishTank (your desktop becomes the tank)

Another similar fun command is xfishtank. It creates an aquarium on your root window, that is the desktop. You can install it from the official repositories of Ubuntu.

```

    sudo apt install xfishtank

```

Once installed, use:

```

    xfishtank

```

There are several options which will help you to manage the number of fishes, bubbles etc. [Use the man page][12] of the command to learn more about it.

```

    xfishtank -b 100 -f 15

```

![Xfishtank][13]

### Wrapping Up

As you can see, having a fish in your Linux terminal may not get you food but it would lighten up your mood.

No a fish lover? Get a cow.

![][14]

Enjoy Linux with these fun stuff :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/asciiquarium/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/funny-linux-commands/
[2]: https://itsfoss.com/content/images/2023/10/asciiquarium.png
[3]: https://itsfoss.com/content/images/2023/10/Installing-perl-dependencies.png
[4]: https://itsfoss.com/content/images/2023/10/animation-module-setup.png
[5]: https://robobunny.com/projects/asciiquarium/html/
[6]: https://itsfoss.com/content/images/2023/10/execution-permission-for-asciiquarium.png
[7]: https://linuxhandbook.com/chmod-command/
[8]: https://itsfoss.com/add-directory-to-path-linux/
[9]: https://itsfoss.com/content/images/2023/10/ascciiquarium-lolcat.png
[10]: https://itsfoss.com/content/images/2023/10/lolcat-200.gif
[11]: https://itsfoss.com/content/images/2023/10/inverted.png
[12]: https://itsfoss.com/linux-man-page-guide/
[13]: https://itsfoss.com/content/images/2023/10/xfishtank.png
[14]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
