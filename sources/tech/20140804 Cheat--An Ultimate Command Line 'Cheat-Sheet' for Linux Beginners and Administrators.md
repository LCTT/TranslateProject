[su-kaiyao]翻译中

Cheat – An Ultimate Command Line ‘Cheat-Sheet’ for Linux Beginners and Administrators
================================================================================
What you do when you are not sure of the command you are running especially in case of complex commands which uses a lot of options. We use man pages to get some help in such situation. Some of the other options may include commands like ‘**help**‘, ‘**whereis**‘ and ‘**whatis**‘. But all has their Pros and Cons.

While going through **man pages** for options and help, the description in man pages are too lengthy to understand specially in short span of time.

![Linux Man Pages](http://www.tecmint.com/wp-content/uploads/2014/07/Linux-Man-Pages.jpeg)
Linux Man Pages

Similarly, ‘**help**‘ command may not give you desired output.

![Help Command](http://www.tecmint.com/wp-content/uploads/2014/07/help-command.jpeg)
Help Command

A ‘**whereis**‘ command hardly tells anything other than the location of Installed Binaries (May be Important at time).

![Whereis Command](http://www.tecmint.com/wp-content/uploads/2014/07/whereis-command.jpeg)
Whereis Command

A ‘**whatis**‘ command gives strict and one liner answer which is not much helpful other than acknowledging the purpose of the command, Moreover it never says a single word about the available options.

![Whatis Command](http://www.tecmint.com/wp-content/uploads/2014/07/whatis-command.jpeg)
Whatis Command

We have used all these options till date to solve our issue in the dilemma but here comes an interactive cheat-sheet application ‘**cheat**‘ which is going to lead all the rest.

### What is cheat? ###

**Cheat** is an interactive cheat-sheet application released under GNU General Public License for Linux Command line users which serves the purpose of showing, use cases of a Linux command with all the options and their short yet understandable function.

![Cheat: Provides Easy Command Options](http://www.tecmint.com/wp-content/uploads/2014/07/cheat-sheet.jpeg)
Cheat: Provides Easy Command Options

### Installing ‘Cheat’ in Linux Systems ###

‘**Cheat**‘ has two major dependency – ‘**python**‘ and ‘**pip**‘. Make sure you have installed python and pip before installing ‘**cheat**‘ on the system.

#### Install Python ####

    # apt-get install Python	(On Debian based Systems)
    # yum install python		(On RedHat based Systems)

Install Pip

    # apt-get install python-pip 	(On Debian based Systems)
    # yum install python-pip 	(On RedHat based Systems)

**NOTE**: pip is an easy install replacement and is intended to be an improved Python package installer.

### Download and Install Cheat ###

We will be downloading ‘cheat’ from Git. Make sure you have package ‘git’ installed, if not better install this first.

    # apt-get install git	(On Debian based Systems)
    # yum install git	(On RedHat based Systems)

Next, install the required python dependencies by running following command.

    # pip install docopt pygments

Now, clone the [Git repository][1] of cheat.

    # git clone https://github.com/chrisallenlane/cheat.git

Move to the cheat directory and run ‘**setup.py**‘ (a python script).

    # cd cheat
    # python setup.py install

If installation goes smoothly, you should be able to see a cheat version installed on the system.

    # cheat -v 
    cheat 2.0.9

### Required Configuration for Cheat ###

You must have an ‘**EDITOR**‘ environment variable set in ‘~/.bashrc’ file. Open the user ‘**.bashrc**‘ file and add the following line to it.

    export EDITOR =/usr/bin/nano

You can use your favourite editor here in place of ‘**nano**‘. Save the file and logout. Again Login to make the changes taken into effect.

Next, add the cheat autocompletion feature to enable command-line autocompletion for different shells. To enable autocompletion, simply clone the ‘**cheat.bash**‘ script and copy the script to the appropriate path in your system.

    # wget https://github.com/chrisallenlane/cheat/raw/master/cheat/autocompletion/cheat.bash 
    # mv cheat.bash /etc/bash_completion.d/

**NOTE**: The team has uploaded other shell’s auto completion scrip to Git, which may be cloned and used in case of respective Shell. Use the following link for other shell’s auto completion script.

- [Auto Completion Script for Various Shells][2]

Optionally, you can also enable syntax highlighting, if desired. To active syntax highlighting feature, add a **CHEATCOLORS** environment variable in your ‘**.bashrc**‘ file.

    export CHEATCOLORS=true

The Cheat application default program only serves the basic and most used commands. The content of cheat-sheet resides at location **~/.cheat/.** Manual Cheatsheets can be added to this location to make the application rich.

    # cheat -e xyz

This will open xyz cheat-sheet if available. If not it will create one. The cheat-sheet will be opened in the default **EDITOR**, we set in **.bashrc** in the configuration stage, above.

### Usage of Cheat with Some Commands ###

A tarball may be *.gz or *.bz2 or *.zip or *.xz. So, what option to be used where?

![tar command options](http://www.tecmint.com/wp-content/uploads/2014/07/cheat-tar.jpeg)
tar command options

I never run **dd** command, no matter how much sure I am about the command before consulting and cross checking it at more than one location. The things seems to be easy now.

![dd command options](http://www.tecmint.com/wp-content/uploads/2014/07/cheat-dd.jpeg)
dd command options

A ‘**uname**‘ command help.

![uname command options](http://www.tecmint.com/wp-content/uploads/2014/07/uname-command.jpeg)
uname command options

A short **ifconfig** command line tutorial, in action.

![ifconfig command options](http://www.tecmint.com/wp-content/uploads/2014/07/ifconfig-command.jpeg)
ifconfig command options

A ‘top‘ command, one of the most important command for Admin and Normal User.

![top command options](http://www.tecmint.com/wp-content/uploads/2014/07/top-command.jpeg)
top command options

How about Cheating the cheat command (though the other sense)? Get a list of available commands, the cheat-sheet of which is installed in the System.

![List All Linux Commands](http://www.tecmint.com/wp-content/uploads/2014/07/linux-commands.jpeg)
List All Linux Commands

Search Cheat-sheet with specific keyword.

![Search Cheat Sheet](http://www.tecmint.com/wp-content/uploads/2014/07/search-cheat-sheet.jpeg)
Search Cheat Sheet

See the location of built-in cheat-sheets for all the commands.

    $ cheat -d 

    /home/avi/.cheat 
    /usr/local/lib/python2.7/dist-packages/cheat/cheatsheets

Copy the in-built cheat-sheet to your native directory.

    # cp /usr/local/lib/python2.7/dist-packages/cheat/cheatsheets/* /home/avi/.cheat/

### Conclusion ###

This wonderful project is a life Saviour in many-a-situation. It just gives you information that is required, nothing extra, nothing vague and to the point. This is a must tool for everyone. Easy to build, easy to install, easy to run and easy to understand, this project seems promising.

This Git project has added a wonderful **gag** which I am not going to explain but leave on you to interpret.

![Linux Gag](http://www.tecmint.com/wp-content/uploads/2014/07/linux-gag.jpeg)
Linux Gag

That’s all for now. I’ll be here again with another interesting article you people will love to read. Till then stay tuned and connected to Tecmint. Don’t forget to provide us with your valuable feedback in the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/cheat-command-line-cheat-sheet-for-linux-users/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/install-git-to-create-and-share-your-own-projects-on-github-repository/
[2]:https://github.com/chrisallenlane/cheat/tree/master/cheat/autocompletion
