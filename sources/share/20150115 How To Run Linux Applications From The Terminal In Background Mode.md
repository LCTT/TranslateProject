How To Run Linux Programs From The Terminal In Background Mode
========================================================================

![Linux Terminal Window.](http://f.tqn.com/y/linux/1/W/r/G/1/terminal.JPG)

This is a short but useful guide to show how to run Linux applications from the terminal whilst allowing the terminal to retain control.

There are various ways of opening a terminal window in Linux and it largely depends on your choice of distribution and the desktop environment.

Using Ubuntu you can open a terminal by using the CTRL + ALT + T key combination. You can also open a terminal window by pressing the super key (Windows Key), on the keyboard, to [bring up the Dash][1] and search for "TERM". Clicking on the "Term" icon will open a terminal window.

For other desktop environments such as XFCE, KDE, LXDE, Cinnamon and MATE you will find the terminal within the menu. Some distributions will have a terminal icon in a dock or as a launcher on a panel.

You can generally start an application from the terminal by simply entering the name of the program. For instance you can start Firefox by typing "firefox".

The benefit of running an application from the terminal is that you can include additional options.

For instance if you type the following a new Firefox browser window will open and the default search engine will be used to search for the term between quotes:

	firefox -search "Linux.About.Com"

You will notice that if you run Firefox, the application will open and the control will be returned to the terminal which means you can continue working within the terminal.

Generally if you run an application from within the terminal, the application will open and you won't regain control of the terminal until the application is closed. This is because you opened the program in the foreground.

To be able to open a program in the Linux terminal and return control to the terminal you need to open the application as a background process,

In order to open a program as a background process simply add the ampersand (&) symbol to the command as shown below:

	libreoffice &

An application might not run just by providing the program's name in the terminal. If the program doesn't reside in one of the folders set within the PATH variable then you will need to specify the whole path name in order to run the program.

	/path/to/yourprogram &

If you aren't sure where a program resides within the Linux folder structure use the [find][2] or [locate][3] command to find the application.

The syntax for finding a file is as follows:

	find /path/to/start/from -name programname

For instance if you wanted to find the location of Firefox use the following command:

	find / -name firefox

The output will whizz past quite quickly and so you will want to pipe the output to either [less][4] or [more][5] as follows:

	find / -name firefox | more

	find / -name firefox | less

The find command will return a number of permission denied errors for folders that you don't have permissions to search.

You can alway provide the [sudo command to elevate your permissions][6]. If sudo isn't installed you will need to switch to a user that has permissions.

	sudo find / -name firefox | more

If you know that the file you are looking for is within the folder structure in which you are currently located then you can replace the forward slash with a period as follows:

	sudo find . -name firefox | more

You may or may not need the elevated permissions provided by sudo. If you are looking for something within your home folder structure then it won't be required.

Some applications require elevated permissions to run and you may get a lack of permissions error unless you use either a user with adequate permissions or elevate those permissions using sudo.

Here is a neat trick. If you run an application and it requires elevated permissions to run, type the following:

	sudo !!


via : http://linux.about.com/od/commands/fl/How-To-Run-Linux-Programs-From-The-Terminal-In-Background-Mode.htm

作者：[Gary Newell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://linux.about.com/od/howtos/fl/Learn-Ubuntu-The-Unity-Dash.htm
[2]:http://linux.about.com/od/commands/l/blcmdl1_find.htm
[3]:http://linux.about.com/od/commands/l/blcmdl1_locate.htm
[4]:http://linux.about.com/library/cmd/blcmdl1_less.htm
[5]:http://linux.about.com/library/cmd/blcmdl1_more.htm
[6]:http://linux.about.com/od/commands/l/blcmdl8_sudo.htm