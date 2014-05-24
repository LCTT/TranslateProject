How to take a screenshot from the command line on Linux
================================================================================
There are various flavors of Linux screenshot utilities, including desktop-specific screenshot programs (e.g., KSnapshot for KDE, gnome-screenshot for GNOME, Screenshooter for Xfce), or general screenshot utilities (e.g., Shutter). One of unique screenshot utilities is Scrot (short for "SCReen shOT"), which is a **command-line screenshot utility**. While its interface is minimalistic, Scrot is, feature-wise, as powerful as other dedicated GUI-based screen capture tools. For example, Scrot supports delayed screenshot, adjustable quality/size, command line pipelining, etc. If you are one of those command line junkies, Scrot is a useful tool to add to your arsenal. In this tutorial, I will describe **how to take a screenshot from the command line with Scrot**.

### Install Scrot on Linux ###

To install Scrot on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install scrot

To install Scrot on Fedora:

    $ sudo yum install scrot

To install Scrot on CentOS, you can build it from its source as follows.

First [enable Repoforge on CentOS][1], and use the following commands.

    $ sudo yum install giblib-devel
    $ wget http://linuxbrit.co.uk/downloads/scrot-0.8.tar.gz
    $ tar xvfvz scrot-0.8.tar.gz
    $ cd scrot-0.8
    $ ./configure
    $ make
    $ sudo make install

### Take Screenshots with Scrot ###

In the rest of the tutorial, I will describe how to use Scrot to take screenshots in various ways.

#### 1. Take a screenshot of the entire desktop ####

Screen-capturing the entire desktop is easy. Simply run Scrot command without any argument, and it will save a screenshot of the entire desktop as a (date-stamped) .png file in the current directory.

    $ scrot

You can also specify a destination folder and image file name.

    $ scrot ~/Pictures/my_desktop.png

#### 2. Take a screenshot of a particular window or a rectangular region ####

Scrot allows you to choose a specific window or define a rectangular region in your desktop to take a screenshot of. For that, use the following command.

    $ scrot -s

After running this command, go ahead and click on any window or draw a rectangle with your mouse, which will trigger screen capture of the selected window/region.

Sometimes the chosen region or window may be partially blocked by other windows of the desktop. In that case, you need some time to clear the area before taking a shot. That is when "delayed" screenshot can help you, as described next.

#### 3. Take a delayed screenshot ####

Delayed capture can be useful under various circumstances. Right before taking a shot, you may want to move windows around, activate a menu, or trigger a certain event (e.g., notification), etc. With "-d N" option, we can delay a screenshot process by N seconds.

    $ scrot -s -d 5

#### 4. Adjust quality of a screenshot ####

You can adjust the image quality of a screenshot in the range of 1 to 100 (the higher the better quality). Default quality is 75.

    $ scrot -q 50

#### 5. Adjust the size of a screenshot ####

You can adjust the size of a screenshot in the range of 1 to 100 (the higher the bigger). To reduce screenshot size to 10% of the original:

    $ scrot -t 10

#### 6. Pipeline a captured screenshot to another command ####

Scrot allows you to send a saved screenshot image to any arbitrary command as an input. This option can be useful when you want to do any post-processing on a screenshot image. The filename/path of a screenshot is stored as "$f" string.

    $ scrot -e 'mv $f ~/screenshots' 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/take-screenshot-command-line-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
