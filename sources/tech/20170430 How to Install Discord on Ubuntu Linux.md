How to Install Discord on Ubuntu Linux
============================================================

 ![](https://www.maketecheasier.com/assets/uploads/2017/04/discord-feat.jpg "How to Install Discord on Ubuntu Linuxs") 


Discord is a wildly popular text and voice chat application. Though it began life catering primarily to gamers, it has gained widespread favor across nearly all audiences.

Discord isn’t just a great chat client. When you install it you also get its powerful server capabilities, batteries included. Gamers and non-gamers alike can spin up their own private chat servers in minutes, making Discord an obvious choice for teams, guilds, and all sorts of communities.

All too often, Linux users are left out in the gaming world. That’s not the case with Discord. Its developers actively build and maintain their popular chat platform for Linux too. Ubuntu users have it even better. Discord is bundled in a convenient Debian/Ubuntu .deb package.

### Get and Install the Packages

There are a couple of ways that you can get Discord for Ubuntu. You can take a look at both and choose the one that you’re more comfortable with.

### Dependencies

There isn’t anything on Discord’s download page about them, but there are a couple of dependencies that you need before you can install it on Ubuntu. It’s not a big deal. Open up your terminal and enter in the following command to get what you need:

```
sudo apt install libgconf-2-4 libappindicator1
```

### Graphical Install

The graphical install process takes a bit longer, but it also tends to be simpler for newer Linux users.

 ![Download Discord for Linux](https://www.maketecheasier.com/assets/uploads/2017/04/discord-download.jpg "Download Discord for Linux") 

Start by heading over to the Discord [website][11]. The site should automatically detect that you’re running Linux and suggest the correct package right in the main section of the page.

If it doesn’t, just scroll down a bit. The next section of the page shows the other available downloads, and Linux will be there.

Once you’ve found the download link for Linux, check to see that “deb” is selected, and click the “Download” button.

 ![Ubuntu prompt to install Discord](https://www.maketecheasier.com/assets/uploads/2017/04/discord-install1.jpg "Ubuntu prompt to install Discord") 

Your browser will ask if you would prefer to open the file with the Ubuntu software installer or download the file. You can do either, but it is quicker to automatically open the package with the software installer.

 ![Ubuntu Software Center Discord Inst all](https://www.maketecheasier.com/assets/uploads/2017/04/discord-install2.jpg "Ubuntu Software Center Discord Inst all") 

The download is fairly quick, so the installer will open right up and allow you the option of installing your newly-downloaded package. It’s a fairly plain window without a nice icon or a lot of descriptive text, so don’t be put off by that. It’s normal. Click “Install” to begin the installation.

The install process won’t take long. Afterward, Discord will be available and ready to use.

### Command Line Install

Lazy Linux veterans don’t care much for fancy GUI tools. If you fall into this camp, there’s a more direct command line option for you.

First, open up a terminal and change into your download directory. From there, you can use `wget` to grab the .deb package directly.

```
cd ~/Downloads 
wget -O discord-0.0.1.deb https://discordapp.com/api/download?platform=linux&format=deb
```

When the download completes, you can use dpkg to install the .deb package directly. Run the following command:

```
sudo dpkg -i discord-0.0.1.deb
```

### Testing It Out

 ![Discord icon in Unity](https://www.maketecheasier.com/assets/uploads/2017/04/discord-start-unity.jpg "Discord icon in Unity") 

Now you can open your software launcher and search for Discord. Click the icon to launch it.

 ![Login to Discord on Ubuntu](https://www.maketecheasier.com/assets/uploads/2017/04/discord-login.jpg "Login to Discord on Ubuntu") 

On your first run you will be prompted to create an account or sign in. Do whichever you need to.

 ![Discord running on Ubuntu Linux](https://www.maketecheasier.com/assets/uploads/2017/04/discord-running.jpg "Discord running on Ubuntu Linux") 

After you sign in, you’ll be dropped right in to Discord. It will offer some introductory tutorials and advice. You can jump right in and play around, though. Welcome to your new Linux chat experience!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/install-discord-ubuntu/

作者：[ Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/author/nickcongleton/
[2]:https://www.maketecheasier.com/install-discord-ubuntu/#respond
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-discord-ubuntu%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-discord-ubuntu%2F&text=How+to+Install+Discord+on+Ubuntu+Linux
[6]:mailto:?subject=How%20to%20Install%20Discord%20on%20Ubuntu%20Linux&body=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-discord-ubuntu%2F
[7]:https://www.maketecheasier.com/faulty-graphics-card-and-the-fix/
[8]:https://www.maketecheasier.com/set-power-button-turn-off-display-windows10/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:https://support.google.com/adsense/troubleshooter/1631343
[11]:https://discordapp.com/download
