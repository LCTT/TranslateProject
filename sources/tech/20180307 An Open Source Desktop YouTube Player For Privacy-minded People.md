An Open Source Desktop YouTube Player For Privacy-minded People
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Freetube-720x340.png)

You already know that we need a Google account to subscribe channels and download videos from YouTube. If you don’t want Google track what you’re doing on YouTube, well, there is an open source YouTube player named **“FreeTube”**. It allows you to watch, search and download Youtube videos and subscribe your favorite channels without an account, which prevents Google from having your information. It gives you complete ad-free experience. Another notable advantage is it has a built-in basic HTML5 player to watch videos. Since we’re not using the built-in YouTube player, Google can’t track the “views” and the video analytics either. FreeTube only sends your IP details, but this also can be overcome by using a VPN. It is completely free, open source and available for GNU/Linux, Mac OS X, and Windows.

### Features

* Watch videos without ads.
* Prevent Google from tracking what you watch using cookies or JavaScript.
* Subscribe to channels without an account.
* Store subscriptions, history, and saved videos locally.
* Import / Backup subscriptions.
* Mini Player.
* Light / Dark Theme.
* Free, Open Source.
* Cross-platform.



### Installing FreeTube

Go to the [**releases page**][1] and grab the version depending upon the OS you use. For the purpose of this guide, I will be using **.tar.gz** file.
```
$ wget https://github.com/FreeTubeApp/FreeTube/releases/download/v0.1.3-beta/FreeTube-linux-x64.tar.xz

```

Extract the downloaded archive:
```
$ tar xf FreeTube-linux-x64.tar.xz

```

Go to the Freetube folder:
```
$ cd FreeTube-linux-x64/

```

Launch Freeube using command:
```
$ ./FreeTub

```

This is how FreeTube default interface looks like.

![][3]

### Usage

FreeTube currently uses **YouTube API** to search for videos. And then, It uses **Youtube-dl HTTP API** to grab the raw video files and play them in a basic HTML5 video player. Since subscriptions, history, and saved videos are stored locally on your system, your details will not be sent to Google or anyone else.

Enter the video name in the search box and hit ENTER key. FreeTube will list out the results based on your search query.

![][4]

You can click on any video to play it.

![][5]

If you want to change the theme or default API, import/export subscriptions, go to the **Settings** section.

![][6]

Please note that FreeTube is still in **beta** stage, so there will be bugs. If there are any bugs, please report them in the GitHub page given at the end of this guide.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/freetube-an-open-source-desktop-youtube-player-for-privacy-minded-people/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/FreeTubeApp/FreeTube/releases
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-3.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-5-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-2.png
