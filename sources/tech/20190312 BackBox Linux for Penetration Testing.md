[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (BackBox Linux for Penetration Testing)
[#]: via: (https://www.linux.com/blog/learn/2019/3/backbox-linux-penetration-testing)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)

BackBox Linux for Penetration Testing
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/security-2688911_1920.jpg?itok=yZ9TjAXu)

Any given task can succeed or fail depending upon the tools at hand. For security engineers in particular, building just the right toolkit can make life exponentially easier. Luckily, with open source, you have a wide range of applications and environments at your disposal, ranging from simple commands to complicated and integrated tools.

The problem with the piecemeal approach, however, is that you might wind up missing out on something that can make or break a job… or you waste a lot of time hunting down the right tools for the job. To that end, it’s always good to consider an operating system geared specifically for penetration testing (aka pentesting).

Within the world of open source, the most popular pentesting distribution is [Kali Linux][1]. It is, however, not the only tool in the shop. In fact, there’s another flavor of Linux, aimed specifically at pentesting, called [BackBox][2]. BackBox is based on Ubuntu Linux, which also means you have easy access to a host of other outstanding applications besides those that are included, out of the box.

### What Makes BackBox Special?

BackBox includes a suite of ethical hacking tools, geared specifically toward pentesting. These testing tools include the likes of:

  * Web application analysis

  * Exploitation testing

  * Network analysis

  * Stress testing

  * Privilege escalation

  * Vulnerability assessment

  * Computer forensic analysis and exploitation

  * And much more




Out of the box, one of the most significant differences between Kali Linux and BackBox is the number of installed tools. Whereas Kali Linux ships with hundreds of tools pre-installed, BackBox significantly limits that number to around 70. Nonetheless, BackBox includes many of the tools necessary to get the job done, such as:

  * Ettercap

  * Msfconsole

  * Wireshark

  * ZAP

  * Zenmap

  * BeEF Browser Exploitation

  * Sqlmap

  * Driftnet

  * Tcpdump

  * Cryptcat

  * Weevely

  * Siege

  * Autopsy




BackBox is in active development, the latest version (5.3) was released February 18, 2019. But how is BackBox as a usable tool? Let’s install and find out.

### Installation

If you’ve installed one Linux distribution, you’ve installed them all … with only slight variation. BackBox is pretty much the same as any other installation. [Download the ISO][3], burn the ISO onto a USB drive, boot from the USB drive, and click the Install icon.

The installer (Figure 1) will be instantly familiar to anyone who has installed a Ubuntu or Debian derivative. Just because BackBox is a distribution geared specifically toward security administrators, doesn’t mean the operating system is a challenge to get up and running. In fact, BackBox is a point-and-click affair that anyone, regardless of skills, can install.

![installation][5]

Figure 1: The installation of BackBox will be immediately familiar to anyone.

[Used with permission][6]

The trickiest section of the installation is the Installation Type. As you can see (Figure 2), even this step is quite simple.

![BackBox][8]

Figure 2: Selecting the type of installation for BackBox.

[Used with permission][6]

Once you’ve installed BackBox, reboot the system, remove the USB drive, and wait for it to land on the login screen. Log into the desktop and you’re ready to go (Figure 3).

![desktop][10]

Figure 3: The BackBox Linux desktop, running as a VirtualBox virtual machine.

[Used with permission][6]

### Using BackBox

Thanks to the [Xfce desktop environment][11], BackBox is easy enough for a Linux newbie to navigate. Click on the menu button in the top left corner to reveal the menu (Figure 4).

![desktop menu][13]

Figure 4: The BackBox desktop menu in action.

[Used with permission][6]

From the desktop menu, click on any one of the favorites (in the left pane) or click on a category to reveal the related tools (Figure 5).

![Auditing][15]

Figure 5: The Auditing category in the BackBox menu.

[Used with permission][6]

The menu entries you’ll most likely be interested in are:

  * Anonymous - allows you to start an anonymous networking session.

  * Auditing - the majority of the pentesting tools are found in here.

  * Services - allows you to start/stop services such as Apache, Bluetooth, Logkeys, Networking, Polipo, SSH, and Tor.




Before you run any of the testing tools, I would recommend you first making sure to update and upgrade BackBox. This can be done via a GUI or the command line. If you opt to go the GUI route, click on the desktop menu, click System, and click Software Updater. When the updater completes its check for updates, it will prompt you if any are available, or if (after an upgrade) a reboot is necessary (Figure 6).

![reboot][17]

Figure 6: Time to reboot after an upgrade.

[Used with permission][6]

Should you opt to go the manual route, open a terminal window and issue the following two commands:

```
sudo apt-get update

sudo apt-get upgrade -y
```

Many of the BackBox pentesting tools do require a solid understanding of how each tool works, so before you attempt to use any given tool, make sure you know how to use said tool. Some tools (such as Metasploit) are made a bit easier to work with, thanks to BackBox. To run Metasploit, click on the desktop menu button and click msfconsole from the favorites (left pane). When the tool opens for the first time, you’ll be asked to configure a few options. Simply select each default given by clicking your keyboard Enter key when prompted. Once you see the Metasploit prompt, you can run commands like:

```
db_nmap 192.168.0/24
```

The above command will list out all discovered ports on a 192.168.1.x network scheme (Figure 7).

![Metasploit][19]

Figure 7: Open port discovery made simple with Metasploit on BackBox.

[Used with permission][6]

Even often-challenging tools like Metasploit are made far easier than they are with other distributions (partially because you don’t have to bother with installing the tools). That alone is worth the price of entry for BackBox (which is, of course, free).

### The Conclusion

Although BackBox usage may not be as widespread as Kali Linux, it still deserves your attention. For anyone looking to do pentesting on their various environments, BackBox makes the task far easier than so many other operating systems. Give this Linux distribution a go and see if it doesn’t aid you in your journey to security nirvana.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/3/backbox-linux-penetration-testing

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://linux.backbox.org/
[3]: https://www.backbox.org/download/
[4]: /files/images/backbox1jpg
[5]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/backbox_1.jpg?itok=pn4fQVp7 (installation)
[6]: /licenses/category/used-permission
[7]: /files/images/backbox2jpg
[8]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/backbox_2.jpg?itok=tf-1zo8Z (BackBox)
[9]: /files/images/backbox3jpg
[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/backbox_3.jpg?itok=GLowoAUb (desktop)
[11]: https://www.xfce.org/
[12]: /files/images/backbox4jpg
[13]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/backbox_4.jpg?itok=VmQXtuZL (desktop menu)
[14]: /files/images/backbox5jpg
[15]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/backbox_5.jpg?itok=UnfM_OxG (Auditing)
[16]: /files/images/backbox6jpg
[17]: https://www.linux.com/sites/lcom/files/styles/floated_images/public/backbox_6.jpg?itok=2t1BiKPn (reboot)
[18]: /files/images/backbox7jpg
[19]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/backbox_7.jpg?itok=Vw_GEub3 (Metasploit)
