Super Pi Brothers
================================================================================
I don't game as much as I used to. Although I've certainly spent countless hours of my life in front of a Nintendo, SNES, or after that, playing a first-person shooter on my computer (Linux only, thank you), these days, my free time tends to go toward one of the many nongaming hobbies I've accumulated. Recently though, I found myself dusting off my Wii console just so I could play an NES and SNES game I re-purchased for it. The thing is, those games require using a somewhat strange controller, and I already have a modified SNES controller that can connect over USB. That was enough to encourage me to search for a better solution. Of course, I simply could connect three or four consoles and stack up games in my living room, but I've grown accustomed to ripping my CDs and DVDs and picking what I want to listen to or watch from a central media center. It would be nice if I didn't have to get up and find a cartridge every time I wanted to switch games. This, of course, means going with emulation, but although in the past I'd had success with a modified classic Xbox, I didn't have that hardware anymore. I figured someone must have gotten this set up on the Raspberry Pi, and sure enough, after a brief search and a few commands, I had a perfect retro-gaming arcade set up on a spare Raspberry Pi.

One nice thing about the Raspberry Pi project is the large number of people out there with identical hardware. For me, that meant instead of having to go through someone else's instructions, knowing I'd likely have to tweak it to suit my setup, I basically could follow someone else's guide verbatim. In my case, I found the RetroPie project, which wrapped up all of the commands you would need to install everything on a Raspberry Pi into a single large script. At the end, you have the RetroArch project fully installed and configured, which includes all of the major emulators you'd want and a centralized method to configure them, plus an EmulationStation graphical front end the Pi can boot directly into that makes it simple to navigate to the game you want, all from a gamepad.

### Install RetroPie ###

Before you install RetroPie, you will want to make sure your Raspbian distribution (the default Linux distribution for a Raspberry Pi, and the one this project assumes you will use) is completely up to date, including any new firmware images. This just means a few common `apt` commands. Although you certainly could connect a keyboard to your Raspberry Pi for this step, I've found it more convenient to `ssh` in to the device so I could copy and paste commands:

    $ sudo apt-get update
    $ sudo apt-get -y upgrade

Now that the Raspberry Pi is up to date, make sure the git and dialog packages are installed, and then use git to download RetroPie:


    $ sudo apt-get -y install git dialog
    $ cd
    $ git clone --depth=0 
     ↪git://github.com/petrockblog/RetroPie-Setup.git

This will create a RetroPie-Setup directory containing the main setup script. Now you just need to go inside that directory and execute it:

    $ cd RetroPie-Setup
    $ chmod +x retropie_setup.sh
    $ sudo ./retropie_setup.sh

This script presents you with an in-terminal menu (Figure 1) where you can choose to perform a binary installation or source installation, set up RetroPie, or perform a series of updates for the RetroPie setup script and binaries. Choose either the binary or source installation. The binary installation won't take as much time, but you may risk running older versions of some of the software. The source installation requires you to compile software, so it takes longer, but at the end, you will have the latest possible versions of everything. Personally, I opted for the binary install, knowing I always could re-run the script and go with the source install if I found any problems.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/medium-350px-centered/u1002061/11576f1.png)

#### Figure 1. RetroPie Setup Menu ####

This part of the process will take quite some time on a vanilla Raspbian image, as there are a lot of different packages to download and install. Once the installation completes, go back to the main RetroPie setup screen and select SETUP from the main menu. In this submenu, you can tweak settings, such as whether to start EmulationStation from boot (recommended) and whether to enable a splash screen. In my case, I enabled both settings as I intended my device to be a standalone emulation machine. Note that if you do allow EmulationStation to start up from boot, you still can always ssh in to the machine and run the original RetroPie configuration script to change the settings.

### Adding ROMs ###

You also can add ROMs within the RetroPie setup screen. If you choose the Samba method in the menu, you then can locate a local Samba mountpoint on your network, and you can copy ROMs from that. With the USB stick method, RetroPie will generate a directory structure on a USB stick that you plug in to your Raspberry Pi that represents the different emulators it supports. After this point, you can take that USB stick to another computer and copy ROMs over to the appropriate directory, and the next time you plug it in to the Raspberry Pi, it automatically will sync the files over. Finally (and this is what I did), you just can use scp or rsync to copy over ROMs to the appropriate directory under ~/RetroPie/roms/. So for instance, NES games would be copied to ~/RetroPie/roms/nes/.

Once you are done with the configuration and exit out of the RetroPie setup script, you will want to reboot back into EmulationStation, but before you do, you should reconfigure the memory split on the Raspberry Pi so that it is set to 192 or 128, so run:


    $ sudo raspi-config

and go to the Advanced Settings to change the memory split setting. Now you can reboot safely.

### EmulationStation ###

Once you reboot, you should be greeted with the initial EmulationStation screen, which will prompt you to set up your joystick, gamepad or keyboard buttons so it can work with the EmulationStation menu. Note that this doesn't affect how your controllers work within games, just within the EmulationStation menu. After your controller or controllers are set up, you should be able to press right and left on your controller to switch between the different emulator menus. In my case, all of the buttons on my gamepad were going to be used within games, so I made a point to bind a key on a separate keyboard to the menu function so I could exit out of games when I was done without having to reboot the Raspberry Pi.

EmulationStation will show you only menus that represent emulators for which it has detected ROMs, so if you haven't copied ROMs for a particular emulator yet, you will want to do that and potentially restart your Raspberry Pi before you can see them. Also, by default, your controller will not be configured for any games, but if you press the right arrow enough times within EmulationStation, you will get to an input configuration screen that allows you to map keys on your controller to keys inside a game. The nice thing about this setup is that after you configure the keys, it will apply appropriately within each emulator.

That's it. From this point, you can browse through your collection of games and press whatever button you bound to Accept to start playing. At first I was concerned the Raspberry Pi wouldn't have the horsepower to play my games, but so far, it has been able to play any games I tried without a problem.

### Resources ###

The RetroPie Project: [http://blog.petrockblock.com/retropie][1]

RetroPie Installation Docs: [https://github.com/petrockblog/RetroPie-Setup][2]

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/super-pi-brothers

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blog.petrockblock.com/retropie
[2]:https://github.com/petrockblog/RetroPie-Setup