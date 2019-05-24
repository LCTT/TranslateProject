Q4OS Makes Linux Easy for Everyone
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/q4os-main.png?itok=WDatcV-a)

Modern Linux distributions tend to target a variety of users. Some claim to offer a flavor of the open source platform that anyone can use. And, I’ve seen some such claims succeed with aplomb, while others fall flat. [Q4OS][1] is one of those odd distributions that doesn’t bother to make such a claim but pulls off the feat anyway.

So, who is the primary market for Q4OS? According to its website, the distribution is a:

“fast and powerful operating system based on the latest technologies while offering highly productive desktop environment. We focus on security, reliability, long-term stability and conservative integration of verified new features. System is distinguished by speed and very low hardware requirements, runs great on brand new machines as well as legacy computers. It is also very applicable for virtualization and cloud computing.”

What’s very interesting here is that the Q4OS developers offer commercial support for the desktop. Said support can cover the likes of system customization (including core level API programming) as well as user interface modifications.

Once you understand this (and have installed Q4OS), the target audience becomes quite obvious: Business users looking for a Windows XP/7 replacement. But that should not prevent home users from giving Q4OS at try. It’s a Linux distribution that has a few unique tools that come together to make a solid desktop distribution.

Let’s take a look at Q4OS and see if it’s a version of Linux that might work for you.

### What Q4OS all about

Q4OS that does an admirable job of being the open source equivalent of Windows XP/7. Out of the box, it pulls this off with the help of the [Trinity Desktop][2] (a fork of KDE). With a few tricks up its sleeve, Q4OS turns the Trinity Desktop into a remarkably similar desktop (Figure 1).

![default desktop][4]

Figure 1: The Q4OS default desktop.

[Used with permission][5]

When you fire up the desktop, you will be greeted by a Welcome screen that makes it very easy for new users to start setting up their desktop with just a few clicks. From this window, you can:

  * Run the Desktop Profiler (which allows you to select which desktop environment to use as well as between a full-featured desktop, a basic desktop, or a minimal desktop—Figure 2).

  * Install applications (which opens the Synaptic Package Manager).

  * Install proprietary codecs (which installs all the necessary media codecs for playing audio and video).

  * Turn on Desktop effects (if you want more eye candy, turn this on).

  * Switch to Kickoff start menu (switches from the default start menu to the newer kickoff menu).

  * Set Autologin (allows you to set login such that it won’t require your password upon boot).




![Desktop Profiler][7]

Figure 2: The Desktop Profiler allows you to further customize your desktop experience.

[Used with permission][5]

If you want to install a different desktop environment, open up the Desktop Profiler and then click the Desktop environments drop-down, in the upper left corner of the window. A new window will appear, where you can select your desktop of choice from the drop-down (Figure 3). Once back at the main Profiler Window, select which type of desktop profile you want, and then click Install.

![Desktop Profiler][9]

Figure 3: Installing a different desktop is quite simple from within the Desktop Profiler.

[Used with permission][5]

Note that installing a different desktop will not wipe the default desktop. Instead, it will allow you to select between the two desktops (at the login screen).

### Installed software

After selecting full-featured desktop, from the Desktop Profiler, I found the following user applications ready to go:

  * LibreOffice 5.2.7.2

  * VLC 2.2.7

  * Google Chrome 64.0.3282

  * Thunderbird 52.6.0 (Includes Lightning addon)

  * Synaptic 0.84.2

  * Konqueror 14.0.5

  * Firefox 52.6.0

  * Shotwell 0.24.5




Obviously some of those applications are well out of date. Since this distribution is based on Debian, we can run and update/upgrade with the commands:
```
sudo apt update

sudo apt upgrade

```

However, after running both commands, it seems everything is up to date. This particular release (2.4) is an LTS release (supported until 2022). Because of this, expect software to be a bit behind. If you want to test out the bleeding edge version (based on Debian “Buster”), you can download the testing image [here][10].

### Security oddity

There is one rather disturbing “feature” found in Q4OS. In the developer’s quest to make the distribution closely resemble Windows, they’ve made it such that installing software (from the command line) doesn’t require a password! You read that correctly. If you open the Synaptic package manager, you’re asked for a password. However (and this is a big however), open up a terminal window and issue a command like sudo apt-get install gimp. At this point, the software will install… without requiring the user to type a sudo password.

Did you cringe at that? You should.

I get it, the developers want to ease away the burden of Linux and make a platform the masses could easily adapt to. They’ve done a splendid job of doing just that. However, in the process of doing so, they’ve bypassed a crucial means of security. Is having as near an XP/7 clone as you can find on Linux worth that lack of security? I would say that if it enables more people to use Linux, then yes. But the fact that they’ve required a password for Synaptic (the GUI tool most Windows users would default to for software installation) and not for the command-line tool makes no sense. On top of that, bypassing passwords for the apt and dpkg commands could make for a significant security issue.

Fear not, there is a fix. For those that prefer to require passwords for the command line installation of software, you can open up the file /etc/sudoers.d/30_q4os_apt and comment out the following three lines:
```
%sudo ALL = NOPASSWD: /usr/bin/apt-get *

%sudo ALL = NOPASSWD: /usr/bin/apt-key *

%sudo ALL = NOPASSWD: /usr/bin/dpkg *

```

Once commented out, save and close the file, and reboot the system. At this point, users will now be prompted for a password, should they run the apt-get, apt-key, or dpkg commands.

### A worthy contender

Setting aside the security curiosity, Q4OS is one of the best attempts at recreating Windows XP/7 I’ve come across in a while. If you have users who fear change, and you want to migrate them away from Windows, this distribution might be exactly what you need. I would, however, highly recommend you re-enable passwords for the apt-get, apt-key, and dpkg commands… just to be on the safe side.

In any case, the addition of the Desktop Profiler, and the ability to easily install alternative desktops, makes Q4OS a distribution that just about anyone could use.

Learn more about Linux through the free ["Introduction to Linux" ][11]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/q4os-makes-linux-easy-everyone

作者：[JACK WALLEN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://q4os.org
[2]:https://www.trinitydesktop.org/
[4]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/q4os_1.jpg?itok=dalJk9Xf (default desktop)
[5]:/licenses/category/used-permission
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/q4os_2.jpg?itok=GlouIm73 (Desktop Profiler)
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/q4os_3.jpg?itok=riSTP_1z (Desktop Profiler)
[10]:https://q4os.org/downloads2.html
[11]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
