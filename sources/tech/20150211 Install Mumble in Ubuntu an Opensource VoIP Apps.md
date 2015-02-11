Install Mumble in Ubuntu an Opensource VoIP Apps
================================================================================
Mumble is a free and open source voice over IP (VoIP) application, released under the new BSD license, primarily designed for use by gamers and it's similar to programs such as TeamSpeak and Ventrilo. It uses a server to witch people can connect with a client to talk to each other.

It offers the following great features:

- low latency, very important for gaming
- offers in-game overlay so you can see who is talking and positional audio to hear the players from where they are located
- has encrypted communications so you can stay private and secure
- it also offers a few nice configuration interface that are easy to use
- very stable and good on resource usage for your server

### Install Mumble ###

[Mumble][1] has become very popular and is now present in the software repositories of the major Linux distributions and this makes it easy to install and setup. In Ubuntu you can use the command line to install it with apt-get by running the following command:

    $ sudo apt-get install mumble-server

![mumble install](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-install.jpg)

This will install the server (also called Murmur) on your server.

### Configuring Mumble ###

To setup Mumble you will need to run the following command:

$ sudo dpkg-reconfigure mumble-server

The following questions will pop-up:

![mumble q1](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-q1.jpg)

Pick Yes to have mumble start when your server boots, next it will ask if you wish to run it in a high-priority mode that will ensure lower latency, it's a good idea to have it run it like that for the best performance:

![mumble q2](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-q2.jpg)

It will then require you to introduce a password for the administrator user of the new mumble server, you will need to remember this password for when you will log-in.

![mumble q3](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-q3.jpg)

### Installing Mumble Client ###

The client can be installed on most major platforms like Windows, Mac OS X and Linux. We will cover the installation and configuration on Ubuntu Linux, to install it you can use the Software Center or run the following command:

    $ sudo apt-get install mumble

When you first run Mumble it will present you with a wizard to help you configure your audio input and output to make the best of the client. It will first ask you what sound device and microphone to use:

![mumble client 1](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-client-1.jpg)

Then it will help you calibrate the devices:

![mumble client 2](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-client-2.jpg)

And since mumble encrypts all the communication it will ask you to also create a certificate:

![mumble client 3](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-client-3.jpg)

After you finish with the wizard you can add your first server and connect to it the dialog will look like this:

![mumble add server](http://blog.linoxide.com/wp-content/uploads/2015/01/mumble-add-server.jpg)

First enter a label, this can be anything you wish to remember the server by, next add the address and port of the server, and finally use "SuperUser" as user and the password you used when you configured the mumble server.

You can now connect to the server and enjoy all of the features while you play online or talk to your friends or partners.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-mumble-ubuntu/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://wiki.mumble.info/wiki/Main_Page