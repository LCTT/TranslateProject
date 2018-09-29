translating by Flowsnow

A Simple, Beautiful And Cross-platform Podcast App
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/cpod-720x340.png)

Podcasts have become very popular in the last few years. Podcasts are what’s called “infotainment”, they are generally light-hearted, but they generally give you valuable information. Podcasts have blown up in the last few years, and if you like something, chances are there is a podcast about it. There are a lot of podcast players out there for the Linux desktop, but if you want something that is visually beautiful, has slick animations, and works on every platform, there aren’t a lot of alternatives to **CPod**. CPod (formerly known as **Cumulonimbus** ) is an open source and slickest podcast app that works on Linux, MacOS and Windows.

CPod runs on something called **Electron** – a tool that allows developers to build cross-platform (E.g Windows, MacOs and Linux) desktop GUI applications. In this brief guide, we will be discussing – how to install and use CPod podcast app in Linux.

### Installing CPod

Go to the [**releases page**][1] of CPod. Download and Install the binary for your platform of choice. If you use Ubuntu/Debian, you can just download and install the .deb file from the releases page as shown below.

```
$ wget https://github.com/z-------------/CPod/releases/download/v1.25.7/CPod_1.25.7_amd64.deb

$ sudo apt update

$ sudo apt install gdebi

$ sudo gdebi CPod_1.25.7_amd64.deb
```

If you use any other distribution, you probably should use the **AppImage** in the releases page.

Download the AppImage file from the releases page.

Open your terminal, and go to the directory where the AppImage file has been stored. Change the permissions to allow execution:

```
$ chmod +x CPod-1.25.7-x86_64.AppImage
```

Execute the AppImage File:

```
$ ./CPod-1.25.7-x86_64.AppImage
```

You’ll be presented a dialog asking whether to integrate the app with the system. Click **Yes** if you want to do so.

### Features

**Explore Tab**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPod-features-tab.png)

CPod uses the Apple iTunes database to find podcasts. This is good, because the iTunes database is the biggest one out there. If there is a podcast out there, chances are it’s on iTunes. To find podcasts, just use the top search bar in the Explore section. The Explore Section also shows a few popular podcasts.

**Home Tab**

![](http://www.ostechnix.com/wp-content/uploads/2018/09/CPod-home-tab.png)

The Home Tab is the tab that opens by default when you open the app. The Home Tab shows a chronological list of all the episodes of all the podcasts that you have subscribed to.

From the home tab, you can:

  1. Mark episodes read.
  2. Download them for offline playing
  3. Add them to the queue.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/The-podcasts-queue.png)

**Subscriptions Tab**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPod-subscriptions-tab.png)

You can of course, subscribe to podcasts that you like. A few other things you can do in the Subscriptions Tab is:

  1. Refresh Podcast Artwork
  2. Export and Import Subscriptions to/from an .OPML file.



**The Player**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPod-Podcast-Player.png)

The player is perhaps the most beautiful part of CPod. The app changes the overall look and feel according to the banner of the podcast. There’s a sound visualiser at the bottom. To the right, you can see and search for other episodes of this podcast.

**Cons/Missing Features**

While I love this app, there are a few features and disadvantages that CPod does have:

  1. Poor MPRIS Integration – You can play/pause the podcast from the media player dialog of your desktop environment, but not much more. The name of the podcast is not shown, and you can go to the next/previous episode.
  2. No support for chapters.
  3. No auto-downloading – you have to manually download episodes.
  4. CPU usage during use is pretty high (even for an Electron app).



### Verdict

While it does have its cons, CPod is clearly the most aesthetically pleasing podcast player app out there, and it has most basic features down. If you love using visually beautiful apps, and don’t need the advanced features, this is the perfect app for you. I know for a fact that I’m going to use it.

Do you like CPod? Please put your opinions on the comments below!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cpod-a-simple-beautiful-and-cross-platform-podcast-app/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://github.com/z-------------/CPod/releases
