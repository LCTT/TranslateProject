translating by cvsher(2014-08-30)
How to listen to Internet radio from the command line on Linux
================================================================================
For those of you system admins and Linux aficionados who spend a great deal of your time in front of Linux screen, do you know that ambient noise from online/local radio station can actually be a productivity booster? Believe or not, it is known that moderate level of ambient sound such as music or chatter can actually fuel your creativity at your workplace. If you like the idea of working with music on, maybe this tutorial is useful to you, as I am going to show you **how to listen to Pandora online radio from the command lin**e.

As you already know, Pandora is one of the most well-known Internet radio services, streaming tons of different genres of music for free, with its powerful music recommendation engine. While Pandora can be accessed in different ways such as via web browser, desktop clients or mobile apps, the open-source community has come up with yet another way to access Pandora: Linux command-line.

[pianobar][1] is an open-source CLI music player for Pandora Internet radio. It comes with a simple terminal interface for playing and managing music stations. Other features include song rating, upcoming song list, song history, custom keybindings, remote control, etc. For those listeners who live in the region where Pandora is not available (i.e., outside US, Australia and New Zealand), pianobar also comes with proxy support.

### Install Pianobar on Linux ###

On Debian and other Debian-derivatives such as Ubuntu or Linux Mint, pianobar comes as a pre-built package, so installation is as easy as typing:

    $ sudo apt-get install pianobar 

On Fedora, pianobar is not available in base repositories. So you need to build it from the source. The whole installation process is a bit involved, but the following instructions will do it. The instructions were tested on fresh Fedora 20.

First, compile and install FFmpeg from the source using [this guide][2].

Next, [enable RPM Fusion repo][3], and install other prerequisites:

     $ sudo yum install wget gcc-c++ pkgconfig gnutls-devel json-c-devel libgcrypt-devel make libao-devel faad2-devel libmad-devel libao faad2-libs 

Compile and install pianobar:

    $ wget http://6xq.net/projects/pianobar/pianobar-2014.06.08.tar.bz2
    $ tar xvfvj pianobar-2014.06.08.tar.bz2
    $ cd pianobar-2014.06.08
    $ PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH make
    $ sudo make install 

Finally, to allow pianobar to load shared FFmpeg libraries installed in /usr/local/lib, add the following line in /etc/ld.so.conf:

    /usr/local/lib

and reload all shared libraries:

That's it.

### Listen to Pandora from the Command Line ###

The basic usage of pianobar is as simple as typing the command:

    $ pianobar 

You will be asked to log in to Pandora, and choose a station from your personalized station list. Once you pick a station, music streaming will start automatically.

![](https://farm6.staticflickr.com/5552/14993320301_58e58b5810_z.jpg)

Pressing '?' key during streaming will show you a list of available command keys. Some of them are:

- s: change to a different station.
- u: view a list of upcoming songs.
- h: view plaback history.
- n: go to the next song.
- b: bookmark a song or an artist.
- ( or ): decrease or increase music volume.
- S: pause streaming.
- P: resume streaming.
- v: create a new station from song or artist.
- + or -: thumb up or down a song.
- a: add music to a station.
- q: quit pianobar. 

![](https://farm6.staticflickr.com/5559/14993326991_ccdffd0fa6_z.jpg)

### Configure Pianobar for Automatic Setup ###

You can define various default settings of pianobar in a separate configuration file. For example, you can put your Pandora login information in the configuration file, so you don't have to type it manually. Here is how to create a sample configuration file.

    $ mkdir -p ~/.config/pianobar

----------

    $ vi ~/.config/pianobar/config 

----------

    # Example pianobar configuration file
     
    # Pandora login info
    user = your@email_address
    password = plaintext_password
     
    # Users who cannot access Pandora in their region can set a proxy.
    control_proxy = http://user:password@host:port/
     
    # Initial volume in dB: between -30 and +5
    volume = 0
     
    # Audio quality: high, medium or low
    audio_quality = high

For full configuration options, refer to its man page.

    $ man pianobar 

### Remote Control Pianobar ###

Another excellent feature of pianobar is remote control support. You can send a command to a running instance of pianobar via a named pipe (FIFO). Here is how to remote control pianobar.

First create a FIFO in ~/.config/pianobar:

    $ mkfifo ~/.config/pianobar/ctl 

Then launch pianobar.

Now you can send any single-character command key to pianobar by using echo command. For example, to go to the next song:

    $ echo -n 'n' > ~/.config/pianobar/ctl 

You can easily extend this setup to a remote machine. When pianobar is running on host X, you can remote control pianobar from another host Y over SSH as follows.

On host Y, run:

     $ ssh user@host_X "echo -n 'n' > ~/.config/pianobar/ctl" 

Of course, you want to [enable key authentication][4] for SSH login to host X, so that you don't have to type an SSH password.

This remote control feature can come in handy when you want to set up a remote controllable Internet radio player on [Raspberry Pi][5].

Hope you enjoy pianobar as much as I do. Let me know what you think of it in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/listen-to-internet-radio-command-line-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://6xq.net/projects/pianobar/
[2]:http://ask.xmodulo.com/compile-ffmpeg-centos-fedora-rhel.html
[3]:http://xmodulo.com/2013/06/how-to-install-rpm-fusion-on-fedora.html
[4]:http://xmodulo.com/2012/04/how-to-enable-ssh-login-without.html
[5]:http://xmodulo.com/go/raspberrypi
