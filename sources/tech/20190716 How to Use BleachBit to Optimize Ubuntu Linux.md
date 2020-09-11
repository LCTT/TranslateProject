[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use BleachBit to Optimize Ubuntu Linux)
[#]: via: (https://itsfoss.com/use-bleachbit-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Use BleachBit to Optimize Ubuntu Linux
======

[BleachBit][1] is a cross-platform, free and [open source tool for helping you get rid of junk files][2] on your machine. It is powerful and easy to use, allowing you to not only delete junk files, but also to shred and wipe files. This is useful for keeping your keeping system clean and organized, as well as offering you well-deserved privacy.

In this article, I’m going to guide you through the installation process and show you how to make basic usage of BleachBit, while also including screenshots where needed.

![][3]

**Note:** _I’ll be using_ _**Ubuntu**_*, but the steps are similar for most Linux distributions.*

### Installing BleachBit on Ubuntu

The simplest way to install BleachBit is using the package manager or the software. Here you can search for **BleachBit** and when you find it, click on it and then press **Install**. Removing it is as simple as searching for it again and pressing **Remove**.

![BleachBit in Ubuntu Software Center][4]

If you are terminal lover, you can [use apt command][5] to install BleachBit:

```
sudo apt install bleachbit -y
```

However, this won’t install the latest version of BleachBit. At the time of writing this article, the [Ubuntu repositories][6] contain version 2.0, while the latest version is 2.2.

To get the latest version, you first of all have to go to the [official download page][7]:

![BleachBit Download Page][8]

Here, download the right package for your system (in my case it’s **Ubuntu 18.04 LTS**) by clicking on the corresponding link. It will download a .deb file. [Installing packages from deb files][9] is simple. Simply double click on it and it will run in the software center. Just click on install here.

### Using BleachBit to clean your system

Search for BleachBit and clcik on the **bleachbit** icon in the **Applications Menu**:

![Bleachbit In Applications Menu][10]

**Note:** _To run **BleachBit** with administrator privileges, click on the second icon (**BleachBit as Administrator/root)**._

Either of this methods should open up the **start screen**:

![BleachBit Start Screen][11]

This is the **Preferences** menu and you can open it up at any time by clicking **Edit &gt; Prefrences**.

[][12]

Suggested read  Top 5 CAD Software Available for Linux

Some **important options** include:

  * **Overwrite contents of files to prevent recovery**: although slower, this will actually **shred** your files. Files are normally marked as deleted and allowed to be overwritten if there isn’t any space left. However, selecting this options will fill the space with junk (that will still act as a deleted file), making the shredded file irrecoverable. Keep in mind that this process is slower.
  * **Languages**: here you can choose which languages to keep (although they don’t really take up that much space).
  * **Drives:** in this sub-menu you can add directories where all free space should be replaced with junk (as when shredding files), making sure no file can be recovered from those locations.



Closing the **Preferences** menu will leave you in the **Main Menu**:

![BleachBit Menu][13]

On the **left side**, you can select what type of files you want to delete (this includes system-wide files and application-specific files). Some of them require **administrator privileges** (such as APT cache and System-related options), and some of them will prompt warnings (such as Firefox warning you that your saved passwords will be deleted).

After making your selection, I suggest clicking on the **Preview** (the magnifying glass icon). This will show you exactly what is going to be deleted:

![BleachBit Preview][14]

By pressing **Clean** (the red circle), you are going to start the deleting process. You’ll get a message when **BleachBit** finishes:

![BleachBit Clean][15]

Another thing you can do is **quickly shred** or **wipe** a specific directory or file:

![BleachBit Quick Shred][16]

### Using BleachBit in command line

You can also use BleachBit in the terminal. To **list cleaners** run:

```
bleachbit -l
```

This will produce output in the vein of:

```
...
thunderbird.index
thunderbird.passwords
thunderbird.vacuum
transmission.blocklists
transmission.history
transmission.torrents
tremulous.cache
vim.history
vlc.mru
vuze.backup_files
vuze.cache
vuze.logs
vuze.tmp
warzone2100.logs
wine.tmp
winetricks.temporary_files
x11.debug_logs
xine.cache
yum.clean_all
yum.vacuum
...
```

Now you can run any cleaner or group of cleaners. For example:

```
bleachbit -c google_chrome* thunderbird.passwords
```

This command will delete all Google Chrome saved data and all saved Thunderbird passwords.

The CLI is useful because you can write bash scripts that execute BleachBit commands and you can even schedule cleaning actions using tools such as CRON.

[][17]

Suggested read  Use Evernote on Linux with These Tools

**Wrapping Up**

There are [ways to clean up Ubuntu][18] but having a dedicated GUI tool is always handy. Whether you are simply looking for a neat way to keep your system clean of any unnecessary data, optimizing your machine, or trying to keep your personal details safe, **BleachBit** is a tool that will surely come in handy, being so easy to get the hang of (while still being powerful).

Do you use any system cleaner? If so, which one and how? Let us know in the comments!

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-bleachbit-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.bleachbit.org/
[2]: https://itsfoss.com/ccleaner-alternatives-ubuntu-linux/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/how_to_use_bleachbit_to_optimize_ubuntu-e1563200895890-800x450.png?resize=800%2C450&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_ubuntu_software_center.png?fit=800%2C369&ssl=1
[5]: https://itsfoss.com/apt-command-guide/
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://www.bleachbit.org/download/linux
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_download_page.png?fit=800%2C455&ssl=1
[9]: https://itsfoss.com/install-deb-files-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_in_applications_menu.jpg?fit=800%2C276&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_start_screen.png?fit=800%2C656&ssl=1
[12]: https://itsfoss.com/cad-software-linux/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_menu.png?fit=800%2C659&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_preview.png?fit=800%2C650&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_clean.png?fit=800%2C653&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/bleachbit_shred.png?fit=800%2C435&ssl=1
[17]: https://itsfoss.com/evernote-on-linux/
[18]: https://itsfoss.com/free-up-space-ubuntu-linux/
