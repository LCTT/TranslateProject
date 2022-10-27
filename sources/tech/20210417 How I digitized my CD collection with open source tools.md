[#]: subject: (How I digitized my CD collection with open source tools)
[#]: via: (https://opensource.com/article/21/4/digitize-cd-open-source-tools)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I digitized my CD collection with open source tools
======
Clean off your shelves by ripping your CDs and tagging them for easy
playback across your home network.
![11 CDs in a U shape][1]

The restrictions on getting out and about during the pandemic occasionally remind me that time is slipping by—although some days, "slipping" doesn't quite feel like the right word. But it also reminds me there are more than a few tasks around the house that can be great for restoring the sense of accomplishment that so many of us have missed.

One such task, in my home anyway, is converting our CD collection to [FLAC][2] and storing the files on our music server's hard drive. Considering we don't have a huge collection (at least, by some people's standards), I'm surprised we still have so many CDs awaiting conversion—even excluding all the ones that fail to impress and therefore don't merit the effort.

As for that ticking clock—who knows how much longer the CD player will continue working or the CD-ROM drive in the old computer will remain in service? Plus, I'd rather have the CDs shelved in the basement storage instead of cluttering up the family room.

So, here I sit on a rainy Sunday afternoon with a pile of classical music CDs, ready to go…

### Ripping CDs

I like using the open source [Asunder CD ripper][3]. It's a simple and straightforward tool that uses the [cdparanoia][4] tool to handle the conversion chores. This image shows it working away on an album.

![Asunder][5]

(Chris Hermansen, [CC BY-SA 4.0][6])

When I fired up Asunder, I was surprised that its Compact Disc Database (CDDB) lookup feature didn't seem to find any matching info. A quick online search led me to a Linux Mint forum discussion that [offered alternatives][7] for the freedb.freedb.org online service, which apparently is no longer working. I first tried using gnudb.gnudb.org with no appreciably better result; plus, the suggested link to gnudb.org/howto.php upset Firefox due to an expired certificate.

Next, I tried the freedb.freac.org service (note that it is on port 80, not 8880, as was freedb.freedb.org), which worked well for me… with one notable exception: The contributed database entries don't seem to understand the difference between "artist" (or "performer") and "composer." This isn't a huge problem for popular music, but having JS Bach as the "artist" seems a bit incongruous since he never made it to a recording studio, as far as I know.

Quite a few of the tracks I converted identified the composer in the track title, but if there's one thing I've learned, your metadata can never be too correct. This leads me to the issue of tag editing, or curating the collection.

Oh wait, there's another reason for tag editing, too, at least when using Asunder to rip: getting the albums' cover images.

### Editing tags and curating the collection

My open source go-to tool for [music tag editing continues to be EasyTag][8]. I use it a lot, both for downloads I purchase (it's amazing how messed up their tags can be, and some download services offer untagged WAV format files) and for tidying up the CDs I rip.

Take a look at what Asunder has (and hasn't) accomplished from EasyTag's perspective. One of the CDs I ripped included Ravel's _Daphnis et Chloé Suites 1 and 2_ and Strauss' _Don Quixote_. The freedb.freac.org database seemed to think that the composers Maurice Ravel and Richard Strauss were the artists performing the work, but the artist on this album is the wonderful London Symphony Orchestra led by André Previn. In Asunder, I clicked the "single artist" checkbox and changed the artist name to the LSO. Here's what it looks like in EasyTag:

![EasyTag][9]

(Chris Hermansen, [CC BY-SA 4.0][6])

It's not quite there! But in EasyTag, I can select the first six tracks, tagging the composer on all the files by clicking on that little "A" icon on the right of the Composer field:

![Editing tags in EasyTag][10]

(Chris Hermansen, [CC BY-SA 4.0][6])

I can set the remaining 13 similarly, then select the whole lot and set the Album Artist as well. Finally, I can flip to the Images tab and find and set the album cover image.

Speaking of images, I've found it wise to always name the image "cover.jpg" and make sure it's in the directory with the FLAC files… some players aren't happy with PNG files, some want the file in the same directory, and some are just plain difficult to get along with, as far as images go.

What is your favorite open source CD ripping tool? How about the open source tool you like to use to fix your metadata? Let me know in the comments below!

### And speaking of music…

I haven't been as regular with my music and open source column over the past year as I was in previous years. Although I didn't acquire a lot of new music in 2020 and 2021, a few jewels still came my way…

As always, [Erased Tapes][11] continues to develop an amazing collection of hmmm… what would you call it, anyway? The site uses the terms "genre-defying" and "avant-garde," which don't seem overblown for once. A recent favorite is Rival Consoles' [_Night Melody Articulation_][12], guaranteed to transport me from the day-to-day grind to somewhere else.

I've been a huge fan of [Gustavo Santaolalla][13] since I first heard his music on a road trip from Coyhaique to La Tapera in Chile's Aysén Region. You might be familiar with his film scores to _Motorcycle Diaries_ or _Brokeback Mountain_. I recently picked up [_Qhapaq Ñan_, music about the Inca Trail][14], on the Linux-friendly music site [7digital][15], which has a good selection of his work.

Finally, and continuing with the Latin American theme, The Queen's Six recording [_Journeys to the New World_][16] is not to be missed. It is available in FLAC format (including high-resolution versions) from the Linux-friendly [Signum Classics][17] site.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/digitize-cd-open-source-tools

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_cd_dvd.png?itok=RBwVIzmi (11 CDs in a U shape)
[2]: https://en.wikipedia.org/wiki/FLAC
[3]: https://opensource.com/article/17/2/open-music-tagging
[4]: https://www.xiph.org/paranoia/
[5]: https://opensource.com/sites/default/files/uploads/asunsder.png (Asunder)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://forums.linuxmint.com/viewtopic.php?t=322415
[8]: https://opensource.com/article/17/5/music-library-tag-management-tools
[9]: https://opensource.com/sites/default/files/uploads/easytag.png (EasyTag)
[10]: https://opensource.com/sites/default/files/uploads/easytag_editing-tags.png (Editing tags in EasyTag)
[11]: https://www.erasedtapes.com/about
[12]: https://www.erasedtapes.com/release/eratp139-rival-consoles-night-melody-articulation
[13]: https://en.wikipedia.org/wiki/Gustavo_Santaolalla
[14]: https://ca.7digital.com/artist/gustavo-santaolalla/release/qhapaq-%C3%B1an-12885504?f=20%2C19%2C12%2C16%2C17%2C9%2C2
[15]: https://ca.7digital.com/search/release?q=gustavo%20santaolalla&f=20%2C19%2C12%2C16%2C17%2C9%2C2
[16]: https://signumrecords.com/product/journeys-to-the-new-world-hispanic-sacred-music-from-the-16th-17th-centuries/SIGCD626/
[17]: https://signumrecords.com/
