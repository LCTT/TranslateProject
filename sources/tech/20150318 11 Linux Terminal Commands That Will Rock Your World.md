11 Linux Terminal Commands That Will Rock Your World
================================================================================
I have been using Linux for about 10 years and what I am going to show you in this article is a list of Linux commands, tools and clever little tricks that I wish somebody had shown me from the outset instead of stumbling upon them as I went along. 

![Linux Keyboard Shortcuts.](http://f.tqn.com/y/linux/1/L/m/J/1/keyboardshortcuts.png)
Linux Keyboard Shortcuts.

### 1.  Useful Command Line Keyboard Shortcuts ###

The following keyboard shortcuts are incredibly useful and will save you loads of time:

- CTRL + U - Cuts text up until the cursor.
- CTRL + K - Cuts text from the cursor until the end of the line
- CTRL + Y - Pastes text
- CTRL + E - Move cursor to end of line
- CTRL + A - Move cursor to the beginning of the line
- ALT + F - Jump forward to next space
- ALT + B - Skip back to previous space
- ALT + Backspace - Delete previous word
- CTRL + W - Cut word behind cursor
- Shift + Insert - Pastes text into terminal

Just so that the commands above make sense look at the next line of text.

    sudo apt-get intall programname

As you can see I have a spelling error and for the command to work I would need to change "intall" to "install".

Imagine the cursor is at the end of the line. There are various ways to get back to the word install to change it.

I could press ALT + B twice which would put the cursor in the following position (denoted by the ^ symbol):

    sudo apt-get^intall programname

Now you could press the cursor key and insert the ''s' into install.

Another useful command is "shift + insert" especially If you need to copy text from a browser into the terminal.

![](http://f.tqn.com/y/linux/1/L/n/J/1/sudotricks2.png)

### 2.  SUDO !! ###

You are going to really thank me for the next command if you don't already know it because until you know this exists you curse yourself every time you enter a command and the words "permission denied" appear.

- sudo !!

How do you use sudo !!? Simply. Imagine you have entered the following command:

    apt-get install ranger

The words "Permission denied" will appear unless you are logged in with elevated privileges.

sudo !! runs the previous command as sudo. So the previous command now becomes:

    sudo apt-get install ranger

If you don't know what sudo is [start here][1].

![Pause Terminal Applications.](http://f.tqn.com/y/linux/1/L/o/J/1/pauseapps.png)
Pause Terminal Applications.

### 3.  Pausing Commands And Running Commands In The Background ###

I have already written a guide showing how to run terminal commands in the background.

- CTRL + Z - Pauses an application
- fg - Returns you to the application

So what is this tip about?

Imagine you have opened a file in nano as follows:

    sudo nano abc.txt

Halfway through typing text into the file you realise that you quickly want to type another command into the terminal but you can't because you opened nano in foreground mode.

You may think your only option is to save the file, exit nano, run the command and then re-open nano.

All you have to do is press CTRL + Z and the foreground application will pause and you will be returned to the command line. You can then run any command you like and when you have finished return to your previously paused session by entering "fg" into the terminal window and pressing return.

An interesting thing to try out is to open a file in nano, enter some text and pause the session. Now open another file in nano, enter some text and pause the session. If you now enter "fg" you return to the second file you opened in nano. If you exit nano and enter "fg" again you return to the first file you opened within nano. 

![nohup.](http://f.tqn.com/y/linux/1/L/p/J/1/nohup3.png)
nohup.

### 4.  Use nohup To Run Commands After You Log Out Of An SSH Session ###

The [nohup command][2] is really useful if you use the ssh command to log onto other machines. 

So what does nohup do?

Imagine you are logged on to another computer remotely using ssh and you want to run a command that takes a long time and then exit the ssh session but leave the command running even though you are no longer connected then nohup lets you do just that.

For instance I use my [Raspberry PI][3] to download distributions for review purposes.

I never have my Raspberry PI connected to a display nor do I have a keyboard and mouse connected to it.

I always connect to the Raspberry PI via [ssh][4] from a laptop. If I started downloading a large file on the Raspberry PI without using the nohup command then I would have to wait for the download to finish before logging off the ssh session and before shutting down the laptop. If I did this then I may as well have not used the Raspberry PI to download the file at all.

To use nohup all I have to type is nohup followed by the command as follows:

    nohup wget http://mirror.is.co.za/mirrors/linuxmint.com/iso//stable/17.1/linuxmint-17.1-cinnamon-64bit.iso &

![Schedule tasks with at.](http://f.tqn.com/y/linux/1/L/q/J/1/at.png)
Schedule tasks with at.

### 5.  Running A Linux Command 'AT' A Specific Time ###

The 'nohup' command is good if you are connected to an SSH server and you want the command to remain running after logging out of the SSH session.

Imagine you want to run that same command at a specific point in time.

The 'at' command allows you to do just that. 'at' can be used as follows.

    at 10:38 PM Fri
    at> cowsay 'hello'
    at> CTRL + D

The above command will run the program [cowsay][5] at 10:38 PM on Friday evening.

The syntax is 'at' followed by the date and time to run.

When the at> prompt appears enter the command you want to run at the specified time.

The CTRL + D returns you to the cursor.

There are lots of different date and time formats and it is worth checking the man pages for more ways to use 'at'.

![](http://f.tqn.com/y/linux/1/L/l/J/1/manmost.png)

### 6.  Man Pages ###

Man pages give you an outline of what commands are supposed to do and the switches that can be used with them.

The man pages are kind of dull on their own. (I guess they weren't designed to excite us).

You can however do things to make your usage of man more appealing.

    export PAGER=most

You will need to install 'most; for this to work but when you do it makes your man pages more colourful.

You can limit the width of the man page to a certain number of columns using the following command:

    export MANWIDTH=80

Finally, if you have a browser available you can open any man page in the default browser by using the -H switch as follows:

    man -H <command>

Note this only works if you have a default browser set up within the $BROWSER environment variable.

![View Processes With htop.](http://f.tqn.com/y/linux/1/L/r/J/1/nohup2.png)
View Processes With htop.

### 7.  Use htop To View And Manage Processes ###

Which command do you currently use to find out which processes are running on your computer? My bet is that you are using '[ps][6]' and that you are using various switches to get the output you desire.

Install '[htop][7]'. It is definitely a tool you will wish that you installed earlier.

htop provides a list of all running processes in the terminal much like the file manager in Windows.

You can use a mixture of function keys to change the sort order and the columns that are displayed. You can also kill processes from within htop.

To run htop simply type the following into the terminal window:

    htop

![Command Line File Manager - Ranger.](http://f.tqn.com/y/linux/1/L/s/J/1/ranger.png)
Command Line File Manager - Ranger.

### 8.  Navigate The File System Using ranger ###

If htop is immensely useful for controlling the processes running via the command line then [ranger][8] is immensely useful for navigating the file system using the command line.

You will probably need to install ranger to be able to use it but once installed you can run it simply by typing the following into the terminal:

    ranger

The command line window will be much like any other file manager but it works left to right rather than top to bottom meaning that if you use the left arrow key you work your way up the folder structure and the right arrow key works down the folder structure.

It is worth reading the man pages before using ranger so that you can get used to all keyboard switches that are available.

![Cancel Linux Shutdown.](http://f.tqn.com/y/linux/1/L/t/J/1/shutdown.png)
Cancel Linux Shutdown.

### 9.  Cancel A Shutdown ###

So you started the [shutdown][9] either via the command line or from the GUI and you realised that you really didn't want to do that.

    shutdown -c

Note that if the shutdown has already started then it may be too late to stop the shutdown.

Another command to try is as follows:

- [pkill][10] shutdown

![Kill Hung Processes With XKill.](http://f.tqn.com/y/linux/1/L/u/J/1/killhungprocesses.png)
Kill Hung Processes With XKill.

### 10.  Killing Hung Processes The Easy Way ###

Imagine you are running an application and for whatever reason it hangs.

You could use 'ps -ef' to find the process and then kill the process or you could use 'htop'.

There is a quicker and easier command that you will love called [xkill][11].

Simply type the following into a terminal and then click on the window of the application you want to kill.

    xkill

What happens though if the whole system is hanging?

Hold down the 'alt' and 'sysrq' keys on your keyboard and whilst they are held down type the following slowly:

- [REISUB][12]

This will restart your computer without having to hold in the power button.

![youtube-dl.](http://f.tqn.com/y/linux/1/L/v/J/1/youtubedl2.png)
youtube-dl.

### 11.  Download Youtube Videos ###

Generally speaking most of us are quite happy for Youtube to host the videos and we watch them by streaming them through our chosen media player.

If you know you are going to be offline for a while (i.e. due to a plane journey or travelling between the south of Scotland and the north of England) then you may wish to download a few videos onto a pen drive and watch them at your leisure.

All you have to do is install youtube-dl from your package manager.

You can use youtube-dl as follows:

    youtube-dl url-to-video

You can get the url to any video on Youtube by clicking the share link on the video's page. Simply copy the link and paste it into the command line (using the shift + insert shortcut).

### Summary ###

I hope that you found this list useful and that you are thinking "i didn't know you could do that" for at least 1 of the 11 items listed. 

--------------------------------------------------------------------------------

via: http://linux.about.com/od/commands/tp/11-Linux-Terminal-Commands-That-Will-Rock-Your-World.htm

作者：[Gary Newell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://linux.about.com/cs/linux101/g/sudo.htm
[2]:http://linux.about.com/library/cmd/blcmdl1_nohup.htm
[3]:http://linux.about.com/od/mobiledevicesother/a/Raspberry-Pi-Computer-Running-Linux.htm
[4]:http://linux.about.com/od/commands/l/blcmdl1_ssh.htm
[5]:http://linux.about.com/cs/linux101/g/cowsay.htm
[6]:http://linux.about.com/od/commands/l/blcmdl1_ps.htm
[7]:http://www.linux.com/community/blogs/133-general-linux/745323-5-commands-to-check-memory-usage-on-linux
[8]:http://ranger.nongnu.org/
[9]:http://linux.about.com/od/commands/l/blcmdl8_shutdow.htm
[10]:http://linux.about.com/library/cmd/blcmdl1_pkill.htm
[11]:http://linux.about.com/od/funnymanpages/a/funman_xkill.htm
[12]:http://blog.kember.net/articles/reisub-the-gentle-linux-restart/