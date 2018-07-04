translating----geekpi

Automatically Change Wallpapers in Linux with Little Simple Wallpaper Changer
======

**Brief: Here is a tiny script that automatically changes wallpaper at regular intervals in your Linux desktop.**

As the name suggests, LittleSimpleWallpaperChanger is a small script that changes the wallpapers randomly at intervals.

Now I know that there is a random wallpaper option in the ‘Appearance’ or the ‘Change desktop background’ settings. But that randomly changes the pre-installed wallpapers and not the wallpapers that you add.

So in this article, we’ll be seeing how to set up a random desktop wallpaper setup consisting of your photos using LittleSimpleWallpaperChanger.

### Little Simple Wallpaper Changer (LSWC)

[LittleSimpleWallpaperChanger][1] or LSWC is a very lightweight script that runs in the background, changing the wallpapers from the user-specified folder. The wallpapers change at a random interval between 1 to 5 minutes. The software is rather simple to set up, and once set up, the user can just forget about it.

![Little Simple Wallpaper Changer to change wallpapers in Linux][2]

#### Installing LSWC

Download LSWC by [clicking on this link.][3] The zipped file is around 15 KB in size.

  * Browse to the download location.
  * Right click on the downloaded .zip file and select ‘extract here’.
  * Open the extracted folder, right click and select ‘Open in terminal’.
  * Copy paste the command in the terminal and hit enter.
`bash ./README_and_install.sh`
  * Now a dialogue box will pop up asking you to select the folder containing the wallpapers. Click on it and then select the folder that you’ve stored your wallpapers in.
  * That’s it. Reboot your computer.



![Little Simple Wallpaper Changer for Linux][4]

#### Using LSWC

On installation, LSWC asks you to select the folder containing your wallpapers. So I suggest you create a folder and move all the wallpapers you want to use there before we install LSWC. Or you can just use the ‘Wallpapers’ folder in the Pictures folder. **All the wallpapers need to be .jpg format.**

You can add more wallpapers or delete the current wallpapers from your selected folder. To change the wallpapers folder location, you can edit the location of the wallpapers in the
following file.
```
.config/lswc/homepath.conf

```

#### To remove LSWC

Open a terminal and run the below command to stop LSWC
```
pkill lswc

```

Open home in your file manager and press ctrl+H to show hidden files, then delete the following files:

  * ‘scripts’ folder from .local
  * ‘lswc’ folder from .config
  * ‘lswc.desktop’ file from .config/autostart



There you have it. How to create your own desktop background slideshow. LSWC is really lightweight and simple to use. Install it and then forget it.

LSWC is not very feature rich but that intentional. It does what it intends to do and that is to change wallpapers. If you want a tool that automatically downloads wallpapers try [WallpaperDownloader][5].

Do share your thoughts on this nifty little software in the comments section below. Don’t forget to share this article. Cheers.

--------------------------------------------------------------------------------

via: https://itsfoss.com/little-simple-wallpaper-changer/

作者：[Aquil Roshan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/aquil/
[1]:https://github.com/LittleSimpleWallpaperChanger/lswc
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/Little-simple-wallpaper-changer-2-800x450.jpg
[3]:https://github.com/LittleSimpleWallpaperChanger/lswc/raw/master/Lswc.zip
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/Little-simple-wallpaper-changer-1-800x450.jpg
[5]:https://itsfoss.com/wallpaperdownloader-linux/
