How to manage your music library from the command line on Linux
================================================================================
The command line in Linux is probably one of the scariest experience for a newcomer there is. I remember spending hours back in the day trying to decode an error message in my terminal. However, it was completely worth it. If I had to pick only one reason for a newcomer to learn to deal with the command line properly today, it would probably be for the possibility to manage a music library entirely from the terminal. The software I prefer to do this is [cmus][1], short for "C* MUsic Player" as it is written entirely in C.

cmus is a powerful music file manager with a built-in audio player. Using its ncurses based terminal interface, you can browse your music library, and play music from playlists or queues, all from the command line.

### Install cmus on Linux ###

First, you will need to set up and install cmus as follows.

On Ubuntu, Debian or Linux Mint:

    $ sudo apt-get install cmus 

On Fedora, first [enable RPM Fusion repository][2], and then run:

    $ sudo yum install cmus 

On CentOS, first [enable Repoforge repository][3], and then run:

    $ sudo yum install cmus 

On Archlinux:

    $ sudo pacman -S cmus 

After installation, you can launch cmus simply by typing:

    $ cmus 

### Import [Music Files][4] to cmus ###

The first thing to do is to import your music files into your library. This process will immediately reveal two things: that the shortcuts are inspired by vim's, and that cmus is incredibly fast. I have successfully imported over a thousand songs in less than twenty seconds! Try that with iTunes or any graphical music library software, and you will have time to make a peanut butter sandwich before it's done.

To import music files on cmus, type the following vim-like command on cmus.

    :a /path/to/your/music/folder

So on Xubuntu I did:

    :a /home/adrien/Music/

Then all the music files in that folder appeared sorted by artist and album instantly. 

![](https://farm6.staticflickr.com/5522/14021555743_b3c545702e_z.jpg)

### Quick Start ###

Before starting anything, you might want to memorize the basic shortcuts to start playing your music. That is the only downside to cmus. Unless you change them, the default shortcuts are not very intuitive, and you have to learn them. In short:

- **x** to play or replay a track
- **c** to pause
- **b** to play the next track
- **z** to play the previous track
- **s** to activate the shuffle 

With that, you should be ready to start! 

### Basic Usage ###

The interface of cmus is composed of seven tabs, that you access by hitting the appropriate number. For example, the startup screen is the "tree" tab that you can access at any time by hitting 1. This tab is pretty intuitive to use: navigate though the artist on the left panel with the up and down keys, press space to see the albums for a particular artist, use the tab key to switch to right panel with the individual songs, and finally the return key to play a song.

![](https://farm8.staticflickr.com/7174/13998349312_74c4586d17_z.jpg)

As you can see, the bottom banner displays the name of the artist, the album, and the title of the song currently playing, as well as the timing and the volume.

The second tab is similar to the first as it just displays the list of all the songs sorted by artist. 

![](https://farm8.staticflickr.com/7080/13998371701_be03208c2f_z.jpg)

However, the third tab is much more interesting as it displays the current playlist. To add a song from the tree view or the sorted list view to the playlist just type "y" over the selected song. Once you created the perfect playlist, save it with the command.

    :save /path/to/playlist

and load it with:

    :load /path/to/playlist

![](https://farm8.staticflickr.com/7385/13978441446_2c10f35507_z.jpg)

The fourth tab displays the queue. The difference between the queue and a playlist is that once a song is played from the queue, it is then removed. To add a song to the queue, do it like adding it to the playlist, but instead use the shortcut: "e"

![](https://farm8.staticflickr.com/7201/14001984094_58719269c3_z.jpg)

The fifth tab is pretty interesting too as it is a lightweight file explorer. It can be pretty useful to read a musical file somewhere on your computer without adding it to your library. The navigation is pretty standard: move with the up and down keys, and return to enter a folder or select a file.

![](https://farm6.staticflickr.com/5217/14001984224_785aac0ddb_z.jpg)

The sixth tab is the library filters used to dynamically create a playlist. Just as it sounds, filters actually go through your library, and only display the tracks corresponding to some criteria defined. I will go through defining your own filters later on, but cmus already comes with a few ones. To try one, just use:

    :filter [name of the filter]

So for example:

    :filter classical

It will hide all the tracks from your library, except the ones containing "Classical" in their genre tag.

![](https://farm8.staticflickr.com/7245/14001543625_a508ec9304_z.jpg)

Finally, last but not least, the seventh tab is the settings. In there you can define your own shortcuts and commands. I will give an example in the next section.

![](https://farm6.staticflickr.com/5079/13998371761_df1f9b7fae_z.jpg)

### Advanced Usage ###

As promised, now that you are more familiar with the interface, I shall give you more tips to enhance your experience.

To search for anything in any tab, just use the same shortcut as in vim

    /[keyword]

and:

    n

to look for the next occurrence of the keyword.

To create your own filters, use the syntax:

    :fset [name of the new filter]=[expression]

For example, you can find all the old rock track with:

    :fset oldies=genre="Rock"&date<1970

To learn more about the expressions you can use, I invite you to dig a bit in the doc and the included filters.

To activate the replaygain for all the tracks, use the command:

    :set replaygain=1

To change a shortcut to a different key, go to the settings tab and find the current binding expression. Say for example that I want to change the play shortcut from "x" to "w", I will then scroll until the line that says:

    common  x 		player-play

Then hit enter, and change the expression to:

    :bind -f common w player-stop

To conclude, I really like cmus. There is a lot more to it than the reach of this post, so you should really read the [manual page][5] when you are ready. In short, cmus is fast, easy to learn, and respects your files. If you like the idea of managing your music library from the command line, but were not convinced by cmus, I invite you to take a shot at some alternatives like MOC and PyTone which are just as good.

What do you think of cmus? Do you like it or prefer a (non)GUI alternative? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/manage-music-library-command-line-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://cmus.github.io/
[2]:http://xmodulo.com/2013/06/how-to-install-rpm-fusion-on-fedora.html
[3]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[4]:http://xmodulo.com/go/mp3
[5]:https://github.com/cmus/cmus/blob/master/Doc/cmus.txt