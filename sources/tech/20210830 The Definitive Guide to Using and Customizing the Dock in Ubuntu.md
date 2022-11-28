[#]: subject: "The Definitive Guide to Using and Customizing the Dock in Ubuntu"
[#]: via: "https://itsfoss.com/customize-ubuntu-dock/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Definitive Guide to Using and Customizing the Dock in Ubuntu
======
When you log into Ubuntu, you’ll see the dock on the left side with some application icons on it. This dock (also known as launcher or sometimes as panel) allows you to quickly launch your frequently used programs.

![Ubuntu Dock][1]

I rely heavily on the dock and I am going to share a few tips about using the dock effectively and customize its looks and position.

You’ll learn the following in this tutorial:

* Basic usage of the dock: adding more applications and using shortcuts for launching applications.
* Customize the looks of the dock: Change the icon size, icon positions.
* Change the position: for single screen and multi-monitor setup
* Hide mounted disk from the dock
* Auto-hide or disable the dock
* Possibility of additional dock customization with dconf-editor
* Replace dock with other docking applications

I’ll use the terms dock, panel and launcher in the tutorial. All of them refer to the same thing.

### Using the Ubuntu dock: Absolute basic that you must know

If you are new to Ubuntu, you should know a few things about using the dock. You’ll eventually discover these dock features, I’ll just speed up the discovery process for you.

![A Video from YouTube][2]

[Subscribe to our YouTube channel for more Linux videos][3]

#### Add new applications to the dock (or remove them)

The steps are simple. Search for the application from the menu and run it.

The running application appears in the dock, below all other icons. Right click on it and select the “Add to Favorites” option. This will lock the icon to the dock.

![Right click on the icon and select "Add to Favorites" to add icons to the dock in Ubuntu][4]

Removing an app icon from the doc is even easier. You don’t even need to run the application. Simply right click on it and select “Remove From Favorites”.

![Right-click on the icon and select "Remove from Favorites" to remove icons from the dock in Ubuntu][5]

#### Reorder icon position

By default, new application icons are added after all the other icons on the launcher. You don’t have to live with it as it is.

To change the order of the icons, you just need to drag and drop to the other position of your choice. No need to “lock it” or any additional effort. It stays on that location until you make some changes again.

![Reorder Icons On Ubuntu Docks][6]

#### Right click to get additional options for some apps

Left-clicking on an icon launches the application or bring it to focus if the application is already running.

Right-clicking the icon gives you additional options. Different applications will have different options.

For browsers, you can open a new private window or preview all the running windows.

![Right Click Icons Ubuntu Dock][7]

For file manager, you can go to all the bookmarked directories or preview opened windows.

You can, of course, quit the application. Most applications will quit while some applications like Telegram will be minimized to the system tray.

#### Use keyboard shortcut to launch applications quickly [Not many people know about this one]

The dock allows you to launch an application in a single mouse click. But if you are like me, you can save that mouse click with a keyboard shortcut.

Using the Super/Window key and a number key will launch the application on that position.

![Keyboard Shortcut For Ubuntu Dock][8]

If the application is already running, it is brought to focus, i.e. it appears in front of all the other running application windows.

Since it is position-based, you should make sure that you don’t reorder the icons all the time. Personally, I keep Firefox at position 1, file manager at 2 and the alternate browser at 3 and so on until number 9. This way, I quickly launch the file manager with Super+2.

I find it easier specially because I have a three screen setup and moving the mouse to the launcher on the first screen is a bit too much of trouble. You can enable or disable the dock on additional screen. I’ll show that to you later in this tutorial.

### Change the position of the dock

By default, the dock is located on the left side of your screen. Some people like the launcher at the bottom, in a more traditional way.

[Ubuntu allows you to change the position of the dock][9]. You can move it to the bottom or to the right side. I am not sure many people actually put the dock on the top, so moving the dock to the top is not an option here.

![Change Launcher Position in Ubuntu][10]

To change the dock position, go to Settings->Appearance. You should see some options under Dock section. You need to change the “Position on screen” settings here.

![Change Dock Position in Ubuntu][11]

#### Position of dock on a multiple monitor setup

If you have multiple screens attached to your system, you can choose whether to display the dock on all screens or one of the chosen screens.

![Ubuntu Dock Settings Multimonitor][12]

Personally, I display the dock on my laptop screen only which is my main screen. This gives me maximum space on the additional two screens.

### Change the appearance of the dock

Let’s see some more dock customization options in Ubuntu.

Imagine you added too many applications to the dock or have too many applications open. It will fill up the space and you’ll have to scroll to the top and bottom to go to the applications at end points.

What you can do here is to change the icon size and the dock will now accommodate more icons. Don’t make it too small, though.

![Normal Icon Size Dock][13]

![Smaller Icon Size Dock][14]

To do that, go to Settings-> Appearance and change it by moving the slider under Icon size. The default icons size is 48 pixels.

![Changing Icon Size In Ubuntu Dock][15]

#### Hide mounted disks from the launcher

If you plug in a USB disk or SD Card, it is mounted to the system, and an icon appear in the launcher immediately. This is helpful because you can right click on it and select safely remove drive option.

![External Mounted Disks In Ubuntu Dock][16]

If you somehow find it troublesome, you can turn this feature off. Don’t worry, you can still access the mounted drives from the file manager.

Open a terminal and use the following command:

```
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
```

The changes take into effect immediately. You won’t be bothered with mounted disk being displayed in the launcher.

If you want the default behavior back, use this command:

```
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
```

### Change the behavior of dock

Let’s customize the default behavior of the dock and make it more suitable to your needs.

#### Enable minimize on click

If you click on the icon of a running application, its window will be brought to focus. That’s fine. However, if you click on it, nothing happens. By default, clicking on the same icon won’t minimize the application.

Well, this is the behavior in modern desktop, but I don’t like it. I prefer that the application is minimized when I click on its icon for the second time.

If you are like me, you may want to [enable click to minimize option in Ubuntu][17]:

![A Video from YouTube][18]

To do that, open a terminal and enter the following command:

```
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

#### Auto-hide Ubuntu dock and get more screen space

If you want to utilize the maximum screen space, you can enable auto-hide option for the dock in Ubuntu.

This will hide the dock, and you’ll get the entire screen. The dock is still accessible, though. Move your cursor to the location of the dock where it used to be, and it will appear again. When the dock reappears, it is overlaid on the running application window. And that’s a good thing otherwise too many elements would start moving on the screen.

The auto-hide option is available in Settings-> Appearance and under Dock section. Just toggle it.

![Autohide the Dock Ubuntu][19]

If you don’t like this behavior, you can enable it again the same way.

#### Disable Ubuntu dock

Auto-hide option is good enough for many people, but some users simply don’t like the dock. If you are one of those users, you also have the option to disable the Ubuntu dock entirely.

Starting with Ubuntu 20.04, you have the Extensions application available at your disposal to [manage GNOME Extensions][20].

![Gnome Extensions App Ubuntu][21]

With this Extensions application, you can easily disable or re-enable the dock.

![Disable Dock Ubuntu][22]

### Advanced dock customization with dconf-editor [Not recommended]

##### Warning

The dconf-editor allows you to change almost every aspect of the GNOME desktop environment. This is both good and bad because you must be careful in editing. Most of the settings can be changed on the fly, without asking for conformation. While you may reset the changes, you could still put your system in such a state that it would be difficult to put things back in order.For this reason, I advise not to play with dconf-editor, specially if you don’t like spending time in troubleshooting and fixing problems or if you are not too familiar with Linux and GNOME.

The [dconf editor][23] gives you additional options to customize the dock in Ubuntu. Install it from the software center and then navigate to org > gnome > shell > extensions > dash-to-dock. You’ll find plenty of options here. I cannot even list them all here.

![Dconf Editor Dock][24]

### Replace the dock in Ubuntu

There are several third-party dock applications available for Ubuntu and other Linux distributions. You can install a dock of your choice and use it.

For example, you can install Plank dock from the software center and use it in similar fashion to Ubuntu dock.

![Plank Dock Ubuntu][25]

Disabling Ubuntu Dock would be a better idea in this case. It won’t be wise to use multiple docks at the same time.

### Conclusion

This tutorial is about customizing the default dock or launcher provided in Ubuntu’s GNOME implementation. Some suggestions should work on the dock in vanilla GNOME as work well.

I have shown you most of the common Ubuntu dock customization. You don’t need to go and blindly follow all of them. Read and think which one suits your need and then act upon it.

Was it too trivial or did you learn something new? Would you like to see more such tutorials? I welcome your suggestions and feedback on dock customization.

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-ubuntu-dock/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2021/01/ubuntu-dock.png
[2]: https://player.vimeo.com/video/534830884
[3]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]: https://itsfoss.com/wp-content/uploads/2021/01/add-icons-to-dock.png
[5]: https://itsfoss.com/wp-content/uploads/2021/01/remove-icons-from-dock.png
[6]: https://itsfoss.com/wp-content/uploads/2021/01/reorder-icons-on-ubuntu-docks-800x430.gif
[7]: https://itsfoss.com/wp-content/uploads/2021/01/right-click-icons-ubuntu-dock.png
[8]: https://itsfoss.com/wp-content/uploads/2021/01/keyboard-shortcut-for-ubuntu-dock.png
[9]: https://itsfoss.com/move-unity-launcher-bottom/
[10]: https://itsfoss.com/wp-content/uploads/2021/01/change-launcher-position-ubuntu.png
[11]: https://itsfoss.com/wp-content/uploads/2021/01/change-dock-position-ubuntu.png
[12]: https://itsfoss.com/wp-content/uploads/2021/01/ubuntu-dock-settings-multimonitor.png
[13]: https://itsfoss.com/wp-content/uploads/2021/01/normal-icon-size-dock.jpg
[14]: https://itsfoss.com/wp-content/uploads/2021/01/smaller-icon-size-dock.jpg
[15]: https://itsfoss.com/wp-content/uploads/2021/01/changing-icon-size-in-ubuntu-dock.png
[16]: https://itsfoss.com/wp-content/uploads/2021/01/external-mounted-disks-in-ubuntu-dock.png
[17]: https://itsfoss.com/click-to-minimize-ubuntu/
[18]: https://giphy.com/embed/52FlrSIMxnZ1qq9koP
[19]: https://itsfoss.com/wp-content/uploads/2021/01/autohide-dock-ubuntu.png
[20]: https://itsfoss.com/gnome-shell-extensions/
[21]: https://itsfoss.com/wp-content/uploads/2020/06/GNOME-extensions-app-ubuntu.jpg
[22]: https://itsfoss.com/wp-content/uploads/2021/01/disable-dock-ubuntu.png
[23]: https://wiki.gnome.org/Apps/DconfEditor
[24]: https://itsfoss.com/wp-content/uploads/2021/01/dconf-editor-dock.png
[25]: https://itsfoss.com/wp-content/uploads/2021/01/plank-dock-Ubuntu-800x382.jpg
