8 Things To Do After Installing Ubuntu 13.10 (Saucy Salamander)
================================================================================
Ubuntu 13.10 was released today and for those of you who plan on doing a clean install, here are 8 useful things to do after the installation.

![](http://dl.dropboxusercontent.com/u/1113424/img/ubuntu13.10-saucy-salamander.jpg)

### 1. Install some extra AppIndicators (applets) ###

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-systemload.png)

**System Load Indicator** is a port of the popular System Monitor GNOME Panel applet and it can display CPU, memory, network usage, hard disk I/O and more on the panel. Install it from the Ubuntu Software Center by clicking the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][1]

Or, to install it via command line, use:

    sudo apt-get install indicator-multiload

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-cpufreq.png)

**Cpufreq Indicator** is the equivalent of the old GNOME CPU frequency scaling applet which can be used for changing the CPU frequency on-the-fly. Install it in Ubuntu by clicking the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][2]

Or install it from the command line:

    sudo apt-get install indicator-cpufreq

**My Weather Indicator** is an appindicator that displays the current weather on the Unity panel. The appindicator can also display a 5-day forecast, a desktop widget and supports four weather services: OpenWeatherMap, Yahoo, Wunderground and World Weather Online.

To install it in Ubuntu 13.10, use the commands below:

    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install my-weather-indicator

![](https://dl.dropboxusercontent.com/u/1113424/img/variety-wallpaper-changer.jpg)

[**Variety**][3] is an application that comes with an AppIndicator but since you basically only have to configure it once and after that you'll only need to use the AppIndicator, I'll list it here. Variety is a cool wallpaper changer that automatically downloads and changes your wallpaper on a given interval. Using it, you'll get cool, fresh wallpapers each day. From the AppIndicator you can quickly switch to the next (random) wallpaper or copy the wallpaper to favourites, for later use.

To install Variety in Ubuntu, use the following commands:

    sudo add-apt-repository ppa:peterlevi/ppa
    sudo apt-get update
    sudo apt-get install variety

![](http://dl.dropboxusercontent.com/u/1113424/img/diodon-indicator.png)

You'll probably also want a clipboard manager. I recommend **Diodon** which is lightweight, supports files, image sections and more. To install it in Ubuntu 13.10 Saucy Salamander, click the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][4]

Or open a terminal and copy/paste the following command to install it:

    sudo apt-get install diodon diodon-plugins

### 2. Tweak Unity ###

![](http://dl.dropboxusercontent.com/u/1113424/img/unity-tweak-tool.png)

**Unity Tweak Tool** allows users to change various Unity settings such as auto-hide bahavior, window snapping and hot corners, tweak Dash, the Unity Launcher or HUD, change the GTK or icon theme, change the font face or size, move the window controls to the right and much more.

To install Unity Tweak Tool from the Ubuntu Software Center, click the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][5]

Or, install it in Ubuntu 13.10 via command line:

    sudo apt-get install unity-tweak-tool

### 3. Privacy tweaks ###

![](http://dl.dropboxusercontent.com/u/1113424/img/ubuntu13.10-privacy-security_2.png)

As you probably know, by default Dash shows all the recently accessed files as well as other files found on your filesystem. By selecting **Security & Privacy** from System Settings, you can choose what file types can show up in Dash, exclude various applications or folders/partitions from showing up in Dash and there's also an option to clear usage data.

Furthermore, on the Search tab, you can disable online search results from being displayed in Dash. However, this option disables all the online search results so if for instance you only want to **disable the shopping suggestions**, you can run the following command:

    gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

More on disabling Dash (search) plugins, [HERE][6].

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-privacy.png)

Another way to deal with privacy in Ubuntu 13.10 is to use the **Privacy Indicator**, a tool hat lets you quickly enable/disable Zeitgeist (activity logging) or online search results from showing up in Dash, clear the Zeitgeist log or recent files (which show up in the Nautilus "Recent" sidebar item for instance).

[**Download Privacy Indicator**][7] (there's a deb available at the bottom of the page)

### 4. Enable the discrete card on systems with Hybrid graphics ###

The Ubuntu developers have worked to support Hybrid graphics in Ubuntu 13.10 (and 12.04 LTS). Below you'll find instructions on how to set this up.

![](http://dl.dropboxusercontent.com/u/1113424/img/nvidia-prime-nvsettings.png)

**Nvidia Optimus**: unfortunately, the Nvidia Linux graphics drivers don't yet fully support Optimus - more on this subject, [HERE][8].

Ubuntu 13.10 (Saucy Salamander) ships with a new package called "nvidia-prime" which enables the Nvidia graphics card on Optimus systems (which by default use the integrated Intel graphics chip). By using the instructions below, the Nvidia card will always be in use, so there's no way to switch it off to save power. Because of this, the laptop will consume more power and possibly overheat - **in my case, the laptop gets really hot and for this reason I'm not using this solution but things may work better for your laptop** (and if not, you can easily revert the changes).

Unfortunately, that's not the only issue. You may also experience screen tearing and hotplug won't work so if you want to use multiple monitors, you'll have to manually set them up in xorg.conf. The advantages are that you'll be able to play games that aren't supported by the Intel graphics, use VDPAU-enabled media players, etc.

That said, if you want to give this a try in Ubuntu 13.10 Saucy Salamander, make sure you're using LightDM (the default Ubuntu display manager) and not some other display manager like GDM. Also, if you've installed Bumblebee, you'll need to purge it:

    sudo apt-get purge bumblebee* bbswitch-dkms

Then, install the latest Nvidia drivers and "nvidia-prime":

    sudo apt-get install nvidia-319 nvidia-settings-319 nvidia-prime

And finally, reboot (restarting X isn't enough).

If you want to revert this change, simply remove the installed packages:

    sudo apt-get remove nvidia-319 nvidia-settings-319 nvidia-prime

And reboot.

**AMD Hybrid graphics**: I didn't test this because I don't have a system with AMD graphics, but according to the [**HybridGraphics**][9] Ubuntu wiki page, there aren't any known issues, so I assume that everything works properly (again, I'm not sure since I can't test it!).

To get proper AMD Hybrid graphics support in Ubuntu 13.10, all you have to do is install the latest fglrx driver and fglrx-pxpress from the repositories:

    sudo apt-get install fglrx fglrx-pxpress

And then reboot the system (restarting X isn't enough).

### 5. Improve battery life ###

There are two tools you can use to improve your laptop's battery life: laptop-mode-tools or TLP. Both try to achieve the same thing, but from what I've read, [**TLP**][10] seems to save a bit more power. However, TLP is only available in a PPA so if you don't like adding PPAs, install laptop-mode-tools.

Important note: **don't install both laptop-mode-tools and TLP!**

To install laptop-mode-tools, click the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][11]

Or install it from the command line:

    sudo apt-get install laptop-mode-tools

Or, to install TLP, use the commands below:

    sudo add-apt-repository ppa:linrunner/tlp
    sudo apt-get update
    sudo apt-get install tlp tlp-rdw
    sudo tlp start

No configuration is needed for either TLP or laptop-mode-tools.

Another way to save power and prevent your laptop from overheating (the tool also allows running apps or games on the discrete graphics card on demand, using the "optirun" command - see below) is **Bumblebee**. Bumblebee is a tool for laptops that use Nvidia Optimus, that disables the Nvidia card when not in use.

**Note: if you plan on using the hybrid graphics solution under step 4 for Nvidia Optimus, don't install Bumblebee!**

To install Bumblebee, click the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][12]

Or install it via command line:

    sudo apt-get install bumblebee bumblebee-nvidia

Then reboot.

Currently there's a [**bug**][13] in Ubuntu 13.10 that prevents "optirun" from working. To fix it, use the following command:

- 32bit:

    sudo ln -s /usr/lib/i386-linux-gnu/libturbojpeg.so.0 /usr/lib/i386-linux-gnu/libturbojpeg.so

- 64bit:

    sudo ln -s /usr/lib/x86_64-linux-gnu/libturbojpeg.so.0 /usr/lib/x86_64-linux-gnu/libturbojpeg.so

When you want to use the Nvidia graphics card for an application, run:

    optirun APP-EXECUTABLE

replacing "APP-EXECUTABLE" with the application (or game) executable.

### 6. Install codecs, Java and encrypted DVD playback ###

To be able to play most audio and video formats, install **Ubuntu Restricted Extras** by clicking the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][14]

Or install it using the following command:

    sudo apt-get install ubuntu-restricted-extras

I suggest to also install the **unrestricted versions of libavformat and libavcodec** so you don't encounter issues with missing codecs when trying to use some video editors or transcoders - install them by clicking the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][15]

Or by using the following command:

    sudo apt-get install libavformat-extra-53 libavcodec-extra-53

You may also need Java, but you must figure out what you need. Most users will only need **OpenJRE** and the Java browser plugin which you can install by clicking the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][16]

Or by using the following command:

    sudo apt-get install icedtea-7-plugin openjdk-7-jre

For development, you'll also want **OpenJDK** which you can install by using the button below:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][17]

Or by using the following command:

    sudo apt-get install openjdk-7-jdk

If for various reasons, you need **Oracle Java** (the package includes JDK, JRE and the browser plugin), you can install [**Oracle Java 7**][18] by using the following commands:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer

**Encrypted DVD playback**: the Medibuntu repository [**no longer exists**][19] and while most packages in the archive are obsolete or unnecessary because most are now in the official Ubuntu repository or have better equivalents, livdvdcss is still required for playing encrypted DVDs. 

You can enable encrypted DVD playback in Ubuntu 13.10 by using the following commands:

    sudo apt-get install libdvdread4
    sudo /usr/share/doc/libdvdread4/install-css.sh

### 7. Get the latest Rhythmbox and VLC ###

![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-n-vlc.png)

Two popular applications: Rhythmbox and VLC, haven't been updated to the latest version in Ubuntu 13.10. If you want to install the latest version for these apps, you can use PPAs.

Please note that by upgrading Rhythmbox, the plugins in the Rhythmbox [**third-party plugins PPA**][20] will stop working. The plugins Rhythmbox ships with will obviously work.

**Rhythmbox** (version in Ubuntu 13.10: 2.99.1, version in PPA: 3.0.1):

    sudo add-apt-repository ppa:jacob/media
    sudo apt-get update
    sudo apt-get install rhythmbox

**VLC** (version in Ubuntu 13.10: 2.0.8, version in the PPA: 2.1.0):

    sudo add-apt-repository ppa:videolan/stable-daily
    sudo apt-get update
    sudo apt-get install vlc

### 8. Tweak Nautilus: disable recursive search and install a quick file previewer ###

![](http://dl.dropboxusercontent.com/u/1113424/img/nautilus-no-recursive.png)

The type-ahead find feature was remove from Nautilus starting with version 3.6. Later versions perform a search in the current directory and all its subdirectories when you start typing a file name. And this makes it unusable at times so if you find this behavior annoying, you can install Nautilus patched to allow [**disabling recursive search**][21] (you can easily enable it back if you want).

**To upgrade Nautilus to the patched version that allows disabling recursive search, use the following commands:**

    sudo add-apt-repository ppa:dr3mro/personal
    sudo apt-get update
    sudo apt-get upgrade
    nautilus -q

**Then, disable recursive search using the following command:**

    gsettings set org.gnome.nautilus.preferences enable-recursive-search false

If later on you want to re-enable recursive search, use the command below:

    gsettings set org.gnome.nautilus.preferences enable-recursive-search true

![](http://dl.dropboxusercontent.com/u/1113424/img/gnome-sushi.png)

**GNOME Sushi** is a quick file previewer for Nautilus. To install it, click the button below (this will install gnome-sushi and unoconv, required to be able to preview some files such as documents):

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][22]

or install it via command line:

    sudo apt-get install gnome-sushi unoconv

To use it, select a file (picture, text or document, sound file and so on) and press the SPACE key to preview that file. You can close the preview either by clicking the SPACE key again or clicking the window close button.

**Now it's your turn. What are the first things you install or tweak after a fresh Ubuntu installation?**

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2013/10/8-things-to-do-after-installing-ubuntu.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:apt://indicator-multiload
[2]:apt://indicator-cpufreq
[3]:http://www.webupd8.org/2013/06/variety-wallpaper-changer-0415-released.html
[4]:apt://diodon,diodon-plugins
[5]:apt://unity-tweak-tool
[6]:http://www.webupd8.org/2013/10/how-to-disable-amazon-shopping.html
[7]:http://www.florian-diesch.de/software/indicator-privacy/
[8]:http://www.webupd8.org/2013/08/using-nvidia-graphics-drivers-with.html
[9]:https://wiki.ubuntu.com/X/Config/HybridGraphics#Known_issues
[10]:http://www.webupd8.org/2013/04/improve-power-usage-battery-life-in.html
[11]:apt://laptop-mode-tools
[12]:apt://bumblebee,bumblebee-nvidia
[13]:http://www.webupd8.org/2013/10/fix-bumblebee-libturbojpegso-issue-in.html
[14]:apt://ubuntu-restricted-extras
[15]:apt://libavformat-extra-53,libavcodec-extra-53
[16]:apt://icedtea-7-plugin,openjdk-7-jre
[17]:apt://openjdk-7-jdk
[18]:http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
[19]:http://gauvain.pocentek.net/node/61
[20]:http://www.webupd8.org/2012/08/rhythmbox-third-party-plugins-ubuntu-ppa.html
[21]:http://www.webupd8.org/2013/09/how-to-disable-recursive-search-in.html
[22]:apt://gnome-sushi,unoconv