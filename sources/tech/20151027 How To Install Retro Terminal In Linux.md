FSSlc translating

How To Install Retro Terminal In Linux
================================================================================
![Retro Terminal in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux.jpeg)

Nostalgic about the past? Get a slice of the past by **installing retro terminal app** [cool-retro-term][1] which, as the name suggests, is both cool and retro at the same.

Do you remember the time when there were CRT monitors everywhere and the terminal screen used to flicker? You don’t need to be old to have witnessed it. If you watch movies set in early 90’s, you’ll see plenty of CRT monitors with green/B&W command prompt. It has a geeky aura which makes it cooler.

If you are tired of terminal appearance and you need something cool and ‘new’, cool-retro-term will give you a vintage terminal appearance to relive the past. You also can change its color, animation kind, and add some effect to it.

Here are few screenshots of the different looks of cool-retro-term:

![Retro Terminal](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux-1.jpeg)

![Retro Terminal Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux-2.jpeg)

![Vintage Terminal](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux-3.jpeg)

### Install cool-retro-term in Ubuntu based Linux distributions ###

To install cool-retro-term in Ubuntu based Linux distributions, such as Linux Mint, elementary OS, Linux Lite etc, use the PPA below:

    sudo add-apt-repository ppa:noobslab/apps
    sudo apt-get update
    sudo apt-get install cool-retro-term

### Install cool-retro-term in Arch based Linux distributions ###

Installing cool-retro-term in Arch based Linux distributions such as [Antergos][2] and [Manjaro][3], use the following command:

    sudo pacman -S cool-retro-term

### Install cool-retro-term from source code ###

For installing this application from source code, you need to install a number of dependencies first. Some of the know dependencies in Ubuntu based distributions are:

    sudo apt-get install git build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qtdeclarative5-controls-plugin qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qtdeclarative5-dialogs-plugin qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin 

Known dependencies for other distributions can be found on the [github of cool-retro-term][4].

Now use commands below to compile the program:

    git clone https://github.com/Swordfish90/cool-retro-term.git
    cd cool-retro-term
    qmake && make

Once the program is compiled, you can run it with this command:

    ./cool-retro-term

If you like to have this app in program menu for quick access so that you won’t have to run it manually each time with the commands, you can use the command below:

    sudo cp cool-retro-term.desktop /usr/share/applications

You can learn some more terminal tricks here. Enjoy the vintage terminal in Linux :)

With inputs from: [Abhishek Prakash][5]

--------------------------------------------------------------------------------

via: http://itsfoss.com/cool-retro-term/

作者：[Hossein Heydari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/hossein/
[1]:https://github.com/Swordfish90/cool-retro-term
[2]:http://itsfoss.com/tag/antergos/
[3]:https://manjaro.github.io/
[4]:https://github.com/Swordfish90/cool-retro-term
[5]:http://itsfoss.com/author/abhishek/
