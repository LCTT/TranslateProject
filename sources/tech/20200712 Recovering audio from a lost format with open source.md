[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Recovering audio from a lost format with open source)
[#]: via: (https://opensource.com/article/20/7/hdcd)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Recovering audio from a lost format with open source
======
The history of HDCD format and how I recovered lost audio on Linux.
![11 CDs in a U shape][1]

Back in the early 2000s, we made a family decision to upgrade the living room stereo. The equipment in place at the time was based on a collection of gear that I had purchased some 20 years earlier when I first had a steady post-university income. That early collection could best be described as "industrial chic," most notably the [Hafler amplifiers][2] I had built from kits and the [Polk speakers][3] made from some kind of composite wood product and finished with an ugly faux-rosewood vinyl wrap. They produced decent sound, but the dorm-room-style decor just wasn't working out in the living room.

Those of you who remember the early 2000s will recall that most of the world was still consuming music on CD. Our family was no exception, and we ended up with a fine CD player that had an interesting feature—it was able to decode regular CDs as well as high-definition-compatible digital (HDCD) discs.

According to [Wikipedia][4], HDCD is a proprietary audio encode-decode process that claims to provide increased dynamic range over that of standard Red Book audio CDs, while retaining backward compatibility with existing compact disc players.

The [manual for our CD player][5] states: "HDCD system is manufactured under license from Pacific Microsonics, Inc." and "HDCD is a digital signal processing system developed by Pacific Microsonics of California which conceals control codes into a very small fraction of the recorded CD digital audio stream. An HDCD decoder recognizes these control codes and uses them to process the digital audio to increase its dynamic range and resolution, while leaving the original digital stream compatible with conventional CD players."

How does HDCD work this magic, you may ask? The same Wikipedia entry states, "HDCD encodes the equivalent of 20 bits worth of data in a 16-bit digital audio signal by using custom dithering, audio filters, and some reversible amplitude and gain encoding; Peak Extend, which is a reversible soft limiter; and Low-Level Range Extend, which is a reversible gain on low-level signals."

Whatever the merits of this technology, its parent company was unable to continue business and ceased operations sometime in 2000. The Wikipedia article indicates that Microsoft acquired the company and incorporated code in Windows Media Player to allow the decoding of HDCD, but seemingly lost interest in its promotion. Perhaps this was due to the emergence of other proprietary high-resolution audio formats such as SACD and DVD-A, which were able to encode a full 24 bits of signal on a similar-looking but incompatible media. Neither of these latter formats was especially successful, at least not in commercial terms, though studios continue to release music on SACD. As it happens, SACD included a "hybrid" standard that provided both SACD and backward-compatible CD layers on the same disc, allowing the playback of those albums on regular CD players at standard CD resolution.

How many artists and studios actually made use of HDCD? Well, Discogs offers [a list of 11,284 HDCD recordings][6] (as of this writing). [This web site][7] offers an interesting analysis of some of the facilities HDCD provided, using actual HDCD encoded music. And for those interested in the original patent, which Google Patents claims has expired, [it can be found here][8].

### My HDCD story

Anyone who is interested enough in audio equipment to read promotional brochures or audiophile magazines will recognize the fascination many audiophiles have with proprietary designs—they seem to view a patent as validation of the equipment that uses that technology.

Though now I do what I can to avoid being swayed by "proprietary technology fascination," I admit I was not such a staunch proponent of all things open back in the early 2000s. Not only did I buy the aforementioned fine CD player with its proprietary innards, but I also bought—the horror!—a few actual HDCD-encoded titles.

This past weekend, I managed to find three of them in our collection, but I am certain there are more. The three I managed to find include Ensemble Dumont's [La Messe du Roi][9], Musica Secreta's [Dangerous Graces][10], and the Orchestra of the Age of Enlightenment's [Vivaldi Concerti][11], all from the Linn Records Linux-friendly [music store][12]. While making sure these titles were still available, I noticed that they are no longer offered in HDCD.

Given that I have these albums on hand and that the patent seems to have expired, I decided to find out whether I could convert these discs in their full intended resolution to an open music format, and moreover, whether I could do so without using proprietary software.

The first software I stumbled upon for decoding HDCD format was hdcd.exe., [described and offered here][13]. Since the source code for this software was not offered, and since it required Windows, or at least Wine, to run, my initial interest mostly evaporated.

The Wikipedia article noted above mentioned that some other Windows-based music players offered HDCD decoding. Hmm. But then I spotted:

"FFmpeg's libavfilter includes an HDCD filter as of FFmpeg 3.1 (June 2016) that will convert 16-bit PCM with HDCD data to 20-bit PCM."

This seemed like a promising starting point, so I installed `ffmpeg` from my distro's repositories, and then went looking for some more hints, at which point I stumbled on [the very concise description on hydrogenaudio][14], which even supplies a script for finding HDCD-encoded files in one's music directory. I used the line that runs `ffmpeg` against one of the files ripped from the Musica Secreta CD mentioned previously, as follows:


```
ffmpeg  -hide_banner -nostats -y -v verbose -i \
'01 - Musica Secreta - Questi odorati fiori.flac'
-vn -af hdcd -f s24le /dev/null 2&gt;&amp;1 | grep "_hdcd_"
```

and received the following output:


```
[Parsed_hdcd_0 @ 0x55b2137e2c80] Disabling automatic format conversion.
[Parsed_hdcd_0 @ 0x55b2137e2c80] Auto-convert: disabled
[Parsed_hdcd_0 @ 0x55b2137e2c80] Looking for 16-bit HDCD in sample format s16
[Parsed_hdcd_0 @ 0x55b2137e2c80] CDT period: 2000ms (88200 samples @44100Hz)
[Parsed_hdcd_0 @ 0x55b2137e2c80] Process mode: process stereo channels together
[Parsed_hdcd_0 @ 0x55b2137e2c80] Force PE: off
[Parsed_hdcd_0 @ 0x55b2137e2c80] Analyze mode: [0] disabled
[Parsed_hdcd_0 @ 0x55b2137e2c80] Channel 0: counter A: 0, B: 1657, C: 1657
[Parsed_hdcd_0 @ 0x55b2137e2c80] Channel 0: pe: 1657, tf: 0, almost_A: 0, checkfail_B: 0, unmatched_C: 0, cdt_expired: 0
[Parsed_hdcd_0 @ 0x55b2137e2c80] Channel 0: tg 0.0: 1657
[Parsed_hdcd_0 @ 0x55b2137e2c80] Channel 1: counter A: 0, B: 1657, C: 1657
[Parsed_hdcd_0 @ 0x55b2137e2c80] Channel 1: pe: 1657, tf: 0, almost_A: 0, checkfail_B: 0, unmatched_C: 0, cdt_expired: 0
[Parsed_hdcd_0 @ 0x55b2137e2c80] Channel 1: tg 0.0: 1657
[Parsed_hdcd_0 @ 0x55b2137e2c80] Packets: type: B, total: 3314
[Parsed_hdcd_0 @ 0x55b2137e2c80] HDCD detected: yes, peak_extend: enabled permanently, max_gain_adj: 0.0 dB, transient_filter: not detected, detectable errors: 0
```

Note the last line above mentioning that HDCD was, in fact, detected. Also, it seems that the "peak extend" capability is enabled. As I understand this capability, it reverses the compression/limiting applied to the loudest parts of the music after dropping the overall signal level by a factor of two, thus restoring some of the original recording's extra dynamic range. Goodwin's High End's web site has a detailed description of this topic [here][15].

At this point, it was time to try this whole thing out. For some reason, I did not feel confident doing a one-step conversion from 16-bit undecoded FLAC to 24-bit decoded FLAC, so I ran the conversion in two steps, as follows:


```
for f16 in *.flac; do
trk=`basename "$f16" .flac`
w24="$trk"_24.wav
ffmpeg -i "$f16" -af hdcd -acodec pcm_s24le "$w24"
flac "$w24"
done
```

This gave me a set of 24-bit 44.1kHz FLAC files, which I verified with the **file** command. At that point, all I needed to do was make sure all the tags looked good, and that was that.

### And speaking of music…

I've been taking a break from this music column this year, as I haven't done much except listen to things I already have on hand. But a few new items have crept into my collection.

Emancipator's latest, [Mountain of Memory][16], is available from that great Linux-friendly and artist-friendly online store, [Bandcamp][17]. If you like Emancipator's earlier stuff, you won't be disappointed with this.

The Choir of Clare College at Cambridge and the Dmitri Ensemble have released [a fine collection of music by Arvo Pärt, Peteris Vasks, and James MacMillan][18], entitled "Arvo Pärt Stabat." I haven't listened to this album carefully, but even so, I am struck by the similarity between the three composers' work presented here. Maybe something about the shared influence of a northern European landscape and weather? I bought this beautiful choral music as a 96/24 FLAC download from [Presto Classical][19], another fine Linux-friendly online store. For those interested in more information on this music, there is an interview on that site with Graham Ross, the conductor of the Choir of Clare College.

Finally, some other interesting news—an online store with lots of great high-resolution downloads that has frustrated me for many years (to the point of sending them numerous whiny emails), [HDtracks][20], has finally made it possible to purchase music from them without using their download manager! I haven't actually bought anything there yet, but I will soon give it a whirl and report back.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/hdcd

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_cd_dvd.png?itok=RBwVIzmi (11 CDs in a U shape)
[2]: https://audiokarma.org/forums/index.php?threads/questions-about-hafler-dh-110-connections.790899/
[3]: https://forum.polkaudio.com/discussion/166859/monitor-7b-question
[4]: https://en.wikipedia.org/wiki/High_Definition_Compatible_Digital
[5]: https://docs.linn.co.uk/wiki/images/0/08/Ikemi_genki_user_manual.pdf
[6]: https://www.discogs.com/search/?format_exact=HDCD
[7]: http://www.audiomisc.co.uk/HFN/HDCD/Examined.html
[8]: https://patents.google.com/patent/US5479168?oq=US5479168
[9]: https://www.linnrecords.com/recording-la-messe-du-roi
[10]: https://www.linnrecords.com/recording-dangerous-graces-music-cipriano-de-rore-and-pupils
[11]: https://www.linnrecords.com/recording-vivaldi-concerti
[12]: https://www.linnrecords.com/
[13]: http://forum.doom9.org/showthread.php?t=129136
[14]: https://wiki.hydrogenaud.io/index.php?title=High_Definition_Compatible_Digital#FFmpeg
[15]: http://www.goodwinshighend.com/music/hdcd/gain_scaling.htm
[16]: https://emancipator.bandcamp.com/album/mountain-of-memory
[17]: https://bandcamp.com/
[18]: https://www.clarecollegechoir.com/product/arvo-p%C3%A4rt-stabat
[19]: https://www.prestomusic.com/classical/products/8766094--arvo-part-stabat-mater
[20]: https://www.hdtracks.com/
