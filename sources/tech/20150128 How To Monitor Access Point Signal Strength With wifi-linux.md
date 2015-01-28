How To Monitor Access Point Signal Strength With wifi-linux
================================================================================
As a python geek I love exploring new python tools on github that target the linux users. Today I discovered a simple application written in python programming language that can be used to monitor access point signal strength.

I have been experimenting for about two hours with **wifi-linux** and it works great but I would like to see some unittests in the near future from the author as the command **plot** is not working on my machine and is also causing some errors.

### What is wifi-linux ###

According to the official readme.md file on author's github account wifi-linux is a very simple python script which collects RSSI information about wifi access points around you and draws graphics showing RSSI activity.

The author states that the program also draws RSSI activity graphic and this can be generated with the command plot but unfortunetly it is not working for me. wifi-linux supports other commands such as **bp** to add a breakpoint, **print** to print some statistics and **start changer**.

The wifi-linux application has the folowing dependencies:

- dbus-python
- gnuplot-py

So first we have to install all the package dependencies for our project in order to run it in our linux machine.

### Install pakages required by wifi-linux ###

I tried to install python-dbus by using the pip tool which is used to manage python packages but it did not work and the reason for this is that pip looks for setup.py, which dbus-python doesn't have. So the following command is not going to work.

    pip install dbus-python

And to make sure it does not work give it a try. It is a very high probability that you will get the following error displayed on your console.

    IOError: [Errno 2] No such file or directory: '/tmp/pip_build_oltjano/dbus-python/setup.py'

How did I manage to solve this problem? It is very simple. I installed the the system package for the Python DBUS bindings using the following command.

    sudo apt-get install python-dbus

The above command will work only in machines that make use of the apt-get package manager such as Debian and Ubuntu.

Then the second dependency we have to take care is the gnuplot-py. Download it, extract using the tar utility and then run setup.py install to install the python package.

First step is to download gnuplot-py.

    wget http://prdownloads.sourceforge.net/gnuplot-py/gnuplot-py-1.8.tar.gz

Then use the tar utility to extract it.

    tar xvf gnuplot-py-1.8.tar.gz

Then use the cd command to change directory.

    cd gnuplot-py-1.8

Once there then run the following command to install the package gunplot-py on your system.

    sudo setup.py install

Once the installation is finished you are ready to run the wifi-linux on your machine. Just download it and use the following command to run the script.

Download wifi-linux on your local machine by using the following command.

    wget https://github.com/dixel/wifi-linux/archive/master.zip

Extract the master.zip archive and then use the following command to run the python script list_rsssi.py

    python list_rssi.py

The following screenshot shows wifi-linux in action.

![wifi-linux to monitor wifi signal strength](http://blog.linoxide.com/wp-content/uploads/2015/01/wifi-linux.png)

Then the command **bp** is executed to add a breakpoint like shown below.

![the bp command in wifi-linux](http://blog.linoxide.com/wp-content/uploads/2015/01/wifi-linux2.png)

The command **print** can be used to display stats on the console of your machine. An example of its usage is shown below.

![the print command](http://blog.linoxide.com/wp-content/uploads/2015/01/wifi-linux3.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/monitor-access-point-signal-strength-wifi-linux/

作者：[Oltjano Terpollari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/