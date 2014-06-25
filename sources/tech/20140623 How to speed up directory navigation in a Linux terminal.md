Translating by GOLinux
How to speed up directory navigation in a Linux terminal
================================================================================
As useful as navigating through directories from the command line is, rarely anything has become as frustrating as repeating over and over "cd ls cd ls cd ls ..." If you are not a hundred percent sure of the name of the directory you want to go to next, you have to use ls. Then use cd to go where you want to. Hopefully, a lot of terminals and shell languages now propose a powerful auto-completion feature to cope with that problem. But it remains that you have to hit the tabulation key frenetically all the time. If you are as lazy as I am, you will be very interested in autojump. autojump is a command line utility that allows you to jump straight to your favorite directory, regardless of where you currently are.

### Install autojump on Linux ###

To install autojump on Ubuntu or Debian:

    $ sudo apt-get install autojump

To install autojump on CentOS or Fedora, use yum command. On CentOS, you need to [enable EPEL repository][1] first.

    $ sudo yum install autojump

To install autojump on Archlinux:

    $ sudo pacman -S autojump

If you cannot find a package for your distribution, you can always compile from the sources on [GitHub][2].

### Basic Usage of autojump ###

The way autojump works is simple: it records your current location every time you launch a command, and adds it in its database. That way, some directories will be added more than others, typically your most important ones, and their "weight" will then be greater.

From there you can jump straight to them using the syntax:

    autojump [name or partial name of the directory]

Notice that you do not need a full name as autojump will go through its database and return its most probable result.

For example, assume that we are working in a directory structure such as the following.

![](https://farm4.staticflickr.com/3921/14276240117_9f56b42fec_z.jpg)

Then the command below will take you straight to /root/home/doc regardless of where you were.

    $ autojump do

If you hate typing too, I recommend making an alias for autojump or using the default one.

    $ j [name or partial name of the directory]

Another notable feature is that autojump supports both zsh shell and auto-completion. If you are not sure of where you are about to jump, just hit the tabulation key and you will see the full path.

So keeping the same example, typing:

    $ autojump d

and then hitting tab will return either /root/home/doc or /root/home/ddl.

Finally for the advanced user, you can access the directory database and modify its content. It then becomes possible to manually add a directory to it via:

    $ autojump -a [directory]

If you suddenly want to make it your favorite and most frequently used folder, you can artificially increase its weight by launching from within it the command

    $ autojump -i [weight]

This will result in this directory being more likely to be selected to jump to. The opposite would be to decrease its weight with:

    $ autojump -d [weight]

To keep track of all these changes, typing:

    $ autojump -s

will display the statistics in the database, while:

    $ autojump --purge

will remove from the database any directory that does not exist anymore.

To conclude, autojump will be appreciated by all the command line power users. Whether you are ssh-ing into a server, or just like to do things the old fashion way, reducing your navigation time with fewer keystrokes is always a plus. If you are really into that kind of utilities, you should definitely look into [Fasd][3] too, which deserves a post in itself.

What do you think of autojump? Do you use it regularly? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/speed-up-directory-navigation-linux-terminal.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[2]:https://github.com/joelthelion/autojump
[3]:https://github.com/clvv/fasd
