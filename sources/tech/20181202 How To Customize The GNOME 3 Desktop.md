[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How To Customize The GNOME 3 Desktop?)
[#]: via: (https://www.2daygeek.com/how-to-customize-the-gnome-3-desktop/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)
[#]: url: ( )

How To Customize The GNOME 3 Desktop?
======

We have got many emails from user to write an article about GNOME 3 desktop customization but we don’t get a time to write this topic.

I was using Ubuntu operating system since long time in my primary laptop and i got bored so, i would like to test some other distro which is related to Arch Linux.

I prefer to go with Majaro so, i have installed Manjaro 18.0 with GNOME 3 desktop in my laptop.

I’m customizing my desktop, how i want it. So, i would like to take this opportunity to write up this article in detailed way to help others.

This article helps others to customize their desktop without headache.

I’m not going to include all my customization and i will be adding a necessary things which will be mandatory and useful for Linux desktop users.

If you feel some tweak is missing in this article, i would request you to mention that in comment sections. It will be very helpful for other users.

### 1) How to Launch Activities Overview in GNOME 3 Desktop?

The Activities Overview will display all the running applications or launched/opened windows by clicking `Super Key` or by clicking `Activities` button in the topmost left corner.

It allows you to launch a new applications, switch windows, and move windows between workspaces.

You can simply exit the Activities Overview by choosing the following any of the one actions like selecting a window, application or workspace, or by pressing the `Super Key` or `Esc Key`.

Activities Overview Screenshot.
![][2]

### 2) How to Resize Windows in GNOME 3 Desktop?

The Launched windows can be maximized, unmaximized and snapped to one side of the screen (Left or Right) by using the following key combinations.

  * `Super Key+Down Arrow:` To unmaximize the window.
  * `Super Key+Up Arrow:` To maximize the window.
  * `Super Key+Right Arrow:` To fill a window in the right side of the half screen.
  * `Super Key+Left Arrow:` To fill a window in the left side of the half screen



Use `Super Key+Down Arrow` to unmaximize the window.
![][3]

Use `Super Key+Up Arrow` to maximize the window.
![][4]

Use `Super Key+Right Arrow` to fill a window in the right side of the half screen.
![][5]

Use `Super Key+Left Arrow` to fill a window in the left side of the half screen.
![][6]

This feature will help you to view two applications at a time a.k.a splitting screen.
![][7]

### 3) How to Display Applications in GNOME 3 Desktop?

Click on the `Show Application Grid` button in the Dash to display all the installed applications on your system.
![][8]

### 4) How to Add Applications on Dash in GNOME 3 Desktop?

To speed up your day to day activity you may want to add frequently used application into Dash or Drag the application launcher to the Dash.

It will allow you to directly launch your favorite applications without searching them. To do so, simply right click on it and use the option `Add to Favorites`.
![][9]

To remove a application launcher a.k.a favorite from Dash, either drag it from the Dash to the grid button or simply right click on it and use the option `Remove from Favorites`.
![][10]

### 5) How to Switch Between Workspaces in GNOME 3 Desktop?

Workspaces allow you to group windows together. It will helps you to segregate your work properly. If you are working on Multiple things and you want to group each work and related things separately then it will be very handy and perfect option for you.

You can switch workspaces in two ways, Open the Activities Overview and select a workspace from the right-hand side or use the following key combinations.

  * Use `Ctrl+Alt+Up` Switch to the workspace above.
  * Use `Ctrl+Alt+Down` Switch to the workspace below.



![][11]

### 6) How to Switch Between Applications (Application Switcher) in GNOME 3 Desktop?

Use either `Alt+Tab` or `Super+Tab` to switch between applications. To launch Application Switcher, use either `Alt+Tab` or `Super+Tab`.

Once launched, just keep holding the Alt or Super key and hit the tab key to move to the next application from left to right order.

### 7) How to Add UserName to Top Panel in GNOME 3 Desktop?

If you would like to add your UserName to Top Panel then install the following [Add Username to Top Panel][12] GNOME Extension.
![][13]

### 8) How to Add Microsoft Bing’s wallpaper in GNOME 3 Desktop?

Install the following [Bing Wallpaper Changer][14] GNOME shell extension to change your wallpaper every day to Microsoft Bing’s wallpaper.
![][15]

### 9) How to Enable Night Light in GNOME 3 Desktop?

Night light app is one of the famous app which reduces strain on the eyes by turning your screen a dim yellow from blue light after sunset.

It is available in smartphones. The other known apps for the same purpose are flux and **[redshift][16]**.

To enable this, navigate to **System Settings** >> **Devices** >> **Displays** and turn Nigh Light on.
![][17]

Once it’s enabled and status icon will be placed on the top panel.
![][18]

### 10) How to Show the Battery Percentage in GNOME 3 Desktop?

Battery percentage will show you the exact battery usage. To enable this follow the below steps.

Start GNOME Tweaks >> **Top Bar** >> **Battery Percentage** and switch it on.
![][19]

After modification you can able to see the battery percentage icon on the top panel.
![][20]

### 11) How to Enable Mouse Right Click in GNOME 3 Desktop?

By default right click is disabled on GNOME 3 desktop environment. To enable this follow the below steps.

Start GNOME Tweaks >> **Keyboard & Mouse** >> Mouse Click Emulation and select “Area” option.
![][21]

### 12) How to Enable Minimize On Click in GNOME 3 Desktop?

Enable one-click minimize feature which will help us to minimize opened window without using minimize option.

```
$ gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

### 13) How to Customize Dock in GNOME 3 Desktop?

If you would like to change your Dock similar to Deepin desktop or Mac then use the following set of commands.

```
$ gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
$ gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
$ gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
$ gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 50
```

![][22]

### 14) How to Show Desktop in GNOME 3 Desktop?

By default `Super Key+D` shortcut doesn’t show your desktop. To configure this follow the below steps.

Settings >> **Devices** >> **Keyboard** >> Click **Hide all normal windows** under Navigation then Press `Super Key+D` finally hit `Set` button to enable it.
![][23]

### 15) How to Customize Date and Time Format?

By default GNOME 3 shows date and time with `Sun 04:48`. It’s not clear and if you want to get the output with following format `Sun Dec 2 4:49 AM` follow the below steps.

**For Date Modification:** Start GNOME Tweaks  >> **Top Bar** and enable `Weekday` option under Clock.
![][24]

**For Time Modification:** Settings  >> **Details** >> **Date & Time** then choose `AM/PM` option in the time format.
![][25]

After modification you can able to see the date and time format same as below.
![][26]

### 16) How to Permanently Disable Unused Services in Boot?

In my case, i’m not going to use **Bluetooth** & **cpus a.k.a Printer service**. Hence, disabling these services on my laptop. To disable services on Arch based systems use **[Pacman Package Manager][27]**.
For Bluetooth

```
$ sudo systemctl stop bluetooth.service
$ sudo systemctl disable bluetooth.service
$ sudo systemctl mask bluetooth.service
$ systemctl status bluetooth.service
```

For cups

```
$ sudo systemctl stop org.cups.cupsd.service
$ sudo systemctl disable org.cups.cupsd.service
$ sudo systemctl mask org.cups.cupsd.service
$ systemctl status org.cups.cupsd.service
```

Finally verify whether these services are disabled or not in the boot using the following command. If you want to double confirm this, you can reboot once and check the same. Navigate to the following link to know more about **[systemctl][28]** usage,

```
$ systemctl list-unit-files --type=service | grep enabled
[email protected] enabled
dbus-org.freedesktop.ModemManager1.service enabled
dbus-org.freedesktop.NetworkManager.service enabled
dbus-org.freedesktop.nm-dispatcher.service enabled
display-manager.service enabled
gdm.service enabled
[email protected] enabled
linux-module-cleanup.service enabled
ModemManager.service enabled
NetworkManager-dispatcher.service enabled
NetworkManager-wait-online.service enabled
NetworkManager.service enabled
systemd-fsck-root.service enabled-runtime
tlp-sleep.service enabled
tlp.service enabled
```

### 17) Install Icons & Themes in GNOME 3 Desktop?

Bunch of Icons and Themes are available for GNOME Desktop so, choose the desired **[GTK Themes][29]** and **[Icons Themes][30]** for you. To configure this further, navigate to the below links which makes your Desktop more elegant.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-customize-the-gnome-3-desktop/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-activities-overview-screenshot.jpg
[3]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-activities-unmaximize-the-window.jpg
[4]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-activities-maximize-the-window.jpg
[5]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-activities-fill-a-window-right-side.jpg
[6]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-activities-fill-a-window-left-side.jpg
[7]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-activities-split-screen.jpg
[8]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-display-applications.jpg
[9]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-add-applications-on-dash.jpg
[10]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-remove-applications-from-dash.jpg
[11]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-workspaces-screenshot.jpg
[12]: https://extensions.gnome.org/extension/1108/add-username-to-top-panel/
[13]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-add-username-to-top-panel.jpg
[14]: https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/
[15]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-add-microsoft-bings-wallpaper.jpg
[16]: https://www.2daygeek.com/install-redshift-reduce-prevent-protect-eye-strain-night-linux/
[17]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-enable-night-light.jpg
[18]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-enable-night-light-1.jpg
[19]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-display-battery-percentage.jpg
[20]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-display-battery-percentage-1.jpg
[21]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-enable-mouse-right-click.jpg
[22]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-dock-customization.jpg
[23]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-enable-show-desktop.jpg
[24]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-customize-date.jpg
[25]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-customize-time.jpg
[26]: https://www.2daygeek.com/wp-content/uploads/2018/12/how-to-customize-the-gnome-3-desktop-customize-date-time.jpg
[27]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[28]: https://www.2daygeek.com/sysvinit-vs-systemd-cheatsheet-systemctl-command-usage/
[29]: https://www.2daygeek.com/category/gtk-theme/
[30]: https://www.2daygeek.com/category/icon-theme/
