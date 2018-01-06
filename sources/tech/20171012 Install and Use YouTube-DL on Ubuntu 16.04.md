translating by lujun9972
Install and Use YouTube-DL on Ubuntu 16.04
======

Youtube-dl is a free and open source command line video download tools that can be used to download video from Youtube and other websites like, Facebook, Dailymotion, Google Video, Yahoo and much more. It is based on pygtk and requires Python to run this software. It supports many operating system including, Windows, Mac and Unix. Youtube-dl supports resuming interrupted downloads, channel or playlist download, add custom title, proxy and much more.

In this tutorial, we will learn how to install and use Youtube-dl and Youtube-dlg on Ubuntu 16.04. We will also learn how to download Youtube video in different quality and formats.

### Requirements

  * A server running Ubuntu 16.04.
  * A non-root user with sudo privileges setup on your server.



Let's start by updating your system to the latest version with the following command:

```
sudo apt-get update -y
sudo apt-get upgrade -y
```

After updating, restart the system to apply all these changes.

### Install Youtube-dl

By default, Youtube-dl is not available in the Ubuntu-16.04 repository. So you will need to download it from their official website. You can download it with the curl command:

First, install curl with the following command:

sudo apt-get install curl -y

Next, download the youtube-dl binary:

curl -L https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl

Next, change the permission of the youtube-dl binary package with the following command:

sudo chmod 755 /usr/bin/youtube-dl

Once youtube-dl is installed, you can proceed to the next step.

### Use Youtube-dl

You can list all the available options with youtube-dl, run the following command:

youtube-dl --h

Youtube-dl supports many Video formats such as Mp4, WebM, 3gp, and FLV. You can list all the available formats for specific Video with the following command:

youtube-dl -F https://www.youtube.com/watch?v=j_JgXJ-apXs

You should see the all the available formats for this video as below:
```
[info] Available formats for j_JgXJ-apXs:
format code extension resolution note
139 m4a audio only DASH audio 56k , m4a_dash container, [[email protected]][1] 48k (22050Hz), 756.44KiB
249 webm audio only DASH audio 56k , opus @ 50k, 724.28KiB
250 webm audio only DASH audio 69k , opus @ 70k, 902.75KiB
171 webm audio only DASH audio 110k , [[email protected]][1], 1.32MiB
251 webm audio only DASH audio 122k , opus @160k, 1.57MiB
140 m4a audio only DASH audio 146k , m4a_dash container, [[email protected]][1] (44100Hz), 1.97MiB
278 webm 256x144 144p 97k , webm container, vp9, 24fps, video only, 1.33MiB
160 mp4 256x144 DASH video 102k , avc1.4d400c, 24fps, video only, 731.53KiB
133 mp4 426x240 DASH video 174k , avc1.4d4015, 24fps, video only, 1.36MiB
242 webm 426x240 240p 221k , vp9, 24fps, video only, 1.74MiB
134 mp4 640x360 DASH video 369k , avc1.4d401e, 24fps, video only, 2.90MiB
243 webm 640x360 360p 500k , vp9, 24fps, video only, 4.15MiB
135 mp4 854x480 DASH video 746k , avc1.4d401e, 24fps, video only, 6.11MiB
244 webm 854x480 480p 844k , vp9, 24fps, video only, 7.27MiB
247 webm 1280x720 720p 1155k , vp9, 24fps, video only, 9.21MiB
136 mp4 1280x720 DASH video 1300k , avc1.4d401f, 24fps, video only, 9.66MiB
248 webm 1920x1080 1080p 1732k , vp9, 24fps, video only, 14.24MiB
137 mp4 1920x1080 DASH video 2217k , avc1.640028, 24fps, video only, 15.28MiB
17 3gp 176x144 small , mp4v.20.3, [[email protected]][1] 24k
36 3gp 320x180 small , mp4v.20.3, mp4a.40.2
43 webm 640x360 medium , vp8.0, [[email protected]][1]
18 mp4 640x360 medium , avc1.42001E, [[email protected]][1] 96k
22 mp4 1280x720 hd720 , avc1.64001F, [[email protected]][1] (best)

```

Next, choose any format you want to download with the flag -f as shown below:

youtube-dl -f 18 https://www.youtube.com/watch?v=j_JgXJ-apXs

This command will download the Video in mp4 format at 640x360 resolution:
```
[youtube] j_JgXJ-apXs: Downloading webpage
[youtube] j_JgXJ-apXs: Downloading video info webpage
[youtube] j_JgXJ-apXs: Extracting video information
[youtube] j_JgXJ-apXs: Downloading MPD manifest
[download] Destination: B.A. PASS 2 Trailer no 2 _ Filmybox-j_JgXJ-apXs.mp4
[download] 100% of 6.90MiB in 00:47

```

If you want to download Youtube video in mp3 audio format, then it is also possible with the following command:

youtube-dl https://www.youtube.com/watch?v=j_JgXJ-apXs -x --audio-format mp3

You can download all the videos of specific channels by appending the channel's URL as shown below:

youtube-dl -citw https://www.youtube.com/channel/UCatfiM69M9ZnNhOzy0jZ41A

If your network is behind the proxy, then you can download the video using --proxy flag as shown below:

youtube-dl --proxy http://proxy-ip:port https://www.youtube.com/watch?v=j_JgXJ-apXs

To download the list of many Youtube videos with the single command, then first save all the Youtube video URL in a file called youtube-list.txt and run the following command to download all the videos:

youtube-dl -a youtube-list.txt

### Install Youtube-dl GUI

If you are looking for a graphical tool for youtube-dl, then youtube-dlg is the best choice for you. youtube-dlg is a free and open source tool for youtube-dl written in wxPython.

By default, this tool is not available in Ubuntu 16.04 repository. So you will need to add PPA for that.

sudo add-apt-repository ppa:nilarimogard/webupd8

Next, update your package repository and install youtube-dlg with the following command:

sudo apt-get update -y
sudo apt-get install youtube-dlg -y

Once Youtube-dl is installed, you can launch it from Unity Dash as shown below:

[![][2]][3]

[![][4]][5]

You can now easily download any Youtube video as you wish just paste their URL in the URL field shown in the above image. Youtube-dlg is very useful for those people who don't know command line.

### Conclusion

Congratulations! You have successfully installed youtube-dl and youtube-dlg on Ubuntu 16.04 server. You can now easily download any videos from Youtube and any youtube-dl supported sites in any formats and any size.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/install-and-use-youtube-dl-on-ubuntu-1604/

作者：[Hitesh Jethva][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:/cdn-cgi/l/email-protection
[2]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/Screenshot-of-youtube-dl-dash.png
[3]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/big/Screenshot-of-youtube-dl-dash.png
[4]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/Screenshot-of-youtube-dl-dashboard.png
[5]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/big/Screenshot-of-youtube-dl-dashboard.png
