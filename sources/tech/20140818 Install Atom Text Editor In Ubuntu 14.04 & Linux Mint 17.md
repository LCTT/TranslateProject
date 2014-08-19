[su-kaiyao]翻译中

Install Atom Text Editor In Ubuntu 14.04 & Linux Mint 17
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Install_Atom_In_Ubuntu_Linux_Mint.jpeg)

[Atom][1] is sleek and feature rich open source text editor from [Github][2]. It is currently in beta but if you are curious to try it, we shall see **how to install Atom in Ubuntu 14.04 or Linux Mint 17**.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Atom_Editor.jpeg)

In terms of look and even features, Atom resembles a lot like [Sublime Text editor][3], a hugely popular cross platform but closed source text editor which is preferred by programmers. In fact, Atom is not the only upcoming text editor which is inspired by Sublime Text. [Lime Text][4] is an open source clone of Sublime Text under development.

Without further ado, let’s see how to install Atom editor in Ubuntu 14.04 and Linux Mint 17.
### 
Install Atom in Ubuntu and Linux Mint via PPA ###

Since it is in beta, there are no binaries for Linux by the time I write this article. But don’t worry. You don’t have to compile the code on your own (of course you can choose to do so, for your own pleasure). Thanks to [Webupd8 team’s][5] effort, we have a PPA that lest you easily install Atom editor in both 32 bit and 64 bit systems.

Open a terminal and use the following commands:

    sudo add-apt-repository ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install atom

That would be it. You can run Atom editor from Unity Dash in Ubuntu and application menu in Linux Mint.

### Uninstall Atom from Ubuntu and Linux Mint ###

There could be plenty of reasons why you would like to remove Atom from your system. Being unstable could be one of the major reasons. Whatever may be your reason, here is how to uninstall Atom:

    sudo apt-get remove atom
    sudo add-apt-repository --remove ppa:webupd8team/atom

This will remove Atom and the PPA repository. A good thing to do would be to run auto remove as well.

    sudo apt-get autoremove

### Your experience with Atom? ###

If you tried Atom, do share your experience with us. Do you think it has the potential to become your favorite text editor?

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-atom-text-editor-ubuntu-1404-linux-mint-17/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://atom.io/
[2]:https://github.com/
[3]:http://www.sublimetext.com/
[4]:http://itsfoss.com/lime-text-open-source-alternative/
[5]:https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8
