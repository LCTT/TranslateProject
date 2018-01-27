Manage Your Games Using Lutris In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-1-720x340.jpg)

Let us start the first day of 2018 with Games! Today, we are going to talk about **Lutris** , an open source gaming platform for Linux. You can install, remove, configure, launch and manage your games using Lutris. It helps you to manage your Linux games, Windows games, emulated console games and browser games, in a single interface. It also includes community-written installer scripts to make a game's installation process a lot easier.

Lutris comes with more than 20 emulators installed automatically (Or you can install them in a single click) that provides support for most gaming systems from the late 70's to the present day. The currently supported gaming platforms are;

  * Native Linux
  * Windows
  * Steam (Linux and Windows)
  * MS-DOS
  * Arcade machines
  * Amiga computers
  * Atari 8 and 16bit computers and consoles
  * Browsers (Flash or HTML5 games)
  * Commmodore 8 bit computers
  * SCUMM based games and other point and click adventure games
  * Magnavox Odyssey², Videopac+
  * Mattel Intellivision
  * NEC PC-Engine Turbographx 16, Supergraphx, PC-FX
  * Nintendo NES, SNES, Game Boy, Game Boy Advance, DS
  * Game Cube and Wii
  * Sega Master Sytem, Game Gear, Genesis, Dreamcast
  * SNK Neo Geo, Neo Geo Pocket
  * Sony PlayStation
  * Sony PlayStation 2
  * Sony PSP
  * Z-Machine games like Zork
  * And more yet to come.



### Installing Lutris

Like Steam, Lutris consists of two parts; the website and the client application. From the website you can browse for the available games, add your favorite games to your personal library and install them using the installation link.

First, let us install Lutris client. It currently supports Arch Linux, Debian, Fedora, Gentoo, openSUSE, and Ubuntu.

For Arch Linux and its derivatives like Antergos, Manjaro Linux, it is available in [**AUR**][1]. So you can install it using any AUR helper programs.

Using [**Pacaur**][2]:
```
pacaur -S lutris
```

Using **[Packer][3]** :
```
packer -S lutris
```

Using [**Yaourt**][4]:
```
yaourt -S lutris
```

Using [**Yay**][5]:
```
yay -S lutris
```

**On Debian:**

On **Debian 9.0** run the following commands as **root** :
```
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ /' > /etc/apt/sources.list.d/lutris.list
wget -nv https://download.opensuse.org/repositories/home:strycore/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install lutris
```

On **Debian 8.0** run the following as **root** :
```
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_8.0/ /' > /etc/apt/sources.list.d/lutris.list
wget -nv https://download.opensuse.org/repositories/home:strycore/Debian_8.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install lutris
```

On **Fedora 27** run the following as **root** :
```
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:strycore/Fedora_27/home:strycore.repo
dnf install lutris
```

On **Fedora 26** run the following as **root** :
```
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:strycore/Fedora_26/home:strycore.repo
dnf install lutris
```

On **openSUSE Tumbleweed** run the following as **root** :
```
zypper addrepo https://download.opensuse.org/repositories/home:strycore/openSUSE_Tumbleweed/home:strycore.repo
zypper refresh
zypper install lutris
```

On **openSUSE Leap 42.3** run the following as **root** :
```
zypper addrepo https://download.opensuse.org/repositories/home:strycore/openSUSE_Leap_42.3/home:strycore.repo
zypper refresh
zypper install lutris
```

On **Ubuntu 17.10**:
```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.10/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_17.10/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

On **Ubuntu 17.04**:
```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.04/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_17.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

On **Ubuntu 16.10**:
```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.10/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_16.10/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

On **Ubuntu 16.04**:
```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/lutris.list"
wget -nv https://download.opensuse.org/repositories/home:strycore/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install lutris
```

For other platforms, refer the [**Lutris download link**][6].

### Manage Your Games Using Lutris

Once installed, open Lutris from your Menu or Application launcher. At first launch, the default interface of Lutris will look like below.

[![][7]][8]

**Connecting to your Lutris.net account**

Next, you need to connect your Lutris.net account to your client in-order to sync the games from your personal library. To do so, [**register a new account**][9] if you don't have one already. Then, click on **" Connecting to your Lutirs.net account to sync your library"** link in the Lutris client.

Enter your user credentials and click **Connect**.

[![][7]][10]

Now you're connected to your Lutris.net account.

[![][7]][11]**Browse Games**

To search any games, click on the Browse icon (the game controller icon) in the tool bar. It will automatically take you to Games page of Lutris website. You can see there all available games in an alphabetical order. Lutris website has lot of games and more games are being added constantly.

[![][7]][12]

Choose any games of your choice and add them to your library.

[![][7]][13]

Then, go back to your Lutris client and click **Menu - > Lutris -> Synchronize library**. Now you will see all games in your library in your local Lutris client interface.

[![][7]][14]

If you don't see the games, just restart Lutris client once.

**Installing Games**

To install a game, just right click on it and click **Install** button. For example, I am going to install [**2048 game**][15] in my system. As you see in the below screenshot, it asks me to choose the version to install. Since it has only one version (i.e online), it was selected automatically. Click **Continue**.

[![][7]][16]Click Install:

[![][7]][17]

After installation completed, you can either launch the newly installed game or simply close the window and continue installing other games in your library.

**Import Steam library**

You can also import your Steam library. To do so, go to your Lutris profile and click the **" Sign in through Steam"** button. You will then be redirected to Steam and will be asked to enter your user credentials. Once you authorized it, your Steam account will be connected with your Lutris account. Please be mindful that your Steam account should be public in order to sync the games from the library. You can switch it back to private after the sync is completed.

**Adding games manually**

Lutris has the option to add games manually. To do so, click the plus (+) sign on the toolbar.

[![][7]][18]

In the next window, enter the game's name, and choose the runners in the Game info tab. The runners are programs such as Wine, Steam for linux etc., that helps you to launch a game. You can install runners from Menu -> Manage runners.

[![][7]][19]

Then go to the next tab and choose Game's main executable or ISO. Finally click Save. The good thing is you can add multiple version of same games.

**Removing games**

To remove any installed game, just right click on it in the local library of your Lutris client application. Choose "Remove" and then "Apply".

[![][7]][20]

Lutris is just like Steam. Just add the games to your library in the website and the client will install them for you!

And, that's all for today, folks! We will be posting more good and useful stuffs in this year. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/manage-games-using-lutris-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/lutris/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/install-yaourt-arch-linux/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://lutris.net/downloads/
[7]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-1-1.png ()
[9]:https://lutris.net/user/register/
[10]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-2.png ()
[11]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-3.png ()
[12]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-15-1.png ()
[13]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-16.png ()
[14]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-6.png ()
[15]:https://www.ostechnix.com/let-us-play-2048-game-terminal/
[16]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-12.png ()
[17]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-13.png ()
[18]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-18-1.png ()
[19]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-19.png ()
[20]:http://www.ostechnix.com/wp-content/uploads/2018/01/Lutris-14-1.png ()
