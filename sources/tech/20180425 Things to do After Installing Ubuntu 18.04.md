Things to do After Installing Ubuntu 18.04
======
**Brief: This list of things to do after installing Ubuntu 18.04 helps you get started with Bionic Beaver for a smoother desktop experience.**

[Ubuntu][1] 18.04 Bionic Beaver releases today. You are perhaps already aware of the [new features in Ubuntu 18.04 LTS][2] release. If not, here’s the video review of Ubuntu 18.04 LTS:

[Subscribe to YouTube Channel for more Ubuntu Videos][3]

If you opted to install Ubuntu 18.04, I have listed out a few recommended steps that you can follow to get started with it.

### Things to do after installing Ubuntu 18.04 Bionic Beaver

![Things to do after installing Ubuntu 18.04][4]

I should mention that the list of things to do after installing Ubuntu 18.04 depends a lot on you and your interests and needs. If you are a programmer, you’ll focus on installing programming tools. If you are a graphic designer, you’ll focus on installing graphics tools.

Still, there are a few things that should be applicable to most Ubuntu users. This list is composed of those things plus a few of my of my favorites.

Also, this list is for the default [GNOME desktop][5]. If you are using some other flavor like [Kubuntu][6], Lubuntu etc then the GNOME-specific stuff won’t be applicable to your system.

You don’t have to follow each and every point on the list blindly. You should see if the recommended action suits your requirements or not.

With that said, let’s get started with this list of things to do after installing Ubuntu 18.04.

#### 1\. Update the system

This is the first thing you should do after installing Ubuntu. Update the system without fail. It may sound strange because you just installed a fresh OS but still, you must check for the updates.

In my experience, if you don’t update the system right after installing Ubuntu, you might face issues while trying to install a new program.

To update Ubuntu 18.04, press Super Key (Windows Key) to launch the Activity Overview and look for Software Updater. Run it to check for updates.

![Software Updater in Ubuntu 17.10][7]

**Alternatively** , you can use these famous commands in the terminal ( Use Ctrl+Alt+T):
```
sudo apt update && sudo apt upgrade

```

#### 2\. Enable additional repositories for more software

[Ubuntu has several repositories][8] from where it provides software for your system. These repositories are:

  * Main – Free and open-source software supported by Ubuntu team
  * Universe – Free and open-source software maintained by the community
  * Restricted – Proprietary drivers for devices.
  * Multiverse – Software restricted by copyright or legal issues.
  * Canonical Partners – Software packaged by Ubuntu for their partners



Enabling all these repositories will give you access to more software and proprietary drivers.

Go to Activity Overview by pressing Super Key (Windows key), and search for Software & Updates:

![Software and Updates in Ubuntu 17.10][9]

Under the Ubuntu Software tab, make sure you have checked all of the Main, Universe, Restricted and Multiverse repository checked.

![Setting repositories in Ubuntu 18.04][10]

Now move to the **Other Software** tab, check the option of **Canonical Partners**.

![Enable Canonical Partners repository in Ubuntu 17.10][11]

You’ll have to enter your password in order to update the software sources. Once it completes, you’ll find more applications to install in the Software Center.

#### 3\. Install media codecs

In order to play media files like MP#, MPEG4, AVI etc, you’ll need to install media codecs. Ubuntu has them in their repository but doesn’t install it by default because of copyright issues in various countries.

As an individual, you can install these media codecs easily using the Ubuntu Restricted Extra package. Click on the link below to install it from the Software Center.

[Install Ubuntu Restricted Extras][12]

Or alternatively, use the command below to install it:
```
sudo apt install ubuntu-restricted-extras

```

#### 4\. Install software from the Software Center

Now that you have setup the repositories and installed the codecs, it is time to get software. If you are absolutely new to Ubuntu, please follow this [guide to installing software in Ubuntu][13].

There are several ways to install software. The most convenient way is to use the Software Center that has thousands of software available in various categories. You can install them in a few clicks from the software center.

![Software Center in Ubuntu 17.10 ][14]

It depends on you what kind of software you would like to install. I’ll suggest some of my favorites here.

  * **VLC** – media player for videos
  * **GIMP** – Photoshop alternative for Linux
  * **Pinta** – Paint alternative in Linux
  * **Calibre** – eBook management tool
  * **Chromium** – Open Source web browser
  * **Kazam** – Screen recorder tool
  * [**Gdebi**][15] – Lightweight package installer for .deb packages
  * **Spotify** – For streaming music
  * **Skype** – For video messaging
  * **Kdenlive** – [Video editor for Linux][16]
  * **Atom** – [Code editor][17] for programming



You may also refer to this list of [must-have Linux applications][18] for more software recommendations.

#### 5\. Install software from the Web

Though Ubuntu has thousands of applications in the software center, you may not find some of your favorite applications despite the fact that they support Linux.

Many software vendors provide ready to install .deb packages. You can download these .deb files from their website and install it by double-clicking on it.

[Google Chrome][19] is one such software that you can download from the web and install it.

#### 6\. Opt out of data collection in Ubuntu 18.04 (optional)

Ubuntu 18.04 collects some harmless statistics about your system hardware and your system installation preference. It also collects crash reports.

You’ll be given the option to not send this data to Ubuntu servers when you log in to Ubuntu 18.04 for the first time.

![Opt out of data collection in Ubuntu 18.04][20]

If you miss it that time, you can disable it by going to System Settings -> Privacy and then set the Problem Reporting to Manual.

![Privacy settings in Ubuntu 18.04][21]

#### 7\. Customize the GNOME desktop (Dock, themes, extensions and more)

The GNOME desktop looks good in Ubuntu 18.04 but doesn’t mean you cannot change it.

You can do a few visual changes from the System Settings. You can change the wallpaper of the desktop and the lock screen, you can change the position of the dock (launcher on the left side), change power settings, Bluetooth etc. In short, you can find many settings that you can change as per your need.

![Ubuntu 17.10 System Settings][22]

Changing themes and icons are the major way to change the looks of your system. I advise going through the list of [best GNOME themes][23] and [icons for Ubuntu][24]. Once you have found the theme and icon of your choice, you can use them with GNOME Tweaks tool.

You can install GNOME Tweaks via the Software Center or you can use the command below to install it:
```
sudo apt install gnome-tweak-tool

```

Once it is installed, you can easily [install new themes and icons][25].

![Change theme is one of the must to do things after installing Ubuntu 17.10][26]

You should also have a look at [use GNOME extensions][27] to further enhance the looks and capabilities of your system. I made this video about using GNOME extensions in 17.10 and you can follow the same for Ubuntu 18.04.

If you are wondering which extension to use, do take a look at this list of [best GNOME extensions][28].

I also recommend reading this article on [GNOME customization in Ubuntu][29] so that you can know the GNOME desktop in detail.

#### 8\. Prolong your battery and prevent overheating

Let’s move on to [prevent overheating in Linux laptops][30]. TLP is a wonderful tool that controls CPU temperature and extends your laptops’ battery life in the long run.

Make sure that you haven’t installed any other power saving application such as [Laptop Mode Tools][31]. You can install it using the command below in a terminal:
```
sudo apt install tlp tlp-rdw

```

Once installed, run the command below to start it:
```
sudo tlp start

```

#### 9\. Save your eyes with Nightlight

Nightlight is my favorite feature in GNOME desktop. Keeping [your eyes safe at night][32] from the computer screen is very important. Reducing blue light helps reducing eye strain at night.

![flux effect][33]

GNOME provides a built-in Night Light option, which you can activate in the System Settings.

Just go to System Settings-> Devices-> Displays and turn on the Night Light option.

![Enabling night light is a must to do in Ubuntu 17.10][34]

#### 9\. Disable automatic suspend for laptops

Ubuntu 18.04 comes with a new automatic suspend feature for laptops. If the system is running on battery and is inactive for 20 minutes, it will go in suspend mode.

I understand that the intention is to save battery life but it is an inconvenience as well. You can’t keep the power plugged in all the time because it’s not good for the battery life. And you may need the system to be running even when you are not using it.

Thankfully, you can change this behavior. Go to System Settings -> Power. Under Suspend & Power Button section, either turn off the Automatic Suspend option or extend its time period.

![Disable automatic suspend in Ubuntu 18.04][35]

You can also change the screen dimming behavior in here.

#### 10\. System cleaning

I have written in detail about [how to clean up your Ubuntu system][36]. I recommend reading that article to know various ways to keep your system free of junk.

Normally, you can use this little command to free up space from your system:
```
sudo apt autoremove

```

It’s a good idea to run this command every once a while. If you don’t like the command line, you can use a GUI tool like [Stacer][37] or [Bleach Bit][38].

#### 11\. Going back to Unity or Vanilla GNOME (not recommended)

If you have been using Unity or GNOME in the past, you may not like the new customized GNOME desktop in Ubuntu 18.04. Ubuntu has customized GNOME so that it resembles Unity but at the end of the day, it is neither completely Unity nor completely GNOME.

So if you are a hardcore Unity or GNOMEfan, you may want to use your favorite desktop in its ‘real’ form. I wouldn’t recommend but if you insist here are some tutorials for you:

#### 12\. Can’t log in to Ubuntu 18.04 after incorrect password? Here’s a workaround

I noticed a [little bug in Ubuntu 18.04][39] while trying to change the desktop session to Ubuntu Community theme. It seems if you try to change the sessions at the login screen, it rejects your password first and at the second attempt, the login gets stuck. You can wait for 5-10 minutes to get it back or force power it off.

The workaround here is that after it displays the incorrect password message, click Cancel, then click your name, then enter your password again.

#### 13\. Experience the Community theme (optional)

Ubuntu 18.04 was supposed to have a dashing new theme developed by the community. The theme could not be completed so it could not become the default look of Bionic Beaver release. I am guessing that it will be the default theme in Ubuntu 18.10.

![Ubuntu 18.04 Communitheme][40]

You can try out the aesthetic theme even today. [Installing Ubuntu Community Theme][41] is very easy. Just look for it in the software center, install it, restart your system and then at the login choose the Communitheme session.

#### 14\. Get Windows 10 in Virtual Box (if you need it)

In a situation where you must use Windows for some reasons, you can [install Windows in virtual box inside Linux][42]. It will run as a regular Ubuntu application.

It’s not the best way but it still gives you an option. You can also [use WINE to run Windows software on Linux][43]. In both cases, I suggest trying the alternative native Linux application first before jumping to virtual machine or WINE.

#### What do you do after installing Ubuntu?

Those were my suggestions for getting started with Ubuntu. There are many more tutorials that you can find under [Ubuntu 18.04][44] tag. You may go through them as well to see if there is something useful for you.

Enough from myside. Your turn now. What are the items on your list of **things to do after installing Ubuntu 18.04**? The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://www.ubuntu.com/
[2]:https://itsfoss.com/ubuntu-18-04-release-features/
[3]:https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/things-to-after-installing-ubuntu-18-04-featured-800x450.jpeg
[5]:https://www.gnome.org/
[6]:https://kubuntu.org/
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/software-update-ubuntu-17-10.jpg
[8]:https://help.ubuntu.com/community/Repositories/Ubuntu
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/software-updates-ubuntu-17-10.jpg
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/repositories-ubuntu-18.png
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/software-repository-ubuntu-17-10.jpeg
[12]:apt://ubuntu-restricted-extras
[13]:https://itsfoss.com/remove-install-software-ubuntu/
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/Ubuntu-software-center-17-10-800x551.jpeg
[15]:https://itsfoss.com/gdebi-default-ubuntu-software-center/
[16]:https://itsfoss.com/best-video-editing-software-linux/
[17]:https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[18]:https://itsfoss.com/essential-linux-applications/
[19]:https://www.google.com/chrome/
[20]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/opt-out-of-data-collection-ubuntu-18-800x492.jpeg
[21]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/privacy-ubuntu-18-04-800x417.png
[22]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/System-Settings-Ubuntu-17-10-800x573.jpeg
[23]:https://itsfoss.com/best-gtk-themes/
[24]:https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[25]:https://itsfoss.com/install-themes-ubuntu/
[26]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/GNOME-Tweak-Tool-Ubuntu-17-10.jpeg
[27]:https://itsfoss.com/gnome-shell-extensions/
[28]:https://itsfoss.com/best-gnome-extensions/
[29]:https://itsfoss.com/gnome-tricks-ubuntu/
[30]:https://itsfoss.com/reduce-overheating-laptops-linux/
[31]:https://wiki.archlinux.org/index.php/Laptop_Mode_Tools
[32]:https://itsfoss.com/night-shift-flux-ubuntu-linux/
[33]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/03/flux-eyes-strain.jpg
[34]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/Enable-Night-Light-Feature-Ubuntu-17-10-800x396.jpeg
[35]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/disable-automatic-suspend-ubuntu-18-800x586.jpeg
[36]:https://itsfoss.com/free-up-space-ubuntu-linux/
[37]:https://itsfoss.com/optimize-ubuntu-stacer/
[38]:https://itsfoss.com/bleachbit-2-release/
[39]:https://gitlab.gnome.org/GNOME/gnome-shell/issues/227
[40]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/ubunt-18-theme.jpeg
[41]:https://itsfoss.com/ubuntu-community-theme/
[42]:https://itsfoss.com/install-windows-10-virtualbox-linux/
[43]:https://itsfoss.com/use-windows-applications-linux/
[44]:https://itsfoss.com/tag/ubuntu-18-04/
