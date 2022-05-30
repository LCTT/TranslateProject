[#]: subject: "Things to do After Installing Ubuntu 22.04"
[#]: via: "https://itsfoss.com/things-to-do-after-installing-ubuntu-22-04/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Things to do After Installing Ubuntu 22.04
======

_**Here is a list of simple tweaks and things to do after installing Ubuntu 22.04, to get a smoother and better experience.**_

I presume that you are absolutely new to Ubuntu while sharing these tips. If you are an existing Ubuntu user, some tips may sound too elementary to you. However, you’ll still find a few good tweaks that are specific to the [new Ubuntu 22.04 features][1].

### Things to do after installing Ubuntu 22.04 LTS “Jammy Jellyfish”

Again, what I recommend here is based on my experience and preference. Yours could be different from mine. Skim around and see if you get some interesting and useful advice.

Another thing. Most of the suggestions are for the default GNOME desktop environment. If you are using the default Ubuntu, you should be good. If you have doubt, please [check the Ubuntu version][2] and [desktop environment you are using][3].

Let’s see them one by one.

#### 1\. Getting your system ready with updates and repositories

The first thing you should do after installing Ubuntu is to update it. Linux works on a local database of available packages and it needs to be synced for you to be able to install any software.

It is straightforward to [update Ubuntu][4]. You can run the software updater from the menu (press the Windows key and search for software updater):

![][5]

Now, make sure that you have [universe and multiverse repositories enabled][6]. These repositories should be enabled already, but no harm in verifying that. You’ll have access to a lot more software with these repositories.

Search for Software &amp; Updates in the menu:

![][7]

Check the boxes in front of the repositories:

![][8]

#### 2\. Install media codecs to play various kinds of media files

To play media files like MP3, MPEG4, AVI, etc, you’ll need to install media codecs. Ubuntu doesn’t install it by default because of copyright issues in various countries.

You can install these media codecs as an individual [using the Ubuntu Restricted Extra package][9]. It installs media codecs and [Microsoft True Type Fonts on your Ubuntu system][10].

You can install it by using this command:

```

    sudo apt install ubuntu-restricted-extras

```

If you encounter the EULA or the license screen, remember to use the tab key to select between the options and then hit enter to confirm your choice.

![Press tab to select OK and press enter][11]

#### 3\. Install applications of your choice from the software center or the web

A fresh installed Ubuntu system will have only a limited set of necessary applications installed.

For the rest, you can find them in the software center, through the apt package manager, or get them from their official websites.

Look into the software center first and see if the application is available here.

![][12]

Some applications provide an easy-to-use DEB file on their website. For example, to [install Google Chrome on Ubuntu][13], you can download it from its official website.

Usually, you double-click on the deb file and install the application using the software center. If it opens the deb file in archive manager, [use this trick][14] to make it work.

#### 4\. Enjoy gaming on Linux with Steam Proton

There are plenty of tools that allow you to play games on Linux. Steam is perhaps the most convenient, mainstream way of getting thousands of games.

[Install Steam on Ubuntu][15] and [enable Steam Play][16]. You should have access to a good set of games, provided your system has enough hardware configuration to run all kinds of games.

Needs some suggestions? Check this list of [indie games for Linux users][17].

#### 5\. Get familiar with auto-updates

Your Ubuntu system automatically checks for system updates and installs them automatically when needed.

This check happens when your system starts. If you try to perform a system update or install an application at this time, you’ll see a warning or message to wait.

You can control the auto-updates behavior if you like.

![][18]

#### 6\. Give your Ubuntu a different color

Ubuntu 22.04 gives you the ability to choose a different color than the usual orange. There are nine other colors to choose from. From the Settings-Appearance, select the color you want and it will give change the accent color of your system.

![][19]

#### 7\. Get familiar with the new screenshot tool

Ubuntu 22.04 has a new screenshot tool that also includes the screencast (video recording of desktop) option.

When you press the Print Screen button to take the screenshot, it opens the UI and gives you the option to take the screenshot of the selected area, entire screen, or current application window. The screenshots are copied to the clipboard and saved to the Screenshots folder under the Pictures directory.

![][20]

You can also record the screen with the screencast option available in the same interface (click the video camera icon). It lets you record the entire screen and works very well under Wayland.

#### 8\. Experiment with the dock

Go to the Appearance Settings and you’ll see the option for disabling Panel mode.

![][21]

This will shrink the launcher on the left side and make it look like the Vanilla GNOME launcher. You should use it with ‘auto-hide’ option for better experience.

You may [move the launcher to the bottom][22] or the right side if you like. There are plenty of [ways to customize the dock in Ubuntu][23].

#### 9\. Get GNOME Tweaks tool for additional customization

Though the system settings application now includes several new options, [GNOME Tweaks still provides additional customization options][24].

With GNOME Tweaks, you can move the windows control button on the left, change themes, change the lock screen background, etc. More on its usage later. For the moment, just get this tool from the software center or use the apt command.

![][25]

#### 10\. Minimize to click

When you click an icon in the launcher, it opens the application. You click the icon again and nothing happens.

I don’t like this. I prefer that when I click on the icon of an application in focus, it gets minimized.

If you share the same preference, use this command in the terminal to [enable minimize on click in Ubuntu][26]:

```

    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

```

#### 11\. Get familiar with the terminal

![][27]

Speaking of the terminal, please don’t be too scared of this awesome tool. I know that the command line gives cold feet to many new Linux users. However, knowing a little could help you big in long run.

I am not going to teach you the basics of the Linux command line here. Though I have written a pretty good post that tells you several [useful information on using the terminal in Ubuntu][28]. You should read the article even if you can use the terminal every now and then.

#### 12\. Few tweaks for laptop users

If you are using Ubuntu 22.04 on a laptop, here are a few tips on improving your performance and getting rid of annoyances.

You’ll notice that you have to press the left touchpad button for the left mouse button action. This is annoying. Enable the tap for click option and just tap the touchpad anywhere to get the left mouse click.

![][29]

From the Power settings, **enable the battery percentage display** to keep a track of the remaining battery on your laptop.

![][30]

Since you’ll be using your system on battery power, **choose an appropriate power profile** under the Power settings.

![][31]

This is perhaps not entirely for laptop users. By default, Ubuntu locks the screen after 5 minutes of inactivity and puts the system in suspend mode after 20 minutes of activity.

I don’t like entering my password so frequently. I **prefer to lock the screen at my convenience**. If you share the same feeling, you can also disable this behavior.

![][32]

#### 13\. Disable characters from GNOME search

The GNOME Search is an excellent tool for finding installed applications, files, etc. However, you’ll notice that it often shows matching ‘characters’.

![Emojis Desktop Search Ubuntu][33]

Actually, your Ubuntu system has built-in emoji support. Apart from the regular emoticons, the system also has support for letters in various languages like Thai, Latin, Vietnamese, etc.

When you search for something, the term could also match these special characters. Click on it and it gets copied to the clipboard and you can paste them wherever you want.

If you are not going to use this feature, you should disable the characters’ search.

![][34]

#### 14\. Use the night light feature to reduce eye strain at night

My favorite feature and I am glad it now works in the multi-monitor settings as well.

[Enable the night light feature][35] so that it adds a yellow tint to the screen which is less pinching than the white light at night.

Go to Settings -> Displays, switch to Night Light tab, and enable it. You can also set the ‘yellowness’ as per your liking.

![][36]

#### 15\. Enable fractional scaling if you’ve got a 4K screen

If you have a 2K or 4K screen, you’ll find that the icons, fonts and folders look too small. You should enable the fractional scaling and scale the size that suits your preference.

![][37]

#### 16\. Know that you have the option to go back to Xorg

Ubuntu 22.04 defaults to Wayland once again if you don’t have an Nvidia system. Wayland is the modern replacement of the legacy x server and it works very well with the newer GNOME components.

However, some older applications may not work properly under Wayland. For example, most screen recording tools don’t support Wayland yet.

If you encounter such a situation where a must-use application doesn’t work in Wayland, log out from the session and click on the gear icon in the bottom right to [switch to the X display session][38].

#### 17\. Classic GNOME is still available

Speaking of options, you can also access the classic GNOME. If you are not aware, the classic GNOME or GNOME version 2 was a popular desktop choice before GNOME 3 arrived with radical new changes around 2011.

GNOME 2 gave birth to the Cinnamon and MATE desktop environment because its die-hard users just didn’t want to give up on the classic interface. Perhaps that’s the reason why GNOME Classic has always been a part of Ubuntu even though it moved to Unity and (modern) GNOME.

Though it says classic, it doesn’t look as dated as it was in 2010.

![GNOME Classic][39]

When you log out of the system, click on the user name and you should see a gear symbol at the bottom. Click on it and you should see the classic GNOME option here.

#### 18\. Know about cleaning your system

The classic apt autoremove command is a good way to remove packages that are not required anymore.

```

    sudo apt autoremove

```

I think it is also part of the software updater tool now meaning it runs the autoremove command after running updates or so I have noticed.

Apart from that, there are a [few more ways to clean up your Ubuntu system][40]. GUI tools like Stacer are now available in the repositories and you may use them to clean your system without going into the command line.

#### 19\. Master the keyboard shortcuts

I am not asking you to ditch the mouse altogether but trust me on this using the keyboard shortcut saves plenty of time.

From the application switcher to opening the terminal, things feel a lot faster with the correct shortcuts at your finger.

![keyboard switching with key shortcut in Ubuntu][41]

I have an entire article dedicated to [keyboard shortcuts in Ubuntu][42]. Feel free to check that out.

#### 20\. Use the ‘do not disturb mode to focus on work

There are plenty of productivity tools available for Ubuntu but this little hack is my favorite.

When I am working on something that requires my complete focus, like writing this article, I enable the Do Not Disturb mode.

![][43]

With that, the notifications from messaging services stop appearing on the screen and I don’t get distracted. Once I am back to relaxed working, I disable it again.

#### 21\. Get back the original Firefox or go for some other browser

Ubuntu 22.04 Jammy Jellyfish comes with the Snap version of Firefox. It takes longer to start and forces you to log in to the accounts again and again.

Try the Snap version of Firefox first. If it works for you, good. If not and you feel fed up with the Firefox experience, you have two options:

  * Switch to another browser like Brave, Vivaldi, LibreWolf, etc
  * Switch to Firefox ESR or a non-Snap version of Firefox



Firefox ESR (extended support release) doesn’t come with the latest feature like the regular Firefox but it is maintained for security and stability fixes.

There are a couple of ways of [getting the non-Snap version of Firefox][44] as described by Jim at Ubuntu Handbook. However, it is slightly more complicated than just adding a PPA.

#### 22\. Get missing Windows back if you use a dual boot system

During the early testing of Ubuntu 22.04, I noticed a known bug that came with the new Grub 2.6. It had disabled the os-prober by default. This means that Grub won’t check for the presence of other operating systems. In other words, it won’t see Windows (or other Linux distributions) if you opted for a dual boot system.

Now, I haven’t checked if this issue has been fixed or not but if you face this issue with your dual boot system, then edit the /etc/default/grub file to add GRUB_DISABLE_OS_PROBER=false to this file. Save this file, [update grub][45] and Grub should see other operating systems now.

#### Where to go from here?

![][46]

Honestly, you could do a lot more even after you have done all the points I mentioned in this list here. There is no end to things you could do after installing Ubuntu 22.04.

If you are new, there is plenty to explore. If you are an experienced one, you could still spend considerable time tweaking and setting up your system as per your liking.

It all comes down to personal preference. Some people would just do some basic changes and go on with using the operating system. Some folks would spend hours setting everything to perfection.

Now that I have finished my recommendations, I would like your views. Did you find some useful tips here? What other usual stuff do you do after installing Ubuntu?

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-ubuntu-22-04/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-22-04-release-features/
[2]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[3]: https://itsfoss.com/find-desktop-environment/
[4]: https://itsfoss.com/update-ubuntu/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/software-updater-ubuntu-22-04.jpg
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://itsfoss.com/wp-content/uploads/2022/04/software-and-updates-tool.jpg
[8]: https://itsfoss.com/wp-content/uploads/2022/04/enable-additional-repo-ubuntu-22-04.jpg
[9]: https://itsfoss.com/install-media-codecs-ubuntu/
[10]: https://itsfoss.com/install-microsoft-fonts-ubuntu/
[11]: https://itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg
[12]: https://itsfoss.com/wp-content/uploads/2022/04/ubuntu-software-center-22-04-800x539.png
[13]: https://itsfoss.com/install-chrome-ubuntu/
[14]: https://itsfoss.com/cant-install-deb-file-ubuntu/
[15]: https://itsfoss.com/install-steam-ubuntu-linux/
[16]: https://itsfoss.com/steam-play/
[17]: https://itsfoss.com/best-indie-rpg-games-linux/
[18]: https://itsfoss.com/wp-content/uploads/2020/04/auto-updates-ubuntu-800x361.png
[19]: https://itsfoss.com/wp-content/uploads/2022/03/ubuntu-22-04-appearance-settings.png
[20]: https://news.itsfoss.com/wp-content/uploads/2022/03/ubuntu-22-04-screenshot-ui.jpg
[21]: https://itsfoss.com/wp-content/uploads/2022/04/panel-mode-ubuntu-22-800x529.png
[22]: https://itsfoss.com/move-unity-launcher-bottom/
[23]: https://itsfoss.com/customize-ubuntu-dock/
[24]: https://itsfoss.com/gnome-tweak-tool/
[25]: https://itsfoss.com/wp-content/uploads/2020/04/gnome-tweaks-tool-ubuntu-20-04-800x551.png
[26]: https://itsfoss.com/click-to-minimize-ubuntu/
[27]: https://itsfoss.com/wp-content/uploads/2021/12/linux-terminal-introduction.png
[28]: https://itsfoss.com/basic-terminal-tips-ubuntu/
[29]: https://itsfoss.com/wp-content/uploads/2022/04/tap-to-click-ubuntu-22-800x483.png
[30]: https://itsfoss.com/wp-content/uploads/2022/04/show-battery-percentage-ubuntu-22-800x489.png
[31]: https://itsfoss.com/wp-content/uploads/2022/04/ubuntu-22-04-new-power-profile-800x489.png
[32]: https://itsfoss.com/wp-content/uploads/2022/04/Power-Settings-in-Ubuntu.jpg
[33]: https://itsfoss.com/wp-content/uploads/2020/04/emojis-desktop-search-ubuntu.jpg
[34]: https://itsfoss.com/wp-content/uploads/2020/04/search-settings-control-ubuntu-800x534.png
[35]: https://itsfoss.com/night-shift-flux-ubuntu-linux/
[36]: https://itsfoss.com/wp-content/uploads/2020/04/nightlight-ubuntu-20-04.png
[37]: https://itsfoss.com/wp-content/uploads/2022/04/fractional-scaling-in-ubuntu-22-04-800x674.png
[38]: https://itsfoss.com/switch-xorg-wayland/
[39]: https://itsfoss.com/wp-content/uploads/2022/04/gnome-classic-ubuntu-22-800x450.png
[40]: https://itsfoss.com/free-up-space-ubuntu-linux/
[41]: https://itsfoss.com/wp-content/uploads/2022/02/keyboard-switch-shortcut-ubuntu.jpeg
[42]: https://itsfoss.com/ubuntu-shortcuts/
[43]: https://itsfoss.com/wp-content/uploads/2022/04/don-not-disturb-ubuntu-22.jpg
[44]: https://ubuntuhandbook.org/index.php/2022/04/install-firefox-deb-ubuntu-22-04/
[45]: https://itsfoss.com/update-grub/
[46]: https://itsfoss.com/wp-content/uploads/2022/04/ubuntu-22-04-neofetch-lolcat-800x445.png
