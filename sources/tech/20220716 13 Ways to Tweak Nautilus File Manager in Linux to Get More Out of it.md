[#]: subject: "13 Ways to Tweak Nautilus File Manager in Linux to Get More Out of it"
[#]: via: "https://itsfoss.com/nautilus-tips-tweaks/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

13 Ways to Tweak Nautilus File Manager in Linux to Get More Out of it
======
Nautilus is GNOME’s default file manager application, and you may have seen it in many Linux distributions.

It’s a good file manager with plenty of features. However, you can enhance your experience by employing some tweaks and tips.

I am going to share such tips and tweaks in this article. Some tweaks may require installing additional Nautilus plugins, while some are built-in but lesser-known features. A few tips are purely cosmetic and just change the look and feel.

### Customizing GNOME’s File Manager

![customizing gnome nautilus file manager][1]

GNOME’s default file explorer used to be called [Nautilus][2]. It is now called Files. However, seasoned Linux users still refer to it as Nautilus. I have used both terms here.

One more thing. **You don’t have to try and install each Nautilus plugin**. Read the article and go with the ones that would be helpful for you.

I have added the Nautilus extension commands for Ubuntu/Debian. If you are using some other distribution, please use your package manager to install them.

#### 1. Show number of items in folders

You can show how many files and folders are inside a folder in GNOME Files.

![Item Count Inside Folder Visible][3]

You don’t need to install any plugins for it. It’s a built-in feature.

Go to the **Preferences** in Nautilus.

![GNOME Files Preferences][4]

Under **Icon View Captions**, set the **First** place to **Size**.

![Nautilus Preferences][5]

#### 2. Add new document creation option in right click context menu

This is a feature that can increase your productivity. Right click on an empty place inside a folder and it should you see the option to create a new, empty text file or document.

It was removed from GNOME a few years back and it is likely to make a come back in the next GNOME release.

To achieve this, you need to create an empty file and name it **New Document**. Then save this file to the Templates directory to get it in the right-click context menu.

![Create a template first in the Templates directory][6]

After this, you should see the option in the right-clikc context menu.

![Nautilus Right Click New Document][7]

You can also add Word documents, PPT presentation options, etc in the right-click context menu similarly.

#### 3. Add a permanent delete option in right-click context menu

By default, Nautilus provides “Move to trash” option in the right-click context menu. If you want to permanently delete a file or folder, you need to **shift+delete** or empty it from the trash.

You can enable Delete Permanent button under the right-click context menu from Nautilus **preferences**.

![Permanent delet option in Nautilus Preferences][8]

Now you will have an option to delete files and folders permanently in the right-click context menu.

![Permanent delete option under right click context menu][9]

#### 4. Completely wipe files and folders from the disk

Even if you permanently delete a file, chances are that the [data could still be recovered][10].

Nautilus provides an extension to wipe files securely and fill the empty places so that data can not be recovered anymore.

Install the Nautilus extension first.

```
sudo apt install nautilus-wipe
```

And then restart the file explorer:

```
nautilus -q
```

![Wipe out files in Nautilus][11]

#### 5. Enable quick file preview

Quick preview is rather a handy feature for a file manager. KDE’s Dolphin file manager provides it as a built-in feature.

You can preview files such as PDF, text, images, audio, etc. You can scroll documents while in preview.

In Nautilus, you need to install gnome-sushi to get this feature.

```
sudo apt install gnome-sushi
```

Now, close all instances of file manager and open it again. To see the preview, select a file and press the Space key.

![Preview Files in Nautilus Using GNOME Sushi][12]

#### 6. Get the list of recently visited directories

Nautilus has the feature to show ‘recently accessed files’. But what about the recently visited folders?

That can also be accessed. On the top left, **right-click on the back arrow** to get the list of previously visited folders.

![list of directories visited][13]

#### 7. Bookmark folders to the left sidebar for quick access

If you frequently access some folders, it would be better to access them from the left sidebar quickly.

It’s quite simple, actually. Select the folder and drag and drop to the left sidebar. The [folder will be added as a bookmark][14].

![Adding a folder as bookmark][15]

You can remove bookmark the same way. Just drag and drop it from the sidebar.

#### 8. Rotate and Resize images with a right click

To enable this functionality, you need to install ImageMagick and nautilus-image-converter.

```
sudo apt install imagemagick nautilus-image-converter
```

After it is installed, quit nautilus with *nautilus -q* and re-open nautilus.

Now select the image and [right-click to get resize and rotate images][16].

![Rotate and Resize Images with Nautilus][17]

#### 9. Change the colors of individual folders

If you want to add some color to your file explorer, how about changing the colors of the folders?

You can change icons and colors of all folders by using a different icon and theme.

But you may also opt for just changing the colors of selected few folders.

![Custom Folder Color in Nautilus File Manager][18]

For that, install the following package.

```
sudo apt install folder-color
```

Now, quit Nautilus with **nautilus -q** command. Upon re-opening, select a folder and right-click on it. You will find the option to change the color of the folder.

![Change Folder Color Right Click Option][19]

A step further, you can add emblems to files or folders like important, favorite, etc.

![Folder and File Emblem in Nautilus][20]

#### 10. Change icons of individual directories

This one takes me back to the Windows XP era. Nautilus also has the built-in feature to change the icons of selected directories.

To do that, right-click on a folder and go to properties.

![properties dialog box of a directory][21]

From there, select the Icon, browse and choose the image of your choice.

![Changing Folder Icon][22]

#### 11. Open any location in the terminal

No need for any extra steps for this one. From any location in the file manager, just right-click and select ‘Open in terminal’ option.

![Open the current location in a terminal in Ubuntu][23]

It will open a new terminal, and you’ll be in the exact location as the Nautilus file manager.

![location opened in terminal][24]

This comes in handy when you have to do something in the terminal on the files in a particular location. It saves the effort of typing a long path.

#### 12. Open files and folder as root from the file manager

You sometimes want to paste files to restricted directories, like /usr/share/backgrounds. You cannot paste such locations or cannot edit such files unless you are root or use sudo.

You can easily switch do that in the terminal but what about the file manager?

With nautilus-admin extension, you can open files as root within Nautilus. No need to open the terminal and perform sudo actions.

```
sudo apt install nautilus-admin
```

Quit Nautilus after installing the plugin:

```
nautilus -q
```

You should see the “Open as Administrator” option in the right-click menu now.

![open as admin in nautilus][25]

#### 13. Verify hash checksum of files

There are dedicated tools to [verify checksum of files in Linux][26]. You can also check hashes in the Nautilus file manager with nautilus-gtkhash extension.

```
sudo apt install nautilus-gtkhash
```

Now quit nautilus using **nautilus -q** and re-open. Select the file to check hash and go to the **Digests** tab in properties.

![Check Hashes in Nautilus][27]

Now enter the Hash to check and press Hash. It will start calculating the hash.

![Nautilus Checking Hash Progress][28]

After some time, it will show the result (green tick mark if the hash is valid).

![Nautilus Checking Hash Success][29]

#### Bonus: Embed a terminal

In the Nautilus file manager, you can embed a terminal. Each time you change directories, a cd command is initiated and the location in the embedded terminal is also changed.

Installing it requires getting several Python packages first. Here are the commands, use them one by one:

```
sudo apt install python3-nautilus python3-psutil python3-pip libglib2.0-bin dconf-editor
sudo pip3 install nautilus-terminal
sudo nautilus-terminal --install-system
nautilus -q
```

![Embedded Terminal in Nautilus][30]

### There are more Nautilus extensions and tweaks

There is no end to customizing the GNOME file manager. I could only include a selected few. A few more I could think of are:

* Opening split view in Nautilus from the hamburger menu
* Showing or hiding the Places panel from preferences
* Integrating various cloud storage platforms like Google Drive, Dropbox, Nextcloud, Owncloud, etc
* Deleting items by dragging them into the trash folder
* Zooming in and out by pressing the Control key and scrolling

Check out the [guide on tweaking the Ubuntu dock][31] if you want more customization.

I hope you find a few interesting ones here. Which ones do you like the most? Do you know some other tweak that I didn’t mention here? Share it in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nautilus-tips-tweaks/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/customizing-GNOME-Nautilus-File-Manager.png
[2]: https://gitlab.gnome.org/GNOME/nautilus
[3]: https://itsfoss.com/wp-content/uploads/2022/07/Item-count-inside-folder-visible.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/GNOME-Nautilus-Preferences-scaled.webp
[5]: https://itsfoss.com/wp-content/uploads/2022/07/Nautilus-preferences.png
[6]: https://itsfoss.com/wp-content/uploads/2022/07/Nautilus-Empty-file-in-Templates-Directory.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/Nautilus-Right-Click-New-Document.png
[8]: https://itsfoss.com/wp-content/uploads/2022/07/Delete-option-in-nautilus-preferences.png
[9]: https://itsfoss.com/wp-content/uploads/2022/07/Delete-option-under-right-click-context-menu.png
[10]: https://itsfoss.com/recover-deleted-files-linux/
[11]: https://itsfoss.com/wp-content/uploads/2022/07/Secure-wipe-in-nautilus.png
[12]: https://itsfoss.com/wp-content/uploads/2022/07/preview-files-in-nautilus-using-gnome-sushi.png
[13]: https://itsfoss.com/wp-content/uploads/2022/07/List-of-directories-visited.png
[14]: https://itsfoss.com/add-remove-bookmarks-ubuntu/
[15]: https://itsfoss.com/wp-content/uploads/2022/07/add-folder-as-bookmark-GNOME-Files-scaled.webp
[16]: https://itsfoss.com/resize-images-with-right-click/
[17]: https://itsfoss.com/wp-content/uploads/2022/07/Rotate-and-Resize-Images-with-nautilus.png
[18]: https://itsfoss.com/wp-content/uploads/2022/07/Custom-Folder-Color-in-nautilus-file-manager-800x280.png
[19]: https://itsfoss.com/wp-content/uploads/2022/07/Change-Folder-Color-Right-Click-Option.png
[20]: https://itsfoss.com/wp-content/uploads/2022/07/Folder-and-File-Emblem-in-Nautilus.png
[21]: https://itsfoss.com/wp-content/uploads/2022/07/properties-dialog-box-of-a-directory-800x527.png
[22]: https://itsfoss.com/wp-content/uploads/2022/07/Changing-Folder-Icon.png
[23]: https://itsfoss.com/wp-content/uploads/2022/07/open-in-terminal-ubuntu-scaled.webp
[24]: https://itsfoss.com/wp-content/uploads/2022/07/location-opened-in-terminal-800x304.png
[25]: https://itsfoss.com/wp-content/uploads/2022/07/open-as-admin-in-nautilus-800x502.png
[26]: https://itsfoss.com/checksum-tools-guide-linux/
[27]: https://itsfoss.com/wp-content/uploads/2022/07/Check-hashes-in-nautilus.png
[28]: https://itsfoss.com/wp-content/uploads/2022/07/Nautilus-Checking-Hash-Progress.png
[29]: https://itsfoss.com/wp-content/uploads/2022/07/Nautilus-Checking-Hash-Success.png
[30]: https://itsfoss.com/wp-content/uploads/2022/07/Embedded-terminal-in-nautilus.png
[31]: https://itsfoss.com/customize-ubuntu-dock/
