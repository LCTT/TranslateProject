[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Streaming internet radio with RadioDroid)
[#]: via: (https://opensource.com/article/19/4/radiodroid-internet-radio-player)
[#]: author: (Chris Hermansen (Community Moderator) https://opensource.com/users/clhermansen)

Streaming internet radio with RadioDroid
======
Listen to your favorite internet radio stations over your home stereo
with this easy setup.
![woman programming][1]

Online news outlets have recently lamented the [passing of Google's Chromecast Audio device][2]. The device received [favorable reviews][3] in the audio press, so I had already been thinking about acquiring one. Given the news of Chromecast's demise, I decided to look for one at a reasonable price—before they were all snapped up or thrown in the dumpster.

I found one at [MobileFun][4] and put in my order. The device eventually arrived, packaged in the usual serviceable but minimal Google wrapping, with a very brief Get Started guide printed on the outside.

![Google Chromecast Audio][5]

I cabled it to my home stereo via my digital-analog converter's optical S/PDIF connection, hoping that would provide the best sound quality.

The setup ran flawlessly, and in about five minutes I was ready to play some tunes. I knew that a number of Android applications support Chromecast, so I decided to test it out with Google Play Music; sure enough, it worked just fine and sounded quite good. However, being an open source kind of person, I decided to see what I could find in the way of open source players that work with Chromecast.

### RadioDroid to the rescue

The [RadioDroid Android application][6] fit the bill. It is open source and available on [GitHub][7], Google Play, and [F-Droid][8]. According to the documentation, RadioDroid looks up and plays streams from the [Community Radio Browser][9] website. So I decided to install it on my handset and give it a shot.

![RadioDroid][10]

The installation was quick and smooth, and RadioDroid opened rapidly to display local stations. You can see the Chromecast button (the icon that looks like a rectangle with wavefronts) near the top-right side of this screenshot.

I played around with a few of the local stations. The application reliably played music on my handset's speaker, but I had to futz around with the Chromecast button to get the music to stream over the Chromecast. But stream it did!

I decided to seek out my favorite internet radio station, [Radio Grenouille][11] in Marseille, France. There are various ways to find stations in RadioDroid. One is to use the tabs—Local, Topclick, etc.—located above the list of stations. One of the tabs is Countries; I found France, with some 1,500 stations, on the list and scrolled—and scrolled, and scrolled—down through the list to find Radio Grenouille. Another way is to use the Search button at the top of the screen; the search was rapid and returned that wonderful radio station. I tried a few other searches, and they all returned reasonable info.

Going back to the Local tab, I scrolled through the listings and learned that "local" seems to be defined as "in the same country." So, even though Seattle, Portland, San Francisco, Los Angeles, and Juneau are closer to my home than Toronto, I didn't see any of them in Local. However, by using Search, I could find all stations with "Seattle" in their name.

The Languages tab let me find all stations broadcasting in Portugues, Portuguese, Português, Português Brasil, Português do Brasil, Portuguẽs, and Portugês. I quickly found another favorite station, [91 Rock Curitiba][12].

Then inspiration struck—it's springtime, but who cares? Let's listen to some Christmas music. And sure enough, searching for Christmas led me to [181.FM – Christmas Blender][13]. Well, a minute or two of that was enough for me…

So, all in all, I recommend the RadioDroid and Chromecast combo as a nice way to play internet radio on a home stereo at a reasonable cost.

### As for the music…

Recently I picked up an interesting album of very ambient (even beatless) music called [Continuum One][14] by [Qua Continuum][15] from the [Blue Coast Music][16] store. Blue Coast has a lot to offer the open source music enthusiast: music is available by download (and sometimes physical format) without resorting to those grotesque platform-specific download managers; it typically provides several formats, including WAV, FLAC, and DSD; different word lengths and bitrates are provided for WAV and FLAC, including 16/44.1, 24/96, and 24/192, and for DSD, 2.8, 5.6, and 11.2 MHz; and the music is recorded with great care using wonderful facilities. Unfortunately, I don't find a lot of music there to my taste, though I like a few of the artists available on Blue Coast, including Qua Continuum, [Art Lande][17], and [Alex De Grassi][18].

Over on [Bandcamp][19], I picked up [Emancipator's Baralku][20] and [Framework's Tides][21], both of which I enjoy. The music created by these two artists hits my sweet spot—it's electronic but not (generally) dance, it's melodic, and it tends to have some great hooks. There are many things for open source aficionados to like about Bandcamp, such as the ability to listen to the work in its entirety before buying; the lack of bloatware downloaders; the amounts shared with the musicians; and its support for [Creative Commons music][22].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/radiodroid-internet-radio-player

作者：[Chris Hermansen (Community Moderator)][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (woman programming)
[2]: https://www.theverge.com/2019/1/11/18178751/google-chromecast-audio-discontinued-sale
[3]: https://www.whathifi.com/google/chromecast-audio/review
[4]: https://www.mobilefun.com/google-chromecast-audio-black-70476
[5]: https://opensource.com/sites/default/files/uploads/internet-radio_chromecast.png (Google Chromecast Audio)
[6]: https://play.google.com/store/apps/details?id=net.programmierecke.radiodroid2
[7]: https://github.com/segler-alex/RadioDroid
[8]: https://f-droid.org/en/packages/net.programmierecke.radiodroid2/
[9]: http://www.radio-browser.info/gui/#!/
[10]: https://opensource.com/sites/default/files/uploads/internet-radio_radiodroid.png (RadioDroid)
[11]: http://www.radiogrenouille.com/
[12]: https://91rock.com.br/
[13]: http://player.181fm.com/?station=181-xblender
[14]: https://www.youtube.com/watch?v=PqLCQXPS8iQ
[15]: https://bluecoastmusic.com/artists/qua-continuum
[16]: https://bluecoastmusic.com/store
[17]: https://bluecoastmusic.com/store?f%5B0%5D=search_api_multi_aggregation_1%3Aart%20lande
[18]: https://bluecoastmusic.com/store?f%5B0%5D=search_api_multi_aggregation_1%3Aalex%20de%20grassi
[19]: https://bandcamp.com/
[20]: https://emancipator.bandcamp.com/album/baralku
[21]: https://frameworksuk.bandcamp.com/album/tides
[22]: https://bandcamp.com/tag/creative-commons
