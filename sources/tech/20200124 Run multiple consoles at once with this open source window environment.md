[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run multiple consoles at once with this open source window environment)
[#]: via: (https://opensource.com/article/20/1/multiple-consoles-twin)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Run multiple consoles at once with this open source window environment
======
Simulate the old-school DESQview experience with twin in the fourteenth
in our series on 20 ways to be more productive with open source in 2020.
![Digital creative of a browser on the internet][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Overcome "one screen, one app" limits with twin

Who remembers [DESQview][2]? It allowed for things in DOS we take for granted now in Windows, Linux, and MacOS—namely the ability to run and have multiple programs running onscreen at once. In my early days running a dial-up BBS, DESQview was a necessity—it enabled me to have the BBS running in the background while doing other things in the foreground. For example, I could be working on new features or setting up new external programs while someone was dialed in without impacting their experience. Later, in my early days in support, I could have my work email ([DaVinci email on MHS][3]), the support ticket system, and other DOS programs running all at once. It was amazing!

![twin][4]

Running multiple console applications has come a long way since then. But applications like [tmux][5] and [Screen][6] still follow the "one screen, one app" kind of display. OK, yes, tmux has screen splitting and panes, but not like DESQview, with the ability to "float" windows over others, and I, for one, miss that.

Enter [twin][7], the text-mode window environment. This relatively young project is, in my opinion, a spiritual successor to DESQview. It supports console and graphical environments, as well as the ability to detach from and reattach to sessions. It's not as easy to set up as some things, but it will run on most modern operating systems.

Twin is installed from source (for now). But first, you need to install the required development libraries. The library names will vary by operating system. The following example shows it for my Ubuntu 19.10 installation. Once the libraries are installed, check out the twin source from Git and run **./configure** and **make**, which should auto-detect everything and build twin:


```
sudo apt install libx11-dev libxpm-dev libncurses-dev zlib1g-dev libgpm-dev
git clone [git@github.com][8]:cosmos72/twin.git
cd twin
./configure
make
sudo make install
```

Note: If you are compiling this on MacOS or BSD, you will need to comment out **#define socklen_t int** in the files **include/Tw/autoconf.h** and **include/twautoconf.h** before running **make**. This should be addressed by [twin issue number 57][9].

![twin text mode][10]

Invoking twin for the first time can be a bit of a challenge. You need to tell it what kind of display it is using with the **\--hw** parameter. For example, to launch a text-mode version of twin, you would enter **twin --hw=tty,TERM=linux**. The **TERM** variable specifies an override to the current terminal variable in your shell. To launch a graphical version, run **twin --hw=X@$DISPLAY**. On Linux, twin mostly "just works," and on MacOS, it mostly only works in terminals.

The _real_ fun comes with the ability to attach to running sessions with the **twattach** and **twdisplay** commands. They allow you to attach to a running twin session somewhere else. For example, on my Mac, I can run the following command to connect to the twin session running on my demo box:


```
`twdisplay --twin@20days2020.local:0 --hw=tty,TERM=linux`
```

![remote twin session][11]

With some extra work, you can also use it as a login shell in place of [getty][12] on consoles. This requires the gdm mouse daemon, the twdm application (included), and a little extra configuration. On systems that use systemd, start by installing and enabling gdm (if it isn't already installed). Then use systemctl to create an override for a console (I used tty6). The commands must be run as the root user; on Ubuntu, they look something like this:


```
apt install gdm
systemctl enable gdm
systemctl start gdm
systemctl edit getty@tty6
```

The **systemctl edit getty@tty6** command will open an empty file named **override.conf**. This defines systemd service settings to override the default for console 6. Update the contents to:


```
[service]
ExecStart=
ExecStart=-/usr/local/sbin/twdm --hw=tty@/dev/tty6,TERM=linux
StandardInput=tty
StandardOutput=tty
```

Now, reload systemd and restart tty6 to get a twin login prompt:


```
systemctl daemon-reload
systemctl restart getty@tty6
```

![twin][13]

This will launch a twin session for the user who logs in. I do not recommend this for a multi-user system, but it is pretty cool for a personal desktop. And, by using **twattach** and **twdisplay**, you can access that session from the local GUI or remote desktops.

I think twin is pretty darn cool. It has some rough edges, but the basic functionality is there, and it has some pretty good documentation. Also, it scratches the itch I have for a DESQview-like experience on modern operating systems. I look forward to improvements over time, and I hope you like it as much as I do.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/multiple-consoles-twin

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://en.wikipedia.org/wiki/DESQview
[3]: https://en.wikipedia.org/wiki/Message_Handling_System
[4]: https://opensource.com/sites/default/files/uploads/productivity_14-1.png (twin)
[5]: https://github.com/tmux/tmux/wiki
[6]: https://www.gnu.org/software/screen/
[7]: https://github.com/cosmos72/twin
[8]: mailto:git@github.com
[9]: https://github.com/cosmos72/twin/issues/57
[10]: https://opensource.com/sites/default/files/uploads/productivity_14-2.png (twin text mode)
[11]: https://opensource.com/sites/default/files/uploads/productivity_14-3.png (remote twin session)
[12]: https://en.wikipedia.org/wiki/Getty_(Unix)
[13]: https://opensource.com/sites/default/files/uploads/productivity_14-4.png (twin)
