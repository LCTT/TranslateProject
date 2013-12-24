翻译中 Luox

10 Lesser Known Useful Linux Commands- Part V
================================================================================
After four highly appreciated and such a successful series of Articles on “**Lesser Known Linux Commands**” we are here presenting you the last article on this series, obviously not the least. The previous articles are:

![](http://www.tecmint.com/wp-content/uploads/2013/12/10-Lesser-Known-Useful-Commands-V.png)

- [11 Lesser Known Useful Linux Commands – Part I][1]
- [10 Lesser Known Linux Commands – Part II][2]
- [10 Lesser Known Commands for Linux – Part III][3]
- [10 Lesser Known Effective Linux Commands – Part IV][4]

### 42. lsb_release ###

The command ‘lsb_release‘ print distribution-specific information. If **lsb_release** is not installed, you can apt ‘**lsb-core**‘ on Debian or yum ‘**redhat-lsb**‘ on **Red Hat** the package.

    # lsb_release -a

    LSB Version:    :base-4.0-ia32:base-4.0-noarch:core-4.0-ia32:core-4.0-noarch:graphics-4.0-ia32:
    Distributor ID: CentOS
    Description:    CentOS release 6.3 (Final)
    Release:        6.3
    Codename:       Final

**Note:** Option ‘**-a**‘, shows all the available information in respect of **version, id, description, release** and **codename**.

### 43. nc -zv localhost 80 ###

Check if port **80** is open or not. We can replace ‘**80**‘ with any other port number to check if it is opened or closed.

    $ nc -zv localhost 80

    Connection to localhost 80 port [tcp/http] succeeded!

Check if port **8080** is open or not.

    $ nc -zv localhost 8080

    nc: connect to localhost port 8080 (tcp) failed: Connection refused

### 44. curl ipinfo.io ###

The below command will output the ‘**Geographical Location**‘ of the **IP address**, provided.

    $ curl ipinfo.io 

    "ip": "xx.xx.xx.xx",
    "hostname": "triband-del-aa.bbb.cc.ddd.bol.net.in",
    "city": null,
    "region": null,
    "country": "IN",
    "loc": "20,77",
    "org": "AS17813 Mahanagar Telephone Nigam Ltd."

### 45. find . -user root ###

The below command output the files with respect of the user (**root**) owned files. All the files owned by user ‘root’ in the current directory.

    # find . -user root

    ./.recently-used.xbel
    ./.mysql_history
    ./.aptitude
    ./.aptitude/config
    ./.aptitude/cache
    ./.bluefish
    ./.bluefish/session-2.0
    ./.bluefish/autosave
    ./.bash_history

All the files owned by user ‘**avi**‘ in the current directory.

    # find . -user avi

    ./.cache/chromium/Cache/f_002b66
    ./.cache/chromium/Cache/f_001719
    ./.cache/chromium/Cache/f_001262
    ./.cache/chromium/Cache/f_000544
    ./.cache/chromium/Cache/f_002e40
    ./.cache/chromium/Cache/f_00119a
    ./.cache/chromium/Cache/f_0014fc
    ./.cache/chromium/Cache/f_001b52
    ./.cache/chromium/Cache/f_00198d
    ./.cache/chromium/Cache/f_003680

### 46. sudo apt-get build-dep ffmpeg ###

The below command will build the dependency, automatically during the corresponding package installation. Hence the process of package installation is very much fluent and easy.

    # apt-get build-dep ffmpeg

    libxinerama-dev libxml-namespacesupport-perl libxml-sax-expat-perl
    libxml-sax-perl libxml-simple-perl libxrandr-dev libxrender-dev
    x11proto-render-dev x11proto-xinerama-dev xulrunner-dev
    The following packages will be upgraded:
    libpixman-1-0
    1 upgraded, 143 newly installed, 0 to remove and 6 not upgraded.
    Need to get 205 MB of archives.
    After this operation, 448 MB of additional disk space will be used.
    Do you want to continue [Y/n]?

### 47. lsof -iTCP:80 -sTCP:LISTEN ###

The below command outputs, name of **process/service** using a specific port **80**. To better understand run the following command on port **80**, it will list all **services/processes** running on port.

    root@localhost:/home/avi# lsof -iTCP:80 -sTCP:LISTEN

    COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
    apache2 1566 root 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1664 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1665 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1666 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1667 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1668 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)

Same way, you can also check the running services/processes of port **22**.

    root@localhost:/home/avi# lsof -iTCP:22 -sTCP:LISTEN

    COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
    sshd 2261 root 3u IPv4 8366 0t0 TCP *:ssh (LISTEN)
    sshd 2261 root 4u IPv6 8369 0t0 TCP *:ssh (LISTEN)

### 48. find -size +100M ###

The find command lists all the files in the current directory above the specified size (here **100 MB**), recursively.

    # find -size +100M

    ./.local/share/Trash/files/linuxmint-15-cinnamon-dvd-32bit.iso
    ./Downloads/Fedora-Live-Desktop-i686-19-1.iso
    ./Downloads/Ant Videos/shakira 2.avi
    ./Downloads/Deewar.avi
    ./Desktop/101MSDCF/MOV02224.AVI
    ./Desktop/101MSDCF/MOV02020.AVI
    ./Desktop/101MSDCF/MOV00406.MP4
    ./Desktop/squeeze.iso

Listing all the files whose size if more than **1000 MB**, within current directory, recursively.

    root@localhost:/home/avi# find -size +1000M

    ./Downloads/The Dark Knight 2008 hindi BRRip 720p/The Dark Knight.mkv.part
    ./Downloads/Saudagar - (1991) - DVDRiP - x264 - AAC 5.1 - Chapters - Esubs - [DDR]/Saudagar 
    - (1991) - DVDRiP - x264 - AAC 5.1 - Chapters - Esubs - [DDR].mkv
    ./Downloads/Deewar.avi
    ./Desktop/squeeze.iso

### 49. pdftk ###

The **pdftk** command merges several pdf files into one. You must have installed **pdftk** program. If not, do apt or yum to get the required package.

    $ pdftk 1.pdf 2.pdf 3.pdf …. 10.pdf cat output merged.pdf

### 50. ps -LF -u user_name ###

The below command outputs processes and threads of a user. The option “**L**” (list threads) and “-F” (Full Format Listing).

    $ ps -LF -u avi

    avi 21645 3717 21766 0 5 66168 117164 1 18:58 ? 00:00:00 /usr/
    avi 21645 3717 21768 0 5 66168 117164 1 18:58 ? 00:00:00 /usr/
    avi 22314 3717 22314 0 2 42797 50332 0 19:00 ? 00:00:40 /usr/
    avi 22314 3717 22316 0 2 42797 50332 1 19:00 ? 00:00:00 /usr/
    avi 22678 24621 22678 0 1 969 1060 1 21:05 pts/1 00:00:00 ps -L
    avi 23051 3717 23051 0 2 37583 45444 1 19:03 ? 00:00:52 /usr/
    avi 23051 3717 23053 0 2 37583 45444 0 19:03 ? 00:00:03 /usr/
    avi 23652 1 23652 0 2 22092 12520 0 19:06 ? 00:00:22 gnome
    avi 23652 1 23655 0 2 22092 12520 0 19:06 ? 00:00:00 gnome

### 51. Startx — :1 ###

Sharing **X** session, means frequently logging in and out, this is where the **Startx** command comes to rescue. The command creates a new session thus no need to login and logout frequently from a session. In order to switch between the two X session, we need to switch between ‘**ctrl+Alt+F7**‘ and ‘**ctrl+Alt+F8**‘.

**Note**: The keys “**ctrl+Alt+F1**“, “**ctrl+Alt+F6**” is for console session, and “**ctrl+Alt+F7**“, “**ctrl+Alt+F12**” is for X session. Hence **6** console session and **6** X session, without frequent logging-in and out. The above sequence works on most of the distro, however different distro may have implemented it differently. I have checked it on Debian, and it works perfectly fine.

That’s all for now. We will be keep coming up with other lesser know commands and one liner script as required, in future articles. Do not forget to give your valueable feedback about our article and series ‘**Lesser Known Linux Commands**‘. I am coming with my next article very soon, till then, stay healthy, tuned and connected to **Tecmint**.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-useful-linux-commands-part-v/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/11-lesser-known-useful-linux-commands/
[2]:http://www.tecmint.com/10-lesser-known-linux-commands-part-2/
[3]:http://www.tecmint.com/10-lesser-known-commands-for-linux-part-3/
[4]:http://www.tecmint.com/10-lesser-known-effective-linux-commands-part-iv/
