zpl1025
MPV Player: A Minimalist Video Player for Linux
======
MPV is an open source, cross platform video player that comes with a minimalist GUI and feature rich command line version.

VLC is probably the best video player for Linux or any other operating system. I have been using VLC for years and it is still my favorite.

However, lately, I am more inclined towards minimalist applications with a clean UI. This is how came across MPV. I loved it so much that I added it in the list of [best Ubuntu applications][1].

[MPV][2] is an open source video player available for Linux, Windows, macOS, BSD and Android. It is actually a fork of [MPlayer][3].

The graphical user interface is sleek and minimalist.

![MPV Player Interface in Linux][4]
MPV Player

### MPV Features

MPV has all the features required from a standard video player. You can play a variety of videos and control the playback with usual shortcuts.

  * Minimalist GUI with only the necessary controls.
  * Video codecs support.
  * High quality video output and GPU video decoding.
  * Supports subtitles.
  * Can play YouTube and other streaming videos through the command line.
  * CLI version of MPV can be embedded in web and other applications.



Though MPV player has a minimal UI with limited options, don’t underestimate its capabilities. Its main power lies in the command line version.

Just type the command mpv –list-options and you’ll see that it provides 447 different kind of options. But this article is not about utilizing the advanced settings of MPV. Let’s see how good it is as a regular desktop video player.

### Installing MPV in Linux

MPV is a popular application and it should be found in the default repositories of most Linux distributions. Just look for it in the Software Center application.

I can confirm that it is available in Ubuntu’s Software Center. You can install it from there or simply use the following command:
```
sudo apt install mpv

```

You can find installation instructions for other platforms on [MPV website][5].

### Using MPV Video Player

Once installed, you can open a video file with MPV by right-clicking and choosing MPV.

![MPV Player Interface][6]
MPV Player Interface

The interface has only a control panel that is only visible when you hover your mouse on the player. As you can see, the control panel provides you the option to pause/play, change track, change audio track, subtitles and switch to full screen.

MPV’s default size depends upon the quality of video you are playing. For a 240p video, the application video will be small while as 1080p video will result in almost full screen app window size on a Full-HD screen. You can always double click on the player to make it full screen irrespective of the video size.

#### The subtitle struggle

If your video has a subtitle file, MPV will [automatically play subtitles][7] and you can choose to disable it. However, if you want to use an external subtitle file, it’s not that available directly from the player.

You can rename the additional subtitle file exactly the same as the name of the video file and keep it in the same folder as the video file. MPV should now play your subtitles.

An easier option to play external subtitles is to simply drag and drop into the player.

#### Playing YouTube and other online video content

To play online videos, you’ll have to use the command line version of MPV.

Open a terminal and use it in the following fashion:
```
mpv <URL_of_Video>

```

![Playing YouTube videos on Linux desktop using MPV][8]
Playing YouTube videos with MPV

I didn’t find playing YouTube videos in MPV player a pleasant experience. It kept on buffering and that was utter frustrating.

#### Should you use MPV player?

That depends on you. If you like to experiment with applications, you should give MPV a go. Otherwise, the default video player and VLC are always good enough.

Earlier when I wrote about [Sayonara][9], I wasn’t sure if people would like an obscure music player over the popular ones but it was loved by It’s FOSS readers.

Try MPV and see if it is something you would like to use as your default video player.

If you liked MPV but want slightly more features on the graphical interface, I suggest using [GNOME MPV Player][10].

Have you used MPV video player? How was your experience with it? What you liked or disliked about it? Do share your views in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/mpv-video-player/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/best-ubuntu-apps/
[2]:https://mpv.io/
[3]:http://www.mplayerhq.hu/design7/news.html
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/mpv-player.jpg
[5]:https://mpv.io/installation/
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/mpv-player-interface.png
[7]:https://itsfoss.com/how-to-play-movie-with-subtitles-on-samsung-tv-via-usb/
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/play-youtube-videos-on-mpv-player.jpeg
[9]:https://itsfoss.com/sayonara-music-player/
[10]:https://gnome-mpv.github.io/
