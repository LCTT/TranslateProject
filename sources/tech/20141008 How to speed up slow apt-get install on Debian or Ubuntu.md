su-kaiyao translating

How to speed up slow apt-get install on Debian or Ubuntu
================================================================================
If you feel that package installation by **apt-get** or **aptitude** is often too slow on your Debian or Ubuntu system, there are several ways to improve the situation. Have you considered switching default mirror sites being used? Have you checked the upstream bandwidth of your Internet connection to see if that is the bottleneck?

Nothing else, you can try this third option: use [apt-fast][1] tool. apt-fast is actually a shell script wrapper written around apt-get and aptitude, which can accelerate package download speed. Internally, apt-fast uses [aria2][2] download utility which can download a file in "chunked" forms from multiple mirrors simultaneously (like in BitTorrent download).

### Install apt-fast on Debian or Ubuntu ###

Here are the steps to install apt-fast on Debian-based Linux.

#### Debian ####

    $ sudo apt-get install aria2
    $ wget https://github.com/ilikenwf/apt-fast/archive/master.zip
    $ unzip master.zip
    $ cd apt-fast-master
    $ sudo cp apt-fast /usr/bin
    $ sudo cp apt-fast.conf /etc
    $ sudo cp ./man/apt-fast.8 /usr/share/man/man8
    $ sudo gzip /usr/share/man/man8/apt-fast.8
    $ sudo cp ./man/apt-fast.conf.5 /usr/share/man/man5
    $ sudo gzip /usr/share/man/man5/apt-fast.conf.5 

#### Ubuntu 14.04 and higher ####

    $ sudo add-apt-repository ppa:saiarcot895/myppa
    $ sudo apt-get update
    $ sudo apt-get install apt-fast 

#### Ubuntu 11.04 to 13.10 ####

    $ sudo add-apt-repository ppa:apt-fast/stable
    $ sudo apt-get update
    $ sudo apt-get install apt-fast 

During installation on Ubuntu, you will be asked to choose a default package manager (e.g., apt-get, aptitude), and other settings. You can always change the settings later by editing a configuration file /etc/apt-fast.conf.

![](https://farm6.staticflickr.com/5615/15285526898_1b18f64d58_z.jpg)

![](https://farm3.staticflickr.com/2949/15449069896_76ee00851b_z.jpg)

![](https://farm6.staticflickr.com/5600/15471817412_9ef7f16096_z.jpg)

### Configure apt-fast ###

After installation, you need to configure a list of mirrors used by **apt-fast** in /etc/apt-fast.conf.

You can find a list of Debian/Ubuntu mirrors to choose from at the following URLs.

- **Debian**: [http://www.debian.org/mirror/list][3]
- **Ubuntu**: [https://launchpad.net/ubuntu/+archivemirrors][4]

After choosing mirrors which are geographically close to your location, add those chosen mirrors to /etc/apt-fast.conf in the following format.

    $ sudo vi /etc/apt-fast.conf 

Debian:

    MIRRORS=('http://ftp.us.debian.org/debian/,http://carroll.aset.psu.edu/pub/linux/distributions/debian/,http://debian.gtisc.gatech.edu/debian/,http://debian.lcs.mit.edu/debian/,http://mirror.cc.columbia.edu/debian/')

Ubuntu/Mint:

    MIRRORS=('http://us.archive.ubuntu.com/ubuntu,http://mirror.cc.columbia.edu/pub/linux/ubuntu/archive/,http://mirror.cc.vt.edu/pub2/ubuntu/,http://mirror.umd.edu/ubuntu/,http://mirrors.mit.edu/ubuntu/')

As shown above, individual mirrors for a particular archive should be separated by commas. It is recommended that you include the default mirror site specified in /etc/apt/sources.list in the MIRRORS string.

### Install a Package with apt-fast ###

Now you are ready to test the power of apt-fast. Here is the command-line usage of **apt-fast**:

    apt-fast [apt-get options and arguments]
    apt-fast [aptitude options and arguments]
    apt-fast { { install | upgrade | dist-upgrade | build-dep | download  | source  } [ -y | --yes | --assume-yes | --assume-no ]   ... | clean }

To install a package with **apt-fast**:

     $ sudo apt-fast install texlive-full 

To download a package in the current directory without installing it:

     $ sudo apt-fast download texlive-full 

![](http://farm8.staticflickr.com/7309/10585846956_6c98c6dcc9_z.jpg)

As mentioned earlier, parallel downloading of apt-fast is done by aria2. You can verify parallel downloads from multiple mirrors as follows.

    $ sudo netstat -nap | grep aria2c 

![](http://farm8.staticflickr.com/7328/10585846886_4744a0e021_z.jpg)

Note that **apt-fast** does not make "apt-get update" faster. Parallel downloading gets triggered only for "install", "upgrade", "dist-upgrade" and "build-dep" operations. For other operations, apt-fast simply falls back to the default package manager **apt-get** or **aptitude**.

### How Fast is apt-fast? ###

To compare apt-fast and apt-get, I tried installing several packages using two methods on two identical Ubuntu instances. The following graph shows total package installation time (in seconds).

![](http://farm4.staticflickr.com/3810/10585846986_504d07b4a7_z.jpg)

As you can see, **apt-fast** is substantially faster (e.g., 3--4 times faster) than **apt-get**, especially when a bulky package is installed. 

Be aware that performance improvement will of course vary, depending on your upstream Internet connectivity. In my case, I had ample spare bandwidth to leverage in my upstream connection, and that's why I see dramatic improvement by using parallel download.

--------------------------------------------------------------------------------

via: http://xmodulo.com/speed-slow-apt-get-install-debian-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://github.com/ilikenwf/apt-fast
[2]:http://aria2.sourceforge.net/
[3]:http://www.debian.org/mirror/list
[4]:https://launchpad.net/ubuntu/+archivemirrors
