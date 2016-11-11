HOW TO SHARE STEAM GAME FILES BETWEEN LINUX AND WINDOWS
============

[![How to share steam games between Linux and Windows](https://itsfoss.com/wp-content/uploads/2016/10/share-games-linux-windows-steam.jpg)][16]

_Brief: This detailed guide shows you how to share Steam game files between Linux and Windows to save download time and data._

If you are or want to be a committed Linux gamer and have games on [Steam][15] that are supported both on Linux and Windows, or have dual booting OSs for the same reason, you might want to consider reading this.

There are many of us gamers who [dual boot Linux with Windows][14].  Some of us would have had only Linux had it not been for those games which have not yet arrived on Steam for Linux. Hence we keep both of the OSs so that we can play all of our favourite games regardless of the platforms they arrive on.

Thankfully, the [Linux gaming][13] community is emerging gracefully and we are having more and more popular Steam for Windows games being launched on Steam for Linux.

Many of us like to backup our Steam games so we won’t have to wait for downloads to complete. These collections are a majority of Steam for Windows games.

Now there are so many of these games that have arrived on [Steam for Linux][12] as well, such as Life is Strange, Tomb Raider 2013, Shadow of Mordor, XCOM: Enemy Unknown, XCOM 2, Race The Sun, Road Redemption, SUPERHOT,…and the [list grows on][11]! We also have the [upcoming Deus Ex: Mankind Divided][10] and [Mad Max][9]!!! Instead of years, nowadays we only have to wait for months for such titles after Windows releases and this is big news!

This experimental method shows you how to use your existing game files on either platform to restore the majority of the game data files on Steam. This results in having much lesser waiting times for you to enjoy the game as the files are pretty much common between the two OSs as we are going to see in the following example.

In the following method, we show you step by step procedures to attempt both Steam’s own backup and restore feature and the manual way. While we’re at it, we will also show you the similarities and differences in the game file structures between both platforms so that you too can explore and come up with your own tweaks.

In this method, we’ve used Ubuntu 14.04 LTS and Windows 10 to perform the backup and restore Steam tests.

### #1 : STEAM’S OWN BACKUP AND RESTORE

When we tried to use a Windows Steam Backup of SUPERHOT on Linux(encrypted files in .csd format), Steam for Linux failed to recognise any of the files and started downloading the entire game from 0 MB!  Even on doing a validation check, a vast majority of the files could not be identified by Steam. We also did a similar test on  Windows, but the result was the same!

![steam-restore-failure-from-windows-backup](https://itsfoss.com/wp-content/uploads/2016/10/steam-restore-failure-from-windows-backup.jpeg)

![steam-validation-failure](https://itsfoss.com/wp-content/uploads/2016/10/steam-validation-failure.jpeg)

Time for some manual tweaks to share Steam games between Windows and Linux!

### #2 : MANUAL METHOD

First, we took a look at the locations(user directory in home) where the game’s files were present on Linux:

This is the default installation location for Steam for Linux. “.local” and “.steam” directories are hidden by default and you would have to unhide them. We would recommend having a custom Steam installation location for easier handling of files. Here “SUPERHOT.x86_64” is the native Linux “executable” unlike a “.exe” file in Windows:

![superhot_data1](https://itsfoss.com/wp-content/uploads/2016/10/superhot_data1-e1477112816241.jpeg)

This is the location which contains the majority of the files that we need(common between Windows and Linux):

![superhot_data2](https://itsfoss.com/wp-content/uploads/2016/10/superhot_data2.jpeg)

Here below we see .acf files. “appmanifest_322500.acf” is the one we need. Editing and tweaking this file helps a lot to make Steam recognise existing unencrypted raw file backups present in the “common” directory:

![steam_linux_manifests](https://itsfoss.com/wp-content/uploads/2016/10/steam_linux_manifests-e1477112765133.jpeg)

To confirm the same, just open the file with an editor and check. The more we understand this file, the better. Here is [a post on the Steam forums][8] that shows its major significance. It looks something like this:

It looks something like this:

```
“AppState”
{
“appid”        “322500”
“Universe”        “1”
“name”        “SUPERHOT”
“StateFlags”        “4”
“installdir”        “SUPERHOT”
“LastUpdated”        “1474466631”
“UpdateResult”        “0”
“SizeOnDisk”        “4156100762”
“buildid”        “1234395”
“LastOwner”       “<SteamID>”
“BytesToDownload”        “909578688”
“BytesDownloaded”        “909578688”
“AutoUpdateBehavior”        “0”
“UserConfig”
{
“Language”        “english”
}
“MountedDepots”
{
“322503”        “1943012315434556837”
}
}
```

After uninstalling the game on Linux to try the test, we now have a look at the contents of the same game on Windows 10:

![superhot-windows-steam](https://itsfoss.com/wp-content/uploads/2016/10/superhot-windows-steam.jpeg)![superhot-windows-steam2](https://itsfoss.com/wp-content/uploads/2016/10/superhot-windows-steam2.jpeg)

We copied the “SUPERHOT” folder and also the manifest(.acf) file(it is created in the same format in Steam for Windows). While copying the .acf file and the directory to their respective locations on Steam for Linux, we made sure Steam wasn’t running in the background.

After the transfer was complete, we ran Steam and saw this:

![most-files-recognised-on-steam](https://itsfoss.com/wp-content/uploads/2016/10/most-files-recognised-on-steam.jpeg)

So instead of the entire 867.4 MB, it now shows 235.5 MB of files to download and that means more than 70% of the files have been identified by Steam :) ! So this is a massive time gain, relatively speaking. While this might vary for different games, of course, this is definitely worth a try for gamers who have below-average/average internet connections especially when the “heavy duty” games are considered that are mostly sized at around 40-50 GB these days.

Other tweaks that we tried:

*   We tried using a backup version of the original manifest file for Linux along with the Windows manual backup. But that resulted in Steam downloading the game for the beginning.
*   We can see that the data files are in a folder named “SH_Data” on Windows instead of  the directory, “SUPERHOT_Data” as on Linux. Changing it did not make any difference in the above result.

### AN ATTEMPT TO UNDERSTAND THE MANIFEST FILE

The manifest file can certainly be edited and tweaked for improving these results to make Steam detect as many files as it can.

There is a [project on Github][7] which is a python script to generate these manifest files. AppIDs for any Steam game can be obtained from [SteamDB][6]. By knowing the App ID, you can create your own manifest file with your favourite editor by using the following format: “appmanifest_<AppID>.acf” . In the above manual method, we can see that the AppID for SUPERHOT is 322500\. Hence the filename would be appmanifest_322500.acf .

Let’s try to document it within the file according to our best interpretations:

```
“AppState”                                                              // The State of the Application(Game)
{
“appid”        “322500”                                          // The Steam Application ID of the Game
“Universe”        “1”
“name”        “SUPERHOT”                                 // Game Name
“StateFlags”        “4”
“installdir”        “SUPERHOT”                         // Installation Directory Name
“LastUpdated”        “1474466631”
“UpdateResult”        “0”
“SizeOnDisk”        “4156100762”
“buildid”        “1234395”
“LastOwner”        “<SteamID>”                      // Unique <SteamID> for account owner in numerical format
“BytesToDownload”        “909578688”        // Divide this number by 1073741824(1024 x 1024 x 1024) to calculate data remaining to download in GB.
“BytesDownloaded”        “909578688”        // Bytes downloaded
“AutoUpdateBehavior”        “0”                    // The game will update automatically when this is set to 0.

“UserConfig”                                                    // User Configuration
{
“Language”        “english”
}
“MountedDepots”                                           //  This section is mostly related to Game DLCs
{
“322503”        “1943012315434556837”
}
}
```

By calculating the data download size in GB/MB, you can compare it with what Steam shows and try more tweaks.

Please share with us in the comments if you know about more such tips and tricks/suggestions about the manifest file or other improvements/ways for manual workarounds. We are yet to discover a complete documentation for these file formats as it not yet available officially in the [Valve Developer Community][5] or in [the forums][4].

But for now, these are the best ways to share Steam games between Linux and Windows.

--------------------------------------------------------------------------------

via: https://itsfoss.com/share-steam-files-linux-windows/

作者：[Avimanyu Bandyopadhyay][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/avimanyu/
[1]:http://pinterest.com/pin/create/button/?url=https://itsfoss.com/share-steam-files-linux-windows/&description=How+To+Share+Steam+Game+Files+Between+Linux+And+Windows&media=https://itsfoss.com/wp-content/uploads/2016/10/share-games-linux-windows-steam.jpg
[2]:https://www.linkedin.com/cws/share?url=https://itsfoss.com/share-steam-files-linux-windows/
[3]:https://twitter.com/share?original_referer=https%3A%2F%2Fitsfoss.com%2F&source=tweetbutton&text=How+To+Share+Steam+Game+Files+Between+Linux+And+Windows&url=https%3A%2F%2Fitsfoss.com%2Fshare-steam-files-linux-windows%2F&via=%40itsfoss
[4]:http://steamcommunity.com/discussions/
[5]:https://developer.valvesoftware.com/wiki/Main_Page
[6]:https://steamdb.info/
[7]:https://github.com/dotfloat/steam-appmanifest
[8]:https://steamcommunity.com/app/292030/discussions/0/357286663676318082/
[9]:http://www.kotaku.com.au/2016/10/avalanche-studios-mad-max-arrives-on-linux-and-mac-os/
[10]:https://itsfoss.com/deus-ex-mankind-divided-linux/
[11]:https://itsfoss.com/best-linux-games/
[12]:https://itsfoss.com/install-steam-ubuntu-linux/
[13]:https://itsfoss.com/linux-gaming-guide/
[14]:https://itsfoss.com/guide-install-elementary-os-luna/
[15]:http://store.steampowered.com/
[16]:https://itsfoss.com/wp-content/uploads/2016/10/share-games-linux-windows-steam.jpg
