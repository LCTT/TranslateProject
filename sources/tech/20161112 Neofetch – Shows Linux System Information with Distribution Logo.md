Neofetch – Shows Linux System Information with Distribution Logo
============================================================

Neoftech is a cross-platform and easy-to-use [system information command line script][3] that collects your Linux system information and display it on the terminal next to an image, it could be your distributions logo or any ascii art of your choice.

Neoftech is very similar to [ScreenFetch][4] or [Linux_Logo][5] utilities, but highly customizable and comes with some extra features as discussed below.

Its main features include: it’s fast, prints a full color image – your distributions logo in ASCII alongside your system information, it’s highly customizable in terms of which, where and when information is printed on the terminal and it can take a screenshot of your desktop when closing the script as enabled by a special flag.

#### Required Dependencies:

1.  Bash 3.0+ with ncurses support.
2.  w3m-img (occasionally packaged with w3m) or iTerm2 or Terminology for printing images.
3.  [imagemagick][1] – for thumbnail creation.
4.  [Linux terminal emulator][2] should support \033[14t [3] or xdotool or xwininfo + xprop or xwininfo + xdpyinfo .
5.  On Linux, you need feh, nitrogen or gsettings for wallpaper support.

Important: You can read more about optional dependencies from the Neofetch Github repository to check if your [Linux terminal emulator][6] actually supports \033[14t or any extra dependencies for the script to work well on your distro.

### How To Install Neofetch in Linux

Neofetch can be easily installed from third-party repositories on almost all Linux distributions by following below respective installation instructions as per your distribution.

#### On Debian

```
$ echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
$ curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
$ sudo apt-get update
$ sudo apt-get install neofetch
```

#### On Ubuntu and Linux Mint

```
$ sudo add-apt-repository ppa:dawidd0811/neofetch
$ sudo apt-get update
$ sudo apt-get install neofetch
```

#### On RHEL, CentOS and Fedora

You need to have dnf-plugins-core installed on your system, or else install it with the command below:

```
$ sudo yum install dnf-plugins-core
```

Enable COPR repository and install neofetch package.

```
$ sudo dnf copr enable konimex/neofetch
$ sudo dnf install neofetch
```

#### On Arch Linux

You can either install neofetch or neofetch-git from the AUR using packer or Yaourt.

```
$ packer -S neofetch
$ packer -S neofetch-git
OR
$ yaourt -S neofetch
$ yaourt -S neofetch-git
```

#### On Gentoo

Install app-misc/neofetch from Gentoo/Funtoo’s official repositories. However, in case you need the git version of the package, you can install =app-misc/neofetch-9999.

### How To Use Neofetch in Linux

Once you have installed the package, the general syntax for using it is:

```
$ neofetch
```

Note: If w3m-img or [imagemagick][7] is not installed on your system, [screenfetch][8] will be enabled by default and neofetch will display your [ASCII art logo][9] as in the image below.

#### Linux Mint Information

[
 ![Linux Mint System Information](http://www.tecmint.com/wp-content/uploads/2016/11/Linux-Mint-System-Information.png) 
][10]

Linux Mint System Information

#### Ubuntu Information

[
 ![Ubuntu System Information](http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information.png) 
][11]

Ubuntu System Information

If you want to display the default distribution logo as image, you should install w3m-img or imagemagickon your system as follows:

```
$ sudo apt-get install w3m-img    [On Debian/Ubuntu/Mint]
$ sudo yum install w3m-img        [On RHEL/CentOS/Fedora]
```

Then run neofetch again, you will see the default wallpaper of your Linux distributions as the image.

```
$ neofetch
```
[
 ![Ubuntu System Information with Logo](http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information-with-Logo.png) 
][12]

Ubuntu System Information with Logo

After running neofetch for the first time, it will create a configuration file with all options and settings: `$HOME/.config/neofetch/config`.

This configuration file will enable you through the `printinfo ()` function to alter the system information that you want to print on the terminal. You can type in new lines of information, modify the information lineup, delete certain lines and also tweak the script it using bash code to manage the information to be printed out.

You can open the configuration file using your favorite editor as follows:

```
$ vi ~/.config/neofetch/config
```

Below is an excerpt of the configuration file on my system showing the `printinfo ()` function.

Neofetch Configuration File
```
#!/usr/bin/env bash
# vim:fdm=marker
#
# Neofetch config file
# https://github.com/dylanaraps/neofetch

# Speed up script by not using unicode
export LC_ALL=C
export LANG=C

# Info Options {{{

# Info
# See this wiki page for more info:
# https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
printinfo() {
    info title
    info underline

    info "Model" model
    info "OS" distro
    info "Kernel" kernel
    info "Uptime" uptime
    info "Packages" packages
    info "Shell" shell
    info "Resolution" resolution
    info "DE" de
    info "WM" wm
    info "WM Theme" wmtheme
    info "Theme" theme
    info "Icons" icons
    info "Terminal" term
    info "Terminal Font" termfont
    info "CPU" cpu
    info "GPU" gpu
    info "Memory" memory

    # info "CPU Usage" cpu_usage
    # info "Disk" disk
    # info "Battery" battery
    # info "Font" font
    # info "Song" song
    # info "Local IP" localip
    # info "Public IP" publicip
    # info "Users" users
    # info "Birthday" birthday

    info linebreak
    info cols
    info linebreak
}
.....
```

Type the command below to view all flags and their configuration values you can use with neofetch script:

```
$ neofetch --help
```

To launch neofetch with all functions and flags enabled, employ the `--test` flag:

```
$ neofetch --test
```

You can enable the ASCII art logo again using the `--ascii` flag:

```
$ neofetch --ascii
```

In this article, we have covered a simple and highly configuration/customizable command line script that gathers your system information and displays it on the terminal.

Remember to get in touch with us via the feedback form below to ask any questions or give us your thoughts concerning the neofetch script.

Last but not least, if you know of any similar scripts out there, do not hesitate to let us know, we will be pleased to hear from you.

Visit the [neofetch Github repository][13].

--------------------------------------------------------------------------------

via: http://www.tecmint.com/neofetch-shows-linux-system-information-with-logo

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-imagemagick-in-linux/
[2]:http://www.tecmint.com/linux-terminal-emulators/
[3]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
[4]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
[5]:http://www.tecmint.com/linux_logo-tool-to-print-color-ansi-logos-of-linux/
[6]:http://www.tecmint.com/linux-terminal-emulators/
[7]:http://www.tecmint.com/install-imagemagick-in-linux/
[8]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
[9]:http://www.tecmint.com/linux_logo-tool-to-print-color-ansi-logos-of-linux/
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Linux-Mint-System-Information.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information-with-Logo.png
[13]:https://github.com/dylanaraps/neofetch
