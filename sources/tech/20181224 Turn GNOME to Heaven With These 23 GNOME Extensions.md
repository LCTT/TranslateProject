[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Turn GNOME to Heaven With These 23 GNOME Extensions)
[#]: via: (https://fosspost.org/tutorials/turn-gnome-to-heaven-with-these-23-gnome-extensions)
[#]: author: (M.Hanny Sabbagh https://fosspost.org/author/mhsabbagh)

Turn GNOME to Heaven With These 23 GNOME Extensions
======

GNOME Shell is one of the most used desktop interfaces on the Linux desktop. It’s part of the GNOME project and is considered to be the next generation of the old classic GNOME 2.x interface. GNOME Shell was first released in 2011 carrying a lot of features, including GNOME Shell extensions feature.

GNOME Extensions are simply extra functionality that you can add to your interface, they can be panel extensions, performance extensions, quick access extensions, productivity extensions or for any other type of usage. They are all free and open source of course; you can install them with a single click **from your web browser** actually.

### How To Install GNOME Extensions?

You main way to install GNOME extensions will be via the extensions.gnome.org website. It’s an official platform belonging to GNOME where developers publish their extensions easily so that users can install them in a single click.

In order to for this to work, you’ll need two things:

  1. Browser Add-on: You’ll need to install a browser add-on that allows the website to communicate with your local GNOME desktop. You install it from [here for Firefox][1], or [here for Chrome][2] or [here for Opera][3].

  2. Native Connector: You still need another part to allow your system to accept installing files locally from your web browser. To install this component, you must install the `chrome-gnome-shell` package. Do not be deceived! Although the package name is containing “chrome”, it also works on Firefox too. To install it on Debian/Ubuntu/Mint run the following command in terminal:

```
sudo apt install chrome-gnome-shell
```

For Fedora:

```
sudo dnf install chrome-gnome-shell
```

For Arch:

```
sudo pacman -S chrome-gnome-shell
```

After you have installed the two components above, you can easily install extensions from the GNOME extensions website.

### How to Configure GNOME Extensions Settings?

Many of these extensions do have a settings window that you can access to adjust the preferences of that extension. You must make sure that you have seen its options at least once so that you know what you can possibly do using that extension.

To do this, you can head to the [installed extensions page on the GNOME website][4], and you’ll see a small options button near every extension that offers one:

![Screenshot 2018 12 24 20 50 55 41][5]

Clicking it will display a window for you, from which you can see the possible settings:

![Screenshot 2018 12 24 20 51 29 43][6]

Read our article below for our list of recommended extension!

### General Extensions

#### 1\. User Themes

![Screenshot from 2018 12 23 12 30 20 45][7]

This is the first must-install extension on the GNOME Shell interface, it simply allows you to change the desktop theme to another one using the tweak tool. After installation run gnome-tweak-tool, and you’ll be able to change your desktop theme.

Installation link: <https://extensions.gnome.org/extension/19/user-themes/>

#### 2\. Dash to Panel

![Screenshot from 2018 12 24 21 16 11 47][8]

Converts the GNOME top bar into a taskbar with many added features, such as favorite icons, moving the clock to right, adding currently opened windows to the panel and many other features. (Make sure not to install this one with some other extensions below which do provide the same functionality).

Installation link: <https://extensions.gnome.org/extension/1160/dash-to-panel/>

#### 3\. Desktop Icons

![gnome shell screenshot SSP3UZ 49][9]

Restores desktop icons back again to GNOME. Still in continues development.

Installation link: <https://extensions.gnome.org/extension/1465/desktop-icons/>

#### 4\. Dash to Dock

![Screenshot from 2018 12 24 21 50 07 51][10]

If you are a fan of the Unity interface, then this extension may help you. It simply adds a dock to the left/right side of the screen, which is very similar to Unity. You can customize that dock however you like.

Installation link: <https://extensions.gnome.org/extension/307/dash-to-dock/>

### Productivity Extensions

#### 5\. Todo.txt

![screenshot_570_5X5YkZb][11]

For users who like to maintain productivity, you can use this extension to add a simple To-Do list functionality to your desktop, it will use the [syntax][12] from todotxt.com, you can add unlimited to-dos, mark them as complete or remove them, change their position beside modifying or taking a backup of the todo.txt file manually.

Installation link: <https://extensions.gnome.org/extension/570/todotxt/>

#### 6\. Screenshot Tool

![Screenshot from 2018 12 24 21 04 14 54][13]

Easily take a screenshot of your desktop or a specific area, with the possibility of also auto-uploading it to imgur.com and auto-saving the link into the clipboard! Very useful extension.

Installation link: <https://extensions.gnome.org/extension/1112/screenshot-tool/>

#### 7\. OpenWeather

![screenshot_750][14]

If you would like to know the weather forecast everyday then this extension will be the right one for you, this extension will simply add an applet to the top panel allowing you to fetch the weather data from openweathermap.org or forecast.io, it supports all the countries and cities around the world. It also shows the wind and humidity.

Installation link: <https://extensions.gnome.org/extension/750/openweather/>

#### 8 & 9\. Search Providers Extensions

![Screenshot from 2018 12 24 21 29 41 57][15]

In GNOME, you can add what’s known as “search providers” to the shell, meaning that when you type something in the search box, you’ll be able to automatically search these websites (search providers) using the same text you entered, and see the results directly from your shell!

YouTube Search Provider: <https://extensions.gnome.org/extension/1457/youtube-search-provider/>

Wikipedia Search Provider: <https://extensions.gnome.org/extension/512/wikipedia-search-provider/>

### Workflow Extensions

#### 10\. No Title Bar

![Screenshot 20181224210737 59][16]

This extension simply removes the title bar from all the maximized windows, and moves it into the top GNOME Panel. In this way, you’ll be able to save a complete horizontal line on your screen, more space for your work!

Installation Link: <https://extensions.gnome.org/extension/1267/no-title-bar/>

#### 11\. Applications Menu

![Screenshot 2018 12 23 13 58 07 61][17]

This extension simply adds a classic menu to the “activities” menu on the corner. By using it, you will be able to browse the installed applications and categories without the need to use the dash or the search feature, which saves you time. (Check the “No hot corner” extension below to get a better usage).

Installation link: <https://extensions.gnome.org/extension/6/applications-menu/>

#### 12\. Places Status Indicator

![screenshot_8_1][18]

This indicator will put itself near the left corner of the activities button, it allows you to access your home folder and sub-folders easily using a menu, you can also browse the available devices and networks using it.

Installation link: <https://extensions.gnome.org/extension/8/places-status-indicator/>

#### 13\. Window List

![Screenshot from 2016-08-12 08-05-48][19]

Officially supported by GNOME team, this extension adds a bottom panel to the desktop which allows you to navigate between the open windows easily, it also include a workspace indicator to switch between them.

Installation link: <https://extensions.gnome.org/extension/602/window-list/>

#### 14\. Frippery Panel Favorites

![screenshot_4][20]

This extensions adds your favorite applications and programs to the panel near the activities button, allowing you to access to it more quickly with just 1 click, you can add or remove applications from it just by modifying your applications in your favorites (the same applications in the left panel when you click the activities button will appear here).

Installation link: <https://extensions.gnome.org/extension/4/panel-favorites/>

#### 15\. TopIcons

![Screenshot 20181224211009 66][21]

Those extensions restore the system tray back into the top GNOME panel. Very needed in cases of where applications are very much dependent on the tray icon.

For GNOME 3.28, installation link: <https://extensions.gnome.org/extension/1031/topicons/>

For GNOME 3.30, installation link: <https://extensions.gnome.org/extension/1497/topicons-redux/>

#### 16\. Clipboard Indicator

![Screenshot 20181224214626 68][22]

A clipboard manager is simply an applications that manages all the copy & paste operations you do on your system and saves them into a history, so that you can access them later whenever you want.

This extension does exactly this, plus many other cool features that you can check.

Installation link: <https://extensions.gnome.org/extension/779/clipboard-indicator/>

### Other Extensions

#### 17\. Frippery Move Clock

![screenshot_2][23]

If you are from those people who like alignment a lot, and dividing the panels into 2 parts only, then you may like this extension, what it simply does is moving the clock from the middle of the GNOME Shell panel to the right near the other applets on the panel, which makes it more organized.

Installation link: <https://extensions.gnome.org/extension/2/move-clock/>

#### 18\. No Topleft Hot Corner

If you don’t like opening the dash whenever you move the mouse to the left corner, you can disable it easily using this extension. You can for sure click the activities button if you want to open the dash view (or via the Super key on the keyboard), but the hot corner will be disabled only.

Installation link: <https://extensions.gnome.org/extension/118/no-topleft-hot-corner/>

#### 19\. No Annoyance

Simply removes the “window is ready” notification each time a new window a opened.

Installation link: <https://extensions.gnome.org/extension/1236/noannoyance/>

#### 20\. EasyScreenCast

![Screenshot 20181224214219 71][24]

If you would like to quickly take a screencast for your desktop, then this extension may help you. By simply just choosing the type of recording you want, you’ll be able to take screencasts any time. You can also configure advanced options for the extension, such as the pipeline and many other things.

Installation link: <https://extensions.gnome.org/extension/690/easyscreencast/>

#### 21\. Removable drive Menu

![Screenshot 20181224214131 73][25]

Adds an icon to the top bar which shows you a list of your currently removable drives.

Installation link: <https://extensions.gnome.org/extension/7/removable-drive-menu/>

#### 22\. BottomPanel

![Screenshot 20181224214419 75][26]

As its title says.. It simply moves the top GNOME bar into the bottom of the screen.

Installation link: <https://extensions.gnome.org/extension/949/bottompanel/>

#### 23\. Unite

If you would like one extension only to do most of the above tasks, then Unite extension can help you. It adds panel favorites, removes title bar, moves the clock, allows you to change the location of the panel.. And many other features. All using this extension alone!

Installation link: <https://extensions.gnome.org/extension/1287/unite/>

### Conclusion

This was our list for some great GNOME Shell extensions to try out. Of course, you don’t (and shouldn’t!) install all of these, but just what you need for your own usage. As you can see, you can convert GNOME into any form you would like, but be careful for RAM usage (because if you use more extensions, the shell will consume very much resources).

What other GNOME Shell extensions do you use? What do you think of this list?


--------------------------------------------------------------------------------

via: https://fosspost.org/tutorials/turn-gnome-to-heaven-with-these-23-gnome-extensions

作者：[M.Hanny Sabbagh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/mhsabbagh
[b]: https://github.com/lujun9972
[1]: https://addons.mozilla.org/en/firefox/addon/gnome-shell-integration/
[2]: https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
[3]: https://addons.opera.com/en/extensions/details/gnome-shell-integration/
[4]: https://extensions.gnome.org/local/
[5]: https://i1.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot_2018-12-24_20-50-55.png?resize=850%2C359&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 42)
[6]: https://i1.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot_2018-12-24_20-51-29.png?resize=850%2C462&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 44)
[7]: https://i2.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-from-2018-12-23-12-30-20.png?resize=850%2C478&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 46)
[8]: https://i0.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-from-2018-12-24-21-16-11.png?resize=850%2C478&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 48)
[9]: https://i2.wp.com/fosspost.org/wp-content/uploads/2018/12/gnome-shell-screenshot-SSP3UZ.png?resize=850%2C492&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 50)
[10]: https://i1.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-from-2018-12-24-21-50-07.png?resize=850%2C478&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 52)
[11]: https://i0.wp.com/fosspost.org/wp-content/uploads/2016/08/screenshot_570_5X5YkZb.png?resize=478%2C474&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 53)
[12]: https://github.com/ginatrapani/todo.txt-cli/wiki/The-Todo.txt-Format
[13]: https://i1.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-from-2018-12-24-21-04-14.png?resize=715%2C245&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 55)
[14]: https://i2.wp.com/fosspost.org/wp-content/uploads/2016/08/screenshot_750.jpg?resize=648%2C276&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 56)
[15]: https://i2.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-from-2018-12-24-21-29-41.png?resize=850%2C478&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 58)
[16]: https://i0.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-20181224210737-380x95.png?resize=380%2C95&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 60)
[17]: https://i0.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot_2018-12-23_13-58-07.png?resize=524%2C443&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 62)
[18]: https://i0.wp.com/fosspost.org/wp-content/uploads/2016/08/screenshot_8_1.png?resize=247%2C620&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 63)
[19]: https://i1.wp.com/fosspost.org/wp-content/uploads/2016/08/Screenshot-from-2016-08-12-08-05-48.png?resize=850%2C478&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 64)
[20]: https://i0.wp.com/fosspost.org/wp-content/uploads/2016/08/screenshot_4.png?resize=414%2C39&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 65)
[21]: https://i0.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-20181224211009-631x133.png?resize=631%2C133&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 67)
[22]: https://i1.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-20181224214626-520x443.png?resize=520%2C443&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 69)
[23]: https://i0.wp.com/fosspost.org/wp-content/uploads/2016/08/screenshot_2.png?resize=388%2C26&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 70)
[24]: https://i2.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-20181224214219-327x328.png?resize=327%2C328&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 72)
[25]: https://i1.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-20181224214131-366x199.png?resize=366%2C199&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 74)
[26]: https://i2.wp.com/fosspost.org/wp-content/uploads/2018/12/Screenshot-20181224214419-830x143.png?resize=830%2C143&ssl=1 (Turn GNOME to Heaven With These 23 GNOME Extensions 76)
