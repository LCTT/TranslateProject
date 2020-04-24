[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (16 Things to do After Installing Ubuntu 20.04)
[#]: via: (https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

16 Things to do After Installing Ubuntu 20.04
======

_**Here is a list of tweaks and things to do after installing Ubuntu 20.04, to get a smoother and better desktop Linux experience.**_

[Ubuntu 20.04 LTS brings plenty of new features][1] and visual changes. If you choose to install Ubuntu 20.04, let me show you a few recommended steps that you can follow to get started with it.

### 16 Things to do after installing Ubuntu 20.04 LTS “Focal Fossa”

![][2]

The steps I am going to mention here are my recommendation. You may ignore a few customization or tweaks if they don’t suit your need and interest.

Similarly, some steps may seem too simple but essential for someone completely new to Ubuntu.

A number of suggestions here are suited for the default Ubuntu 20.04 with GNOME desktop. So please check [which Ubuntu version][3] and [which desktop environment][4] you are using.

Let’s get started with the list of things to do after installing Ubuntu 20.04 LTS codenamed Focal Fossa.

#### 1\. Get your system ready by updating and enabling additional repos

The first thing you should do after installing Ubuntu or any other Linux distribution is to update it. Linux works on a local database of available packages. And this cache needs to be synced in order for you to be able to install any software.

It is very easy to update Ubuntu. You can run the software updater from the menu (press Windows key and search for software updater):

![Software Updater in Ubuntu 20.04][5]

You may also use the following command in the terminal to update your system:

```
sudo apt update && sudo apt upgrade
```

Next, you should make sure that you have [universe and multiverse repositories enabled][6]. You’ll have access to a lot more software with these repositories. I also recommend reading about [Ubuntu repositories][6] to learn the basic concept behind it.

Search for Software &amp; Updates in the menu:

![Software & Updates Settings][7]

Make sure to check the boxes in front of the repositories:

![Enable additional repositories][8]

#### 2\. Install media codecs to play MP3, MPEG4 and other media files

If you want to play media files like MP3, MPEG4, AVI etc, you’ll need to install media codecs. Ubuntu doesn’t install it by default because of copyright issues in various countries.

As an individual, you can install these media codecs easily [using the Ubuntu Restricted Extra package][9]. This will install media codecs, Adobe Flash player and [Microsoft True Type Fonts in your Ubuntu system][10].

You can install it by [clicking this link][11] (it will asked to be open in software center) or use this command:

```
sudo apt install ubuntu-restricted-extras
```

If you encounter the EULA or the license screen, remember to use the tab key to select between the options and then hit enter to confirm your choice.

![Press tab to select OK and press enter][12]

#### 3\. Install software from the software center or the web

Now that you have set up the repositories and updated the package cache, you should start installing software that you need.

There are several ways of [installing applications in Ubuntu][13]. The easiest and the official way is to use the Software Center.

![Ubuntu Software Center][14]

If you want some recommendation about software, please refer to this extensive [list of Ubuntu applications for different purposes][15].

Some software vendors provide .deb files to easily install their application. You may get the deb files from their website. For example, to [install Google Chrome on Ubuntu][16], you can get the deb file from its website and double click on it to start the installation.

#### 4\. Enjoy gaming with Steam Proton and GameMode

[Gaming on Linux][17] has come a long way. You are not restricted to a handful of games included by default. You can [install Steam on Ubuntu][18] and enjoy a good number of games.

[Steam’s new P][19][r][19][oton project][19] enables you to play a number of Windows-only games on Linux. In addition to that, Ubuntu 20.04 comes with [Feral Interactive’s GameMode][20] installed by default.

The GameMode automatically adjust Linux system performance to give more priority to games than other background processes.

This means some games that support the GameMode (like [Rise of Tomb Raiders][21]) should have improved performance on Ubuntu.

#### 5\. Manage auto-updates (for intermediate and experts)

Recently, Ubuntu has started to automatically download and install security updates that are essential to your system. This is a security feature as a regular user, you should leave it as it is,

But if you like to do everything on your own and this auto-update is frequently leading you to [“Unable to lock the administration directory” error][22], maybe you can change the auto updates behavior.

You can opt for the Show immediately so that it notifies you of security updates as soon as they are available instead of automatically installing.

![Control the auto updates settings][23]

#### 6\. Control automatic suspend and screenlock for laptops

If you are using Ubuntu 20.04 on a laptop then you may want to pay attention to a few power and screenlock settings.

If your laptop is on battery mode, Ubuntu will suspend the system after 20 minutes of inactivity. This is done to save battery power. Personally, I don’t like it and thus I disable it.

Similarly, if you leave your system for a few minutes, it automatically locks the screen. I don’t like this behavior as well so I prefer disabling it.

![Power Settings in Ubuntu 20.04][24]

#### 7\. Enjoy dark mode

One of the [most talked about features of Ubuntu 20.04][25] is the dark mode. You can enable the dark mode by going into Settings and selecting it under Appearance section.

![Enable Dark Theme Ubuntu][26]

You may have to do some [additional tweaking to get full dark mode in Ubuntu 20.04][27].

#### 8\. Control desktop icons and launcher

If you want a minimal looking desktop, you can disable the icons on the desktop. You can also disable the launcher from the left side and the appindicators in the top panel.

All this can be controlled via the new GNOME Extensions that is already available by default.

![][28]

By the way, you can also change the position of the launcher to the bottom or to the right by going to the Settings-&gt;Appearance.

#### 9\. Use emojis (smileys) and special characters or disable it from the search

Ubuntu provides an easy way to use smiley or the emoticons. There is a dedicated application called Characters installed by default. It basically gives you [Unicode][29] of the emojis.

Not only emojis, you can use it to get the unicode for French, German, Russian and Latin characters. Clicking on the symbol gives you the opportunity to copy the unicode and when you paste this code, your chosen symbol should be typed.

![Emoji Ubuntu][30]

You’ll find these special characters and emoticons appearing in the desktop search as well. You can copy them from the search results as well.

![Emojis appear in desktop search][31]

If you don’t want to see them in search results, you should disable their access to the search feature. The next section discuss how to do that.

#### 10\. Master the desktop search

The GNOME desktop has a powerful search feature. Most people use it for searching installed applications but it is more than just that.

Press the super key (Windows key) and search for something. It will show any applications that matches that search term, followed by system settings and matching applications available in the software center.

![Desktop search][32]

Not only that, the search can also find text inside files. If you are using the calendar, it can also find your meetings and reminders. You can even do quick calculations in the search and copy its result.

![Quick Calculations Ubuntu Search][33]

You can control what can be searched and in which order by going into Settings.

![][34]

#### 11\. Use nightlight feature to reduce eye strain at night

If you use your computer or smartphone at night, you should use the night light feature to reduce eye strain. I feel that it helps a lot.

The night light feature adds a yellow tint to the screen which is less pinching than the white light.

You can enable night light in the Settings -&gt; Displays and switching to Night Light tab. You can set the ‘yellowness’ as per your liking.

![Nightlight feature][35]

#### 12\. Got a 2K/4K screen? Use fractional scaling to get bigger icons and fonts

If you feel that the icons, fonts, folders everything looks too small on your HiDPI screen, you can take advantage of the fractional scaling.

Enabling fractional scaling gives you more options to increase the size between 100% to 200%. You can choose the scaling size that suits your preference.

![Enable fractional scaling from Settings -> Displays][36]

#### 13\. Explore GNOME Extensions to extend the usability of GNOME desktop

The GNOME desktop has tiny plugins or add-ons called Extensions. You should [learn to use GNOME extensions][37] to extend the usability of your system.

As you can see in the image below, the weather extension shows the weather information in the top panel. A tiny but useful thing. You may also take a look at some of [best GNOME extensions][38] here. Don’t install all of them, use only those that are useful to you.

![Weather Extension][39]

#### 14\. Enable ‘do not disturb’ mode and focus on work

If you want to concentrate on work, disabling desktop notifications would come handy. You can easily enable ‘do not disturb’ mode and mute all notifications.

![Enable ‘Do Not Disturb’ to get rid of desktop notifications][40]

These notifications will still be in the message tray so that you can read them later but they won’t pop up on the desktop anymore.

#### 15\. Clean your system

This is something you don’t need to do right after installing Ubuntu. But keeping it in mind will help you.

Over the time, your system will have significant amount of packages that won’t be needed anymore. You can remove them all in one go with this command:

```
sudo apt autoremove
```

There are other [ways to clean Ubuntu to free disk space][41] but this is the easiest and safest.

#### 16\. Tweak and customize the GNOME desktop to your liking

I highly recommend [installing GNOME Tweaks tool][42]. This will give you access to a few additional settings to tweak.

![Gnome Tweaks Tool][43]

For example, you can [display battery percentage][44], [fix right click in touchpad issue][45], change shell theme, change mouse pointer speed, display date and week numbers, change application window behavior etc.

There is no end to customization and I cannot probably most of them here. This is why I recommend [reading these articles][42] about [customizing GNOME desktop][46].

You can also [install new themes in Ubuntu][47] though personally, I like the default theme in this release. This is the first time that I have stuck with the default icons and theme in an Ubuntu release.

#### What do you do after installing Ubuntu?

If you are an Ubuntu beginner, I recommend [going through this collection of Ubuntu tutorials][48] to get started with it.

So these were my recommendations. What are the steps you follow after installing Ubuntu? Share your favorite things and I might update this article with your suggestions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/things-to-do-after-installing-ubuntu-20-04.jpg?ssl=1
[3]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updater-ubuntu-20-04.jpg?ssl=1
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updates-settings-ubuntu-20-04.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/extra-repositories-ubuntu-20.jpg?ssl=1
[9]: https://itsfoss.com/install-media-codecs-ubuntu/
[10]: https://itsfoss.com/install-microsoft-fonts-ubuntu/
[11]: https://ubuntu-restricted-extras/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg?ssl=1
[13]: https://itsfoss.com/remove-install-software-ubuntu/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-center-ubuntu-20.png?resize=800%2C509&ssl=1
[15]: https://itsfoss.com/best-ubuntu-apps/
[16]: https://itsfoss.com/install-chrome-ubuntu/
[17]: https://itsfoss.com/linux-gaming-guide/
[18]: https://itsfoss.com/install-steam-ubuntu-linux/
[19]: https://itsfoss.com/steam-play/
[20]: https://github.com/FeralInteractive/gamemode
[21]: https://en.wikipedia.org/wiki/Rise_of_the_Tomb_Raider
[22]: https://itsfoss.com/could-not-get-lock-error/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/auto-updates-ubuntu.png?resize=800%2C361&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/power-settings-ubuntu-20-04.png?fit=800%2C591&ssl=1
[25]: https://www.youtube.com/watch?v=lpq8pm_xkSE
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-dark-theme-ubuntu.png?ssl=1
[27]: https://itsfoss.com/dark-mode-ubuntu/
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/disable-dock-ubuntu-20-04.png?ssl=1
[29]: https://en.wikipedia.org/wiki/List_of_Unicode_characters
[30]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/emoji-ubuntu.jpg?ssl=1
[31]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/emojis-desktop-search-ubuntu.jpg?ssl=1
[32]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-desktop-search-1.jpg?ssl=1
[33]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/quick-calculations-ubuntu-search.jpg?ssl=1
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/search-settings-control-ubuntu.png?resize=800%2C534&ssl=1
[35]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/nightlight-ubuntu-20-04.png?ssl=1
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/fractional-scaling-ubuntu.jpg?ssl=1
[37]: https://itsfoss.com/gnome-shell-extensions/
[38]: https://itsfoss.com/best-gnome-extensions/
[39]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/weather-extension-ubuntu.jpg?ssl=1
[40]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/do-not-distrub-option-ubuntu-20-04.png?ssl=1
[41]: https://itsfoss.com/free-up-space-ubuntu-linux/
[42]: https://itsfoss.com/gnome-tweak-tool/
[43]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/gnome-tweaks-tool-ubuntu-20-04.png?fit=800%2C551&ssl=1
[44]: https://itsfoss.com/display-battery-ubuntu/
[45]: https://itsfoss.com/fix-right-click-touchpad-ubuntu/
[46]: https://itsfoss.com/gnome-tricks-ubuntu/
[47]: https://itsfoss.com/install-themes-ubuntu/
[48]: https://itsfoss.com/getting-started-with-ubuntu/
