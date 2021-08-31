[#]: subject: "Ubuntu Server vs Desktop: What’s the Difference?"
[#]: via: "https://itsfoss.com/ubuntu-server-vs-desktop/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Server vs Desktop: What’s the Difference?
======

When you click on the download button on the [Ubuntu website][1], it gives you a few options. Two of them are Ubuntu Desktop and Ubuntu Server.

This could confuse new users. Why are there two (actually 4 of them)? Which one should be downloaded? Ubuntu desktop or server? Are they the same? What is the difference?

![Ubuntu website gives you multiple options][2]

I am going to explain the difference between the desktop and server editions of Ubuntu. I’ll also explain which variant you should be using.

### Ubuntu desktop vs Ubuntu server

![Ubuntu desktop and server illustartion][3]

To understand the difference between Ubuntu desktop and server, you should understand the difference between a desktop and a server operating system.

#### Desktop

A desktop is referred to a personal computer. A desktop operating system comes with a graphical user interface so that the users can use their mouse and keyboard. The primary purpose of a desktop is to give you a system that can be used for web browsing, document editing, viewing/editing pictures and videos, coding and gaming. Basically, a general purpose computer for individuals, end users, or family members.

I am using the term desktop here, but this does not mean that it cannot be used on a laptop. Desktop is the generic term for a personal computer.

#### Server

On the other hand, a server operating system is specifically created for hosting web services like websites, apps, media servers, databases etc.

Usually, a server operating system does not come with a graphical interface. If it is Linux based operating system, you’ll have to use the system entirely via commands in terminal.

The advantage here is that the server OS do not need a lot of RAM and computational power because they do not use [graphical desktop environment][4]. Apart from that, the server operating system has packages configured differently as well.

Now that you understand the difference between server and desktop a little, let’s see the difference between Ubuntu server and desktop.

#### The user interface

The most visible difference between Ubuntu server and desktop is the user interface.

Ubuntu desktop features a graphical user interface with GNOME desktop environment. This makes it easier to use with the help of mouse clicks.

![User interface of Ubuntu GNOME edition][5]

Ubuntu server edition runs headless. You will only see a terminal interface when you are logged in to it. You’ll often manage it remotely from other computers overs SSH.

![Connecting to remote Ubuntu server via SSH][6]

#### Installation

[Installing Ubuntu as a desktop is easy][7] thanks to the graphical installer. You can create a live USB and experience the desktop version without installing. If you like it, you can install it in minutes following the on-screen instructions.

![Installing Ubuntu desktop via graphical installer][8]

Installing Ubuntu as a server is not as easy as the desktop edition. You are stuck with terminal interface. Even the simplest tasks like connecting to Wi-Fi could be a difficult task if you are not familiar with the procedure.

![Ubuntu server installation][9]

#### Applications

The default set of applications in Ubuntu desktop is focused on regular computer users. So, you’ll find web browsers, office suite, media players, games etc.

![Applications in Ubuntu][10]

Ubuntu server has applications that are more tailored for running web services. And that’s not it. Some applications are also configured differently. Take SSH for example. Ubuntu server has SSH preconfigured so that you can easily connect to it from remote systems. You have to explicitly enable SSH on Ubuntu desktop.

#### Hardware requirement

Since the desktop edition features a graphical user interface, you need at least 4 GB of RAM to run Ubuntu desktop. Disk space should be 20 GB at least.

This is where it gets interesting for Ubuntu server. It does not have a graphical interface. The command line interface does not consume a lot of system resources. As a result, you can easily run Ubuntu server on a machine with 512 MB and 5 GB of disk space.

The RAM and disk space on the server is subjected to the web service you run. If a web application requires at least 2 GB of RAM, you should have that much of RAM. But in the simplest of scenario, even 512 MB or 1 GB of RAM could work.

#### Usage

This is the main differentiator between Ubuntu desktop and server. Ask yourself, for what purpose you want to use Ubuntu?

If it is specifically for deploying web services, go for Ubuntu server. Keep in mind that you need to have basic Linux command line knowledge to navigate through the terminal.

If you want to use Ubuntu as a regular computer like Windows, go with Ubuntu desktop. If you want to use it for learning Linux commands, Docker or even simple (but local) LAMP server installation for learning, stay with Ubuntu desktop.

For a server, Ubuntu server is better than Ubuntu desktop. For regular computing usage, Ubuntu desktop is the better choice.

#### Should you use Ubuntu desktop for server or install GUI on server?

Here’s the thing. Both Ubuntu desktop and server are Linux. You can use Ubuntu desktop as server for hosting web services. That works.

Similarly, [you can install GUI on Ubuntu server][11] and use it graphically. That also works.

![GUI login on an Ubuntu server][12]

But just because it works, doesn’t mean you should do it. It defies the entire purpose of creating different editions for server and desktop.

You have to put extra effort in converting a server to desktop and vice versa. Why take that pain?

If your purpose of using Ubuntu is clear, download and install the appropriate Ubuntu edition.

_**I hope this makes things around Ubuntu desktop and server editions a bit more clear now. If you have questions or suggestions, please utilize the comment section.**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-server-vs-desktop/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://itsfoss.com/wp-content/uploads/2021/08/ubuntu-server-desktop-download-800x338.webp
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ubuntu-desktop-server.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop.png?resize=792%2C597&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/system-restart-required.png?resize=800%2C469&ssl=1
[7]: https://itsfoss.com/install-ubuntu/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/installing-ubuntu.png?resize=800%2C549&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ubuntu-server-installation.png?resize=800%2C600&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/gnome-app-arranger.jpg?resize=799%2C450&ssl=1
[11]: https://itsfoss.com/install-gui-ubuntu-server/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop-greet.png?resize=798%2C600&ssl=1
