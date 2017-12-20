translating by lujun9972
How to Create a .Desktop File For Your Application in Linux
======
A .desktop file is simply a shortcut that is used to launch application in Linux. Without the .desktop file, your application won't show up in the Applications menu and you can't launch it with third-party launchers such as Synapse and Albert.

Most applications, when installed, will create the .desktop file automatically and place themselves in the Application menu for quick access. However, if you compile a program from source or download an app in archive format, this may not be the case and you may have to open the terminal to execute the binary every time you want to use it. Obviously, this can become a very tedious and troublesome step.

This article will describe how you can create a .desktop file for any application you use that you can launch from the Application menu.

 **Related** : [How to Add App Drawers to Unity Launcher in Ubuntu][1]

### How to create Desktop launchers
A ".desktop" file is basically a simple text file that holds information about a program. It is usually placed in "~/.local/share/applications" or "/usr/share/applications/" depending whether you want the launcher to be accessible only for local account or for everyone. If you navigate to either directory in your File manager, you will see quite a few ".desktop" files that correspond to the installed apps on your computer.

For demonstration purposes, I will create a .desktop file for Super Tux Kart, a kart racing game which I like to play sometimes. A version is available in the Ubuntu repos, but this is often behind the latest stable version.

The only way to get the latest and greatest release is by downloading a tar archive, extracting it and executing a file which will launch the game.

You can follow along with whatever program you want to create a launcher for and it should work the same way.

 **Note** : The following steps assume you have the archive for the program you want to create a launcher for in your "Downloads" folder.

1\. Navigate to the directory where the archive is stored, right-click it and select "Extract here".

![application-launcher-5][2]

2\. Once the extraction is complete, Change to the newly created folder and find the executable. One you find it, right-click it click "Run" to launch the program, just to make sure it is working.

![application-launcher-6][3]

3\. In some cases, you won't see the "Run" option in the menu. This is often because the executable is a text file. You can get around this by executing it via the terminal or, if you use GNOME, click the Files menu in the top bar, and select "Preferences".

![application-launcher-linux-1][4]

4\. Select the "Behavior" tab and choose the "Run them" option under "Executable Text Files". Now the "Run" option should appear when you right-click the executable text file.

![application-launcher-31][5]

5\. If you've confirmed that the application works when you launch it, you can exit it. Then launch your text editor and paste the following into the empty text file:
```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/path/to/executable
Name=Name of Application
Icon=/path/to/icon
```

You need to change the "Exec" field to the path to the executable and "Name" field to the name of the application. Most programs would provide an icon somewhere in the archive so don't forget to include that as well. In my case, the launcher file for Super Tux Kart looks like this:

![application-launcher-supertuxkart][6]

6\. Save the file in "~/.local/share/applications" folder as "application-name.desktop". The ".local" folder is a hidden folder in your Home directory and you will have enable "Show Hidden Files" mode to view it. If you want it to be globally accessible, run the following command in the terminal:
```
sudo mv ~/.local/share/applications/<application-name.desktop> /usr/share/applications/
```

Of course, don't forget to change the <application-name.desktop> to the actual name of the .desktop file.

7\. Once done, just open the Applications menu on your desktop, and the application will be right there to use.

![application-launcher-2][7]

The method described here should work on all mainstream Linux based operating systems. Here's another screenshot showing Super Tux Kart in elementary OS's application launcher (slingshot)

![application-launcher-4][8]

Feel free to leave a comment below if you found this tutorial helpful.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/create-desktop-file-linux/

作者：[Ayo Isaiah][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/ayoisaiah/
[1]:https://www.maketecheasier.com/add-app-drawer-unity-launcher-ubuntu/ (How to Add App Drawers to Unity Launcher in Ubuntu)
[2]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-5.png (application-launcher-5)
[3]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-6.png (application-launcher-6)
[4]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-linux-1.png (application-launcher-linux-1)
[5]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-31.png (application-launcher-31)
[6]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-supertuxkart.png (application-launcher-supertuxkart)
[7]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-2.jpg (application-launcher-2)
[8]:https://www.maketecheasier.com/assets/uploads/2017/11/application-launcher-4.jpg (application-launcher-4)
