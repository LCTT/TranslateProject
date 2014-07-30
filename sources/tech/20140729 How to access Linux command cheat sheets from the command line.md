How to access Linux command cheat sheets from the command line
================================================================================
The power of Linux command line is its flexibility and versatility. Each Linux command comes with its share of command line options and parameters. Mix and match them, and even chain different commands with pipes and redirects. You get yourself literally hundreds of use cases even with a few basic commands, and it's hard even for seasoned system admins to get used to them all. That's when command line cheat sheets come to our rescue.

[![](https://farm6.staticflickr.com/5562/14752051134_5a7c3d2aa4_z.jpg)][1]

I know man pages are still our best friend, but we want to be efficient and strategic by having quick reference cards at our disposal. Your ultimate cheet sheets could be hanging on your office wall with pride, or secretly stored in your hard drive as PDF files, or even be the background image on your desktop.

Alternatively, use yet(!) another command to access your favorite command line cheat sheets. That is, use [cheat][2]. Which is a command line tool allowing you to access, create or update cheat sheets from the command line. The concept is really simple, yet cheat turns out to be quite useful. This tutorial is about how to use cheat command on Linux. You don't need a cheat sheet for using cheat command. It's that simple.

### Installing Cheat on Linux ###

First install Git if you haven't:

    $ sudo apt-get install git (Debian-based system)
    $ sudo yum install git (RedHat-based system)

Also install [Python package installer pip[3].

Finally, install cheat using the following commands.

    $ sudo pip install docopt pygments
    $ git clone https://github.com/chrisallenlane/cheat.git
    $ cd cheat
    $ sudo python setup.py install 

### Configuring Cheat ###

There is not much to configure for cheat command.

One thing to recommend is to enable command-line autocompletion. That way, when you look up a cheat sheet, you can use [TAB] key to auto-complete the name of the command you want to check. Here is how to enable autocompletion for bash.

    $ wget https://github.com/chrisallenlane/cheat/raw/master/cheat/autocompletion/cheat.bash
    $ sudo cp cheat.bash /etc/bash_completion.d/

They provide autocompletion scripts for other shells such as zsh and fish as well.

Another thing is to define an EDITOR environment variable. This variable should point to a text editor that you want to use when creating or updating a cheat sheet. For example, if you want to use Vim editor, put the following in ~/.bashrc.

    export EDITOR=/usr/bin/vim

Log out and log back in to activate autocompletion and updated .bashrc.

### Basic Usage of Cheat ###

One cool thing about the cheat command is that it comes with pre-built cheat sheets for more than 90 popular Linux commands. To get a list of available cheat sheets:

    $ cheat -l 

![](https://farm3.staticflickr.com/2932/14754370585_7133cbbc8c_z.jpg)

To access a cheat sheet of a specific command, simply run cheat with the name of the command:

    $ cheat <command-name> 

![](https://farm4.staticflickr.com/3899/14567722899_8b86c312ca_z.jpg)

You can search all the cheat sheets that contain a specific keyword by using "-s" option:

    $ cheat -s <keyword> 

In many cases, cheat sheets that are useful to some folks may not that helpful to others. To personalize pre-built cheat sheets, cheat command allows you to create a new cheat sheet or update existing ones. To do so, cheat command can keep local copies of cheat sheets in ~/.cheat directory.

To take advantage of cheat's editing feature, first make sure that the EDITOR environment variable is set to the full path of your default text editor. Then copy (non-editable) built-in cheat sheets to ~/.cheat directory. You can find where the built-in cheat sheets are by running the following command. Once you know where they are, simply copy them over to ~/.cheat directory.

    $ cheat -d 

----------

    /usr/lib/python2.6/site-packages/cheat/cheatsheets

----------

    $ cp /usr/lib/python2.6/site-packages/cheat/cheatsheets/* ~/.cheat

Now you can create or update a cheat sheet by using "-e" option:

    $ cheat -e openssl 

As you can imagine, the cheat's editing feature is very useful to tailor a local cheat sheet repository to meet your needs. If you believe in sharing knowledge, you are more than welcome to contribute your cheat sheets to the cheat command's [official Git repository][4], so everyone can benefit from them.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/access-linux-command-cheat-sheets-command-line.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xkcd.com/1168/
[2]:https://github.com/chrisallenlane/cheat
[3]:http://ask.xmodulo.com/install-pip-linux.html
[4]:https://github.com/chrisallenlane/cheat