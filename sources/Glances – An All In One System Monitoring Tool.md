Vito

Glances – An All In One System Monitoring Tool
================================================================================
There are very few command line tools that aim to provide a user with maximum possible information irrespective of the terminal size. Most of the utilities respond in similar manner — Either the display of information gets messed up or tool gives an error. But, one such tool that displays a lot of system/network monitoring related information from a 80X24 terminal to any bigger size terminal is **Glances**.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-main.png)

**NOTE** – All the examples presented in this article are tested on bash shell in Ubuntu 13.04.

**A Brief Tutorial**

Glances is a system monitoring tool that is capable of producing a variety of system related information on your terminal. Some of information includes :

- CPU related information
- Disk IO related information
- Memory related information
- Mount points related information
- Network interface related information
- Processes related information
- etc.

Here is an example snapshot of glances :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-1-1024x654.png)

It is written in python and utilizes [psutils][1] library to fetch all the system related information it displays. Glances is very flexible in terms of the display i.e., it tries to display maximum information on terminal of size as small as 80X24.

Here is a snapshot of glances on a smaller terminal:

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-small-terminal.png)

So you can see that it displayed some information even on a smaller terminal.

You can not only use Glances for local system monitoring but it can also be used for monitoring of remote system. To use glances on remote system, run the following command :

    glances -s

and at the client side, execute :

    glances -c [ip-address-of-server]

Here are some important points that user should keep in mind while using glances in client/server mode [Taken from official glances documentation] :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-other-info.png)

Besides, there are several command line options available for customizing information like :

- Use -m to disable mount related information
- Use -n to disable network related information
- Use -P to define password while running in client/server mode.
- Use -t to set the screen refresh time interval
- etc

Go through the [man page][2] to explore and find more such options.

Besides command line options, glances provides many help options that you can use while glances is running. Here is a list of these options :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-help.png)

So you can see that glances is not only flexible in display but is also highly customizable.

**Download/Install**

Here are some important links related to glances tool :

- [Home Page][3]
- [Download Page][4]
- [Documentation][5]

You can download and install Glances from source but that would require python-dev module to be pre-installed. Ubuntu users can directly download and install through Ubuntu Software Centre.  The version used for this review is 1.7.1 with PsUtil 0.6.1.

**Pros**

- Provides a lot of system related information under one roof
- Flexible display

**Cons**

- Smaller display must include some indication that more information could be displayed.
- Build from source depends on additional libraries like python-dev.

**Conclusion**

Glances is a tool that can be used by system administrators to quickly get an overview of complete system. It’s a good tool to have in your kitty that can come in handy while debugging some system related problems. The flexibility in display is always an add on.

Have you ever used Glances or a similar tool? What was your experience? Share your story.


via: http://mylinuxbook.com/glances-an-all-in-one-system-monitoring-tool/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://code.google.com/p/psutil/
[2]:http://linux.die.net/man/1/glances
[3]:http://nicolargo.github.io/glances/
[4]:http://nicolargo.github.io/glances/
[5]:https://github.com/nicolargo/glances/blob/master/docs/glances-doc.rst#introduction