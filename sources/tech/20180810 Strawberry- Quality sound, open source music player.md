Strawberry: Quality sound, open source music player
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/video_editing_folder_music_wave_play.png?itok=-J9rs-My)

I recently received an email from [Jonas Kvinge][1] who forked the [Clementine open source music player][2]. Jonas writes:

I started working on a modified version of Clementine already in 2013, but because of other priorities, I did not pick up the work again before last year. I had not decided then if I was creating a fork, or contributing to Clementine. I ended up doing both. I started to see that I wanted the program development in a different direction. My focus was to create a music player for playing local music files, and not having to maintain support for multiple internet features that I did not use, and some which I did not want in the program at all… I also saw more and more that I disagree with the authors of Clementine and some statements that have been made regarding high-resolution audio.

Jonas and I are definitely working from the same perspective, at least in relation to high-resolution music files. Back in late 2016, [I looked at Clementine][3], and though it was in many ways delightful, it definitely missed the boat with respect to working with a dedicated high-resolution digital-analog converter (DAC) for music enjoyment. But that’s OK; Clementine just wasn’t built for me. Nor, it appears, was it for Jonas.

So, given that Jonas and I share an interest in being able to play back high-resolution audio on a dedicated listening device, I thought I’d best give [Strawberry][4], Jonas’ fork of Clementine, a try. I grabbed the [2018/07/16 release for Ubuntu][5] from Jonas’ site. It was a .deb and very straightforward to install.
```
sudo dpkg -i strawberry_0.2.1-27-gb2c26eb_amd64.deb

```

As usual, some necessary packages weren’t installed on my system, so I used `apt install -f` to remedy that.

Apt recommended the following packages:
```
graphicsmagick-dbg gxine xine-ui

```

and installed the following packages:
```
libgraphicsmagick-q16-3 libiso9660-10 liblastfm5-1 libqt5concurrent5 libvcdinfo0 libxine2 libxine2-bin libxine2-doc libxine2-ffmpeg libxine2-misc-plugins libxine2-plugins

```

Once that was all in hand, I started up Strawberry and saw this:

![](https://opensource.com/sites/default/files/uploads/1806-1_html_53455474cece6e43_0.png)

I verified that I could point Strawberry at ALSA in general and at my dedicated DAC in particular.

![](https://opensource.com/sites/default/files/uploads/1806-1_html_1b8f42a0fbbc251c_0.png)

![](https://opensource.com/sites/default/files/uploads/1806-1_html_641ffad17267dec0_0.png)

Then I was ready to update my collection, which took less than a minute (Clementine was similarly fast).

The only thing I noticed that seemed a little odd was that Strawberry provided a software volume control, which isn’t of great interest to me (my hardware has a nice shiny knob on top for just that purpose).

![](https://opensource.com/sites/default/files/uploads/1806-1_html_cb207c425e02621c_0.png)

And then I got down to some quality listening. One of the things I found I liked right away is the status button (see the strawberry at the top left of the UI). This verifies the details of the currently playing track, as shown in the screen capture to the left. Note that the effective bit rate, bit rate, and word length are shown, as well as other useful information.

The sound is glorious, as is customary with well-recorded high-resolution material (for those of you inclined to argue about the merits of high-resolution audio, before you post your opinions, whether pro or con, please read [this article][6], which actually treats the topic in a scientific fashion).

What’s cool about Strawberry, besides audio quality? Well, it’s fun to see the spectrum analyzer operating on the bottom of the screen. The overall responsiveness is smooth and quick; the album cover slides up once the music starts. There isn’t a lot of wasted space in the UI. And, as Jonas says:

For many people, Clementine will still be a better choice since it has features such as scrobbling and internet services, which Strawberry lacks and I do not plan to include.

Evidently, this is a player focused on the quality of the music, rather than the quantity. I’ll be using this player more in the future; it’s right up my alley.

### Fine sound collections

On the topic of music, especially interesting and unusual music, many thanks to [Michael Lavorgna over at Audiostream][7], who mentions these two fine online sound collections: [Cultural Equity][8] and [Smithsonian Folkways Recordings][9]. What great sources for stuff that is of historical interest and just plain fun.

Also thanks to Michael for reminding me about [Ektoplazm][10], a fine free music portal for those interested in “psytrance, techno, and downtempo music.” I’ve downloaded a few albums from this site in the past, and when the mood strikes, I really appreciate what it has to offer. It's especially wonderful that the music files are available in [FLAC][11].

### And more music…

In my last article, I spent so much time building that I didn’t have any time for listening. But since then, I’ve been to my favorite record store and picked up four new albums, some of which came with downloads. First up is [Jon Hopkins’][12] [Singularity][12]. I’ve been picking up the odd Jon Hopkins album since [Linn Records][13] (by the way, a great site for Linux users to buy downloads since no bloatware is required) was experimenting with a more broad-based music offering and introduced me to Jon. Some of his work is [available on Bandcamp][14] these days (including Singularity) which is a fine Linux-friendly site. For me, this is a great album—not really ambient, not really beatless, not really anything except what it is. Huge powerful swaths of music, staggering bass. Great fun! Go listen on [Bandcamp][14].

And if, like me, you have bought a few [Putumayo Music][15] albums over the years, keep your eyes peeled for Putumayo’s absolutely wonderful vinyl LP release of [_Vintage Latino_][16]. This great LP of vintage salsa and cha-cha is also available there to buy as a CD; you can listen to [1:00 clips on Bandcamp][17].

[Bombino][18] was in town last night. I had other stuff to do, but a friend went to the concert and loved it. I have three of his albums now; the last two I purchased on that fine open source medium, the vinyl LP, which came with downloads as well. His most recent album, _Deran_ , is more than worth it; check it out on the link above.
<https://www.youtube.com/embed/1PTj1qIqcWM>

Last but by no means least, I managed to find a copy of [Nils Frahm’s _All Melody_][19] on vinyl (which includes a download code). I’ve been enjoying the high-resolution digital version of this album that I bought earlier this year, but it’s great fun to have it on vinyl.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/strawberry-new-open-source-music-player

作者：[Chris Hermansen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:https://github.com/jonaski
[2]:https://www.clementine-player.org/
[3]:https://opensource.com/life/16/10/4-open-music-players-compared
[4]:http://www.strawbs.org/
[5]:http://builds.jkvinge.net/ubuntu/bionic/strawberry_0.2.1-27-gb2c26eb_amd64.deb
[6]:http://www.aes.org/e-lib/browse.cfm?elib=18296
[7]:https://www.audiostream.com/content/alan-lomax-17000-sound-recordings-online-free
[8]:http://research.culturalequity.org/audio-guide.jsp
[9]:https://folkways.si.edu/radio-and-playlists/smithsonian
[10]:http://www.ektoplazm.com/
[11]:https://xiph.org/flac/
[12]:https://pitchfork.com/reviews/albums/jon-hopkins-singularity/
[13]:http://www.linnrecords.com/
[14]:https://jonhopkins.bandcamp.com/album/singularity
[15]:https://www.putumayo.com/
[16]:https://www.putumayo.com/product-page/vintage-latino
[17]:https://putumayo.bandcamp.com/album/vintage-latino
[18]:http://www.bombinomusic.com/
[19]:https://www.youtube.com/watch?v=1PTj1qIqcWM
