Arch Linux Applications Automatic Installation Script
======

![](https://www.ostechnix.com/wp-content/uploads/2017/07/ArchI0-Arch-Linux-Applications-Automatic-Installation-Script-720x340.png)

Howdy Archers! Today, I have stumbled upon an useful utility called **“ArchI0”** , a CLI menu-based Arch Linux applications automatic installation script. This script provides an easiest way to install all essential applications for your Arch-based distribution. Please note that **this script is meant for noobs only**. Intermediate and advanced users can easily figure out [**how to use pacman**][1] to get things done. If you want to learn how Arch Linux works, I suggest you to manually install all software one by one. For those who are still noobs and wanted an easy and quick way to install all essential applications for their Arch-based systems, make use of this script.

### ArchI0 – Arch Linux Applications Automatic Installation Script

The developer of this script has created two scripts namely **ArchI0live** and **ArchI0**. You can use ArchI0live script to test without installing it. This might be helpful to know what actually is in this script before installing it on your system.

### Install ArchI0

To install this script, Git cone the ArchI0 script repository using command:
```
$ git clone https://github.com/SifoHamlaoui/ArchI0.git

```

The above command will clone the ArchI0 GtiHub repository contents in a folder called ArchI0 in your current directory. Go to the directory using command:
```
$ cd ArchI0/

```

Make the script executable using command:
```
$ chmod +x ArchI0live.sh

```

Run the script with command:
```
$ sudo ./ArchI0live.sh

```

We need to run this script as root or sudo user, because installing applications requires root privileges.

> **Note:** For those wondering what all are those commands for at the beginning of the script, the first command downloads **figlet** , because the script logo is shown using figlet. The 2nd command install **Leafpad** which is used to open and read the license file. The 3rd command install **wget** to download files from sourceforge. The 4th and 5th commands are to download and open the License File on leafpad. And, the final and 6th command is used to close the license file after reading it.

Type your Arch Linux system’s architecture and hit ENTER key. When it asks to install the script, type y and hit ENTER.

![][3]

Once it is installed, you will be redirected to the main menu.

![][4]

As you see in the above screenshot, ArchI0 has 13 categories and contains 90 easy-to-install programs under those categories. These 90 programs are just enough to setup a full-fledged Arch Linux desktop to perform day-to-day activities. To know about this script, type **a** and to exit this script type **q**.

After installing it, you don’t need to run the ArchI0live script. You can directly launch it using the following command:
```
$ sudo ArchI0

```

It will ask you each time to choose your Arch Linux distribution architecture.
```
This script Is under GPLv3 License

Preparing To Run Script
 Checking For ROOT: PASSED
 What Is Your OS Architecture? {32/64} 64

```

From now on, you can install the program of your choice from the categories listed in the main menu. To view the list of available programs under a specific category, enter the category number. Say for example, to view the list of available programs under **Text Editors** category, type **1** and hit ENTER.
```
This script Is under GPLv3 License

[ R00T MENU ]
Make A Choice
 1) Text Editors
 2) FTP/Torrent Applications
 3) Download Managers
 4) Network managers
 5) VPN clients
 6) Chat Applications
 7) Image Editors
 8) Video editors/Record
 9) Archive Handlers
 10) Audio Applications
 11) Other Applications
 12) Development Environments
 13) Browser/Web Plugins
 14) Dotfiles
 15) Usefull Links
 ------------------------
 a) About ArchI0 Script
 q) Leave ArchI0 Script

Choose An Option: 1

```

Next, choose the application you want to install. To return to main menu, type **q** and hit ENTER.

I want to install Emacs, so I type **3**.
```
This script Is under GPLv3 License

[ TEXT EDITORS ]
 [ Option ] [ Description ]
 1) GEdit
 2) Geany
 3) Emacs
 4) VIM
 5) Kate
 ---------------------------
 q) Return To Main Menu

Choose An Option: 3

```

Now, Emacs will be installed on your Arch Linux system.

![][5]

Press ENTER key to return to main menu after installing the applications of your choice.

### Conclusion

Undoubtedly, this script makes the Arch Linux user’s life easier, particularly the beginner’s. If you are looking for a fast and easy way to install applications without using pacman, then this script might be a good choice. Give it a try and let us know what you think about this script in the comment section below.

And, that’s all. Hope this tool helps. We will be posting useful guides every day. If you find our guides useful, please share them on your social, professional networks and support OSTechNix.

Cheers!!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/archi0-arch-linux-applications-automatic-installation-script/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/getting-started-pacman/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk-ArchI0_003.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk-ArchI0_004-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/07/pacman-as-superuser_005.png
