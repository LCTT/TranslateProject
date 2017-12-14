translating by lujun9972
How to Play World of Warcraft On Linux With Wine
======

### Objective

Install and run Word of Warcraft on Linux

### Distributions

This will work with nearly all Linux distributions.

### Requirements

A working Linux install with root privileges and a somewhat modern graphics card with the latest graphics drivers installed.

### Difficulty

Easy

### Conventions

  * **#** \- requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
  * **$** \- given command to be executed as a regular non-privileged user



### Introduction

World of Warcraft has been around for almost thirteen years, and it's still easily the most popular MMORPG. Unfortunately, after all that time Blizzard never released an official Linux client. It's not all bad, tough. Wine has you covered.

### Install Wine

You can try regular Wine, but it's not the best for getting the latest improvements in gaming performance. Wine Staging and Wine with the Gallium Nine patches are almost universally better. If you're using proprietary drivers, Wine Staging is the best option. For Mesa drivers, make sure that Gallium Nine support is compiled in(it probably is), and use Wine with the Gallium patches.

Refer to our

### Winecfg

Open up `winecfg`. On the first tab, make sure the that version of Windows is set to `Windows 7`. Blizzard dropped support for all prior versions. Next, head to the "Staging" tab. The options you choose here depend on whether you're running the staging or Gallium patches.

![Winecfg Staging Settings][1]
Everyone should check the boxes to enable VAAPI and EAX. Hiding the Wine version is up to you.

If you're using the Staging patches, check the box to enable CSMT. If you're on Gallium Nine, check that box. You can't have both.

### Winetricks

This next part requires Winetricks. If you're not familiar with it, Winetricks is a script that you can use to install various Windows libraries and components in Wine to help programs run. You can read more about it in our

![Winetricks Corefonts Installed][2]
There are only a couple of things that you need to get WoW, and more importantly the Battle.net launcher, to work. First, install `corefonts` under the "Fonts" section. This next part is optional, but if you want all of the data from the Internet to display in the Battle.net client, you need to install `ie8` from the DLL section.

### Battle.net

Now that you have Wine set up and ready, you can install the Battle.net app. The Battle.net app serves as the installer and update utility for WoW and other Blizzard games. It's also known for misbehaving after updates. Be sure to check

You can download the Battle.net app from

When the download completes, open the `.exe` with Wine, and follow the install instructions. Everything here should go normally and will be exactly the same as running it natively on Windows.

![Battle.net Launcher With WoW Installed][3]
After the app is done installing, sign in or create your account. It'll then take you to the launcher where you can install and manage your games. Start installing WoW. It will take a while.

### Launch The Game


![WoW Advanced Settings][4]
You should be able to start up WoW with the "Play" button in the Battle.net app. It'll take a few minutes for the login screen to appear, and it'll probably perform like garbage. That's because WoW uses DX11 by default now. Head to the settings, and under the "Advanced" tab, set the graphics API to DX9. Save, and exit the game. Open it back up again after it exists successfully

The game should be playable now. Keep in mind that performance will be highly dependent on your hardware. WoW is a CPU bound game, and Wine adds additional CPU overhead. If you don't have a powerful CPU, you'll probably be feeling the negative effects. WoW does have low presets, though, so you can tune down the graphics to get it working.

#### Performance Tuning


![WoW Graphics Settings][5]
It's really hard to say what settings will work best for you and your system. WoW has a very simple sliding scale in the basic settings. If you've been playing on Windows, drop it by a couple of levels. The performance simply isn't as good.

Always try turning down the obvious culprits first. Settings like anti-aliasing and particles are usually to blame for poor performance. Also, take a look at windowed vs. fullscreen. Sometimes it's amazing how much of a difference there is between the two.

WoW also has an option for raid and battleground settings. This creates a separate set of options for more graphically intense content in raid and battleground instances. Sometimes WoW performs great in the open world, but drops to trash when there's a lot of players on screen.

Experiment and see what works best for your system. It all depends on your hardware and your system configuration.

### Closing Thoughts

World of Warcraft has never been released for Linux, but it has worked in Wine for years. In fact, it's hard to think of any time when it hasn't worked. There have even been rumors that Blizzard developers test it in Wine to make sure that it remains functional.

With that said, changes and patches do impact this venerable game, so always be on your toes if something breaks. Regardless, there is almost always a solution right around the corner, you just need to find it.


--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-play-world-of-warcraft-on-linux-with-wine

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:https://linuxconfig.org/images/wow-wine-staging.jpg
[2]:https://linuxconfig.org/images/wow-wine-corefonts.jpg
[3]:https://linuxconfig.org/images/wow-bnet.jpg
[4]:https://linuxconfig.org/images/wow-api.jpg
[5]:https://linuxconfig.org/images/wow-settings.jpg
