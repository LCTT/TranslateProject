[#]: subject: "How to Download Audio Only Using youtube-dl"
[#]: via: "https://itsfoss.com/youtube-dl-audio-only/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Download Audio Only Using youtube-dl
======

[youtube-dl][1] is a versatile command line tool for downloading videos from YouTube and many other websites. I use it for making back up of my own YouTube videos.

By default, you [use youtube-dl for downloading videos][2]. How about extracting only the audio with youtubde-dl? That’s very simple actually. Let me show you the steps.

Attention

Downloading videos from websites could be against their policies. It’s up to you if you choose to download videos or audio.

### Download only audio with youtube-dl

Please make sure that you have installed youtube-dl on your Linux distribution first.

```
sudo snap install youtube-dl
```

If you only want to download audio from a YouTube video, you can use the -x option with youtube-dl. This extract-audio option converts the video files to audio-only files.

```
youtube-dl -x video_URL
```

The file is saved in the same directory from where you ran the youtube-dl command.

Here’s an example where I downloaded the voice-over of our Zorin OS 16 review video.

```
youtube-dl -x https://www.youtube.com/watch?v=m_PmLG7HqbQ
[youtube] m_PmLG7HqbQ: Downloading webpage
[download] Destination: Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a
[download] 100% of 4.26MiB in 00:03
[ffmpeg] Correcting container in "Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a"
[ffmpeg] Post-process file Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a exists, skipping
```

Did you notice the audio format? It is in .m4a format. You may specify the audio format to something of your choice.

Say you want to extract the audio in MP3 format. You can use it like this:

```
youtube-dl -x --audio-format mp3 video_URL
```

Here’s the same example I showed previously. You can see that it [uses ffmpeg to convert][3] the m4a file into mp3.

```
youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=m_PmLG7HqbQ
[youtube] m_PmLG7HqbQ: Downloading webpage
[download] Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a has already been downloaded
[download] 100% of 4.26MiB
[ffmpeg] Correcting container in "Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a"
[ffmpeg] Destination: Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.mp3
Deleting original file Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a (pass -k to keep)
```

### Download entire YouTube playlist in MP3 format

Yes, you can totally do that. The main thing is to get the URL of the playlist here. It is typically in the following format:

```
https://www.youtube.com/playlist?list=XXXXXXXXXXXXXXXXXXX
```

To get the URL of a playlist, click on its name when the playlist is being displayed in the right sidebar.

![Click on the playlist title][4]

It will take you to the playlist page and you can copy the URL here.

![Grab the playlist URL][5]

Now that you have the playlist URL, you can use it to download the audio files in MP3 format in the following fashion:

```
youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" playlist_URL
```

That scary looking `-o "%(title)s.%(ext)s"` specifies the output file (with option -o) and instructs it to use the title of the video and the extension (mp3 in this case) for naming the audio files.

![][6]

I hope you find this quick tip helpful. Enjoy the audio files :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/youtube-dl-audio-only/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://github.com/ytdl-org/youtube-dl
[2]: https://itsfoss.com/download-youtube-linux/
[3]: https://itsfoss.com/ffmpeg/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/getting-youtube-playlist-url.png?resize=797%2C366&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/youtube-playlist-url.png?resize=800%2C388&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/downloading-youtube-playlist-audio.png?resize=800%2C559&ssl=1
