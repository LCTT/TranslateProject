3 open source music players: Aqualung, Lollypop, and GogglesMM
============================================================
 ![3 open source music players: Aqualung, Lollypop, and GogglesMM](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/music-birds-recording-520.png?itok=wvh1g4Lw "3 open source music players: Aqualung, Lollypop, and GogglesMM") 
Image by : 

[Internet Archive][2] book images; modified by Opensource.com. [CC BY-SA 4.0][3]

Music is a part of life. [Wikipedia's article on the history of music][4] contains this great phrase: "Since all people of the world, including the most isolated tribal groups, have a form of music...." Well, we open source folk form a tribe—that's for sure. I propose that our "form of music" includes open music players. Over the past year, I've been taking a look at the various players available; in [December 2016][5] I summarized my ongoing evaluation of open music players using these six criteria:

1.  Must be configurable to pass the music through unchanged to [ALSA][1]. (max 5 marks)
2.  Should have a good "smart playlist" feature. (1 mark)
3.  Should not force the user to always interact through playlists. (1 mark)
4.  Should provide a simple approach to cover art—use the embedded cover art or fall back to cover.jpg (or .png) in the music directory. (1 mark)
5.  Should show the signal level and effective bit rate as the music plays. (1 mark)
6.  Should present good-to-great overall organization, layout, and performance. (1 mark)

Three players suggested to me by kind readers were not available in my repositories: [Aqualung][6], [Lollypop][7], and [GogglesMM][8]. Not wanting to install stuff from the wild on my work computer, I promised to configure a "test bed" for this purpose and detail the results.

### Aqualung

[Aqualung][9] has a clearly written website that explains its various features. One of the comments there I found interesting was this one:

"You can (and should) organize your music into a tree of Artists/Records/Tracks, thereby making life easier than with the all-in-one Winamp/XMMS playlist."

This puzzled me because I think I have always had my music organized into a tree of artists, albums, and tracks. But maybe this explains why I find the XMMS-derived players to be a bit odd in terms of their music browsing capability.

According to the Aqualung download page, the official release is source-only. While the comments there suggest that most major Linux distributions include a built copy of Aqualung, this is not the case with the distro I'm currently using on my work computer, Ubuntu 16.10. [Launchpad.net][10] does have personal package archives (PPAs), but they seem a bit out of date, so why not build from source?

I installed **pkgconf** and dev versions of **libasound**, **libflac**, **libmp3lame**, **libvorbis**, **libxml2**, **libglib2.0**, and **libgtk+-2.0**, generally following the suggestions of the compiling page on the site and the usual "hints" from the configure script. Next, I was able to **configure** cleanly and do a **make** and a **make install**. And from there, I was able to execute **/usr/local/bin/aqualung**.

 ![Aqualung](https://opensource.com/sites/default/files/aqualung.png "Aqualung") 

Aqualung, unable to switch resolution.

Once Aqualung was up and running, I saw a straightforward and relatively barebones two-window user interface, the player itself and the "Music Store." I opened Preferences by right-clicking on the music pane of the player and looked around to see where I could select my AudioQuest DragonFly digital-to-analog converter, but I saw no sign of anything there. However, the site notes that you can specify the output device on the command line. I ended up needing to use the **plughw** device to get Aqualung to start.

At that point, I was disappointed to discover that Aqualung seems to require a fixed output sample rate. I could play my 44.1-KHz files just fine with the default setting, but to play my 96-KHz files, I had to stop and restart with that sample rate. Aqualung will not pass the bit stream unchanged through to the digital-to-analog converter. With that, I did not bother to continue my evaluation.

**Not rated.**

### Lollypop

 ![Lollypop interface](https://opensource.com/sites/default/files/lollypop_interface.png "Lollypop interface") 

The lovely Lollypop user interface.

[Lollypop][11] has a gorgeous website. Although it's not in my work computer's repositories, there is a "Download Ubuntu/Debian" link that points to an [up-to-date PPA on launchpad.net][12]. The site offers other downloads for Flatpak, Arch Linux, Fedora, FreeBSD, and OpenSUSE. Out of curiosity, I took a look at the [Fedora link on Fedora COPR][13], and it also looks quite up-to-date, offering builds for Fedora 23–26.

One build from source was enough excitement for that day, so I decided to try the PPA. I was able to execute Lollypop from the command line. The Settings menu was obvious in the upper right of the screen. After updating my music, I went looking for my output device configuration, but after some poking around, I couldn't find how to select the output device. Even executing on the command line with **–help** did not enlighten me.

After some searching on the Internet I found a Lollypop developer stating that I needed **gstreamer libav** to get Lollypop to work. From this I have tentatively concluded that there may be a **gstreamer** configuration possibility to make this work, but I'm not going to pursue that for now, at least.

Lollypop has a lovely user interface to match its lovely web page, but for now, I did not rate it. I have another reason to learn more about **gstreamer**.

**Not rated.**

### GogglesMM

[Goggles Music Manager][14] also has an [up-to-date PPA on launchpad.net][15]; the installation was straightforward and I was able to execute **gogglesmm** from the command line.

GogglesMM, out of the box, looks somewhat like Rhythmbox. I found the Audio tab under Settings > Preferences, which let me select ALSA and set my output device. I confirmed that I can play MP3, 44.1-KHz / 24-bit and 96-KHz / 24-bit music by looking at **/proc/asound/DragonFly/stream0** and the LED color on the DragonFly itself; therefore, 5 points for "rate/depth passthrough."

 ![GogglesMM](https://opensource.com/sites/default/files/gogglesmm.png "GogglesMM") 

GogglesMM playing at 96/24, showing output device.

The documentation for GogglesMM is not largely detailed at this point, but as far as I am able to tell, the developers use filters to implement something like "smart playlists." I reviewed the functioning of filters as best as I could with the three albums installed on my test bed, and while I like what I see (especially being able to define selection criteria for songs based on a broad range of criteria), this is not what I mean when I use the term "smart playlists," which I think of as using some kind of community database of "songs like the current one." Maybe I should call this "automatic DJ" instead, but as far as I am able to determine, this feature does not exist in the current version of GogglesMM, so 0 points for "smart playlist."

As for the queue versus playlist operation, the application supports either playing through the selected songs both in order or randomly or putting songs in a playlist, so 1 for "queue option to playlist."

Similarly, it seemed to manage my cover art well without extra intervention (each album contained the appropriate cover art, which was recognized automatically by GogglesMM), so 1 for "embedded cover art or cover.jpg."

I could not find any way to show signal level or effective bit rate. Nor could I find any way of seeing the bit rate and bit depth; although the application can display a "format" column, it doesn't show anything in that field on my music, so 0 for "signal level and effective bit rate."

With respect to overall organization, GogglesMM hits all the right buttons for me. I can see what's in the play queue, the time and proportion of song played and left to play, album cover, song name, album title, and artist. Also, the available display column list seems quite large and useful, including composer for example. Finally, a really wonderful thing, the volume control actually controls the ALSA volume. If I bring up alsamixer and adjust the volume in either GogglesMM or alsamixer, the other's volume control moves and the volume adjusts. This is pretty cool and surprisingly not all that common, so 1 for overall organization.

In total, then, GogglesMM merits an 8\. Excellent performance indeed.

**Rating: 8**

### The ratings so far

As I've mentioned in the past, my favorite player is [Guayadeque][16], which gets a perfect 10, according to my ranking. Take a look at a summary of my ratings to date (N/R meaning "not rated," because I was unable to determine how to configure those players to work in bit-perfect, passthrough mode so that my digital-to-analog converter receives the PCM data at the bit rate and bit depth of the source):

 ![Open source audio players](https://opensource.com/sites/default/files/open_source_audio.png "Open source audio players") 

Please note that my ranking scheme is not for everyone. In particular, many people don't find value in music files at higher-than-CD resolution, and many people are happy with proprietary formats that promise better audio quality.

Meanwhile, I will continue to evaluate some of the promising non-rated options. I especially like the look of Lollypop, and I feel that there is a secret spell for **gstreamer** just waiting to be unlocked that will let **gstreamer**-based players pass their data through without conversions.

### And the music...

My vinyl buying spree continues, and I have some great recommendations.

First is Nils Frahm's album, [Felt][17], which was a very thoughtful gift from my daughter. I really, really like this album, which was largely recorded late at night with microphones very close to the piano strings and lots of interesting ambient piano noise—really beautiful music. Like other Nils Frahm music, the vinyl comes with a download code that allows the downloading of the album in up to 96-KHz, 24-bit FLAC format.

The second is [Mad Professor's remix][18] of Massive Attack's album, Protection, titled No Protection. You can [get an idea of it here][19], and if you would like to try out the original, [here is what it's all about][20]. Originally released in the 1990s, this album is back on vinyl and it sounds fantastic. Unfortunately, no download code accompanies it.

The third is [Primitives][21] by Bayonne. [Here is an idea][22] of what it's like. The Guardian newspaper has lumped this in with "the new boring," how's that for a genre? Really, if it's all so boring, maybe it's time for a career change, Anyway, give this one a whirl; maybe you'll find it boring, or maybe, like me, you'll like it!

--------------------------------------------------------------------------------


作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/clh_portrait2.jpg?itok=V1V-YAtY)

Chris Hermansen - Engaged in computing since graduating from the University of British Columbia in 1978, I have been a full-time Linux user since 2005 and a full-time Solaris, SunOS and UNIX System V user before that. On the technical side of things, I have spent a great deal of my career doing data analysis; especially spatial data analysis. I have a substantial amount of programming experience in relation to data analysis, using awk, Python, PostgreSQL, PostGIS and lately Groovy

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/open-source-music-players

作者：[Chris Hermansen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:http://www.alsa-project.org/main/index.php/Main_Page
[2]:https://www.flickr.com/photos/internetarchivebookimages/14565158187/in/photolist-ocoBRG-ocqdPM-ot9YYX-ovb7SE-oroqfj-ot8Sfi-of1HoD-oc5c28-otBk3B-foZxvq-ocoUvo-4TqEKE-otsG7t-oeYo4w-ornGMQ-orpD9y-wLDBUf-outZV7-oc26Ui-ortZpW-ocpWLH-ocoK6c-ocYDY1-od6ADb-xxAKyY-ocofDx-oc4Jr5-otyT2E-ocpUyu-xqTAb6-oc8gK1-otdsK5-ovhkz2-ocpcHj-oc8xwk-otgmZG-otr595-otnv4o-otvdRs-ovfYEt-ovDXUV-obUPJ6-oc2MuJ-oc4zLE-oruPbN-oc1P2H-ouRk93-otaGd3-otTmwB-oc5f62
[3]:http://creativecommons.org/licenses/by-sa/4.0/
[4]:https://en.wikipedia.org/wiki/History_of_music
[5]:https://opensource.com/article/16/12/soundtrack-open-source-music-players
[6]:http://aqualung.jeremyevans.net/
[7]:https://gnumdk.github.io/lollypop-web/
[8]:https://gogglesmm.github.io/
[9]:http://aqualung.jeremyevans.net/
[10]:https://launchpad.net/+search?field.text=aqualung+ppa
[11]:https://gnumdk.github.io/lollypop-web/
[12]:https://launchpad.net/~gnumdk/+archive/ubuntu/lollypop
[13]:https://copr.fedorainfracloud.org/coprs/gnumdk/lollypop/
[14]:https://gogglesmm.github.io/
[15]:https://launchpad.net/~s.jansen/+archive/ubuntu/gogglesmm
[16]:http://www.guayadeque.org/
[17]:http://www.nilsfrahm.com/works/felt/
[18]:https://en.wikipedia.org/wiki/No_Protection_(Massive_Attack_album)
[19]:https://www.youtube.com/watch?v=9TvgRb4wiB0
[20]:https://www.youtube.com/watch?v=LCUv-hLN71c
[21]:https://musicglue.com/bayonne/products/primitives---vinyl--/
[22]:https://www.youtube.com/watch?v=WZ6xl6CKITE
