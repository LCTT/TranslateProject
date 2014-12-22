A Great Tool To Show Linux Command Progress Like % , ETA
================================================================================
Coreutils Viewer (**cv**) is a simple program that can be used to show the progress of any of coreutils commands. It uses information from file descriptors to determine the progress of a command for example the cp command. The beauty of **cv** is that it can be used with other linux commands like watch and I/O redirection commands as you shall see. This allows you to use it in a script, or however you like, your imagination will be the limit.

### Installation ###

You can download the source files for cv from its [github repository here][1]. Once you have downloaded the zip file extract it and then change directory to the extracted folder.

The program dependencies is the **ncurses library**. If you have installed ncurses in your Linux box then installation of cv will be a breeze.

Compiling and installation can be done in two easy steps.

    $ make
    $ sudo make install

### Running cv ###

To run cv, just type it on the command line as other programs. If you did not make install and chose to run it from the current directory run the command as follows:

    $ ./cv

Otherwise run the command as follows.

    $ cv

If there are no coreutils commands running then the cv program will exit and tell you, no coreutils program is running.

![cv no command](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-no-command.png)

To effectively use the program have one of the coreutils programs running on your system. In this case we shall use the command **cp**.

When copying a large file you can see the progress, shown as a percentage

![cv default](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-default.png)

### Adding Options To cv ###

You can also add several option to the cv command just like other commands. One useful option is having to know the estimated time remaining for a copying operation or a move operation particularly for large files.
Adding the **-w** option will just do exactly that.

    $ cv -w

![cv estimated throughput](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-estimated-throughput.png)

Try adding more command options. Adding other options like this:

    $ cv -wq

### cv And watch Command ###

watch is a program used to run a program periodically and then show the output. Sometimes you might want to see the commands as they are running without storing the data in a log file. In this case watch comes in handy to use with cv.

    $ watch cv -qw

This command will show any running instances of coreutils commands. It will also show the progress and the ETA.

![cv and watch](http://blog.linoxide.com/wp-content/uploads/2014/11/cv-and-watch-e1416519384265.png)

### View Output In A Log File ###

As promised, with cv you can redirect its output to a log file. This is particularly useful when the command runs too fast to see anything meaningful.

To see the progress in a log file you can simply redirect the output as in the command below.

    $ cv -w >> log.txt

To see the output of this command open the log file with your favourite text editor or with the cat command as follows:

    $ cat log.txt

### Getting Help ###

If you get stuck anywhere you can always refer to the man page or the help option.
To get help use cv command with the **-h** option.

    $ cv -h

If you need more detailed information then the man page would be a great place to visit.

    $ man cv

However, to get the man page with the above command, ensure that you make install cv.

Yay! Now you have another great tool in your Linux toolbox.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/tool-show-command-progress/

作者：[Allan Mbugua][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/allan/
[1]:http://github.com/Xfennec/cv