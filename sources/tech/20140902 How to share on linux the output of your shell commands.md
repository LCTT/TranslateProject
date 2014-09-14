guodongxiarn 翻译中
How to share on linux the output of your shell commands
================================================================================
Some time ago I posted an article about [shelr.tv][1] a website and a service that was made to allow you to share your [terminal][2] records directly from the website.

Now the website of shelr.tv seems dead and so I’ve took a look around to see if there are similar websites and I’ve found [commands.com][3].

For what I can see from their homepage it’s a service similar to the other, so let’s test it.

### Step 1 – Register on the website ###

Just [register][4] with a new username/password or use your github account to do it quickly.

### Step 2 – download and install the program monitor ###

[Monitor][5] is a command-line tool that captures command-line input/output and sends it to commands.com, the program it’s open source and hosted on github.

Monitor makes it easy to automate set-up/install of repos. With it you can easily show at people the most common errors and output from commands.

In short with it you can easily share your commands and their output with the world.

To install it follow these simple steps:

1) Clone the github repository of this project, in this way you’ll get the latest source code.

To do this you need the git command installed on your system, if you get an error with this command install it with your package manager, such as

Debian based distributions:

    apt-get install git

Redhat/Centos/Fedora distributions

    yum install git

And now from a terminal clone the repository with:

    git clone https://github.com/dtannen/monitor.git

2) Install readline and curl, these libraries are a pre-requisite for building the program from the sources:

Debian based distributions:

    apt-get install libreadline-dev libcurl4-openssl-dev

Redhat/Centos/Fedora distributions

    yum install readline-devel curl-devel

3) Build the program:

To do this you have to go to the directory we just cloned with git and compile the c program:

    cd monitor
    make
    sudo make install

The default installation will put the binary in /usr/local/bin

![](http://cdn.linuxaria.com/wp-content/uploads/2014/08/commands.png)

### Step 3 – using the monitor command ###

The command monitor it’s pretty easy to use:

    monitor {-d} {-h} {-u <username>}
     
        -d : do not delete /tmp files
        -h : help
        -u : commands.com username</username>

To exit the monitor program you just have to use ctrl-c.

So for me this means just opening a terminal and give these commands:

    riccio@mint-desktop ~ $ monitor -u ricciocri
    Password: 
     
    Successfully logged in...
    AuthKey saved to /tmp/.riccio.commands.com.  Delete file to return to Anonymous posting.
    monitor$ cd /tmp
    ...

Want to see which command I’ve used after these ?
I’ve made this session public (the default it’s private) so you can simply check this url: [https://commands.com/JTNSHRLQJA][6]

From there you can see the commands I’ve used and their output, an interesting options it’s the “fold/expand” so you could fold all commands and just expand the output of the one you like more.

### Conclusions ###

This is just the a basic startup guide, from the website you can make more “social” activity such as comment script/shell sessions, fork them or choose your favorites.

Like github, you can fork any public script/command and change it directly from the website and after that you can also get a public (or private url) that you can use to run directly your script with something like this:

    curl commands.io/JTNSHRLQJA | sh

That’s great to store on the net some scripts that you run frequently on different computers/server, as usual don’t put anything with passwords or sensible information on the net and you’ll be safe enough.

--------------------------------------------------------------------------------

via: http://linuxaria.com/article/how-to-share-on-linux-the-output-of-your-shell-commands

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxaria.com/recensioni/shelr-broadcast-your-linux-shell-on-the-net
[2]:http://linuxaria.com/tag/shell
[3]:https://commands.com/
[4]:https://commands.com/Register/Index
[5]:https://github.com/dtannen/monitor
[6]:https://commands.com/JTNSHRLQJA
