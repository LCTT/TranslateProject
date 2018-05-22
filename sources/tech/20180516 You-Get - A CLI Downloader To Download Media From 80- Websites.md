pinewall translating

You-Get – A CLI Downloader To Download Media From 80+ Websites
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/you-get-1-720x340.jpg)

Most of you may used or heard about **Youtube-dl** , a command line program to download videos from youtube and other 100+ websites. I just stumbled upon a similar utility named **“You-Get”**. It is also a CLI downloader written in Python. It allows you to download images, audios and videos from popular websites like Youtube, Facebook, Twitter and a lot more. Currently, there are 80+ websites are supported. Click [**here**][1] to read the full list of supported sites.

You-Get is not only a downloader, but also can stream the online videos in your media player. It even allows you to search for videos on google. Just pass the search term and You-Get will google it and download the most relevant videos. Another notable feature, it allows you to pause and resume the downloads. It is completely free, open source and cross-platform application that on Linux, Mac OS and Windows.

### Install You-Get

Make sure you have installed the following prerequisites.

+ Python 3
+ FFmpeg (strongly recommended) or Libav
+ (Optional) RTMPDump

You-Get can be installed in many ways. The officially recommended method is using Pip package manager. If you haven’t installed PIP yet, refer the following link.

[How To Manage Python Packages Using Pip][https://www.ostechnix.com/manage-python-packages-using-pip/]

Please note that you must install Python 3 version of pip.

Now, run the following command to install You-Get:
```
$ pip3 install you-get

```

You can upgrade You-Get to its latest version using command:
```
$ pip3 install --upgrade you-get

```

### Getting Started With You-Get

The usage is pretty much same as Youtube-dl utility.

**Download Videos**

To download a video, just run:
```
$ you-get https://www.youtube.com/watch?v=HXaglTFJLMc

```

Sample output:
```
site: YouTube
title: The Last of The Mohicans by Alexandro Querevalú
stream:
 - itag: 22
 container: mp4
 quality: hd720
 size: 56.9 MiB (59654303 bytes)
 # download-with: you-get --itag=22 [URL]

Downloading The Last of The Mohicans by Alexandro Querevalú.mp4 ...
 100% ( 56.9/ 56.9MB) ├███████████████████████████████████████████████████████┤[1/1] 752 kB/s

```

You may want to view the details of the video before downloading. You-Get can do that for using **“–info”** or **“-i”** flag. This option will get you all available quality and formats of the given video.
```
$ you-get -i https://www.youtube.com/watch?v=HXaglTFJLMc

```

Or,
```
$ you-get -info https://www.youtube.com/watch?v=HXaglTFJLMc

```

Sample output would be:
```
site: YouTube
title: The Last of The Mohicans by Alexandro Querevalú
streams: # Available quality and codecs
 [ DASH ] ____________________________________
 - itag: 137
 container: mp4
 quality: 1920x1080
 size: 101.9 MiB (106816582 bytes)
 # download-with: you-get --itag=137 [URL]

- itag: 248
 container: webm
 quality: 1920x1080
 size: 90.3 MiB (94640185 bytes)
 # download-with: you-get --itag=248 [URL]

- itag: 136
 container: mp4
 quality: 1280x720
 size: 56.9 MiB (59672392 bytes)
 # download-with: you-get --itag=136 [URL]

- itag: 247
 container: webm
 quality: 1280x720
 size: 52.6 MiB (55170859 bytes)
 # download-with: you-get --itag=247 [URL]

- itag: 135
 container: mp4
 quality: 854x480
 size: 32.2 MiB (33757856 bytes)
 # download-with: you-get --itag=135 [URL]

- itag: 244
 container: webm
 quality: 854x480
 size: 28.0 MiB (29369484 bytes)
 # download-with: you-get --itag=244 [URL]

[ DEFAULT ] _________________________________
 - itag: 22
 container: mp4
 quality: hd720
 size: 56.9 MiB (59654303 bytes)
 # download-with: you-get --itag=22 [URL]

```

By default, You-Get will download the format marked with **DEFAULT**. If you don’t like that format or quality, you can pick any other format you like. Use the itag value given in the each format.
```
$ you-get --itag=244 https://www.youtube.com/watch?v=HXaglTFJLMc

```

**Download Audios**

The following command will download an audio from soundcloud website.
```
$ you-get 'https://soundcloud.com/uiceheidd/all-girls-are-same-999-prod-nick-mira'
Site: SoundCloud.com
Title: ALL GIRLS ARE THE SAME (PROD. NICK MIRA)
Type: MP3 (audio/mpeg)
Size: 2.58 MiB (2710046 Bytes)

Downloading ALL GIRLS ARE THE SAME (PROD. NICK MIRA).mp3 ...
 100% ( 2.6/ 2.6MB) ├███████████████████████████████████████████████████████┤[1/1] 983 kB/s

```

To view the details of the audio file, use **-i** flag.
```
$ you-get -i 'https://soundcloud.com/uiceheidd/all-girls-are-same-999-prod-nick-mira'

```

**Download Images**

To download an image, run:
```
$ you-get https://pixabay.com/en/mountain-crumpled-cyanus-montanus-3393209/

```

You-Get can also download all images from a web page.
```
$ you-get https://www.ostechnix.com/pacvim-a-cli-game-to-learn-vim-commands/

```

**Search Videos**

You-Get doesn’t even a valid URL. You can just pass a random search terms. You-Get will google it and download the most relevant video based on your search string.
```
$ you-get 'Micheal Jackson'
Google Videos search:
Best matched result:
site: YouTube
title: Michael Jackson - Beat It (Official Video)
stream:
 - itag: 43
 container: webm
 quality: medium
 size: 29.4 MiB (30792050 bytes)
 # download-with: you-get --itag=43 [URL]

Downloading Michael Jackson - Beat It (Official Video).webm ...
 100% ( 29.4/ 29.4MB) ├███████████████████████████████████████████████████████┤[1/1] 2 MB/s

```

**Watch Videos**

You-Get can able to stream the online videos in your media player or browser, just without ads or comment section.

To watch videos in a media player, for example VLC, run the following command:
```
$ you-get -p vlc https://www.youtube.com/watch?v=HXaglTFJLMc

```

Or,
```
$ you-get --player vlc https://www.youtube.com/watch?v=HXaglTFJLMc

```

Similarly, to stream the videos in your browser, for example chromium, use:
```
$ you-get -p chromium https://www.youtube.com/watch?v=HXaglTFJLMc

```

![][3]

As you can see in the above screenshot, there is no ads, comment section. Just a plain page with the video.

**Set path and file name for downloaded videos**

By default, the videos will be downloaded in the current working directory with default video titles. You can, of course, change them as per your liking using **–output-dir/-o** flag to set the path and **–output-filename/-O** to set the name of the downloaded file.
```
$ you-get -o ~/Videos -O output.mp4 https://www.youtube.com/watch?v=HXaglTFJLMc

```

**Pause and resume downloads**

Press **CTRL+C** to cancel a download. A temporary **.download** file will be saved in the output directory. Next time you run you-get with the same arguments, the download process will resume from the last session.

In case the file is completely downloaded, the temporary .download extension will be gone, and you-get will just skip the download. To enforce re-downloading, use the **–force/-f** option.

For more details, refer the help section by running the following command.
```
$ you-get --help

```

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/you-get-a-cli-downloader-to-download-media-from-80-websites/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://you-get.org/#supported-sites
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/you-get.jpg
