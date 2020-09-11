[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Youtube-dl Tutorial With Examples For Beginners)
[#]: via: (https://www.ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Youtube-dl Tutorial With Examples For Beginners
======

![Youtube-dl Tutorial With Examples For Beginners][1]

There are numerous applications available to Download Youtube videos. We have covered such applications, namely [**ClipGrab**][2], and [**Mps-youtube**][3] etc., in the past. Today, we are going to learn about yet another Youtube downloader called **Youtube-dl**. Like Mps-youtube, Youtube-dl is also a command line program to download videos from Youtube and a lot of other websites listed [**here**][4]. Youtube-dl can be able to download a single track or entire playlist in one go. It is a free and open source command line program written in **Python**. It supports GNU/Linux, Mac OS X and Microsoft Windows.

### Installing Youtube-dl

The easiest and officially recommended way to install Youtube-dl is just download it, save it in your PATH, make it executable and start using it right away.

```
$ sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
```

If you don’t have curl, use **wget** instead:

```
$ sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl

$ sudo chmod a+rx /usr/local/bin/youtube-dl
```

Alternatively, you can install it using [**Pip**][5] as shown below.

```
$ sudo -H pip install --upgrade youtube-dl
```

Youtube-dl is also available in the official repositories of some Linux distributions. For example, you can install it in Arch Linux using command:

```
$ sudo pacman -S youtube-dl
```

On Debian, Ubuntu, Linux mint:

```
$ sudo apt install youtube-dl
```

On Fedora:

```
$ sudo dnf install youtube-dl
```

FFmpeg is also required to download 720p videos from YouTube and convert videos to other formats. To install FFmpeg, refer the following guide.

  * [**How to install FFmpeg on Linux**][6]



### Update Youtube-dl

If you’ve manually installed Youtube-dl using curl or wget, run the following command to update it:

```
$ sudo youtube-dl -U
```

If you installed it using pip, do:

```
$ sudo pip install -U youtube-dl
```

Those who installed Youtube-dl using the distribution’s package manager, just use the appropriate update command. For example, on Arch Linux, you can update Youtube-dl by simply running the following command:

```
$ sudo pacman -Syu
```

On Debian, Ubuntu:

```
$ sudo apt update
```

Now, let us see some examples to learn to use Youtube-dl.

### Youtube-dl Tutorial With Examples

Here, I have compiled most commonly used Youtube-dl commands to download a video or playlist from youtube.

####### **1\. Download video or playlist**

To download a video or the entire playlist from Youtube, just mention the URL like below:

```
$ youtube-dl https://www.youtube.com/watch?v=7E-cwdnsiow
```

If you want to download video or playlist with a custom name of your choice, the command would be:

```
$ youtube-dl -o 'abdul kalam inspirational speech' https://www.youtube.com/watch?v=7E-cwdnsiow
```

Replace “abdul kalam inspirational speech” with your own name.

You can also include additional details, such as the title, the uploader name (channel name) and upload date etc., in the file name by using the following command:

```
$ youtube-dl -o '%(title)s by %(uploader)s on %(upload_date)s in %(playlist)s.%(ext)s' https://www.youtube.com/watch?v=7E-cwdnsiow
```

####### **2\. Download multiple videos**

Sometimes, you might want to download multiple videos from or any other site. If so, just mention the URL of the videos with space-separated like below:

```
$ youtube-dl <url1> <url2>
```

Alternatively, you can put them all in a text file and pass it to Youtube-dl as an argument like below.

```
$ youtube-dl -a url.txt
```

This command will download all videos mentioned in the url.txt file.

####### **3\. Download audio-only from a video**

Youtube-dl allows us to download audio only from a Youtube video. If you ever been in a situation to download only the audio, run:

```
$ youtube-dl -x https://www.youtube.com/watch?v=7E-cwdnsiow
```

By default, Youtube-dl will save the audio in **Ogg** (opus) format.

If you prefer to download any other formats, for example **mp3** , run:

```
$ youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=7E-cwdnsiow
```

This command will download the audio from the given video/playlist, convert it to an MP3 and save it in the current directory. Please note that you should install either [**ffmpeg**][7] or **avconv** to convert the file to mp3 format.

####### **4\. Download video with description, metadata, annotations, subtitles and thumbnail**

To download a video along with its other details such as description, metadata, annotations, subtitles, and thumbnail etc., use the following command:

```
$ youtube-dl --write-description --write-info-json --write-annotations --write-sub --write-thumbnail https://www.youtube.com/watch?v=7E-cwdnsiow
```

####### **5\. List all available formats of video or playlist**

To list all available formats that a video or playlist is available in, use the following command:

```
$ youtube-dl --list-formats https://www.youtube.com/watch?v=7E-cwdnsiow
```

Or

```
$ youtube-dl -F https://www.youtube.com/watch?v=7E-cwdnsiow
```

Sample output:

![][8]

List all available formats of a youtube video using youtube-dl

As you can see in the above screenshot, Youtube-dl lists all available formats of the given video. From left to right, it displays the video format code, extension and resolution note of the respective video. This can be helpful when you want to download a video at a specific quality or format.

####### **6\. Download videos in certain quality and/or format**

By default, Youtube-dl will download the best available quality video. However, it is also possible to download a video or playlist at a specific quality or format.

Youtube is capable of downloading videos in the following qualities:

  * **best** – Select the best quality format of the given file with video and audio.
  * **worst** – Select the worst quality format (both video and audio).
  * **bestvideo** – Select the best quality video-only format (e.g. DASH video). Please note that it may not be available.
  * **worstvideo** – Select the worst quality video-only format. May not be available.
  * **bestaudio** – Select the best quality audio only-format. May not be available.
  * **worstaudio** – Select the worst quality audio only-format. May not be available.



For example, if you want to download **best quality** format (both audio and video), just use the following command:

```
$ youtube-dl -f best https://www.youtube.com/watch?v=7E-cwdnsiow
```

Similarly, to download audio-only with best quality:

```
$ youtube-dl -f bestaudio https://www.youtube.com/watch?v=7E-cwdnsiow
```

To download worst quality video-only format, use the following command:

```
$ youtube-dl -f worstvideo https://www.youtube.com/watch?v=7E-cwdnsiow
```

You also combine different format options like below.

```
$ youtube-dl -f bestvideo+bestaudio https://www.youtube.com/watch?v=7E-cwdnsiow
```

The above command will download best quality video-only and best quality audio-only formats and merge them together with ffmpeg or avconv. Make sure you have installed any one of these tools on your system.

If you don’t want to merge, replace **+** (plus) operator with **,** (comma) like below:

```
$ youtube-dl -f 'bestvideo,bestaudio' https://www.youtube.com/watch?v=7E-cwdnsiow -o '%(title)s.f%(format_id)s.%(ext)s'
```

This command will download best quality video and best quality audio and **will not mix them**. In this case, you will get two files, one is audio and another is video. In this example, an output template ( **-o** option) is recommended as bestvideo and bestaudio may have the same file name.

We can even download a video or playlist at a specific quality with **specific resolution**.

For instance, the following command will download the **best quality** video in **480 pixel resolution** (less than or equal to 480p).

```
$ youtube-dl -f "best[height<=480]" https://www.youtube.com/watch?v=7E-cwdnsiow
```

Like already said, we can group the format selectors to get a specific quality video. The following command will download best format available(both audio and video) but **no better than 480p**.

```
$ youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' https://www.youtube.com/watch?v=7E-cwdnsiow
```

####### **7. Download videos using format code

**

All videos have format codes which we can use to download a video at specific quality. To find the format code, just list the available formats using any one of the following commands:

```
$ youtube-dl --list-formats https://www.youtube.com/watch?v=7E-cwdnsiow
```

Or

```
$ youtube-dl -F https://www.youtube.com/watch?v=7E-cwdnsiow
```

![][9]

As you can see in the above screenshot, all format codes of the given video are listed in the first column. The best quality format is given at the end (the format code is **22** ). So, the command to download best quality format is:

```
$ youtube-dl -f 22 https://www.youtube.com/watch?v=7E-cwdnsiow
```

Some videos may not have the same formats available while you download videos from playlist. In such cases, you can specify multiple format codes in any preferred order of your choice. Take a look at the following example:

```
$ youtube-dl -f 22/17/18 <playlist_url>
```

As per the above example, Youtube-dl will download the videos in format 22 if it is available. If the format 22 is not available, it will then download format 17 if it is available. If both 22 and 17 formats are not available, it will finally try to download format 18. If none of the specified formats are available, Youtube-dl will complain that no suitable formats are available for download.

Please note that that slash is left-associative, i.e. formats on the left hand side are preferred.

####### **8. Download videos by file extension

**

Download video(s) in your preferred format, say for example MP4, just run:

```
$ youtube-dl --format mp4 https://www.youtube.com/watch?v=7E-cwdnsiow
```

Or,

```
$ youtube-dl -f mp4 https://www.youtube.com/watch?v=7E-cwdnsiow
```

Like I already mentioned in the previous section, some videos may not available in your preferred formats. In such cases, Youtube-dl will download any other best available formats. For instance, this command will download best quality MP4 format file. If MP4 format is not available, then it will download any other best available format.

```
$  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' https://www.youtube.com/watch?v=7E-cwdnsiow
```

If you want to download them with custom filename, do:

```
$ youtube-dl -f mp4 -o '%(title)s.f%(format_id)s.%(ext)s' https://www.youtube.com/watch?v=7E-cwdnsiow
```

####### **9. Set size limit for videos

**

When you download multiple videos from a playlist, you might want to download videos within a certain size only.

For example, this command will not download any videos smaller than the given size, say **100MB** :

```
$ youtube-dl --min-filesize 100M <playlist_url>
```

If you don’t want to download videos larger than the given size, do:

```
$ youtube-dl --max-filesize 100M <playlist_url>
```

We can also combine format selection operators to download certain size videos.

The following command will download best video-only format but **not bigger than 100 MB**.

```
$ youtube-dl -f 'best[filesize<100M]' https://www.youtube.com/watch?v=7E-cwdnsiow
```

####### **10. Download videos by date-wise

**

Youtube-dl allows us to filter and download video or playlist by their upload date. This will be very helpful when you want to download videos from a playlist that contains 100s of videos.

For instance, to download videos uploaded at an exact date, for example October 01, 2018, the command would be:

```
$ youtube-dl --date 20181001 <URL>
```

Download videos uploaded on or before a specific date:

```
$ youtube-dl --datebefore 20180101 <URL>
```

Download videos uploaded on or after a specific date:

```
$ youtube-dl --dateafter 20180101 <URL>
```

Download only the videos uploaded in the last 6 months:

```
$ youtube-dl --dateafter now-6months <URL>
```

To download videos between a specific date, for example January 01, 2018 to January 01, 2019, use the following command:

```
$ youtube-dl --dateafter 20180101 --datebefore 20190101 <URL>
```

####### **11. Download specific videos from playlist

**

This is yet another useful feature of Youtube-dl. It allows us to download a specific song(s) from a playlist that contains 100s of songs.

For example, to download the 10th file from a playlist, run:

```
$ youtube-dl --playlist-items 10 <playlist_url>
```

Similarly, to download multiple random files, just specify indices of the videos in the playlist separated by commas like below::

```
$ youtube-dl --playlist-items 2,3,7,10 <playlist_url>
```

You can also specify the range of songs. To download a video playlist starting from a certain video, say 10, to end:

```
$ youtube-dl --playlist-start 10 <playlist_url>
```

To download only the files starting from 2nd to 5th in a playlist, use:

```
$ youtube-dl --playlist-start 2 --playlist-end 5 <playlist_url>
```

####### 12\. Download only videos suitable for specific age

This is another notable feature of Youtube-dl. It allows us to download only videos suitable for the given age.

Say for example, to download all “Let’s Play” videos that aren’t marked “NSFW” or age-restricted for 7 year-olds from a playlist, run:

```
$ youtube-dl --match-title "let's play" --age-limit 7 --reject-title "nsfw" <playlist_url>
```

Youtube-dl has a lot more options. I guess these 12 examples are just enough to use Youtube-dl to download videos from online. For more details, refer Youtube-dl help section.

```
$ youtube-dl --help
```

**Resources:**

  * [**Youtube-dl website**][10]
  * [**Youtube-dl GitHub Repository**][11]
  * [**https://jonlabelle.com/snippets/view/shell/youtube-dl-command**][12]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/youtube-dl-720x340.png
[2]: https://www.ostechnix.com/clipgrab-youtube-downloader-converter/
[3]: https://www.ostechnix.com/mps-youtube-commandline-youtube-player-downloader/
[4]: https://ytdl-org.github.io/youtube-dl/supportedsites.html
[5]: https://www.ostechnix.com/manage-python-packages-using-pip/
[6]: https://www.ostechnix.com/install-ffmpeg-linux/
[7]: https://www.ostechnix.com/20-ffmpeg-commands-beginners/
[8]: https://www.ostechnix.com/wp-content/uploads/2019/06/List-all-available-formats-youtube-dl.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/06/List-all-available-formats-youtube-dl-1.png
[10]: https://ytdl-org.github.io/youtube-dl/index.html
[11]: https://github.com/ytdl-org/youtube-dl
[12]: https://jonlabelle.com/snippets/view/shell/youtube-dl-command
