How to Install Light Table 0.8 in Ubuntu 14.04, 15.10
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2014/11/LightTable-IDE-logo-icon.png)

The Light Table IDE has just reached a new stable release after more than one year of development. Now it provides 64-bit only binary for Linux.

Changes in LightTable 0.8.0:

- CHANGED: We have switched to Electron from NW.js
- CHANGED: LT’s releases and self-updating processes are completely in the open on Github
- ADDED: LT can be built from source with provided scripts across supported platforms
- ADDED: Most of LT’s node libraries are installed as npm dependencies instead of as forked libraries
- ADDED: Significant documentation. See more below
- FIX: Major usability issues on >= OSX 10.10
- CHANGED: 32-bit linux is no longer an official download. Building from source will still be supported
- FIX: ClojureScript eval for modern versions of ClojureScript
- More details at [github.com/LightTable/LightTable/releases][1]

![LightTable 0.8.0](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-08.jpg)

### How to Install Light Table 0.8.0 in Ubuntu: ###

Below steps show you how to install the official binary in Ubuntu. Works on all current Ubuntu releases (**64-bit only**).

Before getting started, please make a backup if you have a previous release installed.

**1.** Download the Linux binary from link below:

- [lighttable-0.8.0-linux.tar.gz][2]

**2.** Open terminal from Unity Dash, App Launcher, or via Ctrl+Alt+T keys. When it opens, paste below command and hit enter:

    gksudo file-roller ~/Downloads/lighttable-0.8.0-linux.tar.gz

![open-via-fileroller](http://ubuntuhandbook.org/wp-content/uploads/2015/12/open-via-fileroller.jpg)

Install `gksu` from Ubuntu Software Center if the command does not work.

**3.** Previous command opens the downloaded archive via Archive Manager using root user privilege.

When it opens, do:

- right-click and rename the folder name to **LightTable**
- extract it to **Computer -> /opt/** directory.

![extract-lighttable](http://ubuntuhandbook.org/wp-content/uploads/2015/12/extract-lighttable.jpg)

Finally you should have the LightTable installed to /opt/ directory:

![lighttable-in-opt](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-in-opt.jpg)

**4.** Create a launcher so you can start LightTable from Unity Dash or App Launcher.

Open terminal and run below command to create & edit a launcher file for LightTable:

    gksudo gedit /usr/share/applications/lighttable.desktop

When the file opens via Gedit text editor, paste below and save the file:

    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Light Table
    GenericName=Text Editor
    Comment=Open source IDE that modify, from running programs to embed websites and games
    Exec=/opt/LightTable/LightTable %F
    Terminal=false
    MimeType=text/plain;
    Icon=/opt/LightTable/resources/app/core/img/lticon.png
    Categories=TextEditor;Development;Utility;
    StartupNotify=true
    Actions=Window;Document;
    
    Name[en_US]=Light Table
    
    [Desktop Action Window]
    Name=New Window
    Exec=/opt/LightTable/LightTable -n
    OnlyShowIn=Unity;
    
        [Desktop Action Document]
    Name=New File
    Exec=/opt/LightTable/LightTable --command new_file
    OnlyShowIn=Unity;

So it looks like:

![lighttable-launcher](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-launcher.jpg)

Finally launch the IDE from Unity Dash or Application Launcher and enjoy!

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/12/install-light-table-0-8-ubuntu-14-04/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://github.com/LightTable/LightTable/releases
[2]:https://github.com/LightTable/LightTable/releases/download/0.8.0/lighttable-0.8.0-linux.tar.gz