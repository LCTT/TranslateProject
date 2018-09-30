translating by lujun9972
How to Create M3U Playlists in Linux [Quick Tip]
======
**Brief: A quick tip on how to create M3U playlists in Linux terminal from unordered files to play them in a sequence.**

![Create M3U playlists in Linux Terminal][1]

I am a fan of foreign tv series and it’s not always easy to get them on DVD or on streaming services like [Netflix][2]. Thankfully, you can find some of them on YouTube and [download them from YouTube][3].

Now there comes a problem. Your files might not be sorted in a particular order. In GNU/Linux files are not naturally sort ordered by number sequencing so I had to make a .m3u playlist so [MPV video player][4] would play the videos in sequence and not out of sequence.

Also sometimes the numbers are in the middle or the end like ‘My Web Series S01E01.mkv’ as an example. The episode information here is in the middle of the filename, the ‘S01E01’ which tells us, humans, which is the first episode and which needs to come in next.

So what I did was to generate an m3u playlist in the video directory and tell MPV to play the .m3u playlist and it would take care of playing them in the sequence.

### What is an M3U file?

[M3U][5] is basically a text file that contains filenames in a specific order. When a player like MPV or VLC opens an M3U file, it tries to play the specified files in the given sequence.

### Creating M3U to play audio/video files in a sequence

In my case, I used the following command:
```
$/home/shirish/Videos/web-series-video/$ ls -1v |grep .mkv > /tmp/1.m3u && mv /tmp/1.m3u .

```

Let’s break it down a bit and see each bit as to what it means –

**ls -1v** = This is using the plain ls or listing entries in the directory. The -1 means list one file per line. while -v natural sort of (version) numbers within text

**| grep .mkv** = It’s basically telling `ls` to look for files which are ending in .mkv . It could be .mp4 or any other media file format that you want.

It’s usually a good idea to do a dry run by running the command on the console:
```
ls -1v |grep .mkv
My Web Series S01E01 [Episode 1 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E02 [Episode 2 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E03 [Episode 3 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E04 [Episode 4 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E05 [Episode 5 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E06 [Episode 6 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E07 [Episode 7 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E08 [Episode 8 Name] Multi 480p WEBRip x264 - xRG.mkv

```

This tells me that what I’m trying to do is correct. Now just have to make that the output is in the form of a .m3u playlist which is the next part.
```
ls -1v |grep .mkv > /tmp/web_playlist.m3u && mv /tmp/web_playlist.m3u .

```

This makes the .m3u generate in the current directory. The .m3u playlist is nothing but a .txt file with the same contents as above with the .m3u extension. You can edit it manually as well and add the exact filenames in an order you desire.

After that you just have to do something like this:
```
mpv web_playlist.m3u

```

The great thing about MPV and the playlists, in general, is that you don’t have to binge-watch. You can see however much you want to do in one sitting and see the rest in the next session or the session after that.

I hope to do articles featuring MPV as well as how to make mkv files embedding subtitles in a media file but that’s in the future.

Note: It’s FOSS doesn’t encourage piracy.

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-m3u-playlist-linux/

作者：[Shirsh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/shirish/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/Create-M3U-Playlists.jpeg
[2]:https://itsfoss.com/netflix-open-source-ai/
[3]:https://itsfoss.com/download-youtube-linux/
[4]:https://itsfoss.com/mpv-video-player/
[5]:https://en.wikipedia.org/wiki/M3U
