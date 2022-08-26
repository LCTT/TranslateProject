[#]: subject: "15 Ways to Tweak Nemo File Manager in Linux to Get More Out of it"
[#]: via: "https://itsfoss.com/nemo-tweaks/"
[#]: author: "sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

15 Ways to Tweak Nemo File Manager in Linux to Get More Out of it
======
Nemo is the default file manager of the Cinnamon Desktop. You get it in Linux Mint and other distributions with the Cinnamon desktop.

It’s a powerful file manager with plenty of features you might not know. Some tweaks are hidden inside the Nemo settings while some require installing additional extension packages.

I have included commands for installing extensions for Ubuntu and Debian-based distributions.

**Note: Please don’t go and install all the extensions. Only use the ones you would use.**

### 1. Enable quick file preview

Nemo Preview is a cool feature that comes in handy if you want to peek into some files on the go. You can access the preview feature for images, audio, video, PDF, etc.

It also allows scrolling the documents in preview mode and adds a floating control with a seek par in audio/video preview.

![File Preview in Nemo File Manager With Nemo Preview][1]

You can get the preview feature by installing the following extension:

```
sudo apt install nemo-preview
```

Once installed, you may need to restart the Nemo file manager.

To activate the preview, **select the file and press the Space key**. Pressing the space key again will close the preview.

### 2. Click twice to rename

This is one of the iconic features of Nemo file manager, which is already offered in Dolphin File Manager of KDE, but absent in Nautilus of Gnome.

To enable this setting, you need to go to Edit > Preferences > Behaviour and toggle the option as shown below:

![Click on File Name Twice to Rename It][2]

Once done, you can now click twice on a file/folder and an inline rename option appears to rename the respective selection.

### 3. Bulk rename files

Nemo also offers a bulk rename feature that many Linux users are not aware of.

What you have to do is, select the files and select **rename** from the right click. You’ll get different kinds of options to tweak the names of the selected group of files.

![Nemo File Manager Bulk Rename][3]

You can find and replace, remove certain parts of the name among many other things.

### 4. Double click anywhere to go to the parent folder

This is rather an accessibility setting. Instead of pressing the back button or clicking on the places tree, you can simply double-click anywhere in the empty space in the window to go to the parent folder.

To enable this feature, go to Edit > Preferences > Behaviour and toggle on the option as shown in the screenshot below.

![Double Click on Blank Area to go to Parent Folder][4]

### 5. Compress files and folders

This is not a secret really. Almost all file managers have this option as far as I know.

Right click on a file or folder and you get the Compress option to create an archive file.

![Compress Option in Right Click Context Menu][5]

You can choose between formats like .7z, .tar, .zip to .apk, .epub. etc. Some compression methods like epub requires their own defined formats to succeed.

![Compress Options][6]

Some compression formats support password protection, encryption and splitting, as shown in the above screenshot.

If you did not find this option, you could install the package nemo-fileroller:

```
sudo apt install nemo-fileroller
```

### 6. Configure the right-click context menu

By default, there are many options in the right-click context menu. If you are one of those users who want to control what appears on your right-click menu, this is the feature for you.

You can access this setting from Edit > Preferences > Context Menus:

![Configure Right Click Context Menu][7]

Here you can toggle on or off various options you want to appear when you right-click anywhere. You can now populate your right-click menu with features you use frequently.

### 7. Rotate and resize images with right click 

To enable this feature, you need to install nemo-image-converter package.

```
sudo apt install nemo-image-converter
```

Restart Nemo and you can access the additional options right within the right-click context menu.

![Rotate or Resize Images in Nemo File Manager][8]

### 8. Change folder colours and add emblems

The feature to change folder colour was preinstalled on my Linux Mint 21. To change individual folder colour, right-click on the file and change colour from the context menu.

![Change Individual Folder Color][9]

If you don’t see it, you can install the extension:

```
sudo apt install folder-color-switcher
```

Another cool feature is to add emblems to files and folders. To give an emblem to a file or folder, right-click and go to the properties dialog box.

From this, select the emblems tab and add whatever emblem you like.

![Select Emblems for Files or Folders][10]

If it’s not installed by default, you can install it by:

```
sudo apt install nemo-emblems
```

### 9. Verify checksum of files

There are dedicated tools to [verify checksum of files in Linux][11]. You can also check hashes in the Nemo file manager with nemo-gtkhash extension.

```
sudo apt install nemo-gtkhash
```

Now quit nemo and re-open. Select the file to check hash and go to the **Digests** tab in properties.

![Check Hash Checksum of File with Nemo GTKHash][12]

It will take some time to check the hash and a tick mark, as shown in the above screenshot, indicates a successful result.

### 10. Use advanced permissions in properties dialog box

Now, you can view amore detailed an an intuitive permission dialog box for folders and file. To get this, you need to go to Edit > Preferences > Display and toggle the button on as shown below:

![Show Advanced Permission in Property Dialog Box][13]

Now, instead of the old, drop-down menu interface, you get a neat-looking permission manager with a toggle button interface and more options to tweak.

![Edit Advanced Permissions in Property Dialog Box][14]

### 11. Embed a terminal

Fancy a terminal? You can get it right inside the Nemo file manager.

Each time you change directories, a cd command is initiated and the location in the embedded terminal is also changed.

To get this function, you need to install nemo-terminal package.

```
sudo apt install nemo-terminal
```

Now restart Nemo and you get an embed terminal on the top side.

![Nemo Embedded Terminal][15]

### 12. Get the list of recently visited directories

There is the “Recent” option in the places section, where you can see the recently accessed files. But what about the recently visited folders?

In Nemo, on the top left, **right-click on the back arrow** to get the list of previously visited folders.

![Right Click on Top Left Back Arrow to Access Recent Folders][16]

### 13. Show the number of items in folders

You can show how many files and folders are inside a folder in Nemo File Manager.

![Show Number of Items Inside Folder Using Nemo File Manager][17]

It is a built-in feature. Go to Edit > Preferences > Display and select Size as shown in the screenshot below:

![Show Folder Item Count and File Sizes in Nemo Preferences][18]

### 14. Nemo media columns

This is a small addition, useful only if you use the ‘List View’ in Nemo. It provides additional column options in the list view.

![default list columns available in nemo][19]

![more media columns added to nemo list view][20]

To get this feature, you need to install nemo-media-columns:

```
sudo apt install nemo-media-columns
```

![More Columns View in Nemo List View][21]

### 15. Nemo Scripts and Actions (for expert users)

Here are a few advanced features that enhances the overall function of nemo file manager by adding user defined functions.

#### Nemo Scripts

With this feature, users can create their own shell scripts for certain functionality they wish and embed them into the right-click context menu.

You need to save your shell scripts in ~/.local/share/nemo/scripts directory. With the help of tools like [zenity][22], you can even give a GTK interface for your script.

Let me show an example.

Below is a script adding a color palette to select colour and copy the colour to [copyq clipboard manager][23]. Save the file with name Color in the above-mentioned directory and give it executable permission. Copyq and Zenity should be installed.

```
#!/bin/bash
name=$(zenity --color-selection --show-palette --title Color\ Select)
copyq add $name
```

![Nemo Scripts in Right Click Context][24]

![Color Select with Zenity][25]

The selected color code will now be accessible from the clipboard.

#### Nemo Actions

This is similar to Nemo Scripts. Here, you can define a script in the form of a key-value pair for additional functions over selected files.

The files should have extension `.nemo_action` and they should be located in `~/.local/share/nemo/actions`

Here is a snippet of code provided in the Linux Mint Community. It creates an option to reduce the image size by 50%.

Save this script as reduce_50.nemo_action in the above-mentioned directory and you will find the option in right-click context menu

```
[Nemo Action]
Active=true
Name=Reduce Image 50%
Comment=Reduce the size of the image by 50%
Exec=ffmpeg -i %F -vf scale=iw/2:-1 copy-50%f
Icon-Name=image
Selection=any;
Extensions=jpg;jpeg;png;bmp;gif;tiff;raw;
Terminal=true
```

![Reduce Image by 50 Percent Context Menu Entry][26]

You can see the resultant file with the slightly modified name.

![Image Reduced with Nemo Actions Result][27]

This way, you effectively enhance Nemo file manager functionality as per your requirement.

### More tweaks and extensions

Apart from numerous extensions, there are other built-in features in Nemo like integrations with cloud services, other handy right-click menu items etc.

It is not necessary for you to install and use all of the features mentioned above. You can handpick those that suit your needs.

You can also **toggle on/off any of the installed extensions** by going to Edit > Plugins (or Alt + P).

![Access Plugins from Menu][28]

Here, you can manage your installed plugins, actions, scripts etc. This enables you to activate or deactivate certain features without the hassle of installing/uninstalling packages. Every feature can be toggled on or off as needed. Just restart Nemo to get the effect.

![Plugins View and Manage in Nemo][29]

When we last published the [Nautilus tweak article][30], a few readers requested a similar one for Nemo. And hence this article came into existence.

I hope you find the tweaks interesting. If you have suggestions or questions, please leave a comment.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nemo-tweaks/

作者：[sreenath][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/08/file-preview-in-nemo-file-manager-with-nemo-preview.png
[2]: https://itsfoss.com/wp-content/uploads/2022/08/click-on-file-name-twice-to-rename-it.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/nemo-file-manager-bulk-rename.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/double-click-on-blank-area-to-go-to-parent-folder.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/compress-option-in-right-click-context-menu.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/compress-options.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/configure-right-click-context-menu.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/rotate-or-resize-images-in-nemo-file-manager.png
[9]: https://itsfoss.com/wp-content/uploads/2022/08/change-individual-folder-color.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/select-emblems-for-files-or-folders.png
[11]: https://itsfoss.com/checksum-tools-guide-linux/
[12]: https://itsfoss.com/wp-content/uploads/2022/08/check-hash-checksum-of-file-with-nemo-gtkhash.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/show-advanced-permission-in-property-dialog-box.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/edit-advanced-permissions-in-property-dialog-box.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/nemo-embedded-terminal.png
[16]: https://itsfoss.com/wp-content/uploads/2022/08/right-click-on-top-left-back-arrow-to-access-recent-folders.png
[17]: https://itsfoss.com/wp-content/uploads/2022/08/show-number-of-items-inside-folder-using-nemo-file-manager.png
[18]: https://itsfoss.com/wp-content/uploads/2022/08/show-folder-item-count-and-file-sizes-in-nemo-preferences.png
[19]: https://itsfoss.com/wp-content/uploads/2022/08/default-list-columns-available-in-nemo.png
[20]: https://itsfoss.com/wp-content/uploads/2022/08/more-media-columns-added-to-nemo-list-view.png
[21]: https://itsfoss.com/wp-content/uploads/2022/08/more-columns-view-in-nemo-list-view.png
[22]: https://help.gnome.org/users/zenity/stable/
[23]: https://itsfoss.com/copyq-clipboard-manager/
[24]: https://itsfoss.com/wp-content/uploads/2022/08/nemo-scripts-in-right-click-context.png
[25]: https://itsfoss.com/wp-content/uploads/2022/08/color-select-with-zenity.png
[26]: https://itsfoss.com/wp-content/uploads/2022/08/reduce-image-by-50-percent-context-menu-entry.png
[27]: https://itsfoss.com/wp-content/uploads/2022/08/image-reduced-with-nemo-actions-result.png
[28]: https://itsfoss.com/wp-content/uploads/2022/08/access-plugins-from-menu.png
[29]: https://itsfoss.com/wp-content/uploads/2022/08/plugins-view-and-manage-in-nemo.png
[30]: https://itsfoss.com/nautilus-tips-tweaks/
