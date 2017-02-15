Basic screen command usage and examples
============================================================


 ![linux screen command usage and examples](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/linux-screen-usage-examples.jpg) 

Screen is a very useful command that offers the ability to use multiple shell windows (sessions) from a single SSH session. When the session is detached or there is a network disruption, the process that is started in a screen session will still run and you can re-attach to the screen session at any time. This also comes in handy if you want to run a long process persistently or connect to shell sessions from multiple locations.

In this article, we will show the basics of installing and using screen on a Linux VPS.

### How to install screen

Screen comes preinstalled on some of the popular distributions. You can check if it is installed on your server using the following command

```
screen -v
Screen version 4.00.03 (FAU)
```

If you do not have screen to the VPS, you can easily install it using the package manager provided by the OS.

### [CentOS][4]/RedHat/Fedora

```
yum -y install screen
```

### [Ubuntu][5]/[Debian][6]

```
apt-get -y install screen
```

### How to start a screen session

You can start screen by typing ‘screen’ at the command prompt and a new screen session will be started which looks the same as the command prompt

```
screen
```

It is a good practice to start screen sessions with descriptive names so you can easily remember which process is running in the session. To create a new session with a session name run the following command

```
screen -S name
```

and replace ‘name’ with a meaningful name for your session.

### Detach from screen session

To detach from the current screen session you can press ‘Ctrl-A‘ and ‘d‘ on your keyboard. All screen sessions will still be active and you can re-attach to them at any time later.

### Reattach to screen session

If you have detached from a session or your connection is interrupted for some reason, you can easily re-attach by executing the following command:

```
screen -r
```

If you have multiple screen sessions you can list them with ‘ls’

```
screen -ls

There are screens on:
7880.session    (Detached)
7934.session2   (Detached)
7907.session1   (Detached)
3 Sockets in /var/run/screen/S-root.
```

In our example, we have three active screen sessions. So, if you want to restore the session ‘session2’ you can execute

```
screen -r 7934
```

or you can use the screen name

```
screen -r -S session2
```

### Terminate screen session

There are several ways to terminate the screen session. You can do it by pressing ‘Ctrl‘ + ‘d‘ on your keyboard or use the ‘exit’ command line command.

To see all useful features of the screen command you can check screen’s man page.

```
man screen

NAME
screen - screen manager with VT100/ANSI terminal emulation

SYNOPSIS
screen [ -options ] [ cmd [ args ] ]
screen -r [[pid.]tty[.host]]
screen -r sessionowner/[[pid.]tty[.host]]
```

* * *

Of course, you don’t have to do any of this if you use one of our [Linux VPS hosting][9] services, in which case you can simply ask our expert Linux admins to do this for you. They are available 24×7 and will take care of your request immediately.

PS. If you liked this post please share it with your friends on the social networks using the buttons below or simply leave a comment in the comment section. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/

作者：[rosehosting.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/
[1]:https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/
[2]:https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/#comments
[3]:https://www.rosehosting.com/blog/category/tips-and-tricks/
[4]:https://www.rosehosting.com/centos-vps.html
[5]:https://www.rosehosting.com/ubuntu-vps.html
[6]:https://www.rosehosting.com/debian-vps.html
[7]:https://plus.google.com/share?url=https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/
[8]:http://www.linkedin.com/shareArticle?mini=true&url=https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/&title=Basic%20screen%20command%20usage%20and%20examples&summary=Screen%20is%20a%20very%20useful%20command%20that%20offers%20the%20ability%20to%20use%20multiple%20shell%20windows%20(sessions)%20from%20a%20single%20SSH%20session.%20When%20the%20session%20is%20detached%20or%20there%20is%20a%20network%20disruption,%20the%20process%20that%20is%20started%20in%20a%20screen%20session%20will%20still%20run%20and%20you%20can%20re-attach%20to%20the%20...
[9]:https://www.rosehosting.com/linux-vps-hosting.html
