Translating-----geekpi

tespeed - Python Tool To Test Your Internet Speed
================================================================================
Many computer nerds know how to test their internet speed by using the **speedtest.net** but the thing is that it does not give you full control of the operationg going on during the measurement of your speed. Linux users love to type commands on their terminal emualator and do stuff, at least me.

The tespeed tool is a python tool with many features that helps to test network speed from the terminal. According to the documentation it makes use of nearest speedtest.net server but the users can also manually specify one.

In the beginning the author wrote the tespeed tool in the php programming language and proved to the ISP he was working for at that time that the internet they served was far from what they advertised. But things were not working all the time as they supposed to be so the author ported his php scripts to python and his tool counts 180 stars on github.

It means **alot**.

### How to use tespeed on linux ###

Before running a python application on your machine you have to make sure that the system you are working meets the dependencies required by the tool. The python tool tespeed dependes on the two following python packages:

- lxml
- SocksiPy

You can easily install lxml with the help of the pip python package management system and to do that run the following command.

    pip install lxml

Now we have to perform a simple trick to make use of the SocksiPy which you can download by using the the following command like shown below.

    wget http://sourceforge.net/projects/socksipy/files/socksipy/SocksiPy%201.00/SocksiPy.zip/

Once the installation is finished unzip **SocksiPy.zip** and run the following command to clone tespeed repo on your local machine.

    git clone https://github.com/Janhouse/tespeed.git

Then place the SocksiPy folder inside the tespeed project you cloned. Now we have to create an empety file inside the SocksiPy folder under the name of **__init__.py** like shown in the following screenshot.

![simple trick to make tespeed work](http://blog.linoxide.com/wp-content/uploads/2015/01/tespeed1.png)

Now that we have fixed the dependencies for out projet we can easily run it by using the following command.

    python tespeed.py

Then some magic is going to happen. The application is going to test your download and upload speed and display them in your console using some really nice colors.

![testing download and upload speed with tespeed python application](http://blog.linoxide.com/wp-content/uploads/2015/01/tespeed2.png)

There are many commands available in tespeed such as the option **-ls** to list the servers, option **-p** to specify and use a proxy server, the option **-s** to suppress debugging (STDERR) output and many others that we will explore in this tutorial.

For example if you want to display results in mebibits you need to use the command **python tespeed.py** followed by the option **-mib**

    python tespeed.py -mib

You can easily see how the unit used for measurement of the internet speed changed after using the tespeed app with the option -mib.

![testing internet speed with tespeed python application](http://blog.linoxide.com/wp-content/uploads/2015/01/tespeed3.png)

A very nice useful option I like to use while working with tespeed is the option -w which can be used to print CSV formated output to STDOUT.

    python tespeed.py -w

Use the following command to list the servers.

    python tespeed -ls

After running the above command you will get a list of servers used to test your upload and download speed. My list is really long so I am not going to share it in this tutorial.

### Conclusion ###

tespeed is a really easy to use high performance python script that helps computer users to test their upload and download speed by typing commands on their terminal. It supports many options and also you can specify the list of servers you would like to use. Keep playing with tespeed and please share your experience with us in the comment section.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/tespeed-python-tool-test-internet-speed/

作者：[Oltjano Terpollari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/