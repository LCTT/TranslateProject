@乌龙茶 翻译中
How To Install Icon Themes In Linux Mint 16 [Beginner Tip]
================================================================================
If you think the default Mint themes and icons are not good enough for you, why not change it? In this quick tip for beginners, we shall see how to **install icon themes in Linux Mint 16** and more than that **how to change the icons in Linux Mint**. We shall see this quick tutorial by installing gorgeous Moka icon themes.

Just a quick note, if you do not know it already, there is a difference between ‘themes’ and ‘icon themes’. An icon theme just changes the look of icons while a theme changes a lot of other things along with the looks of icons.

### Install icon themes in Linux Mint 16: ###

There are two ways to install icon themes in Linux Mint (and many other Linux distributions, if not all). If you download the icon theme in a zipped folder, you can extract it in ~/.icons directory. Usually this directory does not exist. Feel free to create it.

Second way to install an icon theme is using a [PPA][1]. Most of the standard and popular icon themes have their own PPA. Lets see how to install Moka icons set in Mint using PPA.

### Install Moka icon set in Linux Mint 16: ###

Open a terminal (Ctrl+Alt+T) and use the following commands:

    sudo add-apt-repository ppa:moka/moka-icon-theme
    sudo apt-get update
    sudo apt-get install moka-icon-theme

### Change icons in Linux Mint 16: ###

Changing an [icon theme in Ubuntu][2] was straight forward. It is slightly hidden in Linux Mint though. Once you have installed the icon themes, go to **Settings** from the Menu. And then go to **Themes**.

![](http://itsfoss.com/wp-content/uploads/2014/01/Chnage_Icon_themes_1.jpeg)

Now you might have realized why I said that changing the icon is slightly hidden in Linux Mint. You’ll not find an option to change just the icons here, at least not in the first look. To change only the icon, go to **Other settings** and click on **Icons** there. You’ll see all the icons set available here. Choose the one you like.

![](http://itsfoss.com/wp-content/uploads/2014/01/Change_Icon_Linux_Mint.jpeg)

The changes will be reflected immediately. No need of a restart. Here is how my Linux Mint desktop looks after applying Moka icon themes:

![](http://itsfoss.com/wp-content/uploads/2014/01/Moka_Linux_Mint_16.jpeg)

I hope you find this quick to install and change icon themes in Linux Mint helpful. Don’t forget to check 5 best icon themes in Ubuntu 13.10, you’ll find some beautiful icons there to make your desktop prettier. Any questions, suggestion, thoughts? Feel free to drop a comment.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-icon-linux-mint/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/Personal_Package_Archive
[2]:http://itsfoss.com/how-to-install-themes-in-ubuntu-13-10/
