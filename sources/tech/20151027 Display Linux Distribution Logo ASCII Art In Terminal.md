translating wi-cuckoo
Display Linux Distribution Logo ASCII Art In Terminal
================================================================================
![Display Linux logo in ASCII art](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/ASCII-Arts-Linux-Logo.jpeg)

See the picture above? You might have seen people sharing such desktop screenshot with terminal showing the logo of the Linux distribution used in ASCII characters. Looking at those screenshots, you may wonder **how to show the logo of Linux distribution in terminal in ASCII characters**.

In this tutorial, I’ll show you a couple of tools that will display Linux logo in command line.

### 1. Use screenfetch to display Linux distro logo in ASCII art ###

[screenfetch][1] is the easiest way to display Linux distribution logo in the terminal. You don’t have to specify anything, it will auto-detect the Linux distribution. And not just logo, screenfetch also displays some basic hardware information alongside it.

#### Install screenfetch ####

To install screenfetch in Ubuntu based distributions such as Linux Mint, elementary OS, Linux Lite, Zorin OS etc, you can use the command below:

    sudo apt-get install screenfetch

**Note**: For Ubuntu 14.04 based distros, you’ll have to add a PPA (as suggested by Benjamin in the comments). Use the command below:

    sudo apt-add-repository ppa:djcj/screenfetch
    sudo apt-get update
    apt-get install screenfetch

To install screenfetch in Arch based distributions such as Antergos, Manjaro, Chakra etc, use the command below:

    sudo pacman -S screenfetch

To install screenfetch in Fedora based Linux distributions such as Korora etc, use the command below:

    sudo dnf install screenfetch

#### Using screenfetch ####

Using screenfetch is utterly simple. Open a terminal and use the command below:

    screenfetch

That’s it. You’ll see the logo of your Linux distribution displayed in ASCII art along with some information about your system:

![ASCII display for Antergos](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Screenfetch-Antergos-Arch.jpeg)

![ASCII display for Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Screenfetch-Ubuntu.jpeg)

#### Taking screenshot with screenfetch [Optional] ####

Now this is optional because you can use the Screenshot tools to take screenshot of the displayed ASCII art in terminal. But if you install command line screenshot utility, scrot (it is available in the default repository of several Linux distributions), you can automatically take a screenshot of the displayed Linux logo along with your desktop with the command below:

    screenfetch -s

If I combine screenfetch with vintage looking [cool-retro-term][2], the result is even more awesome:

![screenfetch with cool retro term](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/ASCII-Art-Retro-Terminal.jpeg)

### 2. Use linux_logo to display Linux distro logo in ASCII art ###

linux_logo is another command line tool to display ASCII art of Linux distributions. Unlike screenfetch, linux_logo doesn’t automatically identifies and displays the correct Linux distro logo.

For Ubuntu, it displayed Debian and for Antergos, it displayed sort of BSD-ish logo.

![Debian instead of Ubuntu?](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Linuxlogo-Ubuntu.jpeg)

Debian instead of Ubuntu?

But linux_logo has a number of options that you can use. You can choose to display the logo of any Linux distribution available in the list. Before we see how to do that, let me show you how to install it first.

#### Install linux_logo ####

To install linux_logo in Ubuntu based Linux distributions, use the command below:

    sudo apt-get install linuxlogo

To install linux_logo in Arch based Linux distributions, use the command below:

    sudo pacman -S linux_logo

To install linux_logo in Fedora based Linux distributions, use the command below:

    sudo dnf install linux_logo

#### Using linux_logo ####

Once installed, use the command below to list all the options:

    linux_logo -L list

The output would be like:

![using linux_logo](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Linux-logo-Antergos.jpeg)

As you can see there are a number of options. You can choose the number of the Linux distribution and use it in the following way:

    linux_logo -L 25

This will display OpenSUSE logo:

![OpenSUSE ASCII art](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Suse-Linux-logo-Antergos.jpeg)

There are more options to display certain sort of info and hide other etc. I left it up to you to explore it.

### Which one did you like more? ###

screenfetch or linux_logo? Which one you liked more? Personally, I prefer screenfetch. It’s easier to use and does what it is expected of it. What about you?

注：投票
Which one you prefer?

- screenfetch
- linux_logo
- Don't care

投票代码：
<div class="PDS_Poll" id="PDI_container9144518" style="display:inline-block;"></div>
<div id="PD_superContainer"></div>
<script type="text/javascript" charset="UTF-8" src="//static.polldaddy.com/p/9144518.js"></script>
<noscript><a href="http://polldaddy.com/poll/9144518">Take Our Poll</a></noscript></p>

--------------------------------------------------------------------------------

via: http://itsfoss.com/display-linux-logo-in-ascii/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://github.com/KittyKatt/screenFetch
[2]:http://itsfoss.com/cool-retro-term/
