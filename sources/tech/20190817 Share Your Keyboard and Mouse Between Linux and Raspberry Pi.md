[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Share Your Keyboard and Mouse Between Linux and Raspberry Pi)
[#]: via: (https://itsfoss.com/keyboard-mouse-sharing-between-computers/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Share Your Keyboard and Mouse Between Linux and Raspberry Pi
======

_**This DIY tutorial teaches you to share mouse and keyboard between multiple computers using open source software Barrier.**_

I have a multi-monitor setup where my [Dell XPS running Ubuntu][1] is connected to two external monitors. I recently got a [Raspberry Pi 4][2] that has the capability to double up as a desktop. I bought a new screen so that I could set it up for monitoring the performance of my cloud servers.

Now the problem is that I have fours screens and one pair of keyboard and mouse. I could use a new keyboard-mouse pair but my desk doesn’t have enough free space and it’s not very convenient to switch keyboards and mouse all the time.

One way to tackle this problem would be to buy a kvm switch. This is a handy gadget that allows you to use same display screen, keyboard and mouse between several computers running various operating systems. You can easily find one for around $30 on Amazon.

Bestseller No. 1

[][3]

[UGREEN USB Switch Selector 2 Computers Sharing 4 USB Devices USB 2.0 Peripheral Switcher Box Hub for Mouse, Keyboard, Scanner, Printer, PCs with One-Button Swapping and 2 Pack USB A to A Cable][3]

Ugreen Group Limited - Electronics

$18.99 [][4]

But I didn’t go for the hardware solution. I opted for a software based approach to share the keyboard and mouse between computers.

I used [Barrier][5], an open source fork of the now proprietary software [Synergy][6]. Synergy Core is still open source but you can’t get encryption option in its GUI. With all its limitation, Barrier works fine for me.

Let’s see how you can use Barrier to share mouse and keyboard with multiple computers. Did I mention that you can even share clipboard and thus copy paste text between the computers?

### Set up Barrier to share keyboard and mouse between Linux and Raspberry Pi or other devices

![][7]

I have prepared this tutorial with Ubuntu 18.04.3 and Raspbian 10. Some installation instructions may differ based on your distribution and version but you’ll get the idea of what you need to do here.

#### Step 1: Install Barrier

The first step is obvious. You need to install Barrier in your computer.

Barrier is available in the universe repository starting Ubuntu 19.04 so you can easily install it using apt command.

You’ll have to use the snap version of Barrier in Ubuntu 18.04. Open Software Center and search for Barrier. I recommend using barrier-maxiberta

![Install this Barrier version][8]

On other distributions, you should [enable Snap][9] first and then use this command:

```
sudo snap install barrier-maxiberta
```

Barrier is available in Debian 10 repositories. So installing barrier on Raspbian was easy with the [apt command][10]:

```
sudo apt install barrier
```

Once you have installed the software, it’s time to configure it.

[][11]

Suggested read  Fix Application Installation Issues In elementary OS

#### Step 2: Configure Barrier server

Barrier works on server-client model. You should configure your main computer as server and the secondary computer as client.

In my case, my Ubuntu 18.04 is my main system so I set it up as the server. Search for Barrier in menu and start it.

![Setup Barrier as server][12]

You should see an IP address and an SSL fingerprint. It’s not entirely done because you have to configure the server a little. Click on Configure Server option.

![Configure the Barrier server][13]

In here, you should see your own system in the center. Now you have to drag and drop the computer icon from the top right to a suitable position. The position is important because that’s how your mouse pointer will move between screens.

![Setup Barrier server with client screens][14]

Do note that you should provide the [hostname][15] of the client computer. In my case, it was raspberrypi. It won’t work if the hostname is not correct. Don’t know the client’s hostname? Don’t worry, you can get it from the client system.

#### Step 3: Setup barrier client

On the second computer, start Barrier and choose to use it as client.

![Setup Barrier Client on Raspberry Pi][16]

You need to provide the IP address of Barrier server. You can find this IP address on the Barrier application running on the main system (see the screenshots in previous section).

![Setup Barrier Client on Raspberry Pi][17]

If you see an option to accept secure connection from another computer, accept it.

You should be now able to move your mouse pointer between the screens connected to two different computers running two different operating systems. How cool is that!

### Optional: Autostart Barrier [Intermediate to Advanced Users]

Now that you have setup Barrier and enjoying by using the same mouse and keyboard for more than one computers, what happens when you reboot your system? You need to start Barrier in both the systems again, right? This means that you need to connect keyboard-mouse to the second computer as well.

[][18]

Suggested read  How To Fix Windows Updates Stuck At 0%

Since I use Wireless mouse and keyboard, this is still easier as all I need to do is to take the adapter from my laptop and plug it in the Raspberry Pi. This works but I don’t want to do this extra step. This is why I made Barrier running at the start on both systems so that I could use the same mouse and keyboard without any additional step.

There is no autostart option in the Barrier application. But it’s easy to [add an application to autostart in Ubuntu][19]. Just open the Startup Applications program and add the command _**barrier-maxiberta.barrier**_ here.

![Adding Barrier To Startup applications in Ubuntu][20]

That was the easy part. It’s not the same in Raspberry Pi though. Since Raspbian uses systemd, you can use it to create a new service that will run at the boot time.

Open a terminal and create a new file named barrier.service in /etc/systemd/system directory. If this directory doesn’t exist, create it. You can use your favorite command line text editor for this task. I used Vim here.

```
sudo vim /etc/systemd/system/barrier.service
```

Now add lines like these to your file. _**You must replace 192.168.0.109 with your barrier server’s IP address.**_

```
[Unit]
Description=Barrier Client mouse/keyboard share
Requires=display-manager.service
After=display-manager.service
StartLimitIntervalSec=0

[Service]
Type=forking
ExecStart=/usr/bin/barrierc --no-restart --name raspberrypi --enable-crypto 192.168.0.109
Restart=always
RestartSec=10
User=pi

[Install]
WantedBy=multi-user.target
```

Save your file. I would advise to run the command mentioned in ExecStart line manually to see if it works or not. This will save you some headache later.

Reload the systemd daemon:

```
sudo systemctl daemon-reload
```

Now start this new service

```
systemctl start barrier.service
```

Check its status to see if its running fine:

```
systemctl status barrier.service
```

If it works, add it to startup services:

```
systemctl enable barrier.service
```

This should take care of things for you. Now you should be able to control the Raspberry Pi (or any other second computer) with a single keyboard mouse pair.

I know that these DIY stuff may not work straightforward for everyone so if you face issues, let me know in the comments and I’ll try to help you out.

If it worked for you or if you use some other solution to share the mouse and keyboard between the computers, do mention it in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/keyboard-mouse-sharing-between-computers/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[2]: https://itsfoss.com/raspberry-pi-4/
[3]: https://www.amazon.com/UGREEN-Selector-Computers-Peripheral-One-Button/dp/B01MXXQKGM?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B01MXXQKGM&keywords=kvm%20switch (UGREEN USB Switch Selector 2 Computers Sharing 4 USB Devices USB 2.0 Peripheral Switcher Box Hub for Mouse, Keyboard, Scanner, Printer, PCs with One-Button Swapping and 2 Pack USB A to A Cable)
[4]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[5]: https://github.com/debauchee/barrier
[6]: https://symless.com/synergy
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/Share-Keyboard-and-Mouse.jpg?resize=800%2C450&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/barrier-ubuntu-snap.jpg?ssl=1
[9]: https://itsfoss.com/install-snap-linux/
[10]: https://itsfoss.com/apt-command-guide/
[11]: https://itsfoss.com/fix-application-installation-issues-elementary-os-loki/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/barrier-2.jpg?resize=800%2C512&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/barrier-server-ubuntu.png?resize=800%2C450&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/barrier-server-configuration.png?ssl=1
[15]: https://itsfoss.com/change-hostname-ubuntu/
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/setup-barrier-client.jpg?resize=800%2C400&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/setup-barrier-client-2.jpg?resize=800%2C400&ssl=1
[18]: https://itsfoss.com/fix-windows-updates-stuck-0/
[19]: https://itsfoss.com/manage-startup-applications-ubuntu/
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/adding-barrier-to-startup-apps-ubuntu.jpg?ssl=1
