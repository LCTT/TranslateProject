12 Things to do After Installing Linux Mint 19
======
[Linux Mint][1] is one of the [best Linux distributions for new users][2]. It runs pretty well out of the box. Still, there are a few recommended things to do after [installing Linux Mint][3] for the first time.

In this article, I am going to share some basic yet effective tips that will make your Linux Mint experience even better. If you follow these best practices, you’ll have a more user-friendly system.

### Things to do after installing Linux Mint 19 Tara

![Things to do after installing Linux Mint 19][4]

I am using [Linux Mint][1] 19 Cinnamon edition while writing this article so some of the points in this list are specific to Mint Cinnamon. But this doesn’t mean you can follow these suggestions on Xfce or MATE editions.

Another disclaimer is that this is just some recommendations from my point of view. Based on your interests and requirement, you would perhaps do a lot more than what I suggest here.

That said, let’s see the top things to do after installing Linux Mint 19.

#### 1\. Update your system

This is the first and foremost thing to do after a fresh install of Linux Mint or any Linux distribution. This ensures that your system has all the latest software and security updates. You can update Linux Mint by going to Menu->Update Manager.

You can also use a simple command to update your system:
```
sudo apt update && sudo apt upgrade -y

```

#### 2\. Create system snapshots

Linux Mint 19 recommends creating system snapshots using Timeshift application. It is integrated with update manager. This tool will create system snapshots so if you want to restore your Mint to a previous state, you could easily do that. This will help you in the unfortunate event of a broken system.

![Creating snapshots with Timeshift in Linux Mint 19][5]

It’s FOSS has a detailed article on [using Timeshift][6]. I recommend reading it to learn about Timeshift in detail.

#### 3\. Install codecs

Want to play MP3, watch videos in MP$ and other formats or play DVD? You need to install the codecs. Linux Mint provides an easy way to install these codecs in a package called Mint Codecs.

You can install it from the Welcome Screen or from the Software Manager.

You can also use this command to install the media codecs in Linux Mint:
```
sudo apt install mint-meta-codecs

```

#### 4\. Install useful software

Once you have set up your system, it’s time to install some useful software for your daily usage. Linux Mint itself comes with a number of applications pre-installed and hundreds or perhaps thousands of applications are available in the Software Manager. You just have to search for it.

In fact, I would recommend relying on Software Manager for your application needs.

If you want to know what software you should install, I’ll recommend some [useful Linux applications][7]:

  * VLC for videos
  * Google Chrome for web browsing
  * Shutter for screenshots and quick editing
  * Spotify for streaming music
  * Skype for video communication
  * Dropbox for [cloud storage][8]
  * Atom for code editing
  * Kdenlive for [video editing on Linux][9]
  * Kazam [screen recorder][10]



For your information, not all of these recommended applications are open source.

#### 5\. Learn to use Snap [For intermediate to advanced users]

[Snap][11] is a universal packaging format from Ubuntu. You can easily install a number of applications via Snap packages. Though Linux Mint is based on Ubuntu, it doesn’t provide Snap support by default. Mint uses [Flatpak][12] instead, another universal packaging format from Fedora.

While Flatpak is integrated into the Software Manager, you cannot use Snaps in the same manner. You must use Snap commands here. If you are comfortable with command line, you will find that it is easy to use. With Snap, you can install some additional software that are not available in the Software Manager or in DEB format.

To [enable Snap support][13], use the command below:
```
sudo apt install snapd

```

You can refer to this article to know [how to use snap commands][14].

#### 6\. Install KDE [Only for advanced users who like using KDE]

[Linux Mint 19 doesn’t have a KDE flavor][15]. If you are fond of using [KDE desktop][16], you can install KDE in Linux Mint 19 and use it. If you don’t know what KDE is or have never used it, just ignore this part.

Before you install KDE, I recommend that you have configured Timeshift and taken system snapshots. Once you have it in place, use the command below to install KDE and some recommended KDE components.
```
sudo apt install kubuntu-desktop konsole kscreen

```

After the installation, log out and switch the desktop environment from the login screen.

#### 7\. Change the Themes and icons [If you feel like it]

Linux Mint 19 itself has a nice look and feel but this doesn’t mean you cannot change it. If you go to System Settings, you’ll find the option to change the icons and themes there. There are a few themes already available in this setting section that you can download and activate.

![Installing themes in Linux Mint is easy][17]

If you are looking for more eye candy, check out the [best icon themes for Ubuntu][18] and install them in Mint here.

#### 8\. Protect your eyes at night with Redshift

Night Light is becoming a mandatory feature in operating systems and smartphones. This feature filters blue light at night and thus reduces the strain on your eyes.

Unfortunately, Linux Mint Cinnamon doesn’t have built-in Night Light feature like GNOME. Therefore, Mint provides this feature [using Redshift][19] application.

Redshift is installed by default in Mint 19 so all you have do is to start this application and set it for autostart. Now, this app will automatically switch to yellow light after sunset.

![Autostart Redshift for night light in Linux Mint][20]

#### 9\. Minor tweaks to your system

There is no end to tweaking your system so I am not going to list out all the things you can do in Linux Mint. I’ll leave that up to you to explore. I’ll just mention a couple of tweaks I did.

##### Tweak 1: Display Battery percentage

I am used to of keeping a track on the battery life. Mint doesn’t show battery percentage by default. But you can easily change this behavior.

Right click on the battery icon in the bottom panel and select Configure.

![Display battery percentage in Linux Mint 19][21]

And in here, select Show percentage option.

![Display battery percentage in Linux Mint 19][22]

##### Tweak 2: Set up the maximum volume

I also liked that Mint allows setting the maximum volume between 0 and 150. You may use this tiny feature as well.

![Linux Mint 19 volume more than 100%][23]

#### 10\. Clean up your system

Keeping your system free of junk is important. I have discussed [cleaning up Linux Mint][24] in detail so I am not going to repeat it here.

If you want a quick way to clean your system, I recommend using this one single command from time to time:
```
sudo apt autoremove

```

This will help you get rid of unnecessary packages from your system.

#### 11\. Set up a Firewall

Usually, when you are at home network, you are behind your router’s firewall already. But when you connect to a public WiFi, you can have an additional security layer with a firewall.

Now, setting up a firewall is a complicated business and hence Linux Mint comes pre-installed with Ufw (Uncomplicated Firewall). Just search for Firewall in the menu and enable it at least for the Public mode.

![UFW Uncomplicated Firewall in Linux Mint 19][25]

#### 12\. Fixes and workarounds for bugs

So far I have noticed a few issues in Mint 19. I’ll update this section as I find more bugs.

##### Issue 1: Error with Flatpaks in Software Manager

major bug in the Software Manager. If you try to install a Flatpak application, you’ll encounter an error:

“An error occurred. Could not locate ‘runtime/org.freedesktop.Sdk/x86_64/1.6’ in any registered remotes”

![Flatpak install issue in Linux Mint 19][26]

There is nothing wrong with Flatpak but the Software Manager has a bug that results in this error. This bug has been fixed and should be included in future updates. While that happens, you’ll have to [use Flatpak commands][27] in terminal to install these Flatpak applications.

I advise going to [Flathub website][28] and search for the application you were trying to install. If you click on the install button on this website, it downloads a .flatpakref file. Now all you need to do is to start a terminal, go to Downloads directory and use the command in the following fashion:
```
flatpak install <name_of_flatpakref_file>

```

##### Issue 2: Edit option disabled in Shutter

Another bug is with Shutter screenshot tool. You’ll find that the edit button has been disabled. It was the same case in Ubuntu 18.04. I have already written a [tutorial for Shutter edit issue][29]. You can use the same steps for Mint 19.

#### What’s your suggestion?

This is my recommendation of things to do after installing Linux Mint 19. I’ll update this article as I explore Mint 19 and find interesting things to add to this list. Meanwhile, why don’t you share what you did after installing Linux Mint?

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-linux-mint-19/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://linuxmint.com/
[2]:https://itsfoss.com/best-linux-beginners/
[3]:https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/things-to-do-after-installing-linux-mint-19.jpeg
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/snapshot-timeshift-mint-19.jpeg
[6]:https://itsfoss.com/backup-restore-linux-timeshift/
[7]:https://itsfoss.com/essential-linux-applications/
[8]:https://itsfoss.com/cloud-services-linux/
[9]:https://itsfoss.com/best-video-editing-software-linux/
[10]:https://itsfoss.com/best-linux-screen-recorders/
[11]:https://snapcraft.io/
[12]:https://flatpak.org/
[13]:https://itsfoss.com/install-snap-linux/
[14]:https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[15]:https://itsfoss.com/linux-mint-drops-kde/
[16]:https://www.kde.org/
[17]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/theme-setting-mint-19.png
[18]:https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[19]:https://itsfoss.com/install-redshift-linux-mint/
[20]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/autostart-redshift-mint.jpg
[21]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/configure-battery-linux-mint.jpeg
[22]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/display-battery-percentage-linux-mint-1.png
[23]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/01/linux-mint-volume-more-than-100.png
[24]:https://itsfoss.com/free-up-space-ubuntu-linux/
[25]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/firewall-mint.png
[26]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/flatpak-error-mint-19.png
[27]:https://itsfoss.com/flatpak-guide/
[28]:https://flathub.org/
[29]:https://itsfoss.com/shutter-edit-button-disabled/
