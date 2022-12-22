[#]: subject: "Customize Xfce Desktop for Modern Look and Productivity"
[#]: via: "https://www.debugpoint.com/customize-xfce-modern-look-2020-edition/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Customize Xfce Desktop for Modern Look and Productivity
======
You can customize the super lightweight Xfce desktop for a modern look and improve productivity by tweaking various settings. In this guide, we explain the steps to configure a basic Xfce desktop installation (for example – Xubuntu) entirely and make it look modern while being productive.

Xfce is a fast and lightweight desktop built on the GTK toolkit. It uses Xfwm (Xfce Window Manager), providing complete customization options via visual settings. Although the actual configuration files are hidden from the general users. Currently, Xfce is going through a process of porting the GTK2 components to GTK3 with the current stable and upcoming release.

This guide is prepared on Xfce 4.14 in Xubuntu 20.10 release. But overall, it is applicable for all Xfce desktops available for multiple Linux distributions such as Manjaro, Fedora, Arch, etc.

![Xfce Desktop - Before Customization][1]

### Customize Xfce Desktop – Look and Productivity

##### Panels

Panels are the core component of the Xfce desktop. When you first boot up Xfce, the top panel is the go-to section for all your needs. It contains the application launcher menu, system tray with notifications, and a list of opened applications. Xfce (Xubuntu) comes with the great Whisker Menu, which already gives you a modern look.

So for this customization guide, first, I will add a new panel at the bottom and then eventually delete the top one. Now, if you wish, you can keep the top panel Or move it to the left or right from the Panel properties. Totally as per your taste.

* Right-click on the top panel and open `Panel -> Panel Preferences`. Click on the green ‘+’ icon to create a new Panel.

![Panel Preferences][2]

![Add New Panel option][3]

Ideally, the default Panel is ‘Panel 0’, and the new one should be ‘Panel 1’. You will see a blank Panel is created on the desktop.

![New Panel][4]

**Drag the panel** to the **bottom** of the screen via the handle.

On the **Display tab**of the Panel Preference Window:

* Set Auto-hide the panel to ‘Always‘.
* Check the Lock Panel.

On the **Appearance** Tab, you can choose the Background Style of the Panel. You can choose Opacity as well. For this guide, I will keep –

* Background as None.
* Icon – Adjust size automatically = Yes
* Opacity (Enter and Leave) = 100

Let’s start adding some **applets**. Go to the Items tab and click on the green ‘+’ icon to start adding some Xfce Applets.

You can add as many items as you want. For this guide, I have added the below items.

* Whisker Menu – application menu
* Window Menu – List of open applications
* Places – File manager
* Notes – quick sticky pad
* Screenshot
* Indicator Plugin
* Clock with date and time
* Action buttons to show log out, shutdown
* Show Desktop

Once done, press close.

To add some **additional applications**, you can open the application menu and right-click on any application. Then click **Add to Panel** and choose Panel 1 (for this example).

For example, I have added some additional applications to Panel 1 as below.

* Firefox
* Thunderbird
* LibreOffice Calc
* GIMP

Again, this is completely as per your taste. You can customize the new Panel as you wish.

When you are done, right-click on the top panel and open Panel Preferences. Select Panel 0 and click the “-” red icon to delete the top panel. Be cautious, as it will remove the default Xfce panel altogether. And before removing the Panel, make sure the newly created Panel 1 is visible.

##### Icons

You can change the default icon theme of Xfce. The [xfce-look.org][5] provides hundreds of GTK themes and icons. Download your favourite icon theme, and extract them. Then copy the top icon theme folder to `/usr/share/icons`. Or, you can create a folder `.icons` under your home directory and copy the icons folder.

Then you can open the **Appearance** Window and change the icon via the icon tab.

For this example, I have used the Uniform+ icon set, which looks very nice and comes with many application-specific icon sets. It’s a big download (around 300mb+); you can get it from the below link.

[Download Uniform+ Icon set for Xfce][6]

##### Wallpaper

The Xfce-look.org has plenty of Xfce wallpaper with the Xfce mascot to choose from. Like the orange one which I have used for this tutorial. You can download it from [here][7].

##### Dock

There are some Docks which you can directly install in Xfce instead of Panels. I have not included a dock for this guide because you can customize it just fine without installing some additional applications and compromising more performance.

However, Docks are always looked better than panels. For example, if you really want, you can download DockBarX for Xfce and add it to your desktop. To install DockBarX, use the below PPA and commands in Ubuntu-based systems.

```
sudo add-apt-repository ppa:xuzhen666/dockbarxsudo apt-get updatesudo apt-get install dockbarx
```

```
sudo apt-get install xfce4-dockbarx-plugin
```

```
sudo apt-get install dockbarx-themes-extra
```

After applying all the above customization, your desktop should look like this if all goes well.

![Xfce Desktop after Customization][8]

### Settings Changes for Productivity

Now, coming to some tweaks of Xfce, which I prefer to do. These are specific small settings changes for your desktop which make your life easy and you can become more productive.

**Configure Whisker Menu to launch with Left Super Key**

It is handy when you can just open the application key via the left super key or right super key. To configure the Whisker Menu to launch with the left super key, open Window Manager and go to Keyboard. Add Superkey with xfce4-whisker-menu and press ok.

**Switch categories by Hovering Mouse**

Open Whisker menu settings. Go to the behaviour tab and check the Switch categories by hovering over the option.

**Add Battery and network data transfer indicator**

There is two additional panel applet available which you can add to your panel. They are Battery indicators and network data transfer. They give you a visual representation of battery status with % and upload/download data speed for the network.

![Xfce Customization – Dark Mode][9]

### Wrapping Up

Again, the above outlined Xfce desktop look changes are just an idea for configuring your desktop. There are hundreds of settings available in Xfce, which you can easily change via settings as per your need and workflow. This is what makes Xfce a great alternative GTK desktop to GNOME.

That’s it. You can now enjoy a completely different [Xfce][10] desktop.

Let me know in the comment box below if you face any difficulties configuring the Xfce desktop and have any questions.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/customize-xfce-modern-look-2020-edition/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2020/11/Xfce-Desktop-Before-Customization-1024x576.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2020/11/Panel-Preferences.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2020/11/Add-New-Panel-option.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2020/11/New-Panel.jpg
[5]: https://www.xfce-look.org/browse/cat/
[6]: https://www.xfce-look.org/p/1012468/
[7]: https://www.xfce-look.org/p/1351819/
[8]: https://www.debugpoint.com/wp-content/uploads/2020/11/Xfce-Desktop-after-Customization.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2020/11/Xfce-Customization-Dark-Mode.jpg
[10]: https://www.debugpoint.com/tag/xfce
