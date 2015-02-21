Translating by FSSlc

How To Make GDebi Default Instead of Ubuntu Software Center
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Make_GDebi_Default.jpeg)

If you use Ubuntu or Ubuntu based Linux distribution such as Elementary OS Freya, you might be using Ubuntu Software Center to install .deb executable files. Ubuntu Software Center is a nice application for finding and installing apps but it is resource heavy and slow. This is why I prefer using [App Grid, a lighter alternative of Ubuntu Software Center][1].

Now, if you just trying to install a .deb file, I would not recommend either of Ubuntu Software Center or App Grid. I suggest GDebi, a dedicated program for installing Debian executable files. It is extremely lightweight and focused on installing .deb files. Best thing about GDebi is that it also shows the dependencies that will be installed along with the desired program.

In this post we shall see **how to install GDebi and use it as the default installer instead of Ubuntu Software Center**.

### Install GDebi in Ubuntu and other Linux distributions ###

Open a terminal and use the following command:

    sudo apt-get install gdebi

### Make GDebi default for .deb installation ###

Once you have installed GDebi, it’s time to see how to make it the default application for installing .deb files. Please note that I am using Elementary OS Freya in this tutorial but the steps are applicable to all Ubuntu based distribution. Just the screenshots may look different.

Download a .deb file first. Let’s say you have downloaded Google Chrome. Go to the download directory and right click on the .deb file. In here, go to **properties**.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/GDebi_default.jpeg)

In the properties, you should see the option of **open with**. Click on it and change it to GDebi.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/GDebi_default_Ubuntu.jpeg)

Next time you double click on a .deb file, it will automatically open GDebi to install the .deb file. Indeed using such light applications is a good way to [speed up Ubuntu][2] or other Linux systems.

What do you say? You still prefer Ubuntu Software Center for application installation or GDebi? Or if you are old school, [Synaptic Package Manager][3] perhaps? Which one is your favorite?

--------------------------------------------------------------------------------

via: http://itsfoss.com/gdebi-default-ubuntu-software-center/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/
[2]:http://itsfoss.com/speed-up-ubuntu-1310/
[3]:http://www.nongnu.org/synaptic/