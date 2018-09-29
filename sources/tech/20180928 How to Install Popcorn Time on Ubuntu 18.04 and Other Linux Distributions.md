How to Install Popcorn Time on Ubuntu 18.04 and Other Linux Distributions
======
**Brief: This tutorial shows you how to install Popcorn Time on Ubuntu and other Linux distributions. Some handy Popcorn Time tips have also been discussed.**

[Popcorn Time][1] is an open source [Netflix][2] inspired [torrent][3] streaming application for Linux, Mac and Windows.

With the regular torrents, you have to wait for the download to finish before you could watch the videos.

[Popcorn Time][4] is different. It uses torrent underneath but allows you to start watching the videos (almost) immediately. It’s like you are watching videos on streaming websites like YouTube or Netflix. You don’t have to wait for the download to finish here.

![Popcorn Time in Ubuntu Linux][5]
Popcorn Time

If you want to watch movies online without those creepy ads, Popcorn Time is a good alternative. Keep in mind that the streaming quality depends on the number of available seeds.

Popcorn Time also provides a nice user interface where you can browse through available movies, tv-series and other contents. If you ever used [Netflix on Linux][6], you will find it’s somewhat a similar experience.

Using torrent to download movies is illegal in several countries where there are strict laws against piracy. In countries like the USA, UK and West European you may even get legal notices. That said, it’s up to you to decide if you want to use it or not. You have been warned.
(If you still want to take the risk and use Popcorn Time, you should use a VPN service like [Ivacy][7] that has been specifically designed for using Torrents and protecting your identity. Even then it’s not always easy to avoid the snooping authorities.)

Some of the main features of Popcorn Time are:

  * Watch movies and TV Series online using Torrent
  * A sleek user interface lets you browse the available movies and TV series
  * Change streaming quality
  * Bookmark content for watching later
  * Download content for offline viewing
  * Ability to enable subtitles by default, change the subtitles size etc
  * Keyboard shortcuts to navigate through Popcorn Time



### How to install Popcorn Time on Ubuntu and other Linux Distributions

I am using Ubuntu 18.04 in this tutorial but you can use the same instructions for other Linux distributions such as Linux Mint, Debian, Manjaro, Deepin etc.

Let’s see how to install Popcorn time on Linux. It’s really easy actually. Simply follow the instructions and copy paste the commands I have mentioned.

#### Step 1: Download Popcorn Time

You can download Popcorn Time from its official website. The download link is present on the homepage itself.

[Get Popcorn Time](https://popcorntime.sh/)

#### Step 2: Install Popcorn Time

Once you have downloaded Popcorn Time, it’s time to use it. The downloaded file is a tar file that consists of an executable among other files. While you can extract this tar file anywhere, the [Linux convention is to install additional software in][8] /[opt directory.][8]

Create a new directory in /opt:

```
sudo mkdir /opt/popcorntime
```

Now go to the Downloads directory.

```
cd ~/Downloads
```

Extract the downloaded Popcorn Time files into the newly created /opt/popcorntime directory.

```
sudo tar Jxf Popcorn-Time-* -C /opt/popcorntime
```

#### Step 3: Make Popcorn Time accessible for everyone

You would want every user on your system to be able to run Popcorn Time without sudo access, right? To do that, you need to create a [symbolic link][9] to the executable in /usr/bin directory.

```
ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time
```

#### Step 4: Create desktop launcher for Popcorn Time

So far so good. But you would also like to see Popcorn Time in the application menu, add it to your favorite application list etc.

For that, you need to create a desktop entry.

Open a terminal and create a new file named popcorntime.desktop in /usr/share/applications.

You can use any [command line based text editor][10]. Ubuntu has [Nano][11] installed by default so you can use that.

```
sudo nano /usr/share/applications/popcorntime.desktop
```

Insert the following lines here:

```
[Desktop Entry]
Version = 1.0
Type = Application
Terminal = false
Name = Popcorn Time
Exec = /usr/bin/Popcorn-Time
Icon = /opt/popcorntime/popcorn.png
Categories = Application;
```

If you used Nano editor, save it using shortcut Ctrl+X. When asked for saving, enter Y and then press enter again to save and exit.

We are almost there. One last thing to do here is to have the correct icon for Popcorn Time. For that, you can download a Popcorn Time icon and save it as popcorn.png in /opt/popcorntime directory.

You can do that using the command below:

```
sudo wget -O /opt/popcorntime/popcorn.png https://upload.wikimedia.org/wikipedia/commons/d/df/Pctlogo.png

```

That’s it. Now you can search for Popcorn Time and click on it to launch it.

![Popcorn Time installed on Ubuntu][12]
Search for Popcorn Time in Menu

On the first launch, you’ll have to accept the terms and conditions.

![Popcorn Time in Ubuntu Linux][13]
Accept the Terms of Service

Once you do that, you can enjoy the movies and TV shows.

![Watch movies on Popcorn Time][14]

Well, that’s all you needed to install Popcorn Time on Ubuntu or any other Linux distribution. You can start watching your favorite movies straightaway.

However, if you are interested, I would suggest reading these Popcorn Time tips to get more out of it.

[![][15]][16]
![][17]

### 7 Tips for using Popcorn Time effectively

Now that you have installed Popcorn Time, I am going to tell you some nifty Popcorn Time tricks. I assure you that it will enhance your experience with Popcorn Time multiple folds.

#### 1\. Use advanced settings

Always have the advanced settings enabled. It gives you more options to tweak Popcorn Time. Go to the top right corner and click on the gear symbol. Click on it and check advanced settings on the next screen.

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Popcorn_Time_Tricks.jpeg)

#### 2\. Watch the movies in VLC or other players

Did you know that you can choose to watch a file in your preferred media player instead of the default Popcorn Time player? Of course, that media player should have been installed in the system.

Now you may ask why would one want to use another player. And my answer is because other players like VLC has hidden features which you might not find in the Popcorn Time player.

For example, if a file has very low volume, you can use VLC to enhance the audio by 400 percent. You can also [synchronize incoherent subtitles with VLC][18]. You can switch between media players before you start to play a file:

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks_1.png)

#### 3\. Bookmark movies and watch it later

Just browsing through movies and TV series but don’t have time or mood to watch those? No issues. You can add the movies to the bookmark and can access these bookmarked videos from the Favorites tab. This enables you to create a list of movies you would watch later.

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks2.png)

#### 4\. Check torrent health and seed information

As I had mentioned earlier, your viewing experience in Popcorn Times depends on torrent speed. Good thing is that Popcorn time shows the health of the torrent file so that you can be aware of the streaming speed.

You will see a green/yellow/red dot on the file. Green means there are plenty of seeds and the file will stream easily. Yellow means a medium number of seeds, streaming should be okay. Red means there are very few seeds available and the streaming will be poor or won’t work at all.

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks3.jpg)

#### 5\. Add custom subtitles

If you need subtitles and it is not available in your preferred language, you can add custom subtitles downloaded from external websites. Get the .srt files and use it inside Popcorn Time:

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocporn_Time_Tricks5.png)

This is where VLC comes handy as you can [download subtitles automatically with VLC][19].


#### 6\. Save the files for offline viewing

When Popcorn Times stream a content, it downloads it and store temporarily. When you close the app, it’s cleaned out. You can change this behavior so that the downloaded file remains there for your future use.

In the advanced settings, scroll down a bit. Look for Cache directory. You can change this to some other directory like Downloads. This way, even if you close Popcorn Time, the file will be available for viewing.

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Popcorn_Time_Tips.jpg)

#### 7\. Drag and drop external torrent files to play immediately

I bet you did not know about this one. If you don’t find a certain movie on Popcorn Time, download the torrent file from your favorite torrent website. Open Popcorn Time and just drag and drop the torrent file in Popcorn Time. It will start playing the file, depending upon seeds. This way, you don’t need to download the entire file before watching it.

When you drag and drop the torrent file in Popcorn Time, it will give you the option to choose which video file should it play. If there are subtitles in it, it will play automatically or else, you can add external subtitles.

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2015/01/Pocorn_Time_Tricks4.png)

There are plenty of other features in Popcorn Time. But I’ll stop with my list here and let you explore Popcorn Time on Ubuntu Linux. I hope you find these Popcorn Time tips and tricks useful.

I am repeating again. Using Torrents is illegal in many countries. If you do that, take precaution and use a VPN service. If you are looking for my recommendation, you can go for [Swiss-based privacy company ProtonVPN][20] (of [ProtonMail][21] fame). Singapore based [Ivacy][7] is another good option. If you think these are expensive, you can look for [cheap VPN deals on It’s FOSS Shop][22].

Note: This article contains affiliate links. Please read our [affiliate policy][23].

--------------------------------------------------------------------------------

via: https://itsfoss.com/popcorn-time-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://popcorntime.sh/
[2]: https://netflix.com/
[3]: https://en.wikipedia.org/wiki/Torrent_file
[4]: https://en.wikipedia.org/wiki/Popcorn_Time
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-linux.jpeg
[6]: https://itsfoss.com/netflix-firefox-linux/
[7]: https://billing.ivacy.com/page/23628
[8]: http://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[9]: https://en.wikipedia.org/wiki/Symbolic_link
[10]: https://itsfoss.com/command-line-text-editors-linux/
[11]: https://itsfoss.com/nano-3-release/
[12]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-ubuntu-menu.jpg
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-ubuntu-license.jpeg
[14]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/popcorn-time-watch-movies.jpeg
[15]: https://ivacy.postaffiliatepro.com/accounts/default1/vdegzkxbw/7f82d531.png
[16]: https://billing.ivacy.com/page/23628/7f82d531
[17]: http://ivacy.postaffiliatepro.com/scripts/vdegzkxiw?aff=23628&a_bid=7f82d531
[18]: https://itsfoss.com/how-to-synchronize-subtitles-with-movie-quick-tip/
[19]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/
[20]: https://protonvpn.net/?aid=chmod777
[21]: https://itsfoss.com/protonmail/
[22]: https://shop.itsfoss.com/search?utf8=%E2%9C%93&query=vpn
[23]: https://itsfoss.com/affiliate-policy/
