Make Math Simple in Ubuntu / Elementary OS via NaSC
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-icon.png)

NaSC (Not a Soulver Clone) is an open source software designed for Elementary OS to do arithmetics. It’s kinda similar to the Mac app [Soulver][1].

> Its an app where you do maths like a normal person. It lets you type whatever you want and smartly figures out what is math and spits out an answer on the right pane. Then you can plug those answers in to future equations and if that answer changes, so does the equations its used in. 

With NaSC you can for example:

- Perform calculations with strangers you can define yourself
- Change the units and values ​​(in m cm, dollar euro …)
- Knowing the surface area of ​​a planet
- Solve of second-degree polynomial
- and more …

![nasc-eos](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-eos.jpg)

At the first launch, NaSC offers a tutorial that details possible features. You can later click the help icon on headerbar to get more.

![nasc-help](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-help.jpg)

In addition, the software allows to save your file in order to continue the work. It can be also shared on Pastebin with a defined time.

### Install NaSC in Ubuntu / Elementary OS Freya: ###

For Ubuntu 15.04, Ubuntu 15.10, Elementary OS Freya, open terminal from the Dash, App Launcher and run below commands one by one:

1. Add the [NaSC PPA][2] via command:

    sudo apt-add-repository ppa:nasc-team/daily

![nasc-ppa](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-ppa.jpg)

2. If you’ve installed Synaptic Package Manager, search for and install `nasc` via it after clicking Reload button.

Or run below commands to update system cache and install the software:

    sudo apt-get update
    
    sudo apt-get install nasc

3. **(Optional)** To remove the software as well as NaSC, run:

    sudo apt-get remove nasc && sudo add-apt-repository -r ppa:nasc-team/daily

For those who don’t want to add PPA, grab the .deb package directly from [this page][3].

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/09/make-math-simple-in-ubuntu-elementary-os-via-nasc/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://www.acqualia.com/soulver/
[2]:https://launchpad.net/~nasc-team/+archive/ubuntu/daily/
[3]:http://ppa.launchpad.net/nasc-team/daily/ubuntu/pool/main/n/nasc/