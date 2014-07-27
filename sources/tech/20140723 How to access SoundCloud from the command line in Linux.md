How to access SoundCloud from the command line in Linux
================================================================================
If you enjoy music streaming and originally-created sounds, you cannot have missed [SoundCloud][1]. Based in Germany, this cloud streaming service is now famous and well-established for any music adventurer. And naturally, as a Linux enthusiast, you might wonder how to join your passion for Linux with your love for music. As a solution, I advise you to check out Soundcloud2000, **a command line client for SoundCloud** born out of the [Music Hack Day Stockholm '13][2].

### Installation ###

For Debian or Ubuntu users, install via:

    $ sudo apt-get install portaudio19-dev libmpg123-dev libncurses-dev ruby1.9.1-dev
    $ sudo gem install soundcloud2000

For Archlinux users, the package is available in [AUR][3].

For Fedora users, install via:

    $ sudo yum install portaudio-devel libmpg123-devel ncurses-devel ruby-devel
    $ sudo gem install soundcloud2000

For CentOS users, install or upgrade to the [latest Ruby/RubyGems][4] (1.9 and higher), enable [Repoforge repo][5], and install via:

    $ sudo yum install portaudio-devel mpg123-devel
    $ sudo gem install curses soundcloud2000 

And finally, go to the official github page for the sources.

### Usage ###

Soundcloud2000 is very easy to pick up. Some might even say simplistic. I like it for that sobriety and the effort of the three authors and contributors. Launch it via:

    $ soundcloud2000

From there, you will be welcomed with a splash screen:

![](https://farm4.staticflickr.com/3919/14658085706_71c9094e4f_z.jpg)

and then a list of songs:

![](https://farm4.staticflickr.com/3888/14494626757_3e788482d5_z.jpg)

You can scroll through the list via the up and down keys, play a song with enter, pause/resume with the space bar, and fast forward/rewind with the right and left arrow keys. As you can see, nothing groundbreaking but definitely ergonomic.

If the random list is too long to scroll through, you have an option to see all the tracks for a particular user by hitting the 'u' key and then typing his name. 

![](https://farm4.staticflickr.com/3861/14494436719_b5536f7b67_z.jpg)

That is probably one of the major defaults of Soundcloud2000. While the navigation is not optimized, I have high hopes for improvements and support as the software is still very young.

### Bonus ###

Another alternative as a bonus: if you like the idea of using SoundCloud from a terminal, but do not want to install any additional software (or maybe you cannot), I advise you to go to [cmd.fm][6]. The website is a kind of camouflage for SoundCloud, as it hides it behind a shell interface. 

[![](https://farm6.staticflickr.com/5580/14494448218_a16b05e3ee_z.jpg)][7]

Type "help" for a list of commands, which is a lot longer than for Soundcloud2000. As examples, I noticed:

- _genres to list all genres
- _play random to play a random track
- _pause to pause the current track
- _playlist new to make a new playlist
- _loop to loop current track
- _cinema to watch and ASCII version of Star Wars which completely blew my mind. 

And it even supports auto-completion via the tabulation key for genres.

To conclude, Soundcloud2000 is a neat program that does exactly what it is supposed to. We can forgive its current flaws as they are surely tied to its youth. I really hope that it will grow and include more features (and potentially get inspiration from cmd.fm).

If you like the idea, I invite you to support the programmers, and if you like these kinds of initiatives, support [Music Hack Day][8] which mixes software development and music.

What do you think of using SoundCloud from the command line? Please let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/access-soundcloud-command-line-linux.html

原文作者：[Adrien Brochard][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:https://soundcloud.com/
[2]:https://www.hackerleague.org/hackathons/music-hack-day-stockholm-13/
[3]:https://aur.archlinux.org/packages/ruby-soundcloud2000/
[4]:http://ask.xmodulo.com/upgrade-ruby-centos.html
[5]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[6]:https://cmd.fm/
[7]:https://www.flickr.com/photos/xmodulo/14494448218/
[8]:http://new.musichackday.org/