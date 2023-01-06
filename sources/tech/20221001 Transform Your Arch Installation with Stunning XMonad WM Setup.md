[#]: subject: "Transform Your Arch Installation with Stunning XMonad WM Setup"
[#]: via: "https://www.debugpoint.com/xmonad-arch-linux-setup/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Transform Your Arch Installation with Stunning XMonad WM Setup
======
This article provides a step-by-step installation guide for the xmonad setup in Arch Linux with a custom pre-configured script.

### What is XMonad

The [xmonad][1] is a dynamic tiling window manager for the X Window system written in Haskell programming language. It is famous for its window automation, stability, minimal workspace features, and more unique features. With features like – multiple display support, auto window tiling management, quick keyboard navigation, and extension support, this window manager is one of the popular choices for those users who wants a productive and faster working system.

You can learn more about this window manager at [https://xmon][2][ad.org/][3].

![xmonad window manager in Arch Linux -1][4]

### XMomad Setup in Arch Linux

#### How to Install

This guide assumes that you have a functional Arch Linux system ready to follow the below steps. If you want to install Arch Linux, then you can follow our guides as below:

* [How to Install Arch Linux via archinstall (recommended)][5]
* [How to Install Arch Linux (The legacy way)][6]

For this guide, we will use [Axarva’s pre-configured xmonad script][7], which comes with xmonad, Eww (Elkowars Wacky Widgets is a standalone widget system made in Rust), rofi (window switcher), tint2 (panels and taskbar) and some cool widgets. This guide is only for physical systems and not virtual machines.

Using this personal script is best for novice Arch Linux users because it is unnecessary to go through the hassles of choosing and installing each of the above components and configure them separately.

* Ensure you are logged on to the Arch Linux system as an admin user (preferable). And connected to the internet.

* In the terminal prompt, install the following components while in the home directory.

```
sudo pacman -Syu base-devel git nano
```

* Wait for the download to complete. Then clone the following [Axarva’s repo][8] from GitHub.

```
git clone https://github.com/Axarva/dotfiles-2.0.git
```

* After the above command is complete, browse to the dotfiles-2.0 directory. Here you should see a script – `install-on-arch.sh`. Give the execute permission on this script and run. All these you can do with the below set of commands.

```
cd ./dotfiles-2.0chmod +x ./install-on-arch.sh./install-on-arch.sh
```

The above script will take some time to complete. It will download all the required packages for xmonad setup in Arch Linux. And at the end, the script will compile the entire source code that you downloaded in the first step, including xmonad and other additional utilities.

While executing, it would ask for input from you for some cases. Enter the values as per your system configuration and your preferences.

The script will ask whether your video card type is Intel, Nvidia, etc. Choose the correct option for your system. Also, when asked for the system resolution, choose the appropriate one. If you are not sure, choose the lower resolution option.

![Choose Graphics card type][9]

Choose yay (recommended). You can also choose paru if you wish. The installation of paru would take additional time due to rust download and setup. In that comparison, yay is faster and requires less time to install. An AUR (Arch User Repo) helper is also needed to compile some packages.

![Installing AUR Helper][10]

Congratulations if you reached this far. It’s time for some configuration. Once the installation is complete, you should see the below prompt.

![Xmonad installation is complete][11]

#### Configuring XMonad

Installing the xmonad window manager is not sufficient. You have to tell the Arch system where it should pick the executables and widgets.

Also, you have to manually configure to tell X Windows server to execute the main xmonad binary. When you use a stacking window system (such as GNOME, KDE Plasma, etc.), the display manager (such as lightdm) takes care of this.

* Open the `~/.bashrc` file from the terminal prompt and append the $HOME/bin.

![Updating bashrc file][12]

* Open the `~/.bash_profile` file and add startx at the beginning to start the xserver when logging in. Save and exit from the file.

![Updating bash_profile file][13]

* Open `~/.xinitrc` file and add `exec xmonad`. This file is new. Save the file once you add the command.

![Create xinitrc file][14]

* The steps are almost complete, open the `~/dotfiles-2.0/.config/alacritty.yml` file and change the font size for the terminal to something larger than the default value of 9. This is an optional step, but it’s better to change this. Save and close the file.

* Exit and log in again. And if all goes well, you should see a default xmonad desktop as below. If you want to configure further such as installing applications and other steps, proceed to the next step.

![xmonad base install in Arch Linux - before configuration][15]

### Configure the desktop

The default install in this process gives you a basic setup without the necessary applications to perform day-to-day tasks.

I have compiled a list of famous and essential software for this setup exclusively for you. This step is optional, and you can install something else as you wish. However, you can install it using the command that follows this list.

* Ristretto – Image viewer
* Feh – for changing wallpaper
* Firefox – Web Browser
* Gimp – Image processing and editor
* leafpad – simple text editor
* Thunar – File manager
* KSnip – Screenshot tool

```
pacman -S gtklib firefox leafpad libreoffice thunar ksnip ristretto gimp feh gvfs polkit-gnome
```

The `gvfs` and `polkit-gnome` packages are for Thunar and detect USB drives.

Once the applications are installed, you can add them to the bottom panel using the `tint2conf` utility. Using this utility, you can also change other desktop components, which you can figure out as you start using it.

Open a terminal by `Meta + Shift + Enter` key combination. Meta key is the Windows key in your keyboard in general. Then type `tint2conf`  and configure the panel.

You can also download a nice wallpaper and set it up using `feh`.

![xmonad window manager in Arch Linux -2][16]

Being a tiling window manager, most of the activities you need to perform via keyboard combinations.

Here’s a quick reference for you (via [github][17])

| Keybind | Function | 
| :- | :- |
| Meta + Shift + Enter | Launch terminal (alacritty) | 
| Meta + Shift + C | Close window | 
| Win + O | Open rofi menu | 
| Win + Shift + Q | Open rofi powermenu | 
| Win + S | Open sidebar | 
| Win + Shift + S | Close sidebar | 
| Win + P | Open dashboard | 
| Win + Shift + P | Close dashboard | 
| Win + B | Toggle the main bars | 
| Win + Z | Activate inhibitor (Stops autolocking) | 
| Win + Shift + Z | Dectivate inhibitor (Enables autolocking) | 
| Win + Ctrl + G | Toggle gaps (toggle to get screen space) | 
| Win + J | Navigate through windows | 
| Win + K | Navigate through windows | 
| Win + Space | Switch through layouts | 
| Win + T | Make a floating window tiled |

### Performance

These configurations and scripts mean nothing if performance is not up to the mark. So, I thought of testing the performance of the xmonad setup in Arch Linux.

My older test machine (i3, 4GB RAM, SSD, NVIDIA 340) performs fairly. I felt some performance lag, primarily because of the NVIDIA 340 driver, which is unavailable in the Arch repo. But I am sure it would perform much faster if you tested it in newer hardware.

That said, it consumed approximately 820 MB of RAM and CPU during idle state at 10% to 13%. Surprisingly it’s a little higher in my test for an idle state.

![xmonad performance in Arch Linux during idle state][18]

With that idle state metrics, I was curious about the heavy workload. So, I opened Firefox (1 tab), GIMP, Thunar, Text editor and Screenshot tool. The memory consumption shot up to 1.1 GB, and the CPU is average at 20%.

![xmonad performance in Arch Linux during heavy workflow state][19]

Overall, I think it’s using a little more resources, although it was supposed to consume less because it’s a window manager. Probably I need to test it in newer hardware.

Enjoy your xmonad setup with Arch Linux!

### Closing Notes

The xmonad is undoubtedly one of the beautiful window managers when adequately configured with several widgets. You can go ahead and try it in a physical system if you love window managers. And when appropriately configured, you can easily use it for your daily driver.

With that said, I hope this guide helps you to set up your xmonad window manager in [Arch Linux][20]. If you have any questions, let me know in the comment box below.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/xmonad-arch-linux-setup/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://xmonad.org/
[2]: https://xmonad.org/
[3]: https://xmonad.org/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/02/xmonad-window-manager-in-Arch-Linux-1-1024x575.jpg
[5]: https://www.debugpoint.com/2022/01/archinstall-guide/
[6]: https://www.debugpoint.com/2020/11/install-arch-linux/
[7]: https://github.com/Axarva/dotfiles-2.0
[8]: https://github.com/Axarva/dotfiles-2.0
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/Choose-Video-Card-type.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/02/Installing-AUR-Helper.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/02/Xmonad-installation-is-complete-1024x212.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/02/Updating-bashrc-file.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/02/Updating-bash_profile-file.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/02/Create-xinitrc-file.jpg
[15]: https://www.debugpoint.com/wp-content/uploads/2022/02/xmonad-base-install-in-Arch-Linux-before-configuration-1024x577.jpg
[16]: https://www.debugpoint.com/wp-content/uploads/2022/02/xmonad-window-manager-in-Arch-Linux-2-1024x575.jpg
[17]: https://github.com/Axarva/dotfiles-2.0#keybinds-%EF%B8%8F
[18]: https://www.debugpoint.com/wp-content/uploads/2022/02/xmonad-performance-in-Arch-Linux-during-idle-state-1024x575.jpg
[19]: https://www.debugpoint.com/wp-content/uploads/2022/02/xmonad-performance-in-Arch-Linux-during-heavy-workflow-state-1024x575.jpg
[20]: https://www.debugpoint.com/tag/arch-linux
