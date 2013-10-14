Vito

apt-fast: Improve apt-get Download Speed
================================================================================
**[apt-fast][1]** is a “**shell script wrapper**” for **apt-get** and **aptitude** that can drastically improve APT download times by downloading packages with multiple connections per package. apt-fast uses **aria2c** or **axel** download managers to speed up the APT download time. Just like the traditional apt-get package manager, apt-fast supports almost all apt-get functions such as **install, remove, update, upgrade, dist-upgrade** etc. And one more notable feature is it supports proxy too.

**Install apt-fast On Ubuntu**

Use the following PPA to install apt-fast. apt-fast developer says “**Some distros, such as PCLinuxOS include apt-fast in their default repos**”. I expect the same in Ubuntu/Debian default repositories.

To Add apt-fast PPA, enter the following command in Terminal.

    sudo add-apt-repository ppa:apt-fast/stable

Update the sources list with command:

    sudo apt-get update

Now install it using command:

    sudo apt-get install apt-fast

During installation it will ask you to select the maximum number connections to download packages.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/sk@sk-_003.png)

Select No and continue installation. If you select Yes, apt-get won’t ask you the confirmation during any package installation.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/sk@sk-_0041.png)

I found **aria2** download manager has been installed along with apt-fast installation automatically. So you don’t have to install it separately.

If you want re-configure apt-fast options, you can do it using command:

    sudo dpkg-reconfigure apt-fast

**Usage**

Similar to apt-get functions, we can use:

    apt-fast install package

    apt-fast remove package

    apt-fast update

    apt-fast upgrade

    apt-fast dist-upgrade

and more.

apt-fast package manager in action:

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/sk@sk-_0051.png)

**Create alias (Optional)**

Edit **~/.bashrc** file and add the following line at the end.

    alias apt-get='apt-fast'

Or simply run the following command to add it in your **~/.bashrc** file.

    sudo echo "alias apt-get='apt-fast'" >> ~/.bashrc

From now whenever you run apt-get command to install, remove, update and upgrade packages, it will use apt-fast automatically in the background. Sounds cool? Yes it should.

During testing i found it very fast compared to apt-get when downloading packages. Give it a try, you will agree with me. Cheers!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/improve-apt-get-download-speed-apt-fast/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:https://github.com/ilikenwf/apt-fast