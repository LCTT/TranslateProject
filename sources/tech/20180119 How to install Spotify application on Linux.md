How to install Spotify application on Linux
======

How do I install Spotify app on Ubuntu Linux desktop to stream music?

Spotify is a digital music stream service that provides you access to tons of songs. You can stream for free or buy a subscription. Creating a playlist is possible. A subscriber can listen music ad-free. You get better sound quality. This page **shows how to install Spotify on Linux using a snap package manager that works on Ubuntu, Mint, Debian, Fedora, Arch and many other distros**.

### Installing spotify application on Linux

The procedure to install spotify on Linux is as follows:

1. Install snapd
2. Turn on snapd
3. Find Spotify snap:
```
snap find spotify
```
4. Install spotify music app:
```
do snap install spotify
```
5. Run it:
```
spotify &
```

Let us see all steps and examples in details.

### Step 1 - Install Snapd

You need to install snapd package. It is daemon (service) and tooling that enable snap packages on Linux operating system.

#### Snapd on a Debian/Ubuntu/Mint Linux

Type the following [apt command][1]/[apt-get command][2] as follows:
`$ sudo apt install snapd`

#### Install snapd on an Arch Linux

snapd is available in the Arch User Repository (AUR) only. Run yaourt command (see [how to install yaourt on Archlinux][3]):
```
$ sudo yaourt -S snapd
$ sudo systemctl enable --now snapd.socket
```

#### Get snapd on a Fedora Linux

Run snapd command
```
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
```

#### OpenSUSE install snapd

Execute the snap command:
`$ snap find spotify`
[![snap search for spotify app command][4]][4]
Install it:
`$ sudo snap install spotify`
[![How to install Spotify application on Linux using snap command][5]][5]

### Step 3 - Run spotify and enjoy it(译注：原博客中就是这么直接跳到step3的)

Run it from GUI or simply type:
`$ spotify`
Automatically sign in to your account on startup:
```
$ spotify --username vivek@nixcraft.com
$ spotify --username vivek@nixcraft.com --password 'myPasswordHere'
```
Start spotify client with given URI when initialized:
`$ spotify--uri=<uri>`
Start with the specified URL:
`$ spotify--url=<url>`
[![Spotify client app running on my Ubuntu Linux desktop][6]][6]

### About the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][7], [Facebook][8], [Google+][9].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-install-spotify-application-on-linux/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[2]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[3]:https://www.cyberciti.biz/faq/how-to-install-yaourt-in-arch-linux/
[4]:https://www.cyberciti.biz/media/new/faq/2018/01/snap-search-for-spotify-app-command.jpg
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-install-Spotify-application-on-Linux-using-snap-command.jpg
[6]:https://www.cyberciti.biz/media/new/faq/2018/01/Spotify-client-app-running-on-my-Ubuntu-Linux-desktop.jpg
[7]:https://twitter.com/nixcraft
[8]:https://facebook.com/nixcraft
[9]:https://plus.google.com/+CybercitiBiz
